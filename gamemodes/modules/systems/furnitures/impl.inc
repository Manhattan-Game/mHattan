#include <YSI_Coding\y_hooks>




hook OnPlayerConnect(playerid){
	editFurnitureID[playerid] = -1;
	editFurnitureID[playerid] = -1;
}
hook OnPlayerDisconnect(playerid, reason){
	saveFurnitures();
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
            furnituresData[index][vw_furniture] = GetPlayerVirtualWorld(playerid);
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
	else if(dialogid == DIALOG_SELECT_MARKET_FURNITURES){
        if(response){
            new array[sizeof(furnituresModelData)];
            array = getModelsByType(listitem);
            for(new i;i<sizeof(furnituresModelData);i++){
                if(array[i] != -1){
                    addDialogItem(playerid, furnituresModelData[array[i]][model], furnituresModelData[array[i]][name]);
                }
            }
            ShowPlayerDialogItem(playerid, DIALOG_ITEMS_SELECT_FURNITURE, "Muebles", "Seleccionar");
        }
    }
}
hook OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){
	if(response){
		if(dialogid == DIALOG_ITEMS_FURNITURES){
			if(getCountDialogItems(playerid) > 0){
				printf("index %i", index);
				editFurnitureID[playerid] = index;
            	ShowPlayerDialog(playerid, DIALOG_EDIT_FURNITURE, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" FURNITURES", "Mostrar/ocultar\nEditar posicion\nVender", "Continuar", ""RED" cancelar");
			} else ShowTDN_OOC(playerid, "No tienes muebles");
			
		}
	} else editFurnitureID[playerid] = -1;
}

cmd:dormir(playerid, params[]){
	useFurniture(playerid);
	return 1;
}