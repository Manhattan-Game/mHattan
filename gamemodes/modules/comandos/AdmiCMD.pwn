#include <YSI_Coding\y_hooks>

cmd:jetpack(playerid, params[])
{
	if(masterInfo[playerid][_admin] <= 4) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
	{
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
	}
	return 1;
}

////////////
// Comandos administrador nivl xylospeed
cmd:dadmin(playerid, params[])
{
	new id, nivel;
	new string[128], string1[128];
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 5) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"ii", id, nivel)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/dadmin [id] [nivel]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		{
			masterInfo[id][_admin] = nivel;
			format(string, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" el administrador "Chat_Naranja"%s"Chat_Gris" te dio AdmNivel: "Chat_Naranja"%i", conseguirNombre(playerid), nivel);
			format(string1, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" le diste al jugador "Chat_Naranja"%s"Chat_Gris" AdmNivel: "Chat_Naranja"%i", conseguirNombre(id), nivel);
			SendClientMessage(playerid, -1, string1);
			SendClientMessage(id, -1, string);

			new log1[120];
			format(log1, sizeof(log1), "El administrador %s le dio administrador nivel %i a %s", masterInfo[playerid][_nombre], nivel, conseguirNombre(id));
			enviarLog(log1);
		}
	}
	return 1;
}

cmd:dskin(playerid, params[])
{
	new id, nivel;
	new string[128], string1[128];
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 2) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"ii", id, nivel)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/dskin [id] [skinid]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		personajeInfo[id][p_skin] = nivel;
		SetPlayerSkin(id, nivel);
		format(string1, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" el administrador "Chat_Naranja"%s "Chat_Gris"te dio el skin id "Chat_Naranja" %i", conseguirNombre(playerid), nivel);
		format(string, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" le diste al jugador "Chat_Naranja"%s "Chat_Gris" el skin id "Chat_Naranja" %i", conseguirNombre(id), nivel);
		SendClientMessage(playerid, -1, string);
		SendClientMessage(id, -1, string1);
	}
	return 1;
}
cmd:svw(playerid, params[])
{
	new id, nivel;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 2) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"ii", id, nivel)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/svw [id] [vw]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		SetPlayerVirtualWorld(id, nivel);
		enviarNotificacionG(playerid, "Cambiaste el VW");
	}
	return 1;
}
cmd:traer(playerid, params[])
{
	new id;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 2) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"i", id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/traer [id]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		{
			new vw = GetPlayerVirtualWorld(playerid);
			new string[128], string1[128];
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			SetPlayerPos(id, X, Y, Z);
			SetPlayerVirtualWorld(id, vw);
			format(string, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" Fuiste teletransportado por el administrador "Chat_Naranja"%s", conseguirNombre(playerid));
			format(string1, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" Trajiste al jugador "Chat_Naranja"%s", conseguirNombre(id));
			SendClientMessage(playerid, -1, string1);
			SendClientMessage(id, -1, string);

		}
	}
	return 1;
}
cmd:traerv(playerid, params[])
{
	new id;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 2) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"i", id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/traerv [id]");
		{
			new vw = GetPlayerVirtualWorld(playerid);
			new string1[128];
			new Float:X, Float:Y, Float:Z;
			SetVehiclePos(id, X, Y, Z);
			SetVehicleVirtualWorld(id, vw);
			format(string1, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" Trajiste el vehiculo ID "Chat_Naranja"%s", id);
			SendClientMessage(playerid, -1, string1);

		}
	}
	return 1;
}
cmd:ddinero(playerid, params[])
{
	new id, cantidad;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 6) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"ii", id, cantidad)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/ddinero [id] [cantidad]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		{
			new string[200], string1[128], log1[200];
			personajeInfo[id][p_bankbalance] += cantidad;
			format(string, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" El administrador "Chat_Naranja"%s"Chat_Gris" añadio "Chat_Verde"$%i"Chat_Gris" a tu cuenta bancaria", conseguirNombre(playerid), cantidad);
			format(string1, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" Le diste al jugador "Chat_Naranja"%s "Chat_Verde"$%i"Chat_Gris" en su cuenta bancaria", conseguirNombre(id), cantidad);
			SendClientMessage(playerid, -1, string1);
			SendClientMessage(id, -1, string);

			format(log1, sizeof(log1), "El administrador %s le dio %i de dinero a %s", masterInfo[playerid][_nombre], cantidad, conseguirNombre(id));
			enviarLog(log1);
		}
	}
	return 1;
}

