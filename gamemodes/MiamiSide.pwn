//INCLUDES

#include <a_samp>

#include <YSI_Data\y_iterate>
#include <a_mysql>
#include <samp_bcrypt>
#include <Pawn.cmd>
#include <sscanf2>
#include <GPS>
#include <streamer>
#include <timerFix>
//#include <YSF>
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


// COMMANDS
#include "./modules/global/commands/user/rol.pwn"


#include "./modules/global/hud.pwn"

#if defined CGEN_MEMORY
#undef CGEN_MEMORY
#define CGEN_MEMORY 66000
#endif
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
#define SERVER_LANGUAGE		"Español"
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
public OnGameModeInit()
{
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

public OnPlayerConnect(playerid)
{
    return 1;
}

public OnPlayerSpawn(playerid)
{
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
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
public OnPlayerText(playerid, text[])
{
	if(characterData[playerid][p_spawn] == true)
	{
		new string[248];
		format(string, 248, ""ORANGE"[ID:%i] "GREY"%s"GREY" dice: %s.", playerid, GetFullName(playerid), text);
		sendDoubleLineMessage(playerid, 10.0, -1, string);

		
	} else ShowTDN_OOC(playerid, "Debes ingresar al servidor antes.");
	return 0;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	/*
        case d_baul:
		{
			if(response)
			{
				for(new i;i<9;i++)
				{
					if(vehInfo[attachandoA[playerid]][v_baul][i] == 0)
					{
						if(inventarioInfo[playerid][i_slot][8] != 0)
						{
							vehInfo[attachandoA[playerid]][v_baul][i] = inventarioInfo[playerid][i_slot][8];
							vehInfo[attachandoA[playerid]][v_baulcant][i] = inventarioInfo[playerid][i_slotcant][8];

							attachandoA[playerid] = 0;

							inventarioInfo[playerid][i_slot][8] = 0;
							inventarioInfo[playerid][i_slotcant][8] = 0;
							inventarioInfo[playerid][i_slotocup][8] = 0;
							enviarNotificacionG(playerid, "Guardaste un objeto en el maletero");
							attachandoA[playerid] = 0;
							break;
						} else { enviarNotificacionG(playerid, "No tienes nada en la mano"); break;}
					}
				}
			}
			else
			{

				if(listitem == 0) eligiendoBaul[playerid] = 0;
				else if(listitem == 1) eligiendoBaul[playerid] = 1;
				else if(listitem == 2) eligiendoBaul[playerid] = 2;
				else if(listitem == 3) eligiendoBaul[playerid] = 3;
				else if(listitem == 4) eligiendoBaul[playerid] = 4;
				else if(listitem == 5) eligiendoBaul[playerid] = 5;
				else if(listitem == 6) eligiendoBaul[playerid] = 6;
				else if(listitem == 7) eligiendoBaul[playerid] = 7;
				else if(listitem == 8) eligiendoBaul[playerid] = 8;
				
				if(vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]] != 0)
				{
					agregarIttem(playerid, vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]], vehInfo[attachandoA[playerid]][v_baulcant][eligiendoBaul[playerid]]);
					vehInfo[attachandoA[playerid]][v_baul][eligiendoBaul[playerid]] = 0;
					vehInfo[attachandoA[playerid]][v_baulcant][eligiendoBaul[playerid]] = 0;
					attachandoA[playerid] = 0;

					enviarNotificacionG(playerid, "Sacaste un objeto del maletero");

				}else enviarNotificacionG(playerid, "No tiene nada en esta ranura");
			}
		}
		case d_gps:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						new string1[200];
						new stringtotal[15000];
						for(new i;i<MAX_EMPRESAS;i++)
						{
							if(empresaInfo[i][e_tipo] != 0)
							{
								format(string1, 200, ""Chat_Gris"Tipo: %s,Nombre:"Chat_Phone"%s,"Chat_Gris" Distancia:%0.2f m \n", tipoEmpresas[empresaInfo[i][e_tipo]][tp_nombre], empresaInfo[i][e_nombre], GetPlayerDistanceFromPoint(playerid, empresaInfo[i][e_pos][0], empresaInfo[i][e_pos][1], empresaInfo[i][e_pos][2]));
								strcat(stringtotal, string1);
							}
						printf("create %i", index);}
						ShowPlayerDialog(playerid, d_gpsemp, DIALOG_STYLE_LIST, " "Chat_Phone" GPS", stringtotal, "Marcar en el GPS", "Cancelar");
					}
					case 1:
					{
						new string1[200];
						new stringtotal[10000];
						for(new i;i<MAX_NEGOCIOS;i++)
						{
							if(negocioInfo[i][n_tipo] != 0)
							{
								format(string1, 200, ""Chat_Gris"Tipo: %s,Nombre:"Chat_Phone"%s,"Chat_Gris" Distancia:%0.2f m \n", tipoNegocios[negocioInfo[i][n_tipo]][ne_nombre], negocioInfo[i][n_nombre], GetPlayerDistanceFromPoint(playerid, negocioInfo[i][n_pos][0], negocioInfo[i][n_pos][1], negocioInfo[i][n_pos][2]));
								strcat(stringtotal, string1);
							}
						}
						ShowPlayerDialog(playerid, d_gpsneg, DIALOG_STYLE_LIST, " "Chat_Phone" GPS", stringtotal, "Marcar en el GPS", "Cancelar");
					}
				}

			}
		}
		case d_gpsemp:
		{
			new i = listitem;
			new string[80];
			initRouteNavigator(playerid, empresaInfo[i][e_pos][0], empresaInfo[i][e_pos][1], empresaInfo[i][e_pos][2]);
			enviarNotificacionG(playerid, "Marcaste la ubicacion en el GPS");
			format(string, 80, "~w~ Distancia: ~y~~h~ %0.2f ~w~ m", GetPlayerDistanceFromPoint(playerid, empresaInfo[i][e_pos][0], empresaInfo[i][e_pos][1], empresaInfo[i][e_pos][2]));
			ShowInfoForPlayer(playerid, string, 3000);
		}
		case d_gpsneg:
		{
			new i = listitem;
			new string[80];
			initRouteNavigator(playerid, negocioInfo[i][n_pos][0], negocioInfo[i][n_pos][1], negocioInfo[i][n_pos][2]);
			enviarNotificacionG(playerid, "Marcaste la ubicacion en el GPS");
			format(string, 80, "~w~ Distancia: ~y~~h~ %0.2f ~w~ m", GetPlayerDistanceFromPoint(playerid, negocioInfo[i][n_pos][0], negocioInfo[i][n_pos][1], negocioInfo[i][n_pos][2]));
			ShowInfoForPlayer(playerid, string, 3000);
		}
    }*/
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{
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
/*


stock createIconEntrance(Float:x, Float:y, Float:z)
{
	new i;
	CreateDynamicObject(19135, x, y, z-0.3, 0.0, 0.0, 0.0, 0);
	i = CreateDynamicCircle(x, y, 3.0, 0);
	return i;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	return 1;
}*/