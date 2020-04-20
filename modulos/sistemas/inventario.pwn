#include <YSI_Coding\y_hooks>

DEFINE_HOOK_REPLACEMENT(OnPlayer, OP_);


#define MAX_TIPO 15
#define MAX_OBJETOS_TIRADOS 300

new Text:inventarioTD;
new PlayerText:inventarioTDD[MAX_PLAYERS][13];

new eligiendo[MAX_PLAYERS];
new bool:usandoOBJ[MAX_PLAYERS];
// objetos tirados
new obJtirados[MAX_OBJETOS_TIRADOS];
new Text3D:labelObjetos[MAX_OBJETOS_TIRADOS];
// Informacion
enum objetos_info
{
	ot_id,
	o_model,
	Float:o_root[4],
	o_nombre[40],
	o_info[200]
};
// Agregar Objetos
new objInfo[][objetos_info] =
{
//  id   modelo    rotacion          nombre         informacion
	{0, 19382, {0.0, 0.0, 0.0, 1.5}, "nada", "no_tienes_nada"},

	{1, 346, {0.0, -10.0, 0.0, 1.5}, "9mm-comun", "Pistola_9mm_comun"},
	{2, 347, {0.0, -10.0, 0.0, 1.0}, "9mm-silenciada", "Pistola_9mm_Silenciada"},
	{3, 348, {0.0, -10.0, 0.0, 1.5}, "Desert-Eagle", "Pistola_Desert-eagle"},
	{4, 349, {0.0, -10.0, 0.0, 2.5}, "Escopeta", "Escopeta-Comun"},
	{5, 352, {0.0, -10.0, 0.0, 1.0}, "Micro-Uzi", "SMG___Micro_Uzi"},
	{6, 353, {0.0, -10.0, 0.0, 1.5}, "MP5", "Subfusil_tipo_mp5"},
	{7, 356, {0.0, -10.0, 0.0, 2.5}, "M4", "Rifle_de_alto_calibre_m4"},
	{8, 355, {0.0, -10.0, 0.0, 2.5}, "AK-47", "Rifle_de_alto_calibre_ak-47"},
	{9, 357, {0.0, -10.0, 0.0, 1.0}, "Rifle", "Rifle_de_caza"},
	{10, 358, {0.0, -10.0, 0.0, 3.0}, "Rifle_Francotirador", "Rifle_francotirador_con_mira"},


	{11, 1210, {0.0, 0.0, 0.0, 0.0}, "Maletin", "Maletin_con_dinero"},
	{12, 19054, {0.0, 0.0, 0.0, 1.0}, "Regalo", "Regalo_de_miamiside"},

	{13, 19942, {0.0, 0.0, 0.0, 1.0}, "Radio-Comunicador", "Radio-Comunicador-con-frecuencias"},

	{14, 19811, {0.0, 0.0, 0.0, 1.0}, "Hamburgesa", "Hamburgesa_(+20_comida)"},
	{15, 19570, {0.0, 0.0, 0.0, 1.0}, "Agua", "Botella_de_agua(+20_sed)"},
	{16, 19577, {0.0, 0.0, 0.0, 1.0}, "Manzana", "Manzana_(+10_sed_y_+10-comida"},
	{17, 1271, {0.0, 0.0, 0.0, 2.0}, "Caja", "Caja-de-ropa"},
	{18, 19627, {-50.0, -10.0, 0.0, 0.0}, "Llave", "Llave-francesa"},
	{19, 18874, {0.0, 0.0, 30.0, 0.3}, "Celular", "Celular-Miami-Phone"},
	{20, 11746, {0.0, 0.0, 0.0, 0.5}, "Llaves", "Llaves-de-vehiculo"},
	{21, 11746, {0.0, 0.0, 0.0, 0.5}, "Llaves", "Llaves-de-negocio"},
	{22, 1139, {0.0, 0.0, 0.0, 0.5}, "Aleron", "Aleron de Nissan Skyline"}
	//KEY_HANDBRAKE
};
// OBjetos tirados
enum _obj_tirados
{
	ot_model,
	ot_cantidad,
	Float:ot_x,
	Float:ot_y,
	Float:ot_z,
	ot_vw,
	bool:ot_used
};
new objetosTirados[MAX_OBJETOS_TIRADOS][_obj_tirados];
enum _inv_info
{
	i_id,
	i_mkid,
	i_slot[9],
	i_slotocup[9],
	i_slotcant[9]
};
new inventarioInfo[MAX_PLAYERS][_inv_info];
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
hook OnGameModeExit()
{
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
hook OnPlayerDisconnect(playerid, reason)
{
	for(new i;i<13;i++) PlayerTextDrawDestroy(playerid, inventarioTDD[playerid][i]);

}



// MALETIN
cmd:mguardar(playerid, params[])
{	
	if(inventarioInfo[playerid][i_slot][8] == 11)
	{	new cant;
		if(sscanf(params,"i", cant)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/mguardar [cant]");
		{
			if(cant >= personajeInfo[playerid][p_dinero]) return enviarNotificacion(playerid, "No tienes ese dinero");
			{
				personajeInfo[playerid][p_dinero] -= cant;
				inventarioInfo[playerid][i_slotcant][8] += cant;
				SendClientMessage(playerid, -1, ""Chat_Naranja"[MiamiSide]"Chat_Gris" guardaste dinero en tu maletin");

			}
		}
	} else enviarNotificacion(playerid, "debes tener un maletin en mano");
	return 1;
}


cmd:maletin(playerid, params[])
{
	if(inventarioInfo[playerid][i_slot][8] == 11)
	{
		new string[128];
		format(string, 128, "tienes $%i dolares guardados en tu maletin", inventarioInfo[playerid][i_slotcant][8]);
		enviarNotificacionG(playerid, string);
	} else enviarNotificacion(playerid, "debes tener un maletin en mano");
	return 1;
}

cmd:msacar(playerid, params[])
{	
	if(inventarioInfo[playerid][i_slot][8] == 11)
	{	new cant;
		if(sscanf(params,"i", cant)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/msacar [cant]");
		{
        	new total = cant + personajeInfo[playerid][p_dinero];
			if(total > MAX_DINERO_MANO) return enviarNotificacionG(playerid, "No puedes tener tanto dinero en mano(Usa un maletin)");
			if(cant >= inventarioInfo[playerid][i_slotcant][8]) return enviarNotificacion(playerid, "El maletin no tiene ese dinero");
			{
				personajeInfo[playerid][p_dinero] += cant;
				inventarioInfo[playerid][i_slotcant][8] -= cant;
				SendClientMessage(playerid, -1, ""Chat_Naranja"[MiamiSide]"Chat_Gris" sacaste dinero de tu maletin");

			}
		}
	} else enviarNotificacion(playerid, "debes tener un maletin en mano");
	return 1;
}
// RADIO
cmd:fr(playerid, params[])
{
	if(inventarioInfo[playerid][i_slot][8] == 13)
	{	new frecuencia;
		if(sscanf(params,"i", frecuencia)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/fr [Canal-ID]");
		{
			inventarioInfo[playerid][i_slotcant][8] = frecuencia;
			new string[128];
			format(string, 128, "Actualizaste la frecuencia a el canal ID:%i", frecuencia);
			enviarNotificacionG(playerid, string);
		}
	}else enviarNotificacion(playerid, "Debes tener una radio en la mano");
	return 1;
}

cmd:r(playerid, params[])
{
	new ra[250];
	new string[250];
	new string1[250];
	if(sscanf(params,"s[250]", ra)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/r [Texto]");
	{
		format(string, sizeof(string), ""Chat_Blanco"%s dice por radio:"Chat_Gris" %s", conseguirNombre(playerid), ra);
		enviarmensajeRol(playerid, 7, -1, string);
		for(new i;i<MAX_PLAYERS;i++)
		{
			if(personajeInfo[i][p_inventario] == 1)
			{
				for(new h;h<9;h++)
				{
					if(inventarioInfo[i][i_slotcant][h] == inventarioInfo[playerid][i_slotcant][h] && inventarioInfo[i][i_slot][h] == 13)
					{
						format(string1, sizeof(string1), ""Chat_Radio"[Radio (%s)]"Chat_Gris": %s", conseguirNombre(playerid), ra);
						SendClientMessage(i, -1, string1);
					}
				}
			}
		}
	}
	return 1;
}
// CLICKEAR
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == inventarioTDD[playerid][0])
	{
		new string[300];
		eligiendo[playerid] = 0;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][0]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][0]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][1])
	{
		new string[300];
		eligiendo[playerid] = 1;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][1]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][1]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][2])
	{
		new string[300];
		eligiendo[playerid] = 2;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][2]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][2]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][3])
	{
		new string[300];
		eligiendo[playerid] = 3;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][3]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][3]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][4])
	{
		new string[300];
		eligiendo[playerid] = 4;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][4]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][4]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][5])
	{
		new string[300];
		eligiendo[playerid] = 5;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][5]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][5]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][6])
	{
		new string[300];
		eligiendo[playerid] = 6;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][6]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][6]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][7])
	{
		new string[300];
		eligiendo[playerid] = 7;
		format(string, 300, "Nombre:__%s  Informacion:_%s", objInfo[inventarioInfo[playerid][i_slot][7]][o_nombre], objInfo[inventarioInfo[playerid][i_slot][7]][o_info]);
		PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	}
	if(playertextid == inventarioTDD[playerid][8])
	{
		if(usandoOBJ[playerid] == false)
		{
			usarItem(playerid, eligiendo[playerid]);
		} else enviarNotificacion(playerid, "Ya estas usando un obj");
	}
	if(playertextid == inventarioTDD[playerid][10])
	{
		for(new j;j<13;j++) PlayerTextDrawHide(playerid, inventarioTDD[playerid][j]);
		TextDrawHideForPlayer(playerid, inventarioTD);
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == inventarioTDD[playerid][12])
	{
		if(usandoOBJ[playerid] == true)
		{
			agregarIttem(playerid, inventarioInfo[playerid][i_slot][8], inventarioInfo[playerid][i_slotcant][8]);
			removerObjINV(playerid);
			inventarioInfo[playerid][i_slot][8] = 0;
			inventarioInfo[playerid][i_slotocup][8] = 0;
			inventarioInfo[playerid][i_slotcant][8] = 0;
			actualizarInv(playerid);
			updateHud(playerid);
			usandoOBJ[playerid] = false;

		} else enviarNotificacion(playerid, "No estas usando un obj");
	}
	if(playertextid == inventarioTDD[playerid][9])
	{
		new string[80];
		if(inventarioInfo[playerid][i_slotocup][eligiendo[playerid]] == 1)
		{
			for(new i;i<MAX_OBJETOS_TIRADOS; i++)
			{
				if(objetosTirados[i][ot_used] == false)
				{
					new Float:x, Float:y, Float:z;
					GetPlayerPos(playerid, x, y, z);
					format(string, 80, ""Chat_Gris"Pulsa Y"Chat_Blanco" (%s)", objInfo[inventarioInfo[playerid][i_slot][eligiendo[playerid]]][o_nombre]);
					objetosTirados[i][ot_used] = true;
					objetosTirados[i][ot_x] = x;
					objetosTirados[i][ot_y] = y;
					objetosTirados[i][ot_z] = z;
					objetosTirados[i][ot_model] = inventarioInfo[playerid][i_slot][eligiendo[playerid]];
					objetosTirados[i][ot_cantidad] = inventarioInfo[playerid][i_slotcant][eligiendo[playerid]];
					objetosTirados[i][ot_vw] = GetPlayerVirtualWorld(playerid);
					if(inventarioInfo[playerid][i_slot][eligiendo[playerid]] == 17)	{ obJtirados[i] =CreateDynamicObject(objInfo[inventarioInfo[playerid][i_slot][eligiendo[playerid]]][o_model], personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ] -0.7, 90.0, 90.0, 0.0, objetosTirados[i][ot_vw], -1, -1, 15);}
					else { obJtirados[i] =	CreateDynamicObject(objInfo[inventarioInfo[playerid][i_slot][eligiendo[playerid]]][o_model], personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ]-0.8, 90.0, 90.0, 0.0, objetosTirados[i][ot_vw], -1, -1, 15);}
					labelObjetos[i] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ]-0.8, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);				
					inventarioInfo[playerid][i_slot][eligiendo[playerid]] = 0;
					inventarioInfo[playerid][i_slotocup][eligiendo[playerid]] = 0;
					actualizarInv(playerid);
					updateHud(playerid);
					break;
				}
			}
		} else enviarNotificacion(playerid, "no tienes nada");
	}
	return 1;
}