cmd:ditem(playerid, params[])
{
	new id, item, cantidad;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 4) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"iii", id, item, cantidad)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/ditem [id] [item] [cantidad]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		{
			new string[200], string1[128], log1[200];
			format(string, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" El administrador "Chat_Radio"%s"Chat_Gris" añadio el item id"Chat_Radio" %i"Chat_Gris" a tu inv", conseguirNombre(playerid), item);
			format(string1, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" Le diste al jugador el item id"Chat_Naranja" %i "Chat_Verde" %s", item, conseguirNombre(id));



			format(log1, sizeof(log1), "El administrador %s le dio el item id %i a %s", masterInfo[playerid][_nombre], item, conseguirNombre(id));
			SendClientMessage(playerid, -1, string1);
			SendClientMessage(id, -1, string);
			enviarLog(log1);


			agregarIttem(id, item, cantidad);
		}
	}
	return 1;
}


stock enviarLog(const text[])
{
	new xylos[250];
	mysql_format(xylosMYSQL, xylos, sizeof(xylos), "INSERT INTO LogAdm (log_info) VALUES ('%s')", text);
	mysql_query(xylosMYSQL, xylos);
}

cmd:dauto(playerid, params[1])
{
	new id, idv, Float:x, Float:y, Float:z, modelo;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 4) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"iii", id, idv, modelo)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/dauto [id]  [idv] [modelo]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		{
				new string[128], string1[128], log1[200];
				format(string, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" El administrador "Chat_Radio"%s"Chat_Gris" te dio las llaves de el auto ID"Chat_Radio" %i", conseguirNombre(playerid), modelo);
				format(string1, 128, ""Chat_Blanco"[MiamiSide]"Chat_Gris" Le diste al jugador "Chat_Verde" %s"""Chat_Gris" el auto id"Chat_Naranja" %i",conseguirNombre(id) ,modelo);

				GetPlayerPos(playerid, x, y ,z);

				vehInfo[idv][v_id] = idv;
				vehInfo[idv][v_model] = modelo;
				vehInfo[idv][v_pos][0] = x;
				vehInfo[idv][v_pos][1] = y;
				vehInfo[idv][v_pos][2] = z;
				vehInfo[idv][v_pos][3] = 174.903;
				vehInfo[idv][v_color1] = 103;
				vehInfo[idv][v_color2] = 103;
				vehInfo[idv][v_vida] = 1000;
				vehInfo[idv][v_gasolina] = 70;
				vehInfo[idv][v_aceite] = 99; 

				agregarIttem(id, 20, idv);

				cargarVehiculos(idv);

				format(log1, sizeof(log1), "El administrador %s le dio el auto id %i a %s", masterInfo[playerid][_nombre], modelo, conseguirNombre(id));
				SendClientMessage(playerid, -1, string1);
				SendClientMessage(id, -1, string);
				enviarLog(log1);

		}
	}
	return 1;
}
cmd:prueba2(playerid, params[])
{
	vehInfo[1][v_attachmodel][1] = 23;
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	attachandoA[playerid] = 1;
	for(new i;i<9;i++)
	{
		if(vehInfo[attachandoA[playerid]][v_attachmodel][i] != 0)
		{
			vehInfo[attachandoA[playerid]][v_attachobject][i] = CreateDynamicObject(objInfo[vehInfo[attachandoA[playerid]][v_attachmodel][i]][o_model], x, y, z, 0.0, 0.0, 0.0, 0, 0, -1, 15);
			EditDynamicObject(playerid, vehInfo[attachandoA[playerid]][v_attachobject][i]);
			editandoCoche[playerid] = i;
		}
	}

	return 1;
}
