#include <YSI_Coding\y_hooks>

new PlayerText:phoneT[MAX_PLAYERS][26];
new Text:phoneTT[6];

new timerLlamada[MAX_PLAYERS];
new timerSaldo[MAX_PLAYERS];

enum _celular@Info
{
	c_id,
	c_mkid,
	c_numero,
	c_contactos[6],
	c_contactonombre1[28],
	c_contactonombre2[28],
	c_contactonombre3[28],
	c_contactonombre4[28],
	c_contactonombre5[28],
	c_contactonombre6[28],
	c_bateria,
	c_sim,
	c_saldo,
	c_estado,
	c_mensaje1[128],
	c_mensaje2[128],
	c_mensaje3[128],
	c_mensaje4[128],
	c_mensaje5[128],
	c_mensaje6[128],
	c_mensaje7[128],
	c_mensaje8[128],
	bool:c_llamada,
	bool:c_cargado,
	c_bajarBateria
};
new celularInfo[MAX_CELULARES][_celular@Info];


hook OnGameModeInit()
{

	phoneTT[0] = TextDrawCreate(546.686096, 246.327606, "box");
	TextDrawLetterSize(phoneTT[0], 0.000000, 18.674270);
	TextDrawTextSize(phoneTT[0], 628.000000, 0.000000);
	TextDrawAlignment(phoneTT[0], 1);
	TextDrawColor(phoneTT[0], -1);
	TextDrawUseBox(phoneTT[0], 1);
	TextDrawBoxColor(phoneTT[0], -126);
	TextDrawSetShadow(phoneTT[0], 0);
	TextDrawSetOutline(phoneTT[0], 0);
	TextDrawBackgroundColor(phoneTT[0], 255);
	TextDrawFont(phoneTT[0], 1);
	TextDrawSetProportional(phoneTT[0], 1);
	TextDrawSetShadow(phoneTT[0], 0);

	phoneTT[1] = TextDrawCreate(546.523498, 252.279998, "splash2:splash2");
	TextDrawLetterSize(phoneTT[1], 0.000000, 0.000000);
	TextDrawTextSize(phoneTT[1], 82.000000, 150.000000);
	TextDrawAlignment(phoneTT[1], 1);
	TextDrawColor(phoneTT[1], -1);
	TextDrawSetShadow(phoneTT[1], 0);
	TextDrawSetOutline(phoneTT[1], 0);
	TextDrawBackgroundColor(phoneTT[1], 255);
	TextDrawFont(phoneTT[1], 4);
	TextDrawSetProportional(phoneTT[1], 0);
	TextDrawSetShadow(phoneTT[1], 0);

	phoneTT[2] = TextDrawCreate(547.904296, 384.133270, "box");
	TextDrawLetterSize(phoneTT[2], 0.000000, 1.809525);
	TextDrawTextSize(phoneTT[2], 627.000000, 0.000000);
	TextDrawAlignment(phoneTT[2], 1);
	TextDrawColor(phoneTT[2], -1);
	TextDrawUseBox(phoneTT[2], 1);
	TextDrawBoxColor(phoneTT[2], 170);
	TextDrawSetShadow(phoneTT[2], 0);
	TextDrawSetOutline(phoneTT[2], 0);
	TextDrawBackgroundColor(phoneTT[2], 255);
	TextDrawFont(phoneTT[2], 1);
	TextDrawSetProportional(phoneTT[2], 1);
	TextDrawSetShadow(phoneTT[2], 0);
	TextDrawSetSelectable(phoneTT[2], true);

	phoneTT[3] = TextDrawCreate(562.762084, 244.613311, "MiamiPhone");
	TextDrawLetterSize(phoneTT[3], 0.219045, 0.874665);
	TextDrawAlignment(phoneTT[3], 1);
	TextDrawColor(phoneTT[3], 255);
	TextDrawSetShadow(phoneTT[3], 0);
	TextDrawSetOutline(phoneTT[3], 0);
	TextDrawBackgroundColor(phoneTT[3], 255);
	TextDrawFont(phoneTT[3], 1);
	TextDrawSetProportional(phoneTT[3], 1);
	TextDrawSetShadow(phoneTT[3], 0);

	phoneTT[4] = TextDrawCreate(547.904602, 253.999969, "18:05");
	TextDrawLetterSize(phoneTT[4], 0.280380, 1.177598);
	TextDrawAlignment(phoneTT[4], 1);
	TextDrawColor(phoneTT[4], -1);
	TextDrawSetShadow(phoneTT[4], 0);
	TextDrawSetOutline(phoneTT[4], 1);
	TextDrawBackgroundColor(phoneTT[4], 255);
	TextDrawFont(phoneTT[4], 1);
	TextDrawSetProportional(phoneTT[4], 1);
	TextDrawSetShadow(phoneTT[4], 0);



	phoneTT[5] = TextDrawCreate(547.904602, 253.999969, "box");
	TextDrawLetterSize(phoneTT[5], 0.000000, 16.323820);
	TextDrawTextSize(phoneTT[5], 627.000000, 0.000000);
	TextDrawAlignment(phoneTT[5], 1);
	TextDrawColor(phoneTT[5], -1);
	TextDrawUseBox(phoneTT[5], 1);
	TextDrawBoxColor(phoneTT[5], 757935615);
	TextDrawSetShadow(phoneTT[5], 0);
	TextDrawSetOutline(phoneTT[5], 0);
	TextDrawBackgroundColor(phoneTT[5], 255);
	TextDrawFont(phoneTT[5], 1);
	TextDrawSetProportional(phoneTT[5], 1);
	TextDrawSetShadow(phoneTT[5], 0);


	for(new h;h<MAX_CELULARES;h++)
	{
		cargarCelular(h);
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnGameModeExit()
{
	for(new i;i<6;i++) TextDrawDestroy(phoneTT[i]);


	for(new i;i<MAX_CELULARES;i++)
	{
		guardarCelular(i);
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnPlayerConnect(playerid)
{

	phoneT[playerid][0] = CreatePlayerTextDraw(playerid, 584.237976, 402.964355, "ld_beat:cring");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][0], 10.000000, 13.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][0], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][0], 150);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][0], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][0], true);


	phoneT[playerid][1] = CreatePlayerTextDraw(playerid, 611.285949, 384.973205, "mdl-2001:logo_contacto");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][1], 14.000000, 15.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][1], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][1], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][1], true);

	phoneT[playerid][2] = CreatePlayerTextDraw(playerid, 547.323791, 385.968933, "mdl-2001:logo_phone");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][2], 15.000000, 14.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][2], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][2], -16776961);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][2], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][2], true);

	phoneT[playerid][3] = CreatePlayerTextDraw(playerid, 581.190917, 383.266601, "mdl-2001:logo_msj");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][3], 12.000000, 17.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][3], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][3], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][3], true);

	phoneT[playerid][4] = CreatePlayerTextDraw(playerid, 613.048095, 253.573272, "88%");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][4], 0.195427, 0.942933);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][4], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][4], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][4], 0);


	phoneT[playerid][5] = CreatePlayerTextDraw(playerid, 551.714111, 353.839904, "Llamada entrante, toca para atender");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][5], 0.179047, 0.938666);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][5], 620.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][5], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][5], 130);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][5], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][5], true);



	phoneT[playerid][6] = CreatePlayerTextDraw(playerid, 547.904602, 277.039947, "Xylo_Speed: 49584");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][6], 0.223238, 0.985598);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][6], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][6], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][6], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][6], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][6], true);

	phoneT[playerid][7] = CreatePlayerTextDraw(playerid, 547.904663, 290.266601, "Xylo_Speed: 49584");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][7], 0.223238, 0.985598);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][7], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][7], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][7], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][7], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][7], true);

	phoneT[playerid][8] = CreatePlayerTextDraw(playerid, 547.904602, 303.493255, "Xylo_Speed: 49584");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][8], 0.223238, 0.985598);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][8], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][8], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][8], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][8], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][8], true);

	phoneT[playerid][9] = CreatePlayerTextDraw(playerid, 547.523681, 316.719909, "Xylo_Speed: 49584");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][9], 0.223238, 0.985598);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][9], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][9], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][9], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][9], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][9], true);

	phoneT[playerid][10] = CreatePlayerTextDraw(playerid, 547.904663, 329.946563, "Xylo_Speed: 49584");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][10], 0.223238, 0.985598);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][10], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][10], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][10], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][10], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][10], true);

	phoneT[playerid][11] = CreatePlayerTextDraw(playerid, 547.142761, 343.599884, "Xylo_Speed: 49584");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][11], 0.223238, 0.985598);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][11], 626.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][11], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][11], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][11], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][11], true);

	phoneT[playerid][12] = CreatePlayerTextDraw(playerid, 547.904602, 250.159973, "<");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][12], 0.194665, 1.924265);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][12], 552.904602, 10.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][12], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][12], -1);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][12], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][12], true);

	phoneT[playerid][13] = CreatePlayerTextDraw(playerid, 571.524108, 355.546539, "+");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][13], 0.382476, 1.659733);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][13], 576.524108, 10.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][13], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][13], -1523963137);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][13], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][13], true);

	phoneT[playerid][14] = CreatePlayerTextDraw(playerid, 589.809448, 356.826538, "X");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][14], 0.284189, 1.407999);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][14], 594.809448, 10.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][14], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][14], -5963521);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][14], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][14], true);

	phoneT[playerid][15] = CreatePlayerTextDraw(playerid, 548.285400, 268.933288, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][15], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][15], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][15], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][15], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][15], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][15], true);

	phoneT[playerid][16] = CreatePlayerTextDraw(playerid, 547.904602, 281.733276, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][16], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][16], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][16], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][16], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][16], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][16], true);

	phoneT[playerid][17] = CreatePlayerTextDraw(playerid, 547.904663, 294.959930, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][17], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][17], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][17], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][17], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][17], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][17], true);

	phoneT[playerid][18] = CreatePlayerTextDraw(playerid, 547.904479, 307.759918, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][18], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][18], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][18], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][18], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][18], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][18], true);

	phoneT[playerid][19] = CreatePlayerTextDraw(playerid, 547.904418, 320.133239, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][19], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][19], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][19], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][19], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][19], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][19], true);

	phoneT[playerid][20] = CreatePlayerTextDraw(playerid, 547.904418, 332.506561, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][20], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][20], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][20], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][20], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][20], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][20], true);

	phoneT[playerid][21] = CreatePlayerTextDraw(playerid, 547.904418, 345.306549, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][21], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][21], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][21], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][21], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][21], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][21], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][21], true);

	phoneT[playerid][22] = CreatePlayerTextDraw(playerid, 547.904479, 357.679870, "49855; que tal hermano co...");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][22], 0.138283, 0.934396);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][22], 627.000000, 5.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][22], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][22], 255);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][22], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][22], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][22], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][22], true);



	phoneT[playerid][23] = CreatePlayerTextDraw(playerid, 547.905090, 370.906585, "VER");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][23], 0.197331, 0.857599);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][23], 552.904602, 15.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][23], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][23], -1);
	PlayerTextDrawUseBox(playerid, phoneT[playerid][23], 1);
	PlayerTextDrawBoxColor(playerid, phoneT[playerid][23], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][23], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][23], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][23], true);

	phoneT[playerid][24] = CreatePlayerTextDraw(playerid, 599.476135, 366.626647, "mdl-2001:logo_sendmsg");
	PlayerTextDrawLetterSize(playerid, phoneT[playerid][24], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, phoneT[playerid][24], 20.000000, 14.000000);
	PlayerTextDrawAlignment(playerid, phoneT[playerid][24], 1);
	PlayerTextDrawColor(playerid, phoneT[playerid][24], -1);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, phoneT[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, phoneT[playerid][24], 255);
	PlayerTextDrawFont(playerid, phoneT[playerid][24], 4);
	PlayerTextDrawSetProportional(playerid, phoneT[playerid][24], 0);
	PlayerTextDrawSetShadow(playerid, phoneT[playerid][24], 0);
	PlayerTextDrawSetSelectable(playerid, phoneT[playerid][24], true);

	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	for(new i;i<25;i++) PlayerTextDrawDestroy(playerid, phoneT[playerid][i]);
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case 5968:
		{
			if(response)
			{
				if(IsNumeric(inputtext))
        		{
        			new namber = strval(inputtext);
					enviarNotificacionG(playerid, "Llamando...");
					SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
					timerLlamada[playerid] = SetTimerEx("timerLlam", 30000, false, "d", playerid);
					llamarPhone(playerid, namber);
				} else ShowPlayerDialog(playerid, 5968, DIALOG_STYLE_INPUT, ""Chat_Naranja"[MiamiSide]"Chat_Gris" MiamîPhone-Llamar", "Ingresa el numero de telefono al que quieres llamar"Chat_Rojo"(Solo numeros)", ""Chat_Verde"Continuar", "");
			}
		}
		case 5969:
		{
			if(response)
			{
				if(IsNumeric(inputtext))
        		{
	        		new namber = strval(inputtext);
					celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactos][eligiendoC[playerid]] = namber;
					ShowPlayerDialog(playerid, 5970, DIALOG_STYLE_INPUT, ""Chat_Naranja"[MiamiSide]"Chat_Gris" MiamîPhone-Contactos", "Ingresa nombre de tu contacto", ""Chat_Verde"Continuar", "");
				}
			}
		}
		case 5970:
		{
			if(response)
			{
				switch(eligiendoC[playerid])
				{
					case 0: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre1], 28, "%s", inputtext);
					case 1: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre2], 28, "%s", inputtext);
					case 2: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre3], 28, "%s", inputtext);
					case 3: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre4], 28, "%s", inputtext);
					case 4: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre5], 28, "%s", inputtext);
					case 5: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre6], 28, "%s", inputtext);
				}
				enviarNotificacionG(playerid, "Contacto agregado");
				actualizarPhone(playerid, inventarioInfo[playerid][i_slotcant][8]);
			}
		}
		case 5971:
		{
			if(response)
			{
				if(IsNumeric(inputtext))
        		{
	        		new namber = strval(inputtext);
	        		mensajeA[playerid] = namber;
	        		ShowPlayerDialog(playerid, 5972, DIALOG_STYLE_INPUT, ""Chat_Naranja"[MiamiSide]"Chat_Gris" MiamiPhone Enviar-mensaje", "Ingresa el mensaje que deseas enviar", ""Chat_Verde"Continuar", "");
	        	}
			}
		}
		case 5972:
		{
			if(response)
			{
				enviarMsg(mensajeA[playerid], inputtext);
				actualizarPhone(playerid, inventarioInfo[playerid][i_slotcant][8]);
				enviarNotificacionG(playerid, "Enviaste un mensaje, -30 de saldo");
				celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_saldo] -= 30;
			}
		}
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_CTRL_BACK)
	{
		if(inventarioInfo[playerid][i_slot][8] == 19)
		{
			if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_estado] == 1)
			{
				mostrarCelular(playerid, inventarioInfo[playerid][i_slotcant][8]);
			} else enviarNotificacionG(playerid, "El celular se encuentra apagado");
		}
		else enviarNotificacionG(playerid, "Debes tener un celular en mano");
	}
	if(newkeys == KEY_YES)
	{
		if(enVelocimetro[playerid] == false)
		for(new i=0; i<MAX_OBJETOS_TIRADOS; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2, objetosTirados[i][ot_x], objetosTirados[i][ot_y], objetosTirados[i][ot_z]))
			{
				if(personajeInfo[playerid][p_world] == objetosTirados[i][ot_vw])
				{
					if(objetosTirados[i][ot_model] == 19)
					{
						celularInfo[objetosTirados[i][ot_cantidad]][c_mkid] = playerid;
						break;
					}
				}
			}
		}
	}
	if(HOLDING(ArribaM | EmbrageM) && marcha[playerid] < 5)
	{
		if(enVelocimetro[playerid] == true)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				embrage[playerid] = 1;
				marcha[playerid]++;
				SetTimerEx("volverEmbrage", 3000, false, "d", playerid);
			}
		}
	}
	if(HOLDING(AbajoM | EmbrageM) && marcha[playerid] > -1)
	{
		if(enVelocimetro[playerid] == true)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				embrage[playerid] = 1;
				marcha[playerid]--;
				if(marcha[playerid] == -1)
				{
					reversa[playerid] = 1;
				}
				else reversa[playerid] = 0;
				SetTimerEx("volverEmbrage", 3000, false, "d", playerid);
			}
		}
	}
	if(HOLDING(EmbrageM)) { embrage[playerid] = 1; }
}

