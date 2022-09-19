cmd:dormir(playerid, params[]){
	useFurniture(playerid);
	return 1;
}

furnitureSleep(playerid, Float:xx, Float:yy, Float:zz){
	SetPlayerPos(playerid, xx, yy, zz+0.5);
	new Float:angl;
	GetPlayerFacingAngle(playerid, angl);
	SetPlayerFacingAngle(playerid, angl-90.0);
	ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R",4.0, 1, 0, 0, 0, 0);
}

furnitureSeat(playerid){
	new Float:angl;
	GetPlayerFacingAngle(playerid, angl);
	SetPlayerFacingAngle(playerid, angl+180.0);
	ApplyAnimation(playerid,"ped","SEAT_down",4.0, 0, 0, 0, 0, 0);
}