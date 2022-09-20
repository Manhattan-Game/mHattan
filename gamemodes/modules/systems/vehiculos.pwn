#include <YSI_Coding\y_hooks>

DEFINE_HOOK_REPLACEMENT(OnPlayer, OP__);


#define MARCHA_1_MAX 40
#define MARCHA_2_MIN 20
#define MARCHA_2_MAX 70
#define MARCHA_3_MIN 40
#define MARCHA_3_MAX 95
#define MARCHA_4_MIN 80
#define MARCHA_4_MAX 120
#define MARCHA_5_MIN 90

#define reduccion_fuerte 1.3
#define reduccion_baja 1.1




new Text:velocimetroT[2];
new PlayerText:velocimetroTT[MAX_PLAYERS][6];

new Text:attachamenT[3];
new PlayerText:attachamenTT[MAX_PLAYERS][13];

enum _veh@info
{
	v_id,
	v_mkid,
	v_model,
	Float:v_pos[4],
	v_vw,
	v_color1,
	v_color2,
	v_respawn,
	Float:v_vida,

	v_puertas,
	v_motor,
	v_luces,
	v_babierto,
	v_capo,

	v_gasolina,
	v_aceite,

	v_empresa,
	v_faccion,

	v_baul[9],
	v_baulcant[9],

	v_attachobject[9],
	v_attachmodel[9],
	Float:v_attachx[9],
	Float:v_attachy[9],
	Float:v_attachz[9],
	Float:v_rotx[9],
	Float:v_roty[9],
	Float:v_rotz[9],

	v_velocimetro,
	v_frenomano,

	v_timergasolina,
	v_timeraceite,

	v_cargado,
	bool:v_cargado2,
	bool:v_spawn	
};
new vehInfo[MAX_VEHICLES][_veh@info];


public  OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
    	new vehicleid = GetPlayerVehicleID(playerid);
    	new v;
    	for(new i;i<MAX_VEHICLES;i++)
    	{
    		if(vehInfo[i][v_cargado] == vehicleid)
    		{
    			v = i;
    			break;
    		}
    	}
        if(newstate == PLAYER_STATE_DRIVER) enviarNotificacionG(playerid, "Usa /vmenu para usar el menu, Y+2(embrague) para subir de marcha y N+2 para bajar");
		mostrarVelocimetro(playerid, v);
    }
    else if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER || enRenta[playerid] == true && rentID[playerid] == GetPlayerVehicleID(playerid))
    {
        for(new h;h<2;h++) TextDrawHideForPlayer(playerid, velocimetroT[h]);
		for(new p;p<6;p++) PlayerTextDrawHide(playerid, velocimetroTT[playerid][p]);
		enVelocimetro[playerid] = false;

		new vehicleid = GetPlayerVehicleID(playerid);
    	new v;
    	for(new i;i<MAX_VEHICLES;i++)
    	{
    		if(vehInfo[i][v_cargado] == vehicleid)
    		{
    			v = i;
    			break;
    		}
    	}
		KillTimer(timerVelocimetro[playerid]);
		KillTimer(vehInfo[v][v_velocimetro]);
		esconderBarra(playerid, 2);
		esconderBarra(playerid, 3);
    }
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	for(new i;i<MAX_VEHICLES;i++)
	{
		if(vehInfo[i][v_cargado] == vehicleid && rentID[playerid] != vehicleid)
		{
			guardarVehiculo(vehInfo[i][v_id]);
			break;
		}
	}
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	marcha[playerid] = 0;
	embrage[playerid] = 0;
	reversa[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(HOLDING(ArribaM | EmbrageM) && marcha[playerid] < 5)
	{
		if(enVelocimetro[playerid] == true)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				embrage[playerid] = 1;
				marcha[playerid]++;
				SetTimerEx("volverEmbrage", 2000, false, "d", playerid);
			}
		}
	}
	if(HOLDING(AbajoM | EmbrageM) && marcha[playerid] > -1)
	{
		if(enVelocimetro[playerid] == true)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				embrage[playerid] = 1;
				marcha[playerid]--;
				if(marcha[playerid] == -1)
				{
					reversa[playerid] = 1;
				}
				else reversa[playerid] = 0;
				SetTimerEx("volverEmbrage", 2000, false, "d", playerid);
			}
		}
	}
	if(HOLDING(KEY_YES | KEY_SPRINT))
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				new engine, lights, alarm, doors, bonnet, boot, objective;
				if(vehInfo[u][v_puertas] == 0)
				{	
					GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
					vehInfo[u][v_puertas] = 1;
					enviarNotificacionG(playerid, "Cerraste las puertas del vehiculo");
					break;
				}
				else
				{
					GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
					vehInfo[u][v_puertas] = 0;
					enviarNotificacionG(playerid, "Abriste las puertas del vehiculo");
					break;
				}
			}
		}
	}
}

hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == velocimetroTT[playerid][3])
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				new engine, lights, alarm, doors, bonnet, boot, objective;
				if(vehInfo[u][v_luces] == 0)
				{	
					GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[u][v_cargado], engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
					vehInfo[u][v_luces] = 1;
					enviarNotificacionG(playerid, "Encendiste las luces del vehiculo");
					break;
				}
				else
				{
					GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[u][v_cargado], engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
					vehInfo[u][v_luces] = 0;
					enviarNotificacionG(playerid, "Apagaste las luces del vehiculo");
					break;
				}
			}
		}
	}
	else if(playertextid == velocimetroTT[playerid][5])
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				new engine, lights, alarm, doors, bonnet, boot, objective;
				if(vehInfo[u][v_babierto] == 0)
				{	
					GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
					vehInfo[u][v_babierto] = 1;
					enviarNotificacionG(playerid, "Abriste el baul del vehiculo");
					break;
				}
				else
				{
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
					vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_babierto] = 0;
					enviarNotificacionG(playerid, "Cerraste el baul del vehiculo");
					break;
				}
			}
		}
	}
	else if(playertextid == velocimetroTT[playerid][2])
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				if(vehInfo[u][v_gasolina] > 4)
				{	
					new engine, lights, alarm, doors, bonnet, boot, objective;
					if(vehInfo[u][v_motor] == 0)
					{
						if(vehInfo[u][v_frenomano] == 0)
						{
							GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
							SetVehicleParamsEx(vehInfo[u][v_cargado], VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
							vehInfo[u][v_motor] = 1;
							enviarNotificacionG(playerid, "Encendiste el motor del vehiculo");
							break;
						} else
						{
							enviarNotificacionG(playerid, "El freno de mano esta activado");
							break;
						}
					}
					else
					{
						GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
						SetVehicleParamsEx(vehInfo[u][v_cargado], VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
						vehInfo[u][v_motor] = 0;
						enviarNotificacionG(playerid, "Apagaste el motor del vehiculo");
						break;
					}
				}
			}
		}
	}
	else if(playertextid == velocimetroTT[playerid][4])
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				if(vehInfo[u][v_capo] == 1)
				{
					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
					vehInfo[u][v_capo] = 0;
					enviarNotificacionG(playerid, "Cerraste el capo del vehiculo");
				}
				else
				{
					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[u][v_cargado], engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
					vehInfo[u][v_capo] = 1;
					enviarNotificacionG(playerid, "Abriste el capo del vehiculo");
				}
			}
		}
	}

	else if(playertextid == attachamenTT[playerid][0])
	{
		eligiendoAttach[playerid] = 0;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][1])
	{
		eligiendoAttach[playerid] = 1;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][2])
	{
		eligiendoAttach[playerid] = 2;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][3])
	{
		eligiendoAttach[playerid] = 3;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][4])
	{
		eligiendoAttach[playerid] = 4;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][5])
	{
		eligiendoAttach[playerid] = 5;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][6])
	{
		eligiendoAttach[playerid] = 6;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][7])
	{
		eligiendoAttach[playerid] = 7;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][8])
	{
		eligiendoAttach[playerid] = 8;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][9])
	{
		if(enVelocimetro[playerid] == true)
		if(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]] != 0)
		{
			DestroyDynamicObject(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachobject][eligiendoAttach[playerid]]);
			vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]] = 0;
			enviarNotificacionG(playerid, "Eliminaste un objeto");
			for(new p;p<2;p++) TextDrawHideForPlayer(playerid, attachamenT[p]);
			for(new i;i<13;i++) PlayerTextDrawHide(playerid, attachamenTT[playerid][i]);

			mostrarAttachaments(playerid, inventarioInfo[playerid][i_slotcant][8]);

		} else enviarNotificacionG(playerid, "No tienes nada en esta ranuar");
	}
	else if(playertextid == attachamenTT[playerid][10])
	{

		if(enVelocimetro[playerid] == true)
		{
			agregarIttem(playerid, vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]], 1);
			vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]] = 0;
			DestroyDynamicObject(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachobject][eligiendoAttach[playerid]]);
			enviarNotificacionG(playerid, "Enviaste el objeto a tu inventario");
			for(new p;p<2;p++) TextDrawHideForPlayer(playerid, attachamenT[p]);
			for(new i;i<13;i++) PlayerTextDrawHide(playerid, attachamenTT[playerid][i]);

			mostrarAttachaments(playerid, inventarioInfo[playerid][i_slotcant][8]);

		}
		else enviarNotificacionG(playerid, "No tienes un slot disponible en el inventario");
	}
	else if(playertextid == attachamenTT[playerid][12])
	{
		for(new p;p<2;p++) TextDrawHideForPlayer(playerid, attachamenT[p]);
		for(new i;i<13;i++) PlayerTextDrawHide(playerid, attachamenTT[playerid][i]);
		CancelSelectTextDraw(playerid);
	}
	return 1;
}
public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(response == EDIT_RESPONSE_FINAL)
	{
		new Float:ofx, Float:ofy, Float:ofz, Float:ofaz;
        new Float:finalx, Float:finaly;
        new Float:px, Float:py, Float:pz, Float:roz;
        GetVehiclePos(vehInfo[attachandoA[playerid]][v_cargado], px, py, pz);
        GetVehicleZAngle(vehInfo[attachandoA[playerid]][v_cargado], roz);
        ofx = x-px;
        ofy = y-py;
        ofz = z-pz;
        ofaz = rz-roz;
        finalx = ofx*floatcos(roz, degrees)+ofy*floatsin(roz, degrees);
        finaly = -ofx*floatsin(roz, degrees)+ofy*floatcos(roz, degrees);


        AttachDynamicObjectToVehicle(vehInfo[attachandoA[playerid]][v_attachobject][editandoCoche[playerid]], vehInfo[attachandoA[playerid]][v_cargado], finalx, finaly, ofz, rx, ry, ofaz);

        vehInfo[attachandoA[playerid]] [v_attachx]	[slotv[playerid]] = finalx;
        vehInfo[attachandoA[playerid]] [v_attachy]	[slotv[playerid]] = finaly;
        vehInfo[attachandoA[playerid]] [v_attachz]	[slotv[playerid]] = ofz;

        vehInfo[attachandoA[playerid]] [v_rotx]	[slotv[playerid]] = rx;
        vehInfo[attachandoA[playerid]] [v_roty]	[slotv[playerid]] = ry;
        vehInfo[attachandoA[playerid]] [v_rotz]	[slotv[playerid]] = ofaz;

        enviarNotificacionG(playerid, "Objeto editado");
    }
    else if(response == EDIT_RESPONSE_CANCEL)  { DestroyDynamicObject(vehInfo[attachandoA[playerid]][v_attachobject][editandoCoche[playerid]]);	attachandoA[playerid] = 0; slotv[playerid] = 0;}
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case d_baul:
		{
			if(response)
			{
				for(new i;i<9;i++)
				{
					if(vehInfo[attachandoA[playerid]][v_baul][i] == 0)
					{
						if(inventarioInfo[playerid][i_slot][8] != 0)
						{
							vehInfo[attachandoA[playerid]][v_baul][i] = inventarioInfo[playerid][i_slot][8];
							vehInfo[attachandoA[playerid]][v_baulcant][i] = inventarioInfo[playerid][i_slotcant][8];

							attachandoA[playerid] = 0;

							inventarioInfo[playerid][i_slot][8] = 0;
							inventarioInfo[playerid][i_slotcant][8] = 0;
							inventarioInfo[playerid][i_slotocup][8] = 0;
							enviarNotificacionG(playerid, "Guardaste un objeto en el maletero");
							break;
						} else { enviarNotificacionG(playerid, "No tienes nada en la mano"); break;}
					}
				}
			}
			else
			{

				if(listitem == 0) eligiendoBaul[playerid] = 0;
				else if(listitem == 1) eligiendoBaul[playerid] = 1;
				else if(listitem == 2) eligiendoBaul[playerid] = 2;
				else if(listitem == 3) eligiendoBaul[playerid] = 3;
				else if(listitem == 4) eligiendoBaul[playerid] = 4;
				else if(listitem == 5) eligiendoBaul[playerid] = 5;
				else if(listitem == 6) eligiendoBaul[playerid] = 6;
				else if(listitem == 7) eligiendoBaul[playerid] = 7;
				else if(listitem == 8) eligiendoBaul[playerid] = 8;
				
				if(vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]] != 0)
				{
					agregarIttem(playerid, vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]], vehInfo[attachandoA[playerid]][v_baulcant][eligiendoBaul[playerid]]);
					vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]] = 0;
					vehInfo[attachandoA[playerid]][v_baulcant][eligiendoBaul[playerid]] = 0;

					enviarNotificacionG(playerid, "Sacaste un objeto del maletero");

				}else enviarNotificacionG(playerid, "No tienes nada en esta ranura");
			}
		}
	}
}


