// MiamiSide por Xylospeed
//INCLUDES
#include <a_samp>
#include <a_mysql>
#include <easy-mysql>
#include <Pawn.cmd>
#include <sscanf2>
#include <pCamera>
#include <streamer>
#include <progress3D>
#include <YSF>
#include <xylosDialog>
#include <samp+>
#include <BroadwayBar>
#include <audio>
// MODULOS
/*Global*/
#include "../modulos/global/xylosTextdraw.pwn"
#include "../modulos/global/xylosEnum.pwn"
#include "../modulos/global/xylosVariables.pwn"
#include "../modulos/global/xylosRegister.pwn"
#include "../modulos/global/cmdAyuda.pwn"
/*sistemas*/

#include "../modulos/sistemas/necesidades.pwn"
#include "../modulos/sistemas/inventario.pwn"
#include "../modulos/sistemas/empresas.pwn"
#include "../modulos/sistemas/vehiculos.pwn"
#include "../modulos/sistemas/celular.pwn"
#include "../modulos/sistemas/casas.pwn"
#include "../modulos/sistemas/muebles.pwn"
/*Gobierno*/
#include "../modulos/gobierno/dates.pwn"
/*Comandos*/
#include "../modulos/comandos/AdmiCMD.pwn"
#include "../modulos/comandos/comandosgenerales.pwn"
/*utils*/
#include "../modulos/utils/xylosStock.pwn"
#include "../modulos/utils/xylosNotif.pwn"
#include "../modulos/utils/xylosActors.pwn"
/*Anticheat*/
#include "../modulos/anticheat/anticheat.pwn"

