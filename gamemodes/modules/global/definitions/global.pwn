#define CAPTION_TEXT_TITLE ""GREY" MAINLAND :"


// ADM
#define BASIC_USER 0
#define BANNED_USER 1
#define STAFF_RANK_HELPER 2
#define STAFF_RANK_MODERATOR_C 3
#define STAFF_RANK_MODERATOR_B 4
#define STAFF_RANK_MODERATOR_A 4
#define STAFF_RANK_ADMINISTRATOR_C 5
#define STAFF_RANK_ADMINISTRATOR_B 6
#define STAFF_RANK_ADMINISTRATOR_A 7
#define STAFF_RANK_FOUNDER 8

// USER 
#define POS_X_SPAWN 6248.2461
#define POS_Y_SPAWN -651.5588
#define POS_Z_SPAWN 5.6164

#define MAX_USER_MARKETS 2
#define MAX_USER_HOUSES 2
#define MAX_USER_COMPANIES 2


// SYSTEMS
#define TYPE_COMPANIES 1
#define TYPE_MARKETS 2
#define TYPE_HOUSES 3

#define MAX_COMPANIES 20
#define MAX_MARKETS 20
#define MAX_HOUSES 30
#define MAX_DOORS 80 + (MAX_COMPANIES + MAX_HOUSES + MAX_MARKETS)

#define MAX_FURNITURES (MAX_COMPANIES + MAX_MARKETS + MAX_HOUSES ) * 30 

#define MAX_FURNITURES_PER_LOCALITY_VIP_0 MAX_COMPANIES * 5
#define MAX_FURNITURES_PER_LOCALITY_VIP_1 MAX_COMPANIES * 7
#define MAX_FURNITURES_PER_LOCALITY_VIP_2 MAX_COMPANIES * 8
#define MAX_FURNITURES_PER_LOCALITY_VIP_3 MAX_COMPANIES * 10

#define MAX_DROPPED_ITEMS 50



sendDoubleLineMessage(playerid, Float:range, color, const message[])
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

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



	for(new i; i<MAX_PLAYERS;i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInRangeOfPoint(i, range, x, y, z))
			{
				if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
				{
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

_@IsNumeric(const string[]){
    for(new i = 0, j = strlen(string); i < j; i++){
        if(string[i] > '9' || string[i] < '0') return 0;
    }
    return 1;
}
