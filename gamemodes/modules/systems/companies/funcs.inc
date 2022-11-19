loadCompany(indexx, indexxdoor){
	if(!companyData[indexx][loadedd]){
		if(companyData[indexx][doorid] != -1){
			if(indexxdoor != -1){
				new string[QUERY_MEDIUM];
				if(companyData[indexx][sale] == HOUSE_STATE_ON_SALE){
					format(string, sizeof(string), ""GREY"Empresa en venta "GREEN"$%i"GREY"\n %s \n Direccion: %s \n "GREY"index: %i", companyData[indexx][price], companyModelData[companyData[indexx][type_company]][name], companyData[indexx][direction], indexx);
				} else format(string, sizeof(string), ""GREY" %s \n Direccion: %s", companyModelData[companyData[indexx][type_company]][name], companyData[indexx][direction]);
			    companyData[indexx][labelenter] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, doorsInfo[indexxdoor][enterCoords][0], doorsInfo[indexxdoor][enterCoords][1], doorsInfo[indexxdoor][enterCoords][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexxdoor][doorVw]);
				companyData[indexx][pickupEnter] = CreateDynamicPickup(1239, 1, doorsInfo[indexxdoor][enterCoords][0], doorsInfo[indexxdoor][enterCoords][1], doorsInfo[indexxdoor][enterCoords][2], doorsInfo[indexxdoor][doorVw], -1, -1, 10.0);
				
				companyData[indexx][labelroom] = CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/cambiarme", 0xFFFFFFFF, companyData[indexx][room_pos][0], companyData[indexx][room_pos][1], companyData[indexx][room_pos][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexxdoor][exitVw]);
				companyData[indexx][labeljob1] = CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/craftear", 0xFFFFFFFF, companyData[indexx][job_pos][0], companyData[indexx][job_pos][1], companyData[indexx][job_pos][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexxdoor][exitVw]);
				companyData[indexx][labeljob2] = CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/trabajar", 0xFFFFFFFF, companyData[indexx][job_pos][3], companyData[indexx][job_pos][4], companyData[indexx][job_pos][5], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexxdoor][exitVw]);
				companyData[indexx][labeldispatch1] = CreateDynamic3DTextLabel(""GREY"Despacho salida", 0xFFFFFFFF, companyData[indexx][dispatch_pos][0], companyData[indexx][dispatch_pos][1], companyData[indexx][dispatch_pos][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexxdoor][doorVw]);
				companyData[indexx][labeldispatch2] = CreateDynamic3DTextLabel(""GREY"Despacho entrada", 0xFFFFFFFF, companyData[indexx][dispatch_pos][3], companyData[indexx][dispatch_pos][4], companyData[indexx][dispatch_pos][5], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexxdoor][exitVw]);

				companyData[indexx][loadedd] = true;
			}
		}
	}
}
createCompanie(playerid, COMPANIE_TYPE, doorId){
	new indexx = getFreeCompanySlot();
    if((COMPANIE_TYPE != -1) && (indexx != -1)){
    	new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO companies(doorid, type_company) VALUES ('%d', '%d')", doorId, COMPANIE_TYPE); 
        mysql_pquery(MYSQL_DB, query, "onCreateCompanie", "ddd", playerid, indexx, doorId);
    }
}
destroyDynamicCompany(indexx){
	if(companyData[indexx][loadedd]){

		DestroyDynamic3DTextLabel(companyData[indexx][labelenter]);
		DestroyDynamic3DTextLabel(companyData[indexx][labelroom]);
		DestroyDynamic3DTextLabel(companyData[indexx][labeljob1]);
		DestroyDynamic3DTextLabel(companyData[indexx][labeljob2]);
		DestroyDynamic3DTextLabel(companyData[indexx][labeldispatch1]);
		DestroyDynamic3DTextLabel(companyData[indexx][labeldispatch2]);
		DestroyDynamicPickup(companyData[indexx][pickupEnter]);

		companyData[indexx][loadedd] = false;
	}
}

