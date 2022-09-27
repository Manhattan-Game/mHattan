#include <YSI_Coding\y_hooks>


enum _tipo@Empresas
{
	tp_id,
	tp_nombre[80],
};
new tipoEmpresas[][_tipo@Empresas] =
{
	{0, "Nada"},
	{1, "Taxis"},
	{2, "Ensamblaje de vehiculos"},
	{3, "Fabrica de muebles"},
	{4, "Fabrica de ropa"},
	{5, "Cadena hotelera"},
	{6, "Transporte de productos"}
};


new pjEditando[MAX_PLAYERS], EmpEditando[MAX_PLAYERS], empInvitada[MAX_PLAYERS];



enum emps@infP
{
	e_id,
	e_mkid,
	e_nombre[80],
	Float:e_pos[8],
	e_puerta,
	e_vw,
	e_fondo,
	e_tipo,
	e_miembros,
	e_muebles,

	Float:e_puerta1[9],
	Float:e_puerta2[9],


	Float:e_trabajo[3],
	Float:e_casilleros[3],
	e_skin,
	e_puerta11,
	e_puerta22,
	bool:p1_state,
	bool:p2_state,

	e_pickup1,
	e_pickup2,
	Text3D:e_text,
	Text3D:e_text1,
	Text3D:e_text2,

	e_mueformat[50]
};

new empresaInfo[MAX_EMPRESAS][emps@infP];

hook OnGameModeInit()
{
	/*for(new d; d<100;d++)
	{
		cargarEmpresa(d);
	}*/
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_YES)
    {
    	for(new d;d<MAX_EMPRESAS;d++)
    	{
    		if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[d][e_pos][0], empresaInfo[d][e_pos][1], empresaInfo[d][e_pos][2]))
    		{
    			if(empresaInfo[d][e_vw] != GetPlayerVirtualWorld(playerid))
    			{
    				if(empresaInfo[d][e_puerta] == 0)
    				{
    					SetPlayerVirtualWorld(playerid, empresaInfo[d][e_vw]);
    					SetPlayerPos(playerid, empresaInfo[d][e_pos][4], empresaInfo[d][e_pos][5], empresaInfo[d][e_pos][6]);
    					SetPlayerFacingAngle(playerid, empresaInfo[d][e_pos][7]);
    					congelarUsuario(playerid, 3000);
    					break;
    				}
    				else { enviarNotificacionG(playerid, "La puerta se encuentra cerrada"); break;}
    			}
    		}
    		else if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[d][e_pos][4], empresaInfo[d][e_pos][5], empresaInfo[d][e_pos][6]))
    		{
    			if(empresaInfo[d][e_vw] == GetPlayerVirtualWorld(playerid))
    			{
    				if(empresaInfo[d][e_puerta] == 0)
    				{
    					SetPlayerVirtualWorld(playerid, 0);
    					SetPlayerPos(playerid, empresaInfo[d][e_pos][0], empresaInfo[d][e_pos][1], empresaInfo[d][e_pos][2]);
    					SetPlayerFacingAngle(playerid, empresaInfo[d][e_pos][3]);
    					congelarUsuario(playerid, 3000);
    					break;
    				} else { enviarNotificacionG(playerid, "La puerta se encuentra cerrada"); break;}
    			}
    		}
    		else if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[d][e_trabajo][0], empresaInfo[d][e_trabajo][1], empresaInfo[d][e_trabajo][2]))
    		{
    			if(personajeInfo[playerid][p_empresa] == empresaInfo[d][e_id])
    			{
    				trabajarEmp(playerid, d);
    			}
    		}
    	}
    }
}
hook OnXylosDialogResponse(playerid, dialogid, list, modelid)
{
	switch(dialogid)
	{
		case 1:
		{
			personajeInfo[playerid][p_empresa] = empInvitada[playerid];
			personajeInfo[playerid][p_empresarango] = 1; 
			enviarNotificacionG(playerid, "Te uniste a una empresa");
		}
		case 7:
		{
			new d = editandoCoche[playerid];
			vehInfo[d][v_empresa] = personajeInfo[playerid][p_empresa];
			editandoCoche[playerid] = 0;
			enviarNotificacionG(playerid, "Agregaste el vehiculo a tu empresa");
		}
	}
}