cmd:miamiphone(playerid, params[])
{
	if(inventarioInfo[playerid][i_slot][8] == 19)
	{
		if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_estado] == 1)
		{
			celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_estado] = 0;
			enviarNotificacionG(playerid, "Apagaste tu celular");
		}
		else
		{
			celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_estado] = 1;
			enviarNotificacionG(playerid, "Prendiste tu celular");
		}
	}else enviarNotificacionG(playerid, "Debes tener un celular en tu mano");
}


hook OnPlayerText(playerid, text[])
{
	if(personajeInfo[playerid][p_spawn])
	{
		if(yaenllamada[playerid] == true)
		{
			new string[200];
			format(string, 200, ""Chat_Gris" por telefono %i"Chat_Phone": (%s)", celularInfo[inventarioInfo[playerid][i_slotcant][8]], text);
			SendClientMessage(playerid, -1, string);
			SendClientMessage(EnLlamada[playerid], -1, string);
		}
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}


forward timerLlam(playerid);
public timerLlam(playerid)
{
	if(yaenllamada[playerid] == false)
	{
		enviarNotificacionG(playerid, "Nadie atendio la llamada");
		enviarNotificacionG(EnLlamada[playerid], "Cortaron la llamada");


		EnLlamada[EnLlamada[playerid]] = 0;
		EnLlamada[playerid] = 0;

		llamando[playerid] = false;
		llamando[EnLlamada[playerid]] = false;
	}
}
stock enviarMsg(numero, const msg[])
{
	for(new i; i<MAX_CELULARES;i++)
	{
		if(celularInfo[i][c_numero] == numero)
		{
			for(new h;h<MAX_PLAYERS;h++)
			{
				if(celularInfo[i][c_mkid] == personajeInfo[h][p_listid])
				{
					for(new p; p<9;p++)
					{
						if(inventarioInfo[h][i_slot][p] == 19)
						{
							format(celularInfo[i][c_mensaje8], 128, "%s", celularInfo[i][c_mensaje7]);
							format(celularInfo[i][c_mensaje7], 128, "%s", celularInfo[i][c_mensaje6]);
							format(celularInfo[i][c_mensaje6], 128, "%s", celularInfo[i][c_mensaje5]);
							format(celularInfo[i][c_mensaje5], 128, "%s", celularInfo[i][c_mensaje4]);
							format(celularInfo[i][c_mensaje4], 128, "%s", celularInfo[i][c_mensaje3]);
							format(celularInfo[i][c_mensaje3], 128, "%s", celularInfo[i][c_mensaje2]);
							format(celularInfo[i][c_mensaje2], 128, "%s", celularInfo[i][c_mensaje1]);
							format(celularInfo[i][c_mensaje1], 128, "%i:%s",numero, msg);

							enviarNotificacionG(h, "Tienes un nuevo mensaje");
							break;
						}
					}
					break;
				}
			}
			break;
		}
	}
}

stock llamarPhone(playerid, numero)
{
	for(new i;i<MAX_CELULARES;i++)
	{
		if(celularInfo[i][c_numero] == numero)
		{
			if(celularInfo[i][c_llamada] == false)
			{
				for(new h;h<MAX_PLAYERS;h++)
				{
					if(celularInfo[i][c_mkid] == personajeInfo[h][p_listid])
					{
						for(new j;j<9;j++)
						{
							if(inventarioInfo[h][i_slot][j] == 19)
							{
								agregarIttem(h, inventarioInfo[playerid][i_slot][8], inventarioInfo[playerid][i_slotcant][8]);
								usarItem(h, inventarioInfo[h][i_slot][j]);


								mostrarCelular(h, inventarioInfo[h][i_slotcant][j]);
								PlayerTextDrawShow(h, phoneT[playerid][5]);
								PlayerTextDrawShow(playerid, phoneT[playerid][5]);

								timerSaldo[playerid] = SetTimerEx("timerSald", 3000, true, "d", playerid);

								new string[128];
								format(string, 128, "Llamada entrante %i, toca para atender", celularInfo[inventarioInfo[h][i_slotcant][8]]);
								PlayerTextDrawSetString(h, phoneT[h][5], string);
								SelectTextDraw(h, 0x87868286);

								celularInfo[i][c_llamada] = true;

								EnLlamada[h] = playerid;
								EnLlamada[playerid] = h;

								llamando[h] = true;
								llamando[playerid] = true;
								break;
							}
						}
						break;
					}
				}
			} else { enviarNotificacionG(playerid, "El telefono se encuentra en una llamada"); break;}
			break;
		}
	}
}

forward timerSald(playerid);
public timerSald(playerid)
{
	if(yaenllamada[playerid] == true)
	{
		celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_saldo] -= 8;
	}
	else KillTimer(timerSaldo[playerid]);
}

