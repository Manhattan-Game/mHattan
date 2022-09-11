#include <YSI_Coding\y_hooks>

#define TYPE_NONE 0
#define TYPE_GUNS 1
#define TYPE_FOOD 2


#define ROOTS_TYPE_GUN 0.0, 0.0, 0.0, 1.3
new Text:inventarioTD;
new PlayerText:inventarioTDD[MAX_PLAYERS][13];

enum inventoryModels
{
	id,
	model,
	type,
	Float:root[4],
	name[24],
	description[64]
};
new inventoryModelsData[][inventoryModels] =
{
	{0, 19382, TYPE_NONE, {0.0, 0.0, 0.0, 1.5}, "Vacio", ""},

	{1, 346, TYPE_GUNS, {ROOTS_TYPE_GUN}, "9mm-comun", "Pistola_9mm_comun"},
	{2, 347, TYPE_GUNS, {ROOTS_TYPE_GUN}, "9mm-silenciada", "Pistola_9mm_Silenciada"},
	{3, 348, TYPE_GUNS, {ROOTS_TYPE_GUN}, "Desert-Eagle", "Pistola_Desert-eagle"},
	{4, 349, TYPE_GUNS, {ROOTS_TYPE_GUN}, "Escopeta", "Escopeta-Comun"},
	{5, 352, TYPE_GUNS, {ROOTS_TYPE_GUN}, "Micro-Uzi", "SMG___Micro_Uzi"},
	{6, 353, TYPE_GUNS, {ROOTS_TYPE_GUN}, "MP5", "Subfusil_tipo_mp5"},
	{7, 356, TYPE_GUNS, {ROOTS_TYPE_GUN}, "M4", "Rifle_de_alto_calibre_m4"},
	{8, 355, TYPE_GUNS, {ROOTS_TYPE_GUN}, "AK-47", "Rifle_de_alto_calibre_ak-47"},
	{9, 357, TYPE_GUNS, {ROOTS_TYPE_GUN}, "Rifle", "Rifle_de_caza"},
	{10, 358, TYPE_GUNS, {ROOTS_TYPE_GUN}, "Rifle_Francotirador", "Rifle_francotirador_con_mira"}


	/*{11, 1210, {0.0, 0.0, 0.0, 0.0}, "Maletin", "Maletin_con_dinero"},
	{12, 19054, {0.0, 0.0, 0.0, 1.0}, "Regalo", "Regalo_de_miamiside"},

	{13, 19942, {0.0, 0.0, 0.0, 1.0}, "Radio-Comunicador", "Radio-Comunicador-con-frecuencias"},

	{14, 19811, {0.0, 0.0, 0.0, 1.0}, "Hamburgesa", "Hamburgesa"},
	{15, 19570, {0.0, 0.0, 0.0, 1.0}, "Agua", "Botella_de_agua"},
	{16, 19577, {0.0, 0.0, 0.0, 1.0}, "Manzana", "Manzana"},
	{17, 1271, {0.0, 0.0, 0.0, 2.0}, "Caja", "Caja-de-ropa"},
	{18, 19627, {-50.0, -10.0, 0.0, 0.0}, "Llave", "Llave-francesa"},
	{19, 18874, {0.0, 0.0, 0.0, 0.0}, "Celular", "Celular-Miami-Phone"}, // CAMBIAR
	{20, 11746, {0.0, 0.0, 0.0, 0.0}, "Llaves", "Llaves-de-vehiculo"},
	{21, 11746, {0.0, 0.0, 0.0, 0.0}, "Llaves", "Llaves-de-negocio"},
	{22, 2912, {0.0, 0.0, 0.0, 0.0}, "Cargamento", "Cargamento_de_pablo"},
	{23, 1139, {0.0, 0.0, 0.0, 0.0}, "Aleron 1", "Aleron Alto"}*/

};
// OBjetos tirados
enum droppedObjectsEnum
{
	model,
	ammount,
	Float:x,
	Float:y,
	Float:z,
	vw,

