#include <YSI_Coding\y_hooks>


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_SELECT_MARKET_SELL_FURNITURES: {
			if(response){
				new stringFinal[QUERY_MEDIUM], strincat[QUERY_LOW];
				switch(listitem){
					case 0: {
						new array[MAX_USER_HOUSES];
						array = getHousesByCharacterID(playerid);
						for(new i;i<MAX_USER_HOUSES; i++){
							if(array[i] != -1){
								format(strincat, sizeof(strincat), "Direccion: %s \n", houseData[array[i]][direction]);
								strcat(stringFinal, strincat);
							}
						}
						ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_FURNITURES_HOUSES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", stringFinal, "Continuar", ""RED" cancelar");
					}
					case 1: {
						new array[MAX_USER_MARKETS];
						array = getMarketsByCharacterID(playerid);
						for(new i;i<MAX_USER_MARKETS; i++){
							if(array[i] != -1){
								format(strincat, sizeof(strincat), "Direccion: %s \n", marketData[array[i]][direction]);
								strcat(stringFinal, strincat);
							}
						}
						ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_FURNITURES_MARKETS, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", stringFinal, "Continuar", ""RED" cancelar");
					}
					/*case 2: {
						new array[MAX_USER_HOUSES];
						array = getHousesByCharacterID(playerid);
						new stringFinal[QUERY_MEDIUM], strincat[QUERY_LOW];
						for(new i;i<MAX_USER_HOUSES){
							if(array[i] != -1){
								format(strincat, sizeof(strincat), "Direccion: %s", houseData[array[i]][direction]);
								strcat(stringFinal, strincat);
							}
						}
					}*/
				}
			} else editMarket[playerid] = -1;
		}
		case DIALOG_SELECT_MARKET_SELL_FURNITURES_HOUSES: {
			if(response){
				editTypeMarkets[playerid] = TYPE_HOUSES;
				selectedIndexItem[playerid] = listitem;
				new index = editMarket[playerid];
				new string[QUERY_LOW];
				for(new i;i<20;i++){
	                if(furnituresModelData[marketData[index][item][i]][model] > 0){
	                	format(string, sizeof(string), "%s $%i", furnituresModelData[marketData[index][item][i]][name], furnituresModelData[marketData[index][item][i]][price]);
	                    addDialogItem(playerid, furnituresModelData[marketData[index][item][i]][model], string);
	                }
	            }
				ShowPlayerDialogItem(playerid, DIALOG_SELL_SELECT_FURNITURE, "Muebles", "Comprar");
			}else editMarket[playerid] = -1;
		}
		case DIALOG_SELECT_MARKET_SELL_FURNITURES_MARKETS: {
			if(response){
				editTypeMarkets[playerid] = TYPE_MARKETS;
				selectedIndexItem[playerid] = listitem;
				new index = editMarket[playerid];
				new string[QUERY_LOW];
				for(new i;i<20;i++){
	                if(furnituresModelData[marketData[index][item][i]][model] > 0){
	                	format(string, sizeof(string), "%s $%i", furnituresModelData[marketData[index][item][i]][name], furnituresModelData[marketData[index][item][i]][price]);
	                    addDialogItem(playerid, furnituresModelData[marketData[index][item][i]][model], string);
	                }
	            }
				ShowPlayerDialogItem(playerid, DIALOG_SELL_SELECT_FURNITURE, "Muebles", "Comprar");
			}else editMarket[playerid] = -1;
		}
	}
}

hook OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){
	if(dialogid == DIALOG_SELL_SELECT_FURNITURE){
		if(response){
			if(getCountDialogItems(playerid) > 0){
				new modell = -1;
            	for(new i;i<sizeof(furnituresModelData);i++){
            		if(furnituresModelData[i][model] == modelid){
						modell = i;
						break;
            		}
            	}
            	new realIndexMarket; 
            	for(new e;e<20;e++){
            		if(marketData[editMarket[playerid]][item][e] == modell){
            			realIndexMarket = e;
            			break;
            		}
            	}
            	if(modell != -1){
            		if(characterData[playerid][money] >= furnituresModelData[modell][price]){
            			if(marketData[editMarket[playerid]][itemAmmount][realIndexMarket] > 0){
            				takeCharacterMoney(playerid, furnituresModelData[modell][price]);
            				marketData[editMarket[playerid]][itemAmmount][realIndexMarket]--;
            				marketData[editMarket[playerid]][safe] += furnituresModelData[modell][price];
            				new array[MAX_USER_MARKETS], finalid;
            				switch(editTypeMarkets[playerid]){
            					case TYPE_HOUSES: {
            						array = getHousesByCharacterID(playerid);
            						finalid = houseData[array[selectedIndexItem[playerid]]][listid];
            					}
            					case TYPE_MARKETS: {
            						array = getMarketsByCharacterID(playerid);
            						finalid = marketData[array[selectedIndexItem[playerid]]][listid];
            					}
            				}
  
							createFurniture(modell, editTypeMarkets[playerid], finalid);
							editTypeMarkets[playerid] = -1;
							selectedIndexItem[playerid] = -1;
							editMarket[playerid] = -1;
							ShowTDN_OOC(playerid, "Compraste un mueble");
            			} else {
            				ShowTDN_OOC(playerid, "El negocio no tiene stock sobre este producto.");
            				editTypeMarkets[playerid] = -1;
							selectedIndexItem[playerid] = -1;
							editMarket[playerid] = -1;
            			}
            		} else {
            			ShowTDN_OOC(playerid, "No tienes dinero en mano.");
            			editTypeMarkets[playerid] = -1;
						selectedIndexItem[playerid] = -1;
						editMarket[playerid] = -1;
            		}
            	} else {
					editTypeMarkets[playerid] = -1;
					selectedIndexItem[playerid] = -1;
					editMarket[playerid] = -1;
				}
            } else ShowTDN_OOC(playerid, "No hay muebles en venta");
		} else {
			editTypeMarkets[playerid] = -1;
			selectedIndexItem[playerid] = -1;
			editMarket[playerid] = -1;
		}
	}
}