showCraftMenu(playerid, indexx){
	new indexInventory;
	new string[QUERY_LOW];
	editCompany[playerid] = indexx;
	for(new i;i<6;i++){
		if(companyModelData[companyData[indexx][type_company]][fabItems][i] != -1){
			indexInventory = companyModelData[companyData[indexx][type_company]][fabItems][i];
			format(string, sizeof(string), "%s x1", inventoryModelsData[indexInventory][name]);
			addDialogItem(playerid, inventoryModelsData[indexInventory][model], string);
		}
	}
	ShowPlayerDialogItem(playerid, DIALOG_ITEMS_CRAFT, "Selecciona un objeto", "Craftear");
}
showCraftProductMenu(playerid, emppindexx){
	editCompany[playerid] = emppindexx;
	switch(companyData[emppindexx][type_company]){
		case COMPANIES_TYPE_VEHICLES: showVehiclesMenuCraft(playerid, emppindexx);
	}
}


updateRoomPosition(playerid, indexx, indexxDoorId){
	if(GetPlayerVirtualWorld(playerid) == doorsInfo[indexxDoorId][exitVw]){
		new Float:xX, Float:yY, Float:zZ;
		GetPlayerPos(playerid, xX, yY, zZ);
		companyData[indexx][room_pos][0] = xX;
		companyData[indexx][room_pos][1] = yY;
		companyData[indexx][room_pos][2] = zZ;
		destroyDynamicCompany(indexx);
		loadCompany(indexx, indexxDoorId);
		ShowTDN_OOC(playerid, "Editaste la posicion del ropero.");
		editCompany[playerid] = -1;
	} else {
		editCompany[playerid] = -1;
		ShowTDN_OOC(playerid, "Debes estar en el interior");
	}
}
updateCraftPosition(playerid, indexx, indexxDoorId){
	if(GetPlayerVirtualWorld(playerid) == doorsInfo[indexxDoorId][exitVw]){
		new Float:xX, Float:yY, Float:zZ;
		GetPlayerPos(playerid, xX, yY, zZ);
		companyData[indexx][job_pos][0] = xX;
		companyData[indexx][job_pos][1] = yY;
		companyData[indexx][job_pos][2] = zZ;
		destroyDynamicCompany(indexx);
		loadCompany(indexx, indexxDoorId);
		ShowTDN_OOC(playerid, "Editaste la posicion de crafteo.");
		editCompany[playerid] = -1;
	} else {
		editCompany[playerid] = -1;
		ShowTDN_OOC(playerid, "Debes estar en el interior");
	}
}
updateJobPosition(playerid, indexx, indexxDoorId){
	if(GetPlayerVirtualWorld(playerid) == doorsInfo[indexxDoorId][exitVw]){
		new Float:xX, Float:yY, Float:zZ;
		GetPlayerPos(playerid, xX, yY, zZ);
		companyData[indexx][job_pos][3] = xX;
		companyData[indexx][job_pos][4] = yY;
		companyData[indexx][job_pos][5] = zZ;
		destroyDynamicCompany(indexx);
		loadCompany(indexx, indexxDoorId);
		ShowTDN_OOC(playerid, "Editaste la posicion de trabajo.");
		editCompany[playerid] = -1;
	} else {
		editCompany[playerid] = -1;
		ShowTDN_OOC(playerid, "Debes estar en el interior");
	}
}

updateDispatchIntPosition(playerid, indexx, indexxDoorId){
	if(GetPlayerVirtualWorld(playerid) == doorsInfo[indexxDoorId][exitVw]){
		new Float:xX, Float:yY, Float:zZ;
		GetPlayerPos(playerid, xX, yY, zZ);
		companyData[indexx][dispatch_pos][0] = xX;
		companyData[indexx][dispatch_pos][1] = yY;
		companyData[indexx][dispatch_pos][2] = zZ;
		destroyDynamicCompany(indexx);
		loadCompany(indexx, indexxDoorId);
		ShowTDN_OOC(playerid, "Editaste la posicion del despacho Interior.");
		editCompany[playerid] = -1;
	} else {
		editCompany[playerid] = -1;
		ShowTDN_OOC(playerid, "Debes estar en el interior");
	}
}
updateDispatchExtPosition(playerid, indexx, indexxDoorId){
	if(GetPlayerVirtualWorld(playerid) == doorsInfo[indexxDoorId][doorVw]){
		new Float:xX, Float:yY, Float:zZ;
		GetPlayerPos(playerid, xX, yY, zZ);
		companyData[indexx][dispatch_pos][3] = xX;
		companyData[indexx][dispatch_pos][4] = yY;
		companyData[indexx][dispatch_pos][5] = zZ;
		destroyDynamicCompany(indexx);
		loadCompany(indexx, indexxDoorId);
		ShowTDN_OOC(playerid, "Editaste la posicion del despacho Exterior.");
		editCompany[playerid] = -1;
	} else {
		editCompany[playerid] = -1;
		ShowTDN_OOC(playerid, "Debes estar en el exterior");
	}
}
getFreeCompanySlot()
{
    for(new i;i<MAX_COMPANIES-1;i++)
    {
        if(companyData[i][listid] == 0) return i;
    }
    return -1;
}

