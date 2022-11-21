

showMarketMenu(playerid, index){
	switch(marketData[index][type_market]){
		case MARKET_TYPE_BUILDS: ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_BUILDS, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", "Casas\nNegocios\nEmpresas", "Continuar", ""RED" cancelar");
		case MARKET_TYPE_FURNITURES: ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_FURNITURES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", "Casas\nNegocios\nEmpresas", "Continuar", ""RED" cancelar");
		case MARKET_TYPE_CLOTHES: showMarketSkins(playerid);
	}
	editMarket[playerid] = index;
}

createMarket(playerid, MARKET_TYPE, doorId){
	new indexx = getFreeMarketSlot();
    if((MARKET_TYPE != -1) && (indexx != -1)){
    	new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO markets(doorid, type, vw) VALUES ('%d', '%d', '%d')", doorId, MARKET_TYPE, GetPlayerVirtualWorld(playerid)); 
        mysql_pquery(MYSQL_DB, query, "onCreateMarket", "ddd", playerid, indexx, doorId);
    }
}


DestroyDynamicMarket(index){
	if(marketData[index][loadedd]){
		DestroyDynamic3DTextLabel(marketData[index][labell]);
		DestroyDynamic3DTextLabel(marketData[index][labelSell]);
		DestroyDynamicPickup(marketData[index][pickupp]);
		marketData[index][loadedd] = false;
	}
}
loadMarket(index, indexdoor){
	if(!marketData[index][loadedd]){
		if(marketData[index][doorid] != -1){
			if(indexdoor != -1){
				new string[QUERY_MEDIUM];
				if(marketData[index][sale] == HOUSE_STATE_ON_SALE){
					format(string, sizeof(string), ""GREY"Negocio en venta "GREEN"$%i"GREY"\n %s \n Direccion: %s \n "GREY"index: %i", marketData[index][price], marketsModelsData[marketData[index][type_market]][name], marketData[index][direction], index);
				} else format(string, sizeof(string), ""GREY" %s \n Direccion: %s", marketsModelsData[marketData[index][type_market]][name], marketData[index][direction]);
			    marketData[index][labell] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, doorsInfo[indexdoor][enterCoords][0], doorsInfo[indexdoor][enterCoords][1], doorsInfo[indexdoor][enterCoords][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexdoor][doorVw]);
				marketData[index][labelSell] = CreateDynamic3DTextLabel(""GREY"Pulsa "ORANGE"Y"GREY" para comprar", 0xFFFFFFFF, marketData[index][coordsSell][0], marketData[index][coordsSell][1], marketData[index][coordsSell][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexdoor][exitVw]);
				marketData[index][pickupp] = CreateDynamicPickup(1239, 1, doorsInfo[indexdoor][enterCoords][0], doorsInfo[indexdoor][enterCoords][1], doorsInfo[indexdoor][enterCoords][2], doorsInfo[indexdoor][doorVw], -1, -1, 10.0);
				marketData[index][loadedd] = true;
			}
		}
	}
}