stock mostrarCelular(playerid, celid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		new hora, minutos, segundos, string[25]; gettime(hora, minutos, segundos);
		format(string, 25, "%i:%i", hora, minutos);
		TextDrawSetString(phoneTT[4], string);
		new string1[4];
		format(string1, 4, "%i%", celularInfo[celid][c_bateria]);
		PlayerTextDrawSetString(playerid, phoneT[playerid][4], string1);
		for(new i;i<5;i++) PlayerTextDrawShow(playerid, phoneT[playerid][i]);
		for(new h;h<5;h++) TextDrawShowForPlayer(playerid, phoneTT[h]);
		SelectTextDraw(playerid, 0x87868286);

		new stringg[128];

		format(stringg, 128, "%i: %s", celularInfo[celid][c_contactos][0], celularInfo[celid][c_contactonombre1]);
		PlayerTextDrawSetString(playerid, phoneT[playerid][6], stringg);

		format(stringg, 128, "%i: %s", celularInfo[celid][c_contactos][1], celularInfo[celid][c_contactonombre2]);
		PlayerTextDrawSetString(playerid, phoneT[playerid][7], stringg);

		format(stringg, 128, "%i: %s", celularInfo[celid][c_contactos][2], celularInfo[celid][c_contactonombre3]);
		PlayerTextDrawSetString(playerid, phoneT[playerid][8], stringg);


		format(stringg, 128, "%i: %s", celularInfo[celid][c_contactos][3], celularInfo[celid][c_contactonombre4]);
		PlayerTextDrawSetString(playerid, phoneT[playerid][9], stringg);


		format(stringg, 128, "%i: %s", celularInfo[celid][c_contactos][4], celularInfo[celid][c_contactonombre5]);
		PlayerTextDrawSetString(playerid, phoneT[playerid][10], stringg);

		format(stringg, 128, "%i: %s", celularInfo[celid][c_contactos][5], celularInfo[celid][c_contactonombre6]);
		PlayerTextDrawSetString(playerid, phoneT[playerid][11], stringg);

		for(new p;p<8;p++)
		{
			switch(p)
			{
				case 0:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje1]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][15], stringg);
				}
				case 1:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje2]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][16], stringg);
				}
				case 2:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje3]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][17], stringg);
				}
				case 3:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje4]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][18], stringg);
				}
				case 4:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje5]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][19], stringg);
				}
				case 5:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje6]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][20], stringg);
				}
				case 6:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje7]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][21], stringg);
				}
				case 7:
				{
					format(stringg, 31, "%s", celularInfo[celid][c_mensaje8]);
					PlayerTextDrawSetString(playerid, phoneT[playerid][22], stringg);
				}
			}
		}
	}
}

