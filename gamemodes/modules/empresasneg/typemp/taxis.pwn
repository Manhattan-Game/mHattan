#include <YSI_Coding\y_hooks>

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(GetVehicleModel(vehicleid) == 438)
	{
		new id = conseguirConductor(playerid);
		if(PLAYER_STATE_DRIVER != GetPlayerState(playerid))
		{
			if(trabajoData[id][taxi_servicio] == true)
			{
				if(trabajoData[id][taxi_tarifa] > 1)
				{
					trabajoData[playerid][taxi_timer] = SetTimerEx("timerTaxi", 10000, true, "dd", playerid, id);
				}
				else enviarNotificacionG(playerid, "Este taxi no tiene tarifa");
			} else enviarNotificacionG(playerid, "El taxista no esta en servicio");
		}
	}
}
hook OnPlayerExitVehicle(playerid, vehicleid)
{
	if(GetVehicleModel(vehicleid) == 438)
	{
		new id = conseguirConductor(playerid);
		if(PLAYER_STATE_DRIVER != GetPlayerState(playerid))
		{
			if(trabajoData[id][taxi_servicio] == true)
			{
				if(trabajoData[id][taxi_tarifa] > 1)
				{
					
					KillTimer(trabajoData[playerid][taxi_timer]);
				}
			}
		}
	}
}

forward timerTaxi(playerid, id);
public timerTaxi(playerid, id)
{
	personajeInfo[playerid][p_dinero] -= trabajoData[id][taxi_tarifa]; 
	personajeInfo[id][p_dinero] += trabajoData[id][taxi_tarifa];
	enviarNotificacionG(playerid, "Dinero actualizado");
	enviarNotificacionG(id, "Dinero actualizado");
}
cmd:tarifa(playerid, params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vid) == 438)
		{
			if(trabajoData[playerid][taxi_servicio] == true)
			{
				new tarifa;
				if(sscanf(params[0], "i", tarifa)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /tarifa [precio]");
				{
					if(tarifa > 1 && tarifa < 1000)
					{
						trabajoData[playerid][taxi_tarifa] = tarifa;
						enviarNotificacionG(playerid, "Ajustaste el taximetro");
					}else enviarNotificacionG(playerid, "La tarifa maxima es de 1-100");
				}
			}else enviarNotificacionG(playerid, "No estas en servicio");
		}else enviarNotificacionG(playerid, "No estas en un taxi");
	}
	return 1;
}
cmd:marcar(playerid, params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(trabajoData[playerid][taxi_servicio] == true)
		{	
			if(IsPlayerConnected(trabajoData[playerid][taxi_client]))
			{
				new string[80];
				new Float:x, Float:y, Float:z;
				GetPlayerPos(trabajoData[playerid][taxi_client],  x, y, z);
				initRouteNavigator(playerid, x, y, z);
				enviarNotificacionG(playerid, "Marcaste la ubicacion en el GPS");
				format(string, 80, "~w~ Distancia: ~y~~h~ %0.2f ~w~ m", GetPlayerDistanceFromPoint(playerid, x, y, z));
				ShowInfoForPlayer(playerid, string, 3000);

				enviarNotificacionG(trabajoData[playerid][taxi_client], "Un taxista respondio tu solicitud");

				for(new i;i<MAX_PLAYERS;i++) trabajoData[i][taxi_client] = -1;
			}
		}else enviarNotificacionG(playerid, "No estas en servicio");
	}else enviarNotificacionG(playerid, "No te encuentras manejando");
	return 1;
}
