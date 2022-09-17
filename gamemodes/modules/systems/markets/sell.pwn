#include <YSI_Coding\y_hooks>

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

new editTypeMarkets[MAX_PLAYERS];
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_SELECT_MARKET_SELL_BUILDS:{

		}
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
showMarketMenu(playerid, index){
	switch(marketData[index][type]){
		case MARKET_TYPE_BUILDS: ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_BUILDS, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", "Casas\nNegocios\nEmpresas", "Continuar", ""RED" cancelar");
		case MARKET_TYPE_FURNITURES: ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_FURNITURES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", "Casas\nNegocios\nEmpresas", "Continuar", ""RED" cancelar");
	}
	editMarket[playerid] = index;
}