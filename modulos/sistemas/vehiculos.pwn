#include <YSI_Coding\y_hooks>

DEFINE_HOOK_REPLACEMENT(OnPlayerC, OP__);


#define MARCHA_1_MAX 35
#define MARCHA_2_MIN 27
#define MARCHA_2_MAX 50
#define MARCHA_3_MIN 35
#define MARCHA_3_MAX 70
#define MARCHA_4_MIN 30
#define MARCHA_4_MAX 100
#define MARCHA_5_MIN 80

#define reduccion_fuerte 2.5
#define reduccion_baja 1.5




new Text:velocimetroT[3];
new PlayerText:velocimetroTT[MAX_PLAYERS][10];

new Text:attachamenT[3];
new PlayerText:attachamenTT[MAX_PLAYERS][13];

enum _veh@info
{
	v_id,
	v_mkid,
	v_model,
	Float:v_pos[4],
	v_vw,
	v_color1,
	v_color2,
	v_respawn,
	Float:v_vida,

	v_puertas,
	v_motor,
	v_luces,
	v_babierto,
	v_capo,

	v_gasolina,
	v_aceite,

	v_baul[9],
	v_baulcant[9],

	v_attachobject[9],
	v_attachmodel[9],
	Float:v_attachx[9],
	Float:v_attachy[9],
	Float:v_attachz[9],
	Float:v_rotx[9],
	Float:v_roty[9],
	Float:v_rotz[9],

	v_velocimetro,
	v_frenomano,

	v_timergasolina,
	v_timeraceite,

	v_cargado,
	bool:v_cargado2,
	bool:v_spawn	
};
new vehInfo[MAX_VEHICLES][_veh@info];





