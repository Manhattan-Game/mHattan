#include <YSI_Coding\y_hooks>

#define MAX_TRADES 1000

#define TRADE_STATE_ONSELL 1
#define TRADE_STATE_TO_DELIVERIED 2
#define TRADE_STATE_ON_DELIVERIED 3


enum tradas@enm{
	model,
	type_trade,
	companieid,
	marketid,
	productid,
	statee,
	price,
	ammount,
	bool:simulated,
	lastTicket
};
new tradeData[MAX_TRADES][tradas@enm]; 
new editTrade[MAX_PLAYERS];

createTrade(companiieid, modell, ammt, types, prices, statte, bool:sim){
	new tradeindex = getFreeTrade();
	if(tradeindex != -1){
		tradeData[tradeindex][model] = modell;
		tradeData[tradeindex][companieid] = companiieid;
		tradeData[tradeindex][type_trade] = types;
		tradeData[tradeindex][price] = prices;
		tradeData[tradeindex][statee] = statte;
		tradeData[tradeindex][ammount] = ammt;
		tradeData[tradeindex][lastTicket] = 0;
		tradeData[tradeindex][simulated] = sim;
	}
}
getProductIndexMarket(playerid, tradeid){
	new indexes[2];
	indexes[0] = -1;
	indexes[1] = -1;
	for(new e;e<MAX_MARKETS;e++){
		if(marketData[e][characterid] == characterData[playerid][listid]){
			for(new i;i<MAX_MARKETS_ITEMS;i++){
				if(marketData[e][item][i] == tradeData[tradeid][model]) {
					indexes[0] = i;
					indexes[1] = e;
					return indexes;
				}
			}
		}
	}
	return indexes;
}
toDeliveriedTrade(tradeid, indexproduct, marketindex){
	if(tradeid != -1 && marketindex != -1){
		tradeData[tradeid][marketid] = marketindex;
		tradeData[tradeid][productid] = indexproduct;
		tradeData[tradeid][statee] = TRADE_STATE_TO_DELIVERIED;
	}
}
addCompanieSafe(tradeindex){
	for(new i;i<MAX_COMPANIES;i++){
		if(companyData[i][listid] == tradeData[tradeindex][companieid]){
			companyData[i][safe] += tradeData[tradeindex][price];
			return true;
		}
	}
	return false;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_TRADES:{
			if(response){
				switch(listitem){
					case 0: showTradesByType(playerid, 1);
					case 1: showTradesByType(playerid, 4);
				}
			} else editTrade[playerid] = -1;
		}
		case DIALOG_TRADES_BY_TYPE: {
			if(response){
				for(new i, e;i<MAX_TRADES; i++){
					if(tradeData[i][type_trade] == editTrade[playerid]){
						if(e == listitem){
							if(characterData[playerid][money] >= tradeData[i][price]){
								new tDD[2];
								tDD = getProductIndexMarket(playerid, i);
								if(tDD[0] != -1){
									takeCharacterMoney(playerid, tradeData[i][price]);
									if(addCompanieSafe(i)) toDeliveriedTrade(i, tDD[0], tDD[1]);
								} else ShowTDN_IC(playerid, "No tienes este producto u tipo de negocio.");
							} else ShowTDN_IC(playerid, "No tienes dinero suficiente.");
							break;
						}
						e++;
					}
				}
			} else editTrade[playerid] = -1;
		}
	}
}

showTradesByType(playerid, types){
	editTrade[playerid] = types;
 	new stringg[QUERY_LONG], stringConcat[QUERY_LOW];
	for(new i;i<MAX_TRADES; i++){
		if(tradeData[i][type_trade] == types){
			switch(types){
				case COMPANIES_TYPE_VEHICLES: format(stringg, sizeof(stringg), "%s $%i \n", vehiclesModelData[tradeData[i][model]][name], tradeData[i][price]);
				case COMPANIES_TYPE_FURNITURES: format(stringg, sizeof(stringg), "%s $%i \n", furnituresModelData[tradeData[i][model]][name], tradeData[i][price]);

			}
			strcat(stringg, stringConcat);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_TRADES_BY_TYPE, DIALOG_STYLE_LIST,  ""CAPTION_DIALOG_TITLE" Mercado", stringg, "Continuar", ""RED" cancelar");
}
showTradesToDeliveried(playerid){
 	new stringg[QUERY_LONG], stringConcat[QUERY_LOW];
	for(new i;i<MAX_TRADES; i++){
		if(tradeData[i][statee] == TRADE_STATE_TO_DELIVERIED){
			switch(tradeData[i][type_trade]){
				case COMPANIES_TYPE_VEHICLES: format(stringg, sizeof(stringg), "%s \n", vehiclesModelData[tradeData[i][model]][name]);
				case COMPANIES_TYPE_FURNITURES: format(stringg, sizeof(stringg), "%s \n", furnituresModelData[tradeData[i][model]][name]);

			}
			strcat(stringg, stringConcat);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_TRADES_TO_DELIVERIED, DIALOG_STYLE_LIST,  ""CAPTION_DIALOG_TITLE" Mercado envios", stringg, "Continuar", ""RED" cancelar");
}
getFreeTrade(){
	for(new i; i<MAX_TRADES; i++){
		if(tradeData[i][statee] == 0) return i;
	}
	return -1;
}