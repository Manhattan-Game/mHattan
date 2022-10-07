loadCompany(indexx, indexxdoor){
	if(!companyData[indexx][loadedd]){
		if(companyData[indexx][doorid] != -1){
			if(indexxdoor != -1){
				new string[QUERY_MEDIUM];
				if(companyData[indexx][sale] == HOUSE_STATE_ON_SALE){
					format(string, sizeof(string), ""GREY"Empresa en venta "GREEN"$%i"GREY"\n %s \n Direccion: %s \n "GREY"indexx: %i", companyData[indexx][price], companyModelData[companyData[indexx][type_company]][name], indexx);
				} else format(string, sizeof(string), ""GREY" %s \n Direccion: %s", companyModelData[companyData[indexx][type_company]][name], marketData[indexx][direction]);
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