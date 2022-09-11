#include <YSI_Coding\y_hooks>

new Text: cmdAyuda[10];
new PlayerText: help[MAX_PLAYERS];
hook OnGameModeInit()
{
	cmdAyuda[0] = TextDrawCreate(204.000076, 126.377784, "mdl-2001:logo_box");
	TextDrawLetterSize(cmdAyuda[0], 0.000000, 0.000000);
	TextDrawTextSize(cmdAyuda[0], 195.000000, 155.000000);
	TextDrawAlignment(cmdAyuda[0], 1);
	TextDrawColor(cmdAyuda[0], 505290495);
	TextDrawSetShadow(cmdAyuda[0], 0);
	TextDrawSetOutline(cmdAyuda[0], 0);
	TextDrawBackgroundColor(cmdAyuda[0], 255);
	TextDrawFont(cmdAyuda[0], 4);
	TextDrawSetProportional(cmdAyuda[0], 0);
	TextDrawSetShadow(cmdAyuda[0], 0);

	cmdAyuda[1] = TextDrawCreate(220.999954, 155.985260, "Vehiculos");
	TextDrawLetterSize(cmdAyuda[1], 0.260666, 1.546074);
	TextDrawTextSize(cmdAyuda[1], 260.000000, 10.000000);
	TextDrawAlignment(cmdAyuda[1], 1);
	TextDrawColor(cmdAyuda[1], -1);
	TextDrawUseBox(cmdAyuda[1], 1);
	TextDrawBoxColor(cmdAyuda[1], 673720575);
	TextDrawSetShadow(cmdAyuda[1], 0);
	TextDrawSetOutline(cmdAyuda[1], 0);
	TextDrawBackgroundColor(cmdAyuda[1], 255);
	TextDrawFont(cmdAyuda[1], 1);
	TextDrawSetProportional(cmdAyuda[1], 1);
	TextDrawSetShadow(cmdAyuda[1], 0);
	TextDrawSetSelectable(cmdAyuda[1], true);

	cmdAyuda[2] = TextDrawCreate(220.666610, 174.237045, "Casas");
	TextDrawLetterSize(cmdAyuda[2], 0.260666, 1.546074);
	TextDrawTextSize(cmdAyuda[2], 260.000000, 10.000000);
	TextDrawAlignment(cmdAyuda[2], 1);
	TextDrawColor(cmdAyuda[2], -1);
	TextDrawUseBox(cmdAyuda[2], 1);
	TextDrawBoxColor(cmdAyuda[2], 673720575);
	TextDrawSetShadow(cmdAyuda[2], 0);
	TextDrawSetOutline(cmdAyuda[2], 0);
	TextDrawBackgroundColor(cmdAyuda[2], 255);
	TextDrawFont(cmdAyuda[2], 1);
	TextDrawSetProportional(cmdAyuda[2], 1);
	TextDrawSetShadow(cmdAyuda[2], 0);
	TextDrawSetSelectable(cmdAyuda[2], true);

	cmdAyuda[3] = TextDrawCreate(220.666656, 192.488891, "Trabajos");
	TextDrawLetterSize(cmdAyuda[3], 0.260666, 1.546074);
	TextDrawTextSize(cmdAyuda[3], 260.000000, 10.000000);
	TextDrawAlignment(cmdAyuda[3], 1);
	TextDrawColor(cmdAyuda[3], -1);
	TextDrawUseBox(cmdAyuda[3], 1);
	TextDrawBoxColor(cmdAyuda[3], 673720575);
	TextDrawSetShadow(cmdAyuda[3], 0);
	TextDrawSetOutline(cmdAyuda[3], 0);
	TextDrawBackgroundColor(cmdAyuda[3], 255);
	TextDrawFont(cmdAyuda[3], 1);
	TextDrawSetProportional(cmdAyuda[3], 1);
	TextDrawSetShadow(cmdAyuda[3], 0);
	TextDrawSetSelectable(cmdAyuda[3], true);

	cmdAyuda[4] = TextDrawCreate(220.666671, 210.740798, "Inventario");
	TextDrawLetterSize(cmdAyuda[4], 0.241666, 1.554370);
	TextDrawTextSize(cmdAyuda[4], 260.000000, 10.000000);
	TextDrawAlignment(cmdAyuda[4], 1);
	TextDrawColor(cmdAyuda[4], -1);
	TextDrawUseBox(cmdAyuda[4], 1);
	TextDrawBoxColor(cmdAyuda[4], 673720575);
	TextDrawSetShadow(cmdAyuda[4], 0);
	TextDrawSetOutline(cmdAyuda[4], 0);
	TextDrawBackgroundColor(cmdAyuda[4], 255);
	TextDrawFont(cmdAyuda[4], 1);
	TextDrawSetProportional(cmdAyuda[4], 1);
	TextDrawSetShadow(cmdAyuda[4], 0);
	TextDrawSetSelectable(cmdAyuda[4], true);

	cmdAyuda[5] = TextDrawCreate(220.999938, 137.733398, "General");
	TextDrawLetterSize(cmdAyuda[5], 0.260666, 1.546074);
	TextDrawTextSize(cmdAyuda[5], 260.000000, 10.000000);
	TextDrawAlignment(cmdAyuda[5], 1);
	TextDrawColor(cmdAyuda[5], -1);
	TextDrawUseBox(cmdAyuda[5], 1);
	TextDrawBoxColor(cmdAyuda[5], 673720575);
	TextDrawSetShadow(cmdAyuda[5], 0);
	TextDrawSetOutline(cmdAyuda[5], 0);
	TextDrawBackgroundColor(cmdAyuda[5], 255);
	TextDrawFont(cmdAyuda[5], 1);
	TextDrawSetProportional(cmdAyuda[5], 1);
	TextDrawSetShadow(cmdAyuda[5], 0);
	TextDrawSetSelectable(cmdAyuda[5], true);

	cmdAyuda[6] = TextDrawCreate(220.666671, 229.407485, "TextDraw's");
	TextDrawLetterSize(cmdAyuda[6], 0.213666, 1.500445);
	TextDrawTextSize(cmdAyuda[6], 260.000000, 10.000000);
	TextDrawAlignment(cmdAyuda[6], 1);
	TextDrawColor(cmdAyuda[6], -1);
	TextDrawUseBox(cmdAyuda[6], 1);
	TextDrawBoxColor(cmdAyuda[6], 673720575);
	TextDrawSetShadow(cmdAyuda[6], 0);
	TextDrawSetOutline(cmdAyuda[6], 0);
	TextDrawBackgroundColor(cmdAyuda[6], 255);
	TextDrawFont(cmdAyuda[6], 1);
	TextDrawSetProportional(cmdAyuda[6], 1);
	TextDrawSetShadow(cmdAyuda[6], 0);
	TextDrawSetSelectable(cmdAyuda[6], true);

	cmdAyuda[7] = TextDrawCreate(221.000015, 247.244552, "____coins");
	TextDrawLetterSize(cmdAyuda[7], 0.213666, 1.500445);
	TextDrawTextSize(cmdAyuda[7], 260.000000, 10.000000);
	TextDrawAlignment(cmdAyuda[7], 1);
	TextDrawColor(cmdAyuda[7], -1);
	TextDrawUseBox(cmdAyuda[7], 1);
	TextDrawBoxColor(cmdAyuda[7], 673720575);
	TextDrawSetShadow(cmdAyuda[7], 0);
	TextDrawSetOutline(cmdAyuda[7], 0);
	TextDrawBackgroundColor(cmdAyuda[7], 255);
	TextDrawFont(cmdAyuda[7], 1);
	TextDrawSetProportional(cmdAyuda[7], 1);
	TextDrawSetShadow(cmdAyuda[7], 0);
	TextDrawSetSelectable(cmdAyuda[7], true);

	cmdAyuda[8] = TextDrawCreate(220.000015, 247.088912, "mdl-2001:logo_coin");
	TextDrawLetterSize(cmdAyuda[8], 0.000000, 0.000000);
	TextDrawTextSize(cmdAyuda[8], 14.000000, 12.000000);
	TextDrawAlignment(cmdAyuda[8], 1);
	TextDrawColor(cmdAyuda[8], -1);
	TextDrawSetShadow(cmdAyuda[8], 0);
	TextDrawSetOutline(cmdAyuda[8], 0);
	TextDrawBackgroundColor(cmdAyuda[8], 255);
	TextDrawFont(cmdAyuda[8], 4);
	TextDrawSetProportional(cmdAyuda[8], 0);
	TextDrawSetShadow(cmdAyuda[8], 0);

	cmdAyuda[9] = TextDrawCreate(367.333221, 131.355606, "mdl-2001:logo_cancel");
	TextDrawLetterSize(cmdAyuda[9], 0.000000, 0.000000);
	TextDrawTextSize(cmdAyuda[9], 10.000000, 9.000000);
	TextDrawAlignment(cmdAyuda[9], 1);
	TextDrawColor(cmdAyuda[9], -1);
	TextDrawSetShadow(cmdAyuda[9], 0);
	TextDrawSetOutline(cmdAyuda[9], 0);
	TextDrawBackgroundColor(cmdAyuda[9], 255);
	TextDrawFont(cmdAyuda[9], 4);
	TextDrawSetProportional(cmdAyuda[9], 0);
	TextDrawSetShadow(cmdAyuda[9], 0);
	TextDrawSetSelectable(cmdAyuda[9], true);
}

