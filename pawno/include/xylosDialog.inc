#if defined _xylosDialog_included
  #endinput
#endif
#define _xylosDialog_included

#include <a_samp>
#include <YSI_Coding\y_hooks>

//DEFINE_HOOK_REPLACEMENT(OnPlayer, OP_);


forward OnXylosDialogResponse(playerid, dialogid, list);


#define MAX_XYLOS_DIALOG 100
#define TYPE_MODEL 0
#define TYPE_MSG 1

enum objets_info
{
	ot_id,
	o_model,
	Float:o_root[4],
	o_nombre[40],
	o_info[200]
};
// Agregar Objetos
new objIinfo[][objets_info] =
{
//  id   modelo    rotacion          nombre         informacion	
	{0, 19382, {0.0, 0.0, 0.0, 1.5}, "nada", "no_tienes_nada"},
	{1, 3014, {0.0, 0.0, 0.0, 0.0}, "Comun_Box_$5", " h"},
	{2, 19572, {0.0, 0.0, 0.0, 0.0}, "Silver_Box_$10", " h"},
	{3, 19918, {0.0, 0.0, 0.0, 0.0}, "Golden_Box_$20", "h "}
	//KEY_HANDBRAKE
};

new mirandoDialog[MAX_PLAYERS] = -1;
new dialogPag[MAX_PLAYERS] = 1;
new seleccionDialog[MAX_PLAYERS];


new dialogCount;

new Text:dialogT[3];
new PlayerText:dialogPreview[MAX_PLAYERS][12];
new PlayerText:dialogMsg[MAX_PLAYERS][4];

new bool:playerViendoTextDraw[MAX_PLAYERS];
 enum _xylos@Dialogs
{
	dialog_type,
	dialog_titulo[80],
	dialog_msg[300],
	dialog_items[20],
	dialog_pages,
	dialog_button[80],
	dialog_used
};
new dialogInfo[MAX_XYLOS_DIALOG][_xylos@Dialogs];