// Funciones lindas
stock mostrarInventario(playerid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		for(new i; i<8;i++)
		{
			PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][i], objInfo[inventarioInfo[playerid][i_slot][i]][o_model]);
			PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][i], objInfo[inventarioInfo[playerid][i_slot][i]][o_root][0], objInfo[inventarioInfo[playerid][i_slot][i]][o_root][1], objInfo[inventarioInfo[playerid][i_slot][i]][o_root][2], objInfo[inventarioInfo[playerid][i_slot][i]][o_root][3]);
		}
		PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][11], objInfo[inventarioInfo[playerid][i_slot][8]][o_model]);
		PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][11], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][0], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][1], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][2], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][3]);
		



		for(new j;j<13;j++) PlayerTextDrawShow(playerid, inventarioTDD[playerid][j]);
		TextDrawShowForPlayer(playerid, inventarioTD);
		SelectTextDraw(playerid, 0x87868286);
	}
}

forward actualizarInv(playerid);
public actualizarInv(playerid)
{
        for(new i;i<13;i++) PlayerTextDrawHide(playerid, inventarioTDD[playerid][i]);
        TextDrawHideForPlayer(playerid, inventarioTD);



        mostrarInventario(playerid);
}


forward updateHud(playerid);
public updateHud(playerid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		new string[40];
		format(string, 40, "$%i", personajeInfo[playerid][p_dinero]);
		PlayerTextDrawSetString(playerid, hudd[playerid][2], string);

		PlayerTextDrawSetString(playerid,hudd[playerid][1], personajeInfo[playerid][p_nombre]);

		PlayerTextDrawSetPreviewModel(playerid, hudd[playerid][0], objInfo[inventarioInfo[playerid][i_slot][8]][o_model]);
		//PlayerTextDrawSetPreviewRot(playerid, hudd[playerid][0], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][0], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][1], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][2], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][3]);
		PlayerTextDrawShow(playerid, hudd[playerid][0]);



		if(masterInfo[playerid][_exp] == 0){
			PlayerTextDrawSetString(playerid, hudd[playerid][3], "VIP_0");
		}
		else {
			PlayerTextDrawSetString(playerid, hudd[playerid][3], "VIP_1");
		}
		

		
	}
}