	objectID,
	Text3D:labelID
};
new droppedObjects[MAX_DROPPED_ITEMS][droppedObjectsEnum];
enum _inv_info
{
	listid,
	characterid,
	slot[9],
	ammount[9],

	selectedIndex
};
new inventoryInfo[MAX_PLAYERS][_inv_info];


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
showInventory(playerid)
{
	if(characterData[playerid][p_spawn] == true)
	{

		for(new i; i<8;i++)
		{
			PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][i], inventoryModelsData[inventoryInfo[playerid][slot][i]][model]);
			PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][i], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][3]);
		}
		PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][11], inventoryModelsData[inventoryInfo[playerid][slot][8]][model]);
		PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][11], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][3]);
		



		for(new j;j<13;j++) PlayerTextDrawShow(playerid, inventarioTDD[playerid][j]);
		TextDrawShowForPlayer(playerid, inventarioTD);
		SelectTextDraw(playerid, 0x87868286);
		selectTextDraw(playerid, inventoryInfo[playerid][selectedIndex]);
		characterData[playerid][viewTextdraw] = TEXTDRAWS_INVENTORY;
	}
}
hideInventory(playerid)
{
	if(characterData[playerid][p_spawn] == true && characterData[playerid][viewTextdraw] == TEXTDRAWS_INVENTORY)
	{
		for(new j;j<13;j++) PlayerTextDrawHide(playerid, inventarioTDD[playerid][j]);
		TextDrawHideForPlayer(playerid, inventarioTD);
		CancelSelectTextDraw(playerid);
		characterData[playerid][viewTextdraw] = 0;
	}
}
selectTextDraw(playerid, newindex){
	new string[300];
	new oldIndex = inventoryInfo[playerid][selectedIndex];
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][oldIndex], 673720575);
	PlayerTextDrawShow(playerid, inventarioTDD[playerid][oldIndex]);
	inventoryInfo[playerid][selectedIndex] = newindex;
	format(string, 300, "Nombre:__%s  Informacion:_%s", inventoryModelsData[inventoryInfo[playerid][slot][newindex]][name], inventoryModelsData[inventoryInfo[playerid][slot][newindex]][description]);
	PlayerTextDrawSetString(playerid, inventarioTDD[playerid][11], string);
	PlayerTextDrawBackgroundColor(playerid, inventarioTDD[playerid][newindex], 473720575);
	PlayerTextDrawShow(playerid, inventarioTDD[playerid][newindex]);
}
addItem(playerid, itemid, ammountt){

	for(new i=0; i<8; i++){
		if(inventoryInfo[playerid][slot][i] == 0)
		{
			inventoryInfo[playerid][slot][i] = itemid;
			inventoryInfo[playerid][ammount][i] = ammountt;
			updateInventory(playerid, i);
			return i;
		}
		if(i == 8) ShowTDN_IC(playerid, "No tienes un slot disponible.");
	}
	return -1;
}
removeItem(playerid, index){
	inventoryInfo[playerid][slot][index] = 0;
	inventoryInfo[playerid][ammount][index] = 0;
	updateInventory(playerid, index);
}
useItem(playerid, index){
	if(inventoryInfo[playerid][slot][index] > 0){
		inventoryInfo[playerid][slot][8] = inventoryInfo[playerid][slot][index];
		inventoryInfo[playerid][ammount][8] = inventoryInfo[playerid][ammount][index];
		updateInventory(playerid, 11);
		removeItem(playerid, index);
		updateInventory(playerid, index);
		updateHandItem(playerid);
		//useAnimationItem(playerid, 8);
	} else ShowTDN_OOC(playerid, "No tienes un objeto en este indice.");
}

