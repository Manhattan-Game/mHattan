showInventory(playerid)
{
	if(characterData[playerid][p_spawn] == true)
	{

		for(new i; i<8;i++)
		{
			PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][i], inventoryModelsData[inventoryInfo[playerid][slot][i]][model]);
			PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][i], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][3]);
		}
		PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][11], inventoryModelsData[inventoryInfo[playerid][slot][8]][model]);
		PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][11], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][3]);
		



		for(new j;j<13;j++) PlayerTextDrawShow(playerid, inventarioTDD[playerid][j]);
		TextDrawShowForPlayer(playerid, inventarioTD);
		SelectTextDraw(playerid, 0x87868286);
		selectTextDraw(playerid, inventoryInfo[playerid][selectedIndex]);
		characterData[playerid][viewTextdraw] = TEXTDRAWS_INVENTORY;
	}
}
hideInventory(playerid)
{
	if(characterData[playerid][p_spawn] == true && characterData[playerid][viewTextdraw] == TEXTDRAWS_INVENTORY)
	{
		for(new j;j<13;j++) PlayerTextDrawHide(playerid, inventarioTDD[playerid][j]);
		TextDrawHideForPlayer(playerid, inventarioTD);
		CancelSelectTextDraw(playerid);
		characterData[playerid][viewTextdraw] = 0;
	}
}
selectTextDraw(playerid, newindex){
	new string[300];
	new oldIndex = inventoryInfo[playerid][selectedIndex];
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][oldIndex], 673720575);
	PlayerTextDrawShow(playerid, inventarioTDD[playerid][oldIndex]);
	inventoryInfo[playerid][selectedIndex] = newindex;
	format(string, 300, "Nombre:__%s  Informacion:_%s", inventoryModelsData[inventoryInfo[playerid][slot][newindex]][name], inventoryModelsData[inventoryInfo[playerid][slot][newindex]][description]);
	PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][newindex], 473720575);
	PlayerTextDrawShow(playerid, inventarioTDD[playerid][newindex]);
}
addItem(playerid, itemid, ammountt){

	for(new i=0; i<8; i++){
		if(inventoryInfo[playerid][slot][i] == 0)
		{
			inventoryInfo[playerid][slot][i] = itemid;
			inventoryInfo[playerid][ammount][i] = ammountt;
			updateInventory(playerid, i);
			return i;
		}
		if(i == 8) ShowTDN_IC(playerid, "No tienes un slot disponible.");
	}
	return -1;
}
removeItem(playerid, index){
	inventoryInfo[playerid][slot][index] = 0;
	inventoryInfo[playerid][ammount][index] = 0;
	updateInventory(playerid, index);
}
useItem(playerid, index){
	if(inventoryInfo[playerid][slot][index] > 0){
		inventoryInfo[playerid][slot][8] = inventoryInfo[playerid][slot][index];
		inventoryInfo[playerid][ammount][8] = inventoryInfo[playerid][ammount][index];
		updateInventory(playerid, 11);
		removeItem(playerid, index);
		updateInventory(playerid, index);
		updateHandItem(playerid);
		//useAnimationItem(playerid, 8);
	} else ShowTDN_OOC(playerid, "No tienes un objeto en este indice.");
}

saveUseItem(playerid){
	if(inventoryInfo[playerid][slot][8] > 0){
		RemovePlayerAttachedObject(playerid, 0);
		switch(inventoryModelsData[inventoryInfo[playerid][slot][8]][type]){
			case TYPE_GUNS: ResetPlayerWeapons(playerid);
			case TYPE_FOOD: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}

		addItem(playerid, inventoryInfo[playerid][slot][8], inventoryInfo[playerid][ammount][8]);
		removeItem(playerid, 8);
		updateInventory(playerid, 11);
		updateHandItem(playerid);
	} else ShowTDN_OOC(playerid, "No tienes un objeto en mano.");
}
updateInventory(playerid, i){
	new oldindex = i;
	if(characterData[playerid][viewTextdraw] == TEXTDRAWS_INVENTORY){
		if(i == 11) i = 8;
		PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][oldindex], inventoryModelsData[inventoryInfo[playerid][slot][i]][model]);
		PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][oldindex], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][3]);
		PlayerTextDrawShow(playerid, inventarioTDD[playerid][oldindex]);
	}
}
getDropItem(playerid){
	if(characterData[playerid][p_spawn]){
		for(new i=0; i<MAX_DROPPED_ITEMS; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2, droppedObjects[i][x], droppedObjects[i][y], droppedObjects[i][z]))
			{
				if(characterData[playerid][world] == droppedObjects[i][vw])
				{
					if(addItem(playerid, droppedObjects[i][model], droppedObjects[i][ammount]) != -1){
						DestroyDynamicObject(droppedObjects[i][objectID]);
						DestroyDynamic3DTextLabel(droppedObjects[i][labelID]);
						ShowTDN_OOC(playerid, "Agarraste un objeto del suelo");
						droppedObjects[i][x] = 0;
						droppedObjects[i][y] = 0;
						droppedObjects[i][z] = 0;
						droppedObjects[i][model] = 0;
						droppedObjects[i][ammount] = 0;
						droppedObjects[i][vw] = 0;
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop", 4.0,0,0,0,0,0);
						break;
					} else{
						ShowTDN_OOC(playerid, "No tienes un slot disponible");
						break;
					}
				}
			}
		}
	}
}
dropItem(playerid, index){
	new string[80];
	if(inventoryInfo[playerid][slot][index] > 0)
	{
		for(new i;i<MAX_DROPPED_ITEMS; i++)
		{
			if(droppedObjects[i][model] == 0)
			{
				new Float:coordX, Float:coordY, Float:coordZ;
				GetPlayerPos(playerid, coordX, coordY, coordZ);
				format(string, 80, ""GREY"Pulsa "ORANGE"C"GREY" para recoger \n"WHITE" (%s)", inventoryModelsData[inventoryInfo[playerid][slot][index]][name]);
				droppedObjects[i][x] = coordX;
				droppedObjects[i][y] = coordY;
				droppedObjects[i][z] = coordZ;
				droppedObjects[i][model] = inventoryInfo[playerid][slot][index];
				droppedObjects[i][ammount] = inventoryInfo[playerid][ammount][index];
				droppedObjects[i][vw] = GetPlayerVirtualWorld(playerid);
				droppedObjects[i][objectID] =	CreateDynamicObject(inventoryModelsData[inventoryInfo[playerid][slot][index]][model], coordX, coordY, coordZ-0.8, 90.0, 90.0, 0.0, droppedObjects[i][vw], -1, -1, 15);
				droppedObjects[i][labelID] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, coordX, coordY, coordZ-0.8, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);				
				removeItem(playerid, index);
				updateInventory(playerid, index);
				break;
			}
		}
	} else ShowTDN_OOC(playerid, "No tienes un objeto en este indice.");
}

