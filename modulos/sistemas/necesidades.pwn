#include <YSI_Coding\y_hooks>


new Text:hud[5];
new PlayerText:hudd[MAX_PLAYERS][4];


hook OnGameModeInit()
{
	hud[0] = TextDrawCreate(-1.999993, 388.125976, "mdl-2001:logo_box");
	TextDrawLetterSize(hud[0], 0.000000, 0.000000);
	TextDrawTextSize(hud[0], 40.000000, 55.000000);
	TextDrawAlignment(hud[0], 1);
	TextDrawColor(hud[0], 505290495);
	TextDrawSetShadow(hud[0], 0);
	TextDrawSetOutline(hud[0], 0);
	TextDrawBackgroundColor(hud[0], 255);
	TextDrawFont(hud[0], 4);
	TextDrawSetProportional(hud[0], 0);
	TextDrawSetShadow(hud[0], 0);

	hud[1] = TextDrawCreate(37.000022, 431.837158, "box");
	TextDrawLetterSize(hud[1], 0.000000, 0.900001);
	TextDrawTextSize(hud[1], 136.000000, 0.000000);
	TextDrawAlignment(hud[1], 1);
	TextDrawColor(hud[1], -1);
	TextDrawUseBox(hud[1], 1);
	TextDrawBoxColor(hud[1], 505290495);
	TextDrawSetShadow(hud[1], 0);
	TextDrawSetOutline(hud[1], 0);
	TextDrawBackgroundColor(hud[1], 255);
	TextDrawFont(hud[1], 1);
	TextDrawSetProportional(hud[1], 1);
	TextDrawSetShadow(hud[1], 0);

	hud[2] = TextDrawCreate(37.333351, 404.044525, "box");
	TextDrawLetterSize(hud[2], 0.000000, 1.066667);
	TextDrawTextSize(hud[2], 136.000000, 0.000000);
	TextDrawAlignment(hud[2], 1);
	TextDrawColor(hud[2], -1);
	TextDrawUseBox(hud[2], 1);
	TextDrawBoxColor(hud[2], 505290495);
	TextDrawSetShadow(hud[2], 0);
	TextDrawSetOutline(hud[2], 0);
	TextDrawBackgroundColor(hud[2], 255);
	TextDrawFont(hud[2], 1);
	TextDrawSetProportional(hud[2], 1);
	TextDrawSetShadow(hud[2], 0);

	hud[3] = TextDrawCreate(37.000019, 418.148254, "box");
	TextDrawLetterSize(hud[3], 0.000000, 0.933333);
	TextDrawTextSize(hud[3], 136.000000, 0.000000);
	TextDrawAlignment(hud[3], 1);
	TextDrawColor(hud[3], -1);
	TextDrawUseBox(hud[3], 1);
	TextDrawBoxColor(hud[3], 505290495);
	TextDrawSetShadow(hud[3], 0);
	TextDrawSetOutline(hud[3], 0);
	TextDrawBackgroundColor(hud[3], 255);
	TextDrawFont(hud[3], 1);
	TextDrawSetProportional(hud[3], 1);
	TextDrawSetShadow(hud[3], 0);

	hud[4] = TextDrawCreate(36.666675, 389.785400, "mdl-2001:logo_box");
	TextDrawLetterSize(hud[4], 0.000000, 0.000000);
	TextDrawTextSize(hud[4], 36.000000, 11.000000);
	TextDrawAlignment(hud[4], 1);
	TextDrawColor(hud[4], -1523963137);
	TextDrawSetShadow(hud[4], 0);
	TextDrawSetOutline(hud[4], 0);
	TextDrawBackgroundColor(hud[4], 255);
	TextDrawFont(hud[4], 4);
	TextDrawSetProportional(hud[4], 0);
	return 1;
}
hook OnGameModeExit()
{
	for(new i;i<7;i++) TextDrawDestroy(hud[i]);
	return 0;
}
stock conseguirMAXexp(playerid)
{
	switch(personajeInfo[playerid][p_nivel])
	{
		case 0: maxEXP[playerid]=1;
		case 1: maxEXP[playerid]=2;
		case 2: maxEXP[playerid]=3;
		case 3: maxEXP[playerid]=4;
		case 4: maxEXP[playerid]=5;
		case 5: maxEXP[playerid]=6;
		case 6: maxEXP[playerid]=7;
		case 7: maxEXP[playerid]=8;
		case 8: maxEXP[playerid]=9;
		case 9: maxEXP[playerid]=10;
		case 10: maxEXP[playerid]=11;
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	conseguirMAXexp(playerid);

	// TEXTDRAW

	hudd[playerid][0] = CreatePlayerTextDraw(playerid, -9.666721, 354.940582, "");
	PlayerTextDrawLetterSize(playerid, hudd[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, hudd[playerid][0], 53.000000, 118.000000);
	PlayerTextDrawAlignment(playerid, hudd[playerid][0], 1);
	PlayerTextDrawColor(playerid, hudd[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, hudd[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, hudd[playerid][0], 0);
	PlayerTextDrawFont(playerid, hudd[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, hudd[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, hudd[playerid][0], 11746);
	PlayerTextDrawSetPreviewRot(playerid, hudd[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

	hudd[playerid][1] = CreatePlayerTextDraw(playerid, 48.666675, 404.044433, "Thommas_Shelby");
	PlayerTextDrawLetterSize(playerid, hudd[playerid][1], 0.253999, 1.110518);
	PlayerTextDrawAlignment(playerid, hudd[playerid][1], 1);
	PlayerTextDrawColor(playerid, hudd[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, hudd[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, hudd[playerid][1], 255);
	PlayerTextDrawFont(playerid, hudd[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, hudd[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][1], 0);

	hudd[playerid][2] = CreatePlayerTextDraw(playerid, 50.000003, 416.903686, "$104985737349");
	PlayerTextDrawLetterSize(playerid, hudd[playerid][2], 0.253999, 1.110518);
	PlayerTextDrawAlignment(playerid, hudd[playerid][2], 1);
	PlayerTextDrawColor(playerid, hudd[playerid][2], 8388863);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, hudd[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, hudd[playerid][2], 255);
	PlayerTextDrawFont(playerid, hudd[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, hudd[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][2], 0);

	hudd[playerid][3] = CreatePlayerTextDraw(playerid, 43.333335, 389.940643, "VIP_1");
	PlayerTextDrawLetterSize(playerid, hudd[playerid][3], 0.231999, 0.932148);
	PlayerTextDrawAlignment(playerid, hudd[playerid][3], 1);
	PlayerTextDrawColor(playerid, hudd[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, hudd[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, hudd[playerid][3], 255);
	PlayerTextDrawFont(playerid, hudd[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, hudd[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, hudd[playerid][3], 0);
	return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	return 0;
}
hook loguearPersonaje(playerid)
{

		new string[40];
		format(string, 40, "$%i", personajeInfo[playerid][p_dinero]);
		PlayerTextDrawSetString(playerid, hudd[playerid][2], string);

		PlayerTextDrawSetString(playerid,hudd[playerid][1], personajeInfo[playerid][p_nombre]);

        for(new i; i<4; i++) PlayerTextDrawShow(playerid, hudd[playerid][i]);
        for(new j;j<5;j++) TextDrawShowForPlayer(playerid, hud[j]);
}
forward bajarComida(playerid);
public bajarComida(playerid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		personajeInfo[playerid][p_hambre] -= 2;
		if(personajeInfo[playerid][p_hambre] < 10)
		{
			personajeInfo[playerid][p_vida] -= 20;
		}
	} else KillTimer(timerBajar[playerid]);
}

forward bajarSed(playerid);
public bajarSed(playerid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		personajeInfo[playerid][p_sed] -= 2;
		if(personajeInfo[playerid][p_sed] < 10)
		{
			personajeInfo[playerid][p_vida] -= 2;
			enviarNotificacion(playerid, "Te estas deshidratando");
		}
	} else KillTimer(timerBajar2[playerid]);
}

public OnPlayerUpdate(playerid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		actualizarBarra(playerid, 0, personajeInfo[playerid][p_vida]);
		actualizarBarra(playerid, 1, personajeInfo[playerid][p_chaleco]);	
	}
}