enum informacionsxasd
{
	info_d[20],
	info_sds
}; new infoXylos[MAX_PLAYERS][informacionsxasd];
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case d_empresa:
		{
			//{Retirar fondos \n Depositar fondos \n Editar puerta 1 \n Editar puerta 2 \n Gestionar Miembros
			if(response)
			{
				new string[128];
				new i = EmpEditando[playerid];
				switch(listitem)
				{
					case 0:
					{
						format(string, sizeof(string), "La empresa tiene "Chat_Verde"%i"Chat_Gris" en su caja fuerte", empresaInfo[i][e_fondo]);
						ShowPlayerDialog(playerid, d_empresaretirar, DIALOG_STYLE_INPUT, "Retirar fondos", string, "Retirar", "Atras");
					}
					case 1:
					{
						format(string, sizeof(string), "La empresa tiene "Chat_Verde"%i"Chat_Gris" en su caja fuerte", empresaInfo[i][e_fondo]);
						ShowPlayerDialog(playerid, d_empresadepositar, DIALOG_STYLE_INPUT, "Depositar fondos", string, "Depositar", "Atras");
					}
					case 2:
					{
						crearPuerta(playerid, i, 0);
					}
					case 3:
					{
						crearPuerta(playerid, i, 1);
					}
					case 4:
					{
						new count = 0;
						new tott[999];
						for(new h;h<MAX_PLAYERS;h++)
						{
							if(personajeInfo[h][p_empresa] == EmpEditando[playerid])
							{
								new sstring[60]; format(sstring, sizeof(sstring), "%i - %s \n", count, personajeInfo[h][p_nombre]);
								strcat(tott, sstring);
								count++;
								infoXylos[playerid][info_d][count] = h;
							}
						}
						ShowPlayerDialog(playerid, d_gestmiembros, DIALOG_STYLE_LIST, "Gestion de miembros", tott, "Seleccionar", "Atras");
					}
					case 5:
					{
						mostrarMueblesEmpresa(playerid, i);
					}
					case 6:
					{
						ShowPlayerDialog(playerid, d_gestskin, DIALOG_STYLE_INPUT, "Editar Skin de trabajo", "Ingresa el ID de el skin que deseas colocar", "Continuar", "Atras");
					}
					case 7:
					{
						new Float:x, Float:y, Float:z;
						GetPlayerPos(playerid, x, y, z);
						empresaInfo[i][e_casilleros][0] = x;
						empresaInfo[i][e_casilleros][1] = y;
						empresaInfo[i][e_casilleros][2] = z;
						DestroyDynamic3DTextLabel(empresaInfo[i][e_text2]);
						empresaInfo[i][e_text2] = CreateDynamic3DTextLabel(""Chat_Gris"Usa "Chat_Violeta"/servicio"Chat_Gris""  , -1, empresaInfo[i][e_casilleros][0], empresaInfo[i][e_casilleros][1], empresaInfo[i][e_casilleros][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, empresaInfo[i][e_vw], 0);
						enviarNotificacionG(playerid, "Actualizaste la posicion de los casilleros, usa /cambiarme");

					}
					case 8:
					{
						if(empresaInfo[i][e_puerta] == 0)
						{
							empresaInfo[i][e_puerta] = 1;
							enviarNotificacionG(playerid, "Cerraste las puertas de la empresa");
						}
						else
						{
							empresaInfo[i][e_puerta] = 0;
							enviarNotificacionG(playerid, "Abriste las puertas del local");
						}
					}
				}
			} else EmpEditando[playerid] = -1;
		}

		case d_empresaretirar:
		{
			new i = EmpEditando[playerid];
			if(response)
            {
                if(IsNumeric(inputtext))
                {
                    new namber = strval(inputtext);
                    if(namber < empresaInfo[i][e_fondo])
                    {
                    	empresaInfo[i][e_fondo] -= namber;
                    	personajeInfo[playerid][p_dinero] += namber;
                    	enviarNotificacionG(playerid, "Retiraste dinero de la empresa");

                    }else enviarNotificacionG(playerid, "La empresa no tiene ese dinero");
                }
            }
            else 
            { 
            	new title[80];
				format(title, sizeof(title), ""Chat_Radio"%s", empresaInfo[i][e_nombre]);
				ShowPlayerDialog(playerid, d_empresa, DIALOG_STYLE_LIST, title, ""Chat_Gris"Retirar fondos \nDepositar fondos \nEditar puerta 1 \n ditar puerta 2 \nGestionar Miembros \nMuebles\nEditar Skin de trabajo\nEditar posicion casilleros\n"Chat_Rojo"Abrir/Cerrar ", "Seleccionar", "Salir");
			}
		}
		case d_empresadepositar:
		{
			new i = EmpEditando[playerid];
			if(response)
            {
                if(IsNumeric(inputtext))
                {
                    new namber = strval(inputtext);
                    if(namber < personajeInfo[playerid][p_dinero])
                    {
                    	empresaInfo[i][e_fondo] += namber;
                    	personajeInfo[playerid][p_dinero] -= namber;
                    	enviarNotificacionG(playerid, "Depositaste dinero en la empresa");

                    }else enviarNotificacionG(playerid, "No tienes ese dinero");
                }
            }
            else 
            { 
            	new title[80];
				format(title, sizeof(title), ""Chat_Radio"%s", empresaInfo[i][e_nombre]);
				ShowPlayerDialog(playerid, d_empresa, DIALOG_STYLE_LIST, title, ""Chat_Gris" Retirar fondos \nDepositar fondos \nEditar puerta 1 \nEditar puerta 2 \nGestionar Miembros \nMuebles\nEditar Skin de trabajo\nEditar posicion casilleros\n"Chat_Rojo"Abrir/Cerrar ", "Seleccionar", "Salir");
			}
		}

		case d_gestmiembros:
		{
			if(response)
			{
				new string[28];
				pjEditando[playerid] = listitem;
				format(string, sizeof(string), "%s", personajeInfo[infoXylos[playerid][info_d][listitem]][p_nombre]);
				ShowPlayerDialog(playerid, d_editmember, DIALOG_STYLE_LIST, string, "Expulsar \nModificar Rango", "Siguiente", "Atras");
			}
			else 
            { 
            	new title[80];
				format(title, sizeof(title), ""Chat_Radio"%s", empresaInfo[EmpEditando[playerid]][e_nombre]);
				ShowPlayerDialog(playerid, d_empresa, DIALOG_STYLE_LIST, title, ""Chat_Gris" Retirar fondos \nDepositar fondos \nEditar puerta 1 \nEditar puerta 2 \nGestionar Miembros \nMuebles\nEditar Skin de trabajo\nEditar posicion casilleros\n"Chat_Rojo"Abrir/Cerrar ", "Seleccionar", "Salir");
			}
		}

		case d_editmember:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						new h = infoXylos[playerid][info_d][pjEditando[playerid]];
						personajeInfo[h][p_empresa] = -1;
						personajeInfo[h][p_empresarango] = 0;
						enviarNotificacionG(h, "Te expulsaron de tu empresa");
					}
					case 1:
					{
						new h = infoXylos[playerid][info_d][pjEditando[playerid]];
						new stringg[28];
						format(stringg, sizeof(stringg), "%s", conseguirNombre(h));
						ShowPlayerDialog(playerid, d_modifyrange, DIALOG_STYLE_INPUT, stringg, "Elige el numero del rango que deseas colocarle al jugador", "Terminar", "Cancelar");
					}
				}
			}
			else
			{
            	new title[80];
				format(title, sizeof(title), ""Chat_Radio"%s", empresaInfo[EmpEditando[playerid]][e_nombre]);
				ShowPlayerDialog(playerid, d_empresa, DIALOG_STYLE_LIST, title, ""Chat_Gris"Retirar fondos \nDepositar fondos \nEditar puerta 1 \nEditar puerta 2 \nGestionar Miembros \nMuebles\nEditar Skin de trabajo\nEditar posicion casilleros\n"Chat_Rojo"Abrir/Cerrar ", "Seleccionar", "Salir");
			}
		}
		case d_modifyrange:
		{
			if(response)
			{
				new namber = strval(inputtext);
                if(namber < 7)
                {
                	new h = infoXylos[playerid][info_d][pjEditando[playerid]];
                	personajeInfo[h][p_empresarango] = namber;
                	enviarNotificacionG(h, "Actualizaron el rango de tu empresa");
                }

			}		
		}
		case d_gestskin:
		{
			if(response)
			{
				new namber = strval(inputtext);
                if(namber < 300)
                {
                	new i = EmpEditando[playerid];
                	empresaInfo[i][e_skin] = namber;
                	enviarNotificacionG(playerid, "Editaste el skin de tu empresa");
                }

			}	
		}

	}
}
new timerVar[MAX_PLAYERS];


