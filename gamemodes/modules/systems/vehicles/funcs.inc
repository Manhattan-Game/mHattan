// kilometraje, a parte de tanto es deterioro + restauracion
// guiñes
// tunnin objetos
// desgaste de llantas
// BAul
Float:GetVehicleSpeed(vehid){
	new Float:xx, Float:yy, Float:zz, Float:total;
	GetVehicleVelocity(vehid, xx, yy, zz);
	total = floatround( floatsqroot( xx*xx + yy*yy + zz*zz ) * 200 );
	return total;
}
bool:getVehicleParamState(param){
	if(param == VEHICLE_PARAMS_ON){
		return true;
	}
	return false;
}

showVelocimeter(playerid, index){
	if(characterData[playerid][p_spawn]){
		if(IsValidVehicle(vehicleData[index][vehicleidd])){
			for(new e;e<7;e++) TextDrawShowForPlayer(playerid, velocimeter_TD[e]);
			for(new i;i<8;i++) PlayerTextDrawShow(playerid, velocimeter_PTD[playerid][i]);
			updateVelocimeterVelocity(playerid, index);
			updateVelocimeterKilometres(playerid, index);
			updateVelocimeterLigths(playerid, getVehicleParamState(vehicleData[index][lightss]));
			updateVelocimeterDoor(playerid, getVehicleParamState(vehicleData[index][doorr]));
			updateVelocimeterWindows(playerid, index);
			createProgressBar(playerid, BAR_V_GAS, 509.736724, 417.500122, 559.000000, 0.207907, -1061109505, vehiclesModelData[vehicleData[index][model]][gas_limit], 0);
			createProgressBar(playerid, BAR_V_OIL, 509.736724, 430.333465, 559.000000, 0.207907, -2139094785, 100.0, 0);
			updateVelocimeterGas(playerid, index);
			updateVelocimeterOil(playerid, index);
		}
	}
}
hideVelocimeter(playerid){
	destroyProgressBar(playerid, BAR_V_GAS);
	destroyProgressBar(playerid, BAR_V_OIL);
	for(new e;e<7;e++) TextDrawHideForPlayer(playerid, velocimeter_TD[e]);
	for(new i;i<8;i++) PlayerTextDrawHide(playerid, velocimeter_PTD[playerid][i]);
}
updateVelocimeterVelocity(playerid, index){
	new Float:speed = GetVehicleSpeed(vehicleData[index][vehicleidd]);
	new string[QUERY_LOW];
	format(string, sizeof(string), "%.0f_km/h", speed);
	PlayerTextDrawSetString(playerid, velocimeter_PTD[playerid][7], string);
}
/*updateVelocimeterVehicleName(playerid, index){
	new string[15];
	format(string, sizeof(string), "%s", vehiclesModelData[vehicleData[index][model]][name]);
	PlayerTextDrawSetString(playerid, velocimeter_PTD[playerid][1], string);
}*/
updateVelocimeterWindows(playerid, index){
	new bool:param = false;
	for(new e;e<4;e++){
		if(vehicleData[index][windows][e] == CAR_WINDOW_OPEN){
			param = true;
			break;
		}
	}
	if(param){
		PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][2], 54473727);
	} else PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][2], 589505535);
	PlayerTextDrawShow(playerid, velocimeter_PTD[playerid][2]);
}
updateVelocimeterGas(playerid, index){
	updateProgressBar(playerid, BAR_V_GAS, vehicleData[index][gas]);
}
updateVelocimeterOil(playerid, index){
	updateProgressBar(playerid, BAR_V_OIL, vehicleData[index][oil]);
}
updateVelocimeterLigths(playerid, bool:param){
	if(param){
		PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][1], 54473727);
	} else PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][1], 589505535);
	PlayerTextDrawShow(playerid, velocimeter_PTD[playerid][1]);
}
updateVelocimeterDoor(playerid, bool:param){
	if(param){
		PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][0], 54473727);
	} else PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][0], 589505535);
	PlayerTextDrawShow(playerid, velocimeter_PTD[playerid][0]);
}
updateVelocimeterKilometres(playerid, index){
	new string[QUERY_LOW];
	format(string, sizeof(string), "000%i", vehicleData[index][kilometres]);
	PlayerTextDrawSetString(playerid, velocimeter_PTD[playerid][6], string);
}
loadVehicle(index){
	if(index != -1 && vehicleData[index][model] > 0){
		vehicleData[index][vehicleidd] = CreateVehicle(vehiclesModelData[vehicleData[index][model]][model], vehicleData[index][position][0], vehicleData[index][position][1], vehicleData[index][position][2], vehicleData[index][position][3], vehicleData[index][color1], vehicleData[index][color2], 600000);
		SetVehicleVirtualWorld(vehicleData[index][vehicleidd], vehicleData[index][vehicle_vw]);
		SetVehicleHealth(vehicleData[index][vehicleidd], vehicleData[index][vehicle_life]);
		setEngine(-2, index, getVehicleParamState(vehicleData[index][enginee]));
		setLights(-2, index, getVehicleParamState(vehicleData[index][lightss]));
		setAlarm(-2, index, getVehicleParamState(vehicleData[index][alarmm]));
		setDoors(-2, index, getVehicleParamState(vehicleData[index][doorr]));
		setBonnet(-2, index, getVehicleParamState(vehicleData[index][bonnett]));
		setBoot(-2, index, getVehicleParamState(vehicleData[index][boott]));
		SetVehicleParamsCarWindows(vehicleData[index][vehicleidd], vehicleData[index][windows][0], vehicleData[index][windows][1], vehicleData[index][windows][2], vehicleData[index][windows][3]);
	}
}

