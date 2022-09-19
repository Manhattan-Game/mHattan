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

showMarketMenu(playerid, index){
	switch(marketData[index][type_market]){
		case MARKET_TYPE_BUILDS: ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_BUILDS, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", "Casas\nNegocios\nEmpresas", "Continuar", ""RED" cancelar");
		case MARKET_TYPE_FURNITURES: ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_FURNITURES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", "Casas\nNegocios\nEmpresas", "Continuar", ""RED" cancelar");
		case MARKET_TYPE_CLOTHES: showMarketSkins(playerid);
	}
	editMarket[playerid] = index;
}