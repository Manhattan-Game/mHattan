#include <YSI_Coding\y_hooks>

#define MAX_MUEBLES 1000

enum typeM_D
{
	mi_id,
	mi_model,
	mi_description[128],
	mi_class
}
new mueblesTipo[][typeM_D] = {
	{0, 0, "Slot vacio"},
	{1, 1, "s"},
	{2, 11720, "Cada de dos Plazas roja", 0},
	{3, 2525, "Inodoro Basico", 0}
};


enum savedatethemuebl
{
	m_id,
	m_model,
	Float:m_pos[6],
	m_vw,

	m_house_own,
	m_empresa_own,
	m_negocio_own,

	m_inv,

	m_spawn,

	m_create
};
new mueblesInfo[MAX_MUEBLES][savedatethemuebl];

hook OnGameModeInit()
{
	mysql_query(/*muebles*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS `muebles` (`m_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `m_model` int(10) NOT NULL, `m_pos0` float(8) NOT NULL,  `m_pos1` float(8) NOT NULL, `m_pos2` float(8) NOT NULL, `m_pos3` float(8) NOT NULL, `m_pos4` float(8) NOT NULL, `m_pos5` float(8) NOT NULL, \
	`m_vw` int(8) NOT NULL, `m_house_own` int(8) NOT NULL, `m_empresa_own` int(8) NOT NULL, `m_negocio_own` int(8) NOT NULL, `m_inv` int(8) NOT NULL, `m_spawn` int(2) NOT NULL)");
}

crearMueble(tipo, emp_id, hou_id, neg_id)
{
	new x = mueblesTipo[tipo][mi_model];

	new xylos[200];
	format(xylos, sizeof(xylos), "INSERT INTO muebles(m_model, m_house_own, m_empresa_own, m_negocio_own) VALUES (`%d`, `%d`, `%d`, `%d`)", x, hou_id, emp_id, neg_id);

}



mostrarMenuMuebles(playerid, tipo){
	switch(tipo)
	{
		case 0:
		{
			new v;
			for(new i;i<MAX_MUEBLES;i++)
			{
				if(mueblesInfo[i][m_empresa_own] == personajeInfo[playerid][p_en])
				{	
					v++;
					personajeInfo[playerid][p_enmodels][v] = i;
				}
			}
		}
	}
	new string[1280];
	new string1[100];
	for(new i;i<40;i++)
	{
		if(mueblesInfo[personajeInfo[playerid][p_enmodels][i]][m_model] != 1 && mueblesInfo[personajeInfo[playerid][p_enmodels][i]][m_model] != 0)
		{
			printf("%i", mueblesInfo[personajeInfo[playerid][p_enmodels][i]][m_model]);
			format(string1, sizeof(string1), "(%i) %s \n", i, mueblesTipo[mueblesInfo[personajeInfo[playerid][p_enmodels][i]][m_model]][mi_description]);
			strcat(string, string1);
		}
		else
		{
			format(string1, sizeof(string1), "(%i) Slot Vacio \n", i);
			strcat(string, string1);
		}
	}

	ShowPlayerDialog(playerid, 243, DIALOG_STYLE_LIST, "Muebles", string, "Seleccionar", "Cancelar");
	
}

mostrarMueble(playerid, muebleid)
{
	if(mueblesInfo[muebleid][m_spawn] != 1)
	{
		new x = mueblesTipo[mueblesInfo[muebleid][m_model]][mi_model];
		mueblesInfo[muebleid][m_vw] = GetPlayerVirtualWorld(playerid);
		GetPlayerPos(playerid, mueblesInfo[muebleid][m_pos][0], mueblesInfo[muebleid][m_pos][1], mueblesInfo[muebleid][m_pos][2]);
		mueblesInfo[muebleid][m_create] = CreateDynamicObject(x,  mueblesInfo[muebleid][m_pos][0], mueblesInfo[muebleid][m_pos][1], mueblesInfo[muebleid][m_pos][2],  mueblesInfo[muebleid][m_pos][3], mueblesInfo[muebleid][m_pos][4], mueblesInfo[muebleid][m_pos][5], mueblesInfo[muebleid][m_vw], 0, -1, 70);
		mueblesInfo[muebleid][m_spawn] = 1;
	}
}


cmd:muebles(playerid, params[])
{
	for(new i;i<MAX_EMPRESAS; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 100, empresaInfo[i][e_posx1], empresaInfo[i][e_posy2], empresaInfo[i][e_posz3]) && empresaInfo[i][e_vw] == GetPlayerVirtualWorld(playerid))
		{
			if(empresaInfo[i][e_id] == personajeInfo[playerid][p_empresa] && personajeInfo[playerid][p_empresarango] > 4)
			{
				personajeInfo[playerid][p_en] = i;
				mostrarMenuMuebles(playerid, 0);
				break;
			}
		}
	}
	return 1;
}

cmd:prueba(playerid)
{
	mueblesInfo[0][m_model] = 2;
	mueblesInfo[0][m_empresa_own] = 1;
	mueblesInfo[1][m_model] = 3;
	mueblesInfo[1][m_empresa_own] = 1;

	personajeInfo[playerid][p_en] = 1;

	mostrarMenuMuebles(playerid, 0);
	return 1;
}