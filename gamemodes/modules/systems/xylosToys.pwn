#include <YSI_Coding\y_hooks>


new Text:prendasTD[2];
new PlayerText:prendasTDD[MAX_PLAYERS][9];
new eligiendoPrenda[MAX_PLAYERS];

enum toys_models
{
	model_id,
	model_object,
	model_nombre[30]
};
new toysModelos[][toys_models] =
{
	{0, 19382, "Nada"},
	{1, 19086, "Gorra"}
};


enum _toys_Info
{
	t_id,
	t_index[4],
	t_modelo[4],
	t_cuerpo[4],
	Float:fOffsetX[4], 
	Float:fOffsetY[4], 
	Float:fOffsetZ[4], 
	Float:fRotX[4], 
	Float:fRotY[4], 
	Float:fRotZ[4], 
	Float:fScaleX[4], 
	Float:fScaleY[4], 
	Float:fScaleZ[4]
};
new toysInfo[MAX_PLAYERS][_toys_Info];


hook OnGameModeInit()
{
	prendasTD[0] = TextDrawCreate(386.380859, 113.199996, "box");
	TextDrawLetterSize(prendasTD[0], 0.000000, 19.752407);
	TextDrawTextSize(prendasTD[0], 469.000000, 0.000000);
	TextDrawAlignment(prendasTD[0], 1);
	TextDrawColor(prendasTD[0], -1);
	TextDrawUseBox(prendasTD[0], 1);
	TextDrawBoxColor(prendasTD[0], 1145324684);
	TextDrawSetShadow(prendasTD[0], 0);
	TextDrawSetOutline(prendasTD[0], 0);
	TextDrawBackgroundColor(prendasTD[0], 255);
	TextDrawFont(prendasTD[0], 1);
	TextDrawSetProportional(prendasTD[0], 1);
	TextDrawSetShadow(prendasTD[0], 0);

	prendasTD[1] = TextDrawCreate(386.000000, 98.266693, "Prendas");
	TextDrawLetterSize(prendasTD[1], 0.207616, 0.917330);
	TextDrawTextSize(prendasTD[1], 469.000000, 0.000000);
	TextDrawAlignment(prendasTD[1], 1);
	TextDrawColor(prendasTD[1], -1);
	TextDrawUseBox(prendasTD[1], 1);
	TextDrawBoxColor(prendasTD[1], -2147450625);
	TextDrawSetShadow(prendasTD[1], 0);
	TextDrawSetOutline(prendasTD[1], 0);
	TextDrawBackgroundColor(prendasTD[1], 255);
	TextDrawFont(prendasTD[1], 2);
	TextDrawSetProportional(prendasTD[1], 1);
	TextDrawSetShadow(prendasTD[1], 0);
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnGameModeExit()
{
	for(new i; i<2; i++) TextDrawDestroy(prendasTD[i]);
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerConnect(playerid)
{
	toysInfo[playerid][t_modelo][1] = 1;
	prendasTDD[playerid][0] = CreatePlayerTextDraw(playerid, 388.428283, 129.826660, "");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][0], 37.000000, 44.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][0], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][0], -2118609258);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][0], true);
	PlayerTextDrawSetPreviewModel(playerid, prendasTDD[playerid][0], 19382);
	PlayerTextDrawSetPreviewRot(playerid, prendasTDD[playerid][0], 0.000000, 0.000000, 180.000000, 1.000000);

	prendasTDD[playerid][1] = CreatePlayerTextDraw(playerid, 429.190155, 129.399993, "");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][1], 37.000000, 44.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][1], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][1], -2118609258);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, prendasTDD[playerid][1], 19382);
	PlayerTextDrawSetPreviewRot(playerid, prendasTDD[playerid][1], 0.000000, 0.000000, 180.000000, 1.000000);

	prendasTDD[playerid][2] = CreatePlayerTextDraw(playerid, 388.428314, 178.893280, "");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][2], 37.000000, 44.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][2], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][2], -2118609258);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, prendasTDD[playerid][2], 19382);
	PlayerTextDrawSetPreviewRot(playerid, prendasTDD[playerid][2], 0.000000, 0.000000, 180.000000, 1.000000);

	prendasTDD[playerid][3] = CreatePlayerTextDraw(playerid, 429.190246, 178.466613, "");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][3], 37.000000, 44.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][3], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][3], -2118609258);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, prendasTDD[playerid][3], 19382);
	PlayerTextDrawSetPreviewRot(playerid, prendasTDD[playerid][3], 0.000000, 0.000000, 180.000000, 1.000000);

	prendasTDD[playerid][4] = CreatePlayerTextDraw(playerid, 409.238189, 230.106689, "Usar");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][4], 0.296380, 0.985598);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][4], 442.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][4], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][4], -2139062017);
	PlayerTextDrawUseBox(playerid, prendasTDD[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, prendasTDD[playerid][4], 8388863);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][4], 255);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][4], true);

	prendasTDD[playerid][5] = CreatePlayerTextDraw(playerid, 409.238189, 246.746673, "Quitar");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][5], 0.228569, 0.989862);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][5], 442.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][5], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][5], -2139062017);
	PlayerTextDrawUseBox(playerid, prendasTDD[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, prendasTDD[playerid][5], -2147483393);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][5], 255);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][5], true);

	prendasTDD[playerid][6] = CreatePlayerTextDraw(playerid, 408.857360, 262.533325, "editar");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][6], 0.220189, 1.045331);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][6], 443.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][6], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][6], -2139062017);
	PlayerTextDrawUseBox(playerid, prendasTDD[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, prendasTDD[playerid][6], -2147450625);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][6], 255);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][6], true);

	prendasTDD[playerid][7] = CreatePlayerTextDraw(playerid, 395.904907, 279.173309, "CAMBIAR");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][7], 0.341713, 1.006929);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][7], 460.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][7], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][7], -2139062017);
	PlayerTextDrawUseBox(playerid, prendasTDD[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, prendasTDD[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][7], 255);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][7], true);

	prendasTDD[playerid][8] = CreatePlayerTextDraw(playerid, 474.000091, 98.693321, "X");
	PlayerTextDrawLetterSize(playerid, prendasTDD[playerid][8], 0.335236, 0.861863);
	PlayerTextDrawTextSize(playerid, prendasTDD[playerid][8], 483.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, prendasTDD[playerid][8], 1);
	PlayerTextDrawColor(playerid, prendasTDD[playerid][8], -2139062017);
	PlayerTextDrawUseBox(playerid, prendasTDD[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, prendasTDD[playerid][8], -2147483393);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, prendasTDD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, prendasTDD[playerid][8], 255);
	PlayerTextDrawFont(playerid, prendasTDD[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, prendasTDD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, prendasTDD[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, prendasTDD[playerid][8], true);

	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	for(new i;i<9; i++) PlayerTextDrawDestroy(playerid, prendasTDD[playerid][i]);
	return Y_HOOKS_CONTINUE_RETURN_1;
}
cmd:prendas(playerid, params[])
{
	mostrarmenuPrendas(playerid);
	return 1;
}
stock mostrarmenuPrendas(playerid)
{
	for(new j; j<4; j++) toysInfo[playerid][t_index][j] = j;
	for(new i;i<4;i++)
	{
		PlayerTextDrawSetPreviewModel(playerid, prendasTDD[playerid][i], toysModelos[toysInfo[playerid][t_modelo][i]][model_object]);
	}
	for(new h;h<9; h++) PlayerTextDrawShow(playerid, prendasTDD[playerid][h]);
	for(new p;p<2;p++) TextDrawShowForPlayer(playerid, prendasTD[p]);
	mirandoprendas[playerid] = true;
}

hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == prendasTDD[playerid][0])
	{
		eligiendoPrenda[playerid] = 0;
	}
	if(playertextid == prendasTDD[playerid][1])
	{
		eligiendoPrenda[playerid] = 1;
	}

	if(playertextid == prendasTDD[playerid][2])
	{
		eligiendoPrenda[playerid] = 2;
	}

	if(playertextid == prendasTDD[playerid][3])
	{
		eligiendoPrenda[playerid] = 3;
	}
	if(playertextid == prendasTDD[playerid][4])
	{
		if(toysInfo[playerid][t_modelo][eligiendoPrenda[playerid]] == 0)
		{
			attacharPrenda(playerid, eligiendoPrenda[playerid]);
		}
	}
	if(playertextid == prendasTDD[playerid][8])
	{
		for(new h;h<9; h++) PlayerTextDrawHide(playerid, prendasTDD[playerid][h]);
		for(new p;p<2;p++) TextDrawHideForPlayer(playerid, prendasTD[p]);
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}


stock attacharPrenda(playerid, slotid)
{
	SetPlayerAttachedObject(playerid, 
	toysInfo[playerid][t_index][slotid],
	toysModelos[toysInfo[playerid][t_modelo][slotid]][model_object],
	toysInfo[playerid][t_cuerpo][slotid], 
	toysInfo[playerid][fOffsetX][slotid],
	toysInfo[playerid][fOffsetY][slotid], 
	toysInfo[playerid][fOffsetZ][slotid], 
	toysInfo[playerid][fRotX][slotid], 
	toysInfo[playerid][fRotY][slotid], 
	toysInfo[playerid][fRotZ][slotid], 
	toysInfo[playerid][fScaleX][slotid], 
	toysInfo[playerid][fScaleY][slotid], 
	toysInfo[playerid][fScaleZ][slotid]);
}