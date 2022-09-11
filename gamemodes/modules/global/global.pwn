
sendDoubleLineMessage(playerid, Float:range, color, const message[])
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	new string[128];
	new string1[128];
	new count;
	for(new d;d<strlen(message);d++)
	{	
		if(d < 100)
		{
			string[d] = message[d];
		}
		else if(d > 100)
		{
			string1[count] = message[d];
			count++;
		}
	}



	for(new i; i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInRangeOfPoint(i, range, x, y, z))
			{
				if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
				{
					if(strlen(message) > 100)
					{
						strcat(string, " - ");
						SendClientMessage(i, color, string);
						SendClientMessage(i, color, string1);
					}
					else if(strlen(message) < 100)
					{
						SendClientMessage(i, color, string);
					}
				}

			}
		}
	}
}

GetCompleteDate(){
	new Hour, Minute, Second;
	gettime(Hour, Minute, Second);
	new Year, Month, Day;
	getdate(Year, Month, Day);

	new str[QUERY_LOW];
	format(str, sizeof(str), "%i:%i del %i/%i/%i", Hour, Minute, Day, Month, Year);
	return str;
}

GetFullName(playerid)
{
    new name[24];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}

new freezeuser[MAX_PLAYERS];

stock freezeUser(playerid, time)
{
	TogglePlayerControllable(playerid, false);
	freezeuser[playerid] = SetTimerEx("unfreezeUser", time, false, "d", playerid);
}
forward unfreezeUser(playerid);
public unfreezeUser(playerid)
{
	TogglePlayerControllable(playerid, true);
	KillTimer(freezeuser[playerid]);
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