isPermissionVehicle(playerid, vid){
	new index = getVehicleIndexById(vid);
	if(index != -1)
		if(vehicleData[index][characterid] == characterData[playerid][listid]) 
			return true;
	return false;
}
getVehicleIndexById(vid){
	for(new i;i<MAX_VEHICLES; i++){
		if(vehicleData[i][vehicleidd] == vid) return i;
	}
	return -1;
}
getVehicleFreeSlot(){
	for(new i;i<MAX_VEHICLES; i++){
		if(vehicleData[i][listid] < 1) return i;
	}
	return -1;
}
forward updateVehicleGas(playerid, index);
public updateVehicleGas(playerid, index){
	if(characterData[playerid][p_spawn]){
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			vehicleData[index][distanceAmmount]++;
			if(vehicleData[index][distanceAmmount] > OIL_UPDATED){
				vehicleData[index][distanceAmmount] = 0;
				if(vehicleData[index][oil] < 1){
					setEngine(-2, index, false);
					KillPlayerTimer(vehicleData[index][timergas]);
					ShowTDN_IC(playerid, "No tienes aceite.");
				} else vehicleData[index][oil] -= (CONSUME_PER_KILOMETER * vehiclesModelData[vehicleData[index][model]][consume]) / 100;
			}
			if(vehicleData[index][gas] < 1){
					setEngine(-2, index, false);
					KillPlayerTimer(vehicleData[index][timergas]);
					ShowTDN_IC(playerid, "No tienes gasolina.");
			} else vehicleData[index][gas] -= (CONSUME_PER_KILOMETER * vehiclesModelData[vehicleData[index][model]][consume]) / 100;
		}
	}
}

setWindowDriver(playerid, index, param){
	if(playerid != -2)
	if(param == CAR_WINDOW_CLOSE){
		param = CAR_WINDOW_OPEN;
		ShowTDN_IC(playerid, "Abriste la ventana.");
	} else {
		param = CAR_WINDOW_CLOSE;
		ShowTDN_IC(playerid, "Cerraste la ventana.");
	}
	new driver, passenger, backleft, backright;
	GetVehicleParamsCarWindows(vehicleData[index][vehicleidd], driver, passenger, backleft, backright);
	SetVehicleParamsCarWindows(vehicleData[index][vehicleidd], param, passenger, backleft, backright);
	vehicleData[index][windows][0] = param;
	updateVelocimeterWindows(playerid, index);
}
setWindowPassenger(playerid, index, param){
	if(playerid != -2)
	if(param == CAR_WINDOW_CLOSE){
		param = CAR_WINDOW_OPEN;
		ShowTDN_IC(playerid, "Abriste la ventana.");
	} else {
		param = CAR_WINDOW_CLOSE;
		ShowTDN_IC(playerid, "Cerraste la ventana.");
	}
	new driver, passenger, backleft, backright;
	GetVehicleParamsCarWindows(vehicleData[index][vehicleidd], driver, passenger, backleft, backright);
	SetVehicleParamsCarWindows(vehicleData[index][vehicleidd], driver, param, backleft, backright);
	vehicleData[index][windows][1] = param;
	updateVelocimeterWindows(playerid, index);
}
setWindowBackleft(playerid, index, param){
	if(playerid != -2)
	if(param == CAR_WINDOW_CLOSE){
		param = CAR_WINDOW_OPEN;
		ShowTDN_IC(playerid, "Abriste la ventana.");
	} else {
		param = CAR_WINDOW_CLOSE;
		ShowTDN_IC(playerid, "Cerraste la ventana.");
	}
	new driver, passenger, backleft, backright;
	GetVehicleParamsCarWindows(vehicleData[index][vehicleidd], driver, passenger, backleft, backright);
	SetVehicleParamsCarWindows(vehicleData[index][vehicleidd], driver, passenger, param, backright);
	vehicleData[index][windows][2] = param;
	updateVelocimeterWindows(playerid, index);
}
setWindowBackright(playerid, index, param){
	if(playerid != -2)
	if(param == CAR_WINDOW_CLOSE){
		param = CAR_WINDOW_OPEN;
		ShowTDN_IC(playerid, "Abriste la ventana.");
	} else {
		param = CAR_WINDOW_CLOSE;
		ShowTDN_IC(playerid, "Cerraste la ventana.");
	}
	new driver, passenger, backleft, backright;
	GetVehicleParamsCarWindows(vehicleData[index][vehicleidd], driver, passenger, backleft, backright);
	SetVehicleParamsCarWindows(vehicleData[index][vehicleidd], driver, passenger, backleft, param);
	vehicleData[index][windows][3] = param;
	updateVelocimeterWindows(playerid, index);
}