hook OnGameModeInit()
{
    mysql_query(/*celulares*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS `vehiculos` (`v_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,`v_mkid` int(10) NOT NULL,`v_model` int(10) NOT NULL, `v_pos0` float(10) NOT NULL, `v_pos1` float(10) NOT NULL, `v_pos2` float(10) NOT NULL, `v_pos3` float(10) NOT NULL, `v_vw` int(10) NOT NULL, `v_color1` int(10) NOT NULL, `v_color2` int(10) NOT NULL, \
    `v_respawn` int(10) NOT NULL, `v_vida` float(10) NOT NULL, `v_puertas` int(10) NOT NULL, `v_motor` int(10) NOT NULL, `v_luces` int(10) NOT NULL, `v_baul` int(10) NOT NULL, `v_capo` int(10) NOT NULL, `v_gasolina` int(10) NOT NULL, `v_aceite` int(10) NOT NULL, \
    `v_baul1` int(3) NOT NULL, `v_baul2` int(3) NOT NULL, `v_baul3` int(3) NOT NULL, `v_baul4` int(3) NOT NULL, `v_baul5` int(3) NOT NULL, `v_baul6` int(3) NOT NULL, `v_baul7` int(3) NOT NULL, `v_baul8` int(3) NOT NULL, `v_baul9` int(3) NOT NULL, \
    `v_baulcant1` int(3) NOT NULL,`v_baulcant2` int(3) NOT NULL, `v_baulcant3` int(3) NOT NULL,`v_baulcant4` int(3) NOT NULL, `v_baulcant5` int(3) NOT NULL, `v_baulcant6` int(3) NOT NULL, `v_baulcant7` int(3) NOT NULL, `v_baulcant8` int(3) NOT NULL, `v_baulcant9` int(3) NOT NULL, \
    `v_attachobject1` int(3) NOT NULL, `v_attachobject2` int(3) NOT NULL, `v_attachobject3` int(3) NOT NULL, `v_attachobject4` int(3) NOT NULL, `v_attachobject5` int(3) NOT NULL, `v_attachobject6` int(3) NOT NULL, `v_attachobject7` int(3) NOT NULL, `v_attachobject8` int(3) NOT NULL, `v_attachobject9` int(3) NOT NULL, \
    `v_attachmodel1` int(3) NOT NULL, `v_attachmodel2` int(3) NOT NULL, `v_attachmodel3` int(3) NOT NULL, `v_attachmodel4` int(3) NOT NULL, `v_attachmodel5` int(3) NOT NULL, `v_attachmodel6` int(3) NOT NULL, `v_attachmodel7` int(3) NOT NULL, `v_attachmodel8` int(3) NOT NULL, `v_attachmodel9` int(3) NOT NULL, \
    `v_attachx1` float(10) NOT NULL, `v_attachx2` float(10) NOT NULL, `v_attachx3` float(10) NOT NULL, `v_attachx4` float(10) NOT NULL, `v_attachx5` float(10) NOT NULL, `v_attachx6` float(10) NOT NULL, `v_attachx7` float(10) NOT NULL, `v_attachx8` float(10) NOT NULL, `v_attachx9` float(10) NOT NULL, \
    `v_attachy1` float(10) NOT NULL, `v_attachy2` float(10) NOT NULL, `v_attachy3` float(10) NOT NULL, `v_attachy4` float(10) NOT NULL, `v_attachy5` float(10) NOT NULL, `v_attachy6` float(10) NOT NULL, `v_attachy7` float(10) NOT NULL, `v_attachy8` float(10) NOT NULL, `v_attachy9` float(10) NOT NULL, \
    `v_attachz1` float(10) NOT NULL, `v_attachz2` float(10) NOT NULL, `v_attachz3` float(10) NOT NULL, `v_attachz4` float(10) NOT NULL, `v_attachz5` float(10) NOT NULL, `v_attachz6` float(10) NOT NULL, `v_attachz7` float(10) NOT NULL, `v_attachz8` float(10) NOT NULL, `v_attachz9` float(10) NOT NULL, \
    `v_rotx1` float(10) NOT NULL, `v_rotx2` float(10) NOT NULL, `v_rotx3` float(10) NOT NULL, `v_rotx4` float(10) NOT NULL, `v_rotx5` float(10) NOT NULL, `v_rotx6` float(10) NOT NULL, `v_rotx7` float(10) NOT NULL, `v_rotx8` float(10) NOT NULL, `v_rotx9` float(10) NOT NULL, \
    `v_roty1` float(10) NOT NULL, `v_roty2` float(10) NOT NULL, `v_roty3` float(10) NOT NULL, `v_roty4` float(10) NOT NULL, `v_roty5` float(10) NOT NULL, `v_roty6` float(10) NOT NULL, `v_roty7` float(10) NOT NULL, `v_roty8` float(10) NOT NULL, `v_roty9` float(10) NOT NULL, \
    `v_rotz1` float(10) NOT NULL, `v_rotz2` float(10) NOT NULL, `v_rotz3` float(10) NOT NULL, `v_rotz4` float(10) NOT NULL, `v_rotz5` float(10) NOT NULL, `v_rotz6` float(10) NOT NULL, `v_rotz7` float(10) NOT NULL, `v_rotz8` float(10) NOT NULL, `v_rotz9` float(10) NOT NULL, `v_frenomano` int(3) NOT NULL)");

	for(new i;i<MAX_VEHICLES;i++)
	{
		cargarVehiculos(i);
	}

	velocimetroT[0] = TextDrawCreate(503.856964, 325.666595, "mdl-2001:logo_Velo");
	TextDrawLetterSize(velocimetroT[0], 0.000000, 0.000000);
	TextDrawTextSize(velocimetroT[0], 127.000000, 76.000000);
	TextDrawAlignment(velocimetroT[0], 1);
	TextDrawColor(velocimetroT[0], -1);
	TextDrawSetShadow(velocimetroT[0], 0);
	TextDrawSetOutline(velocimetroT[0], 0);
	TextDrawBackgroundColor(velocimetroT[0], 255);
	TextDrawFont(velocimetroT[0], 4);
	TextDrawSetProportional(velocimetroT[0], 0);
	TextDrawSetShadow(velocimetroT[0], 0);

	velocimetroT[1] = TextDrawCreate(510.571350, 362.373291, "KM/h");
	TextDrawLetterSize(velocimetroT[1], 0.249522, 1.139199);
	TextDrawAlignment(velocimetroT[1], 1);
	TextDrawColor(velocimetroT[1], -1523963137);
	TextDrawSetShadow(velocimetroT[1], 0);
	TextDrawSetOutline(velocimetroT[1], 0);
	TextDrawBackgroundColor(velocimetroT[1], 255);
	TextDrawFont(velocimetroT[1], 2);
	TextDrawSetProportional(velocimetroT[1], 1);
	TextDrawSetShadow(velocimetroT[1], 0);

	velocimetroT[2] = TextDrawCreate(507.523956, 401.200042, "box");
	TextDrawLetterSize(velocimetroT[2], 0.000000, 1.657142);
	TextDrawTextSize(velocimetroT[2], 626.000000, 0.000000);
	TextDrawAlignment(velocimetroT[2], 1);
	TextDrawColor(velocimetroT[2], -1);
	TextDrawUseBox(velocimetroT[2], 1);
	TextDrawBoxColor(velocimetroT[2], 673720450);
	TextDrawSetShadow(velocimetroT[2], 0);
	TextDrawSetOutline(velocimetroT[2], 0);
	TextDrawBackgroundColor(velocimetroT[2], 255);
	TextDrawFont(velocimetroT[2], 1);
	TextDrawSetProportional(velocimetroT[2], 1);
	TextDrawSetShadow(velocimetroT[2], 0);


	attachamenT[0] = TextDrawCreate(245.428619, 109.360054, "box");
	TextDrawLetterSize(attachamenT[0], 0.000000, 22.190492);
	TextDrawTextSize(attachamenT[0], 375.000000, 0.000000);
	TextDrawAlignment(attachamenT[0], 1);
	TextDrawColor(attachamenT[0], -1);
	TextDrawUseBox(attachamenT[0], 1);
	TextDrawBoxColor(attachamenT[0], 875836586);
	TextDrawSetShadow(attachamenT[0], 0);
	TextDrawSetOutline(attachamenT[0], 0);
	TextDrawBackgroundColor(attachamenT[0], 255);
	TextDrawFont(attachamenT[0], 1);
	TextDrawSetProportional(attachamenT[0], 1);
	TextDrawSetShadow(attachamenT[0], 0);

	attachamenT[1] = TextDrawCreate(245.428665, 102.106689, "Accesorios_del_vehiculo");
	TextDrawLetterSize(attachamenT[1], 0.299428, 0.964266);
	TextDrawTextSize(attachamenT[1], 375.000000, 0.000000);
	TextDrawAlignment(attachamenT[1], 1);
	TextDrawColor(attachamenT[1], -1);
	TextDrawUseBox(attachamenT[1], 1);
	TextDrawBoxColor(attachamenT[1], 1862870015);
	TextDrawSetShadow(attachamenT[1], 0);
	TextDrawSetOutline(attachamenT[1], 0);
	TextDrawBackgroundColor(attachamenT[1], 1862870015);
	TextDrawFont(attachamenT[1], 1);
	TextDrawSetProportional(attachamenT[1], 1);
	TextDrawSetShadow(attachamenT[1], 0);

	return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OnGameModeExit()
{
	for(new i;i<3;i++) TextDrawDestroy(velocimetroT[i]);
	for(new p;p<2;p++) TextDrawDestroy(attachamenT[p]);

	for(new d;d<MAX_VEHICLES;d++)
	{
		guardarVehiculo(d);
	}
	return 1;
}
hook OnPlayerConnect(playerid)
{
	velocimetroTT[playerid][0] = CreatePlayerTextDraw(playerid, 515.142700, 347.439971, "51");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][0], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][0], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][0], 255);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][0], 0);

	velocimetroTT[playerid][1] = CreatePlayerTextDraw(playerid, 524.666625, 388.826568, "box");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][1], 0.000000, 0.285712);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][1], 587.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][1], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, velocimetroTT[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, velocimetroTT[playerid][1], -1523963137);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][1], -1523963137);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][1], 0);

	velocimetroTT[playerid][2] = CreatePlayerTextDraw(playerid, 598.952575, 382.853240, "box");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][2], 0.000000, -2.838094);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][2], 601.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][2], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, velocimetroTT[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, velocimetroTT[playerid][2], -2139094785);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][2], -1523963137);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][2], 0);

	velocimetroTT[playerid][3] = CreatePlayerTextDraw(playerid, 625.238952, 382.853240, "box");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][3], 0.000000, -3.790472);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][3], 626.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][3], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, velocimetroTT[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, velocimetroTT[playerid][3], -1378294017);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][3], -1523963137);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][3], 0);

	velocimetroTT[playerid][4] = CreatePlayerTextDraw(playerid, 556.952758, 348.879943, "hud:radar_light");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][4], 10.000000, 12.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][4], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][4], -1523963137);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][4], 255);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][4], 0);

	velocimetroTT[playerid][5] = CreatePlayerTextDraw(playerid, 559.095458, 400.760070, "mdl-2001:logo_luces");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][5], 22.000000, 17.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][5], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][5], 255);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, velocimetroTT[playerid][5], true);

	velocimetroTT[playerid][6] = CreatePlayerTextDraw(playerid, 605.571289, 396.493408, "mdl-2001:logo_baul");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][6], 16.000000, 26.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][6], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][6], 255);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, velocimetroTT[playerid][6], true);

	velocimetroTT[playerid][7] = CreatePlayerTextDraw(playerid, 537.761596, 396.920074, "mdl-2001:logo_motor");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][7], 16.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][7], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][7], 255);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, velocimetroTT[playerid][7], true);

	velocimetroTT[playerid][8] = CreatePlayerTextDraw(playerid, 597.952331, 402.040069, "mdl-2001:logo_seguro");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][8], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][8], -15.000000, 14.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][8], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][8], 255);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, velocimetroTT[playerid][8], true);

	velocimetroTT[playerid][9] = CreatePlayerTextDraw(playerid, 527.476196, 400.760070, "mdl-2001:logo_capo");
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][9], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][9], -15.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][9], 1);
	PlayerTextDrawColor(playerid, velocimetroTT[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][9], 255);
	PlayerTextDrawFont(playerid, velocimetroTT[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, velocimetroTT[playerid][9], true);



	attachamenTT[playerid][0] = CreatePlayerTextDraw(playerid, 251.666717, 120.866699, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][0], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][0], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][0], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][0], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][0], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][1] = CreatePlayerTextDraw(playerid, 292.428680, 120.866714, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][1], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][1], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][1], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][1], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][2] = CreatePlayerTextDraw(playerid, 333.190521, 120.440048, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][2], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][2], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][2], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][2], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][3] = CreatePlayerTextDraw(playerid, 251.666839, 165.240005, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][3], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][3], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][3], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][3], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][4] = CreatePlayerTextDraw(playerid, 292.428710, 165.666671, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][4], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][4], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][4], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][4], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][4], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][4], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][5] = CreatePlayerTextDraw(playerid, 333.190521, 164.386672, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][5], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][5], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][5], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][5], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][5], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][6] = CreatePlayerTextDraw(playerid, 252.428634, 209.613296, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][6], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][6], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][6], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][6], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][6], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][6], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][6], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][7] = CreatePlayerTextDraw(playerid, 292.428558, 209.186630, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][7], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][7], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][7], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][7], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][7], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][7], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][7], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][8] = CreatePlayerTextDraw(playerid, 332.809387, 209.186630, "");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][8], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][8], 38.000000, 42.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][8], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][8], 505290370);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][8], 5);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][8], true);
	PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][8], 1139);
	PlayerTextDrawSetPreviewRot(playerid, attachamenTT[playerid][8], 0.000000, 0.000000, 0.000000, 1.000000);

	attachamenTT[playerid][9] = CreatePlayerTextDraw(playerid, 253.428588, 265.093322, "Eliminar");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][9], 0.285714, 0.981333);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][9], 290.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][9], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, attachamenTT[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, attachamenTT[playerid][9], 1862870015);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][9], 255);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][9], true);

	attachamenTT[playerid][10] = CreatePlayerTextDraw(playerid, 295.714233, 265.093322, "Mover");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][10], 0.285714, 0.981333);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][10], 327.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][10], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, attachamenTT[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, attachamenTT[playerid][10], 1862870015);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][10], 255);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][10], true);

	attachamenTT[playerid][11] = CreatePlayerTextDraw(playerid, 250.000000, 250.160003, "Obj:_Aleron");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][11], 0.224380, 1.215999);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][11], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][11], 255);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][11], 0);

	attachamenTT[playerid][12] = CreatePlayerTextDraw(playerid, 367.714050, 297.519958, "X");
	PlayerTextDrawLetterSize(playerid, attachamenTT[playerid][12], 0.285714, 0.981333);
	PlayerTextDrawTextSize(playerid, attachamenTT[playerid][12], 374.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, attachamenTT[playerid][12], 1);
	PlayerTextDrawColor(playerid, attachamenTT[playerid][12], -1061109505);
	PlayerTextDrawUseBox(playerid, attachamenTT[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, attachamenTT[playerid][12], -2147483393);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, attachamenTT[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, attachamenTT[playerid][12], 255);
	PlayerTextDrawFont(playerid, attachamenTT[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, attachamenTT[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, attachamenTT[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, attachamenTT[playerid][12], true);



	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	for(new i;i<10;i++) PlayerTextDrawDestroy(playerid, velocimetroTT[playerid][i]);
	for(new p;p<13;p++) PlayerTextDrawDestroy(playerid, attachamenTT[playerid][p]);
}

public  OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
    	new vehicleid = GetPlayerVehicleID(playerid);
        enviarNotificacionG(playerid, "Usa /menuv para usar el menu, Y+2(embrague) para subir de marcha y N+2 para bajar");
		marcha[playerid] = 0;
		timerVelocimetro[playerid] = 0;
		embrage[playerid] = 0;
		reversa[playerid] = 0;
		mostrarVelocimetro(playerid, vehicleid);
    }
    else if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER)
    {
        for(new h;h<3;h++) TextDrawHideForPlayer(playerid, velocimetroT[h]);
		for(new p;p<9;p++) PlayerTextDrawHide(playerid, velocimetroTT[playerid][p]);
		enVelocimetro[playerid] = false;
    }
	return 1;
}





hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == velocimetroTT[playerid][5])
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				new engine, lights, alarm, doors, bonnet, boot, objective;
				if(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_luces] == 0)
				{	
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
					vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_luces] = 1;
					enviarNotificacionG(playerid, "Encendiste las luces del vehiculo");
					break;
				}
				else
				{
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
					vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_luces] = 0;
					enviarNotificacionG(playerid, "Apagaste las luces del vehiculo");
					break;
				}
			}
		}
	}
	else if(playertextid == velocimetroTT[playerid][6])
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				new engine, lights, alarm, doors, bonnet, boot, objective;
				if(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_babierto] == 0)
				{	
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
					vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_babierto] = 1;
					enviarNotificacionG(playerid, "Abriste el baul del vehiculo");
					break;
				}
				else
				{
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
					vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_babierto] = 0;
					enviarNotificacionG(playerid, "Cerraste el baul del vehiculo");
					break;
				}
			}
		}
	}
	else if(playertextid == velocimetroTT[playerid][7])
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				if(vehInfo[u][v_gasolina] > 4)
				{	
					new engine, lights, alarm, doors, bonnet, boot, objective;
					if(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_motor] == 0)
					{
						if(vehInfo[u][v_frenomano] == 0)
						{
							GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
							SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
							vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_motor] = 1;
							enviarNotificacionG(playerid, "Encendiste el motor del vehiculo");
							break;
						} else
						{
							enviarNotificacionG(playerid, "El freno de mano esta activado");
							break;
						}
					}
					else
					{
						GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
						SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
						vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_motor] = 0;
						enviarNotificacionG(playerid, "Apagaste el motor del vehiculo");
						break;
					}
				}
			}
		}
	}
	else if(playertextid == velocimetroTT[playerid][8])
	{
		if(enVelocimetro[playerid] == false)
		{
			PlayerTextDrawHide(playerid, velocimetroTT[playerid][8]);
			TextDrawHideForPlayer(playerid, velocimetroT[2]);
		}
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				new engine, lights, alarm, doors, bonnet, boot, objective;
				if(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_puertas] == 0)
				{	
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
					vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_puertas] = 1;
					enviarNotificacionG(playerid, "Cerraste las puertas del vehiculo");
					break;
				}
				else
				{
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
					vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_puertas] = 0;
					enviarNotificacionG(playerid, "Abriste las puertas del vehiculo");
					break;
				}
			}
		}
	}
	else if(playertextid == velocimetroTT[playerid][8])
	{
		if(enVelocimetro[playerid] == false)
		{
			PlayerTextDrawHide(playerid, velocimetroTT[playerid][8]);
			TextDrawHideForPlayer(playerid, velocimetroT[2]);
		}
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				if(vehInfo[u][v_capo] == 1)
				{
					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
					vehInfo[u][v_capo] = 0;
					enviarNotificacionG(playerid, "Cerraste el capo del vehiculo");
				}
				else
				{
					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(inventarioInfo[playerid][i_slotcant][8], engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
					vehInfo[u][v_capo] = 1;
					enviarNotificacionG(playerid, "Abriste el capo del vehiculo");
				}
			}
		}
	}

	else if(playertextid == attachamenTT[playerid][0])
	{
		eligiendoAttach[playerid] = 0;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][1])
	{
		eligiendoAttach[playerid] = 1;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][2])
	{
		eligiendoAttach[playerid] = 2;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][3])
	{
		eligiendoAttach[playerid] = 3;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][4])
	{
		eligiendoAttach[playerid] = 4;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][5])
	{
		eligiendoAttach[playerid] = 5;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][6])
	{
		eligiendoAttach[playerid] = 6;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][7])
	{
		eligiendoAttach[playerid] = 7;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][8])
	{
		eligiendoAttach[playerid] = 8;
		new string[128];
		format(string, 128, "Obj:%s", objInfo[vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]]]  [o_nombre]);
		PlayerTextDrawSetString(playerid, attachamenTT[playerid][11], string);
	}
	else if(playertextid == attachamenTT[playerid][9])
	{
		if(enVelocimetro[playerid] == true)
		if(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]] != 0)
		{
			DestroyDynamicObject(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachobject][eligiendoAttach[playerid]]);
			vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]] = 0;
			enviarNotificacionG(playerid, "Eliminaste un objeto");
			for(new p;p<2;p++) TextDrawHideForPlayer(playerid, attachamenT[p]);
			for(new i;i<13;i++) PlayerTextDrawHide(playerid, attachamenTT[playerid][i]);

			mostrarAttachaments(playerid, inventarioInfo[playerid][i_slotcant][8]);

		} else enviarNotificacionG(playerid, "No tienes nada en esta ranuar");
	}
	else if(playertextid == attachamenTT[playerid][10])
	{

		if(enVelocimetro[playerid] == true)
		{
			agregarIttem(playerid, vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]], 1);
			vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachmodel][eligiendoAttach[playerid]] = 0;
			DestroyDynamicObject(vehInfo[inventarioInfo[playerid][i_slotcant][8]][v_attachobject][eligiendoAttach[playerid]]);
			enviarNotificacionG(playerid, "Enviaste el objeto a tu inventario");
			for(new p;p<2;p++) TextDrawHideForPlayer(playerid, attachamenT[p]);
			for(new i;i<13;i++) PlayerTextDrawHide(playerid, attachamenTT[playerid][i]);

			mostrarAttachaments(playerid, inventarioInfo[playerid][i_slotcant][8]);

		}
		else enviarNotificacionG(playerid, "No tienes un slot disponible en el inventario");
	}
	else if(playertextid == attachamenTT[playerid][12])
	{
		for(new p;p<2;p++) TextDrawHideForPlayer(playerid, attachamenT[p]);
		for(new i;i<13;i++) PlayerTextDrawHide(playerid, attachamenTT[playerid][i]);
		CancelSelectTextDraw(playerid);
	}
	return 1;
}
public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(response == EDIT_RESPONSE_FINAL)
	{
		new Float:ofx, Float:ofy, Float:ofz, Float:ofaz;
        new Float:finalx, Float:finaly;
        new Float:px, Float:py, Float:pz, Float:roz;
        GetVehiclePos(attachandoA[playerid], px, py, pz);
        GetVehicleZAngle(attachandoA[playerid], roz);
        ofx = x-px;
        ofy = y-py;
        ofz = z-pz;
        ofaz = rz-roz;
        finalx = ofx*floatcos(roz, degrees)+ofy*floatsin(roz, degrees);
        finaly = -ofx*floatsin(roz, degrees)+ofy*floatcos(roz, degrees);


        AttachDynamicObjectToVehicle(vehInfo[attachandoA[playerid]][v_attachobject][editandoCoche[playerid]], attachandoA[playerid], finalx, finaly, ofz, rx, ry, ofaz);

        vehInfo[attachandoA[playerid]] [v_attachx]	[slotv[playerid]] = finalx;
        vehInfo[attachandoA[playerid]] [v_attachy]	[slotv[playerid]] = finaly;
        vehInfo[attachandoA[playerid]] [v_attachz]	[slotv[playerid]] = ofz;

        vehInfo[attachandoA[playerid]] [v_rotx]	[slotv[playerid]] = rx;
        vehInfo[attachandoA[playerid]] [v_roty]	[slotv[playerid]] = ry;
        vehInfo[attachandoA[playerid]] [v_rotz]	[slotv[playerid]] = ofaz;

        enviarNotificacionG(playerid, "Objeto editado");
    }
    else if(response == EDIT_RESPONSE_CANCEL)  { DestroyDynamicObject(vehInfo[attachandoA[playerid]][v_attachobject][editandoCoche[playerid]]);	attachandoA[playerid] = 0; slotv[playerid] = 0;}
	return 1;
}
/*hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case d_baul:
		{
			if(response)
			{
				for(new i;i<9;i++)
				{
					if(vehInfo[attachandoA[playerid]][v_baul][i] == 0)
					{
						if(inventarioInfo[playerid][i_slot][8] != 0)
						{
							vehInfo[attachandoA[playerid]][v_baul][i] = inventarioInfo[playerid][i_slot][8];
							vehInfo[attachandoA[playerid]][v_baulcant][i] = inventarioInfo[playerid][i_slotcant][8];

							attachandoA[playerid] = 0;

							inventarioInfo[playerid][i_slot][8] = 0;
							inventarioInfo[playerid][i_slotcant][8] = 0;
							enviarNotificacionG(playerid, "Guardaste un objeto en el maletero");
							break;
						} else { enviarNotificacionG(playerid, "No tienes nada en la mano"); break;}
					}
				}
			}
			else
			{

				if(listitem == 0) eligiendoBaul[playerid] = 0;
				else if(listitem == 1) eligiendoBaul[playerid] = 1;
				else if(listitem == 2) eligiendoBaul[playerid] = 2;
				else if(listitem == 3) eligiendoBaul[playerid] = 3;
				else if(listitem == 4) eligiendoBaul[playerid] = 4;
				else if(listitem == 5) eligiendoBaul[playerid] = 5;
				else if(listitem == 6) eligiendoBaul[playerid] = 6;
				else if(listitem == 7) eligiendoBaul[playerid] = 7;
				else if(listitem == 8) eligiendoBaul[playerid] = 8;
				
				if(vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]] != 0)
				{
					agregarIttem(playerid, vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]], vehInfo[attachandoA[playerid]][v_baulcant][eligiendoBaul[playerid]]);
					vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]] = 0;
					vehInfo[attachandoA[playerid]][v_baulcant][eligiendoBaul[playerid]] = 0;

					enviarNotificacionG(playerid, "Sacaste un objeto del maletero");

				}else enviarNotificacionG(playerid, "No tienes nada en esta ranura");
			}
		}
	}
}*/


cargarVehiculos(id)
{
	if(SQL::RowExists("vehiculos", "v_id", id))
	{
		new xylos = SQL::Open(SQL::READ, "vehiculos", "v_id", id);
		SQL::ReadInt(xylos, "v_id", vehInfo[id][v_id]);
		SQL::ReadInt(xylos, "v_mkid", vehInfo[id][v_mkid]);
		SQL::ReadInt(xylos, "v_model", vehInfo[id][v_model]);

		SQL::ReadFloat(xylos, "v_pos0", vehInfo[id][v_pos][0]);
		SQL::ReadFloat(xylos, "v_pos1", vehInfo[id][v_pos][1]);
		SQL::ReadFloat(xylos, "v_pos2", vehInfo[id][v_pos][2]);
		SQL::ReadFloat(xylos, "v_pos3", vehInfo[id][v_pos][3]);

		SQL::ReadInt(xylos, "v_vw", vehInfo[id][v_vw]);
		SQL::ReadInt(xylos, "v_color1", vehInfo[id][v_color1]);
		SQL::ReadInt(xylos, "v_color2", vehInfo[id][v_color2]);
		SQL::ReadInt(xylos, "v_respawn", vehInfo[id][v_respawn]);
		SQL::ReadFloat(xylos, "v_vida", vehInfo[id][v_vida]);
		SQL::ReadInt(xylos, "v_puertas", vehInfo[id][v_puertas]);
		SQL::ReadInt(xylos, "v_motor", vehInfo[id][v_motor]);
		SQL::ReadInt(xylos, "v_luces", vehInfo[id][v_luces]);
		SQL::ReadInt(xylos, "v_baul", vehInfo[id][v_babierto]);
		SQL::ReadInt(xylos, "v_capo", vehInfo[id][v_capo]);
		SQL::ReadInt(xylos, "v_aceite", vehInfo[id][v_aceite]);
		SQL::ReadInt(xylos, "v_gasolina", vehInfo[id][v_gasolina]);

		SQL::ReadInt(xylos, "v_baul1", vehInfo[id][v_baul][0]);
		SQL::ReadInt(xylos, "v_baul2", vehInfo[id][v_baul][1]);
		SQL::ReadInt(xylos, "v_baul3", vehInfo[id][v_baul][2]);
		SQL::ReadInt(xylos, "v_baul4", vehInfo[id][v_baul][3]);
		SQL::ReadInt(xylos, "v_baul5", vehInfo[id][v_baul][4]);
		SQL::ReadInt(xylos, "v_baul6", vehInfo[id][v_baul][5]);
		SQL::ReadInt(xylos, "v_baul7", vehInfo[id][v_baul][6]);
		SQL::ReadInt(xylos, "v_baul8", vehInfo[id][v_baul][7]);
		SQL::ReadInt(xylos, "v_baul9", vehInfo[id][v_baul][8]);

		SQL::ReadInt(xylos, "v_baulcant1", vehInfo[id][v_baulcant][0]);
		SQL::ReadInt(xylos, "v_baulcant2", vehInfo[id][v_baulcant][1]);
		SQL::ReadInt(xylos, "v_baulcant3", vehInfo[id][v_baulcant][2]);
		SQL::ReadInt(xylos, "v_baulcant4", vehInfo[id][v_baulcant][3]);
		SQL::ReadInt(xylos, "v_baulcant5", vehInfo[id][v_baulcant][4]);
		SQL::ReadInt(xylos, "v_baulcant6", vehInfo[id][v_baulcant][5]);
		SQL::ReadInt(xylos, "v_baulcant7", vehInfo[id][v_baulcant][6]);
		SQL::ReadInt(xylos, "v_baulcant8", vehInfo[id][v_baulcant][7]);
		SQL::ReadInt(xylos, "v_baulcant9", vehInfo[id][v_baulcant][8]);

		SQL::ReadInt(xylos, "v_attachobject1", vehInfo[id][v_attachobject][0]);
		SQL::ReadInt(xylos, "v_attachobject2", vehInfo[id][v_attachobject][1]);
		SQL::ReadInt(xylos, "v_attachobject3", vehInfo[id][v_attachobject][2]);
		SQL::ReadInt(xylos, "v_attachobject4", vehInfo[id][v_attachobject][3]);
		SQL::ReadInt(xylos, "v_attachobject5", vehInfo[id][v_attachobject][4]);
		SQL::ReadInt(xylos, "v_attachobject6", vehInfo[id][v_attachobject][5]);
		SQL::ReadInt(xylos, "v_attachobject7", vehInfo[id][v_attachobject][6]);
		SQL::ReadInt(xylos, "v_attachobject8", vehInfo[id][v_attachobject][7]);
		SQL::ReadInt(xylos, "v_attachobject9", vehInfo[id][v_attachobject][8]);


		SQL::ReadInt(xylos, "v_attachmodel1", vehInfo[id][v_attachmodel][0]);
		SQL::ReadInt(xylos, "v_attachmodel2", vehInfo[id][v_attachmodel][1]);
		SQL::ReadInt(xylos, "v_attachmodel3", vehInfo[id][v_attachmodel][2]);
		SQL::ReadInt(xylos, "v_attachmodel4", vehInfo[id][v_attachmodel][3]);
		SQL::ReadInt(xylos, "v_attachmodel5", vehInfo[id][v_attachmodel][4]);
		SQL::ReadInt(xylos, "v_attachmodel6", vehInfo[id][v_attachmodel][5]);
		SQL::ReadInt(xylos, "v_attachmodel7", vehInfo[id][v_attachmodel][6]);
		SQL::ReadInt(xylos, "v_attachmodel8", vehInfo[id][v_attachmodel][7]);
		SQL::ReadInt(xylos, "v_attachmodel9", vehInfo[id][v_attachmodel][8]);


		SQL::ReadFloat(xylos, "v_attachx1", vehInfo[id][v_attachx][0]);
		SQL::ReadFloat(xylos, "v_attachx2", vehInfo[id][v_attachx][1]);
		SQL::ReadFloat(xylos, "v_attachx3", vehInfo[id][v_attachx][2]);
		SQL::ReadFloat(xylos, "v_attachx4", vehInfo[id][v_attachx][3]);
		SQL::ReadFloat(xylos, "v_attachx5", vehInfo[id][v_attachx][4]);
		SQL::ReadFloat(xylos, "v_attachx6", vehInfo[id][v_attachx][5]);
		SQL::ReadFloat(xylos, "v_attachx7", vehInfo[id][v_attachx][6]);
		SQL::ReadFloat(xylos, "v_attachx8", vehInfo[id][v_attachx][7]);
		SQL::ReadFloat(xylos, "v_attachx9", vehInfo[id][v_attachx][8]);

		SQL::ReadFloat(xylos, "v_attachy1", vehInfo[id][v_attachy][0]);
		SQL::ReadFloat(xylos, "v_attachy2", vehInfo[id][v_attachy][1]);
		SQL::ReadFloat(xylos, "v_attachy3", vehInfo[id][v_attachy][2]);
		SQL::ReadFloat(xylos, "v_attachy4", vehInfo[id][v_attachy][3]);
		SQL::ReadFloat(xylos, "v_attachy5", vehInfo[id][v_attachy][4]);
		SQL::ReadFloat(xylos, "v_attachy6", vehInfo[id][v_attachy][5]);
		SQL::ReadFloat(xylos, "v_attachy7", vehInfo[id][v_attachy][6]);
		SQL::ReadFloat(xylos, "v_attachy8", vehInfo[id][v_attachy][7]);
		SQL::ReadFloat(xylos, "v_attachy9", vehInfo[id][v_attachy][8]);

		SQL::ReadFloat(xylos, "v_attachz1", vehInfo[id][v_attachz][0]);
		SQL::ReadFloat(xylos, "v_attachz2", vehInfo[id][v_attachz][1]);
		SQL::ReadFloat(xylos, "v_attachz3", vehInfo[id][v_attachz][2]);
		SQL::ReadFloat(xylos, "v_attachz4", vehInfo[id][v_attachz][3]);
		SQL::ReadFloat(xylos, "v_attachz5", vehInfo[id][v_attachz][4]);
		SQL::ReadFloat(xylos, "v_attachz6", vehInfo[id][v_attachz][5]);
		SQL::ReadFloat(xylos, "v_attachz7", vehInfo[id][v_attachz][6]);
		SQL::ReadFloat(xylos, "v_attachz8", vehInfo[id][v_attachz][7]);
		SQL::ReadFloat(xylos, "v_attachz9", vehInfo[id][v_attachz][8]);

		SQL::ReadFloat(xylos, "v_rotx1", vehInfo[id][v_rotx][0]);
		SQL::ReadFloat(xylos, "v_rotx2", vehInfo[id][v_rotx][1]);
		SQL::ReadFloat(xylos, "v_rotx3", vehInfo[id][v_rotx][2]);
		SQL::ReadFloat(xylos, "v_rotx4", vehInfo[id][v_rotx][3]);
		SQL::ReadFloat(xylos, "v_rotx5", vehInfo[id][v_rotx][4]);
		SQL::ReadFloat(xylos, "v_rotx6", vehInfo[id][v_rotx][5]);
		SQL::ReadFloat(xylos, "v_rotx7", vehInfo[id][v_rotx][6]);
		SQL::ReadFloat(xylos, "v_rotx8", vehInfo[id][v_rotx][7]);
		SQL::ReadFloat(xylos, "v_rotx9", vehInfo[id][v_rotx][8]);

		SQL::ReadFloat(xylos, "v_roty1", vehInfo[id][v_roty][0]);
		SQL::ReadFloat(xylos, "v_roty2", vehInfo[id][v_roty][1]);
		SQL::ReadFloat(xylos, "v_roty3", vehInfo[id][v_roty][2]);
		SQL::ReadFloat(xylos, "v_roty4", vehInfo[id][v_roty][3]);
		SQL::ReadFloat(xylos, "v_roty5", vehInfo[id][v_roty][4]);
		SQL::ReadFloat(xylos, "v_roty6", vehInfo[id][v_roty][5]);
		SQL::ReadFloat(xylos, "v_roty7", vehInfo[id][v_roty][6]);
		SQL::ReadFloat(xylos, "v_roty8", vehInfo[id][v_roty][7]);
		SQL::ReadFloat(xylos, "v_roty9", vehInfo[id][v_roty][8]);

		SQL::ReadFloat(xylos, "v_rotz1", vehInfo[id][v_rotz][0]);
		SQL::ReadFloat(xylos, "v_rotz2", vehInfo[id][v_rotz][1]);
		SQL::ReadFloat(xylos, "v_rotz3", vehInfo[id][v_rotz][2]);
		SQL::ReadFloat(xylos, "v_rotz4", vehInfo[id][v_rotz][3]);
		SQL::ReadFloat(xylos, "v_rotz5", vehInfo[id][v_rotz][4]);
		SQL::ReadFloat(xylos, "v_rotz6", vehInfo[id][v_rotz][5]);
		SQL::ReadFloat(xylos, "v_rotz7", vehInfo[id][v_rotz][6]);
		SQL::ReadFloat(xylos, "v_rotz8", vehInfo[id][v_rotz][7]);
		SQL::ReadFloat(xylos, "v_rotz9", vehInfo[id][v_rotz][8]);

		SQL::ReadInt(xylos, "v_frenomano", vehInfo[id][v_frenomano]);




		if(vehInfo[id][v_model] != 0)
		{
			vehInfo[id][v_cargado] = CreateVehicle(vehInfo[id][v_model], vehInfo[id][v_pos][0], vehInfo[id][v_pos][1], vehInfo[id][v_pos][2], vehInfo[id][v_pos][3], vehInfo[id][v_color1], vehInfo[id][v_color2], -1, 0);
			SetVehicleVirtualWorld(id, vehInfo[id][v_vw]);
			SetVehicleHealth(id, vehInfo[id][v_vida]);

			for(new i;i<9;i++)
			{
				if(vehInfo[id][v_attachmodel][i] != 0)
				{
					vehInfo[id][v_attachobject][i] = CreateDynamicObject(objInfo[vehInfo[id][v_attachmodel][i]][o_model], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, -1, 15);
					AttachObjectToVehicle(vehInfo[id][v_attachobject][i], id, vehInfo[id][v_attachx][i], vehInfo[id][v_attachy][i], vehInfo[id][v_attachz][i], vehInfo[id][v_rotx][i], vehInfo[id][v_roty][i], vehInfo[id][v_rotz][i]);
				}
			}


			/*new engine, lights, alarm, doors, bonnet, boot, objective;
			if(vehInfo[id][v_motor] == 1)
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
			}
			if(vehInfo[id][v_puertas] == 1)
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, lights, alarm, VEHICLE_PARAMS_ON, bonnet, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, lights, alarm, VEHICLE_PARAMS_OFF, bonnet, boot, objective);
			}
			if(vehInfo[id][v_luces] == 1)
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);
			}
			if(vehInfo[id][v_baul] == 1)
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_ON, objective);
			}
			else
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, VEHICLE_PARAMS_OFF, objective);
			}
			if(vehInfo[id][v_capo] == 1)
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, lights, alarm, doors, VEHICLE_PARAMS_ON, boot, objective);
			}
			else
			{
				GetVehicleParamsEx(id, engine, lights, alarm, doors, bonnet, boot, objective);
				SetVehicleParamsEx(id, engine, lights, alarm, doors, VEHICLE_PARAMS_OFF, boot, objective);
			}*/

			vehInfo[id][v_cargado2] = true;
			vehInfo[id][v_timergasolina] = SetTimerEx("updateGasolina", 340000, true, "i", id);
			vehInfo[id][v_timeraceite] = SetTimerEx("updateAceite", 700000, true, "i", id); 

		}
	}
}
guardarVehiculo(id){
	if(vehInfo[id][v_cargado2] == true)
	{
		GetVehiclePos(id, vehInfo[id][v_pos][0], vehInfo[id][v_pos][1], vehInfo[id][v_pos][2]);
		GetVehicleZAngle(id, vehInfo[id][v_pos][3]);

		GetVehicleHealth(id, vehInfo[id][v_vida]);

		new xylos[1200];
		mysql_format(xylosMYSQL, xylos, sizeof(xylos), "UPDATE `vehiculos` SET  `v_mkid` = '%d',`v_model` = '%d', \
		`v_pos0` = '%f', `v_pos1` = '%f', `v_pos2` = '%f', `v_pos3` = '%f', `v_vw` = '%d', `v_color1` = '%d', `v_color2` = '%d', `v_respawn` = '%d', `v_vida` = '%f', 	\
		`v_puertas` = '%d', `v_motor` = '%d', `v_luces` = '%d', `v_baul` = '%d', `v_capo` = '%d', `v_gasolina` = '%d', `v_aceite` = '%d', \
		`v_baul1` = '%d', `v_baul2` = '%d', `v_baul3` = '%d', `v_baul4` = '%d', `v_baul5` = '%d', `v_baul6` = '%d', `v_baul7` = '%d', `v_baul8` = '%d', `v_baul9` = '%d',		\
		`v_baulcant1` = '%d', `v_baulcant2` = '%d', `v_baulcant3` = '%d', `v_baulcant4` = '%d', `v_baulcant5` = '%d', `v_baulcant6` = '%d', `v_baulcant7` = '%d', `v_baulcant8` = '%d', `v_baulcant9` = '%d', \
		`v_attachobject1` = '%d', `v_attachobject2` = '%d', `v_attachobject3` = '%d', `v_attachobject4` = '%d', `v_attachobject5` = '%d', `v_attachobject6` = '%d', `v_attachobject7` = '%d', `v_attachobject8` = '%d', `v_attachobject9` = '%d',		\
		`v_attachmodel1` = '%d', `v_attachmodel2` = '%d', `v_attachmodel3` = '%d', `v_attachmodel4` = '%d', `v_attachmodel5` = '%d', `v_attachmodel6` = '%d', `v_attachmodel7` = '%d', `v_attachmodel8` = '%d', `v_attachmodel9` = '%d'		\
		`v_attachx1` = '%f', `v_attachx2` = '%f', `v_attachx3` = '%f', `v_attachx4` = '%f', `v_attachx5` = '%f', `v_attachx6` = '%f', `v_attachx7` = '%f', `v_attachx8` = '%f', `v_attachx9` = '%f',		\
		`v_attachy1` = '%f', `v_attachy2` = '%f', `v_attachy3` = '%f', `v_attachy4` = '%f', `v_attachy5` = '%f', `v_attachy6` = '%f', `v_attachy7` = '%f', `v_attachy8` = '%f', `v_attachy9` = '%f',	\
		`v_attachz1` = '%f', `v_attachz2` = '%f', `v_attachz3` = '%f', `v_attachz4` = '%f', `v_attachz5` = '%f', `v_attachz6` = '%f', `v_attachz7` = '%f', `v_attachz8` = '%f', `v_attachz9` = '%f',	\
		`v_rotx1` = '%f', `v_rotx2` = '%f', `v_rotx3` = '%f', `v_rotx4` = '%f', `v_rotx5` = '%f', `v_rotx6` = '%f', `v_rotx7` = '%f', `v_rotx8` = '%f', `v_rotx9` = '%f',\
		`v_roty1` = '%f', `v_roty2` = '%f', `v_roty3` = '%f', `v_roty4` = '%f', `v_roty5` = '%f', `v_roty6` = '%f', `v_roty7` = '%f', `v_roty8` = '%f', `v_roty9` = '%f',\
		`v_rotz1` = '%f', `v_rotz2` = '%f', `v_rotz3` = '%f', `v_rotz4` = '%f', `v_rotz5` = '%f', `v_rotz6` = '%f', `v_rotz7` = '%f', `v_rotz8` = '%f', `v_rotz9` = '%f',\
		`v_frenomano` = '%d' WHERE `v_id`='%d' LIMIT 1 ",
		vehInfo[id][v_mkid], vehInfo[id][v_model], vehInfo[id][v_pos][0], vehInfo[id][v_pos][1] ,vehInfo[id][v_pos][2], vehInfo[id][v_pos][3],
		vehInfo[id][v_vw], vehInfo[id][v_color1], vehInfo[id][v_color2], vehInfo[id][v_respawn], vehInfo[id][v_vida],
		vehInfo[id][v_puertas], vehInfo[id][v_motor], vehInfo[id][v_luces], vehInfo[id][v_babierto], vehInfo[id][v_capo], vehInfo[id][v_gasolina], vehInfo[id][v_aceite],
		vehInfo[id][v_baul][0], vehInfo[id][v_baul][1], vehInfo[id][v_baul][2], vehInfo[id][v_baul][3], vehInfo[id][v_baul][4], vehInfo[id][v_baul][5], vehInfo[id][v_baul][6], vehInfo[id][v_baul][7], vehInfo[id][v_baul][8], 
		vehInfo[id][v_baulcant][0], vehInfo[id][v_baulcant][1], vehInfo[id][v_baulcant][2], vehInfo[id][v_baulcant][3], vehInfo[id][v_baulcant][4], vehInfo[id][v_baulcant][5], vehInfo[id][v_baulcant][6], vehInfo[id][v_baulcant][7], vehInfo[id][v_baulcant][8],
		vehInfo[id][v_attachx][0], vehInfo[id][v_attachx][1], vehInfo[id][v_attachx][2], vehInfo[id][v_attachx][3], vehInfo[id][v_attachx][4], vehInfo[id][v_attachx][5], vehInfo[id][v_attachx][6], vehInfo[id][v_attachx][7], vehInfo[id][v_attachx][8],
		vehInfo[id][v_attachy][0], vehInfo[id][v_attachy][1], vehInfo[id][v_attachy][2], vehInfo[id][v_attachy][3], vehInfo[id][v_attachy][4], vehInfo[id][v_attachy][5], vehInfo[id][v_attachy][6], vehInfo[id][v_attachy][7], vehInfo[id][v_attachy][8],
		vehInfo[id][v_attachz][0], vehInfo[id][v_attachz][1], vehInfo[id][v_attachz][2], vehInfo[id][v_attachz][3], vehInfo[id][v_attachz][4], vehInfo[id][v_attachz][5], vehInfo[id][v_attachz][6], vehInfo[id][v_attachz][7], vehInfo[id][v_attachz][8],
		vehInfo[id][v_rotx][0], vehInfo[id][v_rotx][1], vehInfo[id][v_rotx][2], vehInfo[id][v_rotx][3], vehInfo[id][v_rotx][4], vehInfo[id][v_rotx][5], vehInfo[id][v_rotx][6], vehInfo[id][v_rotx][7], vehInfo[id][v_rotx][8],
		vehInfo[id][v_roty][0], vehInfo[id][v_roty][1], vehInfo[id][v_roty][2], vehInfo[id][v_roty][3], vehInfo[id][v_roty][4], vehInfo[id][v_roty][5], vehInfo[id][v_roty][6], vehInfo[id][v_roty][7], vehInfo[id][v_roty][8],
		vehInfo[id][v_rotz][0], vehInfo[id][v_rotz][1], vehInfo[id][v_rotz][2], vehInfo[id][v_rotz][3], vehInfo[id][v_rotz][4], vehInfo[id][v_rotz][5], vehInfo[id][v_rotz][6], vehInfo[id][v_rotz][7], vehInfo[id][v_rotz][8],
		vehInfo[id][v_frenomano], vehInfo[id][v_id]);
	}
}





mostrarVelocimetro(playerid, vid)
{
	for(new h;h<3;h++) TextDrawShowForPlayer(playerid, velocimetroT[h]);
	for(new p;p<10;p++) PlayerTextDrawShow(playerid, velocimetroTT[playerid][p]);
	enVelocimetro[playerid] = true;
	timerVelocimetro[playerid] = SetTimerEx("updateVelocimetro", 1000, true, "dd", playerid, vid);
	vehInfo[vid][v_velocimetro] = SetTimerEx("updateVelocity", 500, true, "dd", playerid, vid);
}
mostrarAttachaments(playerid, vid)
{

	for(new h; h<9;h++) PlayerTextDrawSetPreviewModel(playerid, attachamenTT[playerid][h], objInfo[vehInfo[vid][v_attachmodel][h]][o_model]);

	for(new p;p<2;p++) TextDrawShowForPlayer(playerid, attachamenT[p]);
	for(new i;i<13;i++) PlayerTextDrawShow(playerid, attachamenTT[playerid][i]);

	SelectTextDraw(playerid, 0x87868286);
}
mostrarBaul(playerid, vid)
{
	eligiendoBaul[playerid] = 0;
	attachandoA[playerid] = vid;
	new string[900];
	new string1[100];
	for(new i; i<0;i++)
	{
		if(vehInfo[vid][v_baul][i] != 0)
		{
			format(string1, 100, "Slot %i: %s, Cantidad: %i \n", i+1, objInfo[vehInfo[vid][v_baul][i]][o_nombre], vehInfo[vid][v_baulcant][i]);
			strcat(string, string1);
		}
		else
		{
			format(string1, 100, "Slot %i: Nada, Cantidad: Nada \n", i+1);
			strcat(string, string1);
		}
	}
	ShowPlayerDialog(playerid, d_baul, DIALOG_STYLE_LIST, ""Chat_Gris"Baul", string, ""Chat_Gris"Guardar", ""Chat_Gris"Sacar");
}

forward updateVelocimetro(playerid, vid);
public updateVelocimetro(playerid, vid)
{
	if(enVelocimetro[playerid] == true)
	{
			new string[20];
			format(string, 20, "%i",GetVehicleSpeed(vid));
			PlayerTextDrawSetString(playerid, velocimetroTT[playerid][0], string);


			new total = floatround(vehInfo[vid][v_vida], floatround_round);
			updateBarra(playerid, 1, -1523963137, 523.000, 0.2857212, 0.085, 0, total);
			updateBarra(playerid, 2, -2139094785, 601.000000, -0.3, 0.054, 1, vehInfo[vid][v_gasolina]);
			updateBarra(playerid, 3, -1378294017, 626.000000, -0.3, 0.054, 1, vehInfo[vid][v_aceite]);

			new Float:x, Float:y;
			switch (marcha[playerid])
			{
				case -1:
				{
					x = 564.0;
					y = 352.0;
				}
				case 0: 
				{
					x = 557.0;
					y = 350.0;
				}
				case 1:
				{
					x = 550.0000;
					y = 343.0000;
				}
				case 2:
				{
					x = 550.0000;
					y = 352.0000;
				}
				case 3:
				{
					x = 557.0000;
					y = 344.0000;
				}
				case 4:
				{
					x = 557.0000;
					y = 351.0000;
				}
				case 5:
				{
					x=564.0000;
					y=343.0000;
				}
			}
			PlayerTextDrawDestroy(playerid, velocimetroTT[playerid][4]);
	// R: 564, 352

			velocimetroTT[playerid][4] = CreatePlayerTextDraw(playerid, x, y, "hud:radar_light");
			PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][4], 0.000000, 0.000000);
			PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][4], 10.000000, 12.000000);
			PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][4], 1);
			PlayerTextDrawColor(playerid, velocimetroTT[playerid][4], -1523963137);
			PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][4], 0);
			PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][4], 0);
			PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][4], 255);
			PlayerTextDrawFont(playerid, velocimetroTT[playerid][4], 4);
			PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][4], 0);
			PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][4], 0);

			PlayerTextDrawShow(playerid, velocimetroTT[playerid][4]);

	}
	else 
	{
		KillTimer(timerVelocimetro[playerid]);
	}
}

