#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_SELECT_MARKET_SELL_BUILDS:{
			if(response){
				new stringfinal[QUERY_LONG], stringConcat[QUERY_LOW];
				switch(listitem){
					case 0: {
						for(new i;i<MAX_HOUSES;i++){
							if(houseData[i][listid] > 0 && houseData[i][statee] == HOUSE_STATE_ON_SALE){
								format(stringConcat, sizeof(stringConcat), "Direccion: %s, Precio: "GREEN"$%i \n", houseData[i][direction], houseData[i][price]);
								strcat(stringfinal, stringConcat);
							}
						}
						ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_HOUSES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", stringfinal, "Comprar", ""RED" cancelar");
					}
					case 1: {
						for(new i;i<MAX_MARKETS;i++){
							if(marketData[i][listid] > 0 && marketData[i][sale] == HOUSE_STATE_ON_SALE){
								format(stringConcat, sizeof(stringConcat), "Direccion: %s, Precio: "GREEN"$%i \n", marketData[i][direction], marketData[i][price]);
								strcat(stringfinal, stringConcat);
							}
						}
						ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_MARKETS, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", stringfinal, "Comprar", ""RED" cancelar");
					}
				}
			}else editMarket[playerid] = -1;
		}
		case DIALOG_SELECT_MARKET_SELL_HOUSES: {
			if(response){
				for(new i, e;i<MAX_HOUSES;i++){
					if(houseData[i][listid] > 0 && houseData[i][statee] == HOUSE_STATE_ON_SALE){
						if(e == listitem){
							if(characterData[playerid][money] >= houseData[i][price]){
								marketData[editMarket[playerid]][safe] += (houseData[e][price] / 12);
								sellHouseCharacterId(playerid, i);
								break;
							} else{
								ShowTDN_OOC(playerid, "No tienes el dinero suficiente.");
								break;
							}
						}
						e++;
					}
				}
			} else editMarket[playerid] = -1;
		}
		case DIALOG_SELECT_MARKET_SELL_MARKETS: {
			if(response){
				for(new i, e;i<MAX_MARKETS;i++){
					if(marketData[i][listid] > 0 && marketData[i][sale] == HOUSE_STATE_ON_SALE){
						if(e == listitem){
							if(characterData[playerid][money] >= marketData[i][price]){
								marketData[editMarket[playerid]][safe] += (marketData[e][price] / 12);
								sellMarketCharacterId(playerid, i);
								break;
							} else{
								ShowTDN_OOC(playerid, "No tienes el dinero suficiente.");
								break;
							}
						}
						e++;
					}
				}
			} else editMarket[playerid] = -1;
		}
	}
}