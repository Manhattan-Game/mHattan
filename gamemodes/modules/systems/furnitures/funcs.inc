getModelsByType(typee){
    new array[sizeof(furnituresModelData)];
    for(new i;i<sizeof(furnituresModelData); i++){
        if(furnituresModelData[i][type] == typee) {
            array[i] = i;
        }else array[i] = -1;
    }
    return array;
}

SelectFurnituresByType(playerid, dialogid){
    ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" FURNITURES", "Camas\nMesas\nMesadas\nCocina\nSillas\nSofa\nBaño\nAleatorio\nObjetos pequeños\nDecoracion\nElectronica", "Continuar", ""RED" cancelar");
}

ShowFurnitures(playerid, comparationid, typee){
	if(comparationid != -1){
		new furnitures[MAX_FURNITURES];
		furnitures = getFurnituresById(comparationid, typee); 
		new indexModel;
		for(new i, e;i<MAX_FURNITURES;i++){
			if(furnitures[i] != -1){
				indexModel = furnituresData[furnitures[i]][model];
				INDEX_REAL_FURNITURE[playerid][e] = furnitures[i];
				e++;
				addDialogItem(playerid, furnituresModelData[indexModel][model], furnituresModelData[indexModel][name]);
			}
		}
		ShowPlayerDialogItem(playerid, DIALOG_ITEMS_FURNITURES, "Muebles", "Editar");
	}
}

createFurniture(modell, typee, toid){
    if((modell != -1) && (toid != -1)){
    	new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO furnitures(toId, model, type) VALUES ('%d', '%d', '%d')", toid, modell, typee); 
        mysql_pquery(MYSQL_DB, query, "onCreateFurniture", "ddd", modell, typee, toid);
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
useFurniture(playerid){
	if(characterData[playerid][p_spawn]){
		new indexModel = -1;
		for(new index;index<MAX_FURNITURES;index++){
			if(IsPlayerInRangeOfPoint(playerid, 3.0, furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2]) && (furnituresData[index][vw_furniture] == GetPlayerVirtualWorld(playerid))){
				indexModel = furnituresData[index][model];
				if(indexModel != -1){
					switch(furnituresModelData[indexModel][type]){
						case FURNITURE_TYPE_BED: furnitureSleep(playerid, furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2]);
						case FURNITURE_TYPE_CHAIRS: furnitureSeat(playerid);

					}
					if(furnituresModelData[indexModel][type] == FURNITURE_TYPE_BED){
						furnitureSleep(playerid, furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2]);
						break;
					}
				}
				break;	
			}
		}
	}
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
		furnituresData[index][object] = CreateDynamicObject(furnituresModelData[indexModel][model], furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2], furnituresData[index][coords][3], furnituresData[index][coords][4], furnituresData[index][coords][5], furnituresData[index][vw_furniture]);
		furnituresData[index][placed] = FURNITURE_TYPE_PLACED;
		if(furnituresModelData[indexModel][type] == FURNITURE_TYPE_BED){
			furnituresData[index][label] = CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/dormir"GREY"", 0xFFFFFFFF, furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2], 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, furnituresData[index][vw_furniture]);
		} else if(furnituresModelData[indexModel][type] == FURNITURE_TYPE_CHAIRS){
			furnituresData[index][label] = CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/sentarse"GREY"", 0xFFFFFFFF, furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2], 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, furnituresData[index][vw_furniture]);
		}
	}
}
getFurnituresById(idd, typee){
    new array[sizeof(furnituresData)];
    for(new i;i<sizeof(furnituresData); i++){
        if(furnituresData[i][toId] == idd && furnituresData[i][type_furniture] == typee){
        	array[i] = i;
        } else array[i] = -1;
    }
    return array;
}


