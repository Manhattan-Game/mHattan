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
    {MARKET_TYPE_FURNITURES, "Tienda de muebles"}, // YES
    {MARKET_TYPE_RESTAURANT, "Restaurante"},
    {MARKET_TYPE_247, "24/7"},
    {MARKET_TYPE_CLOTHES, "Tienda de ropa"}, // YES
    {MARKET_TYPE_VEHICLES, "Tienda de vehiculos"},
    {MARKET_TYPE_PLANES, "Tienda de aereos"},
    {MARKET_TYPE_BOATS, "Tienda de marítimos"},
    {MARKET_TYPE_GUNS, "Tienda de armas"},
    {MARKET_TYPE_BUILDS, "Inmobiliaria"} // YES
};


#define MAX_MARKETS_ITEMS 20 // Don't touch devit please, use index by mysql Db
enum marketsR@enm{
    listid,
    characterid,
    doorid,
    safe,
    level,
    type_market,
    Float:coordsSell[3],
    sale,
    vw,
    item[MAX_MARKETS_ITEMS],
    itemAmmount[MAX_MARKETS_ITEMS],
    price,
    direction[40],

    Text3D:labell,
    Text3D:labelSell,
    bool:loadedd,
    pickupp

}
new marketData[MAX_MARKETS][marketsR@enm];

new editMarket[MAX_PLAYERS] = -1;
new selectedIndexItem[MAX_PLAYERS] = -1;
new editTypeMarkets[MAX_PLAYERS] = -1;
