 #include <YSI_Coding\y_hooks>

#define MAX_RENT_VEHICLES 11
#define d_rentv 5

enum vRent@a
{
	vr_id,
	vr_mdl,
	Float:vr_pos[4],
	vr_obj
};
new vRentInfo[MAX_RENT_VEHICLES][vRent@a] = {
	{0, 467, {6036.3804,32.6861,4.9235,1.1728}},
	{2, 467, {6031.1768,33.0068,4.9235,1.1728}},
	{3, 467, {6025.8140,33.3008,4.9235,1.1728}},
	{4, 467, {6018.6074,33.7468,4.9235,1.1728}},
	{5, 467, {6002.1738,34.4247,4.9235,1.1728}},
	{6, 422, {5144.8096,-361.5972,6.0515}},
	{7, 422, {5140.0737,-358.5038,6.0306}},
	{8, 422, {5150.3799,-365.0950,6.0735}},
	{9, 422, {5109.6836,-345.4622,6.0323}},
	{10, 422, {5104.9063,-342.3846,5.9949}},
	{11, 422, {5096.0728,-340.1998,6.0012}}
};

new bool:enRenta[MAX_PLAYERS];
new rentID[MAX_PLAYERS];
new timerRent[MAX_PLAYERS];
hook OnGameModeInit()
{
	for(new d;d<MAX_RENT_VEHICLES;d++)
	{
		vRentInfo[d][vr_obj] = AddStaticVehicleEx(vRentInfo[d][vr_mdl], vRentInfo[d][vr_pos][0], vRentInfo[d][vr_pos][1], vRentInfo[d][vr_pos][2], vRentInfo[d][vr_pos][3],1, 6, 600000);
	}
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		for(new d;d<MAX_RENT_VEHICLES;d++)
		{
			if(vehicleid == vRentInfo[d][vr_obj])
			{
				if(enRenta[playerid] == false)
				{
					ShowXylosDialog(playerid, d_rentv, TYPE_MSG, "Renta de Vehiculo", "Los vehiculos de renta son automaticos, osea que no llevan marcha,¿Deseas rentarlo por $200?", "Rentar");
					rentID[playerid] = vehicleid;
					break;
				}
				else 
				{
					if(vehicleid == rentID[playerid])
					{
						enviarNotificacionG(playerid, "Usa /desrentar para cancelar la renta");
					}
					else 
					{
						RemovePlayerFromVehicle(playerid);
						enviarNotificacionG(playerid, "Este no es tu vehiculo rentado");
					}
				}
			}
		}
	}
}

hook OnXylosDialogResponse(playerid, dialogid, list, modelid)
{
	if(dialogid == d_rentv)
	{
		if(personajeInfo[playerid][p_dinero] > 200)
		{
			personajeInfo[playerid][p_dinero] -= 200;
			enRenta[playerid] = true;
			new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(rentID[playerid], engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(rentID[playerid], VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);	
			timerRent[playerid] = SetTimerEx("desrentVehicle", 600000, false,  "d", playerid);

		}
		else enviarNotificacionG(playerid, "No tienes suficiente dinero");
	}
}
forward desrentVehicle(playerid);
public desrentVehicle(playerid)
{
	if(enRenta[playerid] == true)
	{
		enRenta[playerid] = false;
		rentID[playerid] = 0;
		RemovePlayerFromVehicle(playerid);
		enviarNotificacionG(playerid, "La renta del vehiculo fue cancelada");
	}
}
cmd:desrentar(playerid)
{
	if(enRenta[playerid] == true)
	{
		enRenta[playerid] = false;
		rentID[playerid] = 0;
		RemovePlayerFromVehicle(playerid);
		enviarNotificacionG(playerid, "La renta del vehiculo fue cancelada");
	}
}