saveUseItem(playerid){
	if(inventoryInfo[playerid][slot][8] > 0){
		RemovePlayerAttachedObject(playerid, 0);
		switch(inventoryModelsData[inventoryInfo[playerid][slot][8]][type]){
			case TYPE_GUNS: ResetPlayerWeapons(playerid);
			case TYPE_FOOD: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}

		addItem(playerid, inventoryInfo[playerid][slot][8], inventoryInfo[playerid][ammount][8]);
		removeItem(playerid, 8);
		updateInventory(playerid, 11);
		updateHandItem(playerid);
	} else ShowTDN_OOC(playerid, "No tienes un objeto en mano.");
}
updateInventory(playerid, i){
	new oldindex = i;
	if(characterData[playerid][viewTextdraw] == TEXTDRAWS_INVENTORY){
		if(i == 11) i = 8;
		PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][oldindex], inventoryModelsData[inventoryInfo[playerid][slot][i]][model]);
		PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][oldindex], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][3]);
		PlayerTextDrawShow(playerid, inventarioTDD[playerid][oldindex]);
	}
}
getDropItem(playerid){
	if(characterData[playerid][p_spawn]){
		for(new i=0; i<MAX_DROPPED_ITEMS; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2, droppedObjects[i][x], droppedObjects[i][y], droppedObjects[i][z]))
			{
				if(characterData[playerid][world] == droppedObjects[i][vw])
				{
					if(addItem(playerid, droppedObjects[i][model], droppedObjects[i][ammount]) != -1){
						DestroyDynamicObject(droppedObjects[i][objectID]);
						DestroyDynamic3DTextLabel(droppedObjects[i][labelID]);
						ShowTDN_OOC(playerid, "Agarraste un objeto del suelo");
						droppedObjects[i][x] = 0;
						droppedObjects[i][y] = 0;
						droppedObjects[i][z] = 0;
						droppedObjects[i][model] = 0;
						droppedObjects[i][ammount] = 0;
						droppedObjects[i][vw] = 0;
						ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop", 4.0,0,0,0,0,0);
						break;
					} else{
						ShowTDN_OOC(playerid, "No tienes un slot disponible");
						break;
					}
				}
			}
		}
	}
}
dropItem(playerid, index){
	new string[80];
	if(inventoryInfo[playerid][slot][index] > 0)
	{
		for(new i;i<MAX_DROPPED_ITEMS; i++)
		{
			if(droppedObjects[i][model] == 0)
			{
				new Float:coordX, Float:coordY, Float:coordZ;
				GetPlayerPos(playerid, coordX, coordY, coordZ);
				format(string, 80, ""GREY"Pulsa "ORANGE"C"GREY" para recoger \n"WHITE" (%s)", inventoryModelsData[inventoryInfo[playerid][slot][index]][name]);
				droppedObjects[i][x] = coordX;
				droppedObjects[i][y] = coordY;
				droppedObjects[i][z] = coordZ;
				droppedObjects[i][model] = inventoryInfo[playerid][slot][index];
				droppedObjects[i][ammount] = inventoryInfo[playerid][ammount][index];
				droppedObjects[i][vw] = GetPlayerVirtualWorld(playerid);
				droppedObjects[i][objectID] =	CreateDynamicObject(inventoryModelsData[inventoryInfo[playerid][slot][index]][model], coordX, coordY, coordZ-0.8, 90.0, 90.0, 0.0, droppedObjects[i][vw], -1, -1, 15);
				droppedObjects[i][labelID] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, coordX, coordY, coordZ-0.8, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);				
				removeItem(playerid, index);
				updateInventory(playerid, index);
				break;
			}
		}
	} else ShowTDN_OOC(playerid, "No tienes un objeto en este indice.");
}