loadVehicles()
{
	new totalVehicles;
		
	new Cache:result = mysql_query(MYSQL_DB, "SELECT * FROM `vehicles`");
	printf(result);
		/*new xylos = SQL::Open(SQL::READ, "vehiculos", "v_id", id);
		SQL::ReadInt(xylos, "v_id", vehInfo[id][v_id]);
		SQL::ReadInt(xylos, "v_mkid", vehInfo[id][v_mkid]);
		SQL::ReadInt(xylos, "v_model", vehInfo[id][v_model]);

		SQL::ReadFloat(xylos, "v_pos0", vehInfo[id][v_pos][0]);
		SQL::ReadFloat(xylos, "v_pos1", vehInfo[id][v_pos][1]);
		SQL::ReadFloat(xylos, "v_pos2", vehInfo[id][v_pos][2]);
		SQL::ReadFloat(xylos, "v_pos3", vehInfo[id][v_pos][3]);

		SQL::ReadInt(xylos, "v_vw", vehInfo[id][v_vw]);
		SQL::ReadInt(xylos, "v_color1", vehInfo[id][v_color1]);
		SQL::ReadInt(xylos, "v_color2", vehInfo[id][v_color2]);
		SQL::ReadInt(xylos, "v_respawn", vehInfo[id][v_respawn]);
		SQL::ReadFloat(xylos, "v_vida", vehInfo[id][v_vida]);
		SQL::ReadInt(xylos, "v_puertas", vehInfo[id][v_puertas]);
		SQL::ReadInt(xylos, "v_motor", vehInfo[id][v_motor]);
		SQL::ReadInt(xylos, "v_luces", vehInfo[id][v_luces]);
		SQL::ReadInt(xylos, "v_baul", vehInfo[id][v_babierto]);
		SQL::ReadInt(xylos, "v_capo", vehInfo[id][v_capo]);
		SQL::ReadInt(xylos, "v_aceite", vehInfo[id][v_aceite]);
		SQL::ReadInt(xylos, "v_gasolina", vehInfo[id][v_gasolina]);

		SQL::ReadInt(xylos, "v_empresa", vehInfo[id][v_empresa]);
		SQL::ReadInt(xylos, "v_faccion", vehInfo[id][v_faccion]);

		SQL::ReadInt(xylos, "v_baul1", vehInfo[id][v_baul][0]);
		SQL::ReadInt(xylos, "v_baul2", vehInfo[id][v_baul][1]);
		SQL::ReadInt(xylos, "v_baul3", vehInfo[id][v_baul][2]);
		SQL::ReadInt(xylos, "v_baul4", vehInfo[id][v_baul][3]);
		SQL::ReadInt(xylos, "v_baul5", vehInfo[id][v_baul][4]);
		SQL::ReadInt(xylos, "v_baul6", vehInfo[id][v_baul][5]);
		SQL::ReadInt(xylos, "v_baul7", vehInfo[id][v_baul][6]);
		SQL::ReadInt(xylos, "v_baul8", vehInfo[id][v_baul][7]);
		SQL::ReadInt(xylos, "v_baul9", vehInfo[id][v_baul][8]);

		SQL::ReadInt(xylos, "v_baulcant1", vehInfo[id][v_baulcant][0]);
		SQL::ReadInt(xylos, "v_baulcant2", vehInfo[id][v_baulcant][1]);
		SQL::ReadInt(xylos, "v_baulcant3", vehInfo[id][v_baulcant][2]);
		SQL::ReadInt(xylos, "v_baulcant4", vehInfo[id][v_baulcant][3]);
		SQL::ReadInt(xylos, "v_baulcant5", vehInfo[id][v_baulcant][4]);
		SQL::ReadInt(xylos, "v_baulcant6", vehInfo[id][v_baulcant][5]);
		SQL::ReadInt(xylos, "v_baulcant7", vehInfo[id][v_baulcant][6]);
		SQL::ReadInt(xylos, "v_baulcant8", vehInfo[id][v_baulcant][7]);
		SQL::ReadInt(xylos, "v_baulcant9", vehInfo[id][v_baulcant][8]);

		SQL::ReadInt(xylos, "v_attachobject1", vehInfo[id][v_attachobject][0]);
		SQL::ReadInt(xylos, "v_attachobject2", vehInfo[id][v_attachobject][1]);
		SQL::ReadInt(xylos, "v_attachobject3", vehInfo[id][v_attachobject][2]);
		SQL::ReadInt(xylos, "v_attachobject4", vehInfo[id][v_attachobject][3]);
		SQL::ReadInt(xylos, "v_attachobject5", vehInfo[id][v_attachobject][4]);
		SQL::ReadInt(xylos, "v_attachobject6", vehInfo[id][v_attachobject][5]);
		SQL::ReadInt(xylos, "v_attachobject7", vehInfo[id][v_attachobject][6]);
		SQL::ReadInt(xylos, "v_attachobject8", vehInfo[id][v_attachobject][7]);
		SQL::ReadInt(xylos, "v_attachobject9", vehInfo[id][v_attachobject][8]);


		SQL::ReadInt(xylos, "v_attachmodel1", vehInfo[id][v_attachmodel][0]);
		SQL::ReadInt(xylos, "v_attachmodel2", vehInfo[id][v_attachmodel][1]);
		SQL::ReadInt(xylos, "v_attachmodel3", vehInfo[id][v_attachmodel][2]);
		SQL::ReadInt(xylos, "v_attachmodel4", vehInfo[id][v_attachmodel][3]);
		SQL::ReadInt(xylos, "v_attachmodel5", vehInfo[id][v_attachmodel][4]);
		SQL::ReadInt(xylos, "v_attachmodel6", vehInfo[id][v_attachmodel][5]);
		SQL::ReadInt(xylos, "v_attachmodel7", vehInfo[id][v_attachmodel][6]);
		SQL::ReadInt(xylos, "v_attachmodel8", vehInfo[id][v_attachmodel][7]);
		SQL::ReadInt(xylos, "v_attachmodel9", vehInfo[id][v_attachmodel][8]);


		SQL::ReadFloat(xylos, "v_attachx1", vehInfo[id][v_attachx][0]);
		SQL::ReadFloat(xylos, "v_attachx2", vehInfo[id][v_attachx][1]);
		SQL::ReadFloat(xylos, "v_attachx3", vehInfo[id][v_attachx][2]);
		SQL::ReadFloat(xylos, "v_attachx4", vehInfo[id][v_attachx][3]);
		SQL::ReadFloat(xylos, "v_attachx5", vehInfo[id][v_attachx][4]);
		SQL::ReadFloat(xylos, "v_attachx6", vehInfo[id][v_attachx][5]);
		SQL::ReadFloat(xylos, "v_attachx7", vehInfo[id][v_attachx][6]);
		SQL::ReadFloat(xylos, "v_attachx8", vehInfo[id][v_attachx][7]);
		SQL::ReadFloat(xylos, "v_attachx9", vehInfo[id][v_attachx][8]);

		SQL::ReadFloat(xylos, "v_attachy1", vehInfo[id][v_attachy][0]);
		SQL::ReadFloat(xylos, "v_attachy2", vehInfo[id][v_attachy][1]);
		SQL::ReadFloat(xylos, "v_attachy3", vehInfo[id][v_attachy][2]);
		SQL::ReadFloat(xylos, "v_attachy4", vehInfo[id][v_attachy][3]);
		SQL::ReadFloat(xylos, "v_attachy5", vehInfo[id][v_attachy][4]);
		SQL::ReadFloat(xylos, "v_attachy6", vehInfo[id][v_attachy][5]);
		SQL::ReadFloat(xylos, "v_attachy7", vehInfo[id][v_attachy][6]);
		SQL::ReadFloat(xylos, "v_attachy8", vehInfo[id][v_attachy][7]);
		SQL::ReadFloat(xylos, "v_attachy9", vehInfo[id][v_attachy][8]);

		SQL::ReadFloat(xylos, "v_attachz1", vehInfo[id][v_attachz][0]);
		SQL::ReadFloat(xylos, "v_attachz2", vehInfo[id][v_attachz][1]);
		SQL::ReadFloat(xylos, "v_attachz3", vehInfo[id][v_attachz][2]);
		SQL::ReadFloat(xylos, "v_attachz4", vehInfo[id][v_attachz][3]);
		SQL::ReadFloat(xylos, "v_attachz5", vehInfo[id][v_attachz][4]);
		SQL::ReadFloat(xylos, "v_attachz6", vehInfo[id][v_attachz][5]);
		SQL::ReadFloat(xylos, "v_attachz7", vehInfo[id][v_attachz][6]);
		SQL::ReadFloat(xylos, "v_attachz8", vehInfo[id][v_attachz][7]);
		SQL::ReadFloat(xylos, "v_attachz9", vehInfo[id][v_attachz][8]);

		SQL::ReadFloat(xylos, "v_rotx1", vehInfo[id][v_rotx][0]);
		SQL::ReadFloat(xylos, "v_rotx2", vehInfo[id][v_rotx][1]);
		SQL::ReadFloat(xylos, "v_rotx3", vehInfo[id][v_rotx][2]);
		SQL::ReadFloat(xylos, "v_rotx4", vehInfo[id][v_rotx][3]);
		SQL::ReadFloat(xylos, "v_rotx5", vehInfo[id][v_rotx][4]);
		SQL::ReadFloat(xylos, "v_rotx6", vehInfo[id][v_rotx][5]);
		SQL::ReadFloat(xylos, "v_rotx7", vehInfo[id][v_rotx][6]);
		SQL::ReadFloat(xylos, "v_rotx8", vehInfo[id][v_rotx][7]);
		SQL::ReadFloat(xylos, "v_rotx9", vehInfo[id][v_rotx][8]);

		SQL::ReadFloat(xylos, "v_roty1", vehInfo[id][v_roty][0]);
		SQL::ReadFloat(xylos, "v_roty2", vehInfo[id][v_roty][1]);
		SQL::ReadFloat(xylos, "v_roty3", vehInfo[id][v_roty][2]);
		SQL::ReadFloat(xylos, "v_roty4", vehInfo[id][v_roty][3]);
		SQL::ReadFloat(xylos, "v_roty5", vehInfo[id][v_roty][4]);
		SQL::ReadFloat(xylos, "v_roty6", vehInfo[id][v_roty][5]);
		SQL::ReadFloat(xylos, "v_roty7", vehInfo[id][v_roty][6]);
		SQL::ReadFloat(xylos, "v_roty8", vehInfo[id][v_roty][7]);
		SQL::ReadFloat(xylos, "v_roty9", vehInfo[id][v_roty][8]);

		SQL::ReadFloat(xylos, "v_rotz1", vehInfo[id][v_rotz][0]);
		SQL::ReadFloat(xylos, "v_rotz2", vehInfo[id][v_rotz][1]);
		SQL::ReadFloat(xylos, "v_rotz3", vehInfo[id][v_rotz][2]);
		SQL::ReadFloat(xylos, "v_rotz4", vehInfo[id][v_rotz][3]);
		SQL::ReadFloat(xylos, "v_rotz5", vehInfo[id][v_rotz][4]);
		SQL::ReadFloat(xylos, "v_rotz6", vehInfo[id][v_rotz][5]);
		SQL::ReadFloat(xylos, "v_rotz7", vehInfo[id][v_rotz][6]);
		SQL::ReadFloat(xylos, "v_rotz8", vehInfo[id][v_rotz][7]);
		SQL::ReadFloat(xylos, "v_rotz9", vehInfo[id][v_rotz][8]);

		SQL::ReadInt(xylos, "v_frenomano", vehInfo[id][v_frenomano]);




		if(vehInfo[id][v_model] != 0)
		{
			vehInfo[id][v_cargado] = CreateVehicle(vehInfo[id][v_model], vehInfo[id][v_pos][0], vehInfo[id][v_pos][1], vehInfo[id][v_pos][2], vehInfo[id][v_pos][3], vehInfo[id][v_color1], vehInfo[id][v_color2], -1, 0);
			SetVehicleVirtualWorld(id, vehInfo[id][v_vw]);
			SetVehicleHealth(id, vehInfo[id][v_vida]);

			for(new i;i<9;i++)
			{
				if(vehInfo[id][v_attachmodel][i] != 0)
				{
					vehInfo[id][v_attachobject][i] = CreateDynamicObject(objInfo[vehInfo[id][v_attachmodel][i]][o_model], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, -1, 15);
					AttachObjectToVehicle(vehInfo[id][v_attachobject][i], vehInfo[id][v_cargado], vehInfo[id][v_attachx][i], vehInfo[id][v_attachy][i], vehInfo[id][v_attachz][i], vehInfo[id][v_rotx][i], vehInfo[id][v_roty][i], vehInfo[id][v_rotz][i]);
				}
			}

			new engine, lights, alarm, doors, bonnet, boot, objective;
			if(vehInfo[id][v_motor] == 1)
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
			}
			if(vehInfo[id][v_puertas] == 1)
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
			}
			if(vehInfo[id][v_luces] == 1)
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
			}
			if(vehInfo[id][v_baul] == 1)
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
			}
			else
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
			}
			if(vehInfo[id][v_capo] == 1)
			{
				GetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(vehInfo[id][v_cargado], engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
			}

			vehInfo[id][v_cargado2] = true;
			vehInfo[id][v_timergasolina] = SetTimerEx("updateGasolina", 340000, true, "i", id);
			vehInfo[id][v_timeraceite] = SetTimerEx("updateAceite", 700000, true, "i", id); 

		}*/
	printf("Total vehicles %i", totalVehicles);
}
guardarVehiculo(id){
	if(vehInfo[id][v_cargado2] == true)
	{
		GetVehiclePos(vehInfo[id][v_cargado], vehInfo[id][v_pos][0], vehInfo[id][v_pos][1], vehInfo[id][v_pos][2]);
		GetVehicleZAngle(vehInfo[id][v_cargado], vehInfo[id][v_pos][3]);

		GetVehicleHealth(vehInfo[id][v_cargado], vehInfo[id][v_vida]);
		vehInfo[id][v_vw] = GetVehicleVirtualWorld(vehInfo[id][v_cargado]);

		new xylos = SQL::Open(SQL::UPDATE, "vehiculos", "v_id", vehInfo[id][v_id]);
        SQL::WriteInt(xylos, "v_mkid", vehInfo[id][v_mkid]);
        SQL::WriteInt(xylos, "v_model", vehInfo[id][v_model]);

        SQL::WriteFloat(xylos, "v_pos0", vehInfo[id][v_pos][0]);
        SQL::WriteFloat(xylos, "v_pos1", vehInfo[id][v_pos][1]);
        SQL::WriteFloat(xylos, "v_pos2", vehInfo[id][v_pos][2]);
        SQL::WriteFloat(xylos, "v_pos3", vehInfo[id][v_pos][3]);

        SQL::WriteInt(xylos, "v_vw", vehInfo[id][v_vw]);
        SQL::WriteInt(xylos, "v_color1", vehInfo[id][v_color1]);
        SQL::WriteInt(xylos, "v_color2", vehInfo[id][v_color2]);
        SQL::WriteInt(xylos, "v_respawn", vehInfo[id][v_respawn]);
        SQL::WriteFloat(xylos, "v_vida", vehInfo[id][v_vida]);

        SQL::WriteInt(xylos, "v_puertas", vehInfo[id][v_puertas]);
        SQL::WriteInt(xylos, "v_motor", vehInfo[id][v_motor]);
        SQL::WriteInt(xylos, "v_luces", vehInfo[id][v_luces]);
        SQL::WriteInt(xylos, "v_baul", vehInfo[id][v_babierto]);
        SQL::WriteInt(xylos, "v_capo", vehInfo[id][v_capo]);

        SQL::WriteInt(xylos, "v_gasolina", vehInfo[id][v_gasolina]);
        SQL::WriteInt(xylos, "v_aceite", vehInfo[id][v_aceite]);

        SQL::WriteInt(xylos, "v_empresa", vehInfo[id][v_empresa]);
        SQL::WriteInt(xylos, "v_faccion", vehInfo[id][v_faccion]);

        SQL::WriteInt(xylos, "v_baul1", vehInfo[id][v_baul][0]);
        SQL::WriteInt(xylos, "v_baul2", vehInfo[id][v_baul][1]);
        SQL::WriteInt(xylos, "v_baul3", vehInfo[id][v_baul][2]);
        SQL::WriteInt(xylos, "v_baul4", vehInfo[id][v_baul][3]);
        SQL::WriteInt(xylos, "v_baul5", vehInfo[id][v_baul][4]);
        SQL::WriteInt(xylos, "v_baul6", vehInfo[id][v_baul][5]);
        SQL::WriteInt(xylos, "v_baul7", vehInfo[id][v_baul][6]);
        SQL::WriteInt(xylos, "v_baul8", vehInfo[id][v_baul][7]);
        SQL::WriteInt(xylos, "v_baul9", vehInfo[id][v_baul][8]);

        SQL::WriteInt(xylos, "v_baulcant1", vehInfo[id][v_baulcant][0]);
        SQL::WriteInt(xylos, "v_baulcant2", vehInfo[id][v_baulcant][1]);
        SQL::WriteInt(xylos, "v_baulcant3", vehInfo[id][v_baulcant][2]);
        SQL::WriteInt(xylos, "v_baulcant4", vehInfo[id][v_baulcant][3]);
        SQL::WriteInt(xylos, "v_baulcant5", vehInfo[id][v_baulcant][4]);
        SQL::WriteInt(xylos, "v_baulcant6", vehInfo[id][v_baulcant][5]);
        SQL::WriteInt(xylos, "v_baulcant7", vehInfo[id][v_baulcant][6]);
        SQL::WriteInt(xylos, "v_baulcant8", vehInfo[id][v_baulcant][7]);
        SQL::WriteInt(xylos, "v_baulcant9", vehInfo[id][v_baulcant][8]);


        SQL::WriteInt(xylos, "v_attachobject1", vehInfo[id][v_attachobject][0]);
        SQL::WriteInt(xylos, "v_attachobject2", vehInfo[id][v_attachobject][1]);
        SQL::WriteInt(xylos, "v_attachobject3", vehInfo[id][v_attachobject][2]);
        SQL::WriteInt(xylos, "v_attachobject4", vehInfo[id][v_attachobject][3]);
        SQL::WriteInt(xylos, "v_attachobject5", vehInfo[id][v_attachobject][4]);
        SQL::WriteInt(xylos, "v_attachobject6", vehInfo[id][v_attachobject][5]);
        SQL::WriteInt(xylos, "v_attachobject7", vehInfo[id][v_attachobject][6]);
        SQL::WriteInt(xylos, "v_attachobject8", vehInfo[id][v_attachobject][7]);
        SQL::WriteInt(xylos, "v_attachobject9", vehInfo[id][v_attachobject][8]);

        SQL::WriteInt(xylos, "v_attachmodel1", vehInfo[id][v_attachmodel][0]);
        SQL::WriteInt(xylos, "v_attachmodel2", vehInfo[id][v_attachmodel][1]);
        SQL::WriteInt(xylos, "v_attachmodel3", vehInfo[id][v_attachmodel][2]);
        SQL::WriteInt(xylos, "v_attachmodel4", vehInfo[id][v_attachmodel][3]);
        SQL::WriteInt(xylos, "v_attachmodel5", vehInfo[id][v_attachmodel][4]);
        SQL::WriteInt(xylos, "v_attachmodel6", vehInfo[id][v_attachmodel][5]);
        SQL::WriteInt(xylos, "v_attachmodel7", vehInfo[id][v_attachmodel][6]);
        SQL::WriteInt(xylos, "v_attachmodel8", vehInfo[id][v_attachmodel][7]);
        SQL::WriteInt(xylos, "v_attachmodel9", vehInfo[id][v_attachmodel][8]);

        SQL::WriteFloat(xylos, "v_attachx1", vehInfo[id][v_attachx][0]);
        SQL::WriteFloat(xylos, "v_attachx2", vehInfo[id][v_attachx][1]);
        SQL::WriteFloat(xylos, "v_attachx3", vehInfo[id][v_attachx][2]);
        SQL::WriteFloat(xylos, "v_attachx4", vehInfo[id][v_attachx][3]);
        SQL::WriteFloat(xylos, "v_attachx5", vehInfo[id][v_attachx][4]);
        SQL::WriteFloat(xylos, "v_attachx6", vehInfo[id][v_attachx][5]);
        SQL::WriteFloat(xylos, "v_attachx7", vehInfo[id][v_attachx][6]);
        SQL::WriteFloat(xylos, "v_attachx8", vehInfo[id][v_attachx][7]);
        SQL::WriteFloat(xylos, "v_attachx9", vehInfo[id][v_attachx][8]);

        SQL::WriteFloat(xylos, "v_attachy1", vehInfo[id][v_attachy][0]);
        SQL::WriteFloat(xylos, "v_attachy2", vehInfo[id][v_attachy][1]);
        SQL::WriteFloat(xylos, "v_attachy3", vehInfo[id][v_attachy][2]);
        SQL::WriteFloat(xylos, "v_attachy4", vehInfo[id][v_attachy][3]);
        SQL::WriteFloat(xylos, "v_attachy5", vehInfo[id][v_attachy][4]);
        SQL::WriteFloat(xylos, "v_attachy6", vehInfo[id][v_attachy][5]);
        SQL::WriteFloat(xylos, "v_attachy7", vehInfo[id][v_attachy][6]);
        SQL::WriteFloat(xylos, "v_attachy8", vehInfo[id][v_attachy][7]);
        SQL::WriteFloat(xylos, "v_attachy9", vehInfo[id][v_attachy][8]);

        SQL::WriteFloat(xylos, "v_attachz1", vehInfo[id][v_attachz][0]);
        SQL::WriteFloat(xylos, "v_attachz2", vehInfo[id][v_attachz][1]);
        SQL::WriteFloat(xylos, "v_attachz3", vehInfo[id][v_attachz][2]);
        SQL::WriteFloat(xylos, "v_attachz4", vehInfo[id][v_attachz][3]);
        SQL::WriteFloat(xylos, "v_attachz5", vehInfo[id][v_attachz][4]);
        SQL::WriteFloat(xylos, "v_attachz6", vehInfo[id][v_attachz][5]);
        SQL::WriteFloat(xylos, "v_attachz7", vehInfo[id][v_attachz][6]);
        SQL::WriteFloat(xylos, "v_attachz8", vehInfo[id][v_attachz][7]);
        SQL::WriteFloat(xylos, "v_attachz9", vehInfo[id][v_attachz][8]);

        SQL::WriteFloat(xylos, "v_rotx1", vehInfo[id][v_rotx][0]);
        SQL::WriteFloat(xylos, "v_rotx2", vehInfo[id][v_rotx][1]);
        SQL::WriteFloat(xylos, "v_rotx3", vehInfo[id][v_rotx][2]);
        SQL::WriteFloat(xylos, "v_rotx4", vehInfo[id][v_rotx][3]);
        SQL::WriteFloat(xylos, "v_rotx5", vehInfo[id][v_rotx][4]);
        SQL::WriteFloat(xylos, "v_rotx6", vehInfo[id][v_rotx][5]);
        SQL::WriteFloat(xylos, "v_rotx7", vehInfo[id][v_rotx][6]);
        SQL::WriteFloat(xylos, "v_rotx8", vehInfo[id][v_rotx][7]);
        SQL::WriteFloat(xylos, "v_rotx9", vehInfo[id][v_rotx][8]);

       	SQL::WriteFloat(xylos, "v_roty1", vehInfo[id][v_roty][0]);
       	SQL::WriteFloat(xylos, "v_roty2", vehInfo[id][v_roty][1]);
       	SQL::WriteFloat(xylos, "v_roty3", vehInfo[id][v_roty][2]);
       	SQL::WriteFloat(xylos, "v_roty4", vehInfo[id][v_roty][3]);
       	SQL::WriteFloat(xylos, "v_roty5", vehInfo[id][v_roty][4]);
       	SQL::WriteFloat(xylos, "v_roty6", vehInfo[id][v_roty][5]);
       	SQL::WriteFloat(xylos, "v_roty7", vehInfo[id][v_roty][6]);
       	SQL::WriteFloat(xylos, "v_roty8", vehInfo[id][v_roty][7]);
       	SQL::WriteFloat(xylos, "v_roty9", vehInfo[id][v_roty][8]);

       	SQL::WriteFloat(xylos, "v_rotz1", vehInfo[id][v_rotz][0]);
       	SQL::WriteFloat(xylos, "v_rotz2", vehInfo[id][v_rotz][1]);
       	SQL::WriteFloat(xylos, "v_rotz3", vehInfo[id][v_rotz][2]);
       	SQL::WriteFloat(xylos, "v_rotz4", vehInfo[id][v_rotz][3]);
       	SQL::WriteFloat(xylos, "v_rotz5", vehInfo[id][v_rotz][4]);
       	SQL::WriteFloat(xylos, "v_rotz6", vehInfo[id][v_rotz][5]);
       	SQL::WriteFloat(xylos, "v_rotz7", vehInfo[id][v_rotz][6]);
       	SQL::WriteFloat(xylos, "v_rotz8", vehInfo[id][v_rotz][7]);
       	SQL::WriteFloat(xylos, "v_rotz9", vehInfo[id][v_rotz][8]);

       	SQL::WriteInt(xylos, "v_frenomano", vehInfo[id][v_frenomano]);
       	SQL::Close(xylos);

	}
}





