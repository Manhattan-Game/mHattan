// kilometraje, a parte de tanto es deterioro + restauracion
// guiñes
// ventanillas
// tunning nativo
// tunnin objetos
// desgaste de llantas
// BAUL

#include <YSI_Coding\y_hooks>


enum vehicles@tpye@data{
	listid,
	characterid,
	model,
	kilometres,
	plate,
	engine,
	lights,
	alarm,
	door,
	boot,
	bonnet,
	vehicle_vw,
	color1,
	color2,
	Float: vehicle_life,
	Float:position[4],

	vehicleidd

};
new vehicleData[MAX_VEHICLES][vehicles@tpye@data];
loadVehicle(index){
	if(index != -1 && vehicleData[index][model] > 0){
		vehicleData[index][vehicleidd] = CreateVehicle(vehiclesModelData[vehicleData[index][model]][model], vehicleData[index][position][0], vehicleData[index][position][1], vehicleData[index][position][2], vehicleData[index][position][3], vehicleData[index][v_color1], vehicleData[index][v_color2], -1, 0);
		SetVehicleVirtualWorld(vehicleData[index][vehicleidd], vehicleData[index][vehicle_vw]);
		SetVehicleHealth(vehicleData[index][vehicleidd], vehicleData[index][vehicle_life]);
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

setEngine(index, bool:param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
			vehicleData[index][engine] = VEHICLE_PARAMS_ON;
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
			vehicleData[index][engine] = VEHICLE_PARAMS_OFF;
		}
	}
}

setLights(index, bool:param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
			vehicleData[index][lights] = VEHICLE_PARAMS_ON;
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
			vehicleData[index][lights] = VEHICLE_PARAMS_OFF;
		}
	}
}

setAlarm(index, bool:param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, VEHICLE_PARAMS_ON, doors, bonnet, boot, objective);
			vehicleData[index][lights] = VEHICLE_PARAMS_ON;
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, VEHICLE_PARAMS_OFF, doors, bonnet, boot, objective);
			vehicleData[index][alarm] = VEHICLE_PARAMS_OFF;
		}
	}
}

setDoors(index, bool:param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
			vehicleData[index][doors] = VEHICLE_PARAMS_ON;
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
			vehicleData[index][doors] = VEHICLE_PARAMS_OFF;
		}
	}
}

setBonnet(index, bool:param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
			vehicleData[index][bonnet] = VEHICLE_PARAMS_ON;
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
			vehicleData[index][bonnet] = VEHICLE_PARAMS_OFF;
		}
	}
}

setBoot(index, bool:param){
	if(index != -1 && IsValidVehicle(vehicleData[index][vehicleidd])){
		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, boot, objective);
		if(param){
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
			vehicleData[index][boot] = VEHICLE_PARAMS_ON;
		} else 	{
			SetVehicleParamsEx(vehicleData[index][vehicleidd], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
			vehicleData[index][boot] = VEHICLE_PARAMS_OFF;
		}
	}
}