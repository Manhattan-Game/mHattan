#include <YSI_Coding\y_hooks>


DEFINE_HOOK_REPLACEMENT(PickUpDynamicPickup, _Pickup);

new sumattotal;
new bool:trabajando[MAX_PLAYERS];
new maquinaID[MAX_PLAYERS];
new empresaID[MAX_PLAYERS];
new progresoTrabajo[MAX_PLAYERS];

enum _tipo@Empresas
{
	tp_id,
	tp_icon,
	tp_nombre[80],
};
new tipoEmpresas[][_tipo@Empresas] =
{
	{0, 1279, "Produccion de ropa"},
	{1, 1275, "Transporte de ropa"}
};

enum maquinas_@
{
	ma_id,
	Float:ma_pos[3],
	Float:ma_poss[3]
};
new maquinasInfo[][maquinas_@] =
{
	{0, {1560.939575, 1024.244995, 2236.428466}, {1557.6797,1023.9532,2237.2563}},
	{1, {1560.939575, 1028.475463, 2236.428466}, {1558.0099,1028.5033,2237.2563}},
	{2, {1552.829833, 1028.475463, 2236.428466}, {1549.2532,1028.4781,2237.2563}},
	{3, {1552.679931, 1024.255737, 2236.428466}, {1548.9755,1024.1902,2237.2563}},
	{4, {1544.189819, 1021.035583, 2236.428466}, {1544.2767,1024.3567,2237.2563}},
	{5, {1544.258911, 1028.404785, 2236.428466}, {1544.4128,1031.7815,2237.2563}}
};


/*enum _emuebl@info
{
	me_id,
	me_mkid,
	me_tipo,
	Float:me_posx,
	Float:me_posy,
	Float:me_posz,
	Float:me_posx1,
	Float:me_posy2,
	Float:me_posz3,
	me_vw,
	me_in,
	me_spawneado
};
new mueblesInfo[MAX_MUEBLE_EMPRESAS][_emuebl@info];*/




enum _empr@info
{
	e_id,
	e_nombre[80],
	e_hab,
	e_rango1[80],
	e_rango2[80],
	e_rango3[80],
	e_rango4[80],
	e_rango5[80],
	e_rango6[80],
	e_tipo,
	Float:e_posx,
	Float:e_posy,
	Float:e_posz,
	Float:e_posx1,
	Float:e_posy2,
	Float:e_posz3,
	e_vw,
	e_miembros,
	e_muebles,
	e_prod,
	e_pickup1,
	e_pickup2,


	Text3D:e_maquina[7],
	Bar3D:e_bar[7],

	Text3D:e_label1,
	Text3D:e_label2,
	e_timer,
	bool:e_cargada
};
new empresaInfo[MAX_EMPRESAS][_empr@info];