mostrarVelocimetro(playerid, vid)
{
	for(new h;h<2;h++) TextDrawShowForPlayer(playerid, velocimetroT[h]);
	for(new p;p<6;p++) PlayerTextDrawShow(playerid, velocimetroTT[playerid][p]);
	enVelocimetro[playerid] = true;
	timerVelocimetro[playerid] = SetTimerEx("updateVelocimetro", 1000, true, "dd", playerid, vid);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		vehInfo[vid][v_velocimetro] = SetTimerEx("updateVelocity", 500, true, "dd", playerid, vid);
	}

	crearBarra(playerid, 595.0, 2, 595.333374, 432.666778, 629.000000, 0.366666, -2139094785, 100.00, 0);
	crearBarra(playerid, 549.0, 3, 549.333312, 432.666778, 583.000000, 0.366666, -1378294017, 100.00, 0);
}
mostrarAttachaments(playerid, vid)
{

	for(new h; h<9;h++) PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][h], objInfo[vehInfo[vid][v_attachmodel][h]][o_model]);

	for(new p;p<2;p++) TextDrawShowForPlayer(playerid, attachamenT[p]);
	for(new i;i<13;i++) PlayerTextDrawShow(playerid, attachamenTT[playerid][i]);

	SelectTextDraw(playerid, 0x87868286);
}
mostrarBaul(playerid, vid)
{
	eligiendoBaul[playerid] = 0;
	attachandoA[playerid] = vid;
	new string[1300];
	new string1[128];
	for(new i; i<9;i++)
	{
		if(vehInfo[vid][v_baul][i] != 0)
		{
			format(string1, 100, "Slot %i: %s, Cantidad: %i \n", i+1, objInfo[vehInfo[vid][v_baul][i]][o_nombre], vehInfo[vid][v_baulcant][i]);
			strcat(string, string1);
		}
		else
		{
			format(string1, 100, "Slot %i: Nada, Cantidad: Nada \n", i+1);
			strcat(string, string1);
		}
	}
	ShowPlayerDialog(playerid, d_baul, DIALOG_STYLE_LIST, ""Chat_Gris"Baul", string, ""Chat_Gris"Guardar", ""Chat_Gris"Sacar");
}

