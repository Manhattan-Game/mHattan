#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
	inventarioTD = TextDrawCreate(4.666718, 125.962905, "mdl-2001:logo_box");
	TextDrawLetterSize(inventarioTD, 0.000000, 0.000000);
	TextDrawTextSize(inventarioTD, 133.000000, 159.000000);
	TextDrawAlignment(inventarioTD, 1);
	TextDrawColor(inventarioTD, 505290495);
	TextDrawSetShadow(inventarioTD, 0);
	TextDrawSetOutline(inventarioTD, 0);
	TextDrawBackgroundColor(inventarioTD, 255);
	TextDrawFont(inventarioTD, 4);
	TextDrawSetProportional(inventarioTD, 0);
	TextDrawSetShadow(inventarioTD, 0);

	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerConnect(playerid)
{
	inventarioTDD[playerid][0] = CreatePlayerTextDraw(playerid, 20.666690, 140.896347, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][0], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][0], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][0], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][0], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][0], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

	inventarioTDD[playerid][1] = CreatePlayerTextDraw(playerid, 53.000041, 140.896408, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][1], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][1], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][1], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][1], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

	inventarioTDD[playerid][2] = CreatePlayerTextDraw(playerid, 85.333381, 140.896362, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][2], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][2], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][2], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][2], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

	inventarioTDD[playerid][3] = CreatePlayerTextDraw(playerid, 20.666723, 179.474075, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][3], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][3], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][3], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][3], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);

	inventarioTDD[playerid][4] = CreatePlayerTextDraw(playerid, 53.333385, 179.474044, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][4], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][4], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][4], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][4], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][4], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][4], 0.000000, 0.000000, 0.000000, 1.000000);

	inventarioTDD[playerid][5] = CreatePlayerTextDraw(playerid, 85.666717, 179.059234, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][5], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][5], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][5], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][5], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][5], 0.000000, 0.000000, 0.000000, 1.000000);


	inventarioTDD[playerid][6] = CreatePlayerTextDraw(playerid, 20.666715, 218.051834, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][6], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][6], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][6], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][6], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][6], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][6], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][6], 0.000000, 0.000000, 0.000000, 1.000000);

	inventarioTDD[playerid][7] = CreatePlayerTextDraw(playerid, 53.333381, 217.637039, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][7], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][7], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][7], 673720575);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][7], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][7], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][7], 0.000000, 0.000000, 0.000000, 1.000000);



	inventarioTDD[playerid][8] = CreatePlayerTextDraw(playerid, 86.999992, 257.614715, "Usar");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][8], 0.214666, 1.579258);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][8], 115.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][8], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, inventarioTDD[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, inventarioTDD[playerid][8], 673720575);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][8], 255);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][8], true);

	
	inventarioTDD[playerid][9] = CreatePlayerTextDraw(playerid, 54.666652, 258.029541, "Tirar");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][9], 0.214666, 1.579258);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][9], 82.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][9], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, inventarioTDD[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, inventarioTDD[playerid][9], 673720575);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][9], 255);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][9], true);

	inventarioTDD[playerid][10] = CreatePlayerTextDraw(playerid, 15.666699, 132.600006, "mdl-2001:logo_cancel");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][10], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][10], 8.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][10], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][10], 255);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][10], true);

	inventarioTDD[playerid][11] = CreatePlayerTextDraw(playerid, 85.666717, 217.637054, "");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][11], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][11], 30.000000, 35.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][11], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][11], -421075276);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][11], 5);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][11], true);
	PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][11], 19382);
	PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][11], 0.000000, 0.000000, 0.000000, 1.000000);

	inventarioTDD[playerid][12] = CreatePlayerTextDraw(playerid, 21.333322, 258.029541, "Guardar");
	PlayerTextDrawLetterSize(playerid, inventarioTDD[playerid][12], 0.214665, 1.579257);
	PlayerTextDrawTextSize(playerid, inventarioTDD[playerid][12], 50.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, inventarioTDD[playerid][12], 1);
	PlayerTextDrawColor(playerid, inventarioTDD[playerid][12], -1);
	PlayerTextDrawUseBox(playerid, inventarioTDD[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, inventarioTDD[playerid][12], 673720575);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, inventarioTDD[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][12], 255);
	PlayerTextDrawFont(playerid, inventarioTDD[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, inventarioTDD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, inventarioTDD[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, inventarioTDD[playerid][12], true);
	return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == inventarioTDD[playerid][0])
	{
		selectTextDraw(playerid, 0);
	}
	else if(playertextid == inventarioTDD[playerid][1])
	{
		selectTextDraw(playerid, 1);
	}
	else if(playertextid == inventarioTDD[playerid][2])
	{
		selectTextDraw(playerid, 2);
	}
	else if(playertextid == inventarioTDD[playerid][3])
	{
		selectTextDraw(playerid, 3);
	}
	else if(playertextid == inventarioTDD[playerid][4])
	{
		selectTextDraw(playerid, 4);
	}
	else if(playertextid == inventarioTDD[playerid][5])
	{
		selectTextDraw(playerid, 5);
	}
	else if(playertextid == inventarioTDD[playerid][6])
	{
		selectTextDraw(playerid, 6);
	}
	else if(playertextid == inventarioTDD[playerid][7])
	{
		selectTextDraw(playerid, 7);
	}
	else if(playertextid == inventarioTDD[playerid][8]){
		useItem(playerid, inventoryInfo[playerid][selectedIndex]);
	}
	else if(playertextid == inventarioTDD[playerid][9]){
		dropItem(playerid, inventoryInfo[playerid][selectedIndex]);
	}
	else if(playertextid == inventarioTDD[playerid][12]){
		saveUseItem(playerid);
	}
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if(newkeys == KEY_NO){
		showInventory(playerid);
	}
	if(newkeys == KEY_CROUCH)
	{
		getDropItem(playerid);
	}
}
hook OnPlayerDisconnect(playerid, reason){
    saveInventory(playerid);
}
hook OnGameModeExit(){
    for(new i;i<MAX_PLAYERS; i++) saveInventory(i);
}