hook OnGameModeInit()
{
	for(new i;i<MAX_EMPRESAS;i++)
	{
		cargarEmpresas(i);
	}
	printf("Se cargaron un total de %i/%i empresas", sumattotal, MAX_EMPRESAS);
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnGameModeExit()
{
	for(new i;i<MAX_EMPRESAS;i++) guardarEmpresa(i);
	return Y_HOOKS_CONTINUE_RETURN_1;
}
stock cargarEmpresas(i)
{
		new string[80];
		if(SQL::RowExists("Empresas", "e_id", i))
		{
			if(empresaInfo[i][e_cargada] == false)
			{
				new xylos = SQL::Open(SQL::READ, "Empresas", "e_id", i);
				SQL::ReadInt(xylos, "e_id", empresaInfo[i][e_id]);
				SQL::ReadString(xylos, "e_nombre", empresaInfo[i][e_nombre]);
				SQL::ReadString(xylos, "e_hab", empresaInfo[i][e_hab]);

				SQL::ReadString(xylos, "e_rango1", empresaInfo[i][e_rango1]);
				SQL::ReadString(xylos, "e_rango2", empresaInfo[i][e_rango2]);
				SQL::ReadString(xylos, "e_rango3", empresaInfo[i][e_rango3]);
				SQL::ReadString(xylos, "e_rango4", empresaInfo[i][e_rango4]);
				SQL::ReadString(xylos, "e_rango5", empresaInfo[i][e_rango5]);
				SQL::ReadString(xylos, "e_rango6", empresaInfo[i][e_rango6]);

				SQL::ReadInt(xylos, "e_tipo", empresaInfo[i][e_tipo]);

				SQL::ReadFloat(xylos, "e_posx", empresaInfo[i][e_posx]);
				SQL::ReadFloat(xylos, "e_posy", empresaInfo[i][e_posy]);
				SQL::ReadFloat(xylos, "e_posz", empresaInfo[i][e_posz]);
				SQL::ReadFloat(xylos, "e_posx1", empresaInfo[i][e_posx1]);
				SQL::ReadFloat(xylos, "e_posy2", empresaInfo[i][e_posy2]);
				SQL::ReadFloat(xylos, "e_posz3", empresaInfo[i][e_posz3]);

				SQL::ReadInt(xylos, "e_vw", empresaInfo[i][e_vw]);
				SQL::ReadInt(xylos, "e_miembros", empresaInfo[i][e_miembros]);
				SQL::ReadInt(xylos, "e_muebles", empresaInfo[i][e_muebles]);
				SQL::ReadInt(xylos, "e_prod", empresaInfo[i][e_prod]);

				empresaInfo[i][e_pickup1] = CreateDynamicPickup(tipoEmpresas[empresaInfo[i][e_tipo]][tp_icon], 1, empresaInfo[i][e_posx], empresaInfo[i][e_posy], empresaInfo[i][e_posz], 0);
				empresaInfo[i][e_pickup2] = CreateDynamicPickup(1318, 1, empresaInfo[i][e_posx1], empresaInfo[i][e_posy2], empresaInfo[i][e_posz3], empresaInfo[i][e_vw]);

				format(string, 80, ""Chat_Gris"Empresa: "Chat_Radio"%s", tipoEmpresas[empresaInfo[i][e_tipo]][tp_nombre]);

				empresaInfo[i][e_label1] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, empresaInfo[i][e_posx], empresaInfo[i][e_posy], empresaInfo[i][e_posz], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0);
				empresaInfo[i][e_label2] = CreateDynamic3DTextLabel(""Chat_Gris" presiona Y para salir", 0xFFFFFFFF, empresaInfo[i][e_posx1], empresaInfo[i][e_posy2], empresaInfo[i][e_posz3], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, empresaInfo[i][e_vw]);
				if(empresaInfo[i][e_tipo] == 0)
				{
					new stringg[60];																	
					for(new h;h<6;h++)
					{
						format(stringg, 60, "Maquina "Chat_Radio"%i", h);
						empresaInfo[i][e_maquina][h] = CreateDynamic3DTextLabel(stringg, 0xFFFFFFFF, maquinasInfo[h][ma_pos][0], maquinasInfo[h][ma_pos][1], maquinasInfo[h][ma_pos][2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, empresaInfo[i][e_vw]);
					}
				}

				empresaInfo[i][e_cargada] = true;
				sumattotal++;
			}
		}
}

forward guardarEmpresa(i);
public guardarEmpresa(i)
{
	if(empresaInfo[i][e_cargada] == true)
	{
		new xylos[500];
		mysql_format(xylosMYSQL, xylos, sizeof(xylos), "UPDATE `Empresas` SET `e_nombre` ='%e', `e_hab` ='%d', `e_rango1` ='%e', `e_rango2` ='%e', `e_rango3` ='%e', `e_rango4` ='%e', `e_rango5` ='%e' ,`e_rango6` ='%e', `e_tipo` ='%d', `e_posx` ='%f', `e_posy` ='%f', `e_posz` ='%f', `e_posx1` ='%f', `e_posy2` ='%f', `e_posz3` ='%f', `e_vw` ='%d', `e_miembros` ='%d', `e_muebles` ='%d', `e_prod` ='%d' WHERE `e_id`='%d' LIMIT 1",
		empresaInfo[i][e_nombre],
		empresaInfo[i][e_hab],
		empresaInfo[i][e_rango1],
		empresaInfo[i][e_rango2],
		empresaInfo[i][e_rango3],
		empresaInfo[i][e_rango4],
		empresaInfo[i][e_rango5],
		empresaInfo[i][e_rango6],
		empresaInfo[i][e_tipo],
		empresaInfo[i][e_posx],
		empresaInfo[i][e_posy],
		empresaInfo[i][e_posz],
		empresaInfo[i][e_posx1],
		empresaInfo[i][e_posy2],
		empresaInfo[i][e_posz3],
		empresaInfo[i][e_vw],
		empresaInfo[i][e_miembros],
		empresaInfo[i][e_muebles],
		empresaInfo[i][e_prod], empresaInfo[i][e_id]);
		mysql_query(xylosMYSQL, xylos);
	}
	else 
	{
		empresaInfo[i][e_hab] = 0;
		empresaInfo[i][e_tipo] = 0;
		empresaInfo[i][e_posx] = 0.0;
		empresaInfo[i][e_posy] = 0.0;
		empresaInfo[i][e_posz] = 0.0;
		empresaInfo[i][e_posx1] = 0.0;
		empresaInfo[i][e_posy2] = 0.0;
		empresaInfo[i][e_posz3] = 0.0;
		empresaInfo[i][e_vw] = 0;
		empresaInfo[i][e_miembros] = 0;
		empresaInfo[i][e_muebles] = 0;


		DestroyDynamicPickup(empresaInfo[i][e_pickup1]);
		DestroyDynamicPickup(empresaInfo[i][e_pickup2]);
		DestroyDynamic3DTextLabel(empresaInfo[i][e_label1]);
		DestroyDynamic3DTextLabel(empresaInfo[i][e_label2]);
	}
}
stock editarEmpresa(id, opcion, Float:x, Float:y, Float:z, const rango[80])
{
	switch(opcion)
	{
		case 0:
		{
			empresaInfo[id][e_posx1] = x;
			empresaInfo[id][e_posy2] = y;
			empresaInfo[id][e_posz3] = z;	
		}
		case 1: empresaInfo[id][e_rango1] = rango;
		case 2: empresaInfo[id][e_rango2] = rango;
		case 3: empresaInfo[id][e_rango3] = rango;
		case 4: empresaInfo[id][e_rango4] = rango;
		case 5: empresaInfo[id][e_rango5] = rango;
		case 6: empresaInfo[id][e_rango6] = rango;
		case 7: empresaInfo[id][e_nombre] = rango;
	}

}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_YES)
	{
		for(new i; i<MAX_EMPRESAS; i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, empresaInfo[i][e_posx], empresaInfo[i][e_posy], empresaInfo[i][e_posz]))
			{
				congelarUsuario(playerid, 5000);
				SetPlayerPos(playerid, empresaInfo[i][e_posx1], empresaInfo[i][e_posy2], empresaInfo[i][e_posz3]);
				SetPlayerVirtualWorld(playerid, empresaInfo[i][e_vw]);
				break;
			}
			else if(IsPlayerInRangeOfPoint(playerid, 1.5, empresaInfo[i][e_posx1], empresaInfo[i][e_posy2], empresaInfo[i][e_posz3]))
			{
				new virtualworld = GetPlayerVirtualWorld(playerid);
				if(virtualworld == empresaInfo[i][e_vw])
				{
					congelarUsuario(playerid, 5000);
					SetPlayerPos(playerid, empresaInfo[i][e_posx], empresaInfo[i][e_posy], empresaInfo[i][e_posz]);
					SetPlayerVirtualWorld(playerid, 0);
					break;
				}
			}
		}
	}
	else if(newkeys == KEY_CTRL_BACK)
	{
		for(new i;i<MAX_EMPRESAS;i++)
		{
			if(personajeInfo[playerid][p_empresa] == empresaInfo[i][e_id])
			if(empresaInfo[i][e_tipo]==0)
			{
				for(new h;h<6;h++)
				{
					new vw = GetPlayerVirtualWorld(playerid);
					if(vw == empresaInfo[i][e_vw])
					if(IsPlayerInRangeOfPoint(playerid, 2.5, maquinasInfo[h][ma_pos][0], maquinasInfo[h][ma_pos][1], maquinasInfo[h][ma_pos][2]))
					{
						trabajoEmp(playerid, empresaInfo[i][e_tipo], i, h);
						break;
					}
				}
			}
		}
	}
	else if(newkeys == KEY_SECONDARY_ATTACK)
	{
		if(trabajando[playerid] == true)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.5, maquinasInfo[maquinaID[playerid]][ma_pos][0], maquinasInfo[maquinaID[playerid]][ma_pos][1], maquinasInfo[maquinaID[playerid]][ma_pos][2]))
			{
				new vw = GetPlayerVirtualWorld(playerid);
				if(vw == empresaInfo[empresaID[playerid]][e_vw])
				{
					if(inventarioInfo[playerid][i_slot][8] == 18)
					{
						if(progresoTrabajo[playerid] == 90)
						{
							DestroyProgressBar3D(empresaInfo[ empresaID[playerid] ][e_bar][maquinaID[playerid]]);
							for(new i;i<MAX_OBJETOS_TIRADOS; i++)
							{
								if(objetosTirados[i][ot_used] == false)
								{ 
									objetosTirados[i][ot_used] = true;
									objetosTirados[i][ot_x] = maquinasInfo[maquinaID[playerid]][ma_poss][0]; //+ 17.0;
									objetosTirados[i][ot_y] = maquinasInfo[maquinaID[playerid]][ma_poss][1]; //+ 4.0;
									objetosTirados[i][ot_z] = maquinasInfo[maquinaID[playerid]][ma_poss][2]; //+1.0;
									objetosTirados[i][ot_model] = 17;
									objetosTirados[i][ot_cantidad] = 1;
									objetosTirados[i][ot_vw] = GetPlayerVirtualWorld(playerid);
									obJtirados[i] =	CreateDynamicObject(1271 , maquinasInfo[maquinaID[playerid]][ma_poss][0], maquinasInfo[maquinaID[playerid]][ma_poss][1], maquinasInfo[maquinaID[playerid]][ma_poss][2] -0.60, 90.0, 90.0, 0.0, objetosTirados[i][ot_vw], -1, -1, 15);
									labelObjetos[i] = CreateDynamic3DTextLabel(""Chat_Gris"Pulsa Y"Chat_Radio" (Caja de ropa)", 0xFFFFFFFF, maquinasInfo[maquinaID[playerid]][ma_poss][0], maquinasInfo[maquinaID[playerid]][ma_poss][1], maquinasInfo[maquinaID[playerid]][ma_poss][2]-0.60, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, objetosTirados[i][ot_vw]);
									trabajando[playerid] = false;		
									break;
								}
							}
						}
						else
						{
							progresoTrabajo[playerid] += 2;
							SetProgressBar3DValue(empresaInfo[ empresaID[playerid] ][e_bar][maquinaID[playerid]], progresoTrabajo[playerid]);
						}
						ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);

					} else enviarNotificacionG(playerid, "Debes tener una llave francesa en mano");
				}
			} else enviarNotificacionG(playerid, "No te encuentras en la maquina que encendiste");
		}
	}
	return 1;
}