hook OnGameModeInit()
{

	dialogT[0] = TextDrawCreate(223.809646, 4.400057, "60");
	TextDrawLetterSize(dialogT[0], 0.000000, 6.342864);
	TextDrawTextSize(dialogT[0], 437.000000, 0.000000);
	TextDrawAlignment(dialogT[0], 1);
	TextDrawColor(dialogT[0], -1);
	TextDrawUseBox(dialogT[0], 1);
	TextDrawBoxColor(dialogT[0], 1010580630);
	TextDrawSetShadow(dialogT[0], 0);
	TextDrawSetOutline(dialogT[0], 0);
	TextDrawBackgroundColor(dialogT[0], 255);
	TextDrawFont(dialogT[0], 1);
	TextDrawSetProportional(dialogT[0], 1);
	TextDrawSetShadow(dialogT[0], 0);

	dialogT[1] = TextDrawCreate(363.000030, 56.688869, "mdl-2001:logo_button");
	TextDrawLetterSize(dialogT[1], 0.000000, 0.000000);
	TextDrawTextSize(dialogT[1], 78.000000, 32.000000);
	TextDrawAlignment(dialogT[1], 1);
	TextDrawColor(dialogT[1], 200);
	TextDrawSetShadow(dialogT[1], 0);
	TextDrawSetOutline(dialogT[1], 0);
	TextDrawBackgroundColor(dialogT[1], 255);
	TextDrawFont(dialogT[1], 4);
	TextDrawSetProportional(dialogT[1], 0);
	TextDrawSetShadow(dialogT[1], 0);

	dialogT[2] = TextDrawCreate(288.666870, 179.888900, "mdl-2001:logo_button");
	TextDrawLetterSize(dialogT[2], 0.000000, 0.000000);
	TextDrawTextSize(dialogT[2], 78.000000, 32.000000);
	TextDrawAlignment(dialogT[2], 1);
	TextDrawColor(dialogT[2], 210);
	TextDrawSetShadow(dialogT[2], 0);
	TextDrawSetOutline(dialogT[2], 0);
	TextDrawBackgroundColor(dialogT[2], 255);
	TextDrawFont(dialogT[2], 4);
	TextDrawSetProportional(dialogT[2], 0);
	TextDrawSetShadow(dialogT[2], 0);
	return 1;
}
hook OnPlayerConnect(playerid)
{
	dialogPreview[playerid][0] = CreatePlayerTextDraw(playerid, 225.380981, 18.039991, "");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][0], 41.000000, 43.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][0], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][0], 505290495);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][0], true);
	PlayerTextDrawSetPreviewModel(playerid, dialogPreview[playerid][0], 40345);
	PlayerTextDrawSetPreviewRot(playerid, dialogPreview[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

	dialogPreview[playerid][1] = CreatePlayerTextDraw(playerid, 267.666717, 18.039987, "");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][1], 41.000000, 43.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][1], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][1], 505290495);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, dialogPreview[playerid][1], 40345);
	PlayerTextDrawSetPreviewRot(playerid, dialogPreview[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

	dialogPreview[playerid][2] = CreatePlayerTextDraw(playerid, 309.571411, 18.039993, "");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][2], 41.000000, 43.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][2], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][2], 505290495);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, dialogPreview[playerid][2], 40345);
	PlayerTextDrawSetPreviewRot(playerid, dialogPreview[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

	dialogPreview[playerid][3] = CreatePlayerTextDraw(playerid, 351.476165, 18.039991, "");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][3], 41.000000, 43.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][3], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][3], 505290495);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, dialogPreview[playerid][3], 40345);
	PlayerTextDrawSetPreviewRot(playerid, dialogPreview[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);

	dialogPreview[playerid][4] = CreatePlayerTextDraw(playerid, 393.761840, 17.613325, "");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][4], 41.000000, 43.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][4], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][4], 505290495);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][4], true);
	PlayerTextDrawSetPreviewModel(playerid, dialogPreview[playerid][4], 40345);
	PlayerTextDrawSetPreviewRot(playerid, dialogPreview[playerid][4], 0.000000, 0.000000, 0.000000, 1.000000);

	dialogPreview[playerid][5] = CreatePlayerTextDraw(playerid, 385.095123, 3.997061, "1/2");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][5], 0.262095, 1.079465);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][5], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][5], 255);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][5], 0);

	dialogPreview[playerid][6] = CreatePlayerTextDraw(playerid, 224.476165, 4.826679, "Menu tienda");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][6], 0.329142, 1.015465);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][6], 436.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][6], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, dialogPreview[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, dialogPreview[playerid][6], 505290495);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][6], 255);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][6], 0);

	dialogPreview[playerid][7] = CreatePlayerTextDraw(playerid, 377.190338, 1.839987, "<");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][7], 0.301331, 1.553063);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][7], 384.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][7], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, dialogPreview[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, dialogPreview[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][7], 255);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][7], true);

	dialogPreview[playerid][8] = CreatePlayerTextDraw(playerid, 399.285552, 1.851837, ">");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][8], 0.302855, 1.595731);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][8], 408.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][8], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, dialogPreview[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, dialogPreview[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][8], 255);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][8], true);

	dialogPreview[playerid][9] = CreatePlayerTextDraw(playerid, 425.000000, 4.422222, "mdl-2001:logo_cancel");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][9], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][9], 10.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][9], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][9], 255);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][9], true);

	dialogPreview[playerid][10] = CreatePlayerTextDraw(playerid, 381.333374, 66.385185, "Comprar");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][10], 0.287999, 1.222517);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][10], 425.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][10], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, dialogPreview[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, dialogPreview[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][10], 255);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, dialogPreview[playerid][10], true);


	dialogPreview[playerid][11] = CreatePlayerTextDraw(playerid, 224.333358, 67.214813, "Selecciona un cuadro");
	PlayerTextDrawLetterSize(playerid, dialogPreview[playerid][11], 0.240000, 1.164444);
	PlayerTextDrawTextSize(playerid, dialogPreview[playerid][11], 366.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, dialogPreview[playerid][11], 1);
	PlayerTextDrawColor(playerid, dialogPreview[playerid][11], -1);
	PlayerTextDrawUseBox(playerid, dialogPreview[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, dialogPreview[playerid][11], 505290495);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, dialogPreview[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogPreview[playerid][11], 255);
	PlayerTextDrawFont(playerid, dialogPreview[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, dialogPreview[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, dialogPreview[playerid][11], 0);






	dialogMsg[playerid][0] = CreatePlayerTextDraw(playerid, 332.809631, 170.752563, "Mensaje de miamiside probando los nuevos dialogs perraaaaaaa");
	PlayerTextDrawLetterSize(playerid, dialogMsg[playerid][0], 0.221138, 0.816353);
	PlayerTextDrawTextSize(playerid, dialogMsg[playerid][0], 0.000000, 144.000000);
	PlayerTextDrawAlignment(playerid, dialogMsg[playerid][0], 2);
	PlayerTextDrawColor(playerid, dialogMsg[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, dialogMsg[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, dialogMsg[playerid][0], 1010580660);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, dialogMsg[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogMsg[playerid][0], 255);
	PlayerTextDrawFont(playerid, dialogMsg[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, dialogMsg[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][0], 0);

	dialogMsg[playerid][1] = CreatePlayerTextDraw(playerid, 260.809570, 159.552612, "Menu tienda");
	PlayerTextDrawLetterSize(playerid, dialogMsg[playerid][1], 0.329142, 1.015465);
	PlayerTextDrawTextSize(playerid, dialogMsg[playerid][1], 405.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, dialogMsg[playerid][1], 1);
	PlayerTextDrawColor(playerid, dialogMsg[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, dialogMsg[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, dialogMsg[playerid][1], 673720575);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, dialogMsg[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogMsg[playerid][1], 255);
	PlayerTextDrawFont(playerid, dialogMsg[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, dialogMsg[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][1], 0);

	dialogMsg[playerid][2] = CreatePlayerTextDraw(playerid, 394.666687, 159.148162, "mdl-2001:logo_cancel");
	PlayerTextDrawLetterSize(playerid, dialogMsg[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, dialogMsg[playerid][2], 10.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, dialogMsg[playerid][2], 1);
	PlayerTextDrawColor(playerid, dialogMsg[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, dialogMsg[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogMsg[playerid][2], 255);
	PlayerTextDrawFont(playerid, dialogMsg[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, dialogMsg[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, dialogMsg[playerid][2], true);

	dialogMsg[playerid][3] = CreatePlayerTextDraw(playerid, 307.333465, 189.170364, "button");
	PlayerTextDrawLetterSize(playerid, dialogMsg[playerid][3], 0.287999, 1.222517);
	PlayerTextDrawTextSize(playerid, dialogMsg[playerid][3], 357.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, dialogMsg[playerid][3], 1);
	PlayerTextDrawColor(playerid, dialogMsg[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, dialogMsg[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, dialogMsg[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, dialogMsg[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, dialogMsg[playerid][3], 255);
	PlayerTextDrawFont(playerid, dialogMsg[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, dialogMsg[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, dialogMsg[playerid][3], true);

	formatXylosDialog(1, 0);
	return 1;
}
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == dialogMsg[playerid][2])
	{
		mirandoDialog[playerid] = -1;
		for(new h; h<4; h++) PlayerTextDrawHide(playerid, dialogMsg[playerid][h]);
		TextDrawHideForPlayer(playerid, dialogT[2]);
		playerViendoTextDraw[playerid] = false;
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == dialogMsg[playerid][3])
	{
		mirandoDialog[playerid] = -1;
		OnXylosDialogResponse(playerid, mirandoDialog[playerid], 0);
		for(new h; h<4; h++) PlayerTextDrawHide(playerid, dialogMsg[playerid][h]);
		TextDrawHideForPlayer(playerid, dialogT[2]);
		playerViendoTextDraw[playerid] = false;
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == dialogPreview[playerid][7])
	{
		if(dialogPag[playerid] != 1)
		{
			dialogPag[playerid]--;
			actDialogPagina(playerid, mirandoDialog[playerid]);
		}
	}
	if(playertextid == dialogPreview[playerid][8])
	{
		if(dialogPag[playerid] != dialogInfo[mirandoDialog[playerid]][dialog_pages])
		{
			dialogPag[playerid]++;
			actDialogPagina(playerid, mirandoDialog[playerid]);
		}
	}
	if(playertextid == dialogPreview[playerid][9])
	{
		mirandoDialog[playerid] = -1;
		for(new u;u<12;u++) PlayerTextDrawHide(playerid, dialogPreview[playerid][u]);
		for(new p;p<2;p++) TextDrawHideForPlayer(playerid, dialogT[p]);
		playerViendoTextDraw[playerid] = false;
		CancelSelectTextDraw(playerid);
		dialogPag[playerid] = 1;
		seleccionDialog[playerid] = 0;
		return 0;
	}
	if(playertextid == dialogPreview[playerid][10])
	{
		OnXylosDialogResponse(playerid, mirandoDialog[playerid], seleccionDialog[playerid]);
		for(new u;u<12;u++) PlayerTextDrawHide(playerid, dialogPreview[playerid][u]);
		for(new p;p<2;p++) TextDrawHideForPlayer(playerid, dialogT[p]);
		playerViendoTextDraw[playerid] = false;
		CancelSelectTextDraw(playerid);
		dialogPag[playerid] = 1;
		seleccionDialog[playerid] = 0;
		mirandoDialog[playerid] = -1;
		return 0;
	}
	if(playertextid == dialogPreview[playerid][0])
	{
		switch(dialogPag[playerid])
		{
			case 1: seleccionDialog[playerid] = 0;
			case 2: seleccionDialog[playerid] = 5;
			case 3: seleccionDialog[playerid] = 10;
			case 4: seleccionDialog[playerid] = 15;
		}
		actTextoPreview(playerid, mirandoDialog[playerid]);
	}
	if(playertextid == dialogPreview[playerid][1])
	{
		switch(dialogPag[playerid])
		{
			case 1: seleccionDialog[playerid] = 1;
			case 2: seleccionDialog[playerid] = 6;
			case 3: seleccionDialog[playerid] = 11;
			case 4: seleccionDialog[playerid] = 16;
		}
		actTextoPreview(playerid, mirandoDialog[playerid]);
	}
	if(playertextid == dialogPreview[playerid][2])
	{
		switch(dialogPag[playerid])
		{
			case 1: seleccionDialog[playerid] = 2;
			case 2: seleccionDialog[playerid] = 7;
			case 3: seleccionDialog[playerid] = 12;
			case 4: seleccionDialog[playerid] = 17;
		}
		actTextoPreview(playerid, mirandoDialog[playerid]);
	}
	if(playertextid == dialogPreview[playerid][3])
	{
		switch(dialogPag[playerid])
		{
			case 1: seleccionDialog[playerid] = 3;
			case 2: seleccionDialog[playerid] = 8;
			case 3: seleccionDialog[playerid] = 13;
			case 4: seleccionDialog[playerid] = 18;
		}
		actTextoPreview(playerid, mirandoDialog[playerid]);
	}
	if(playertextid == dialogPreview[playerid][4])
	{
		switch(dialogPag[playerid])
		{
			case 1: seleccionDialog[playerid] = 4;
			case 2: seleccionDialog[playerid] = 9;
			case 3: seleccionDialog[playerid] = 14;
			case 4: seleccionDialog[playerid] = 19;
		}
		actTextoPreview(playerid, mirandoDialog[playerid]);
	}
	return 1;
}

ShowXylosDialog(playerid, id, tipo, const caption[], const dentro[], const continuar[])
{
	if(tipo == TYPE_MSG)
	{
		format(dialogInfo[id][dialog_titulo],80, "%s", caption);
		format(dialogInfo[id][dialog_msg],300, "%s", dentro);
		format(dialogInfo[id][dialog_button], 80, "%s", continuar);
		new x, x2;
		new string = strlen(dentro);
		switch(string)
		{
			case 1..34: x= 169, x2=179;
			case 35..67: x= 179, x2=189;
			case 68..101: x= 189, x2=199;
			case 102..135: x= 199, x2=209;
			case 136..169: x= 209, x2=219;
			case 170..202: x= 219, x2=229;
		}

		dialogT[2] = TextDrawCreate(288.666870, x, "mdl-2001:logo_button");
		TextDrawLetterSize(dialogT[2], 0.000000, 0.000000);
		TextDrawTextSize(dialogT[2], 78.000000, 32.000000);
		TextDrawAlignment(dialogT[2], 1);
		TextDrawColor(dialogT[2], 210);
		TextDrawSetShadow(dialogT[2], 0);
		TextDrawSetOutline(dialogT[2], 0);
		TextDrawBackgroundColor(dialogT[2], 255);
		TextDrawFont(dialogT[2], 4);
		TextDrawSetProportional(dialogT[2], 0);
		TextDrawSetShadow(dialogT[2], 0);

		dialogMsg[playerid][3] = CreatePlayerTextDraw(playerid, 311.333465, x2, dialogInfo[id][dialog_button]);
		PlayerTextDrawLetterSize(playerid, dialogMsg[playerid][3], 0.287999, 1.222517);
		PlayerTextDrawTextSize(playerid, dialogMsg[playerid][3], 357.000000, 10.000000);
		PlayerTextDrawAlignment(playerid, dialogMsg[playerid][3], 1);
		PlayerTextDrawColor(playerid, dialogMsg[playerid][3], -1);
		PlayerTextDrawUseBox(playerid, dialogMsg[playerid][3], 1);
		PlayerTextDrawBoxColor(playerid, dialogMsg[playerid][3], 0);
		PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][3], 0);
		PlayerTextDrawSetOutline(playerid, dialogMsg[playerid][3], 0);
		PlayerTextDrawBackgroundColor(playerid, dialogMsg[playerid][3], 255);
		PlayerTextDrawFont(playerid, dialogMsg[playerid][3], 1);
		PlayerTextDrawSetProportional(playerid, dialogMsg[playerid][3], 1);
		PlayerTextDrawSetShadow(playerid, dialogMsg[playerid][3], 0);
		PlayerTextDrawSetSelectable(playerid, dialogMsg[playerid][3], true);

		PlayerTextDrawSetString(playerid, dialogMsg[playerid][0], dialogInfo[id][dialog_msg]);
		PlayerTextDrawSetString(playerid, dialogMsg[playerid][1], dialogInfo[id][dialog_titulo]);


		for(new h; h<4; h++) PlayerTextDrawShow(playerid, dialogMsg[playerid][h]);
		TextDrawShowForPlayer(playerid, dialogT[2]);
	}
	else if(tipo == TYPE_MODEL)
	{
		format(dialogInfo[id][dialog_titulo],80, "%s", caption);
		format(dialogInfo[id][dialog_msg],300, "%s", dentro);
		format(dialogInfo[id][dialog_button], 80, "%s", continuar);

		for(new i;i<5;i++)
		{
			PlayerTextDrawSetPreviewModel(playerid, dialogPreview[playerid][i], objIinfo[dialogInfo[id][dialog_items][i]][o_model]);
		}

		new string[10];
		format(string, 10, "1/%i", dialogInfo[id][dialog_pages]);
		PlayerTextDrawSetString(playerid, dialogPreview[playerid][6], dialogInfo[id][dialog_titulo]);
		PlayerTextDrawSetString(playerid, dialogPreview[playerid][5], string);
		PlayerTextDrawSetString(playerid, dialogPreview[playerid][10], dialogInfo[id][dialog_button]);

		for(new u;u<12;u++) PlayerTextDrawShow(playerid, dialogPreview[playerid][u]);
		for(new p;p<2;p++) TextDrawShowForPlayer(playerid, dialogT[p]);
	}

	dialogInfo[id][dialog_type] = tipo;
	playerViendoTextDraw[playerid] = true;
	SelectTextDraw(playerid, 0x87868286);
	mirandoDialog[playerid] = id;

}
formatXylosDialog(dialogid, ittem0 = 0, ittem1 = 0, ittem2 = 0 , ittem3 = 0 , ittem4 = 0 , ittem5 = 0,ittem6 = 0,ittem7 = 0,ittem8 = 0,ittem9 = 0,ittem10 = 0,ittem11 = 0,ittem12 = 0,ittem13 = 0,ittem14 = 0,ittem15 = 0, ittem16 = 0, ittem17 = 0, ittem18 = 0, ittem19 = 0)
{
	dialogInfo[dialogid][dialog_items][0] = ittem0;
	dialogInfo[dialogid][dialog_items][1] = ittem1;
	dialogInfo[dialogid][dialog_items][2] = ittem2;
	dialogInfo[dialogid][dialog_items][3] = ittem3;
	dialogInfo[dialogid][dialog_items][4] = ittem4;
	dialogInfo[dialogid][dialog_items][5] = ittem5;
	dialogInfo[dialogid][dialog_items][6] = ittem6;
	dialogInfo[dialogid][dialog_items][7] = ittem7;
	dialogInfo[dialogid][dialog_items][8] = ittem8;
	dialogInfo[dialogid][dialog_items][9] = ittem9;
	dialogInfo[dialogid][dialog_items][10] = ittem10;
	dialogInfo[dialogid][dialog_items][11] = ittem11;
	dialogInfo[dialogid][dialog_items][12] = ittem12;
	dialogInfo[dialogid][dialog_items][13] = ittem13;
	dialogInfo[dialogid][dialog_items][14] = ittem14;
	dialogInfo[dialogid][dialog_items][15] = ittem15;
	dialogInfo[dialogid][dialog_items][16] = ittem16;
	dialogInfo[dialogid][dialog_items][17] = ittem17;
	dialogInfo[dialogid][dialog_items][18] = ittem18;
	dialogInfo[dialogid][dialog_items][19] = ittem19;

	new h = countIttems(dialogid);
	switch(h)
	{
		case 0..4: dialogInfo[dialogid][dialog_pages] = 1;
		case 5..10: dialogInfo[dialogid][dialog_pages] = 2;
		case 11..16: dialogInfo[dialogid][dialog_pages] = 3;
		case 17..20: dialogInfo[dialogid][dialog_pages] = 4;
	}
}
actDialogPagina(playerid, dialogid)
{
	new itens[5];
	switch(dialogPag[playerid])
	{
		case 1:
		{
			itens[0] = objIinfo[dialogInfo[dialogid][dialog_items][0]][o_model];
			itens[1] = objIinfo[dialogInfo[dialogid][dialog_items][1]][o_model];
			itens[2] = objIinfo[dialogInfo[dialogid][dialog_items][2]][o_model];
			itens[3] = objIinfo[dialogInfo[dialogid][dialog_items][3]][o_model];
			itens[4] = objIinfo[dialogInfo[dialogid][dialog_items][4]][o_model];
		}
		case 2:
		{
			itens[0] = objIinfo[dialogInfo[dialogid][dialog_items][5]][o_model];
			itens[1] = objIinfo[dialogInfo[dialogid][dialog_items][6]][o_model];
			itens[2] = objIinfo[dialogInfo[dialogid][dialog_items][7]][o_model];
			itens[3] = objIinfo[dialogInfo[dialogid][dialog_items][8]][o_model];
			itens[4] = objIinfo[dialogInfo[dialogid][dialog_items][9]][o_model];
		}
		case 3:
		{
			itens[0] = objIinfo[dialogInfo[dialogid][dialog_items][10]][o_model];
			itens[1] = objIinfo[dialogInfo[dialogid][dialog_items][11]][o_model];
			itens[2] = objIinfo[dialogInfo[dialogid][dialog_items][12]][o_model];
			itens[3] = objIinfo[dialogInfo[dialogid][dialog_items][13]][o_model];
			itens[4] = objIinfo[dialogInfo[dialogid][dialog_items][14]][o_model];
		}
		case 4:
		{
			itens[0] = objIinfo[dialogInfo[dialogid][dialog_items][15]][o_model];
			itens[1] = objIinfo[dialogInfo[dialogid][dialog_items][16]][o_model];
			itens[2] = objIinfo[dialogInfo[dialogid][dialog_items][17]][o_model];
			itens[3] = objIinfo[dialogInfo[dialogid][dialog_items][18]][o_model];
			itens[4] = objIinfo[dialogInfo[dialogid][dialog_items][19]][o_model];
		}
	}

	for(new i;i<5;i++) PlayerTextDrawSetPreviewModel(playerid, dialogPreview[playerid][i], itens[i]);
	for(new h;h<5;h++) PlayerTextDrawShow(playerid, dialogPreview[playerid][h]);
	new string[25];

	format(string, 25, "%i/%i",dialogPag[playerid] ,dialogInfo[dialogid][dialog_pages]);
	PlayerTextDrawSetString(playerid, dialogPreview[playerid][5], string);
}
actTextoPreview(playerid, dialogid)
{
	new string[128];
	format(string, 128, "%s", objIinfo[dialogInfo[dialogid][dialog_items][seleccionDialog[playerid]]][o_nombre]);
	PlayerTextDrawSetString(playerid, dialogPreview[playerid][11], string);
}
stock countIttems(dialogid)
{
	new h;
	for(new i; i<20; i++)
	{
		if(dialogInfo[dialogid][dialog_items][i] != 0) h++;
	}
	return h;
}
stock GetMaxDialogUsed()
{
	for(new i;<100;i++)
	{
		if(dialogInfo[i][dialog_used] == 1)
		{
			dialogCount++;
		}
	}
}