stock agregarIttem(playerid, itemid, cantidad)
{
	if(inventarioInfo[playerid][i_slotocup][0] == 0)
	{
		inventarioInfo[playerid][i_slot][0] = itemid;
		inventarioInfo[playerid][i_slotcant][0] = cantidad;
		inventarioInfo[playerid][i_slotocup][0] = 1; 

	}
	else if(inventarioInfo[playerid][i_slotocup][1] == 0)
	{
		inventarioInfo[playerid][i_slot][1] = itemid;
		inventarioInfo[playerid][i_slotcant][1] = cantidad;
		inventarioInfo[playerid][i_slotocup][1] = 1; 

	}
	else if(inventarioInfo[playerid][i_slotocup][2] == 0)
	{
		inventarioInfo[playerid][i_slot][2] = itemid;
		inventarioInfo[playerid][i_slotcant][2] = cantidad;
		inventarioInfo[playerid][i_slotocup][2] = 1; 
		
	}
	else if(inventarioInfo[playerid][i_slotocup][3] == 0)
	{
		inventarioInfo[playerid][i_slot][3] = itemid;
		inventarioInfo[playerid][i_slotcant][3] = cantidad;
		inventarioInfo[playerid][i_slotocup][3] = 1; 
		
	}
	else if(inventarioInfo[playerid][i_slotocup][4] == 0)
	{
		inventarioInfo[playerid][i_slot][4] = itemid;
		inventarioInfo[playerid][i_slotcant][4] = cantidad;
		inventarioInfo[playerid][i_slotocup][4] = 1; 
	}
	else if(inventarioInfo[playerid][i_slotocup][5] == 0)
	{
		inventarioInfo[playerid][i_slot][5] = itemid;
		inventarioInfo[playerid][i_slotcant][5] = cantidad;
		inventarioInfo[playerid][i_slotocup][5] = 1; 
		
	}
	else if(inventarioInfo[playerid][i_slotocup][5] == 1 && personajeInfo[playerid][p_viplvl] == 0)
	{
		new string[128];
		for(new i;i<MAX_OBJETOS_TIRADOS; i++)
		{
			if(objetosTirados[i][ot_used] == false)
			{
				format(string, 80, ""Chat_Gris"Pulsa Y"Chat_Radio" (%s)", objInfo[inventarioInfo[playerid][i_slot][eligiendo[playerid]]][o_nombre]);
				objetosTirados[i][ot_used] = true;
				objetosTirados[i][ot_x] = personajeInfo[playerid][_posX];
				objetosTirados[i][ot_y] = personajeInfo[playerid][_posY];
				objetosTirados[i][ot_z] = personajeInfo[playerid][_posZ];
				objetosTirados[i][ot_model] = itemid;
				objetosTirados[i][ot_cantidad] = cantidad;
				objetosTirados[i][ot_vw] = GetPlayerVirtualWorld(playerid);
				if(inventarioInfo[playerid][i_slot][eligiendo[playerid]] == 17)	{ obJtirados[i] =CreateDynamicObject(objInfo[itemid][o_model], personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ] -0.7, 90.0, 90.0, 0.0, objetosTirados[i][ot_vw], -1, -1, 15);}
				else { obJtirados[i] =	CreateDynamicObject(objInfo[itemid][o_model], personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ]-0.8, 90.0, 90.0, 0.0, objetosTirados[i][ot_vw], -1, -1, 15);}
				labelObjetos[i] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ]-0.8, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);				
				break;
			}
		}
	}
	else if(inventarioInfo[playerid][i_slotocup][6] == 0)
	{
		if(personajeInfo[playerid][p_viplvl] >= 1)
		{
			inventarioInfo[playerid][i_slot][6] = itemid;
			inventarioInfo[playerid][i_slotcant][6] = cantidad;
			inventarioInfo[playerid][i_slotocup][6] = 1; 
		}
	}
	else if(inventarioInfo[playerid][i_slotocup][7] == 0)
	{
		if(personajeInfo[playerid][p_viplvl] >= 1)
		{
			inventarioInfo[playerid][i_slot][7] = itemid;
			inventarioInfo[playerid][i_slotcant][7] = cantidad;
			inventarioInfo[playerid][i_slotocup][7] = 1; 	
		}
	}
}
stock usarItem(playerid, slotid)
{
	if(inventarioInfo[playerid][i_slotocup][slotid] == 1)
	{
		inventarioInfo[playerid][i_slot][8] = inventarioInfo[playerid][i_slot][slotid];
		inventarioInfo[playerid][i_slotocup][8] = 1;
		inventarioInfo[playerid][i_slotcant][8] = inventarioInfo[playerid][i_slotcant][slotid];
		usandoOBJ[playerid] = true;
		if(inventarioInfo[playerid][i_slot][8] == 1)
		{
		    GivePlayerWeapon(playerid, 22, inventarioInfo[playerid][i_slotcant][8]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 2)
		{
		   	GivePlayerWeapon(playerid, 23, inventarioInfo[playerid][i_slotcant][slotid]);
        }
        else if(inventarioInfo[playerid][i_slot][slotid] == 3)
        {
	    	GivePlayerWeapon(playerid, 24, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 4)
		{
		    GivePlayerWeapon(playerid, 25, inventarioInfo[playerid][i_slotcant][8]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 5)
		{
		    GivePlayerWeapon(playerid, 28, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 6)
		{
		    GivePlayerWeapon(playerid, 29, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 7)
		{
		    GivePlayerWeapon(playerid, 31, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 8)
		{
		    GivePlayerWeapon(playerid, 30, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 9)
		{
		    GivePlayerWeapon(playerid, 33, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 10)
		{
		    GivePlayerWeapon(playerid, 34, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 11)
		{
			enviarNotificacionG(playerid, "usa /maletin, /mguardar, /msacar");
			SetPlayerAttachedObject(playerid, 0, 1210, 6, 0.303294, 0.081651, 0.010630, 0.000000, 270.000000, 0.000000);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 12)
		{
			inventarioInfo[playerid][i_slot][8] = 0;
			inventarioInfo[playerid][i_slotocup][8] = 0;
			inventarioInfo[playerid][i_slotcant][8] = 0;
			personajeInfo[playerid][p_dinero] += 5000;
			enviarMoneyNotif(playerid, 0, 5000);
			usandoOBJ[playerid] = false;
			enviarNotificacionG(playerid, "Gracias por jugar!, te dimos $5000 dolares.");
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 13)
		{
			enviarNotificacionG(playerid, "usa /fr y /r");
			SetPlayerAttachedObject(playerid, 0, 19942, 6, 0.063000, 0.012999, 0.038000, 0.000000, 0.000000, 176.199996, 1.000000, 1.000000, 1.000000);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 14)
		{
			enviarNotificacionG(playerid, "Toca click derecho para consumir");
			SetPlayerAttachedObject(playerid, 0, 19811, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 15)
		{
			enviarNotificacionG(playerid, "Toca click derecho para consumir");
			SetPlayerAttachedObject(playerid, 0, 19570, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 16)
		{
			enviarNotificacionG(playerid, "Toca click derecho para consumir");
			SetPlayerAttachedObject(playerid, 0, 19577, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 17)
		{
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SetPlayerAttachedObject(playerid, 0, 1271, 6, 0.003999, 0.462999, -0.044999, 155.099975, 3.499999, -13.500001, 1.000000, 1.000000, 1.000000);

		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 18)
		{
			SetPlayerAttachedObject(playerid, 0, 19627, 6, 0.062999, 0.024998, 0.057001, 108.700027, -3.899999, -87.500000, 1.000000, 1.000000, 1.000000);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 19)
		{
			SetPlayerAttachedObject(playerid, 0, 18874, 6, 0.125998, 0.017997, -0.012999, 77.000030, -179.500000, -19.600006, 1.000000, 1.000000, 1.000000);
		}


		PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][11], objInfo[inventarioInfo[playerid][i_slot][slotid]][o_model]);


		inventarioInfo[playerid][i_slot][slotid] = 0; //Seteamos
		inventarioInfo[playerid][i_slotocup][slotid] = 0;
		inventarioInfo[playerid][i_slotcant][slotid] = 0;
		actualizarInv(playerid);
		updateHud(playerid);

	} else enviarNotificacion(playerid, "no tienes nada");
}
stock removerObjINV(playerid)
{
	if(inventarioInfo[playerid][i_slotocup][8] == 1)
	{
		if(inventarioInfo[playerid][i_slot][8] == 1) { ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 2) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 3) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 4) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 5) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0);}
		else if(inventarioInfo[playerid][i_slot][8] == 6) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0);} 
		else if(inventarioInfo[playerid][i_slot][8] == 7) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); } 
		else if(inventarioInfo[playerid][i_slot][8] == 8) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 9) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 10) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 11)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 13)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 14)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 15)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 16)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 17)
		{
			RemovePlayerAttachedObject(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 18)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 19)
		{
			RemovePlayerAttachedObject(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
}

cmd:edit(playerid, params[])
{
	EditAttachedObject(playerid, 0);
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ )
{
	if(response)
	{
		printf("coord: %f, %f, %f, %f, %f, %f, %f, %f, %f", fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);
	}
	return 1;
}
stock verifInventario(playerid)
{
	new i;
	for(i=0; i<8; i++)
	{
		if(inventarioInfo[playerid][i_slotocup][i] == 0)
		{break;}
		else i= 10;
	}
	return i;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_YES)
	{
		if(enVelocimetro[playerid] == false)
		for(new i=0; i<MAX_OBJETOS_TIRADOS; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2, objetosTirados[i][ot_x], objetosTirados[i][ot_y], objetosTirados[i][ot_z]))
			{
				if(personajeInfo[playerid][p_world] == objetosTirados[i][ot_vw])
				{
					agregarIttem(playerid, objetosTirados[i][ot_model], objetosTirados[i][ot_cantidad]); 
					DestroyDynamicObject(obJtirados[i]);
					DestroyDynamic3DTextLabel(labelObjetos[i]);
					enviarNotificacionG(playerid, "Agarraste un objeto del piso");
					objetosTirados[i][ot_x] = 0;
					objetosTirados[i][ot_y] = 0;
					objetosTirados[i][ot_z] = 0;
					objetosTirados[i][ot_used] = false;
					objetosTirados[i][ot_model] = 0;
					objetosTirados[i][ot_cantidad] = 0;
					objetosTirados[i][ot_vw] = 0;
					ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop", 4.0,0,0,0,0,0);
					break;
				}
			}
		}
	}
	if(newkeys == KEY_NO)
	{
		if(enVelocimetro[playerid] == false)
		if(yaenllamada[playerid] == false)
		{
			if(personajeInfo[playerid][p_inventario] == 1)
			{
				mostrarInventario(playerid);
			}
			else
			{
				new dem[100];
				enviarNotificacion(playerid, "Te registramos un inventario");
				mysql_format(xylosMYSQL, dem, sizeof(dem), "INSERT INTO Inventario(i_mkid, i_slot1, i_slotocup1, i_slotcant1) VALUES ('%d', 12, 1, 1)", personajeInfo[playerid][p_listid]);
				mysql_query(xylosMYSQL, dem);
				new inv[300];
		        mysql_format(xylosMYSQL, inv, sizeof(inv), "SELECT * FROM Inventario WHERE i_mkid = '%i'", personajeInfo[playerid][p_listid]);
		        mysql_pquery(xylosMYSQL, inv, "loguearInventario", "d", playerid);
		        personajeInfo[playerid][p_inventario] = 1;
			}
		} else enviarNotificacionG(playerid, "No puedes usar el inventario ahora");
	}
	else if(newkeys == KEY_HANDBRAKE)
	{
		if(inventarioInfo[playerid][i_slot][8] == 14)
		{
			personajeInfo[playerid][p_hambre] += 20;
			inventarioInfo[playerid][i_slotcant][8] -= 1;
			enviarNotificacionG(playerid, "Consumiste una hamburguesa");
			ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,1,1,0,0);
			if(inventarioInfo[playerid][i_slotcant][8] == 0)
			{
				removerObjINV(playerid);
				inventarioInfo[playerid][i_slot][8] = 0;
				inventarioInfo[playerid][i_slotocup][8] = 0;
				inventarioInfo[playerid][i_slotcant][8] = 0;
				usandoOBJ[playerid] = false;
			}
		}
		else if(inventarioInfo[playerid][i_slot][8] == 15)
		{
			personajeInfo[playerid][p_sed] += 20;
			inventarioInfo[playerid][i_slotcant][8] -= 1;
			enviarNotificacionG(playerid, "Consumiste una botella de agua");
			ApplyAnimation(playerid,"VENDING","VEND_Use",1.4,0 ,1,1,0,2500,1);
			if(inventarioInfo[playerid][i_slotcant][8] == 0)
			{
				removerObjINV(playerid);
				inventarioInfo[playerid][i_slot][8] = 0;
				inventarioInfo[playerid][i_slotocup][8] = 0;
				inventarioInfo[playerid][i_slotcant][8] = 0;
				usandoOBJ[playerid] = false;
			}
		}
		else if(inventarioInfo[playerid][i_slot][8] == 16)
		{
			personajeInfo[playerid][p_sed] += 10;
			personajeInfo[playerid][p_hambre] += 10;
			inventarioInfo[playerid][i_slotcant][8] -= 1;
			enviarNotificacionG(playerid, "Consumiste una manzana");
			ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,1,1,0,0);
			if(inventarioInfo[playerid][i_slotcant][8] == 0)
			{
				removerObjINV(playerid);
				inventarioInfo[playerid][i_slot][8] = 0;
				inventarioInfo[playerid][i_slotocup][8] = 0;
				inventarioInfo[playerid][i_slotcant][8] = 0;
				usandoOBJ[playerid] = false;
			}
		}
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}