createInventory(characterMkid){
		new query[QUERY_LONG];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO inventory(characterid, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, amount1, amount2, amount3, amount4, amount5, amount6, amount7, amount8, amount9) VALUES ('%d', 0, 0, 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0)", characterMkid); 
        mysql_pquery(MYSQL_DB, query);

}
loadInventoryByID(playerid, characterID){
        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "SELECT * FROM inventory WHERE characterid = '%d' LIMIT 1", characterID);
        mysql_pquery(MYSQL_DB, query, "loadInventory", "d", playerid);
}
forward loadInventory(playerid);
public loadInventory(playerid){
    if(cache_num_rows()){
       	cache_get_value_name_int(0, "listid", inventoryInfo[playerid][listid]);
        cache_get_value_name_int(0, "characterid", characterData[playerid][mkid]);

        cache_get_value_name_int(0, "slot1", inventoryInfo[playerid][slot][0]);
        cache_get_value_name_int(0, "slot2", inventoryInfo[playerid][slot][1]);
        cache_get_value_name_int(0, "slot3", inventoryInfo[playerid][slot][2]);
        cache_get_value_name_int(0, "slot4", inventoryInfo[playerid][slot][3]);
        cache_get_value_name_int(0, "slot5", inventoryInfo[playerid][slot][4]);
        cache_get_value_name_int(0, "slot6", inventoryInfo[playerid][slot][5]);
        cache_get_value_name_int(0, "slot7", inventoryInfo[playerid][slot][6]);
        cache_get_value_name_int(0, "slot8", inventoryInfo[playerid][slot][7]);
        cache_get_value_name_int(0, "slot9", inventoryInfo[playerid][slot][8]);

        cache_get_value_name_int(0, "amount1", inventoryInfo[playerid][ammount][0]);
        cache_get_value_name_int(0, "amount2", inventoryInfo[playerid][ammount][1]);
        cache_get_value_name_int(0, "amount3", inventoryInfo[playerid][ammount][2]);
        cache_get_value_name_int(0, "amount4", inventoryInfo[playerid][ammount][3]);
        cache_get_value_name_int(0, "amount5", inventoryInfo[playerid][ammount][4]);
        cache_get_value_name_int(0, "amount6", inventoryInfo[playerid][ammount][5]);
        cache_get_value_name_int(0, "amount7", inventoryInfo[playerid][ammount][6]);
        cache_get_value_name_int(0, "amount8", inventoryInfo[playerid][ammount][7]);
        cache_get_value_name_int(0, "amount9", inventoryInfo[playerid][ammount][8]);

        if(inventoryInfo[playerid][slot][8] > 0) updateHandItem(playerid);
    }
}
saveInventory(playerid){
    if(characterData[playerid][p_spawn] == true){
        new query[QUERY_LONG];
        mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE inventory SET `slot1`='%d', `slot2`='%d', `slot3`='%d', `slot4`='%d', `slot5`='%d', `slot6`='%d', `slot7`='%d', `slot8`='%d', `slot9`='%d', \
        `amount1`='%d', `amount2`='%d', `amount3`='%d', `amount4`='%d', `amount5`='%d', `amount6`='%d', `amount7`='%d', `amount8`='%d', `amount9`='%d' WHERE listid = '%d' LIMIT 1",
        	inventoryInfo[playerid][slot][0],
        	inventoryInfo[playerid][slot][1],
        	inventoryInfo[playerid][slot][2],
        	inventoryInfo[playerid][slot][3],
        	inventoryInfo[playerid][slot][4],
        	inventoryInfo[playerid][slot][5],
        	inventoryInfo[playerid][slot][6],
        	inventoryInfo[playerid][slot][7],
        	inventoryInfo[playerid][slot][8],
        	inventoryInfo[playerid][ammount][0],
        	inventoryInfo[playerid][ammount][1],
        	inventoryInfo[playerid][ammount][2],
        	inventoryInfo[playerid][ammount][3],
        	inventoryInfo[playerid][ammount][4],
        	inventoryInfo[playerid][ammount][5],
        	inventoryInfo[playerid][ammount][6],
        	inventoryInfo[playerid][ammount][7],
        	inventoryInfo[playerid][ammount][8],
        	inventoryInfo[playerid][listid]
        );
        mysql_pquery(MYSQL_DB, query);
    }
}