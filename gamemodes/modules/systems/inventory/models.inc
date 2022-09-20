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
new inventoryModelsData[][inventoryModels] = {
	{0, TEXTDRAWS_MODEL_NONE, TYPE_NONE, {0.0, 0.0, 0.0, 1.5}, "Vacio", ""},

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
