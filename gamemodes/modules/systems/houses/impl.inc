#include <YSI_Coding\y_hooks>

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
							ShowTDN_OOC(playerid, "Editaste el ID puerta con el que interactua la casa.");
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