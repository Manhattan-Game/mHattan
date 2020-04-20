#include <YSI_Coding\y_hooks>

new Text:boxP[3];
new PlayerText:box[MAX_PLAYERS][5];


new conTrol[MAX_PLAYERS][3];
new conTrol2[MAX_PLAYERS];
new boxType2[MAX_PLAYERS];

hook OnGameModeInit()
{
	boxP[0] = TextDrawCreate(217.333374, 181.962966, "mdl-2001:logo_box");
	TextDrawLetterSize(boxP[0], 0.000000, 0.000000);
	TextDrawTextSize(boxP[0], 75.000000, 71.000000);
	TextDrawAlignment(boxP[0], 1);
	TextDrawColor(boxP[0], 505290495);
	TextDrawSetShadow(boxP[0], 0);
	TextDrawSetOutline(boxP[0], 0);
	TextDrawBackgroundColor(boxP[0], 255);
	TextDrawFont(boxP[0], 4);
	TextDrawSetProportional(boxP[0], 0);
	TextDrawSetShadow(boxP[0], 0);

	boxP[1] = TextDrawCreate(281.333465, 174.911117, "mdl-2001:logo_box");
	TextDrawLetterSize(boxP[1], 0.000000, 0.000000);
	TextDrawTextSize(boxP[1], 89.000000, 86.000000);
	TextDrawAlignment(boxP[1], 1);
	TextDrawColor(boxP[1], 505290495);
	TextDrawSetShadow(boxP[1], 0);
	TextDrawSetOutline(boxP[1], 0);
	TextDrawBackgroundColor(boxP[1], 255);
	TextDrawFont(boxP[1], 4);
	TextDrawSetProportional(boxP[1], 0);
	TextDrawSetShadow(boxP[1], 0);

	boxP[2] = TextDrawCreate(359.666625, 182.377792, "mdl-2001:logo_box");
	TextDrawLetterSize(boxP[2], 0.000000, 0.000000);
	TextDrawTextSize(boxP[2], 75.000000, 71.000000);
	TextDrawAlignment(boxP[2], 1);
	TextDrawColor(boxP[2], 505290495);
	TextDrawSetShadow(boxP[2], 0);
	TextDrawSetOutline(boxP[2], 0);
	TextDrawBackgroundColor(boxP[2], 255);
	TextDrawFont(boxP[2], 4);
	TextDrawSetProportional(boxP[2], 0);
	TextDrawSetShadow(boxP[2], 0);
}
hook OnPlayerConnect(playerid){

	box[playerid][0] = CreatePlayerTextDraw(playerid, 205.333343, 182.792617, "");
	PlayerTextDrawLetterSize(playerid, box[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, box[playerid][0], 93.000000, 65.000000);
	PlayerTextDrawAlignment(playerid, box[playerid][0], 1);
	PlayerTextDrawColor(playerid, box[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, box[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, box[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, box[playerid][0], 0);
	PlayerTextDrawFont(playerid, box[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, box[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, box[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, box[playerid][0], 19382);
	PlayerTextDrawSetPreviewRot(playerid, box[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

	box[playerid][1] = CreatePlayerTextDraw(playerid, 276.000030, 181.133346, "");
	PlayerTextDrawLetterSize(playerid, box[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, box[playerid][1], 93.000000, 65.000000);
	PlayerTextDrawAlignment(playerid, box[playerid][1], 1);
	PlayerTextDrawColor(playerid, box[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, box[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, box[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, box[playerid][1], 0);
	PlayerTextDrawFont(playerid, box[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, box[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, box[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, box[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, box[playerid][1], 19382);
	PlayerTextDrawSetPreviewRot(playerid, box[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

	box[playerid][2] = CreatePlayerTextDraw(playerid, 350.000122, 183.207397, "");
	PlayerTextDrawLetterSize(playerid, box[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, box[playerid][2], 93.000000, 65.000000);
	PlayerTextDrawAlignment(playerid, box[playerid][2], 1);
	PlayerTextDrawColor(playerid, box[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, box[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, box[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, box[playerid][2], 0);
	PlayerTextDrawFont(playerid, box[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, box[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, box[playerid][2], 0);
	PlayerTextDrawSetPreviewModel(playerid, box[playerid][2], 19382);
	PlayerTextDrawSetPreviewRot(playerid, box[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

	box[playerid][3] = CreatePlayerTextDraw(playerid, 292.666748, 159.563049, "mdl-2001:logo_box");
	PlayerTextDrawLetterSize(playerid, box[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, box[playerid][3], 64.000000, 16.000000);
	PlayerTextDrawAlignment(playerid, box[playerid][3], 1);
	PlayerTextDrawColor(playerid, box[playerid][3], -2139094785);
	PlayerTextDrawSetShadow(playerid, box[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, box[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, box[playerid][3], 255);
	PlayerTextDrawFont(playerid, box[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, box[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, box[playerid][3], 0);

	box[playerid][4] = CreatePlayerTextDraw(playerid, 303.000030, 161.792556, "Golden_Box");
	PlayerTextDrawLetterSize(playerid, box[playerid][4], 0.158333, 1.147851);
	PlayerTextDrawAlignment(playerid, box[playerid][4], 1);
	PlayerTextDrawColor(playerid, box[playerid][4], -1061109505);
	PlayerTextDrawSetShadow(playerid, box[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, box[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, box[playerid][4], 255);
	PlayerTextDrawFont(playerid, box[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, box[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, box[playerid][4], 0);
}
enum itemType{

	i_o,
	i_price,
	i_type
};
new itemsInfo[][itemType] = {
	{1212, 15000, 0},
	{439, 1, 1},
	{1928, 5, 2},
	{1275, 1, 3},
	{19942, 1, 4},
	{1212, 20000, 0},
	

	{1212, 30000, 0},
	{426, 1, 1},
	{1928, 15, 2},
	{1272, 2, 3},
	{2710, 1, 4},
	{1212, 40000, 0},

	{1212, 70000, 0},
	{446, 1, 1},
	{1922, 30, 2},
	{1273, 3, 3},
	{490, 1, 1},
	{1247, 5, 5}
};


enum boxTypes
{
	b_items[7],
}
new boxInfo[][boxTypes] = {
	{{0, 1, 2, 3, 4, 5}},
	{{6, 7, 8, 9, 10, 11}},
	{{12, 13, 14, 15, 16, 17}}
};


cmd:comprarCajas(playerid, params[]){
	formatXylosDialog(0, 1, 2, 3);
	ShowXylosDialog(playerid, 0, TYPE_MODEL, "Cajas Coin", "h", "Comprar");
}

public OnXylosDialogResponse(playerid, dialogid, list){

	switch(dialogid)
	{
		case 0:
		{
			switch(list)
			{
				case 0:
				{
					if(masterInfo[playerid][_coins] >= 5)
					{
						mostarMenuBox(playerid, 0);
						masterInfo[playerid][_coins] -= 5;
					}
					else enviarNotificacionG(playerid, "No tienes suficientes Coins");
				}
				case 1:
				{
					if(masterInfo[playerid][_coins] >= 10)
					{
						mostarMenuBox(playerid, 1);
						masterInfo[playerid][_coins] -= 10;
					}
					else enviarNotificacionG(playerid, "No tienes suficientes Coins");
				}
				case 2:
				{
					if(masterInfo[playerid][_coins] >= 20)
					{
						mostarMenuBox(playerid, 2);
						masterInfo[playerid][_coins] -= 20;
					}
					else enviarNotificacionG(playerid, "No tienes suficientes Coins");
				}
			}
		}
	}

	return 1;
}

new timeerBox[MAX_PLAYERS];
mostarMenuBox(playerid, boxtype){

	for(new d; d<5;d++) PlayerTextDrawShow(playerid, box[playerid][d]);
	for(new i; i<3;i++) TextDrawShowForPlayer(playerid, boxP[i]);
	PlayerTextDrawSetSelectable(playerid, box[playerid][1], true);

	timeerBox[playerid] = SetTimerEx("timerBox", 300, true, "dd", playerid, boxtype);
	SetTimerEx("selectTD", 1000, false, "d", playerid);

	if(boxtype == 0)
	{
		PlayerTextDrawColor(playerid, box[playerid][3], -1378294017);
		PlayerTextDrawSetString(playerid, box[playerid][4], "Miami_Box");
	}
	else if(boxtype == 1)
	{
		PlayerTextDrawColor(playerid, box[playerid][3], -1523963137);
		PlayerTextDrawSetString(playerid, box[playerid][4], "Silver_Box");
	}
	else if(boxtype == 2)
	{
		PlayerTextDrawColor(playerid, box[playerid][3], -2139094785);
		PlayerTextDrawSetString(playerid, box[playerid][4], "Golden_Box");
	}
	boxType2[playerid] = boxtype;
}

forward selectTD(playerid);
public selectTD(playerid)
{
	SelectTextDraw(playerid, 0x87868286);
	enviarNotificacionG(playerid, "Presiona en el cuadro del medio para frenar");
}

hook OP_ClickPlayerTextDraw(playerid, PlayerText:helo){
	if(helo == box[playerid][1])
	{
		SetTimerEx("pausarTimer", 3000, false, "dd", playerid, boxType2[playerid]);
		enviarNotificacionG(playerid, "Frenando el iniciador");
		PlayerTextDrawSetSelectable(playerid, box[playerid][1], false);
	}
}

forward pausarTimer(playerid, boxtype);
public pausarTimer(playerid, boxtype)
{
	KillTimer(timeerBox[playerid]);

	PlayerTextDrawHide(playerid, box[playerid][0]);
	PlayerTextDrawHide(playerid, box[playerid][2]);
	TextDrawHideForPlayer(playerid, boxP[0]);
	TextDrawHideForPlayer(playerid, boxP[2]);

	SetTimerEx("darItemBox", 2000, false, "dd", playerid, boxtype);
}

forward darItemBox(playerid, boxtype);
public darItemBox(playerid, boxtype)
{

	for(new d; d<5;d++) PlayerTextDrawHide(playerid, box[playerid][d]);
	for(new i; i<3;i++) TextDrawHideForPlayer(playerid, boxP[i]);


	new string[128];
	switch(itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_type])
	{
		case 0:
		{
			format(string, 128, "Ganaste $%i en esta caja, toca recibir para continuar", itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_price]);
			personajeInfo[playerid][p_dinero] += itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_price];
			enviarMoneyNotif(playerid, 0, itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_price]);
		}
		case 1:
		{

			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y ,z);

			new dem[400];
			mysql_format(xylosMYSQL, dem, sizeof(dem), "INSERT INTO vehiculos(v_mkid, v_model, v_pos0, v_pos1, v_pos2) VALUES ('%d', '%d', '%f', '%f', '%f')",
            personajeInfo[playerid][p_listid], itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_o], x, y, z);
            mysql_pquery(xylosMYSQL, dem, "registrarVehiculo", "d", playerid);

			format(string, 128, "Ganaste el vehiculo ID: %i en esta caja, debes ir al ayuntamiento a reclamar las llaves", itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_o]);					
			

		}
		case 2:
		{
			format(string, 128, "Ganaste %i Coins en esta caja, toca recibir para continuar", itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_price]);
			masterInfo[playerid][_coins] += itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_price];
		}
		case 3:
		{
			if(itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_price] == 1)
			{
				format(string, 128, "Ganaste un skin Premium en esta caja, toca recibir para continuar");
			}
		}
		case 4:
		{
			format(string, 128, "Proximamente");
		}
		case 5:
		{
			format(string, 128, "Ganaste 5 niveles de personaje en esta caja, toca recibir para continuar");
			personajeInfo[playerid][p_nivel] += 5;
		}

	}
	ShowXylosDialog(playerid, 1, TYPE_MSG, "Felicidades", string, "Recibir");


	for(new i;i<3;i++) conTrol[playerid][i] = 0;
	conTrol2[playerid] = 0;
	boxType2[playerid] = 0;
}

forward timerBox(playerid, boxtype);
public timerBox(playerid, boxtype)
{
	conTrol2[playerid]++;
	if(conTrol2[playerid] == 6)
	{
		conTrol2[playerid] = 0;
	}
	conTrol[playerid][2] = conTrol[playerid][1]; 
	conTrol[playerid][1] = conTrol[playerid][0]; 
	conTrol[playerid][0] = conTrol2[playerid];

	PlayerTextDrawSetPreviewModel(playerid, box[playerid][0], itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][0]]][i_o]);
	PlayerTextDrawSetPreviewModel(playerid, box[playerid][1], itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][1]]][i_o]);
	PlayerTextDrawSetPreviewModel(playerid, box[playerid][2], itemsInfo[boxInfo[boxtype][b_items][conTrol[playerid][2]]][i_o]);

	for(new i=0;i<3;i++) PlayerTextDrawShow(playerid, box[playerid][i]);

}