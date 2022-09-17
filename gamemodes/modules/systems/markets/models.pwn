#define MARKET_TYPE_FURNITURES 1
#define MARKET_TYPE_RESTAURANT 2
#define MARKET_TYPE_247 3
#define MARKET_TYPE_CLOTHES 4
#define MARKET_TYPE_VEHICLES 5
#define MARKET_TYPE_PLANES 6
#define MARKET_TYPE_BOATS 7
#define MARKET_TYPE_GUNS 8
#define MARKET_TYPE_BUILDS 9


enum markets@Type{
    listid,
    name[40]
};

new marketsModelsData[][markets@Type] = {
	{0, "Nada"},
    {MARKET_TYPE_FURNITURES, "Tienda de muebles"},
    {MARKET_TYPE_RESTAURANT, "Restaurante"},
    {MARKET_TYPE_247, "24/7"},
    {MARKET_TYPE_CLOTHES, "Tienda de ropa"},
    {MARKET_TYPE_VEHICLES, "Tienda de vehiculos"},
    {MARKET_TYPE_PLANES, "Tienda de aereos"},
    {MARKET_TYPE_BOATS, "Tienda de marítimos"},
    {MARKET_TYPE_GUNS, "Tienda de armas"},
    {MARKET_TYPE_BUILDS, "Inmobiliaria"}
};