updateBarra(playerid , bid,color,Float:x, Float:y, Float:porcent, direction,control)
{
	PlayerTextDrawDestroy(playerid, velocimetroTT[playerid][bid]);
	for(new i;i<control;i++)
	{ 
		if(direction == 0)
		{
			x = x+porcent;
		}
		else
		{
			y = y-porcent;
		}
	}
	PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][bid], 0.000000, y);
	PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][bid], x, 0.000000);
	if(bid == 1)
	{
		velocimetroTT[playerid][bid] = CreatePlayerTextDraw(playerid, 524.666625, 388.826568, "box");
		PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][bid], 0.000000, y);
		PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][bid], x, 0.000000);
		PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawColor(playerid, velocimetroTT[playerid][bid], -1);	
		PlayerTextDrawUseBox(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawBoxColor(playerid, velocimetroTT[playerid][bid], color);
		PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][bid], 0);
		PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][bid], 0);
		PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][bid], -1523963137);		
		PlayerTextDrawFont(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][bid], 0);
	}
	else if(bid == 2)
	{
		velocimetroTT[playerid][bid] = CreatePlayerTextDraw(playerid, 598.952575, 382.853240, "box");
		PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][bid], 0.000000, y);
		PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][bid], x, 0.000000);
		PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawColor(playerid, velocimetroTT[playerid][bid], -1);	
		PlayerTextDrawUseBox(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawBoxColor(playerid, velocimetroTT[playerid][bid], color);
		PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][bid], 0);
		PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][bid], 0);
		PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][bid], -1523963137);		
		PlayerTextDrawFont(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][bid], 0);

	}
	else if(bid == 3)
	{
		velocimetroTT[playerid][bid] = CreatePlayerTextDraw(playerid, 625.238952, 382.853240, "box");
		PlayerTextDrawLetterSize(playerid, velocimetroTT[playerid][bid], 0.000000, y);
		PlayerTextDrawTextSize(playerid, velocimetroTT[playerid][bid], x, 0.000000);
		PlayerTextDrawAlignment(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawColor(playerid, velocimetroTT[playerid][bid], -1);	
		PlayerTextDrawUseBox(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawBoxColor(playerid, velocimetroTT[playerid][bid], color);
		PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][bid], 0);
		PlayerTextDrawSetOutline(playerid, velocimetroTT[playerid][bid], 0);
		PlayerTextDrawBackgroundColor(playerid, velocimetroTT[playerid][bid], -1523963137);		
		PlayerTextDrawFont(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawSetProportional(playerid, velocimetroTT[playerid][bid], 1);
		PlayerTextDrawSetShadow(playerid, velocimetroTT[playerid][bid], 0);
	}
	PlayerTextDrawShow(playerid, velocimetroTT[playerid][bid]);
}


