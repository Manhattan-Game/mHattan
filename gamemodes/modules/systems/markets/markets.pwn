#include <YSI_Coding\y_hooks>

#define MAX_MARKETS_ITEMS 20 // Don't touch devit please, use index by mysql Db
enum marketsR@enm{
	listid,
	characterid,
	doorid,
	safe,
	level,
	type,
	Float:coordsSell[3],
	sale,
	vw,
	item[MAX_MARKETS_ITEMS],
	itemAmmount[MAX_MARKETS_ITEMS],
	price,
	direction[40],

	Text3D:labell,
	Text3D:labelSell,
	bool:loadedd,
	pickupp

}
new marketData[MAX_MARKETS][marketsR@enm];

new editMarket[MAX_PLAYERS] = -1;
new selectedIndexItem[MAX_PLAYERS] = -1;

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
				marketData[index][type] = listitem+1;
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
					case 0: ShowFurnitures(playerid, marketData[editMarket[playerid]][listid]);
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
				SelectFurnituresByType(playerid, DIALOG_SELECT_MARKET_FURNITURES);
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
					format(string, sizeof(string), ""GREY"Negocio en venta "GREEN"$%i"GREY"\n %s \n Direccion: %s \n"LIME" Dirigete a una inmobiliaria para comprarla!.\n "GREY"index: %i", marketData[index][price], marketsModelsData[marketData[index][type]][name], marketData[index][direction], index);
				} else format(string, sizeof(string), ""GREY" %S \n Direccion: %s", marketsModelsData[marketData[index][type]][name], marketData[index][direction]);
			    marketData[index][labell] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, doorsInfo[indexdoor][enterCoords][0], doorsInfo[indexdoor][enterCoords][1], doorsInfo[indexdoor][enterCoords][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexdoor][doorVw]);
				marketData[index][labelSell] = CreateDynamic3DTextLabel(""GREY"Pulsa "ORANGE"Y"GREY" para comprar", 0xFFFFFFFF, marketData[index][coordsSell][0], marketData[index][coordsSell][1], marketData[index][coordsSell][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, marketData[index][vw]);
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
	ShowTDN_OOC(playerid, "Editaste la posicion de compra");
	editMarket[playerid] = -1;
}
ShowSlotsItems(playerid, index){
	new stringfinal[QUERY_LONG], string[QUERY_LOW];
	for(new i;i<20;i++){
		switch(marketData[index][type]){
			case MARKET_TYPE_FURNITURES: format(string, sizeof(string), "%i - %s \n", i+1, furnituresModelData[marketData[index][item][i]][name]);
		}
		strcat(stringfinal, string);
	}
	ShowPlayerDialog(playerid, DIALOG_MY_MARKET_SELECTED_ITEM_INDEX, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" MARKET", stringfinal, "Continuar", ""RED" cancelar");
}
ShowSlotsAmmountItems(playerid, index){
	// EMPRESAS
}
finishEditItem(playerid, index, modell){
	new indexItem = selectedIndexItem[playerid];
	printf("indexitem: %i, index: %i, model: %i", indexItem, index, modell);
	if((index != -1) && (modell != -1) && (indexItem != -1)){
		marketData[index][item][indexItem] = modell;
		marketData[index][itemAmmount][indexItem] = 0;
		ShowTDN_OOC(playerid, "Editaste un item");
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
            marketData[i][characterid], marketData[i][doorid], marketData[i][safe], marketData[i][level], marketData[i][type],
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
	        cache_get_value_name_int(i, "type", marketData[i][type]);
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
		ShowTDN_OOC(playerid, "Creaste una negocio, editalo con /editarnegocio");
	}
}

getFreeMarketSlot()
{
    for(new i;i<MAX_MARKETS-1;i++)
    {
        if(marketData[i][listid] == 0) return i;
    }
    return -1;
}

getMarketsByCharacterID(playerid){
	new array[MAX_USER_MARKETS];
	for(new s;s<MAX_USER_MARKETS;s++) array[s] = -1;
	if(characterData[playerid][p_spawn]){
		for(new i, e;i<MAX_USER_MARKETS;i++){
			if(marketData[i][characterid] == characterData[playerid][listid]){
				array[e] = i;
				e++;
			}
		}
		return array;
	}
	return array;
}