hook OP_PickUpDynamicPickup(playerid, pickupid)
{
	for(new i;i<MAX_EMPRESAS;i++)
	{
		if(pickupid == empresaInfo[i][e_pickup2])
		{
			if(timerVar[playerid] == 0)
			{
				ShowInfoForPlayer(playerid, "~w~ Pulsa~y~~h~ Y ~w~para salir", 3000);
				timerVar[playerid] = 1;
				SetTimerEx("timerPickup", 7000, false, "d", playerid);
				break;
			}
		}
	}
}
hook OP_EnterDynamicArea(playerid, areaid)
{
	for(new i;i<MAX_EMPRESAS;i++)
	{
		if(areaid == empresaInfo[i][e_pickup1])
		{
			
			if(timerVar[playerid] == 0)
			{
				
				ShowInfoForPlayer(playerid, "~w~ Pulsa~y~~h~ Y ~w~para entrar", 3000);
				timerVar[playerid] = 1;
				SetTimerEx("timerPickup", 7000, false, "d", playerid);
				break;
			}
		}
	}
}
forward timerPickup(playerid);
public timerPickup(playerid)
{
	timerVar[playerid] = 0;
}

cargarEmpresa(empid)
{
	new string[128];
	format(string, sizeof(string), ""Chat_Gris"[Empresa %i]\n "Chat_Violeta"Tipo %s\n "Chat_Phone" %s", empid, tipoEmpresas[empresaInfo[empid][e_tipo]][tp_nombre], empresaInfo[empid][e_nombre]);
	empresaInfo[empid][e_text] = CreateDynamic3DTextLabel(string, -1, empresaInfo[empid][e_pos][0], empresaInfo[empid][e_pos][1], empresaInfo[empid][e_pos][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
	empresaInfo[empid][e_text1] = CreateDynamic3DTextLabel(""Chat_Gris"Usa "Chat_Violeta"Y"Chat_Gris" para trabajar"  , -1, empresaInfo[empid][e_trabajo][0], empresaInfo[empid][e_trabajo][1], empresaInfo[empid][e_trabajo][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, empresaInfo[empid][e_vw], 0);
	empresaInfo[empid][e_text2] = CreateDynamic3DTextLabel(""Chat_Gris"Usa "Chat_Violeta"/servicio"Chat_Gris""  , -1, empresaInfo[empid][e_casilleros][0], empresaInfo[empid][e_casilleros][1], empresaInfo[empid][e_casilleros][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, empresaInfo[empid][e_vw], 0);
	
	empresaInfo[empid][e_pickup1] = createIconEntrance(empresaInfo[empid][e_pos][0], empresaInfo[empid][e_pos][1], empresaInfo[empid][e_pos][2]);
	empresaInfo[empid][e_pickup2] = CreateDynamicPickup(1318, 1, empresaInfo[empid][e_pos][4], empresaInfo[empid][e_pos][5], empresaInfo[empid][e_pos][6], empresaInfo[empid][e_vw], 0);

	empresaInfo[empid][e_puerta11] = CreateDynamicObject(1536, empresaInfo[empid][e_puerta1][0], empresaInfo[empid][e_puerta1][1], empresaInfo[empid][e_puerta1][2], empresaInfo[empid][e_puerta1][3], empresaInfo[empid][e_puerta1][4], empresaInfo[empid][e_puerta1][5], empresaInfo[empid][e_vw], empresaInfo[empid][e_vw], -1);
	empresaInfo[empid][e_puerta22] = CreateDynamicObject(1533, empresaInfo[empid][e_puerta2][0], empresaInfo[empid][e_puerta2][1], empresaInfo[empid][e_puerta2][2], empresaInfo[empid][e_puerta2][3], empresaInfo[empid][e_puerta2][4], empresaInfo[empid][e_puerta2][5], empresaInfo[empid][e_vw], empresaInfo[empid][e_vw], -1);
}



// COmandos usuario
cmd:puerta(playerid, params[])
{
	for(new i;i<MAX_EMPRESAS;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[i][e_puerta1][0], empresaInfo[i][e_puerta1][1], empresaInfo[i][e_puerta1][2]))
		{
			if(empresaInfo[i][e_vw] == GetPlayerVirtualWorld(playerid))
			{
				if(personajeInfo[playerid][p_empresa] == empresaInfo[i][e_id] && personajeInfo[playerid][p_empresarango] > 4)
				{
					if(empresaInfo[i][p1_state] == false)
					{

						MoveDynamicObject(empresaInfo[i][e_puerta11], empresaInfo[i][e_puerta1][6],empresaInfo[i][e_puerta1][7], empresaInfo[i][e_puerta1][8], 1.0, empresaInfo[i][e_puerta1][3],empresaInfo[i][e_puerta1][4], empresaInfo[i][e_puerta1][5]);
						empresaInfo[i][p1_state] = true;
						break;				
					}
					else
					{
						MoveDynamicObject(empresaInfo[i][e_puerta11], empresaInfo[i][e_puerta1][0],empresaInfo[i][e_puerta1][1], empresaInfo[i][e_puerta1][2], 1.0, empresaInfo[i][e_puerta1][3],empresaInfo[i][e_puerta1][4], empresaInfo[i][e_puerta1][5]);
						empresaInfo[i][p1_state] = false;
						break;
					}
				}
			}
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[i][e_puerta2][0], empresaInfo[i][e_puerta2][1], empresaInfo[i][e_puerta2][2]))
		{
			if(empresaInfo[i][e_vw] == GetPlayerVirtualWorld(playerid))
			{
				if(personajeInfo[playerid][p_empresa] == empresaInfo[i][e_id] && personajeInfo[playerid][p_empresarango] > 4)
				{
					if(empresaInfo[i][p2_state] == false)
					{

						MoveDynamicObject(empresaInfo[i][e_puerta22], empresaInfo[i][e_puerta2][6],empresaInfo[i][e_puerta2][7], empresaInfo[i][e_puerta2][8], 1.0, empresaInfo[i][e_puerta2][3],empresaInfo[i][e_puerta2][4], empresaInfo[i][e_puerta2][5]);
						empresaInfo[i][p2_state] = true;
						break;				
					}
					else
					{
						MoveDynamicObject(empresaInfo[i][e_puerta22], empresaInfo[i][e_puerta2][0],empresaInfo[i][e_puerta2][1], empresaInfo[i][e_puerta2][2], 1.0, empresaInfo[i][e_puerta2][3],empresaInfo[i][e_puerta2][4], empresaInfo[i][e_puerta2][5]);
						empresaInfo[i][p2_state] = false;
						break;
					}
				}
			}
		}
	}
		

	return 1;
}
cmd:invitar(playerid, params[])
{
	if(personajeInfo[playerid][p_empresarango] < 5) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
	{
		new id;
		if(sscanf(params, "i", id)) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" /invitar [id]");
		{
			if(personajeInfo[id][p_empresarango] <= 4)
			{
				new d = personajeInfo[playerid][p_empresa];
				new string[128];
				format(string, sizeof(string), "Te invitaron a unirte a la empresa (%s) toca Unirme par confirmar", empresaInfo[d][e_nombre]);
				ShowXylosDialog(id, 1, TYPE_MSG, "Invitacion", string, "Unirme");

				enviarNotificacionG(playerid, "Invitaste a un jugador");

				empInvitada[id] = empresaInfo[d][e_id];
			} else enviarNotificacionG(playerid, "No puedes invitar a este ID");
		}
	}
	return 1;
}
cmd:miempresa(playerid, params[])
{

	for(new i;i<MAX_EMPRESAS;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 20.0, empresaInfo[i][e_pos][4], empresaInfo[i][e_pos][5], empresaInfo[i][e_pos][6]))
		{
			if(empresaInfo[i][e_vw] == GetPlayerVirtualWorld(playerid))
			{
				if(personajeInfo[playerid][p_empresarango] > 5 && personajeInfo[playerid][p_empresa] == empresaInfo[i][e_id])
				{
					new title[80];
					format(title, sizeof(title), ""Chat_Phone"%s", empresaInfo[i][e_nombre]);
					ShowPlayerDialog(playerid, d_empresa, DIALOG_STYLE_LIST, title, ""Chat_Gris"Retirar fondos \nDepositar fondos \nEditar puerta 1 \nEditar puerta 2 \nGestionar Miembros \nMuebles\nEditar Skin de trabajo\nEditar posicion casilleros\n "Chat_Rojo"Abrir/Cerrar ", "Seleccionar", "Salir");
					EmpEditando[playerid] = i;
					break;
				}
			}
		}
	}
	return 1;
}
cmd:servicio(playerid, params[])
{
	for(new i;i<MAX_EMPRESAS;i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[i][e_casilleros][0], empresaInfo[i][e_casilleros][1], empresaInfo[i][e_casilleros][2]))
		{
			if(empresaInfo[i][e_vw] == GetPlayerVirtualWorld(playerid))
			{
				if(personajeInfo[playerid][p_empresarango] > 0 && personajeInfo[playerid][p_empresa] == empresaInfo[i][e_id])
				{
					if(personajeInfo[playerid][p_skin] != GetPlayerSkin(playerid))
					{
						SetPlayerSkin(playerid, personajeInfo[playerid][p_skin]);
						enviarNotificacionG(playerid, "Te quitaste tu ropa de trabajo");
					}
					else
					{
						SetPlayerSkin(playerid, empresaInfo[i][e_skin]);
						enviarNotificacionG(playerid, "Te pusiste tu ropa de trabajo");
					}
				}
			}
		}
	}
}
cmd:agregarvehiculo(playerid, params[])
{
	if(enVelocimetro[playerid] == true)
	{
		for(new u;u<MAX_VEHICLES;u++)
		{ 
			if(inventarioInfo[playerid][i_slot][8] == 20 && inventarioInfo[playerid][i_slotcant][8] == vehInfo[u][v_id])
			{
				new string[128];
				format(string, sizeof(string), "¿Seguro que quieres agregar el vehiculo ID:(%i) a la empresa?", vehInfo[u][v_id]);
				ShowXylosDialog(playerid, 7, TYPE_MSG, "Empresa", string, "Agregar");
				editandoCoche[playerid] = u;
				break;
			}
		}
	} else enviarNotificacionG(playerid, "Debes estar en un vehiculo");
	return 1;
}
// Administrador
cmd:crearempresa(playerid, params[])
{
	new nombre[80], tipo;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(masterInfo[playerid][_admin] <= 5) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
		if(sscanf(params,"s[80]i", nombre, tipo)) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" /crearempresa [Nombre] [Tipo]");
		{
			new Float:xx, Float:yy, Float:zz, Float:aa;
			new Float:x, Float:y, Float:z, Float:angle;
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, angle);
			new empid;
			for(new i;i<MAX_EMPRESAS;i++)
			{
				if(empresaInfo[i][e_tipo] == 0)
				{
					if(i == 0) i++;
					empid = i;
					break;
				}
			}
			switch(tipo)
			{
				case 1:
				{
					xx = -8435.79;
					yy = -3706.23;
					zz = 16.51;
					aa = 275.3655;
				}
			}

			format(empresaInfo[empid][e_nombre], 80, "%s", nombre);
			empresaInfo[empid][e_pos][0] = x;
			empresaInfo[empid][e_pos][1] = y;
			empresaInfo[empid][e_pos][2] = z;
			empresaInfo[empid][e_pos][3] = angle;

			empresaInfo[empid][e_pos][4] = xx;
			empresaInfo[empid][e_pos][5] = yy;
			empresaInfo[empid][e_pos][6] = zz;
			empresaInfo[empid][e_pos][7] = aa;
			empresaInfo[empid][e_vw] = empid;
			empresaInfo[empid][e_id] = empid;
			empresaInfo[empid][e_tipo] = tipo;
			cargarEmpresa(empid);
		}
	}
	return 1;
}

