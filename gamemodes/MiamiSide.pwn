//INCLUDES

#include <a_samp>
#include <YSI_Data\y_iterate>
#include <a_mysql>
#include <samp_bcrypt>
#include <Pawn.cmd>
#include <sscanf2>
#include <GPS>
#include <streamer>
#include <timerfix>
#include <ProgressBarNick>
#include <ShowInfoForPlayer>

// GLOBAL
#include "./modules/global/mysql.pwn"

// ----------- MAP, MINIMAP AND EDITOR -------------------
#define USE_ARTWORK 1
new QUERY_BUFFER[2048];
#define VICE_CITY_PATH "vice_city/"

#include "./modules/notincludes/inGameMap/db/header"
#include "./modules/notincludes/inGameMap/models_types/header"
#include "./modules/notincludes/inGameMap/models/header"
#include "./modules/notincludes/inGameMap/objects/header"
#include "./modules/notincludes/inGameMap/nodes/header"
#include "./modules/notincludes/inGameMap/editor/header"
#include "./modules/notincludes/inGameMap/streamer/config/header"
#include "./modules/notincludes/inGameMap/streamer/types/header"

#include "./modules/notincludes/inGameMap/models_types/funcs"
#include "./modules/notincludes/inGameMap/models/funcs"
#include "./modules/notincludes/inGameMap/objects/funcs"
#include "./modules/notincludes/inGameMap/nodes/funcs"

#include "./modules/notincludes/inGameMap/db/impl"
#include "./modules/notincludes/inGameMap/models_types/impl"
#include "./modules/notincludes/inGameMap/models/impl"
#include "./modules/notincludes/inGameMap/objects/impl"
#include "./modules/notincludes/inGameMap/nodes/impl"
#include "./modules/notincludes/inGameMap/streamer/config/impl"

#include "./modules/notincludes/inGameMap/editor/impl"
#include "./modules/notincludes/map/minimap"


#include "./modules/notincludes/maps/houses/interiors"
// ----------- MAP, MINIMAP AND EDITOR -------------------


//DEFINITIONS
#include "./modules/global/definitions/colors.pwn"
#include "./modules/global/definitions/dialogs.pwn"
#include "./modules/global/definitions/global.pwn"
#include "./modules/global/definitions/tech.pwn"

// MODELS
#include "./modules/global/accounts/models"
#include "./modules/systems/character/models"
#include "./modules/systems/doors/models"
#include "./modules/systems/houses/models"
#include "./modules/systems/furnitures/models"
#include "./modules/systems/markets/models"
#include "./modules/systems/markets/clothes/models"
#include "./modules/systems/inventory/models"
#include "./modules/systems/vehicles/models"
#include "./modules/systems/companies/models"


#include "./modules/notincludes/dialogs"



// FUNCS
#include "./modules/global/accounts/funcs"
#include "./modules/systems/character/funcs"
#include "./modules/systems/doors/funcs"
#include "./modules/systems/houses/funcs"
#include "./modules/systems/furnitures/funcs"
#include "./modules/systems/markets/funcs"
#include "./modules/systems/markets/clothes/funcs"
#include "./modules/systems/inventory/funcs"
#include "./modules/systems/vehicles/funcs"
#include "./modules/systems/companies/funcs"



// IMPL
#include "./modules/global/accounts/impl"
#include "./modules/systems/character/impl"
#include "./modules/systems/doors/impl"
#include "./modules/systems/houses/impl"
#include "./modules/systems/furnitures/impl"
#include "./modules/systems/markets/impl"
#include "./modules/systems/markets/builds/impl"
#include "./modules/systems/markets/clothes/impl"
#include "./modules/systems/markets/furnitures/impl"
#include "./modules/systems/inventory/impl"
#include "./modules/systems/vehicles/impl"
#include "./modules/systems/companies/impl"



// COMMANDS
#include "./modules/global/commands/user/rol.pwn"


#include "./modules/global/hud.pwn"


// NOTIFICATIONS

#define MAX_TDN_IC 5
#define TDN_POS_X_IC 4.666673
#define TDN_POS_Y_IC 370.829650
#define TDN_FONT_IC 1
#define TDN_LETTER_SIZE_X_IC 0.250000
#define TDN_LETTER_SIZE_Y_IC 1.000000
#define TDN_SIZE_IC 134.333327
#define TDN_COLOR_IC 0xFFFFFFFF
#define TDN_COLOR_BOX_IC 0x1E1E1EFF
#define TDN_PROPORTIONAL_IC 1
#define TDN_DISTANCE_IC 5
#define TDN_MODE_UP_IC
#define TDN_TIME_IC 4000
#define MAX_TDN_TEXT_IC 800