stock GetVehicleSpeed(vehid) // XYLOSSS
{
	new Float:x, Float:y, Float:z, total;
	GetVehicleVelocity(vehid, x, y, z);
	total = floatround( floatsqroot( x*x + y*y + z*z ) * 180 );
	return total;
}

forward updateVelocity(playerid, vehicleid);
public updateVelocity(playerid, vehicleid)
{
	if(enVelocimetro[playerid] == true)
	{	
		new speed = GetVehicleSpeed(vehicleid);
		new engine, lights, alarm, doors, bonnet, boot, objective;
		if(marcha[playerid] > 0)
		{
			if(speed < 3)
			{
				if(embrage[playerid] == 0)
				{
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					vehInfo[vehicleid][v_motor] = 0;
				}
			}
			else
			{
				if(embrage[playerid] == 1)
				{
					reducirVelocidad(playerid, 0);
				}
			}
			if(speed > 0 && speed < 10)
			{
				if(reversa[playerid] == 1)
				{
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					vehInfo[vehicleid][v_motor] = 0;
				}
			}
		}
		else if(marcha[playerid] <= 1 && (speed < 10))
		{
			if(embrage[playerid] == 1)
			{
				reducirVelocidad(playerid, 1);
			}
		}
		switch (marcha[playerid])
		{
			case -1:
			{
				if(reversa[playerid] == 0)
				{
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					vehInfo[vehicleid][v_motor] = 0;
				}
				else
				{
					if(speed > 15)
					{
						reducirVelocidad(playerid, 2);
					}
				}
			}
			case 0:
			{
				if(speed > 0)
				{
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					vehInfo[vehicleid][v_motor] = 0;
				}
			}
			case 1:
			{
				if(speed > MARCHA_1_MAX)
				{
					reducirVelocidad(playerid, 0);
				}
			}
			case 2:
			{
				if(speed > MARCHA_2_MAX)
				{
					reducirVelocidad(playerid, 2);
				}
			}
			case 3:
			{
				if(speed > MARCHA_3_MAX)
				{
					reducirVelocidad(playerid, 2);
				}
			}
			case 4:
			{
				if(speed > MARCHA_4_MAX)
				{
					reducirVelocidad(playerid, 1);
				}
			}
			case 5:
			{
				if(speed < MARCHA_5_MIN)
				{
					//GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					//SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
					//vehInfo[vehicleid][v_motor] = 0;
				}
			}
		}
	}
	else 
	{ 
		KillTimer(vehInfo[vehicleid][v_velocimetro]); 
		enVelocimetro[playerid] = false;
	}
}

