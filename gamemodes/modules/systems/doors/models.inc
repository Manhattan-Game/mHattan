#define HOUSE_TYPE_INTERIOR 0
#define HOUSE_INLINE 1

enum houses@ty@pes{
 	type,
 	class[40],
 	Float:interiorCoords[4]
};
new houseModelsData[][houses@ty@pes] = {
	{HOUSE_TYPE_INTERIOR, "Clase baja 1", {5058.0483, 329.0049,1174.7034, 359.1285}},
	{HOUSE_TYPE_INTERIOR, "Clase media 1", {4901.7446, 338.1617, 1196.5110, 0.6790}},
	{HOUSE_TYPE_INTERIOR, "Clase media 2(Dos pisos)", {4723.7373,315.3955,1192.2141, 359.5511}},
	{HOUSE_TYPE_INTERIOR, "Clase media 3(Dos pisos)", {4570.2305,361.2347,1180.7999, 7.0710}},
	{HOUSE_TYPE_INTERIOR, "Clase media 4(Dos pisos)", {4727.6201,106.5551,1237.1208, 357.2949}},
	{HOUSE_TYPE_INTERIOR, "Clase media 5(Dos pisos)", {4748.4756,348.2649,1318.0228, 354.5573}},
	{HOUSE_TYPE_INTERIOR, "Clase baja 2", {4870.0308,337.1502,1387.2468, 357.9181}},
	{HOUSE_TYPE_INTERIOR, "Clase media 6", {4959.1279,527.4122,1398.2209, 86.2198}},
	{HOUSE_TYPE_INTERIOR, "Clase baja 3", {4647.2612,482.1955,1411.9133, 89.0398}},
	{HOUSE_TYPE_INTERIOR, "Clase media 7", {4580.4331,647.1934,1426.3759, 357.3538}},
	{HOUSE_TYPE_INTERIOR, "Clase media 8", {4728.2339,756.6479,1451.5750, 356.3549}},
    {HOUSE_TYPE_INTERIOR, "Garaje 1", {6260.3022, 967.6240, 853.9636}},
    {HOUSE_TYPE_INTERIOR, "Garaje 2", {6103.4097, 1218.0385, 874.2243}}
};


#define DOOR_TYPE_NONE 0
#define DOOR_TYPE_PHYSICAL 1
#define DOOR_TYPE_INTERIOR 2
#define DOOR_TYPE_VEHICLE 3

#define DOOR_STATE_CLOSE 0
#define DOOR_STATE_OPEN 1

new editDoor[MAX_PLAYERS] = -1;

enum doors_inf@o
{
    listid,
    characterID,

    Float:enterCoords[4],
    Float:exitCoords[4],
    enterState,

    pickupEnter,
    Text3D:labelEnter,
    Text3D:labelExit,

    doorModel,
    Float:doorCoords[6],
    Float:moveDoorCoords[6],
    doorVw,
    doorState,
    doorType,

    exitVw,
    doorObject,


    doorStep
};
new doorsInfo[MAX_DOORS+1][doors_inf@o];