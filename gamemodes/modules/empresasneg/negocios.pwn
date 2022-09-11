#include <YSI_Coding\y_hooks>
#define d_247 3
#define d_editP 4



enum type@negoc
{
	ne_id,
	ne_nombre[128]
};
new tipoNegocios[][type@negoc] = {
	{0, "Nada"},
	{1, "24/7"},
	{2, "Tienda de ropa"},
	{3, "Concesionario"},
	{5, "Gasolinera"}
};

enum neg_info
{
	n_id,
	n_mkid,
	n_mkid2,
	n_nombre[80],
	n_tipo,
	Float:n_pos[6],
	n_vw,


	n_item[8],
	n_itemprice[8],
	n_itemcant[8],
	n_nivel,

	n_price,
	n_puertas,

	n_cajafuerte,
	n_pNivel,

	Float:n_compra[3],
	

	n_pickup1,
	n_pickup2,
	Text3D:n_text1,
	Text3D:n_text2,
	n_timer

};
new negocioInfo[MAX_NEGOCIOS][neg_info];

new items247[5] = {11, 13, 14, 15, 16};
new itemsAmmu[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};


new negEditando[MAX_PLAYERS];
new itemEditando[MAX_PLAYERS];

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_YES)
    {
    	for(new i;i<MAX_NEGOCIOS;i++)
    	{
    		if(IsPlayerInRangeOfPoint(playerid, 2.5, negocioInfo[i][n_pos][0], negocioInfo[i][n_pos][1], negocioInfo[i][n_pos][2]))
    		{
    			if(negocioInfo[i][n_puertas] == 0)
    			{
    				SetPlayerPos(playerid, negocioInfo[i][n_pos][3], negocioInfo[i][n_pos][4], negocioInfo[i][n_pos][5]);
    				SetPlayerVirtualWorld(playerid, negocioInfo[i][n_vw]);
    				congelarUsuario(playerid, 3000);
    				break;
    			}else { enviarNotificacionG(playerid, "Las puertas se encuentran cerradas"); break;}
    		}
    		else if(IsPlayerInRangeOfPoint(playerid, 2.5, negocioInfo[i][n_pos][3], negocioInfo[i][n_pos][4], negocioInfo[i][n_pos][5]))
    		{
    			if(negocioInfo[i][n_vw] == GetPlayerVirtualWorld(playerid))
    			{
    				if(negocioInfo[i][n_puertas] == 0)
    				{
	    				SetPlayerPos(playerid, negocioInfo[i][n_pos][0], negocioInfo[i][n_pos][1], negocioInfo[i][n_pos][2]);
	    				SetPlayerVirtualWorld(playerid, 0);
	    				congelarUsuario(playerid, 3000);
	    				break;
	    			} else { enviarNotificacionG(playerid, "Las puertas se encuentran cerradas"); break;}
    			}
    		}
    		else if(IsPlayerInRangeOfPoint(playerid, 2.5, negocioInfo[i][n_compra][0], negocioInfo[i][n_compra][1], negocioInfo[i][n_compra][2]))
    		{
    			accionComprar(playerid, i);
    			break;
    		}
    	}
    }
}