stock actualizarPhone(playerid, celid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		for(new i;i<6;i++) PlayerTextDrawHide(playerid, phoneT[playerid][i]);
		for(new h;h<5;h++) TextDrawHideForPlayer(playerid, phoneTT[h]);
		CancelSelectTextDraw(playerid);
		for(new z=6;z<25;z++) PlayerTextDrawHide(playerid, phoneT[playerid][z]);
		TextDrawHideForPlayer(playerid, phoneTT[5]);
		mostrarCelular(playerid, celid);
	}
}


forward guardarCelular(celid);
public guardarCelular(celid)
{
		if(celularInfo[celid][c_cargado] == true)
		{
			new xylos[1200];
			mysql_format(xylosMYSQL, xylos, sizeof(xylos), "UPDATE `celulares` SET `c_mkid` ='%d', `c_numero` = '%d', `c_contacto1` = '%d', `c_contacto2` = '%d', `c_contacto3` = '%d', `c_contacto4` = '%d', `c_contacto5` = '%d', `c_contacto6` = '%d', `c_contactonombre1` = '%d', `c_contactonombre2` = '%d', `c_contactonombre3` = '%e', `c_contactonombre4` = '%e', `c_contactonombre5` = '%e', `c_contactonombre6` = '%e', `c_bateria` = '%d', `c_sim` = '%d', `c_saldo` = '%d', `c_estado` = '%d', `c_mensaje1` = '%e', `c_mensaje2` = '%e', `c_mensaje3` = '%e', `c_mensaje4` = '%e', `c_mensaje5` = '%e', `c_mensaje6` = '%e', `c_mensaje7` = '%e', `c_mensaje8` = '%e' WHERE `c_id`='%d' LIMIT 1 "
			, celularInfo[celid][c_id],
			celularInfo[celid][c_mkid],
			celularInfo[celid][c_numero],
			celularInfo[celid][c_contactos][0],
			celularInfo[celid][c_contactos][1],
			celularInfo[celid][c_contactos][2],
			celularInfo[celid][c_contactos][3],
			celularInfo[celid][c_contactos][4],
			celularInfo[celid][c_contactos][5],
			celularInfo[celid][c_contactonombre1],
			celularInfo[celid][c_contactonombre2],
			celularInfo[celid][c_contactonombre3],
			celularInfo[celid][c_contactonombre4],
			celularInfo[celid][c_contactonombre5],
			celularInfo[celid][c_contactonombre6],
			celularInfo[celid][c_bateria],
			celularInfo[celid][c_sim],
			celularInfo[celid][c_saldo],
			celularInfo[celid][c_estado],
			celularInfo[celid][c_mensaje1],
			celularInfo[celid][c_mensaje2],
			celularInfo[celid][c_mensaje3],
			celularInfo[celid][c_mensaje4],
			celularInfo[celid][c_mensaje5],
			celularInfo[celid][c_mensaje6],
			celularInfo[celid][c_mensaje7],
			celularInfo[celid][c_mensaje8], celid);
			mysql_query(xylosMYSQL, xylos);
		}
}