forward loguearInventario(playerid);
public loguearInventario(playerid)
{
	cache_get_value_name_int(0, "i_id", inventarioInfo[playerid][i_id]);
	cache_get_value_name_int(0, "i_mkid", inventarioInfo[playerid][i_mkid]);

	cache_get_value_name_int(0, "i_slot1", inventarioInfo[playerid][i_slot][0]);
	cache_get_value_name_int(0, "i_slot2", inventarioInfo[playerid][i_slot][1]);
	cache_get_value_name_int(0, "i_slot3", inventarioInfo[playerid][i_slot][2]);
	cache_get_value_name_int(0, "i_slot4", inventarioInfo[playerid][i_slot][3]);
	cache_get_value_name_int(0, "i_slot5", inventarioInfo[playerid][i_slot][4]);
	cache_get_value_name_int(0, "i_slot6", inventarioInfo[playerid][i_slot][5]);
	cache_get_value_name_int(0, "i_slot7", inventarioInfo[playerid][i_slot][6]);
	cache_get_value_name_int(0, "i_slot8", inventarioInfo[playerid][i_slot][7]);
	cache_get_value_name_int(0, "i_slot9", inventarioInfo[playerid][i_slot][8]);

	cache_get_value_name_int(0, "i_slotocup1", inventarioInfo[playerid][i_slotocup][0]);
	cache_get_value_name_int(0, "i_slotocup2", inventarioInfo[playerid][i_slotocup][1]);
	cache_get_value_name_int(0, "i_slotocup3", inventarioInfo[playerid][i_slotocup][2]);
	cache_get_value_name_int(0, "i_slotocup4", inventarioInfo[playerid][i_slotocup][3]);
	cache_get_value_name_int(0, "i_slotocup5", inventarioInfo[playerid][i_slotocup][4]);
	cache_get_value_name_int(0, "i_slotocup6", inventarioInfo[playerid][i_slotocup][5]);
	cache_get_value_name_int(0, "i_slotocup7", inventarioInfo[playerid][i_slotocup][6]);
	cache_get_value_name_int(0, "i_slotocup8", inventarioInfo[playerid][i_slotocup][7]);
	cache_get_value_name_int(0, "i_slotocup9", inventarioInfo[playerid][i_slotocup][8]);

	cache_get_value_name_int(0, "i_slotcant1", inventarioInfo[playerid][i_slotcant][0]);
	cache_get_value_name_int(0, "i_slotcant2", inventarioInfo[playerid][i_slotcant][1]);
	cache_get_value_name_int(0, "i_slotcant3", inventarioInfo[playerid][i_slotcant][2]);
	cache_get_value_name_int(0, "i_slotcant4", inventarioInfo[playerid][i_slotcant][3]);
	cache_get_value_name_int(0, "i_slotcant5", inventarioInfo[playerid][i_slotcant][4]);
	cache_get_value_name_int(0, "i_slotcant6", inventarioInfo[playerid][i_slotcant][5]);
	cache_get_value_name_int(0, "i_slotcant7", inventarioInfo[playerid][i_slotcant][6]);
	cache_get_value_name_int(0, "i_slotcant8", inventarioInfo[playerid][i_slotcant][7]);
	cache_get_value_name_int(0, "i_slotcant9", inventarioInfo[playerid][i_slotcant][8]);
	if(inventarioInfo[playerid][i_slotocup][8] == 1)
	{
		usandoOBJ[playerid] = true;
	}
	return true;
}