hook OP_EditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(response == EDIT_RESPONSE_FINAL)
	{
		if(pjEditando[playerid] == 1)
		{
			if(objectid == empresaInfo[EmpEditando[playerid]][e_puerta11])
			{
				new d = EmpEditando[playerid];
				empresaInfo[d][e_puerta1][0] = x;
				empresaInfo[d][e_puerta1][1] = y;
				empresaInfo[d][e_puerta1][2] = z;
				empresaInfo[d][e_puerta1][3] = rx;
				empresaInfo[d][e_puerta1][4] = ry;
				empresaInfo[d][e_puerta1][5] = rz;

				enviarNotificacion(playerid, "Elige la posicion abierta");
				pjEditando[playerid] = 2;
				EditDynamicObject(playerid, empresaInfo[d][e_puerta11]);
			}
			else if(objectid == empresaInfo[EmpEditando[playerid]][e_puerta22])
			{
				new d = EmpEditando[playerid];
				empresaInfo[d][e_puerta2][0] = x;
				empresaInfo[d][e_puerta2][1] = y;
				empresaInfo[d][e_puerta2][2] = z;
				empresaInfo[d][e_puerta2][3] = rx;
				empresaInfo[d][e_puerta2][4] = ry;
				empresaInfo[d][e_puerta2][5] = rz;

				enviarNotificacion(playerid, "Elige la posicion abierta");
				pjEditando[playerid] = 2;
				EditDynamicObject(playerid, empresaInfo[d][e_puerta22]);
			}
		}
		else if(pjEditando[playerid] == 2)
		{
			if(objectid == empresaInfo[EmpEditando[playerid]][e_puerta11])
			{
				new d = EmpEditando[playerid];
				empresaInfo[d][e_puerta1][6] = x;
				empresaInfo[d][e_puerta1][7] = y;
				empresaInfo[d][e_puerta1][8] = z;

				empresaInfo[d][p1_state] = true;
				enviarNotificacion(playerid, "Puerta Editada");
				EmpEditando[playerid] = -1;
				pjEditando[playerid] = -1;
			}
			else if(objectid == empresaInfo[EmpEditando[playerid]][e_puerta22])
			{
				new d = EmpEditando[playerid];
				empresaInfo[d][e_puerta2][6] = x;
				empresaInfo[d][e_puerta2][7] = y;
				empresaInfo[d][e_puerta2][8] = z;

				empresaInfo[d][p2_state] = true;
				enviarNotificacion(playerid, "Puerta Editada");
				EmpEditando[playerid] = -1;
				pjEditando[playerid] = -1;
			}
		}
	}
}
crearPuerta(playerid, id, tipo)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	switch(tipo)
	{
		case 0:
		{
			DestroyDynamicObject(empresaInfo[id][e_puerta11]);
			empresaInfo[id][e_puerta11] = CreateDynamicObject(1536, x, y, z, 1.000, 1.000, 1.000, GetPlayerVirtualWorld(playerid), 0, -1);
			EditDynamicObject(playerid, empresaInfo[id][e_puerta11]);
			pjEditando[playerid] = 1;
		}
		case 1:
		{
			DestroyDynamicObject(empresaInfo[id][e_puerta22]);
			empresaInfo[id][e_puerta22] = CreateDynamicObject(1533, x, y, z, 1.000, 1.000, 1.000, GetPlayerVirtualWorld(playerid), 0, -1);
			EditDynamicObject(playerid, empresaInfo[id][e_puerta22]);
			pjEditando[playerid] = 1;
		}

	}
	enviarNotificacion(playerid, "Elige la posicion cerrada");
	EmpEditando[playerid] = id;
}

trabajarEmp(playerid, empid)
{
	new string[128];
	switch(empresaInfo[empid][e_tipo])
	{
		case 1:
		{
			if(trabajoData[playerid][taxi_servicio] == false)
			{
				format(string, sizeof(string), ""Chat_Gris"Taxista disponible, Numero:"Chat_Phone"555");
				SendClientMessageToAll(-1, string);
				trabajoData[playerid][taxi_servicio] = true;
			}else enviarNotificacionG(playerid, "Ya te encuentras en servicio");
		}
	}
	SetPlayerSkin(playerid, empresaInfo[empid][e_skin]);
}
