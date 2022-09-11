new 
	ok[MAX_PLAYERS],
	pNavState[MAX_PLAYERS],
	pNavTimer[MAX_PLAYERS]
;




hook OnPlayerDisconnect(playerid, reason)
{
	if(pNavState[playerid])
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);
		DisablePlayerCheckpoint(playerid);
		pNavState[playerid] = 0;
	}
	return 1;
}
cmd:prueba3(playerid, params)
{
	initRouteNavigator(playerid, 5948.4463,54.3746,4.6605);
	return 1;
}
cmd:navclose(playerid, params[])
{
	if(pNavState[playerid])
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);
		
		DisablePlayerCheckpoint(playerid);
		pNavState[playerid] = 0;
		ShowInfoForPlayer(playerid, "Cancelaste la navegacion", 3000);
	}
	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(pNavState[playerid])
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);
		
		DisablePlayerCheckpoint(playerid);
		pNavState[playerid] = 0;
	}
	return 1;
}

initRouteNavigator(playerid, Float:x, Float:y, Float:z)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		SetPlayerCheckpoint(playerid, x, y, z, 1.0);

		if(IsValidObject(ok[playerid])) DestroyObject(ok[playerid]);
		ok[playerid] = CreateObject(19133, 0, 0, 0, 0, 0, 0);	
			
		KillTimer(pNavTimer[playerid]);
		pNavTimer[playerid] = SetTimerEx("Refresh", 100, true, "dfff", playerid, x, y, z);
		pNavState[playerid] = 1;
	}
}

stock Float:PointAngle(playerid, Float:xa, Float:ya, Float:xb, Float:yb)
{
	new Float:carangle;
	new Float:xc, Float:yc;
	new Float:angle;
	xc = floatabs(floatsub(xa,xb));
	yc = floatabs(floatsub(ya,yb));
	if (yc == 0.0 || xc == 0.0)
	{
		if(yc == 0 && xc > 0) angle = 0.0;
		else if(yc == 0 && xc < 0) angle = 180.0;
		else if(yc > 0 && xc == 0) angle = 90.0;
		else if(yc < 0 && xc == 0) angle = 270.0;
		else if(yc == 0 && xc == 0) angle = 0.0;
	}
	else
	{
		angle = atan(xc/yc);
		if(xb > xa && yb <= ya) angle += 90.0;
		else if(xb <= xa && yb < ya) angle = floatsub(90.0, angle);
		else if(xb < xa && yb >= ya) angle -= 90.0;
		else if(xb >= xa && yb > ya) angle = floatsub(270.0, angle);
	}
	GetVehicleZAngle(GetPlayerVehicleID(playerid), carangle);
	return floatadd(angle, -carangle);
}

forward Refresh(playerid, Float:x, Float:y, Float:z);
public Refresh(playerid, Float:x, Float:y, Float:z)
{
	new Float:pos[3], Float:pPos[3];
	pPos[0] = x;
	pPos[1] = y;
	pPos[2] = z;
	GetVehiclePos(GetPlayerVehicleID(playerid), pos[0], pos[1], pos[2]);
	new Float:rot = PointAngle(playerid, pos[0], pos[1], pPos[0], pPos[1]);
	AttachObjectToVehicle(ok[playerid], GetPlayerVehicleID(playerid), 0.000000, 0.000000, 1.399998, 0.000000, 270.0, rot + 180);
	if(IsPlayerInRangeOfPoint(playerid, 10.0, pPos[0], pPos[1], pPos[2]))
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);	
		DisablePlayerCheckpoint(playerid);		
		pNavState[playerid] = 0;
		ShowInfoForPlayer(playerid, "Llegaste a destino", 3000);
	}
	return 1;
}