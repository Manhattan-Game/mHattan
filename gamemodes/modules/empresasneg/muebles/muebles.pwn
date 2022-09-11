#include <YSI_Coding\y_hooks>
#define MAX_MUEBLES 1000
enum tiypamuebles
{
	mtype_id,
	my_model,
	price,
	type,
	my_description[50]
};
new typeMuebles[][tiypamuebles] = {
	{0, 349, 5000, 0, "Nada"},
	{1, 1210, 5000, 0, "Maletin"},
	{2, 11720, 5000, 0, "Cama Roja"},
	{3, 1518, 5000, 0, "Televisor"}
};
enum mueblsad
{
	m_id,
	Float:m_pos[6],
	m_vw,
	m_model,

	m_type,

	m_emp,
	m_hou,
	m_neg,


	m_colocado,
	m_object
};
new muebleInfo[MAX_MUEBLES][mueblsad];

new mueblesEditando[MAX_PLAYERS];
new bool:editandoMuebles[MAX_PLAYERS];

editarMueble(playerid, muebleid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	DestroyDynamicObject(muebleInfo[muebleid][m_object]);

	muebleInfo[muebleid][m_object] = CreateDynamicObject(typeMuebles[muebleInfo[muebleid][m_model]][my_model], x, y, z-1.0, 1.0, 1.0, 1.0, GetPlayerVirtualWorld(playerid));
	EditDynamicObject(playerid, muebleInfo[muebleid][m_object]);
	enviarNotificacionG(playerid, "Edita la posicion");
}
new muebleEdit;
mostrarMueblesEmpresa(playerid, empid)
{
	new count;
	muebleEdit = CreatePreviewMenu("Muebles");
	for(new i;i<MAX_MUEBLES;i++)
	{
		if(muebleInfo[i][m_emp] == empid)
		{
			new d = muebleInfo[i][m_model];
			empresaInfo[empid][e_mueformat][count] = i;
			AddModelToPreviewMenu(muebleEdit, typeMuebles[d][my_model], typeMuebles[d][my_description]);
			count++;
		}
	}
	ShowPreviewMenuForPlayer(playerid, muebleEdit, 0x1E1E1EFF);
}
eliminarMueble(id)
{
	muebleInfo[id][m_emp] = -1;
	muebleInfo[id][m_model] = -1;
}



hook OnPreviewMenuResponse(playerid, menu_id, response, menu_model_id, modelid, info[])
{
	switch(menu_id)
	{
		case 0:
		{
			mueblesEditando[playerid] = menu_model_id;
			ShowPlayerDialog(playerid, d_editmueble, DIALOG_STYLE_LIST, "Mueble", "Editar Posicion\nOcultar/Mostrar\nVender($100)", "Seleccionar", "Cancelar");
			DeletePreviewMenu(0);
		}
	}
}
hook OP_EditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(response == EDIT_RESPONSE_FINAL)
	{
		if(editandoMuebles[playerid] == true)
		{
			enviarNotificacionG(playerid, "Editaste la posicion del mueble");
			new d = empresaInfo[EmpEditando[playerid]][e_mueformat][mueblesEditando[playerid]];
			muebleInfo[d][m_pos][0] = x;
			muebleInfo[d][m_pos][1] = y;
			muebleInfo[d][m_pos][2] = z;
			muebleInfo[d][m_pos][3] = rx;
			muebleInfo[d][m_pos][4] = ry;
			muebleInfo[d][m_pos][5] = rz;

		}
	}


}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case d_editmueble:
		{
			new d = empresaInfo[EmpEditando[playerid]][e_mueformat][mueblesEditando[playerid]];
			switch(listitem)
			{
				case 0:
				{
					if(muebleInfo[d][m_colocado] == 1)
					{
						editandoMuebles[playerid] = true;
						editarMueble(playerid, d);
					}
				}
				case 1:
				{
					if(muebleInfo[d][m_colocado] == 1)
					{
						muebleInfo[d][m_colocado] = 0;
						DestroyDynamicObject(muebleInfo[d][m_object]);
						enviarNotificacionG(playerid, "Ocultaste el mueble");
					}
					else
					{
						muebleInfo[d][m_colocado] = 1;
						enviarNotificacionG(playerid, "Ahora edita su posicion");
					}
				}
				case 2:
				{
					eliminarMueble(d);
					personajeInfo[playerid][p_dinero] += 100;
				}
			}
		}
	}
}