stock cargarCelular(celid)
{
	if(SQL::RowExists("celulares", "c_id", celid))
	{
			new xylos = SQL::Open(SQL::READ, "celulares", "c_id", celid);
			SQL::ReadInt(xylos, "c_id", celularInfo[celid][c_id]);
			SQL::ReadInt(xylos, "c_mkid", celularInfo[celid][c_mkid]);
			SQL::ReadInt(xylos, "c_numero", celularInfo[celid][c_numero]);

			SQL::ReadInt(xylos, "c_contacto1", celularInfo[celid][c_contactos][0]);
			SQL::ReadInt(xylos, "c_contacto2", celularInfo[celid][c_contactos][1]);
			SQL::ReadInt(xylos, "c_contacto3", celularInfo[celid][c_contactos][2]);
			SQL::ReadInt(xylos, "c_contacto4", celularInfo[celid][c_contactos][3]);
			SQL::ReadInt(xylos, "c_contacto5", celularInfo[celid][c_contactos][4]);
			SQL::ReadInt(xylos, "c_contacto6", celularInfo[celid][c_contactos][5]);

			SQL::ReadString(xylos, "c_contactonombre1", celularInfo[celid][c_contactonombre1]);
			SQL::ReadString(xylos, "c_contactonombre2", celularInfo[celid][c_contactonombre2]);
			SQL::ReadString(xylos, "c_contactonombre3", celularInfo[celid][c_contactonombre3]);
			SQL::ReadString(xylos, "c_contactonombre4", celularInfo[celid][c_contactonombre4]);
			SQL::ReadString(xylos, "c_contactonombre5", celularInfo[celid][c_contactonombre5]);
			SQL::ReadString(xylos, "c_contactonombre6", celularInfo[celid][c_contactonombre6]);


			SQL::ReadInt(xylos, "c_bateria", celularInfo[celid][c_bateria]);	
			SQL::ReadInt(xylos, "c_sim", celularInfo[celid][c_sim]);	
			SQL::ReadInt(xylos, "c_saldo", celularInfo[celid][c_saldo]); 
			SQL::ReadInt(xylos, "c_estado", celularInfo[celid][c_estado]);	



			SQL::ReadString(xylos, "c_mensaje1", celularInfo[celid][c_mensaje1]);
			SQL::ReadString(xylos, "c_mensaje2", celularInfo[celid][c_mensaje2]);	
			SQL::ReadString(xylos, "c_mensaje3", celularInfo[celid][c_mensaje3]);	
			SQL::ReadString(xylos, "c_mensaje4", celularInfo[celid][c_mensaje4]);	
			SQL::ReadString(xylos, "c_mensaje5", celularInfo[celid][c_mensaje5]);	
			SQL::ReadString(xylos, "c_mensaje6", celularInfo[celid][c_mensaje6]);	
			SQL::ReadString(xylos, "c_mensaje7", celularInfo[celid][c_mensaje7]);	
			SQL::ReadString(xylos, "c_mensaje8", celularInfo[celid][c_mensaje8]);		
			

			printf("%i", celularInfo[celid][c_bateria]);
			printf("%i", celularInfo[celid][c_id]);
			celularInfo[celid][c_bajarBateria] = SetTimerEx("bajarBateriaCel", 60000, true, "d", celid);
	}
}

forward bajarBateriaCel(celid);
public bajarBateriaCel(celid)
{
	if(celularInfo[celid][c_cargado] == true)
	{
		celularInfo[celid][c_bateria] -= 1;
		if(celularInfo[celid][c_bateria] == 0)
		{
			celularInfo[celid][c_estado] = 0;
		}
	} else KillTimer(celularInfo[celid][c_bajarBateria]);
}


