#include <YSI_Coding\y_hooks>

new anticheat[MAX_PLAYERS];
new weapon1[MAX_PLAYERS];
new weapon2[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	anticheat[playerid] = SetTimerEx("anticheatFunc", 1000, true, "d", playerid);
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	/*if(IsPlayerConnected(playerid)) return 0;
	if(IsPlayerConnected(issuerid)) return 0;
	{

	}*/
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid)
	{
		case 22: weapon1[playerid]=1;
		case 23: weapon1[playerid]=2;
		case 24: weapon1[playerid]=3;
		case 25: weapon1[playerid]=4;
		case 28: weapon1[playerid]=5;
		case 29: weapon1[playerid]=6;
		case 30: weapon1[playerid]=7;
		case 31: weapon1[playerid]=8;
		case 33: weapon1[playerid]=9;
		case 34: weapon1[playerid]=10;
	}
	if(inventarioInfo[playerid][i_slot][8] != weapon1[playerid])
	{
		masterInfo[playerid][_whitelist] = 1;
		new string[200];
		format(string, sizeof(string), ""Chat_Naranja"[MiamiSide]"Chat_Gris" el jugador "Chat_Rojo"%s"Chat_Gris" fue baneado del servidor por cheat de armas", personajeInfo[playerid][p_nombre]);
		SendClientMessageToAll(-1, string);
		SetTimerEx("KickearPlayer", 2000, false, "d", playerid);
	}

	return Y_HOOKS_CONTINUE_RETURN_1;
}

forward anticheatFunc(playerid);
public anticheatFunc(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(personajeInfo[playerid][p_spawn] == true)
		{
		    ResetPlayerMoney(playerid);
	        GivePlayerMoney(playerid, personajeInfo[playerid][p_dinero]);
	        SetPlayerHealth(playerid, personajeInfo[playerid][p_vida]);
	        SetPlayerArmour(playerid, personajeInfo[playerid][p_chaleco]);
	        if(inventarioInfo[playerid][i_slot][8] == 1 || inventarioInfo[playerid][i_slot][8] == 2 || inventarioInfo[playerid][i_slot][8] == 3 || inventarioInfo[playerid][i_slot][8] == 4 || inventarioInfo[playerid][i_slot][8] == 5 || inventarioInfo[playerid][i_slot][8] == 6 || inventarioInfo[playerid][i_slot][8] == 7 || inventarioInfo[playerid][i_slot][8] == 8 || inventarioInfo[playerid][i_slot][8] == 9 || inventarioInfo[playerid][i_slot][8] == 10)
	        {
	        	weapon2[playerid] = GetPlayerWeapon(playerid);
	        	switch(weapon2[playerid])
				{
					case 22: weapon2[playerid]=1;
					case 23: weapon2[playerid]=2;
					case 24: weapon2[playerid]=3;
					case 25: weapon2[playerid]=4;
					case 28: weapon2[playerid]=5;
					case 29: weapon2[playerid]=6;
					case 30: weapon2[playerid]=7;
					case 31: weapon2[playerid]=8;
					case 33: weapon2[playerid]=9;
					case 34: weapon2[playerid]=10;
				}
				if(inventarioInfo[playerid][i_slot][8] == weapon2[playerid])
				{
					inventarioInfo[playerid][i_slotcant][8] = GetPlayerAmmo(playerid);


			    	if(inventarioInfo[playerid][i_slotcant][8] == 0)
			    	{
			    		ResetPlayerWeapons(playerid);
			    		SetPlayerAttachedObject(playerid, 0, objInfo[inventarioInfo[playerid][i_slot][8]][o_model], 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
			    	}
				}
		    } 
	    }
	}
	else KillTimer(anticheat[playerid]);
}

forward KickearPlayer(playerid);
public KickearPlayer(playerid)
{
	Kick(playerid);
}

