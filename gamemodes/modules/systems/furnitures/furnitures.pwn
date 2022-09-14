#include <YSI_Coding\y_hooks>

#define FURNITURE_TYPE_ONPLACED 0
#define FURNITURE_TYPE_PLACED 1


enum furnituresDa@tes{
	listid,
	toId,
	vw,
	model,
	Float:coords[6],
	placed,
	object,
	Text3D:label
};
new furnituresData[MAX_FURNITURES][furnituresDa@tes];

new editFurnitureID[MAX_PLAYERS];
new INDEX_REAL_FURNITURE[MAX_PLAYERS][MAX_FURNITURES];


hook OnPlayerConnect(playerid){
	/*editFurnitureID[playerid] = -1;
	editFurnitureID[playerid] = -1;
	furnituresData[0][toId] = 1;
	furnituresData[0][model] = 229;
	furnituresData[1][toId] = 1;
	furnituresData[1][model] = 230;

	furnituresData[2][model] = 29;
	furnituresData[2][toId] = 1;

	furnituresData[3][model] = 2;
	furnituresData[3][toId] = 1;*/

}
hook OP_EditDynamicObject(playerid, objectid, response, Float:xx, Float:yy, Float:zz, Float:rx, Float:ry, Float:rz){
    if(response == EDIT_RESPONSE_FINAL){
        new index = INDEX_REAL_FURNITURE[playerid][editFurnitureID[playerid]];
        printf("edit %i", index);
        if(index != -1){
            ShowTDN_OOC(playerid, "Editaste el mueble.");
            furnituresData[index][coords][0] = xx;
            furnituresData[index][coords][1] = yy;
            furnituresData[index][coords][2] = zz;
            furnituresData[index][coords][3] = rx;
            furnituresData[index][coords][4] = ry;
            furnituresData[index][coords][5] = rz;
            furnituresData[index][vw] = GetPlayerVirtualWorld(playerid);
            loadFurniture(index);
            editFurnitureID[playerid] = -1;

        }
    }
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	if(dialogid == DIALOG_EDIT_FURNITURE){
		if(editFurnitureID[playerid] != -1){
			new index = INDEX_REAL_FURNITURE[playerid][editFurnitureID[playerid]];
			printf("dialog %i", index);
			if(response){
				switch(listitem){
					case 0:{
						if(furnituresData[index][placed] == FURNITURE_TYPE_PLACED){
							unplaceFurniture(index);
							ShowTDN_OOC(playerid, "Ocultaste el mueble");
						}else {
							placeFurniture(index);
							ShowTDN_OOC(playerid, "Colocaste el mueble");
						}
						editFurnitureID[playerid] = -1;
					}
					case 1: {
						editFurniture(playerid, index);
						clearDialogItem(playerid);
					}
					case 2: ShowTDN_OOC(playerid, "Hacerme acordar");
				}
			}else editFurnitureID[playerid] = -1;
		}
	}
}
hook OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){
	if(response){
		if(dialogid == DIALOG_ITEMS_FURNITURES){
			if(getCountDialogItems(playerid) > 0){
				printf("%i", index);
				editFurnitureID[playerid] = index-1;
            	ShowPlayerDialog(playerid, DIALOG_EDIT_FURNITURE, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" FURNITURES", "Mostrar/ocultar\nEditar posicion\nVender", "Continuar", ""RED" cancelar");
			} else ShowTDN_OOC(playerid, "No tienes muebles");
			
		}
	} else editFurnitureID[playerid] = -1;
}
ShowFurnitures(playerid, comparationid){
	if(comparationid != -1){
		new furnitures[MAX_FURNITURES];
		furnitures = getFurnituresById(comparationid); 
		new indexModel;
		for(new i;i<MAX_FURNITURES;i++){
			if(furnitures[i] != -1){
				indexModel = furnituresData[furnitures[i]][model];
				INDEX_REAL_FURNITURE[playerid][i] = furnitures[i];
				addDialogItem(playerid, furnituresModelData[indexModel][model], furnituresModelData[indexModel][name]);
			}
		}
		ShowPlayerDialogItem(playerid, DIALOG_ITEMS_FURNITURES, "Muebles", "Editar");
	}
}

loadFurniture(index){
	if(furnituresData[index][placed] == FURNITURE_TYPE_PLACED){
		unplaceFurniture(index);
		placeFurniture(index);
	}
}

editFurniture(playerid, index){
    if(furnituresData[index][placed] == FURNITURE_TYPE_PLACED){
    	new Float:posXEdit, Float:posYEdit, Float:posZEdit;
        GetPlayerPos(playerid, posXEdit, posYEdit, posZEdit);
        new indexModel = furnituresData[index][model];
    	furnituresData[index][object] = CreateDynamicObject(furnituresModelData[indexModel][model], posXEdit, posYEdit, posZEdit-1.0, 1.0, 1.0, 1.0, GetPlayerVirtualWorld(playerid));
    	EditDynamicObject(playerid, furnituresData[index][object]);
    	ShowTDN_OOC(playerid, "Edita el mueble");

    } else ShowTDN_OOC(playerid, "El mueble no esta colocado");
    
}

unplaceFurniture(index){
	if(furnituresData[index][placed] == FURNITURE_TYPE_PLACED){
		new indexModel = furnituresData[index][model];
		DestroyDynamicObject(furnituresData[index][object]);
		furnituresData[index][placed] = FURNITURE_TYPE_ONPLACED;
		printf("onplace %i", index);
		if(furnituresModelData[indexModel][type] == FURNITURE_TYPE_BED){
			DestroyDynamic3DTextLabel(furnituresData[index][label]);
		}
	}
}
placeFurniture(index){
	if(furnituresData[index][placed] == FURNITURE_TYPE_ONPLACED){
		new indexModel = furnituresData[index][model];
		furnituresData[index][object] = CreateDynamicObject(furnituresModelData[indexModel][model], furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2], furnituresData[index][coords][3], furnituresData[index][coords][4], furnituresData[index][coords][5], furnituresData[index][vw]);
		furnituresData[index][placed] = FURNITURE_TYPE_PLACED;
		if(furnituresModelData[indexModel][type] == FURNITURE_TYPE_BED){
			furnituresData[index][label] = CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/dormir"GREY"", 0xFFFFFFFF, furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2], 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, furnituresData[index][vw]);
		}
		printf("place %i", index);
	}
}
getFurnituresById(idd){
    new array[sizeof(furnituresData)];
    for(new i;i<sizeof(furnituresData); i++){
        if(furnituresData[i][toId] == idd){
        	array[i] = i;
        } else array[i] = -1;
    }
    return array;
}