forward volverEmbrage(playerid);
public volverEmbrage(playerid)
{
	embrage[playerid] = 0;
}


reducirVelocidad(playerid, opt)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	new Float:x,Float:y, Float:z, Float:vida;
	GetVehicleVelocity(vehicleid, x, y, z);
	GetVehicleHealth(vehicleid, vida);
	vida = vehInfo[vehicleid][v_vida] - 1;
	if(opt == 0)
	{
		SetVehicleHealth(vehicleid, vida);
		SetVehicleVelocity(vehicleid, x / reduccion_baja, y / reduccion_baja, z / reduccion_baja);
	}
	else if(opt == 1)
	{
		SetVehicleHealth(vehicleid, vida);
		SetVehicleVelocity(vehicleid, x / reduccion_baja, y / reduccion_fuerte, z / reduccion_fuerte);
	}
	else if(opt == 2)
	{
		SetVehicleVelocity(vehicleid, x / reduccion_fuerte, y / reduccion_fuerte, z / reduccion_fuerte);
	}

}
forward updateGasolina(id);
public updateGasolina(id)
{
	if(vehInfo[id][v_spawn] == true)
	{
		if(vehInfo[id][v_motor] == 1)
		{
			vehInfo[id][v_gasolina] -= 2;
		}
	}
	else
	{
		KillTimer(vehInfo[id][v_timergasolina]);
	}
}
forward updateAceite(id);
public updateAceite(id)
{
	if(vehInfo[id][v_spawn] == true)
	{
		if(vehInfo[id][v_motor] == 1)
		{
			vehInfo[id][v_aceite] -= 1;
		}
	}
	else
	{
		KillTimer(vehInfo[id][v_timeraceite]);
	} 
}