#include <td-notification-IC>

#define MAX_TDN_OOC 5
#define TDN_POS_X_OOC 490.000000
#define TDN_POS_Y_OOC 180.000000
#define TDN_FONT_OOC 1
#define TDN_LETTER_SIZE_X_OOC 0.250000
#define TDN_LETTER_SIZE_Y_OOC 1.000000
#define TDN_SIZE_OOC 137.000000
#define TDN_COLOR_OOC 0xFFFFFFFF
#define TDN_COLOR_BOX_OOC 0x3C3C3CFF
#define TDN_PROPORTIONAL_OOC 1
#define TDN_DISTANCE_OOC 5
#define TDN_MODE_DOWN_OOC
#define TDN_TIME_OOC 4000
#define MAX_TDN_TEXT_OOC 800

#include <td-notification-OOC>

//---------------------------------------------------------------------//
#define SERVER_WEBSITE		"https://mainland.com"
#define SERVER_HOSTNAME		"MAINLAND ("SERVER_WEBSITE")"
#define SERVER_MAPNAME		"Vice City"
#define SERVER_LANGUAGE		"Espanol"
#define SERVER_NAME			"Mainland Roleplay"
#define SERVER_NAME_SHORT	"ML-RP"
#define SERVER_VERSION		"0.2"
#define VERSION_DATE		""
#define SERVER_MODE			"ML-RP "SERVER_VERSION"(Roleplay)"
//---------------------------------------------------------------------//

#undef MAX_PLAYERS
#define MAX_PLAYERS 10

main()
{
 	bcrypt_set_thread_limit(6);   
}
#pragma compress 0
#pragma warning disable 214, 237

public OnGameModeInit(){
	//Configurations
	SetGameModeText(SERVER_MODE);
	SendRconCommand("hostname "SERVER_HOSTNAME"");
	SendRconCommand("weburl "SERVER_WEBSITE"");
	SendRconCommand("mapname "SERVER_MAPNAME"");
	SendRconCommand("language "SERVER_LANGUAGE"");
	SendRconCommand("announce 1");
	SendRconCommand("query 1");
	SendRconCommand("sleep 1");
	SendRconCommand("minconnectiontime 1000");
    SendRconCommand("conncookies 1");
	SendRconCommand("cookielogging 0");
	SendRconCommand("chatlogging 0");
	SendRconCommand("ackslimit 5000");

	DisableInteriorEnterExits();
    EnableStuntBonusForAll(0);
    ShowPlayerMarkers(0);
    SetNameTagDrawDistance(23.75);
    ManualVehicleEngineAndLights();
    UsePlayerPedAnims();

    mysql_pquery(MYSQL_DB, "SELECT * FROM DOORS", "loadDoors");
    return 1;
}

public OnPlayerConnect(playerid){
    return 1;
}
public OnPlayerUpdate(playerid){
	return 1;
}

public OnPlayerSpawn(playerid){
    return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger){
	return 1;
}
public OnPlayerExitVehicle(playerid, vehicleid){
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate){
	return 1;
}
public OnPlayerDisconnect(playerid, reason){
    return 1;
}
public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
	if(characterData[playerid][p_spawn] == true)
	{
		if(result == -1)
    	{
       		ShowInfoForPlayer(playerid, "~r~~h~ Comando incorrecto", 3000);
        	return 0;
    	}
	} else ShowTDN_OOC(playerid, "Loguea primero");
    return 1;

}
public OnPlayerText(playerid, text[]){
	if(characterData[playerid][p_spawn] == true){
		new string[248];
		format(string, 248, ""ORANGE"[ID:%i] "GREY"%s"GREY" dice: %s.", playerid, GetFullName(playerid), text);
		if(inVehicle[playerid] != -1) sendDoubleLineMessageVehicle(inVehicle[playerid], playerid, 10.0, -1, string);
		else sendDoubleLineMessage(playerid, 10.0, -1, string);

		
	} else ShowTDN_OOC(playerid, "Debes ingresar al servidor antes.");
	return 0;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid){
	return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid){
	if(clickedid == Text:INVALID_TEXT_DRAW){
		if(characterData[playerid][p_spawn]){
			switch(characterData[playerid][viewTextdraw]){
				case TEXTDRAWS_INVENTORY: hideInventory(playerid);
				case TEXTDRAWS_DIALOG_ITEM: clearDialogItem(playerid);
			}
		}	
	}

    return 1;
}

cmd:no(playerid, params[]){
	ClearAnimations(playerid);
}