hook OnPlayerConnect(playerid)
{
	help[playerid] = CreatePlayerTextDraw(playerid, 266.000000, 147.318572, "dadada dadadada dadadada dadadada dadadaada dadadadad dadadadadad dadadadadad adadadadada adadadada adadadad");
	PlayerTextDrawLetterSize(playerid, help[playerid], 0.237332, 0.907258);
	PlayerTextDrawTextSize(playerid, help[playerid], 370.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, help[playerid], 1);
	PlayerTextDrawColor(playerid, help[playerid], -1);
	PlayerTextDrawUseBox(playerid, help[playerid], 1);
	PlayerTextDrawBoxColor(playerid, help[playerid], 673720575);
	PlayerTextDrawSetShadow(playerid, help[playerid], 0);
	PlayerTextDrawSetOutline(playerid, help[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, help[playerid], 255);
	PlayerTextDrawFont(playerid, help[playerid], 1);
	PlayerTextDrawSetProportional(playerid, help[playerid], 1);
	PlayerTextDrawSetShadow(playerid, help[playerid], 0);
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == cmdAyuda[5])
	{
		actualizarMenuHelp(playerid, 0);
	}
	else if(clickedid == cmdAyuda[1])
	{
		actualizarMenuHelp(playerid, 1);
	}
	else if(clickedid == cmdAyuda[2])
	{
		actualizarMenuHelp(playerid, 2);
	}
	else if(clickedid == cmdAyuda[3])
	{
		actualizarMenuHelp(playerid, 3);
	}
	else if(clickedid == cmdAyuda[4])
	{
		actualizarMenuHelp(playerid, 4);
	}
	else if(clickedid == cmdAyuda[6])
	{
		actualizarMenuHelp(playerid, 5);
	}
	else if(clickedid == cmdAyuda[7])
	{
		actualizarMenuHelp(playerid, 6);
	}
	else if(clickedid == cmdAyuda[9])
	{
		for(new i;i<10;i++) TextDrawHideForPlayer(playerid, cmdAyuda[i]);
		PlayerTextDrawHide(playerid, help[playerid]);
	}
}
cmd:ayuda(playerid, params[])
{
	mostrarMenuHelp(playerid);
	return 1;
}
mostrarMenuHelp(playerid)
{
	for(new i;i<10;i++) TextDrawShowForPlayer(playerid, cmdAyuda[i]);
	PlayerTextDrawShow(playerid, help[playerid]);
	PlayerTextDrawSetString(playerid, help[playerid], "Comandos Generales: /b, /me, /do, /s, /g, /dardinero, /d [duda], /adudas [Activar]");

	SelectTextDraw(playerid, 0x87868286);
}

