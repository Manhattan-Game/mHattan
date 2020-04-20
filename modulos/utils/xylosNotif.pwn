#include <YSI_Coding\y_hooks>


new PlayerText:notificacionL[MAX_PLAYERS][5];
new PlayerText:moneyNot[MAX_PLAYERS][2];
new PlayerText:NotifG[MAX_PLAYERS][3];



new bool:notificacionOcupado[MAX_PLAYERS][4];
new bool:mOcupado[MAX_PLAYERS][2];
new bool:mGocupado[MAX_PLAYERS][3];



new timerDinero[MAX_PLAYERS];
new timerGrande[MAX_PLAYERS];
new timerNormal[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	notificacionL[playerid][0] = CreatePlayerTextDraw(playerid, 17.238115, 297.946624, "No eres el propietario");
	PlayerTextDrawLetterSize(playerid, notificacionL[playerid][0], 0.238095, 1.314133);
	PlayerTextDrawTextSize(playerid, notificacionL[playerid][0], 133.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, notificacionL[playerid][0], 1);
	PlayerTextDrawColor(playerid, notificacionL[playerid][0], -1523963137);
	PlayerTextDrawUseBox(playerid, notificacionL[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, notificacionL[playerid][0], 1212236202);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, notificacionL[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, notificacionL[playerid][0], 255);
	PlayerTextDrawFont(playerid, notificacionL[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, notificacionL[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][0], 0);

	notificacionL[playerid][1] = CreatePlayerTextDraw(playerid, 17.238117, 272.773315, "No eres el propietario");
	PlayerTextDrawLetterSize(playerid, notificacionL[playerid][1], 0.238095, 1.314133);
	PlayerTextDrawTextSize(playerid, notificacionL[playerid][1], 133.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, notificacionL[playerid][1], 1);
	PlayerTextDrawColor(playerid, notificacionL[playerid][1], -1523963137);
	PlayerTextDrawUseBox(playerid, notificacionL[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, notificacionL[playerid][1], 1212236202);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, notificacionL[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, notificacionL[playerid][1], 255);
	PlayerTextDrawFont(playerid, notificacionL[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, notificacionL[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][1], 0);

	notificacionL[playerid][2] = CreatePlayerTextDraw(playerid, 17.238117, 246.746643, "No eres el propietario");
	PlayerTextDrawLetterSize(playerid, notificacionL[playerid][2], 0.238095, 1.314133);
	PlayerTextDrawTextSize(playerid, notificacionL[playerid][2], 133.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, notificacionL[playerid][2], 1);
	PlayerTextDrawColor(playerid, notificacionL[playerid][2], -1523963137);
	PlayerTextDrawUseBox(playerid, notificacionL[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, notificacionL[playerid][2], 1212236202);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, notificacionL[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, notificacionL[playerid][2], 255);
	PlayerTextDrawFont(playerid, notificacionL[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, notificacionL[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][2], 0);

	notificacionL[playerid][3] = CreatePlayerTextDraw(playerid, 16.095254, 221.573333, "No eres el propietario");
	PlayerTextDrawLetterSize(playerid, notificacionL[playerid][3], 0.238095, 1.314133);
	PlayerTextDrawTextSize(playerid, notificacionL[playerid][3], 134.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, notificacionL[playerid][3], 1);
	PlayerTextDrawColor(playerid, notificacionL[playerid][3], -1523963137);
	PlayerTextDrawUseBox(playerid, notificacionL[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, notificacionL[playerid][3], 1212236202);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, notificacionL[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, notificacionL[playerid][3], 255);
	PlayerTextDrawFont(playerid, notificacionL[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, notificacionL[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, notificacionL[playerid][3], 0);


	NotifG[playerid][0] = CreatePlayerTextDraw(playerid, 491.904785, 114.053405, "Usa H para trabajar");
	PlayerTextDrawLetterSize(playerid, NotifG[playerid][0], 0.263619, 1.284267);
	PlayerTextDrawTextSize(playerid, NotifG[playerid][0], 613.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, NotifG[playerid][0], 1);
	PlayerTextDrawColor(playerid, NotifG[playerid][0], -2139062017);
	PlayerTextDrawUseBox(playerid, NotifG[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, NotifG[playerid][0], 180);
	PlayerTextDrawSetShadow(playerid, NotifG[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, NotifG[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, NotifG[playerid][0], 255);
	PlayerTextDrawFont(playerid, NotifG[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, NotifG[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, NotifG[playerid][0], 0);

	NotifG[playerid][1] = CreatePlayerTextDraw(playerid, 492.285736, 158.853378, "Usa H para trabajar");
	PlayerTextDrawLetterSize(playerid, NotifG[playerid][1], 0.263619, 1.284267);
	PlayerTextDrawTextSize(playerid, NotifG[playerid][1], 613.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, NotifG[playerid][1], 1);
	PlayerTextDrawColor(playerid, NotifG[playerid][1], -2139062017);
	PlayerTextDrawUseBox(playerid, NotifG[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, NotifG[playerid][1], 180);
	PlayerTextDrawSetShadow(playerid, NotifG[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, NotifG[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, NotifG[playerid][1], 255);
	PlayerTextDrawFont(playerid, NotifG[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, NotifG[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, NotifG[playerid][1], 0);

	NotifG[playerid][2] = CreatePlayerTextDraw(playerid, 492.666687, 208.773345, "Usa H para trabajar");
	PlayerTextDrawLetterSize(playerid, NotifG[playerid][2], 0.263619, 1.284267);
	PlayerTextDrawTextSize(playerid, NotifG[playerid][2], 614.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, NotifG[playerid][2], 1);
	PlayerTextDrawColor(playerid, NotifG[playerid][2], -2139062017);
	PlayerTextDrawUseBox(playerid, NotifG[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, NotifG[playerid][2], 180);
	PlayerTextDrawSetShadow(playerid, NotifG[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, NotifG[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, NotifG[playerid][2], 255);
	PlayerTextDrawFont(playerid, NotifG[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, NotifG[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, NotifG[playerid][2], 0);



	moneyNot[playerid][0] = CreatePlayerTextDraw(playerid, 534.952636, 6.106681, "+1000");
	PlayerTextDrawLetterSize(playerid, moneyNot[playerid][0], 0.313904, 0.866133);
	PlayerTextDrawAlignment(playerid, moneyNot[playerid][0], 1);
	PlayerTextDrawColor(playerid, moneyNot[playerid][0], 8388863);
	PlayerTextDrawSetShadow(playerid, moneyNot[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, moneyNot[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, moneyNot[playerid][0], 255);
	PlayerTextDrawFont(playerid, moneyNot[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, moneyNot[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, moneyNot[playerid][0], 0);

	moneyNot[playerid][1] = CreatePlayerTextDraw(playerid, 489.619354, 5.680016, "-1000");
	PlayerTextDrawLetterSize(playerid, moneyNot[playerid][1], 0.313904, 0.866133);
	PlayerTextDrawAlignment(playerid, moneyNot[playerid][1], 1);
	PlayerTextDrawColor(playerid, moneyNot[playerid][1], -1523963137);
	PlayerTextDrawSetShadow(playerid, moneyNot[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, moneyNot[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, moneyNot[playerid][1], 255);
	PlayerTextDrawFont(playerid, moneyNot[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, moneyNot[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, moneyNot[playerid][1], 0);

    return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	for(new i=0; i<5; i++) PlayerTextDrawDestroy(playerid, notificacionL[playerid][i]);
	for(new i=0; i<2; i++) PlayerTextDrawDestroy(playerid, moneyNot[playerid][i]);
	return Y_HOOKS_CONTINUE_RETURN_1;
}

stock enviarMoneyNotif(playerid, color, text)
{
	new string[17];
	if(mOcupado[playerid][0] == false)
	{
		if(color == 0)
		{ 
			PlayerTextDrawColor(playerid, moneyNot[playerid][0], 8388863);
			format(string, 17, "+$%i", text);
			PlayerTextDrawSetString(playerid, moneyNot[playerid][0], string);
		}
		else 
		{
			PlayerTextDrawColor(playerid, moneyNot[playerid][0], -2147483393);
			format(string, 17, "-$%i", text);
			PlayerTextDrawSetString(playerid, moneyNot[playerid][0], string);
		}
		PlayerTextDrawShow(playerid, moneyNot[playerid][0]);
		mOcupado[playerid][0] = true;
		timerDinero[playerid] = SetTimerEx("escondermoneyNotif", 5000, false, "d", playerid);
	}
	else if(mOcupado[playerid][1] == false)
	{
		if(color == 0)
		{ 
			PlayerTextDrawColor(playerid, moneyNot[playerid][1], 8388863);
			format(string, 17, "+$%i", text);
			PlayerTextDrawSetString(playerid, moneyNot[playerid][1], string);
		}
		else 
		{
			PlayerTextDrawColor(playerid, moneyNot[playerid][1], -2147483393);
			format(string, 17, "-$%i", text);
			PlayerTextDrawSetString(playerid, moneyNot[playerid][1], string);
		}
		PlayerTextDrawShow(playerid, moneyNot[playerid][1]);
		mOcupado[1] = true;
		timerDinero[playerid] = SetTimerEx("escondermoneyNotif", 5000, false, "d", playerid);
	}
}
stock enviarNotificacion(playerid, const fr[])
{

	new text[128];
	format(text, 128, "%s", fr);
	if(notificacionOcupado[playerid][0] == false)
	{
		PlayerTextDrawSetString(playerid, notificacionL[playerid][0], text);
		PlayerTextDrawShow(playerid, notificacionL[playerid][0]);
		notificacionOcupado[playerid][0] = true;
		timerNormal[playerid] = SetTimerEx("esconderNotificacion", 5000, false, "d", playerid);
	}
	else if(notificacionOcupado[playerid][1] == false)
	{
		PlayerTextDrawSetString(playerid, notificacionL[playerid][1], text);
		PlayerTextDrawShow(playerid, notificacionL[playerid][1]);
		notificacionOcupado[playerid][1] = true;
		timerNormal[playerid] = SetTimerEx("esconderNotificacion", 5000, false, "d", playerid);
	}
	else if(notificacionOcupado[playerid][2] == false)
	{
		PlayerTextDrawSetString(playerid, notificacionL[playerid][2], text);
		PlayerTextDrawShow(playerid, notificacionL[playerid][2]);
		notificacionOcupado[playerid][2] = true;
		timerNormal[playerid] = SetTimerEx("esconderNotificacion", 5000, false, "d", playerid);
	}
	else if(notificacionOcupado[playerid][3] == false)
	{
		PlayerTextDrawSetString(playerid, notificacionL[playerid][3], text);
		PlayerTextDrawShow(playerid, notificacionL[playerid][3]);
		notificacionOcupado[playerid][3] = true;
		timerNormal[playerid] = SetTimerEx("esconderNotificacion", 5000, false, "d", playerid);
	}
	return 1;
}
forward esconderNotificacion(playerid);
public esconderNotificacion(playerid)
{
	if(notificacionOcupado[playerid][0] == true)
	{
		PlayerTextDrawHide(playerid, notificacionL[playerid][0]);
		notificacionOcupado[playerid][0] = false;
	}
	else if(notificacionOcupado[playerid][1] == true)
	{
		PlayerTextDrawHide(playerid, notificacionL[playerid][1]);
		notificacionOcupado[playerid][1] = false;
	}
	else if(notificacionOcupado[playerid][2] == true)
	{
		PlayerTextDrawHide(playerid, notificacionL[playerid][2]);
		notificacionOcupado[playerid][2] = false;
	}
	else if(notificacionOcupado[playerid][3] == true)
	{
		PlayerTextDrawHide(playerid, notificacionL[playerid][3]);
		notificacionOcupado[playerid][3] = false;
	}
	return true;
}
forward escondermoneyNotif(playerid);
public escondermoneyNotif(playerid)
{
	if(mOcupado[playerid][0] == true)
	{
		PlayerTextDrawHide(playerid, moneyNot[playerid][0]);
		mOcupado[playerid][0] = false;
	}
	else if(mOcupado[playerid][1] == true)
	{
		PlayerTextDrawHide(playerid, moneyNot[playerid][1]);
		mOcupado[playerid][1] = false;
	}
}
stock enviarNotificacionG(playerid, const fr[])
{

	new text[128];
	format(text, 128, "%s", fr);
	if(mGocupado[playerid][0] == false)
	{
		PlayerTextDrawSetString(playerid, NotifG[playerid][0], text);
		PlayerTextDrawShow(playerid, NotifG[playerid][0]);
		timerGrande[playerid] = SetTimerEx("esconedernotificaciong", 7000, false, "d", playerid);
		mGocupado[playerid][0] = true;
	}
	else if(mGocupado[playerid][1] == false)
	{
		PlayerTextDrawSetString(playerid, NotifG[playerid][1], text);
		PlayerTextDrawShow(playerid, NotifG[playerid][1]);
		timerGrande[playerid] = SetTimerEx("esconedernotificaciong", 7000, false, "d", playerid);
		mGocupado[playerid][1] = true;
	}
	else if(mGocupado[playerid][2] == false)
	{
		PlayerTextDrawSetString(playerid, NotifG[playerid][2], text);
		PlayerTextDrawShow(playerid, NotifG[playerid][2]);
		timerGrande[playerid] = SetTimerEx("esconedernotificaciong", 7000, false, "d", playerid);
		mGocupado[playerid][2] = true;
	}
	return 1;
}
forward esconedernotificaciong(playerid);
public esconedernotificaciong(playerid)
{
	if(mGocupado[playerid][0] == true)
	{
		PlayerTextDrawHide(playerid, NotifG[playerid][0]);
		mGocupado[playerid][0] = false;
	}
	else if(mGocupado[playerid][1] == true)
	{
		PlayerTextDrawHide(playerid, NotifG[playerid][1]);
		mGocupado[playerid][1] = false;
	}
	else if(mGocupado[playerid][2] == true)
	{
		PlayerTextDrawHide(playerid, NotifG[playerid][2]);
		mGocupado[playerid][2] = false;
	}
}