/* VIP*/
#include "../modulos/vip/boxSelect.pwn"
// COLORES
#define Chat_Rojo "{FF0000}"
//DIALOG's
main()
{
    
}
public OnGameModeInit()
{
	DisableInteriorEnterExits();
    EnableStuntBonusForAll(0);
    ShowPlayerMarkers(0);
    SetNameTagDrawDistance(23.75);
    ManualVehicleEngineAndLights();
    SetTimer("PayDay", 600000, false);
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
	personajeInfo[playerid][p_spawn] = false;
    return 1;
}
public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(result == -1)
    	{
       		SendClientMessage(playerid, -1, ""Chat_Rojo"[Error]"Chat_Gris" el comando no existe.");
        	return 0;
    	}
	} else enviarNotificacion(playerid, "Loguea primero");
    return 1;

}
public OnPlayerText(playerid, text[])
{
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(yaenllamada[playerid] == false)
		{
			new string[200];
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			for(new i;i<MAX_PLAYERS;i++)
			{
				if(IsPlayerInRangeOfPoint(i, 8.0, x, y, z))
				{
					format(string, 200, ""Chat_Gris"%s"Chat_Naranja"[ID:%i]"Chat_Gris" dice: %s", conseguirNombre(playerid), playerid, text);
					SendClientMessage(i, -1, string);
				}
			}
		}
		else
		{
			new string[200];
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			for(new i;i<MAX_PLAYERS;i++)
			{
				if(IsPlayerInRangeOfPoint(i, 8.0, x, y, z))
				{
					format(string, 200, ""Chat_Gris"%s"Chat_Phone"[ID:%i]"Chat_Gris" dice por telefono: %s", conseguirNombre(playerid), playerid, text);
					SendClientMessage(i, -1, string);
				}
			}
		}
	} else enviarNotificacion(playerid, "Loguea primero");
	return 0;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	for(new i=0; i<MAX_EMPRESAS; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[i][e_posx], empresaInfo[i][e_posy], empresaInfo[i][e_posz]))
		{
			if(pickupid == empresaInfo[i][e_pickup1])
			{

				if(empresaInfo[i][e_tipo] == 0) 
				{
					enviarNotificacionG(playerid, "Utiliza Y para entrar y H para usar una maquina");
					break;
				}
			}
		}
	}
	return 0;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case d_login:
        {
            if(response)
            {
                if(strlen(inputtext) < 15 && strlen(inputtext) > 100)
                {
                    ShowPlayerDialog(playerid, d_login, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa un password:", "continuar", ""Chat_Rojo" atras" );
                }
                else
                {
                    PlayerTextDrawSetString(playerid, TDEditor_PTD[playerid][1], inputtext);
                    SHA256_PassHash(inputtext, "", masterInfo[playerid][_password], 64);
                    masterInfo[playerid][_ver1] = true;
                }   

            }
            return 1;
        }
        case d_login2:
        {
            if(response)
            {
            	if(strfind(inputtext, "@hotmail.com", true) != -1)
        		{ 
	                if(strlen(inputtext) < 15 && strlen(inputtext) > 100)
	                {
	                    ShowPlayerDialog(playerid, d_login2, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa un correo(Formato:correo@hotmail.com):", "continuar", ""Chat_Rojo" atras");
	                }
	                else
	                {
	                    PlayerTextDrawSetString(playerid, TDEditor_PTD[playerid][4], inputtext);
	                    format(masterInfo[playerid][_correoe], 100, "%s", inputtext);
	                    masterInfo[playerid][_ver2] = true;
	                }
	            }
	            else ShowPlayerDialog(playerid, d_login2, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa un correo(Formato:correo@hotmail.com):", "continuar", ""Chat_Rojo" atras");
            }
            return 1;
        }
        case d_login3:
        {
            if(response)
            {
                if(strlen(inputtext) < 15 && strlen(inputtext) > 64)
                {
                    ShowPlayerDialog(playerid, d_login3, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa tu password:", "continuar", ""Chat_Rojo" atras");
                }
                else
                {
                    PlayerTextDrawSetString(playerid, TDEditor_PTD[playerid][1], "xxxxxxxxx");
                    format(compararpass[playerid], 129, "%s", inputtext);
                    masterInfo[playerid][_ver1] = true;
                }
            }
            return 1;
        }
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
    }
    return 1;
}
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	// Registro & Login
	if(playertextid == TDEditor_PTD[playerid][2])
	{ 
		if(playerid == INVALID_PLAYER_ID) return Kick(playerid);
		if(SQL::RowExistsEx("Master", "_nombre", conseguirNombre(playerid)))
        {
	       		if(masterInfo[playerid][_ver1] == true)
	        	{
		            new hash[128];
		            SHA256_PassHash(compararpass[playerid], "", hash, 128);
		            if(!strcmp(hash, masterInfo[playerid][_password]))
		            {
		            	new xylos[128];
		            	for(new i=1; i<3; i++) TextDrawHideForPlayer(playerid, TDEditor_TD[i]);
		            	for(new i=0; i<5; i++) PlayerTextDrawHide(playerid, TDEditor_PTD[playerid][i]);	
   						mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Master WHERE _nombre = '%e' ", conseguirNombre(playerid));
    					mysql_pquery(xylosMYSQL, xylos, "loguearUsuario", "d", playerid);
		            	enviarNotificacion(playerid, "Cuenta logueada");
		            	SetTimerEx("mostrarmenuPJ", 2000, false, "d", playerid);
		            }
		            else
		            {
		            	enviarNotificacion(playerid, "Password incorrecta");
		            }
	            } else enviarNotificacion(playerid, "termina todos los pasos");
        }
        else
        {
            if(masterInfo[playerid][_ver1] == true && masterInfo[playerid][_ver2] == true)
            {
            	//
			    new xylos[250];
			    mysql_format(xylosMYSQL, xylos, sizeof(xylos), "INSERT INTO Master(_nombre, _password, _exp, _admin, _personajes1, _personajes2, _personajes3, _whitelist, _correoe) VALUES ('%e', '%e', 0, 0, 0, 0, 0, 0, '%e' )",
			    conseguirNombre(playerid),  
			    masterInfo[playerid][_password],
			    masterInfo[playerid][_correoe]
			    );
			    mysql_pquery(xylosMYSQL, xylos, "registrarUsuario", "d", playerid);
			    //
			    SetTimerEx("logueardespues", 3000, false, "d", playerid);
                mostrarmenuPJ(playerid);
		        for(new i=1; i<3; i++) TextDrawHideForPlayer(playerid, TDEditor_TD[i]);
		        for(new i=0; i<5; i++) PlayerTextDrawHide(playerid, TDEditor_PTD[playerid][i]);		
                enviarNotificacion(playerid, "Cuenta registrada");
            }
            else enviarNotificacion(playerid, "termina todos los pasos");
        }
    }
    else if(playertextid == TDEditor_PTD[playerid][3])
    {
        Kick(playerid);
    }
	else if(playertextid == TDEditor_PTD[playerid][1])
    {
        if(SQL::RowExistsEx("Master", "_nombre", conseguirNombre(playerid)))
        {
            ShowPlayerDialog(playerid, d_login3, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa tu password:", "continuar", ""Chat_Rojo" atras");
        }
        else ShowPlayerDialog(playerid, d_login, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa una password:", "continuar", ""Chat_Rojo" atras");
    }
    else if(playertextid == TDEditor_PTD[playerid][4])
    {
        ShowPlayerDialog(playerid, d_login2, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa un correo(formato: correo@hotmail.com):", "continuar", ""Chat_Rojo" atras");
    }
    // Elegir PJ
    else if(playertextid == personajeplayer[playerid][3])
    {
    	if(masterInfo[playerid][_personajes1] == 1)
    	{
    		new xylos[70];
    		for(new i=0; i<6; i++) PlayerTextDrawHide(playerid, personajeplayer[playerid][i]);
			TextDrawHideForPlayer(playerid, personajeglobal[0]);
    		mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Personajes WHERE p_nombre = '%e' ", masterInfo[playerid][_personaje1]);
    		mysql_pquery(xylosMYSQL, xylos, "loguearPersonaje", "d", playerid);
    	}
    	else 
    	{
    		mostrarRegistro(playerid);
    		enviarNotificacion(playerid, "Crea un personaje");
    	}
    }
    else if(playertextid == personajeplayer[playerid][4])
    {
    	if(masterInfo[playerid][_personajes2] == 1)
    	{
    		new xylos[70];
    		for(new i=0; i<6; i++) PlayerTextDrawHide(playerid, personajeplayer[playerid][i]);
			TextDrawHideForPlayer(playerid, personajeglobal[0]);
    		mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Personajes WHERE p_nombre = '%e' ", masterInfo[playerid][_personaje2]);
    		mysql_pquery(xylosMYSQL, xylos, "loguearPersonaje", "d", playerid);

    	}
    	else
    	{
    		mostrarRegistro(playerid);
    		enviarNotificacion(playerid, "Crea un personaje");
    	}
    }
    else if(playertextid == personajeplayer[playerid][5])
    {
    	if(masterInfo[playerid][_exp] == 1)
    	{
	    	if(masterInfo[playerid][_personajes3] == 1)
	    	{
	    		new xylos[70];
	    		for(new i=0; i<6; i++) PlayerTextDrawHide(playerid, personajeplayer[playerid][i]);
				TextDrawHideForPlayer(playerid, personajeglobal[0]);
	    		mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Personajes WHERE p_nombre = '%e' ", masterInfo[playerid][_personaje3]);
	    		mysql_pquery(xylosMYSQL, xylos, "loguearPersonaje", "d", playerid);
	    	}
	    	else
	    	{
	    		mostrarRegistro(playerid);
	    		enviarNotificacion(playerid, "Crea un personaje");
	    	}

    	} else enviarNotificacion(playerid, "No eres un miembro VIP");

    }


	//CELULAR////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	else if(playertextid == phoneT[playerid][0])
	{
		for(new i;i<25;i++) PlayerTextDrawHide(playerid, phoneT[playerid][i]);
		for(new h;h<6;h++) TextDrawHideForPlayer(playerid, phoneTT[h]);
		playerViendoTextDraw[playerid] = false;
		CancelSelectTextDraw(playerid);
	}

	//Contactos
	else if(playertextid == phoneT[playerid][1])
	{
		for(new i=6;i<15;i++) PlayerTextDrawShow(playerid, phoneT[playerid][i]);
		TextDrawShowForPlayer(playerid, phoneTT[5]);
		TextDrawHideForPlayer(playerid, phoneTT[4]);
		for(new i=15;i<25;i++) PlayerTextDrawHide(playerid, phoneT[playerid][i]);
	}
	else if(playertextid == phoneT[playerid][12])
	{
		for(new i=6;i<25;i++) PlayerTextDrawHide(playerid, phoneT[playerid][i]);
		TextDrawHideForPlayer(playerid, phoneTT[5]);
		TextDrawShowForPlayer(playerid, phoneTT[4]);

	}
	else if(playertextid == phoneT[playerid][6])
	{
		eligiendoC[playerid] = 0;
	}
	else if(playertextid == phoneT[playerid][7])
	{
		eligiendoC[playerid] = 1;
	}
	else if(playertextid == phoneT[playerid][8])
	{
		eligiendoC[playerid] = 2;
	}
	else if(playertextid == phoneT[playerid][9])
	{
		eligiendoC[playerid] = 3;
	}
	else if(playertextid == phoneT[playerid][10])
	{
		eligiendoC[playerid] = 4;
	}
	else if(playertextid == phoneT[playerid][11])
	{
		eligiendoC[playerid] = 5;
	}
	else if(playertextid == phoneT[playerid][13])
	{
		if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactos][eligiendoC[playerid]] == 0)
		{
			ShowPlayerDialog(playerid, 5969, DIALOG_STYLE_INPUT, ""Chat_Naranja"[MiamiSide]"Chat_Gris" MiamiPhone-Contactos", "Ingresa el numero de telefono de tu nuevo contacto", ""Chat_Verde"Continuar", "");
		}
	}
	else if(playertextid == phoneT[playerid][14])
	{
		if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactos][eligiendoC[playerid]] != 0)
		{
			celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactos][eligiendoC[playerid]] = 0;
			switch(eligiendoC[playerid])
			{
				case 0: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre1], 28, "Nadie");
				case 1: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre2], 28, "Nadie");
				case 2: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre3], 28, "Nadie");
				case 3: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre4], 28, "Nadie");
				case 4: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre5], 28, "Nadie");
				case 5: format(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_contactonombre6], 28, "Nadie");
			}
			actualizarPhone(playerid, inventarioInfo[playerid][i_slotcant][8]);
			enviarNotificacionG(playerid, "Eliminaste un contacto");
		}
	}


	else if(playertextid == phoneT[playerid][2])
	{
		if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_sim] == 1)
		{
			if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_saldo] > 10)
			{
				ShowPlayerDialog(playerid, 5968, DIALOG_STYLE_INPUT, ""Chat_Naranja"[MiamiSide]"Chat_Gris" MiamiPhone-Llamar", "Ingresa el numero de telefono al que quieres llamar", ""Chat_Verde"Continuar", "");
			} else enviarNotificacionG(playerid, "No tienes saldo");
		} else enviarNotificacionG(playerid, "Necesitas una tarjeta SIM");
	}

	//MENSAJES
	else if(playertextid == phoneT[playerid][3])
	{
		if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_sim] == 1)
		{
			for(new h=6;h<15;h++)	PlayerTextDrawHide(playerid, phoneT[playerid][h]);
			for(new i=15;i<25;i++) PlayerTextDrawShow(playerid, phoneT[playerid][i]);
			TextDrawShowForPlayer(playerid, phoneTT[5]);
			TextDrawHideForPlayer(playerid, phoneTT[4]);
			PlayerTextDrawShow(playerid, phoneT[playerid][12]);
		}else enviarNotificacionG(playerid, "Necesitas una tarjeta SIM");
	}
	else if(playertextid == phoneT[playerid][15])
	{
		eligiendoM[playerid] = 0;
	}
	else if(playertextid == phoneT[playerid][16])
	{
		eligiendoM[playerid] = 1;
	}
	else if(playertextid == phoneT[playerid][17])
	{
		eligiendoM[playerid] = 2;
	}
	else if(playertextid == phoneT[playerid][18])
	{
		eligiendoM[playerid] = 3;
	}
	else if(playertextid == phoneT[playerid][19])
	{
		eligiendoM[playerid] = 4;
	}
	else if(playertextid == phoneT[playerid][20])
	{
		eligiendoM[playerid] = 5;
	}
	else if(playertextid == phoneT[playerid][21])
	{
		eligiendoM[playerid] = 6;
	}
	else if(playertextid == phoneT[playerid][22])
	{
		eligiendoM[playerid] = 7;
	}
	else if(playertextid == phoneT[playerid][23])
	{
		new string[128];
		switch(eligiendoM[playerid])
		{
			case 0:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje1]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
			case 1:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje2]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
			case 2:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje3]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
			case 3:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje4]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
			case 4:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje5]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
			case 5:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje6]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
			case 6:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje7]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
			case 7:
			{
				format(string, 128, "%s", celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_mensaje8]);
				ShowPlayerDialog(playerid, 60540, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[Miami-Side]"Chat_Gris" viendo mensaje", string, ""Chat_Verde"Continuar", "Cancelar");
			}
		}
	}
	else if(playertextid == phoneT[playerid][24])
	{
		if(yaenllamada[playerid] == false)
		{
			if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_sim] == 1)
			{
				if(celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_saldo] > 10)
				{
					ShowPlayerDialog(playerid, 5971, DIALOG_STYLE_INPUT, ""Chat_Naranja"[MiamiSide]"Chat_Gris" MiamiPhone Enviar-mensaje", "Ingresa el numero de telefono al que deseas enviarle un mensaje", ""Chat_Verde"Continuar", "");
				} else enviarNotificacionG(playerid, "No tienes saldo");
			} else enviarNotificacionG(playerid, "Necesitas una tarjeta SIM");
		}
	}




	else if(playertextid == phoneT[playerid][5])
	{
		if(llamando[playerid] == true)
		{
			enviarNotificacionG(playerid, "Atendiste el telefono, usa T para hablar");

			PlayerTextDrawSetString(playerid, phoneT[playerid][5], "Toca para colgar el telefono");

			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);

			enviarNotificacionG(EnLlamada[playerid], "Atendieron el telefono, usa T para hablar");

			yaenllamada[playerid] = true;
			yaenllamada[EnLlamada[playerid]] = true;

			KillTimer(timerLlamada[EnLlamada[playerid]]);
			ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,1,1,1,1,1);
			llamando[playerid] = false;
			llamando[EnLlamada[playerid]] = false;
		}
		else
		{
			ClearAnimations(playerid, 0);
			enviarNotificacionG(playerid, "Colgaste el telefono");
			enviarNotificacionG(EnLlamada[playerid], "Colgaron el telefono");
			PlayerTextDrawSetString(playerid, phoneT[playerid][5], "Llamada entrante, toca para atender");
			PlayerTextDrawHide(playerid, phoneT[playerid][5]);

			ClearAnimations(playerid);
			ClearAnimations(EnLlamada[playerid]);

			celularInfo[inventarioInfo[playerid][i_slotcant][8]][c_llamada] = false;
			celularInfo[inventarioInfo[EnLlamada[playerid]][i_slotcant][8]][c_llamada] = false;

			yaenllamada[playerid] = false;
			yaenllamada[EnLlamada[playerid]] = false;

			EnLlamada[EnLlamada[playerid]] = 0;
			EnLlamada[playerid] = 0;

		}
	}

	return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	/*if(clickedid == INVALID_TEXT_DRAW && playerViendoTextDraw[playerid] == true)
	{
		SelectTextDraw(playerid, 0x87868286);	
		enviarNotificacion(playerid, "Toca en el signo X para esconder un textdraw");	
	}*/
    return 1;
}
// FORWARD
forward cargarTextInicial(playerid);
public cargarTextInicial(playerid)
{
        if(SQL::RowExistsEx("Master", "_nombre", conseguirNombre(playerid)))
        {
            PlayerTextDrawSetString(playerid, TDEditor_PTD[playerid][2], "Loguear");
            for(new i=0; i<50; i++) { SendClientMessage(playerid, -1, ""); }
            for(new i=0; i<3; i++) { TextDrawShowForPlayer(playerid, TDEditor_TD[i]); }
            for(new i=0; i<4; i++) { PlayerTextDrawShow(playerid,TDEditor_PTD[playerid][i]); }
            PlayerTextDrawSetString(playerid, TDEditor_PTD[playerid][0], conseguirNombre(playerid));
            masterInfo[playerid][_ver1] = false;
            masterInfo[playerid][_ver2] = false;
            playerViendoTextDraw[playerid] = true;
            SelectTextDraw(playerid, 0x87868286);
        }
        else
        {
            for(new i=0; i<50; i++) { SendClientMessage(playerid, -1, ""); }
            for(new i=0; i<3; i++) { TextDrawShowForPlayer(playerid, TDEditor_TD[i]); }
            for(new i=0; i<5; i++) { PlayerTextDrawShow(playerid,TDEditor_PTD[playerid][i]); }
            PlayerTextDrawSetString(playerid, TDEditor_PTD[playerid][0], conseguirNombre(playerid));
            masterInfo[playerid][_ver1] = false;
            masterInfo[playerid][_ver2] = false;
            playerViendoTextDraw[playerid] = true;
            SelectTextDraw(playerid, 0x87868286);
            PlayerTextDrawSetString(playerid, TDEditor_PTD[playerid][2], "Registrar");
        }

        return true;
}