updateSellPosition(playerid, index, indexDoorId){
	new Float:xX, Float:yY, Float:zZ;
	GetPlayerPos(playerid, xX, yY, zZ);
	marketData[index][coordsSell][0] = xX;
	marketData[index][coordsSell][1] = yY;
	marketData[index][coordsSell][2] = zZ;
	marketData[index][vw] = GetPlayerVirtualWorld(playerid);
	DestroyDynamicMarket(index);
	loadMarket(index, indexDoorId);
	ShowTDN_IC(playerid, "Editaste la posicion de compra");
	editMarket[playerid] = -1;
}
ShowSlotsItems(playerid, index){
	new stringfinal[QUERY_LONG], string[QUERY_LOW];
	for(new i;i<20;i++){
		switch(marketData[index][type_market]){
			case MARKET_TYPE_FURNITURES: format(string, sizeof(string), "%i - %s \n", i+1, furnituresModelData[marketData[index][item][i]][name]);
			case MARKET_TYPE_CLOTHES: format(string, sizeof(string), "%i - %s \n", i+1, skinsModelData[marketData[index][item][i]][name]);
		}
		strcat(stringfinal, string);
	}
	ShowPlayerDialog(playerid, DIALOG_MY_MARKET_SELECTED_ITEM_INDEX, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", stringfinal, "Continuar", ""RED" cancelar");
}
finishEditItem(playerid, index, modell){
	new indexItem = selectedIndexItem[playerid];
	printf("indexitem: %i, index: %i, model: %i", indexItem, index, modell);
	if((index != -1) && (modell != -1) && (indexItem != -1)){
		marketData[index][item][indexItem] = modell;
		marketData[index][itemAmmount][indexItem] = 0;
		ShowTDN_IC(playerid, "Editaste un item");
		editMarket[playerid] = -1;
		selectedIndexItem[playerid] = -1;
	}
}


saveMarkets(){
    new query[QUERY_LONG*2];
    for(new i; i<MAX_MARKETS;i++){
        if(marketData[i][listid] > 0){
            mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE markets SET `characterid`='%d', `doorid`='%d', `safe`='%d', `level`='%d', `type`='%d', `coordsSell1`='%f', `coordsSell2`='%f', `coordsSell3`='%f', `sale`='%d', `vw`='%d', `price`='%d', `direction`='%e', \
			`item1`='%d', `item2`='%d', `item3`='%d', `item4`='%d', `item5`='%d', `item6`='%d', `item7`='%d', `item8`='%d', `item9`='%d', `item10`='%d', `item11`='%d', `item12`='%d', `item13`='%d', `item14`='%d', `item15`='%d', `item16`='%d', `item17`='%d', `item18`='%d', `item19`='%d', `item20`='%d', \
			`itemAmount1`='%d', `itemAmount2`='%d', `itemAmount3`='%d', `itemAmount4`='%d', `itemAmount5`='%d', `itemAmount6`='%d', `itemAmount7`='%d', `itemAmount8`='%d', `itemAmount9`='%d', `itemAmount10`='%d', `itemAmount11`='%d', `itemAmount12`='%d', `itemAmount13`='%d', `itemAmount14`='%d', `itemAmount15`='%d', `itemAmount16`='%d', `itemAmount17`='%d', `itemAmount18`='%d', `item19`='%d', `itemAmount20`='%d' WHERE listid = '%d' LIMIT 1",
            marketData[i][characterid], marketData[i][doorid], marketData[i][safe], marketData[i][level], marketData[i][type_market],
            marketData[i][coordsSell][0], marketData[i][coordsSell][1], marketData[i][coordsSell][2],
            marketData[i][sale], marketData[i][vw], marketData[i][price], marketData[i][direction], 
            marketData[i][item][0], marketData[i][item][1], marketData[i][item][2], marketData[i][item][3], marketData[i][item][4], marketData[i][item][5], marketData[i][item][6], marketData[i][item][7], marketData[i][item][8], marketData[i][item][9], marketData[i][item][10],
            marketData[i][item][11], marketData[i][item][12], marketData[i][item][13], marketData[i][item][14], marketData[i][item][15], marketData[i][item][16], marketData[i][item][17], marketData[i][item][18], marketData[i][item][19],
            marketData[i][itemAmmount][0], marketData[i][itemAmmount][1], marketData[i][itemAmmount][2], marketData[i][itemAmmount][3], marketData[i][itemAmmount][4], marketData[i][itemAmmount][5], marketData[i][itemAmmount][6], marketData[i][itemAmmount][7], marketData[i][itemAmmount][8], marketData[i][itemAmmount][9], marketData[i][itemAmmount][10],
            marketData[i][itemAmmount][11], marketData[i][itemAmmount][12], marketData[i][itemAmmount][13], marketData[i][itemAmmount][14], marketData[i][itemAmmount][15], marketData[i][itemAmmount][16], marketData[i][itemAmmount][17], marketData[i][itemAmmount][18], marketData[i][itemAmmount][19],
            marketData[i][listid]);
            mysql_query(MYSQL_DB, query);
        }
    }
}
sellMarketCharacterId(playerid, index){
	if(index != -1){
		new doorIndex = getIndexDoorByID(marketData[index][doorid]);
		if(doorIndex != -1){
			if(marketData[index][characterid] > 0){
				new bool:isconnected = false;
				for(new i;i<MAX_PLAYERS; i++){
					if(characterData[i][listid] == marketData[index][characterid]){
						isconnected = true;
						marketData[index][characterid] = characterData[playerid][listid];
						doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
						marketData[index][sale] = HOUSE_STATE_PURCHASE;
						DestroyDynamicMarket(index);
						loadMarket(index, doorIndex);
						takeCharacterMoney(playerid, marketData[index][price]);
						giveCharacterMoney(i, marketData[index][price]);
						ShowTDN_IC(playerid, "Compraste un negocio!");
					}
				}
				if(!isconnected){
					new query[QUERY_MEDIUM];
        			mysql_format(MYSQL_DB, query, sizeof(query), "SELECT money FROM characters WHERE listid = '%i' LIMIT 1", marketData[index][characterid]);
        			mysql_pquery(MYSQL_DB, query, "onGetMoneyCharacterMarketID", "ddd", playerid, index, doorIndex);
				}
			} else {
				marketData[index][characterid] = characterData[playerid][listid];
				doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
				marketData[index][sale] = HOUSE_STATE_PURCHASE;
				DestroyDynamicMarket(index);
				loadMarket(index, doorIndex);
				takeCharacterMoney(playerid, marketData[index][price]);
				ShowTDN_IC(playerid, "Compraste un negocio!");
			}
		}
	}
}
forward onGetMoneyCharacterMarketID(playerid, index, doorIndex);
public onGetMoneyCharacterMarketID(playerid, index, doorIndex){
	if(cache_num_rows()){
		new moneyy, query[QUERY_LOW];
		cache_get_value_name_int(0, "money", moneyy);
		mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE characters SET `money`='%d' WHERE listid = '%d' LIMIT 1", moneyy + marketData[index][price], marketData[index][listid]);
		mysql_query(MYSQL_DB, query);
		marketData[index][characterid] = characterData[playerid][listid];
		marketData[index][sale] = HOUSE_STATE_PURCHASE;
		DestroyDynamicMarket(index);
		loadMarket(index, doorIndex);
		doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
		takeCharacterMoney(playerid, marketData[index][price]);
		ShowTDN_IC(playerid, "Compraste un negocio!");
	}
}