actualizarMenuHelp(playerid, control){

	new string[800];
	switch(control)
	{
		case 0:
		{
			format(string, sizeof(string), "Comandos Generales: /b, /me, /do, /s, /g, /dardinero, /d [duda], /adudas [Activar]");
		}
		case 1:
		{
			format(string, sizeof(string), "Ayuda Vehiculo: /vmenu (Con llave en mano y dentro del vehiculo), /vtoys, /vmaletero, \
    		Marchas: Tecla 2 Embrague, Y para subir de marcha, N para bajar, necesitas \
    		usar el Embrague para subir o bajar de marcha, por ejemplo de N a 1 es: Y+2");
		}
		case 2:
		{
			format(string, sizeof(string), "Proximamente 2");
		}
		case 3:
		{
			format(string, sizeof(string), "Proximamente 3");
		}
		case 4:
		{
			format(string, sizeof(string), "Ayuda Inventario: Tu inventario posee 9 slots, de los cuales 2 son para usuarios VIP \
		    y la otra ranura para tu mano, interactuca con los botones, Tecla N para abrirlo\
		    Si cerraste con la tecla Escape tu inventario y no se te cerro, toca la tecla N\
		    y cierralo desde el icono X.\
		    Al usar un objeto te enviaran una notificacion de los comandos disponibles para este");
		}
		case 5:
		{
			format(string, sizeof(string), "Proximamente 5");
		}
		case 6:
		{
			format(string, sizeof(string), "Los Coins son la moneda virtual la cual te da acesso a algunos privilegios como: \
			comoprar cajas, VIP y muchas cosas mas, Broadway Games nunca deseo que MiamiSide sea un juego Pagar para Ganar\
			y no lo sera, solo hacemos esto para recaudar fondos para el mantenimiento.");
		}
	}
	PlayerTextDrawSetString(playerid, help[playerid], string);
}



hook loguearPersonaje(playerid){
	SetTimerEx("mensajesaleatorios", 800000, true, "d", playerid);
}

forward mensajesaleatorios(playerid);
public mensajesaleatorios(playerid)
{
	mandarMensajeAleatorio(playerid);
}


new msgTypes[][128] = {
	{""Chat_Gris"[MiamiSide]"Chat_Blanco" para abrir tu inventario usa la Tecla N"},
	{""Chat_Gris"[MiamiSide]"Chat_Blanco" Si la seleccion de TextDraws se te canelo usa /seleccionar"},
	{""Chat_Gris"[MiamiSide]"Chat_Blanco" usa el comando /ayuda para obtener informacion del servidor"},
	{""Chat_Gris"[MiamiSide]"Chat_Blanco" usa /adudas para activar el canal de dudas y /d para enviar una duda"}
};
mandarMensajeAleatorio(playerid)
{
	new rand = random(4-0)+0;
	SendClientMessage(playerid, -1, msgTypes[rand]);
}