createInventory(characterMkid){
		new query[QUERY_LONG];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO inventory(characterid, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, amount1, amount2, amount3, amount4, amount5, amount6, amount7, amount8, amount9) VALUES ('%d', 0, 0, 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0)", characterMkid); 
        mysql_pquery(MYSQL_DB, query);

}
loadInventoryByID(playerid, characterIDd){
        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "SELECT * FROM inventory WHERE characterid = '%d' LIMIT 1", characterIDd);
        mysql_pquery(MYSQL_DB, query, "loadInventory", "d", playerid);
}
forward loadInventory(playerid);
public loadInventory(playerid){
    if(cache_num_rows()){
       	cache_get_value_name_int(0, "listid", inventoryInfo[playerid][listid]);
        cache_get_value_name_int(0, "characterid", characterData[playerid][mkid]);

        cache_get_value_name_int(0, "slot1", inventoryInfo[playerid][slot][0]);
        cache_get_value_name_int(0, "slot2", inventoryInfo[playerid][slot][1]);
        cache_get_value_name_int(0, "slot3", inventoryInfo[playerid][slot][2]);
        cache_get_value_name_int(0, "slot4", inventoryInfo[playerid][slot][3]);
        cache_get_value_name_int(0, "slot5", inventoryInfo[playerid][slot][4]);
        cache_get_value_name_int(0, "slot6", inventoryInfo[playerid][slot][5]);
        cache_get_value_name_int(0, "slot7", inventoryInfo[playerid][slot][6]);
        cache_get_value_name_int(0, "slot8", inventoryInfo[playerid][slot][7]);
        cache_get_value_name_int(0, "slot9", inventoryInfo[playerid][slot][8]);

        cache_get_value_name_int(0, "amount1", inventoryInfo[playerid][ammount][0]);
        cache_get_value_name_int(0, "amount2", inventoryInfo[playerid][ammount][1]);
        cache_get_value_name_int(0, "amount3", inventoryInfo[playerid][ammount][2]);
        cache_get_value_name_int(0, "amount4", inventoryInfo[playerid][ammount][3]);
        cache_get_value_name_int(0, "amount5", inventoryInfo[playerid][ammount][4]);
        cache_get_value_name_int(0, "amount6", inventoryInfo[playerid][ammount][5]);
        cache_get_value_name_int(0, "amount7", inventoryInfo[playerid][ammount][6]);
        cache_get_value_name_int(0, "amount8", inventoryInfo[playerid][ammount][7]);
        cache_get_value_name_int(0, "amount9", inventoryInfo[playerid][ammount][8]);

        if(inventoryInfo[playerid][slot][8] > 0) updateHandItem(playerid);
    }
}
saveInventory(playerid){
    if(characterData[playerid][p_spawn] == true){
        new query[QUERY_LONG];
        mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE inventory SET `slot1`='%d', `slot2`='%d', `slot3`='%d', `slot4`='%d', `slot5`='%d', `slot6`='%d', `slot7`='%d', `slot8`='%d', `slot9`='%d', \
        `amount1`='%d', `amount2`='%d', `amount3`='%d', `amount4`='%d', `amount5`='%d', `amount6`='%d', `amount7`='%d', `amount8`='%d', `amount9`='%d' WHERE listid = '%d' LIMIT 1",
        	inventoryInfo[playerid][slot][0],
        	inventoryInfo[playerid][slot][1],
        	inventoryInfo[playerid][slot][2],
        	inventoryInfo[playerid][slot][3],
        	inventoryInfo[playerid][slot][4],
        	inventoryInfo[playerid][slot][5],
        	inventoryInfo[playerid][slot][6],
        	inventoryInfo[playerid][slot][7],
        	inventoryInfo[playerid][slot][8],
        	inventoryInfo[playerid][ammount][0],
        	inventoryInfo[playerid][ammount][1],
        	inventoryInfo[playerid][ammount][2],
        	inventoryInfo[playerid][ammount][3],
        	inventoryInfo[playerid][ammount][4],
        	inventoryInfo[playerid][ammount][5],
        	inventoryInfo[playerid][ammount][6],
        	inventoryInfo[playerid][ammount][7],
        	inventoryInfo[playerid][ammount][8],
        	inventoryInfo[playerid][listid]
        );
        mysql_pquery(MYSQL_DB, query);
    }
}