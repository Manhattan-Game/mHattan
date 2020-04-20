cmd:b(playerid, params[])
{	new text[500];
	if(personajeInfo[playerid][p_spawn] == true)
	if(sscanf(params, "s[128]", text)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /b [texto ooc]");
	{
		new string[500];
		format(string, sizeof(string), ""Chat_Blanco"%s"Chat_Gris":((%s))", conseguirNombre(playerid), params);
		enviarmensajeRol(playerid, 12, -1, string);
	}
	return 1;
}

cmd:me(playerid, params[])
{	new text[500];
	if(personajeInfo[playerid][p_spawn] == true)
	if(sscanf(params, "s[128]", text)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /me [texto rol]");
	{
		new string[500];
		format(string, sizeof(string), ""Chat_Me"%s %s", conseguirNombre(playerid), params);
		enviarmensajeRol(playerid, 12, -1, string);
	}
	return 1;
}
cmd:do(playerid, params[])
{	new text[500];
	if(personajeInfo[playerid][p_spawn] == true)
	if(sscanf(params, "s[128]", text)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /me [texto rol]");
	{
		new string[500];
		format(string, sizeof(string), ""Chat_Violeta"%s ((%s))", params, conseguirNombre(playerid));
		enviarmensajeRol(playerid, 12, -1, string);
	}
	return 1;
}
cmd:g(playerid, params[])
{	new text[500];
	if(personajeInfo[playerid][p_spawn] == true)
	if(sscanf(params, "s[128]", text)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /g [gritar]");
	{
		new string[500];
		format(string, sizeof(string), ""Chat_Gris"%s grita: "Chat_Blanco"¡%s!", conseguirNombre(playerid), params);
		enviarmensajeRol(playerid, 22, -1, string);
	}
	return 1;
}
cmd:s(playerid, params[])
{	new text[500];
	if(personajeInfo[playerid][p_spawn] == true)
	if(sscanf(params, "s[128]", text)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /s [susurrar]");
	{
		new string[500];
		format(string, sizeof(string), ""Chat_Gris"%s susurra: "Chat_Violeta"%s", conseguirNombre(playerid), params);
		enviarmensajeRol(playerid, 6, -1, string);
	}
	return 1;
}


cmd:dardinero(playerid, params[])
{
	new id, dinero;
	new string1[128], string2[128];
	if(sscanf(params, "ii", id, dinero)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /dardinero [id] [cantidad]");
	if(IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
	{
		new sumatotal = dinero + personajeInfo[id][p_dinero];
		if(sumatotal < MAX_DINERO_MANO)
		{
			personajeInfo[id][p_dinero] += dinero;
			personajeInfo[playerid][p_dinero] -= dinero;
			format(string1, 128, "El jugador %s te dio $%i dolares", conseguirNombre(playerid),dinero);
			format(string2, 128, "Le diste $%i dolares a %s", dinero, conseguirNombre(id));
			enviarNotificacionG(id, string1);
			enviarNotificacionG(id, string2);
			enviarMoneyNotif(playerid, 1, dinero);
			enviarMoneyNotif(id, 0, dinero);
		}
		else SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" el jugador al que le daras dinero no puede tener mas dinero en mano "Chat_Naranja"(Usa un maletin)");
	}
	return 1;
}
cmd:d(playerid, params[])
{
	new d[128];
	new string[128];
	if(sscanf(params, "s[128]", d)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" usa /d [duda]");
	{
		if(personajeInfo[playerid][p_duda] == 1)
		{
			if(personajeInfo[playerid][p_dudaT] == 0) 
			{
				switch(masterInfo[playerid][_admin])
				{
					case 0: 
					{ 
						format(string, sizeof(string), ""Chat_Gris"[Usuario %s ID:%i] "Chat_Duda"%s", conseguirNombre(playerid), playerid, d);
						timerDudas[playerid] = SetTimerEx("activarTiempoDudas", 60000, false, "d", playerid);
						personajeInfo[playerid][p_dudaT] = 1;

					}
					case 1: format(string, sizeof(string), ""Chat_Gris"[Ayudante %s ID:%i] "Chat_Duda"%s", conseguirNombre(playerid), playerid, d);
					case 2: format(string, sizeof(string), ""Chat_Gris"[Moderador %s ID:%i] "Chat_Duda"%s", conseguirNombre(playerid), playerid, d);
					case 3: format(string, sizeof(string), ""Chat_Gris"[Administrador %s ID:%i] "Chat_Duda"%s", conseguirNombre(playerid), playerid,d);
					case 4: format(string, sizeof(string), ""Chat_Gris"[Administrador Global %s ID:%i] "Chat_Duda"%s", conseguirNombre(playerid), playerid,d);
					case 5: format(string, sizeof(string), ""Chat_Gris"[Sub-Dueño %s ID:%i] "Chat_Duda"%s", conseguirNombre(playerid), playerid,d);
					case 6: format(string, sizeof(string), ""Chat_Gris"[Dueño %s ID:%i] "Chat_Duda"%s", conseguirNombre(playerid), playerid, d);
				}
				for(new i;i<MAX_PLAYERS;i++)
				{
					if(IsPlayerConnected(i))
					{
						if(personajeInfo[i][p_duda] == 1)
						{
							SendClientMessage(i, -1, string);
						}
					}
				}
			} else  enviarNotificacion(playerid, "Debes esperar 60 segundos");
		} else enviarNotificacion(playerid, "No tienes activado el canal dudas");
	}
	return 1;
}

cmd:adudas(playerid, params[])
{
	if(personajeInfo[playerid][p_duda] == 1)
	{
		personajeInfo[playerid][p_duda] = 0;
		SendClientMessage(playerid, -1, ""Chat_Naranja"[MiamiSide]"Chat_Gris" Desactivaste el canal de dudas");
	}
	else
	{
		personajeInfo[playerid][p_duda] = 1;
		SendClientMessage(playerid, -1, ""Chat_Naranja"[MiamiSide]"Chat_Gris" Activaste el canal de dudas");
	}
	return 1;
}

forward activarTiempoDudas(playerid);
public activarTiempoDudas(playerid)
{
	personajeInfo[playerid][p_dudaT] = 0;
	KillTimer(timerDudas[playerid]);
}