cmd:vmenu(playerid, params[])
{
	if(enVelocimetro[playerid] == true)
	{
		SelectTextDraw(playerid, 0x87868286);
	}
	return 1;
}
cmd:vtoys(playerid, params[])
{
	if(enVelocimetro[playerid] == true)
	{
		if(inventarioInfo[playerid][i_slotcant][8] == GetPlayerVehicleID(playerid))
		{
			mostrarAttachaments(playerid, inventarioInfo[playerid][i_slotcant][8]);
			SelectTextDraw(playerid, 0x87868286);

		}else enviarNotificacionG(playerid, "No tienes las llaves de este vehiculo en mano");
	} else enviarNotificacionG(playerid, "Debes estar en un vehiculo");
}
cmd:vmaletero(playerid, params[])
{
	for(new i;i<MAX_VEHICLES;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5, vehInfo[i][v_pos][0], vehInfo[i][v_pos][1], vehInfo[i][v_pos][2]))
		{
			if(vehInfo[i][v_baul] == 0)
			{
				mostrarBaul(playerid, i);
				attachandoA[playerid] = i;
				break;
			}else { enviarNotificacionG(playerid, "El maletero no esta abierto"); break;}
		}
	}
	return 1;
}
forward registrarVehiculo(playerid);
public registrarVehiculo(playerid)
{
	new idv =cache_insert_id();
	cargarVehiculos(idv);
	agregarIttem(playerid, 20, idv);
}