cargarNegocio(id)
{
	new string[128];
	format(string, sizeof(string), " "Chat_Gris"[NEGOCIO %i]\n "Chat_Violeta"%s\n"Chat_Phone"%s",negocioInfo[id][n_id], tipoNegocios[negocioInfo[id][n_tipo]][ne_nombre], negocioInfo[id][n_nombre]);
	negocioInfo[id][n_text1] = CreateDynamic3DTextLabel(string, -1, negocioInfo[id][n_pos][0], negocioInfo[id][n_pos][1], negocioInfo[id][n_pos][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
	negocioInfo[id][n_text2] = CreateDynamic3DTextLabel("toca Y para comprar", -1, negocioInfo[id][n_compra][0], negocioInfo[id][n_compra][1], negocioInfo[id][n_compra][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, negocioInfo[id][n_vw]);



	negocioInfo[id][n_pickup1] = createIconEntrance(negocioInfo[id][n_pos][0], negocioInfo[id][n_pos][1], negocioInfo[id][n_pos][2]);
	negocioInfo[id][n_pickup2] = CreateDynamicPickup(1318, 1, negocioInfo[id][n_pos][3], negocioInfo[id][n_pos][4], negocioInfo[id][n_pos][5], negocioInfo[id][n_vw], 0);

	negocioInfo[id][n_timer] = SetTimerEx("timerNegocioCliente", 600000, true, "d", id);
}

accionComprar(playerid, negid)
{
	switch(negocioInfo[negid][n_tipo])
	{
		case 0:
		{
			formatXylosDialog(playerid, d_247, negocioInfo[negid][n_item][0], negocioInfo[negid][n_item][1], negocioInfo[negid][n_item][2] ,negocioInfo[negid][n_item][3] ,negocioInfo[negid][n_item][4] ,negocioInfo[negid][n_item][5] ,negocioInfo[negid][n_item][6] ,negocioInfo[negid][n_item][7]);
			ShowXylosDialog(playerid, d_247, TYPE_MODEL, "Tienda 24/7", "h", "Comprar");
		}
	}

}

forward timerNegocioCliente(id);
public timerNegocioCliente(id)
{
	switch(negocioInfo[id][n_pNivel])
	{
		case 0: negocioInfo[id][n_cajafuerte] += 1000;
		case 1: negocioInfo[id][n_cajafuerte] += 2000;
		case 2: negocioInfo[id][n_cajafuerte] += 3000;
	}
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case d_negocio:
		{
			if(response)
			{
				new string[128];
				new i = negEditando[playerid];
				switch(listitem)
				{
					case 0:
					{
						format(string, 128, "La empresa tiene "Chat_Verde"$%i"Chat_Gris" en su caja fuerte", negocioInfo[i][n_cajafuerte]);
						ShowPlayerDialog(playerid, d_negocioretirar, DIALOG_STYLE_INPUT, "Retirar fondos", string, "Retirar", "Atras");
					}
					case 1:
					{
						format(string, 128, "La empresa tiene "Chat_Verde"$%i"Chat_Gris" en su caja fuerte", negocioInfo[i][n_cajafuerte]);
						ShowPlayerDialog(playerid, d_negociodepositar, DIALOG_STYLE_INPUT, "Depositar fondos", string, "Retirar", "Atras");
					}
					case 2:
					{
						new Float:x, Float:y, Float:z;
						GetPlayerPos(playerid, x, y ,z);
						negocioInfo[i][n_compra][0] = x;
						negocioInfo[i][n_compra][1] = y;
						negocioInfo[i][n_compra][2] = z;
						DestroyDynamic3DTextLabel(negocioInfo[i][n_text2]);
						negocioInfo[i][n_text2] = CreateDynamic3DTextLabel("tecla Y para comprar", -1, negocioInfo[i][n_compra][0], negocioInfo[i][n_compra][1], negocioInfo[i][n_compra][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, negocioInfo[i][n_vw]);
						enviarNotificacionG(playerid, "Posicion actualizada");
					}
					case 3:
					{
						new str[999];
						new string1[128];
						for(new d;d<8;d++)
						{
							format(string1, sizeof(string1), "ID: %i, Nombre: %s, Precio: %i \n", d+1, objInfo[negocioInfo[i][n_item][d]][o_nombre], negocioInfo[i][n_itemprice][d]);
							strcat(str, string1);
						}				
						ShowPlayerDialog(playerid, d_negocioproduct, DIALOG_STYLE_LIST, ""Chat_Radio"Editar Productos", str, "Editar Tipo", "Editar Precio");	
					}
					case 4:
					{
						ShowInfoForPlayer(playerid, "Dirigete al almacen central", 3000);				
					}
					case 5:
					{
						if(negocioInfo[i][n_pNivel] < 3)
						{
							if(personajeInfo[playerid][p_dinero] > 30.000)
							{
								personajeInfo[playerid][p_dinero] -= 30000;
								negocioInfo[i][n_pNivel]++;
								enviarNotificacionG(playerid, "Tu negocio fue mejorado.");
							} else { enviarNotificacionG(playerid, "No tienes suficiente dinero($30.000)");}
						}else enviarNotificacionG(playerid, "Este negocio esta mejorado al maximo.");
					}
					case 6:
					{
						//mostrarMueblesNegocio(playerid, i);
					}
					case 7:
					{
						if(negocioInfo[i][n_puertas] == 0)
						{
							negocioInfo[i][n_puertas] = 1;
							enviarNotificacionG(playerid, "Cerraste las puertas del negocio");
						}
						else
						{
							negocioInfo[i][n_puertas] = 0;
							enviarNotificacionG(playerid, "Abriste las puertas del negocio");
						}

					}
				}
			} else { negEditando[playerid] = -1;}
		}
		case d_negocioretirar:
		{
			if(response)
			{
				if(IsNumeric(inputtext))
                {
                	new i = negEditando[playerid];
                    new namber = strval(inputtext);
                    if(namber < negocioInfo[i][n_cajafuerte])
                    {
                    	personajeInfo[playerid][p_dinero] += namber;
                    	negocioInfo[i][n_cajafuerte] -= namber;
                    	enviarNotificacionG(playerid, "Retiraste dinero de tu negocio");
                    	negEditando[playerid] = -1;
                    }
                }
			}
			else ShowPlayerDialog(playerid, d_negocio, DIALOG_STYLE_LIST, " "Chat_Phone"Menu de Negocio", ""Chat_Gris"Retirar fondos\nDepositar fondos\nEditar lugar de compra\nEditar productos\nPedir Stock\nMejorar NPC\nMuebles\n"Chat_Rojo"Abrir/Cerrar", "Seleccionar", "Cancelar");

		}
		case d_negociodepositar:
		{
			if(response)
			{
				if(IsNumeric(inputtext))
                {
                	new i = negEditando[playerid];
                    new namber = strval(inputtext);
                    if(namber < personajeInfo[playerid][p_dinero])
                    {
                    	personajeInfo[playerid][p_dinero] -= namber;
                    	negocioInfo[i][n_cajafuerte] += namber;
                    	enviarNotificacionG(playerid, "Depositaste dinero de tu negocio");
                    	negEditando[playerid] = -1;
                    }
                }

			}
			else ShowPlayerDialog(playerid, d_negocio, DIALOG_STYLE_LIST, " "Chat_Phone"Menu de Negocio", ""Chat_Gris"Retirar fondos\nDepositar fondos\nEditar lugar de compra\nEditar productos\nPedir Stock\nMejorar NPC\nMuebles\n"Chat_Rojo"Abrir/Cerrar", "Seleccionar", "Cancelar");
		}
		case d_negocioproduct:
		{
			itemEditando[playerid] = listitem;
			if(response)
			{
				new i = negEditando[playerid];
				new string[128];
				switch(negocioInfo[i][n_tipo])
				{
					case 1:
					{
						formatXylosDialog(playerid, d_editP, items247[0], items247[1], items247[2], items247[3], items247[4]);
						format(string, 128, "Productos 24/7");
					}
					case 2:
					{
						formatXylosDialog(playerid, d_editP, itemsAmmu[0], itemsAmmu[1], itemsAmmu[2], itemsAmmu[3], itemsAmmu[4], itemsAmmu[5], itemsAmmu[6], itemsAmmu[7], itemsAmmu[8], itemsAmmu[9]);
						format(string, 128, "Productos Ammunation");
					}
				}
				enviarNotificacionG(playerid, "Recuerda que al editar un tipo pierdes la cantidad");
				ShowXylosDialog(playerid, d_editP, TYPE_MODEL, string, " ", "Seleccionar");
			}
			else
			{
				ShowPlayerDialog(playerid, d_productPrice, DIALOG_STYLE_INPUT, "Editar precio", "Elige el nuevo precio de venta del producto seleccionado", "Aceptar", "Cancelar");
			}
		}
	}
}
hook OnXylosDialogResponse(playerid, dialogid, list, modelid)
{
	switch(dialogid)
	{
		case d_editP:
		{
			new i = negEditando[playerid];
			new d = itemEditando[playerid];
			negocioInfo[i][n_item][d] = modelid;
			negocioInfo[i][n_itemcant][d] = 0;
			negocioInfo[i][n_itemprice][d] = 0;
			enviarNotificacionG(playerid, "Actualizaste el tipo de producto");
			negEditando[playerid] = -1;
			itemEditando[playerid] = -1;
		}
	}
}
cmd:minegocio(playerid, params[])
{
	for(new i;i<MAX_NEGOCIOS;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 20.0, negocioInfo[i][n_pos][3], negocioInfo[i][n_pos][4], negocioInfo[i][n_pos][5]))
		{
			if(negocioInfo[i][n_mkid] == personajeInfo[playerid][p_listid] || negocioInfo[i][n_mkid2] == personajeInfo[playerid][p_listid])
			{
				if(negocioInfo[i][n_vw] == GetPlayerVirtualWorld(playerid))
				{
					new b[80]; format(b, 80, ""Chat_Phone" %s", negocioInfo[i][n_nombre]);
					ShowPlayerDialog(playerid, d_negocio, DIALOG_STYLE_LIST, " "Chat_Phone"Menu de Negocio", ""Chat_Gris"Retirar fondos\nDepositar fondos\nEditar lugar de compra\nEditar productos\nPedir Stock\nMejorar NPC\nMuebles\n"Chat_Rojo"Abrir/Cerrar", "Seleccionar", "Cancelar");
					negEditando[playerid] = i;
					break;
				}	
			}
			else
			{
				enviarNotificacionG(playerid, "No eres el propietario o afiliado");
				break;
			}
		}
	}
}


cmd:crearnegocio(playerid, params[])
{
	new nombre[80], tipo;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 5) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"s[80]i", nombre, tipo)) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" /crearnegocio [Nombre] [Tipo]");
		{
			new Float:xx, Float:yy, Float:zz;
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			new empid;
			for(new i;i<MAX_NEGOCIOS;i++)
			{
				if(negocioInfo[i][n_tipo] == 0)
				{
					empid = i;
					break;
				}
			}
			switch(tipo)
			{
				case 1:
				{
					xx = 305.2470;
					yy = -1514.1213;
					zz = 5.6959;
				}
			}
			format(negocioInfo[empid][n_nombre], 80, "%s", nombre);
			negocioInfo[empid][n_pos][0] = x;
			negocioInfo[empid][n_pos][1] = y;
			negocioInfo[empid][n_pos][2] = z;

			negocioInfo[empid][n_pos][3] = xx;
			negocioInfo[empid][n_pos][4] = yy;
			negocioInfo[empid][n_pos][5] = zz;

			negocioInfo[empid][n_vw] = empid;
			negocioInfo[empid][n_id] = empid;
			negocioInfo[empid][n_tipo] = tipo;
			negocioInfo[empid][n_mkid] = personajeInfo[playerid][p_listid];
			cargarNegocio(empid);
		}
	}
	return 1;
}