forward updateVelocimetro(playerid, vid);
public updateVelocimetro(playerid, vid)
{
	if(enVelocimetro[playerid] == true)
	{
			new string[20];
			format(string, 20, "%i",GetVehicleSpeed(vehInfo[vid][v_cargado]));
			PlayerTextDrawSetString(playerid, velocimetroTT[playerid][0], string);

			actualizarBarra(playerid, 2, vehInfo[vid][v_gasolina]);
			actualizarBarra(playerid, 3, vehInfo[vid][v_aceite]);

			format(string, 20, "%i", marcha[playerid]);
			PlayerTextDrawSetString(playerid, velocimetroTT[playerid][1], string);
	}
	else 
	{
		KillTimer(timerVelocimetro[playerid]);
	}
}




stock GetVehicleSpeed(vehid) // XYLOSSS
{
	new Float:x, Float:y, Float:z, total;
	GetVehicleVelocity(vehid, x, y, z);
	total = floatround( floatsqroot( x*x + y*y + z*z ) * 180 );
	return total;
}

forward updateVelocity(playerid, vehicleid);
public updateVelocity(playerid, vehicleid)
{
	if(enVelocimetro[playerid] == true)
	{	
		new speed = GetVehicleSpeed(vehInfo[vehicleid][v_cargado]);
		new engine, lights, alarm, doors, bonnet, boot, objective;
		if(marcha[playerid] > 0)
		{
			if(speed < 3)
			{
				if(embrage[playerid] == 0)
				{
					reducirVelocidad(playerid, 0);
				}
			}
			else
			{
				if(embrage[playerid] == 1)
				{
					reducirVelocidad(playerid, 1);
				}
			}
			if(speed > 0 && speed < 10)
			{
				if(reversa[playerid] == 1)
				{
					reducirVelocidad(playerid, 1);
				}
			}
		}
		else if(marcha[playerid] <= 1 && speed < 10)
		{
			if(embrage[playerid] == 1)
			{
				reducirVelocidad(playerid, 1);
			}
		}
		switch(marcha[playerid])
		{
			case -1:
			{
				if(reversa[playerid] == 0)
				{
					GetVehicleParamsEx(vehInfo[vehicleid][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[vehicleid][v_cargado], VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					vehInfo[vehicleid][v_motor] = 0;
				}
				else
				{
					if(speed > 15)
					{
						reducirVelocidad(playerid, 2);
					}
				}
			}
			case 0:
			{
				if(speed > 0)
				{
					GetVehicleParamsEx(vehInfo[vehicleid][v_cargado], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehInfo[vehicleid][v_cargado], VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					vehInfo[vehicleid][v_motor] = 0;
				}
			}
			case 1:
			{
				if(speed > MARCHA_1_MAX)
				{
					reducirVelocidad(playerid, 1);
				}
			}
			case 2:
			{
				if(speed > MARCHA_2_MAX)
				{
					reducirVelocidad(playerid, 1);
				}
			}
			case 3:
			{
				if(speed > MARCHA_3_MAX)
				{
					reducirVelocidad(playerid, 1);
				}
			}
			case 4:
			{
				if(speed > MARCHA_4_MAX)
				{
					reducirVelocidad(playerid, 1);
				}
			}
			case 5:
			{
				if(speed < MARCHA_5_MIN)
				{
					reducirVelocidad(playerid, 1);
				}
			}
		}
	}
	else 
	{ 
		KillTimer(vehInfo[vehicleid][v_velocimetro]); 
		enVelocimetro[playerid] = false;
	}
	if(enRenta[playerid] == true)
	{
		KillTimer(vehInfo[vehicleid][v_velocimetro]); 
		for(new h;h<2;h++) TextDrawHideForPlayer(playerid, velocimetroT[h]);
		for(new p;p<6;p++) PlayerTextDrawHide(playerid, velocimetroTT[playerid][p]);
		esconderBarra(playerid, 2);
		esconderBarra(playerid, 3);
		enVelocimetro[playerid] = false;
		if(vehicleid == rentID[playerid])
		{
			new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(rentID[playerid], engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(rentID[playerid], VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
		}
	}
}

forward volverEmbrage(playerid);
public volverEmbrage(playerid)
{
	embrage[playerid] = 0;
}


reducirVelocidad(playerid, opt)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	new Float:x,Float:y, Float:z;
	GetVehicleVelocity(vehicleid, x, y, z);
	if(opt == 0)
	{
		SetVehicleVelocity(vehicleid, x / reduccion_baja, y / reduccion_baja, z / reduccion_baja);
	}
	else if(opt == 1)
	{
		SetVehicleVelocity(vehicleid, x / reduccion_baja, y / reduccion_fuerte, z / reduccion_fuerte);
	}
	else if(opt == 2)
	{
		SetVehicleVelocity(vehicleid, x / reduccion_fuerte, y / reduccion_fuerte, z / reduccion_fuerte);
	}

}
forward updateGasolina(id);
public updateGasolina(id)
{
	if(vehInfo[id][v_spawn] == true)
	{
		if(vehInfo[id][v_motor] == 1)
		{
			vehInfo[id][v_gasolina] -= 2;
		}
	}
	else
	{
		KillTimer(vehInfo[id][v_timergasolina]);
	}
}
forward updateAceite(id);
public updateAceite(id)
{
	if(vehInfo[id][v_spawn] == true)
	{
		if(vehInfo[id][v_motor] == 1)
		{
			vehInfo[id][v_aceite] -= 1;
		}
	}
	else
	{
		KillTimer(vehInfo[id][v_timeraceite]);
	} 
}

cmd:vmenu(playerid, params[])
{
	if(enVelocimetro[playerid] == true)
	{
		SelectTextDraw(playerid, 0x87868286);
	}
	return 1;
}
cmd:vtoys(playerid, params[])
{
	if(enVelocimetro[playerid] == true)
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				mostrarAttachaments(playerid, u);
				SelectTextDraw(playerid, 0x87868286);
				break;
			}
		}
	} else enviarNotificacionG(playerid, "Debes estar en un vehiculo");
}
cmd:vmaletero(playerid, params[])
{
	new Float:x, Float:y, Float:z;
	for(new i;i<MAX_VEHICLES;i++)
	{
		if(vehInfo[i][v_cargado2] == true)
		{
			GetVehiclePos(vehInfo[i][v_cargado], x, y, z);
			if(IsPlayerInRangeOfPoint(playerid, 5, x, y, z))
			{
				if(vehInfo[i][v_babierto] == 1)
				{
					mostrarBaul(playerid, i);
					attachandoA[playerid] = i;
					break;
				}else { enviarNotificacionG(playerid, "El maletero no esta abierto"); break;}
			}
		}
	}
	return 1;
}
forward registrarVehiculo(playerid);
public registrarVehiculo(playerid)
{
	new idv = cache_insert_id();
	// Cargar falta
	agregarIttem(playerid, 20, idv);
}