saveFurnitures(){
    new query[QUERY_LONG];
    for(new i; i<MAX_FURNITURES;i++){
        if(furnituresData[i][listid] > 0){
            mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE furnitures SET `toId`='%d', `model`='%d', `type`='%d', `vw`='%d', `coords1`='%s', `coords2`='%d', `coords3`='%d', `coords4`='%d', `coords5`='%d', `coords6`='%d', `placed`='%d', `item1`='%d', `item2`='%d', `item3`='%d', `itemAmmount1`='%d', `itemAmmount2`='%d', `itemAmmount3`='%d' WHERE listid = '%d' LIMIT 1",
            furnituresData[i][toId],
            furnituresData[i][model],
            furnituresData[i][type_furniture],
            furnituresData[i][vw_furniture],
            furnituresData[i][coords][0],
            furnituresData[i][coords][1],
            furnituresData[i][coords][2],
            furnituresData[i][coords][3],
            furnituresData[i][coords][4],
            furnituresData[i][coords][5],
            furnituresData[i][placed],
            furnituresData[i][item][0],
            furnituresData[i][item][1],
            furnituresData[i][item][2],
            furnituresData[i][itemAmmount][0],
            furnituresData[i][itemAmmount][1],
            furnituresData[i][itemAmmount][2],
            furnituresData[i][listid]);
            mysql_query(MYSQL_DB, query);
        }
    }
}

forward loadFurnitures();
public loadFurnitures(){
    if(cache_num_rows()){
        for(new i;i<cache_num_rows();i++){ 
            cache_get_value_name_int(i, "listid", furnituresData[i][listid]);
	       	cache_get_value_name_int(i, "toId", furnituresData[i][toId]);
	        cache_get_value_name_int(i, "model", furnituresData[i][model]);
	        cache_get_value_name_int(i, "type", furnituresData[i][type_furniture]);
	        cache_get_value_name_int(i, "vw", furnituresData[i][vw_furniture]);
	        cache_get_value_name_float(i, "coords1", furnituresData[i][coords][0]);
	        cache_get_value_name_float(i, "coords2", furnituresData[i][coords][1]);
	        cache_get_value_name_float(i, "coords3", furnituresData[i][coords][2]);
	        cache_get_value_name_float(i, "coords4", furnituresData[i][coords][3]);
	        cache_get_value_name_float(i, "coords5", furnituresData[i][coords][4]);
	        cache_get_value_name_float(i, "coords6", furnituresData[i][coords][5]);
	        cache_get_value_name_int(i, "placed", furnituresData[i][placed]);

	        cache_get_value_name_int(i, "item1", furnituresData[i][item][0]);
	        cache_get_value_name_int(i, "item2", furnituresData[i][item][1]);
	        cache_get_value_name_int(i, "item3", furnituresData[i][item][2]);

	        cache_get_value_name_int(i, "itemAmmount1", furnituresData[i][item][0]);
	        cache_get_value_name_int(i, "itemAmmount2", furnituresData[i][item][1]);
	        cache_get_value_name_int(i, "itemAmmount3", furnituresData[i][item][2]);
	            
			loadFurniture(i);
        }
    }
}

forward onCreateFurniture(modell, typee, toid);
public onCreateFurniture(modell, typee, toid){
	new index = getFurnitureFreeSlot();
	if(index != -1){
		furnituresData[index][listid] = cache_insert_id();
		furnituresData[index][model] = modell;
		furnituresData[index][type_furniture] = typee;
		furnituresData[index][toId] = toid;
		loadFurniture(index);
	}
}


getFurnitureFreeSlot(){
	for(new i;i<MAX_FURNITURES;i++){
		if(furnituresData[i][listid] == 0) return i;
	}
	return -1;
}




furnitureSleep(playerid, Float:xx, Float:yy, Float:zz){
	SetPlayerPos(playerid, xx, yy, zz+0.5);
	new Float:angl;
	GetPlayerFacingAngle(playerid, angl);
	SetPlayerFacingAngle(playerid, angl-90.0);
	ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R",4.0, 1, 0, 0, 0, 0);
}

furnitureSeat(playerid){
	new Float:angl;
	GetPlayerFacingAngle(playerid, angl);
	SetPlayerFacingAngle(playerid, angl+180.0);
	ApplyAnimation(playerid,"ped","SEAT_down",4.0, 0, 0, 0, 0, 0);
}