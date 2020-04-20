#if defined _BroadwayBar_included
  #endinput
#endif
#define _BroadwayBar_included

#include <a_samp>
#include <YSI_Coding\y_hooks>

#define MAX_BAR 100
enum infoBar
{
	bar_id,
	Float:bar_min,
	Float:bar_x1,
	Float:bar_y1,
	Float:bar_x2,
	Float:bar_y2,
	Float:bar_max,
	bar_color,
	bool:bar_used,
	PlayerText:bar_create 
};
new barInfo[MAX_BAR][infoBar];



crearBarra(playerid, Float:min, barid, Float:x1, Float:y1, Float:x2, Float:y2, color, Float:MAX)
{

	barInfo[barid][bar_id] = barid;
	barInfo[barid][bar_min] = min;
	barInfo[barid][bar_x1] = x1;
	barInfo[barid][bar_y1] = y1;
	barInfo[barid][bar_x2] = x2;
	barInfo[barid][bar_y2] = y2;
	barInfo[barid][bar_color] = color;
	barInfo[barid][bar_max] = MAX;
	barInfo[barid][bar_used] = true;


	barInfo[barid][bar_create] = CreatePlayerTextDraw(playerid, barInfo[barid][bar_x1], barInfo[barid][bar_y1], "box");
	PlayerTextDrawLetterSize(playerid, barInfo[barid][bar_create], 0.000000, barInfo[barid][bar_y2]);
	PlayerTextDrawTextSize(playerid, barInfo[barid][bar_create], barInfo[barid][bar_x2], 0.000000);
	PlayerTextDrawAlignment(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawColor(playerid, barInfo[barid][bar_create], -1);
	PlayerTextDrawUseBox(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawBoxColor(playerid, barInfo[barid][bar_create], barInfo[barid][bar_color]);
	PlayerTextDrawSetShadow(playerid, barInfo[barid][bar_create], 0);
	PlayerTextDrawSetOutline(playerid, barInfo[barid][bar_create], 0);
	PlayerTextDrawBackgroundColor(playerid, barInfo[barid][bar_create], 255);
	PlayerTextDrawFont(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawSetProportional(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawSetShadow(playerid, barInfo[barid][bar_create], 0);

	return barid;
}

actualizarBarra(playerid, barid, Float:control)
{
	PlayerTextDrawDestroy(playerid, barInfo[barid][bar_create]);

	new string[20]; format(string, 20, "%.0f", control);
	new namber = strval(string);


	new Float:f = barInfo[barid][bar_x2] - barInfo[barid][bar_min];
	new Float:x = f / barInfo[barid][bar_max];
	new Float:total = barInfo[barid][bar_min];

	for(new i;i<namber;i++)
	{
		total +=  x;

	}





	barInfo[barid][bar_create] = CreatePlayerTextDraw(playerid, barInfo[barid][bar_x1], barInfo[barid][bar_y1], "box");
	PlayerTextDrawLetterSize(playerid, barInfo[barid][bar_create], 0.000000, barInfo[barid][bar_y2]);
	PlayerTextDrawTextSize(playerid, barInfo[barid][bar_create], total, 0.000000);
	PlayerTextDrawAlignment(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawColor(playerid, barInfo[barid][bar_create], -1);
	PlayerTextDrawUseBox(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawBoxColor(playerid, barInfo[barid][bar_create], barInfo[barid][bar_color]);
	PlayerTextDrawSetShadow(playerid, barInfo[barid][bar_create], 0);
	PlayerTextDrawSetOutline(playerid, barInfo[barid][bar_create], 0);
	PlayerTextDrawBackgroundColor(playerid, barInfo[barid][bar_create], 255);
	PlayerTextDrawFont(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawSetProportional(playerid, barInfo[barid][bar_create], 1);
	PlayerTextDrawSetShadow(playerid, barInfo[barid][bar_create], 0);

	PlayerTextDrawShow(playerid, barInfo[barid][bar_create]);
}

mostrarBarra(playerid, barid)
{
	PlayerTextDrawShow(playerid, barInfo[barid][bar_create]);
}
