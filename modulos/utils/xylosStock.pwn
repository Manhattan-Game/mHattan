new cUsuario[MAX_PLAYERS];

stock congelarUsuario(playerid, tiempo)
{
	TogglePlayerControllable(playerid, false);
	cUsuario[playerid] = SetTimerEx("descongelarUsuario", tiempo, false, "d", playerid);
}
forward descongelarUsuario(playerid);
public descongelarUsuario(playerid)
{
	TogglePlayerControllable(playerid, true);
	KillTimer(cUsuario[playerid]);
	return 1;
}

IsNumeric(const string[])
{
    for (new i = 0, j = strlen(string); i < j; i++)
    {
        if (string[i] > '9' || string[i] < '0') return 0;
    }
    return 1;
}


enviarmensajeRol(playerid, rango, color, const mensaje[])
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	for(new i; i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInRangeOfPoint(i, rango, x, y, z))
			{
				if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
				{
					SendClientMessage(i, color, mensaje);
				}

			}
		}
	}
}