cmd:invitar(playerid, params[])
{
	new id;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(personajeInfo[playerid][p_empresarango] <= 5) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" Solo los lideres y sublideres pueden invitar");
		if(sscanf(params,"i", id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/invitar [id]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		{
			new string[128];
			format(string, 128, ""Chat_Gris"Fuiste invitado a unirte a la empresa tipo: "Chat_Radio"%s"Chat_Gris"(%s)", tipoEmpresas[empresaInfo[personajeInfo[playerid][p_empresa]][e_tipo]][tp_nombre], empresaInfo[personajeInfo[playerid][p_empresa]][e_nombre]);
			ShowPlayerDialog(id, 4554, DIALOG_STYLE_MSGBOX, ""Chat_Naranja"[MiamiSide]"Chat_Gris" Tienes una invitacion!", string, ""Chat_Verde"Unirme", "Salir");
			invitar[id] = playerid;
		}
	}
	return 1;
}
cmd:expulsar(playerid, params[])
{
	new id;
	if(personajeInfo[playerid][p_spawn] == true)
	{
		if(personajeInfo[playerid][p_empresarango] <= 5) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" Solo los lideres y sublideres pueden expulsar");
		if(sscanf(params,"i", id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris"/expulsar [id]");
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" jugador no conectado");
		{
			if(personajeInfo[playerid][p_empresa] == personajeInfo[id][p_empresa]) return SendClientMessage(playerid, -1, ""Chat_Violeta"[error]"Chat_Gris" Este jugador no pertenece a tu empresa");
			if(personajeInfo[id][p_empresarango] >= 5 || personajeInfo[playerid][p_empresarango] == 6)
			{
				personajeInfo[id][p_empresa] = 0;
				personajeInfo[id][p_empresarango] = 0;
				enviarNotificacionG(id, "Fuiste expulsado de tu ex-empresa");
				for(new i; i<MAX_PLAYERS;i++)
				{
					if(personajeInfo[playerid][p_empresa] == personajeInfo[i][p_empresa]) enviarNotificacionG(i, "Aviso:Un jugador fue expulsado de la empresa");
				}
			}
		}
	}
	return 1;
}



hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case 4554:
		{
			if(response)
			{
				personajeInfo[playerid][p_empresa] = personajeInfo[invitar[playerid]][p_empresa];
				personajeInfo[playerid][p_empresarango] = 1;
				enviarNotificacionG(playerid, "¡Felicitaciones te uniste a una nueva empresa!");
				for(new i; i<MAX_PLAYERS;i++)
				{
					if(personajeInfo[playerid][p_empresa] == personajeInfo[i][p_empresa]) enviarNotificacionG(i, "Aviso:Un nuevo jugador se unio a la empresa");
				}
			}
		}
	}

	return 1;
}

stock trabajoEmp(playerid, id, empid, mid)
{
	if(personajeInfo[playerid][p_empresa] == empresaInfo[empid][e_id])
	{
		if(id == 0)
		{
			if(inventarioInfo[playerid][i_slot][8] == 18)
			{
				if(trabajando[playerid] == false)
				{
					new string[150];
					empresaInfo[empid][e_bar][mid] = CreateProgressBar3D(maquinasInfo[mid][ma_pos][0], maquinasInfo[mid][ma_pos][1], maquinasInfo[mid][ma_pos][2], BAR_3D_LAYOUT_NORMAL, 0xFFFFFFFF, 0xFF0000FF, 100.0, 0.0, 10.0);
					format(string, 150, "Encendiste la maquina %i, usa la tecla Enter para usar tu llave francesa", mid);
					enviarNotificacionG(playerid, string);
					trabajando[playerid] = true;
					maquinaID[playerid] = mid;
					empresaID[playerid] = empid;
					progresoTrabajo[playerid] = 0;
				}
			} else enviarNotificacionG(playerid, "Debes tener una llave francesa en mano");
		}
	}
}
