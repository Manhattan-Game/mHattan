#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	inventario_TD[0] = TextDrawCreate(226.581237, 97.249984, "mdl-2001:box_box");
	TextDrawTextSize(inventario_TD[0], 187.000000, 266.000000);
	TextDrawAlignment(inventario_TD[0], 1);
	TextDrawColor(inventario_TD[0], 336860360);
	TextDrawSetShadow(inventario_TD[0], 0);
	TextDrawBackgroundColor(inventario_TD[0], 255);
	TextDrawFont(inventario_TD[0], 4);
	TextDrawSetProportional(inventario_TD[0], 0);

	inventario_TD[1] = TextDrawCreate(235.182998, 103.666671, "Inventario");
	TextDrawLetterSize(inventario_TD[1], 0.376105, 1.127499);
	TextDrawAlignment(inventario_TD[1], 1);
	TextDrawColor(inventario_TD[1], -1);
	TextDrawSetShadow(inventario_TD[1], 0);
	TextDrawBackgroundColor(inventario_TD[1], 255);
	TextDrawFont(inventario_TD[1], 1);
	TextDrawSetProportional(inventario_TD[1], 1);

	inventario_TD[2] = TextDrawCreate(400.571258, 102.500030, "x");
	TextDrawLetterSize(inventario_TD[2], 0.315666, 1.092499);
	TextDrawTextSize(inventario_TD[2], 412.000000, 10.000000);
	TextDrawAlignment(inventario_TD[2], 1);
	TextDrawColor(inventario_TD[2], -16776961);
	TextDrawSetShadow(inventario_TD[2], 0);
	TextDrawBackgroundColor(inventario_TD[2], 255);
	TextDrawFont(inventario_TD[2], 2);
	TextDrawSetProportional(inventario_TD[2], 1);
	TextDrawSetSelectable(inventario_TD[3], true);

	inventario_TD[3] = TextDrawCreate(263.294250, 335.833404, "Mano");
	TextDrawLetterSize(inventario_TD[3], 0.292708, 1.308333);
	TextDrawTextSize(inventario_TD[3], 15.000000, 53.000000);
	TextDrawAlignment(inventario_TD[3], 2);
	TextDrawColor(inventario_TD[3], -1);
	TextDrawUseBox(inventario_TD[3], 1);
	TextDrawBoxColor(inventario_TD[3], 168430335);
	TextDrawSetShadow(inventario_TD[3], 0);
	TextDrawBackgroundColor(inventario_TD[3], 255);
	TextDrawFont(inventario_TD[3], 1);
	TextDrawSetProportional(inventario_TD[3], 1);
	TextDrawSetSelectable(inventario_TD[3], true);

	inventario_TD[4] = TextDrawCreate(320.922485, 335.833435, "Guardar");
	TextDrawLetterSize(inventario_TD[4], 0.292708, 1.308333);
	TextDrawTextSize(inventario_TD[4], 15.000000, 53.000000);
	TextDrawAlignment(inventario_TD[4], 2);
	TextDrawColor(inventario_TD[4], -1);
	TextDrawUseBox(inventario_TD[4], 1);
	TextDrawBoxColor(inventario_TD[4], 168430335);
	TextDrawSetShadow(inventario_TD[4], 0);
	TextDrawBackgroundColor(inventario_TD[4], 255);
	TextDrawFont(inventario_TD[4], 1);
	TextDrawSetProportional(inventario_TD[4], 1);
	TextDrawSetSelectable(inventario_TD[4], true);

	inventario_TD[5] = TextDrawCreate(379.019348, 335.833526, "Tirar");
	TextDrawLetterSize(inventario_TD[5], 0.292708, 1.308333);
	TextDrawTextSize(inventario_TD[5], 15.000000, 52.000000);
	TextDrawAlignment(inventario_TD[5], 2);
	TextDrawColor(inventario_TD[5], -1);
	TextDrawUseBox(inventario_TD[5], 1);
	TextDrawBoxColor(inventario_TD[5], 168430335);
	TextDrawSetShadow(inventario_TD[5], 0);
	TextDrawBackgroundColor(inventario_TD[5], 255);
	TextDrawFont(inventario_TD[5], 1);
	TextDrawSetProportional(inventario_TD[5], 1);
	TextDrawSetSelectable(inventario_TD[5], true);

	inventario_TD[6] = TextDrawCreate(237.057052, 335.833312, "box");
	TextDrawLetterSize(inventario_TD[6], 0.000000, 1.285507);
	TextDrawTextSize(inventario_TD[6], 235.000000, 0.000000);
	TextDrawAlignment(inventario_TD[6], 1);
	TextDrawColor(inventario_TD[6], -1);
	TextDrawUseBox(inventario_TD[6], 1);
	TextDrawBoxColor(inventario_TD[6], 54473727);
	TextDrawSetShadow(inventario_TD[6], 0);
	TextDrawBackgroundColor(inventario_TD[6], 255);
	TextDrawFont(inventario_TD[6], 2);
	TextDrawSetProportional(inventario_TD[6], 1);

	inventario_TD[7] = TextDrawCreate(294.685180, 335.833251, "box");
	TextDrawLetterSize(inventario_TD[7], 0.000000, 1.285507);
	TextDrawTextSize(inventario_TD[7], 293.000000, 0.000000);
	TextDrawAlignment(inventario_TD[7], 1);
	TextDrawColor(inventario_TD[7], -1);
	TextDrawUseBox(inventario_TD[7], 1);
	TextDrawBoxColor(inventario_TD[7], 54473727);
	TextDrawSetShadow(inventario_TD[7], 0);
	TextDrawBackgroundColor(inventario_TD[7], 255);
	TextDrawFont(inventario_TD[7], 2);
	TextDrawSetProportional(inventario_TD[7], 1);

	inventario_TD[8] = TextDrawCreate(352.781738, 335.833404, "box");
	TextDrawLetterSize(inventario_TD[8], 0.000000, 1.285507);
	TextDrawTextSize(inventario_TD[8], 351.000000, 0.000000);
	TextDrawAlignment(inventario_TD[8], 1);
	TextDrawColor(inventario_TD[8], -1);
	TextDrawUseBox(inventario_TD[8], 1);
	TextDrawBoxColor(inventario_TD[8], 54473727);
	TextDrawSetShadow(inventario_TD[8], 0);
	TextDrawBackgroundColor(inventario_TD[8], 255);
	TextDrawFont(inventario_TD[8], 2);
	TextDrawSetProportional(inventario_TD[8], 1);


	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerConnect(playerid)
{
	inventario_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 235.014572, 119.416679, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][0], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][0], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][0], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][0], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][0], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 292.174133, 119.416687, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][1], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][1], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][1], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][1], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 349.333984, 119.416671, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][2], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][2], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][2], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][2], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 235.014678, 183.583328, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][3], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][3], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][3], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][3], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 292.174255, 183.583312, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][4], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][4], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][4], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][4], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][4], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 349.333923, 183.583312, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][5], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][5], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][5], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][5], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 235.014694, 247.749969, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][6], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][6], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][6], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][6], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][6], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][6], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 292.174224, 247.749969, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][7], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][7], 168430335);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][7], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][7], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][7], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][8] = CreatePlayerTextDraw(playerid, 349.333831, 247.749938, "");
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][8], 56.000000, 63.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][8], 336860415);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][8], 5);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, inventario_PTD[playerid][8], true);
	PlayerTextDrawSetPreviewModel(playerid, inventario_PTD[playerid][8], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, inventario_PTD[playerid][8], 0.000000, 0.000000, 0.000000, 1.200000);

	inventario_PTD[playerid][9] = CreatePlayerTextDraw(playerid, 236.588577, 315.999908, "Selecciona un item");
	PlayerTextDrawLetterSize(playerid, inventario_PTD[playerid][9], 0.206500, 1.139166);
	PlayerTextDrawTextSize(playerid, inventario_PTD[playerid][9], 403.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, inventario_PTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, inventario_PTD[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, inventario_PTD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, inventario_PTD[playerid][9], 255);
	PlayerTextDrawFont(playerid, inventario_PTD[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, inventario_PTD[playerid][9], 1);
	return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OnPlayerClickTextDraw(playerid, Text:clickedid){
	if(clickedid == inventario_TD[3]){
		useItem(playerid, inventoryInfo[playerid][selectedIndex]);
	}
	else if(clickedid == inventario_TD[5]){
		dropItem(playerid, inventoryInfo[playerid][selectedIndex]);
	}
	else if(clickedid == inventario_TD[4]){
		saveUseItem(playerid);
	} else if(clickedid == inventario_TD[2]){
		hideInventory(playerid);
	}
}
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == inventario_PTD[playerid][0])
	{
		selectTextDraw(playerid, 0);
	}
	else if(playertextid == inventario_PTD[playerid][1])
	{
		selectTextDraw(playerid, 1);
	}
	else if(playertextid == inventario_PTD[playerid][2])
	{
		selectTextDraw(playerid, 2);
	}
	else if(playertextid == inventario_PTD[playerid][3])
	{
		selectTextDraw(playerid, 3);
	}
	else if(playertextid == inventario_PTD[playerid][4])
	{
		selectTextDraw(playerid, 4);
	}
	else if(playertextid == inventario_PTD[playerid][5])
	{
		selectTextDraw(playerid, 5);
	}
	else if(playertextid == inventario_PTD[playerid][6])
	{
		selectTextDraw(playerid, 6);
	}
	else if(playertextid == inventario_PTD[playerid][7])
	{
		selectTextDraw(playerid, 7);
	}
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if(newkeys == KEY_NO){
		showInventory(playerid);
	}else if(newkeys == KEY_CROUCH){
		getDropItem(playerid);
	}
}
hook OnGameModeExit(){
    for(new i;i<MAX_PLAYERS; i++) saveInventory(i);
}