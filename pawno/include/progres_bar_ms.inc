#include <a_samp>

#define MAX_BAR 15
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
	bar_direction,
	Float:bar_oldcontrol,
	bool:bar_used,
	bool:bar_show,
	PlayerText:bar_create 
};
new barInfo[MAX_PLAYERS][MAX_BAR][infoBar];



createProgressBar(playerid, barid, Float:x1, Float:y1, Float:x2, Float:y2, color, Float:MAX, direction)
{

	barInfo[playerid][barid][bar_id] = barid;
	barInfo[playerid][barid][bar_oldcontrol] = -1;
	barInfo[playerid][barid][bar_min] = x1;
	barInfo[playerid][barid][bar_x1] = x1;
	barInfo[playerid][barid][bar_y1] = y1;
	barInfo[playerid][barid][bar_x2] = x2;
	barInfo[playerid][barid][bar_y2] = y2;
	barInfo[playerid][barid][bar_color] = color;
	barInfo[playerid][barid][bar_max] = MAX;
	barInfo[playerid][barid][bar_used] = true;
	barInfo[playerid][barid][bar_direction] = direction;


	barInfo[playerid][barid][bar_create] = CreatePlayerTextDraw(playerid, barInfo[playerid][barid][bar_x1], barInfo[playerid][barid][bar_y1], "box");
	PlayerTextDrawLetterSize(playerid, barInfo[playerid][barid][bar_create], 0.000000, barInfo[playerid][barid][bar_y2]);
	PlayerTextDrawTextSize(playerid, barInfo[playerid][barid][bar_create], barInfo[playerid][barid][bar_x1], 0.000000);
	PlayerTextDrawAlignment(playerid, barInfo[playerid][barid][bar_create], 1);
	PlayerTextDrawColor(playerid, barInfo[playerid][barid][bar_create], -1);
	PlayerTextDrawUseBox(playerid, barInfo[playerid][barid][bar_create], 1);
	PlayerTextDrawBoxColor(playerid, barInfo[playerid][barid][bar_create], barInfo[playerid][barid][bar_color]);
	PlayerTextDrawSetShadow(playerid, barInfo[playerid][barid][bar_create], 0);
	PlayerTextDrawSetOutline(playerid, barInfo[playerid][barid][bar_create], 0);
	PlayerTextDrawBackgroundColor(playerid, barInfo[playerid][barid][bar_create], 255);
	PlayerTextDrawFont(playerid, barInfo[playerid][barid][bar_create], 1);
	PlayerTextDrawSetProportional(playerid, barInfo[playerid][barid][bar_create], 1);
	PlayerTextDrawSetShadow(playerid, barInfo[playerid][barid][bar_create], 0);

	return barid;
}
hideProgressBar(playerid, barid)
{
	PlayerTextDrawHide(playerid, barInfo[playerid][barid][bar_create]);
	barInfo[playerid][barid][bar_show] = false;
}
destroyProgressBar(playerid, barid)
{
	PlayerTextDrawDestroy(playerid, barInfo[playerid][barid][bar_create]);
	barInfo[playerid][barid][bar_used] = false;
	barInfo[playerid][barid][bar_show] = false;
	barInfo[playerid][barid][bar_oldcontrol] = -1;
}
showProgressBar(playerid, barid)
{
	PlayerTextDrawShow(playerid, barInfo[playerid][barid][bar_create]);
	barInfo[playerid][barid][bar_show] = true;
}
updateProgressBar(playerid, barid, Float:control)
{
	if(control != barInfo[playerid][barid][bar_oldcontrol])
	{	
		PlayerTextDrawDestroy(playerid, barInfo[playerid][barid][bar_create]);

		new string[20]; format(string, 20, "%f", control);
		new namber = strval(string);

		new Float:f = barInfo[playerid][barid][bar_x2] - barInfo[playerid][barid][bar_min];
		if(barInfo[playerid][barid][bar_direction] == 1) f = barInfo[playerid][barid][bar_y2];
		new Float:x = f / barInfo[playerid][barid][bar_max];
		
		barInfo[playerid][barid][bar_create] = CreatePlayerTextDraw(playerid, barInfo[playerid][barid][bar_x1], barInfo[playerid][barid][bar_y1], "box");
		PlayerTextDrawAlignment(playerid, barInfo[playerid][barid][bar_create], 1);
		PlayerTextDrawColor(playerid, barInfo[playerid][barid][bar_create], -1);
		PlayerTextDrawUseBox(playerid, barInfo[playerid][barid][bar_create], 1);
		PlayerTextDrawBoxColor(playerid, barInfo[playerid][barid][bar_create], barInfo[playerid][barid][bar_color]);
		PlayerTextDrawSetShadow(playerid, barInfo[playerid][barid][bar_create], 0);
		PlayerTextDrawSetOutline(playerid, barInfo[playerid][barid][bar_create], 0);
		PlayerTextDrawBackgroundColor(playerid, barInfo[playerid][barid][bar_create], 255);
		PlayerTextDrawFont(playerid, barInfo[playerid][barid][bar_create], 1);
		PlayerTextDrawSetProportional(playerid, barInfo[playerid][barid][bar_create], 1);
		PlayerTextDrawSetShadow(playerid, barInfo[playerid][barid][bar_create], 0);


		if(barInfo[playerid][barid][bar_direction] == 1){
			PlayerTextDrawLetterSize(playerid, barInfo[playerid][barid][bar_create], 0.000000, (x*namber));
			PlayerTextDrawTextSize(playerid, barInfo[playerid][barid][bar_create], barInfo[playerid][barid][bar_x2], 0.000000);
			
		} else {
			PlayerTextDrawLetterSize(playerid, barInfo[playerid][barid][bar_create], 0.000000, barInfo[playerid][barid][bar_y2]);
			PlayerTextDrawTextSize(playerid, barInfo[playerid][barid][bar_create], barInfo[playerid][barid][bar_min] + (x*namber), 0.000000);
		}
			
		PlayerTextDrawShow(playerid, barInfo[playerid][barid][bar_create]);

		barInfo[playerid][barid][bar_oldcontrol] = control;
		barInfo[playerid][barid][bar_show] = true;
	}
}



clearAllBars(playerid)
{
	for(new i;i<MAX_BAR;i++)
	{
		if(barInfo[playerid][i][bar_used] == true)
		{
			barInfo[playerid][i][bar_id] = 0;
			barInfo[playerid][i][bar_min] = 0;
			barInfo[playerid][i][bar_x1] = 0.0;
			barInfo[playerid][i][bar_y1] = 0.0;
			barInfo[playerid][i][bar_x2] = 0.0;
			barInfo[playerid][i][bar_y2] = 0.0;
			barInfo[playerid][i][bar_color] = 0;
			barInfo[playerid][i][bar_max] = 0;
			barInfo[playerid][i][bar_used] = false;
			barInfo[playerid][i][bar_oldcontrol] = 0.0;
			barInfo[playerid][i][bar_direction] = 0;
		}
	}
}