forward guardarInventario(playerid);
public guardarInventario(playerid)
{
		if(personajeInfo[playerid][p_inventario] == 1)
		{
			new xylos = SQL::Open(SQL::UPDATE, "Inventario", "i_id", inventarioInfo[playerid][i_id]);
			SQL::WriteInt(xylos, "i_id", inventarioInfo[playerid][i_id]);
			SQL::WriteInt(xylos, "i_mkid", inventarioInfo[playerid][i_mkid]);

			SQL::WriteInt(xylos, "i_slot1", inventarioInfo[playerid][i_slot][0]);
			SQL::WriteInt(xylos, "i_slot2", inventarioInfo[playerid][i_slot][1]);
			SQL::WriteInt(xylos, "i_slot3", inventarioInfo[playerid][i_slot][2]);
			SQL::WriteInt(xylos, "i_slot4", inventarioInfo[playerid][i_slot][3]);
			SQL::WriteInt(xylos, "i_slot5", inventarioInfo[playerid][i_slot][4]);
			SQL::WriteInt(xylos, "i_slot6", inventarioInfo[playerid][i_slot][5]);

			SQL::WriteInt(xylos, "i_slot7", inventarioInfo[playerid][i_slot][6]);
			SQL::WriteInt(xylos, "i_slot8", inventarioInfo[playerid][i_slot][7]);
			SQL::WriteInt(xylos, "i_slot9", inventarioInfo[playerid][i_slot][8]);

			SQL::WriteInt(xylos, "i_slotocup1", inventarioInfo[playerid][i_slotocup][0]);
			SQL::WriteInt(xylos, "i_slotocup2", inventarioInfo[playerid][i_slotocup][1]);
			SQL::WriteInt(xylos, "i_slotocup3", inventarioInfo[playerid][i_slotocup][2]);
			SQL::WriteInt(xylos, "i_slotocup4", inventarioInfo[playerid][i_slotocup][3]);
			SQL::WriteInt(xylos, "i_slotocup5", inventarioInfo[playerid][i_slotocup][4]);
			SQL::WriteInt(xylos, "i_slotocup6", inventarioInfo[playerid][i_slotocup][5]);
			SQL::WriteInt(xylos, "i_slotocup7", inventarioInfo[playerid][i_slotocup][6]);
			SQL::WriteInt(xylos, "i_slotocup8", inventarioInfo[playerid][i_slotocup][7]);
			SQL::WriteInt(xylos, "i_slotocup9", inventarioInfo[playerid][i_slotocup][8]);

			SQL::WriteInt(xylos, "i_slotcant1", inventarioInfo[playerid][i_slotcant][0]);
			SQL::WriteInt(xylos, "i_slotcant2", inventarioInfo[playerid][i_slotcant][1]);
			SQL::WriteInt(xylos, "i_slotcant3", inventarioInfo[playerid][i_slotcant][2]);
			SQL::WriteInt(xylos, "i_slotcant4", inventarioInfo[playerid][i_slotcant][3]);
			SQL::WriteInt(xylos, "i_slotcant5", inventarioInfo[playerid][i_slotcant][4]);
			SQL::WriteInt(xylos, "i_slotcant6", inventarioInfo[playerid][i_slotcant][5]);
			SQL::WriteInt(xylos, "i_slotcant7", inventarioInfo[playerid][i_slotcant][6]);
			SQL::WriteInt(xylos, "i_slotcant8", inventarioInfo[playerid][i_slotcant][7]);
			SQL::WriteInt(xylos, "i_slotcant9", inventarioInfo[playerid][i_slotcant][8]);

			SQL::Close(xylos);
		}
}

