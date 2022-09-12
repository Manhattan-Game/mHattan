#include <YSI_Coding\y_hooks>

#define HOUSE_STATE_ON_SALE 0
#define HOUSE_STATE_PURCHASE 1
#define HOUSE_STATE_RENT 2

showMenuHouses(playerid){
	new stringfinal[QUERY_LONG];
	for(new i;i<sizeof(houseModelsData);i++){
		strcat(houseModelsData[i][class], "\n");
		strcat(stringfinal, houseModelsData[i][class]);
	}
	ShowPlayerDialog(playerid, DIALOG_EDIT_DOOR_EXIT_HOUSES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" Doors", stringfinal, "Continuar", ""RED" cancelar");
}


enum hous@dat@s{
	listid,
	characterid,
	doorid,
	price,
	direction[40],
	garajedoorid,
	type,
	interior,
	level,
	virtualworld,
	statee,
	safe,

	Text3D:label,
	pickup,
	bool:loaded
};

new houseData[MAX_HOUSES][hous@dat@s];



cmd:crearcasa(playerid, params[]){
    if(characterData[playerid][p_spawn]){
    	if(_@IsNumeric(params[0])){
    		new param = strval(params[0]);
    		if(param >= 0 && param < 2){
    			new DOOR_TYPS;
    			if(param == 0){
    				DOOR_TYPS = DOOR_TYPE_INTERIOR;
    			} else DOOR_TYPS = DOOR_TYPE_PHYSICAL;
    			createDoor(playerid, DOOR_TYPS, characterData[playerid][listid], TYPE_HOUSES, param);
    		} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearcasa [TIPO: 0= Interior, 1=Puerta Fisica]");

    	}else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY"/crearcasa [TIPO: 0= Interior, 1=Puerta Fisica]");
    }
    return 1;
}

createHouse(playerid, HOUSE_TYPE, doorId){
	new indexx = getFreeHouseSlot();
    if((HOUSE_TYPE != -1) && (indexx != -1)){
    	new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO houses(characterid, doorid, price, direction, garajedoorid, type, level) VALUES (0, '%d', 15000, 'Completar', 0, '%d', 0)", doorId, HOUSE_TYPE); 
        mysql_pquery(MYSQL_DB, query, "onCreateHouse", "ddd", playerid, indexx, doorId);
    }
}


DestroyDynamicHouse(index){
	if(houseData[index][loaded]){
		DestroyDynamic3DTextLabel(houseData[index][label]);
		DestroyDynamicPickup(houseData[index][pickup]);
		houseData[index][loaded] = false;
	}
}
loadHouse(index, indexdoor){
	if(!houseData[index][loaded]){
		if(houseData[index][doorid] != -1){
			if(indexdoor != -1){
				new string[QUERY_MEDIUM];
				new pickupp = 1272;
				if(houseData[index][statee] == HOUSE_STATE_ON_SALE){
					pickupp = 1273;
					format(string, sizeof(string), ""GREY"Casa en venta "GREEN"$%i"GREY"\n Direccion: %s \n "LIME" Dirigete a una inmobiliaria para comprarla!.", houseData[index][price], houseData[index][direction]);
				} else format(string, sizeof(string), ""GREY"Direccion: %s", houseData[index][direction]);
			    houseData[index][label] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, doorsInfo[indexdoor][enterCoords][0], doorsInfo[indexdoor][enterCoords][1], doorsInfo[indexdoor][enterCoords][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[indexdoor][doorVw]);
				houseData[index][pickup] = CreateDynamicPickup(pickupp, 1, doorsInfo[indexdoor][enterCoords][0], doorsInfo[indexdoor][enterCoords][1], doorsInfo[indexdoor][enterCoords][2], houseData[index][virtualworld], -1, -1, 10.0);
				houseData[index][loaded] = true;
			}
		}
	}
}

getFreeHouseSlot()
{
    for(new i;i<MAX_HOUSES-1;i++)
    {
        if(!houseData[i][loaded]) return i;
    }
    return -1;
}

forward loadHouses();
public loadHouses(){
    if(cache_num_rows()){
    	new indexdoor;
        for(new i=0;i<cache_num_rows();i++){ 
            cache_get_value_name_int(i, "listid", houseData[i][listid]);
	       	cache_get_value_name_int(i, "characterid", houseData[i][characterid]);
	        cache_get_value_name_int(i, "doorid", houseData[i][doorid]);
	        cache_get_value_name_int(i, "price", houseData[i][price]);
	        cache_get_value_name(i, "direction", houseData[i][direction]);
	        cache_get_value_name_int(i, "garajedoorid", houseData[i][garajedoorid]);
	        cache_get_value_name_int(i, "type", houseData[i][type]);
	        cache_get_value_name_int(i, "interior", houseData[i][interior]);
	        cache_get_value_name_int(i, "level", houseData[i][level]);
	        cache_get_value_name_int(i, "virtualworld", houseData[i][virtualworld]);
	        cache_get_value_name_int(i, "safe", houseData[i][safe]);
	            
			DestroyDynamicHouse(i);
			indexdoor = getIndexDoorByID(houseData[i][doorid]);
			if(indexdoor != -1){
	            loadHouse(i, indexdoor);
            }
        }
    }
}

forward onCreateHouse(playerid, index, doorId);
public onCreateHouse(playerid, index, doorId){
	new indexdoor = getIndexDoorByID(doorid); 
	if(indexdoor != -1){
		houseData[index][price] = 15000;
		format(houseData[index][direction], 40, "Completar");
		houseData[index][doorid] = doorId;
		houseData[index][listid] = cache_insert_id();
		DestroyDynamicHouse(index);
		loadHouse(index, indexdoor);
		loadDoor(indexdoor);
		ShowTDN_OOC(playerid, "Creaste una casa, editala con /editarcasa");
	}
}