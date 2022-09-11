
// MALETIN
cmd:mguardar(playerid, params[])
{	
	if(inventarioInfo[playerid][i_slot][8] == 11)
	{	new cant;
		if(sscanf(params,"i", cant)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/mguardar [cant]");
		{
			if(cant >= personajeInfo[playerid][p_dinero]) return enviarNotificacion(playerid, "No tienes ese dinero");
			{
				personajeInfo[playerid][p_dinero] -= cant;
				inventarioInfo[playerid][i_slotcant][8] += cant;
				SendClientMessage(playerid, -1, ""Chat_Naranja"[MiamiSide]"Chat_Gris" guardaste dinero en tu maletin");

			}
		}
	} else enviarNotificacion(playerid, "debes tener un maletin en mano");
	return 1;
}


cmd:maletin(playerid, params[])
{
	if(inventarioInfo[playerid][i_slot][8] == 11)
	{
		new string[128];
		format(string, 128, "tienes $%i dolares guardados en tu maletin", inventarioInfo[playerid][i_slotcant][8]);
		enviarNotificacionG(playerid, string);
	} else enviarNotificacion(playerid, "debes tener un maletin en mano");
	return 1;
}

cmd:msacar(playerid, params[])
{	
	if(inventarioInfo[playerid][i_slot][8] == 11)
	{	new cant;
		if(sscanf(params,"i", cant)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/msacar [cant]");
		{
        	new total = cant + personajeInfo[playerid][p_dinero];
			if(total > MAX_DINERO_MANO) return enviarNotificacionG(playerid, "No puedes tener tanto dinero en mano(Usa un maletin)");
			if(cant >= inventarioInfo[playerid][i_slotcant][8]) return enviarNotificacion(playerid, "El maletin no tiene ese dinero");
			{
				personajeInfo[playerid][p_dinero] += cant;
				inventarioInfo[playerid][i_slotcant][8] -= cant;
				SendClientMessage(playerid, -1, ""Chat_Naranja"[MiamiSide]"Chat_Gris" sacaste dinero de tu maletin");

			}
		}
	} else enviarNotificacion(playerid, "debes tener un maletin en mano");
	return 1;
}
// RADIO
cmd:fr(playerid, params[])
{
	if(inventarioInfo[playerid][i_slot][8] == 13)
	{	new frecuencia;
		if(sscanf(params,"i", frecuencia)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/fr [Canal-ID]");
		{
			inventarioInfo[playerid][i_slotcant][8] = frecuencia;
			new string[128];
			format(string, 128, "Actualizaste la frecuencia a el canal ID:%i", frecuencia);
			enviarNotificacionG(playerid, string);
		}
	}else enviarNotificacion(playerid, "Debes tener una radio en la mano");
	return 1;
}

cmd:r(playerid, params[])
{
	new ra[250];
	new string[250];
	new string1[250];
	if(sscanf(params,"s[250]", ra)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/r [Texto]");
	{
		format(string, sizeof(string), ""Chat_Blanco"%s dice por radio:"Chat_Gris" %s", conseguirNombre(playerid), ra);
		enviarmensajeRol(playerid, 7, -1, string);
		for(new i;i<MAX_PLAYERS;i++)
		{
			if(personajeInfo[i][p_inventario] == 1)
			{
				for(new h;h<9;h++)
				{
					if(inventarioInfo[i][i_slotcant][h] == inventarioInfo[playerid][i_slotcant][h] && inventarioInfo[i][i_slot][h] == 13)
					{
						format(string1, sizeof(string1), ""Chat_Radio"[Radio (%s)]"Chat_Gris": %s", conseguirNombre(playerid), ra);
						SendClientMessage(i, -1, string1);
					}
				}
			}
		}
	}
	return 1;
}
// CLICKEAR
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == inventarioTDD[playerid][0])
	{
		setTextDraw(playerid, 0);
	}
	if(playertextid == inventarioTDD[playerid][1])
	{
		setTextDraw(playerid, 1);
	}
	if(playertextid == inventarioTDD[playerid][2])
	{
		setTextDraw(playerid, 2);
	}
	if(playertextid == inventarioTDD[playerid][3])
	{
		setTextDraw(playerid, 3);
	}
	if(playertextid == inventarioTDD[playerid][4])
	{
		setTextDraw(playerid, 4);
	}
	if(playertextid == inventarioTDD[playerid][5])
	{
		setTextDraw(playerid, 5);
	}
	if(playertextid == inventarioTDD[playerid][6])
	{
		setTextDraw(playerid, 6);
	}
	if(playertextid == inventarioTDD[playerid][7])
	{
		setTextDraw(playerid, 7);
	}
	if(playertextid == inventarioTDD[playerid][8])
	{
		if(usandoOBJ[playerid] == false)
		{
			usarItem(playerid, eligiendo[playerid]);
			updateHud(playerid);
		} else enviarNotificacion(playerid, "Ya estas usando un obj");
	}
	if(playertextid == inventarioTDD[playerid][10])
	{
		for(new j;j<13;j++) PlayerTextDrawHide(playerid, inventarioTDD[playerid][j]);
		TextDrawHideForPlayer(playerid, inventarioTD);
		inventarioInfo[playerid][i_viendo] = false;
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == inventarioTDD[playerid][12])
	{
		if(usandoOBJ[playerid] == true)
		{
			agregarIttem(playerid, inventarioInfo[playerid][i_slot][8], inventarioInfo[playerid][i_slotcant][8]);
			removerObjINV(playerid);
			inventarioInfo[playerid][i_slot][8] = 0;
			inventarioInfo[playerid][i_slotocup][8] = 0;
			inventarioInfo[playerid][i_slotcant][8] = 0;
			actualizarInv(playerid);
			updateHud(playerid);
			usandoOBJ[playerid] = false;

		} else enviarNotificacion(playerid, "No estas usando un obj");
	}
		return 1;
}




forward updateHud(playerid);
public updateHud(playerid)
{
	if(personajeInfo[playerid][p_spawn] == true)
	{

		PlayerTextDrawSetString(playerid,hudd[playerid][1], personajeInfo[playerid][p_nombre]);

		PlayerTextDrawSetPreviewModel(playerid, hudd[playerid][0], objInfo[inventarioInfo[playerid][i_slot][8]][o_model]);
		//PlayerTextDrawSetPreviewRot(playerid, hudd[playerid][0], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][0], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][1], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][2], objInfo[inventarioInfo[playerid][i_slot][8]][o_root][3]);
		PlayerTextDrawShow(playerid, hudd[playerid][0]);



		if(masterInfo[playerid][_exp] == 0){
			PlayerTextDrawSetString(playerid, hudd[playerid][3], "VIP_0");
		}
		else {
			PlayerTextDrawSetString(playerid, hudd[playerid][3], "VIP_1");
		}
		

		
	}
}



stock usarItem(playerid, slotid)
{
	if(inventarioInfo[playerid][i_slotocup][slotid] == 1)
	{
		inventarioInfo[playerid][i_slot][8] = inventarioInfo[playerid][i_slot][slotid];
		inventarioInfo[playerid][i_slotocup][8] = 1;
		inventarioInfo[playerid][i_slotcant][8] = inventarioInfo[playerid][i_slotcant][slotid];
		usandoOBJ[playerid] = true;
		if(inventarioInfo[playerid][i_slot][8] == 1)
		{
		    GivePlayerWeapon(playerid, 22, inventarioInfo[playerid][i_slotcant][8]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 2)
		{
		   	GivePlayerWeapon(playerid, 23, inventarioInfo[playerid][i_slotcant][slotid]);
        }
        else if(inventarioInfo[playerid][i_slot][slotid] == 3)
        {
	    	GivePlayerWeapon(playerid, 24, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 4)
		{
		    GivePlayerWeapon(playerid, 25, inventarioInfo[playerid][i_slotcant][8]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 5)
		{
		    GivePlayerWeapon(playerid, 28, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 6)
		{
		    GivePlayerWeapon(playerid, 29, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 7)
		{
		    GivePlayerWeapon(playerid, 31, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 8)
		{
		    GivePlayerWeapon(playerid, 30, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 9)
		{
		    GivePlayerWeapon(playerid, 33, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 10)
		{
		    GivePlayerWeapon(playerid, 34, inventarioInfo[playerid][i_slotcant][slotid]);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 11)
		{
			enviarNotificacionG(playerid, "usa /maletin, /mguardar, /msacar");
			SetPlayerAttachedObject(playerid, 0, 1210, 6, 0.303294, 0.081651, 0.010630, 0.000000, 270.000000, 0.000000);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 12)
		{
			inventarioInfo[playerid][i_slot][8] = 0;
			inventarioInfo[playerid][i_slotocup][8] = 0;
			inventarioInfo[playerid][i_slotcant][8] = 0;
			personajeInfo[playerid][p_dinero] += 5000;
			usandoOBJ[playerid] = false;
			enviarNotificacionG(playerid, "Gracias por jugar!, te dimos $5000 dolares.");
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 13)
		{
			enviarNotificacionG(playerid, "usa /fr y /r");
			SetPlayerAttachedObject(playerid, 0, 19942, 6, 0.063000, 0.012999, 0.038000, 0.000000, 0.000000, 176.199996, 1.000000, 1.000000, 1.000000);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 14)
		{
			ShowInfoForPlayer(playerid, "~w~ Pulsa ~y~ ~h~ BIR ~w~ para consumir", 3000);
			SetPlayerAttachedObject(playerid, 0, 19811, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 15)
		{
			ShowInfoForPlayer(playerid, "~w~ Pulsa ~y~ ~h~ BIR ~w~ para consumir", 3000);
			SetPlayerAttachedObject(playerid, 0, 19570, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 16)
		{
			ShowInfoForPlayer(playerid, "~w~ Pulsa ~y~ ~h~ BIR ~w~ para consumir", 3000);
			SetPlayerAttachedObject(playerid, 0, 19577, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 17)
		{
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SetPlayerAttachedObject(playerid, 0, 1271, 6, 0.003999, 0.462999, -0.044999, 155.099975, 3.499999, -13.500001, 1.000000, 1.000000, 1.000000);

		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 18)
		{
			SetPlayerAttachedObject(playerid, 0, 19627, 6, 0.062999, 0.024998, 0.057001, 108.700027, -3.899999, -87.500000, 1.000000, 1.000000, 1.000000);
		}
		else if(inventarioInfo[playerid][i_slot][slotid] == 19)
		{
			SetPlayerAttachedObject(playerid, 0, 18874, 6, 0.125998, 0.017997, -0.012999, 77.000030, -179.500000, -19.600006, 1.000000, 1.000000, 1.000000);
			ShowInfoForPlayer(playerid, "~w~ Pulsa ~y~ ~h~ H ~w~ para abrir tu Iphone", 3000);
		}


		PlayerTextDrawSetPreviewModel(playerid, inventarioTDD[playerid][11], objInfo[inventarioInfo[playerid][i_slot][slotid]][o_model]);


		inventarioInfo[playerid][i_slot][slotid] = 0; //Seteamos
		inventarioInfo[playerid][i_slotocup][slotid] = 0;
		inventarioInfo[playerid][i_slotcant][slotid] = 0;
		actualizarInv(playerid);
		updateHud(playerid);

	} else enviarNotificacion(playerid, "no tienes nada");
}
stock removerObjINV(playerid)
{
	if(inventarioInfo[playerid][i_slotocup][8] == 1)
	{
		if(inventarioInfo[playerid][i_slot][8] == 1) { ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 2) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 3) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 4) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 5) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0);}
		else if(inventarioInfo[playerid][i_slot][8] == 6) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0);} 
		else if(inventarioInfo[playerid][i_slot][8] == 7) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); } 
		else if(inventarioInfo[playerid][i_slot][8] == 8) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 9) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 10) {ResetPlayerWeapons(playerid); RemovePlayerAttachedObject(playerid, 0); }
		else if(inventarioInfo[playerid][i_slot][8] == 11)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 13)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 14)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 15)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 16)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 17)
		{
			RemovePlayerAttachedObject(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 18)
		{
			RemovePlayerAttachedObject(playerid, 0);
		}
		else if(inventarioInfo[playerid][i_slot][8] == 19)
		{
			RemovePlayerAttachedObject(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
}

cmd:edit(playerid, params[])
{
	EditAttachedObject(playerid, 0);
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ )
{
	if(response)
	{
		printf("coord: %f, %f, %f, %f, %f, %f, %f, %f, %f", fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);
	}
	return 1;
}
stock verifInventario(playerid)
{
	new i;
	for(i=0; i<8; i++)
	{
		if(inventarioInfo[playerid][i_slotocup][i] == 0)
		{break;}
		else i= 10;
	}
	return i;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{

	else if(newkeys == KEY_HANDBRAKE)
	{
		if(inventarioInfo[playerid][i_slot][8] == 14)
		{
			personajeInfo[playerid][p_hambre] += 20;
			inventarioInfo[playerid][i_slotcant][8] -= 1;
			enviarNotificacionG(playerid, "Consumiste una hamburguesa");
			ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,1,1,0,0);
			if(inventarioInfo[playerid][i_slotcant][8] == 0)
			{
				removerObjINV(playerid);
				inventarioInfo[playerid][i_slot][8] = 0;
				inventarioInfo[playerid][i_slotocup][8] = 0;
				inventarioInfo[playerid][i_slotcant][8] = 0;
				usandoOBJ[playerid] = false;
			}
		}
		else if(inventarioInfo[playerid][i_slot][8] == 15)
		{
			personajeInfo[playerid][p_sed] += 20;
			inventarioInfo[playerid][i_slotcant][8] -= 1;
			enviarNotificacionG(playerid, "Consumiste una botella de agua");
			ApplyAnimation(playerid,"VENDING","VEND_Use",1.4,0 ,1,1,0,2500,1);
			if(inventarioInfo[playerid][i_slotcant][8] == 0)
			{
				removerObjINV(playerid);
				inventarioInfo[playerid][i_slot][8] = 0;
				inventarioInfo[playerid][i_slotocup][8] = 0;
				inventarioInfo[playerid][i_slotcant][8] = 0;
				usandoOBJ[playerid] = false;
			}
		}
		else if(inventarioInfo[playerid][i_slot][8] == 16)
		{
			personajeInfo[playerid][p_sed] += 10;
			personajeInfo[playerid][p_hambre] += 10;
			inventarioInfo[playerid][i_slotcant][8] -= 1;
			enviarNotificacionG(playerid, "Consumiste una manzana");
			ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,1,1,0,0);
			if(inventarioInfo[playerid][i_slotcant][8] == 0)
			{
				removerObjINV(playerid);
				inventarioInfo[playerid][i_slot][8] = 0;
				inventarioInfo[playerid][i_slotocup][8] = 0;
				inventarioInfo[playerid][i_slotcant][8] = 0;
				usandoOBJ[playerid] = false;
			}
		}
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}






hook activarGuardado(playerid)
{
	if(inventarioInfo[playerid][i_slot][8] == 1)
    {
        if(inventarioInfo[playerid][i_slot][8] == 1)
        {
            GivePlayerWeapon(playerid, 22, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 2)
        {
            GivePlayerWeapon(playerid, 23, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 3)
        {
            GivePlayerWeapon(playerid, 24, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 4)
        {
            GivePlayerWeapon(playerid, 25, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 5)
        {
            GivePlayerWeapon(playerid, 28, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 6)
        {
            GivePlayerWeapon(playerid, 29, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 7)
        {
            GivePlayerWeapon(playerid, 31, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 8)
        {
            GivePlayerWeapon(playerid, 30, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 9)
        {
            GivePlayerWeapon(playerid, 33, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 10)
        {
            GivePlayerWeapon(playerid, 34, inventarioInfo[playerid][i_slotcant][8]);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 11)
        {
            enviarNotificacionG(playerid, "usa /maletin, /mguardar, /msacar");
            SetPlayerAttachedObject(playerid, 0, 1210, 6, 0.303294, 0.081651, 0.010630, 0.000000, 270.000000, 0.000000);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 12)
        {
            inventarioInfo[playerid][i_slot][8] = 0;
            inventarioInfo[playerid][i_slotocup][8] = 0;
            inventarioInfo[playerid][i_slotcant][8] = 0;
            personajeInfo[playerid][p_dinero] += 5000;
            usandoOBJ[playerid] = false;
            enviarNotificacionG(playerid, "Gracias por jugar!, te dimos $5000 dolares.");
        }
        else if(inventarioInfo[playerid][i_slot][8] == 13)
        {
            enviarNotificacionG(playerid, "usa /fr y /r");
            SetPlayerAttachedObject(playerid, 0, 19942, 6, 0.063000, 0.012999, 0.038000, 0.000000, 0.000000, 176.199996, 1.000000, 1.000000, 1.000000);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 14)
        {
            enviarNotificacionG(playerid, "Toca click derecho para consumir");
            SetPlayerAttachedObject(playerid, 0, 19811, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 15)
        {
            enviarNotificacionG(playerid, "Toca click derecho para consumir");
            SetPlayerAttachedObject(playerid, 0, 19570, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 16)
        {
            enviarNotificacionG(playerid, "Toca click derecho para consumir");
            SetPlayerAttachedObject(playerid, 0, 19577, 6, 0.0, 0.0, 0.01, 0.0, 0.0, 0.0);
        }
        else if(inventarioInfo[playerid][i_slot][8] == 17)
        {
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
            SetPlayerAttachedObject(playerid, 0, 1271, 6, 0.003999, 0.462999, -0.044999, 155.099975, 3.499999, -13.500001, 1.000000, 1.000000, 1.000000);

        }
        else if(inventarioInfo[playerid][i_slot][8] == 18)
        {
            SetPlayerAttachedObject(playerid, 0, 19627, 6, 0.062999, 0.024998, 0.057001, 108.700027, -3.899999, -87.500000, 1.000000, 1.000000, 1.000000);
        }
    }
}