getCompaniesByCharacterID(playerid){
	new array[MAX_USER_COMPANIES];
	for(new s;s<MAX_USER_COMPANIES;s++) array[s] = -1;
	if(characterData[playerid][p_spawn]){
		for(new i, e;i<MAX_COMPANIES;i++){
			if(companyData[i][characterid] == characterData[playerid][listid]){
				array[e] = i;
				e++;
				if(e > MAX_USER_COMPANIES) break;
			}
		}
		return array;
	}
	return array;
}

sendMemberMessageComapanyId(idd, const mssgg[]){
	for(new i;i<MAX_PLAYERS;i++){
		if(IsPlayerConnected(i)){
			if(characterData[i][p_spawn]){
				if(characterData[i][biz] == idd){
					SendClientMessage(i, -1, mssgg);
				}
			}
		}
	}
}

sellCompanieCharacterId(playerid, index){
	if(index != -1){
		new doorIndex = getIndexDoorByID(companyData[index][doorid]);
		if(doorIndex != -1){
			if(companyData[index][characterid] > 0){
				new bool:isconnected = false;
				for(new i;i<MAX_PLAYERS; i++){
					if(characterData[i][listid] == companyData[index][characterid]){
						isconnected = true;
						companyData[index][characterid] = characterData[playerid][listid];
						doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
						companyData[index][sale] = HOUSE_STATE_PURCHASE;
						destroyDynamicCompany(index);
						loadCompany(index, doorIndex);
						takeCharacterMoney(playerid, companyData[index][price]);
						giveCharacterMoney(i, companyData[index][price]);
						ShowTDN_OOC(playerid, "Compraste una empresa!");
					}
				}
				if(!isconnected){
					new query[QUERY_MEDIUM];
        			mysql_format(MYSQL_DB, query, sizeof(query), "SELECT money FROM characters WHERE listid = '%i' LIMIT 1", companyData[index][characterid]);
        			mysql_pquery(MYSQL_DB, query, "onGetMoneyCharacterCompanyID", "ddd", playerid, index, doorIndex);
				}
			} else {
				companyData[index][characterid] = characterData[playerid][listid];
				doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
				companyData[index][sale] = HOUSE_STATE_PURCHASE;
				destroyDynamicCompany(index);
				loadCompany(index, doorIndex);
				takeCharacterMoney(playerid, marketData[index][price]);
				ShowTDN_OOC(playerid, "Compraste una empresa!");
			}
		}
	}
}
forward onGetMoneyCharacterCompanyID(playerid, index, doorIndex);
public onGetMoneyCharacterCompanyID(playerid, index, doorIndex){
	if(cache_num_rows()){
		new moneyy, query[QUERY_LOW];
		cache_get_value_name_int(0, "money", moneyy);
		mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE characters SET `money`='%d' WHERE listid = '%d' LIMIT 1", moneyy + companyData[index][price], companyData[index][listid]);
		mysql_query(MYSQL_DB, query);
		companyData[index][characterid] = characterData[playerid][listid];
		companyData[index][sale] = HOUSE_STATE_PURCHASE;
		DestroyDynamicMarket(index);
		loadMarket(index, doorIndex);
		doorsInfo[doorIndex][characterID] = characterData[playerid][listid];
		takeCharacterMoney(playerid, companyData[index][price]);
		ShowTDN_OOC(playerid, "Compraste una empresa!");
	}
}
saveCompanies(){
    new query[QUERY_LONG];
    for(new i; i<MAX_COMPANIES;i++){
        if(companyData[i][listid] > 0){
            mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE companies SET `characterid`='%d', `name`='%e', `type_company`='%d', `price`='%d', `doorid`='%d', `garajedoorid`='%d', \
            `direction`='%e', `jobskin1`='%d', `jobskin2`='%d', `safe`='%d', `sale`='%d', \
            `room1`='%f', `room2`='%f', `room3`='%f', `job1`='%f', `job2`='%f', `job3`='%f', `job4`='%f', `job5`='%f', `job6`='%f',\
           	`dispatch1`='%f', `dispatch2`='%f', `dispatch3`='%f', `dispatch4`='%f', `dispatch5`='%f', `dispatch6`='%f' WHERE listid = '%d' LIMIT 1",
           	companyData[i][characterid], companyData[i][name], companyData[i][type_company], companyData[i][price],
           	companyData[i][doorid], companyData[i][garajedoorid], companyData[i][direction], companyData[i][jobs_skins][0], companyData[i][jobs_skins][1],
           	companyData[i][safe], companyData[i][sale], companyData[i][room_pos][0], companyData[i][room_pos][1], companyData[i][room_pos][2],
           	companyData[i][job_pos][0], companyData[i][job_pos][1], companyData[i][job_pos][2], companyData[i][job_pos][3], companyData[i][job_pos][4], companyData[i][job_pos][5],
           	companyData[i][dispatch_pos][0], companyData[i][dispatch_pos][1], companyData[i][dispatch_pos][2], companyData[i][dispatch_pos][3], companyData[i][dispatch_pos][4], companyData[i][dispatch_pos][5],
           	companyData[i][listid]);
            mysql_query(MYSQL_DB, query);
        }
    }
}
forward loadCompanies();
public loadCompanies(){
    if(cache_num_rows()){
    	new indexdoor;
        for(new i=0;i<cache_num_rows();i++){ 
            cache_get_value_name_int(i, "listid", companyData[i][listid]);
	       	cache_get_value_name_int(i, "characterid", companyData[i][characterid]);
	       	cache_get_value_name(i, "name", companyData[i][name]);
	       	cache_get_value_name_int(i, "type_company", companyData[i][type_company]);
	       	cache_get_value_name_int(i, "price", companyData[i][price]);
	        cache_get_value_name_int(i, "doorid", companyData[i][doorid]);
	        cache_get_value_name_int(i, "garajedoorid", companyData[i][garajedoorid]);
	       	cache_get_value_name(i, "direction", companyData[i][direction]);
	        cache_get_value_name_int(i, "jobskin1", companyData[i][jobs_skins][0]);
	        cache_get_value_name_int(i, "jobskin2", companyData[i][jobs_skins][1]);
	        cache_get_value_name_int(i, "safe", companyData[i][safe]);
	        cache_get_value_name_int(i, "sale", companyData[i][sale]);


	        cache_get_value_name_float(i, "room1", companyData[i][room_pos][0]);
	        cache_get_value_name_float(i, "room2", companyData[i][room_pos][1]);
	        cache_get_value_name_float(i, "room3", companyData[i][room_pos][2]);

	        cache_get_value_name_float(i, "job1", companyData[i][job_pos][0]);
	        cache_get_value_name_float(i, "job2", companyData[i][job_pos][1]);
	        cache_get_value_name_float(i, "job3", companyData[i][job_pos][2]);
	        cache_get_value_name_float(i, "job4", companyData[i][job_pos][3]);
	        cache_get_value_name_float(i, "job5", companyData[i][job_pos][4]);
	        cache_get_value_name_float(i, "job6", companyData[i][job_pos][5]);

	        cache_get_value_name_float(i, "dispatch1", companyData[i][dispatch_pos][0]);
	        cache_get_value_name_float(i, "dispatch2", companyData[i][dispatch_pos][1]);
	        cache_get_value_name_float(i, "dispatch3", companyData[i][dispatch_pos][2]);
	        cache_get_value_name_float(i, "dispatch4", companyData[i][dispatch_pos][3]);
	        cache_get_value_name_float(i, "dispatch5", companyData[i][dispatch_pos][4]);
	        cache_get_value_name_float(i, "dispatch6", companyData[i][dispatch_pos][5]);
	        
			destroyDynamicCompany(i);
			indexdoor = getIndexDoorByID(companyData[i][doorid]);
			if(indexdoor != -1){
	            loadCompany(i, indexdoor);
            }
        }
    }
}

