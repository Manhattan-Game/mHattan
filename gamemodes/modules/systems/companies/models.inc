#define MAX_CRAFTINGS 200
#define COMPANIES_TYPE_VEHICLES 1..3
#define COMPANIES_TYPE_FURNITURES 4

enum companydata@type{
	listid,
	characterid,
	name[60],
	type_company,
	price,
	doorid,
	garajedoorid,
	direction[60],
	Float:room_pos[3],
	Float:job_pos[6],
	Float:dispatch_pos[6],
	jobs_skins[2],
	safe,
	sale,
	Text3D:labelenter,
	Text3D:labelroom,
	Text3D:labeljob1,
	Text3D:labeljob2,
	Text3D:labeldispatch1,
	Text3D:labeldispatch2,
	pickupEnter,

	bool:loadedd
};
new companyData[MAX_COMPANIES][companydata@type];
new editCompany[MAX_PLAYERS];
new selectCraft[MAX_PLAYERS];
enum company@models{
    listid,
    name[40],
    fabItems[6],
    fabItemsAmmount[6]
};

new companyModelData[][company@models] = {
	// si se fabrica con menos partes del total (6) setear las demas en -1
	{0, "Nada", {-1, -1, -1, -1, -1, -1}, {-1, -1, -1, -1, -1, -1}},
    {1, "Fabrica de vehiculos Calle", {2, 4, 5, 7, 9, -1}, {1, 1, 1, 4, 1, -1}},
    {2, "Fabrica de vehiculos Roadsport", {2, 4, 5, 7, 10, -1}, {1, 1, 1, 4, 1, -1}},
    {3, "Fabrica de vehiculos Sport", {2, 4, 5, 7, 11, -1}, {1, 1, 1, 4, 1, -1}},

    {4, "Tienda de muebles", {2, 4, 5, 7, 11, -1}, {1, 1, 1, 4, 1, -1}}
};

enum crafting@enm{
	characterid,
	crafting[6],
	type_crafting,
	progress,
	companieid,
	price,
	modeel,
	ammount,
	Text3D:labelCrafting
};
new craftingData[MAX_CRAFTINGS][crafting@enm];