forward loadMarkets();
public loadMarkets(){
    if(cache_num_rows()){
    	new indexdoor;
    	new string[QUERY_LOW];
        for(new i=0;i<cache_num_rows();i++){ 
            cache_get_value_name_int(i, "listid", marketData[i][listid]);
	       	cache_get_value_name_int(i, "characterid", marketData[i][characterid]);
	        cache_get_value_name_int(i, "doorid", marketData[i][doorid]);
	        cache_get_value_name_int(i, "safe", marketData[i][safe]);
	        cache_get_value_name_int(i, "level", marketData[i][level]);
	        cache_get_value_name_int(i, "type", marketData[i][type_market]);
	        cache_get_value_name_float(i, "coordsSell1", marketData[i][coordsSell][0]);
	        cache_get_value_name_float(i, "coordsSell2", marketData[i][coordsSell][1]);
	        cache_get_value_name_float(i, "coordsSell3", marketData[i][coordsSell][2]);
	        cache_get_value_name_int(i, "sale", marketData[i][sale]);
	        cache_get_value_name_int(i, "vw", marketData[i][vw]);
	        cache_get_value_name(i, "direction", marketData[i][direction]);
	        cache_get_value_name_int(i, "price", marketData[i][price]);

	        for(new e;e<20;e++){
	        	format(string, sizeof(string), "item%i", e+1);
	        	cache_get_value_name_int(i, string, marketData[i][item][e]);
	        	format(string, sizeof(string), "itemAmount%i", e+1);
	        	cache_get_value_name_int(i, string, marketData[i][itemAmmount][e]);
	        }

			DestroyDynamicMarket(i);
			indexdoor = getIndexDoorByID(marketData[i][doorid]);
			if(indexdoor != -1){
	            loadMarket(i, indexdoor);
            }
        }
    }
}

forward onCreateMarket(playerid, index, doorId);
public onCreateMarket(playerid, index, doorId){
	new indexdoor = getIndexDoorByID(doorId); 
	if(indexdoor != -1){
		marketData[index][price] = 15000;
		format(houseData[index][direction], 40, "Completar");
		marketData[index][doorid] = doorId;
		marketData[index][listid] = cache_insert_id();
		DestroyDynamicMarket(index);
		loadMarket(index, indexdoor);
		loadDoor(indexdoor);
		ShowTDN_IC(playerid, "Creaste un negocio, editalo con /editarnegocio");
	}
}

getFreeMarketSlot(){
    for(new i;i<MAX_MARKETS-1;i++){
        if(marketData[i][listid] == 0) return i;
    }
    return -1;
}

getMarketsByCharacterID(playerid){
	new array[MAX_USER_MARKETS];
	for(new s;s<MAX_USER_MARKETS;s++) array[s] = -1;
	if(characterData[playerid][p_spawn]){
		for(new i, e;i<MAX_MARKETS;i++){
			if(marketData[i][characterid] == characterData[playerid][listid]){
				array[e] = i;
				e++;
				if(e > MAX_USER_MARKETS) break;
			}
		}
		return array;
	}
	return array;
}