#include <YSI_Coding\y_hooks>

#define HOUSE_STATE_ON_SALE 0
#define HOUSE_STATE_PURCHASE 1
#define HOUSE_STATE_RENT 2

showMenuHouses(playerid){
	new stringfinal[QUERY_LONG];
	for(new i;i<sizeof(houseModelsData);i++){
		strcat(houseModelsData[i][class], "\n");
		strcat(stringfinal, houseModelsData[i][class]);
	}
	ShowPlayerDialog(playerid, DIALOG_EDIT_DOOR_EXIT_HOUSES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" Doors", stringfinal, "Continuar", ""RED" cancelar");
}

enum hous@dat@s{
	listid,
	characterid,
	doorid,
	price,
	direction[40],
	garajedoorid,
	type,
	interior,
	level,
	virtualworld,
	statee,
	safe,

	Text3D:label,
	pickup,
	bool:loaded
};

new houseData[MAX_HOUSES][hous@dat@s];
new editHouse[MAX_PLAYERS];

hook OnGameModeExit(){
	saveHouses();
}
hook OnPlayerDisconnect(playerid, reason){
	saveHouses();
}
hook OnPlayerConnect(playerid){
	editHouse[playerid] = -1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_EDIT_HOUSE: {
			if(response){
				switch(listitem){
					case 0: ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index(Puerta)", "Continuar", ""RED" cancelar");
					case 1: ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_GARAJEID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index(Puerta Garaje)", "Continuar", ""RED" cancelar");
					case 2: ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_DIRECTION, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa una direccion", "Continuar", ""RED" cancelar");
					case 3: ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_PRICE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un precio", "Continuar", ""RED" cancelar");
					case 4: ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_LEVEL, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un nivel", "Continuar", ""RED" cancelar");
				}
			}else editHouse[playerid] = -1;
		}

		case DIALOG_EDIT_HOUSE_DOORID: {
			if(response){
				if(_@IsNumeric(inputtext)){
					new indexdoor = strval(inputtext);
					new index = editHouse[playerid];
					if(indexdoor >= 0 && indexdoor < MAX_DOORS){
						if(doorsInfo[indexdoor][listid] > 0){
							houseData[index][doorid] = doorsInfo[indexdoor][listid];
							if(houseData[index][characterid] > 0){
								doorsInfo[indexdoor][characterID] = houseData[index][characterid];
							}
							DestroyDynamicHouse(index);
							loadHouse(index, indexdoor);
							ShowTDN_OOC(playerid, "Editaste el ID puerta con el que interactua la casa");
							editHouse[playerid] = -1;
						}else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index valido", "Continuar", ""RED" cancelar");
					}else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index valido", "Continuar", ""RED" cancelar");
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index valido", "Continuar", ""RED" cancelar");
			} else editHouse[playerid] = -1;
		}
		case DIALOG_EDIT_HOUSE_GARAJEID: {
			if(response){
				if(_@IsNumeric(inputtext)){
					new indexdoor = strval(inputtext);
					new index = editHouse[playerid];
					if(indexdoor >= 0 && indexdoor < MAX_DOORS){
						if(doorsInfo[indexdoor][listid] > 0){
							houseData[index][garajedoorid] = doorsInfo[indexdoor][listid];
							if(houseData[index][characterid] > 0){
								doorsInfo[indexdoor][characterID] = houseData[index][characterid];
							}
							ShowTDN_OOC(playerid, "Editaste el ID puerta garaje con el que interactua la casa");
							editHouse[playerid] = -1;
						}else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_GARAJEID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index valido", "Continuar", ""RED" cancelar");
					}else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_GARAJEID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index valido", "Continuar", ""RED" cancelar");
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_GARAJEID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un index valido", "Continuar", ""RED" cancelar");
			} else editHouse[playerid] = -1;
		}
		case DIALOG_EDIT_HOUSE_DIRECTION: {
			if(response){
				new index = editHouse[playerid];
				new indexdoor = getIndexDoorByID(houseData[index][doorid]);
				format(houseData[index][direction], 40, "%s", inputtext);
				DestroyDynamicHouse(index);
				loadHouse(index, indexdoor);
				ShowTDN_OOC(playerid, "Editaste la direccion");
				editHouse[playerid] = -1;
			} else editHouse[playerid] = -1;
		}
		case DIALOG_EDIT_HOUSE_PRICE: {
			if(response){
				if(IsNumeric(inputtext)){
					new index = editHouse[playerid];
					new indexdoor = getIndexDoorByID(houseData[index][doorid]);
					houseData[index][price] = strval(inputtext);
					DestroyDynamicHouse(index);
					loadHouse(index, indexdoor);
					ShowTDN_OOC(playerid, "Editaste el precio");
					editHouse[playerid] = -1;
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_PRICE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un precio(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editHouse[playerid] = -1;
		}
		case DIALOG_EDIT_HOUSE_LEVEL: {
			if(response){
				if(IsNumeric(inputtext)){
					new index = editHouse[playerid];
					new indexdoor = getIndexDoorByID(houseData[index][doorid]);
					houseData[index][level] = strval(inputtext);
					DestroyDynamicHouse(index);
					loadHouse(index, indexdoor);
					ShowTDN_OOC(playerid, "Editaste el nivel");
					editHouse[playerid] = -1;
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE_LEVEL, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un nivel(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editHouse[playerid] = -1;
		}
		case DIALOG_MY_HOUSE: {
			if(response){
				switch(listitem){
					case 0: ShowFurnitures(playerid, houseData[editHouse[playerid]][listid], TYPE_HOUSES);
					case 1: ShowPlayerDialog(playerid, DIALOG_MY_HOUSE_DEPOSIT, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
					case 2: ShowPlayerDialog(playerid, DIALOG_MY_HOUSE_WITHDRAW, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
				}
			} else editHouse[playerid] = -1;
		}
		case DIALOG_MY_HOUSE_DEPOSIT: {
			if(response){
				if(IsNumeric(inputtext)){
					new ammounts = strval(inputtext);
					if(characterData[playerid][money] >= ammounts){
						new index = editHouse[playerid];
						houseData[index][safe] += ammounts;
						takeCharacterMoney(playerid, ammounts);
						ShowTDN_OOC(playerid, "Depositaste dinero en la caja fuerte");
						editHouse[playerid] = -1;
					}else {
						ShowTDN_OOC(playerid, "No tienes ese monto en mano");
						editHouse[playerid] = -1;
					}
					
				} else ShowPlayerDialog(playerid, DIALOG_MY_HOUSE_DEPOSIT, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editHouse[playerid] = -1;
		}
		case DIALOG_MY_HOUSE_WITHDRAW: {
			if(response){
				if(IsNumeric(inputtext)){
					new ammounts = strval(inputtext);
					new index = editHouse[playerid];
					if(houseData[index][safe] >= ammounts){
						houseData[index][safe] -= ammounts;
						giveCharacterMoney(playerid, ammounts);
						ShowTDN_OOC(playerid, "Retiraste dinero de la caja fuerte");
						editHouse[playerid] = -1;
					}else {
						ShowTDN_OOC(playerid, "La caja fuerte no tiene se monto");
						editHouse[playerid] = -1;
					}
					
				} else ShowPlayerDialog(playerid, DIALOG_MY_HOUSE_WITHDRAW, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" HOUSES", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editHouse[playerid] = -1;
		}
	}
}

cmd:micasa(playerid, params[]){
	new string[QUERY_LOW];
	for(new i;i<MAX_DOORS;i++){
		if(IsPlayerInExitDoor(playerid, 20.0, i)){
			for(new e;e<MAX_HOUSES;e++){
				if(doorsInfo[i][listid] == houseData[e][doorid]){
					if(houseData[e][characterid] == characterData[playerid][listid]){
						format(string, sizeof(string), "Muebles\nDepositar dinero caja fuerte\nRetirar dinero caja fuerte("GREEN"$%i)",  houseData[e][safe]);
						ShowPlayerDialog(playerid, DIALOG_MY_HOUSE, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" HOUSES", string, "Continuar", ""RED" cancelar");
						editHouse[playerid] = e;
						break;
					} else {
						ShowTDN_OOC(playerid, "No eres el dueño de esta casa.");
						break;
					}
				}
			}
			break;
		}
	}
	return 1;
}

cmd:editarcasa(playerid, params[]){
	new index;
	if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
		if(!sscanf(params, "i", index)){
	    	if(index >= 0 && index < MAX_HOUSES){
	    		editHouse[playerid] = index;
	    		new string[QUERY_LOW];
	    		format(string, sizeof(string), ""CAPTION_DIALOG_TITLE" House ID: %i", index);
	    		ShowPlayerDialog(playerid, DIALOG_EDIT_HOUSE, DIALOG_STYLE_LIST, string, "Editar ID puerta\nEditar ID puerta del garaje\nEditar direccion\nEditar precio\nEditar nivel", "Continuar", ""RED" cancelar");
	    	} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarcasa [index]");
	    } else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarcasa [index]");
    } else ShowTDN_OOC(playerid, "No tienes permisos");
    return 1;
}


cmd:crearcasa(playerid, params[]){
	new typee;
    if(characterData[playerid][p_spawn]){
    	if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
	    	if(!sscanf(params, "i", typee)){
	    		if(typee >= 0 && typee < 2){
	    			new DOOR_TYPS;
	    			if(typee == 0){
	    				DOOR_TYPS = DOOR_TYPE_INTERIOR;
	    			} else DOOR_TYPS = DOOR_TYPE_PHYSICAL;
	    			createDoor(playerid, DOOR_TYPS, characterData[playerid][listid], TYPE_HOUSES, typee);
	    		} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearcasa [TIPO: 0= Interior, 1=Puerta Fisica]");

	    	}else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY"/crearcasa [TIPO: 0= Interior, 1=Puerta Fisica]");
	    }
    }
    return 1;
}

createHouse(playerid, HOUSE_TYPE, doorId){
	new indexx = getFreeHouseSlot();
    if((HOUSE_TYPE != -1) && (indexx != -1)){
    	new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO houses(characterid, doorid, price, direction, garajedoorid, type, level) VALUES (0, '%d', 15000, 'Completar', 0, '%d', 0)", doorId, HOUSE_TYPE); 
        mysql_pquery(MYSQL_DB, query, "onCreateHouse", "ddd", playerid, indexx, doorId);
    }
}


DestroyDynamicHouse(index){
	if(houseData[index][loaded]){
		DestroyDynamic3DTextLabel(houseData[index][label]);
		DestroyDynamicPickup(houseData[index][pickup]);
		houseData[index][loaded] = false;
	}
}
loadHouse(index, indexdoor){
	if(!houseData[index][loaded]){
		if(houseData[index][doorid] != -1){
			if(indexdoor != -1){
				new string[QUERY_MEDIUM];
				new pickupp = 1272;
				if(houseData[index][statee] == HOUSE_STATE_ON_SALE){
					pickupp = 1273;
					format(string, sizeof(string), ""GREY"Casa en venta "GREEN"$%i"GREY"\n Direccion: %s \n"LIME" Dirigete a una inmobiliaria para comprarla!. \n "GREY"index: %i", houseData[index][price], houseData[index][direction], index);
				} else format(string, sizeof(string), ""GREY"Direccion: %s", houseData[index][direction]);
			    houseData[index][label] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, doorsInfo[indexdoor][enterCoords][0], doorsInfo[indexdoor][enterCoords][1], doorsInfo[indexdoor][enterCoords][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexdoor][doorVw]);
				houseData[index][pickup] = CreateDynamicPickup(pickupp, 1, doorsInfo[indexdoor][enterCoords][0], doorsInfo[indexdoor][enterCoords][1], doorsInfo[indexdoor][enterCoords][2], houseData[index][virtualworld], -1, -1, 10.0);
				houseData[index][loaded] = true;
			}
		}
	}
}

sellHouseCharacterId(playerid, index){
	if(index != -1){
		new doorIndex = getIndexDoorByID(houseData[index][doorid]);
		if(doorIndex != -1){
			if(houseData[index][characterid] > 0){
				new bool:isconnected = false;
				for(new i;i<MAX_PLAYERS; i++){
					if(characterData[i][listid] == houseData[index][characterid]){
						isconnected = true;
						houseData[index][characterid] = characterData[playerid][listid];
						doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
						houseData[index][statee] = HOUSE_STATE_PURCHASE;
						DestroyDynamicHouse(index);
						loadHouse(index, doorIndex);
						takeCharacterMoney(playerid, houseData[index][price]);
						giveCharacterMoney(i, houseData[index][price]);
						ShowTDN_OOC(playerid, "Compraste una casa!");
					}
				}
				if(!isconnected){
					new query[QUERY_MEDIUM];
        			mysql_format(MYSQL_DB, query, sizeof(query), "SELECT money FROM characters WHERE listid = '%i' LIMIT 1", houseData[index][characterid]);
        			mysql_pquery(MYSQL_DB, query, "onGetMoneyCharacterHouseID", "ddd", playerid, index, doorIndex);
				}
			} else {
				houseData[index][characterid] = characterData[playerid][listid];
				doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
				houseData[index][statee] = HOUSE_STATE_PURCHASE;
				DestroyDynamicHouse(index);
				loadHouse(index, doorIndex);
				takeCharacterMoney(playerid, houseData[index][price]);
				ShowTDN_OOC(playerid, "Compraste una casa!");
			}
		}
	}
}
forward onGetMoneyCharacterHouseID(playerid, index, doorIndex);
public onGetMoneyCharacterHouseID(playerid, index, doorIndex){
	if(cache_num_rows()){
		new moneyy, query[QUERY_LOW];
		cache_get_value_name_int(0, "money", moneyy);
		mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE characters SET `money`='%d' WHERE listid = '%d' LIMIT 1", moneyy + houseData[index][price], houseData[index][listid]);
		mysql_query(MYSQL_DB, query);
		houseData[index][characterid] = characterData[playerid][listid];
		houseData[index][statee] = HOUSE_STATE_PURCHASE;
		DestroyDynamicHouse(index);
		loadHouse(index, doorIndex);
		doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
		takeCharacterMoney(playerid, houseData[index][price]);
		ShowTDN_OOC(playerid, "Compraste una casa!");
	}
}
saveHouses(){
    new query[QUERY_LONG];
    for(new i; i<MAX_HOUSES;i++){
        if(houseData[i][listid] > 0){
            mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE houses SET `characterid`='%d', `doorid`='%d', `price`='%d', `direction`='%s', `garajedoorid`='%d', `type`='%d', `interior`='%d', `level`='%d', `statee`='%d', `virtualworld`='%d', `safe`='%d' WHERE listid = '%d' LIMIT 1",
            houseData[i][characterid],
            houseData[i][doorid],
            houseData[i][price],
            houseData[i][direction],
            houseData[i][garajedoorid],
            houseData[i][type],
            houseData[i][interior],
            houseData[i][level],
            houseData[i][statee],
            houseData[i][virtualworld],
            houseData[i][safe],
            houseData[i][listid]);
            mysql_query(MYSQL_DB, query);
        }
    }
}

forward loadHouses();
public loadHouses(){
    if(cache_num_rows()){
    	new indexdoor;
        for(new i=0;i<cache_num_rows();i++){ 
            cache_get_value_name_int(i, "listid", houseData[i][listid]);
	       	cache_get_value_name_int(i, "characterid", houseData[i][characterid]);
	        cache_get_value_name_int(i, "doorid", houseData[i][doorid]);
	        cache_get_value_name_int(i, "price", houseData[i][price]);
	        cache_get_value_name(i, "direction", houseData[i][direction]);
	        cache_get_value_name_int(i, "garajedoorid", houseData[i][garajedoorid]);
	        cache_get_value_name_int(i, "type", houseData[i][type]);
	        cache_get_value_name_int(i, "interior", houseData[i][interior]);
	        cache_get_value_name_int(i, "level", houseData[i][level]);
	       	cache_get_value_name_int(i, "statee", houseData[i][statee]);
	        cache_get_value_name_int(i, "virtualworld", houseData[i][virtualworld]);
	        cache_get_value_name_int(i, "safe", houseData[i][safe]);
	            
			DestroyDynamicHouse(i);
			indexdoor = getIndexDoorByID(houseData[i][doorid]);
			if(indexdoor != -1){
	            loadHouse(i, indexdoor);
            }
        }
    }
}

forward onCreateHouse(playerid, index, doorId);
public onCreateHouse(playerid, index, doorId){
	new indexdoor = getIndexDoorByID(doorid); 
	if(indexdoor != -1){
		houseData[index][price] = 15000;
		format(houseData[index][direction], 40, "Completar");
		houseData[index][doorid] = doorId;
		houseData[index][listid] = cache_insert_id();
		DestroyDynamicHouse(index);
		loadHouse(index, indexdoor);
		loadDoor(indexdoor);
		ShowTDN_OOC(playerid, "Creaste una casa, editala con /editarcasa");
	}
}


getFreeHouseSlot()
{
    for(new i;i<MAX_HOUSES-1;i++)
    {
        if(!houseData[i][loaded]) return i;
    }
    return -1;
}

getHousesByCharacterID(playerid){
	new array[MAX_USER_HOUSES];
	for(new s;s<MAX_USER_HOUSES;s++) array[s] = -1;
	if(characterData[playerid][p_spawn]){
		for(new i, e;i<MAX_HOUSES;i++){
			if(houseData[i][characterid] == characterData[playerid][listid]){
				array[e] = i;
				e++;
			}
		}
		return array;
	}
	return array;
}