hook activarGuardado(playerid)
{
	if(inventarioInfo[playerid][i_slot][8] == 1)
    {
        if(inventarioInfo[playerid][i_slot][8] == 1)
        {
            GivePlayerWeapon(playerid, 22, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 2)
        {
            GivePlayerWeapon(playerid, 23, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 3)
        {
            GivePlayerWeapon(playerid, 24, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 4)
        {
            GivePlayerWeapon(playerid, 25, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 5)
        {
            GivePlayerWeapon(playerid, 28, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 6)
        {
            GivePlayerWeapon(playerid, 29, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 7)
        {
            GivePlayerWeapon(playerid, 31, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 8)
        {
            GivePlayerWeapon(playerid, 30, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 9)
        {
            GivePlayerWeapon(playerid, 33, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 10)
        {
            GivePlayerWeapon(playerid, 34, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 11)
        {
            enviarNotificacionG(playerid, "usa /maletin, /mguardar, /msacar");
            SetPlayerAttachedObject(playerid, 0, 1210, 6, 0.303294, 0.081651, 0.010630, 0.000000, 270.000000, 0.000000);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 12)
        {
            inventarioInfo[playerid][i_slot][8] = 0;
            inventarioInfo[playerid][i_slotocup][8] = 0;
            inventarioInfo[playerid][i_slotcant][8] = 0;
            personajeInfo[playerid][p_dinero] += 5000;
            enviarMoneyNotif(playerid, 0, 5000);
            usandoOBJ[playerid] = false;
            enviarNotificacionG(playerid, "Gracias por jugar!, te dimos $5000 dolares.");
        }
        else if(inventarioInfo[playerid][i_slot][8] == 13)
        {
            enviarNotificacionG(playerid, "usa /fr y /r");
            SetPlayerAttachedObject(playerid, 0, 19942, 6, 0.063000, 0.012999, 0.038000, 0.000000, 0.000000, 176.199996, 1.000000, 1.000000, 1.000000);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 14)
        {
            enviarNotificacionG(playerid, "Toca click derecho para consumir");
            SetPlayerAttachedObject(playerid, 0, 19811, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 15)
        {
            enviarNotificacionG(playerid, "Toca click derecho para consumir");
            SetPlayerAttachedObject(playerid, 0, 19570, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 16)
        {
            enviarNotificacionG(playerid, "Toca click derecho para consumir");
            SetPlayerAttachedObject(playerid, 0, 19577, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 17)
        {
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
            SetPlayerAttachedObject(playerid, 0, 1271, 6, 0.003999, 0.462999, -0.044999, 155.099975, 3.499999, -13.500001, 1.000000, 1.000000, 1.000000);

        }
        else if(inventarioInfo[playerid][i_slot][8] == 18)
        {
            SetPlayerAttachedObject(playerid, 0, 19627, 6, 0.062999, 0.024998, 0.057001, 108.700027, -3.899999, -87.500000, 1.000000, 1.000000, 1.000000);
        }
    }
}