forward mostrarmenuPJ(playerid);
public mostrarmenuPJ(playerid)
{
	for(new i=0; i<6; i++) PlayerTextDrawShow(playerid, personajeplayer[playerid][i]);
	TextDrawShowForPlayer(playerid, personajeglobal[0]);

	TextDrawShowForPlayer(playerid, TDEditor_TD[0]);
	TextDrawHideForPlayer(playerid, cinematic[0]);
	TextDrawHideForPlayer(playerid, cinematic[1]);

	PlayerTextDrawHide(playerid, cinematic2[playerid]);

	playerViendoTextDraw[playerid] = true;
	SelectTextDraw(playerid, 0x87868286);
	if(masterInfo[playerid][_personajes1] == 1)
	{
			format(nombreSeleccion[playerid], 60 , "%s",  masterInfo[playerid][_personaje1]);
			new xylos = SQL::OpenEx(SQL::READ, "Personajes", "p_nombre", masterInfo[playerid][_personaje1]);
		    SQL::ReadInt(xylos, "p_skin", skinSeleccion[playerid]);
		    SQL::Close(xylos);
			PlayerTextDrawSetPreviewModel(playerid, personajeplayer[playerid][0], skinSeleccion[playerid]);
			PlayerTextDrawSetString(playerid, personajeplayer[playerid][3], nombreSeleccion[playerid]);
			PlayerTextDrawShow(playerid, personajeplayer[playerid][0]);
	}
	if(masterInfo[playerid][_personajes2] == 1)
	{
			format(nombreSeleccion[playerid], 60 , "%s",  masterInfo[playerid][_personaje2]);
			new xylos = SQL::OpenEx(SQL::READ, "Personajes", "p_nombre", masterInfo[playerid][_personaje2]);
		    SQL::ReadInt(xylos, "p_skin", skinSeleccion[playerid]);
		    SQL::Close(xylos);
			PlayerTextDrawSetPreviewModel(playerid, personajeplayer[playerid][1], skinSeleccion[playerid]);
			PlayerTextDrawSetString(playerid, personajeplayer[playerid][4], nombreSeleccion[playerid]);
			PlayerTextDrawShow(playerid, personajeplayer[playerid][1]);
	}
	if(masterInfo[playerid][_personajes3] == 1)
	{
			format(nombreSeleccion[playerid], 60 , "%s",  masterInfo[playerid][_personaje3]);
			new xylos = SQL::OpenEx(SQL::READ, "Personajes", "p_nombre", masterInfo[playerid][_personaje3]);
		    SQL::ReadInt(xylos, "p_skin", skinSeleccion[playerid]);
		    SQL::Close(xylos);
			PlayerTextDrawSetPreviewModel(playerid, personajeplayer[playerid][2], skinSeleccion[playerid]);
			PlayerTextDrawSetString(playerid, personajeplayer[playerid][5], nombreSeleccion[playerid]);
			PlayerTextDrawShow(playerid, personajeplayer[playerid][2]);
	}
	return 1;
}

forward logueardespues(playerid);
public logueardespues(playerid)
{
	new xylos[100];
	mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Master WHERE _nombre = '%e' ", conseguirNombre(playerid));
    mysql_pquery(xylosMYSQL, xylos, "loguearUsuario", "d", playerid);
}



cmd:pagodiario(playerid, params[])
{
	SetTimer("PayDay", 1000, false);
	return 1;
}

forward esconderNivel(playerid);
public esconderNivel(playerid)
{
	for(new i; i<4; i++) TextDrawHideForPlayer(playerid, subirnivel[i]);
}



