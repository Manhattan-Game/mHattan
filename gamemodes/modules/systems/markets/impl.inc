#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid){
	editMarket[playerid] = -1;
	selectedIndexItem[playerid] = -1;
}
hook OnPlayerDisconnect(playerid, reason){
	saveMarkets();
}
hook OnGameModeExit(){
	saveMarkets();
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if(newkeys == KEY_YES){
		for(new i;i<MAX_MARKETS;i++){
			if(marketData[i][listid] > 0){
				if(IsPlayerInRangeOfPoint(playerid, 2.5, marketData[i][coordsSell][0], marketData[i][coordsSell][1], marketData[i][coordsSell][2]) && marketData[i][vw] == GetPlayerVirtualWorld(playerid)){
					showMarketMenu(playerid, i);
					break;
				}
			}
		}
	}
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_EDIT_MARKET: {
			if(response){
				switch(listitem){
					case 0: ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKETS", "Ingresa un index(Puerta)", "Continuar", ""RED" cancelar");
					case 1: {
						new index = editMarket[playerid];
						new indexdoor = getIndexDoorByID(marketData[index][doorid]);
						if(index != -1 && indexdoor != -1){
							updateSellPosition(playerid, index, indexdoor);
						}else editMarket[playerid] = -1;
					}
					case 2: {
						new string[QUERY_LONG];
						new stringtwo[QUERY_LOW];
						for(new i=1;i<sizeof(marketsModelsData);i++){
							format(stringtwo, sizeof(stringtwo), "%i - %s \n", i, marketsModelsData[i][name]);
							strcat(string, stringtwo);
						}
						ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_TYPE, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKETS", string, "Continuar", ""RED" cancelar");
					}
					case 3: ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_DIRECTION, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKETS", "Ingresa una direccion", "Continuar", ""RED" cancelar");
					case 4: ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_PRICE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKETS", "Ingresa un precio", "Continuar", ""RED" cancelar");
				}
			}else editMarket[playerid] = -1;
		}

		case DIALOG_EDIT_MARKET_DOORID: {
			if(response){
				if(_@IsNumeric(inputtext)){
					new indexdoor = strval(inputtext);
					new index = editMarket[playerid];
					if(indexdoor >= 0 && indexdoor < MAX_DOORS){
						if(doorsInfo[indexdoor][listid] > 0){
							marketData[index][doorid] = doorsInfo[indexdoor][listid];
							if(marketData[index][characterid] > 0){
								doorsInfo[indexdoor][characterID] = marketData[index][characterid];
							}
							DestroyDynamicHouse(index);
							loadMarket(index, indexdoor);
							ShowTDN_OOC(playerid, "Editaste el index puerta con el que interactua el negocio.");
							editMarket[playerid] = -1;
						}else ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKETS", "Ingresa un index valido", "Continuar", ""RED" cancelar");
					}else ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKETS", "Ingresa un index valido", "Continuar", ""RED" cancelar");
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKETS", "Ingresa un index valido", "Continuar", ""RED" cancelar");
			} else editMarket[playerid] = -1;
		}
		
		case DIALOG_EDIT_MARKET_DIRECTION: {
			if(response){
				new index = editMarket[playerid];
				new indexdoor = getIndexDoorByID(marketData[index][doorid]);
				format(marketData[index][direction], 60, "%s", inputtext);
				DestroyDynamicMarket(index);
				loadMarket(index, indexdoor);
				ShowTDN_OOC(playerid, "Editaste la direccion");
				editMarket[playerid] = -1;
			} else editMarket[playerid] = -1;
		}
		case DIALOG_EDIT_MARKET_TYPE: {
			if(response){
				new index = editMarket[playerid];
				new indexdoor = getIndexDoorByID(marketData[index][doorid]);
				marketData[index][type_market] = listitem+1;
				DestroyDynamicMarket(index);
				loadMarket(index, indexdoor);
				ShowTDN_OOC(playerid, "Editaste el tipo");
				editMarket[playerid] = -1;
			} else editMarket[playerid] = -1;
		}
		case DIALOG_EDIT_MARKET_PRICE: {
			if(response){
				if(IsNumeric(inputtext)){
					new index = editMarket[playerid];
					new indexdoor = getIndexDoorByID(marketData[index][doorid]);
					marketData[index][price] = strval(inputtext);
					DestroyDynamicMarket(index);
					loadMarket(index, indexdoor);
					ShowTDN_OOC(playerid, "Editaste el precio");
					editMarket[playerid] = -1;
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET_PRICE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKETS", "Ingresa un precio(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editMarket[playerid] = -1;
		}
		case DIALOG_MY_MARKET: {
			if(response){
				switch(listitem){
					case 0: ShowFurnitures(playerid, marketData[editMarket[playerid]][listid], TYPE_MARKETS);
					case 1: ShowSlotsItems(playerid, editMarket[playerid]);
					case 2: ShowSlotsItems(playerid, editMarket[playerid]);
					case 3: {
						new index = editMarket[playerid];
						if(characterData[playerid][money] > marketData[index][price] * 2){
							marketData[index][level]++;
							ShowTDN_OOC(playerid, "Mejoraste tu negocio, utiliza /ayuda para saber tus beneficios");
							editMarket[playerid] = -1;
						} else {
							ShowTDN_OOC(playerid, "No tienes el dinero suficiente.");
							editMarket[playerid] = -1;
						}
					}
					case 4: ShowPlayerDialog(playerid, DIALOG_MY_MARKET_DEPOSIT, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKET", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
					case 5: ShowPlayerDialog(playerid, DIALOG_MY_MARKET_WITHDRAW, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKET", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
				}
			} else editMarket[playerid] = -1; 
		}
		case DIALOG_MY_MARKET_SELECTED_ITEM_INDEX: {
			if(response){
				selectedIndexItem[playerid] = listitem;
				switch(marketData[editMarket[playerid]][type_market]){
					case MARKET_TYPE_FURNITURES: SelectFurnituresByType(playerid, DIALOG_SELECT_MARKET_FURNITURES);
					case MARKET_TYPE_CLOTHES: showAllSkins(playerid);
				}
			} else editMarket[playerid] = -1; 
		}
		case DIALOG_MY_MARKET_DEPOSIT: {
			if(response){
				if(IsNumeric(inputtext)){
					new ammounts = strval(inputtext);
					if(characterData[playerid][money] >= ammounts){
						new index = editHouse[playerid];
						marketData[index][safe] += ammounts;
						takeCharacterMoney(playerid, ammounts);
						ShowTDN_OOC(playerid, "Depositaste dinero en la caja fuerte");
						editMarket[playerid] = -1;
					}else {
						ShowTDN_OOC(playerid, "No tienes el dinero suficiente.");
						editMarket[playerid] = -1;
					}
					
				} else ShowPlayerDialog(playerid, DIALOG_MY_MARKET_DEPOSIT, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKET", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editMarket[playerid] = -1;
		}
		case DIALOG_MY_MARKET_WITHDRAW: {
			if(response){
				if(IsNumeric(inputtext)){
					new ammounts = strval(inputtext);
					new index = editMarket[playerid];
					if(marketData[index][safe] >= ammounts){
						marketData[index][safe] -= ammounts;
						giveCharacterMoney(playerid, ammounts);
						ShowTDN_OOC(playerid, "Retiraste dinero de la caja fuerte");
						editMarket[playerid] = -1;
					}else {
						ShowTDN_OOC(playerid, "La caja fuerte no tiene se monto");
						editMarket[playerid] = -1;
					}
					
				} else ShowPlayerDialog(playerid, DIALOG_MY_MARKET_WITHDRAW, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" MARKET", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editMarket[playerid] = -1;
		}
		case DIALOG_SELECT_MARKET_FURNITURES: if(!response) editMarket[playerid] = -1;
	}
}
hook OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){
    if(response){
        if(dialogid == DIALOG_ITEMS_SELECT_FURNITURE){
            if(getCountDialogItems(playerid) > 0){
            	for(new i;i<sizeof(furnituresModelData);i++){
            		if(furnituresModelData[i][model] == modelid){
						finishEditItem(playerid, editMarket[playerid], i);
						break;
            		}
            	}
            } else ShowTDN_OOC(playerid, "No tienes muebles");
            
        }
    } else editMarket[playerid] = -1;
}
cmd:minegocio(playerid, params[]){
	new string[QUERY_LOW];
	for(new i;i<MAX_DOORS;i++){
		if(IsPlayerInExitDoor(playerid, 20.0, i)){
			for(new e;e<MAX_HOUSES;e++){
				if(doorsInfo[i][listid] == marketData[e][doorid]){
					if(marketData[e][characterid] == characterData[playerid][listid]){
						format(string, sizeof(string), "Muebles\nEditar productos(El stock vuelve a 0)\nPedir stock\nMejorar negocio("GREEN"$%i)"GREY"\nDepositar dinero caja fuerte\nRetirar dinero caja fuerte("GREEN"$%i)", marketData[e][price] * 2,  marketData[e][safe]);
						ShowPlayerDialog(playerid, DIALOG_MY_MARKET, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", string, "Continuar", ""RED" cancelar");
						editMarket[playerid] = e;
						break;
					} else {
						ShowTDN_OOC(playerid, "No eres el dueño de este negocio.");
						break;
					}
				}
			}
			break;
		}
	}
	return 1;
}
cmd:crearnegocio(playerid, params[]){
	new typee;
    if(characterData[playerid][p_spawn]){
    	if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
    		if(!sscanf(params, "i", typee)){
	    		if(typee >= 0 && typee < 2){
	    			new DOOR_TYPS;
	    			if(typee == 0){
	    				DOOR_TYPS = DOOR_TYPE_INTERIOR;
	    			} else DOOR_TYPS = DOOR_TYPE_PHYSICAL;
	    			createDoor(playerid, DOOR_TYPS, characterData[playerid][listid], TYPE_MARKETS, typee);
	    		} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearnegocio [TIPO: 0= Interior, 1=Puerta Fisica]");

	    	}else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY"/crearnegocio [TIPO: 0= Interior, 1=Puerta Fisica]");
	    }
    }
    return 1;
}

cmd:editarnegocio(playerid, params[]){
	new index;
	if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
		if(!sscanf(params, "i", index)){
	    	if(index >= 0 && index < MAX_HOUSES){
	    		editMarket[playerid] = index;
	    		new string[QUERY_LOW];
	    		format(string, sizeof(string), ""CAPTION_DIALOG_TITLE" Market ID: %i", index);
	    		ShowPlayerDialog(playerid, DIALOG_EDIT_MARKET, DIALOG_STYLE_LIST, string, "Editar ID puerta\nEditar posicion compra\nEditar tipo\nEditar direccion\nEditar precio", "Continuar", ""RED" cancelar");
	    	} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarnegocio [index]");
	    } else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarnegocio [index]");
    } else ShowTDN_OOC(playerid, "No tienes permisos");
    return 1;
}