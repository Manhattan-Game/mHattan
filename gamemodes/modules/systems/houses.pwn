#define HOUSE_TYPE_INTERIOR 0
#define HOUSE_INLINE 1

enum houses@ty@pes{
 	type,
 	class[40],
 	Float:interiorCoords[4]
};
new houseModelsData[][houses@ty@pes2] = {
	{HOUSE_TYPE_INTERIOR, "Clase baja 1", {5058.0483, 329.0049,1174.7034, 359.1285}},
	{HOUSE_TYPE_INTERIOR, "Clase media 1", {4901.7446, 338.1617, 1196.5110, 0.6790}},
	{HOUSE_TYPE_INTERIOR, "Clase media 2(Dos pisos)", {4723.7373,315.3955,1192.2141,359.5511}},
	{HOUSE_TYPE_INTERIOR, "Clase media 3(Dos pisos)", {4570.2305,361.2347,1180.7999,7.0710}},
	{HOUSE_TYPE_INTERIOR, "Clase media 4(Dos pisos)", {4727.6201,106.5551,1237.1208,357.2949}},
	{HOUSE_TYPE_INTERIOR, "Clase media 5(Dos pisos)", {4748.4756,348.2649,1318.0228,354.5573}},
	{HOUSE_TYPE_INTERIOR, "Clase baja 2", {4870.0308,337.1502,1387.2468,357.9181}},
	{HOUSE_TYPE_INTERIOR, "Clase media 6", {4959.1279,527.4122,1398.2209,86.2198}},
	{HOUSE_TYPE_INTERIOR, "Clase baja 3", {4647.2612,482.1955,1411.9133,89.0398}},
	{HOUSE_TYPE_INTERIOR, "Clase media 7", {4580.4331,647.1934,1426.3759,357.3538}},
	{HOUSE_TYPE_INTERIOR, "Clase media 8", {4728.2339,756.6479,1451.5750,356.3549}},
}


enum hous@dat@s{
	listid,
	characterid,
	doorid,
	price
	direction[MAX_NAME],
	garajedoorid,
	type
}

new houseData[MAX_HOUSES][hous@dat@s];

createHouse(playerid, HOUSE_TYPE, characterIDD){

    if(characterIDD > 0){
        new index = getFreeDoorSlot();
        new Float:posXEdit, Float:posYEdit, Float:posZEdit;
        GetPlayerPos(playerid, posXEdit, posYEdit, posZEdit);
        
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO houses(characterid, doorid, price, enterZ, doorVw, doorType, doorModel, exitVw) VALUES('%d', '%f', '%f', '%f', '%d', '%d', '%d', '%d')",
            characterIDD,
            doorsInfo[index][enterCoords][0], doorsInfo[index][enterCoords][1], doorsInfo[index][enterCoords][2],
            doorsInfo[index][doorVw],
            DOOR_TYPE,
            doorsInfo[index][doorModel],
            index+1
        ); 
        mysql_pquery(MYSQL_DB, query, "onCreateDoor", "dd", playerid, index);
    }
}

loadHouse(index){
    
    doorsInfo[index][labelEnter] = CreateDynamic3DTextLabel(""GREY"Pulsa "ORANGE"H"GREY" para entrar", 0xFFFFFFFF, doorsInfo[index][enterCoords][0], doorsInfo[index][enterCoords][1], doorsInfo[index][enterCoords][2] + 0.5, 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[index][doorVw]);
    doorsInfo[index][labelExit] = CreateDynamic3DTextLabel(""GREY"Pulsa "ORANGE"H"GREY" para salir", 0xFFFFFFFF, doorsInfo[index][enterCoords][0], doorsInfo[index][enterCoords][1], doorsInfo[index][enterCoords][2] + 0.5, 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[index][exitVw]);
    
}