forward onCreateCompanie(playerid, index, doorId);
public onCreateCompanie(playerid, index, doorId){
	new indexdoor = getIndexDoorByID(doorId); 
	if(indexdoor != -1){
		companyData[index][price] = 15000;
		format(companyData[index][direction], 40, "Completar");
		companyData[index][doorid] = doorId;
		companyData[index][listid] = cache_insert_id();
		destroyDynamicCompany(index);
		loadCompany(index, indexdoor);
		loadDoor(indexdoor);
		ShowTDN_OOC(playerid, "Creaste una empressa, editalo con /editarempresa");
	}
}
showProgressCrafting(playerid, indexx){
	new companieIndex = craftingData[indexx][companieid];
	new indexCompanieInventory, stringgg[QUERY_MEDIUM], stringtwo[QUERY_LOW];
	for(new i;i<6;i++){
		if(companyModelData[companyData[companieIndex][type_company]][fabItems][i] > 0){
			indexCompanieInventory = companyModelData[companyData[companieIndex][type_company]][fabItems][i];
			format(stringtwo, sizeof(stringtwo), "%s (x%i), Tienes: %i \n", inventoryModelsData[indexCompanieInventory][name], companyModelData[companyData[companieIndex][type_company]][fabItemsAmmount][i], craftingData[indexx][crafting][i]);
			strcat(stringgg, stringtwo);
		}
	}
	ShowPlayerDialog(playerid, DIALOG_CRAFT_COMPANY_PRODUCT, DIALOG_STYLE_LIST, "Necesitas los siguientes objetos:", stringgg, "Agregar", ""RED" cancelar");
}
createCrafting(playerid, typess, modell, companiieid, pricee, ammts){
	new indexx = getFreeCraftingIndex();
	if(indexx != -1){
		craftingData[indexx][characterid] = characterData[playerid][listid];
		for(new i;i<6;i++){
			craftingData[indexx][crafting][i] = 0;
		}
		craftingData[indexx][modeel] = modell;
		craftingData[indexx][ammount] = ammts;
		craftingData[indexx][type_crafting] = typess;
		craftingData[indexx][companieid] = companiieid;
		craftingData[indexx][price] = pricee;
		craftingData[indexx][progress] = 0;
		showProgressCrafting(playerid, indexx);

	} else ShowTDN_OOC(playerid, "No se puede producir ahora.");
	return indexx;
}
craftingIsReady(playerid, indexx){
	new companieIndex = craftingData[indexx][companieid];
	new bool:status = true;
	for(new i;i<6;i++){
		if(companyModelData[companyData[companieIndex][type_company]][fabItemsAmmount][i] != -1){
			if(craftingData[indexx][crafting][i] < companyModelData[companyData[companieIndex][type_company]][fabItemsAmmount][i]) status = false;
		}
	}
	if(status){
		createTrade(companyData[companieIndex][listid], craftingData[indexx][modeel], craftingData[indexx][ammount], craftingData[indexx][type_crafting], craftingData[indexx][price], TRADE_STATE_ONSELL, false);
		ShowTDN_OOC(playerid, "Agregaste un producto al mercado.");
		deleteCrafting(indexx);
	}
}
deleteCrafting(index){
	craftingData[index][characterid] = 0;
	craftingData[index][modeel] = 0;
	craftingData[index][ammount] = 0;
	craftingData[index][companieid] = 0;
	craftingData[index][price] = 0;
	craftingData[index][progress] = 0;
}

getActiveCraftingIndex(playerid){
	for(new i;i<MAX_CRAFTINGS;i++){
		if(craftingData[i][characterid] == characterData[playerid][listid]) {
			return i;
		}
		
	}
	return -1;
}
getFreeCraftingIndex(){
	for(new i;i<MAX_CRAFTINGS;i++){
		if(craftingData[i][characterid] == 0){
			return i;
		}
	}
	return -1;
}