setEngine(playerid, index, param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
			vehicleData[index][enginee] = VEHICLE_PARAMS_ON;

			if(playerid != -2) {
				vehicleData[index][timergas] = SetPlayerTimerEx(playerid, "updateVehicleGas", GAS_TIME_UPDATED, 1, "dd", playerid, index);
				ShowTDN_IC(playerid, "Encendiste el motor.");
			}
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
			vehicleData[index][enginee] = VEHICLE_PARAMS_OFF;
			if(playerid != -2) {
				KillPlayerTimer(vehicleData[index][timergas]);
				ShowTDN_IC(playerid, "Apagaste el motor.");
			}
		}
	}
}

setLights(playerid, index, param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
			vehicleData[index][lightss] = VEHICLE_PARAMS_ON;
			if(playerid != -2) {
				ShowTDN_IC(playerid, "Encendiste las luces.");
				if(inVehicle[playerid] != -1) updateVelocimeterLigths(playerid, true);
			}
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
			vehicleData[index][lightss] = VEHICLE_PARAMS_OFF;
			if(playerid != -2) {
				ShowTDN_IC(playerid, "Apagaste las luces.");
				if(inVehicle[playerid] != -1) updateVelocimeterLigths(playerid, false);
			}
		}
	}
}

setAlarm(playerid, index, param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, VEHICLE_PARAMS_ON, doors, bonnet, boot, objective);
			vehicleData[index][alarmm] = VEHICLE_PARAMS_ON;
			if(playerid != -2) ShowTDN_IC(playerid, "Encendiste la alarma.");
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, VEHICLE_PARAMS_OFF, doors, bonnet, boot, objective);
			vehicleData[index][alarmm] = VEHICLE_PARAMS_OFF;
			if(playerid != -2) ShowTDN_IC(playerid, "Apagaste la alarma.");
		}
	}
}

setDoors(playerid, index, param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
			vehicleData[index][doorr] = VEHICLE_PARAMS_ON;
			if(playerid != -2) {
				ShowTDN_IC(playerid, "Cerraste las puertas.");
				if(inVehicle[playerid] != -1) updateVelocimeterDoor(playerid, true);
			}
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
			vehicleData[index][doorr] = VEHICLE_PARAMS_OFF;
			if(playerid != -2) {
				ShowTDN_IC(playerid, "Abriste las puertas.");
				if(inVehicle[playerid] != -1) updateVelocimeterDoor(playerid, false);
			}
		}
	}
}

setBonnet(playerid, index, param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
			vehicleData[index][bonnett] = VEHICLE_PARAMS_ON;
			if(playerid != -2) ShowTDN_IC(playerid, "Abriste el capo.");
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
			vehicleData[index][bonnett] = VEHICLE_PARAMS_OFF;
			if(playerid != -2) ShowTDN_IC(playerid, "Cerraste el capo.");
		}
	}
}

setBoot(playerid, index, param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
			vehicleData[index][boott] = VEHICLE_PARAMS_ON;
			if(playerid != -2) ShowTDN_IC(playerid, "Abriste el baul.");
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
			vehicleData[index][boott] = VEHICLE_PARAMS_OFF;
			if(playerid != -2) ShowTDN_IC(playerid, "Cerraste el baul.");
		}
	}
}


sendDoubleLineMessageVehicle(index, playerid, Float:range, color, const message[])
{
	new Float:xx, Float:yy, Float:zz;
	GetPlayerPos(playerid, xx, yy, zz);

	new string[128];
	new string1[128];
	new count;
	for(new d;d<strlen(message);d++)
	{	
		if(d < 120)
		{
			string[d] = message[d];
		}
		else if(d > 120)
		{
			string1[count] = message[d];
			count++;
		}
	}

	new bool:windowOpen = false;
	for(new e;e<4;e++){
		if(vehicleData[index][windows][e] == CAR_WINDOW_OPEN){
			windowOpen = true;
			break;
		}
	}
	for(new i; i<MAX_PLAYERS;i++){
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInRangeOfPoint(i, range, xx, yy, zz))
			{
				if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
				{
					if(windowOpen || inVehicle[i] == index){
						if(strlen(message) > 120)
						{
							strcat(string, " - ");
							SendClientMessage(i, color, string);
							SendClientMessage(i, color, string1);
						}
						else if(strlen(message) < 120)
						{
							SendClientMessage(i, color, string);
						}
					}
				}

			}
		}
	}
}