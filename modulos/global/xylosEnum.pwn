// Enums para MiamiSide por Xylospeed
#include <YSI_Coding\y_hooks>
//CONEXION
#define xylos_HOST "localhost"
#define xylos_USER "root"
#define xylos_PSS ""
#define xylos_DB "miamiside"
// REMPLAZOS

new timerBajar[MAX_PLAYERS];
new timerBajar2[MAX_PLAYERS];
new timerBar[MAX_PLAYERS];
//

//
#define MAX_NEGOCIOS 200

#define MAX_EMPRESAS 50
#define MAX_MUEBLE_EMPRESAS 2000

#define MAX_CELULARES 500

#define Chat_Naranja "{F2C80C}"
#define Chat_Gris "{D4D4D4}"
#define Chat_Blanco "{FFFFFF}"
//

forward registrarUsuario(playerid);
forward loguearUsuario(playerid);
forward loguearPersonaje(playerid);
forward registraooM(playerid);
forward registrarPersonaje(playerid);
forward guardardatosMaster(playerid);
forward guardardatosPersonaje(playerid);
forward activarGuardado(playerid);


#define d_ban 1
//
new MySQL:xylosMYSQL;

enum _min@f@o
{
    _dbid,
    _nombre[24],
    _password[120],
    _coins,
    _fecha[80],
    _exp,
    _admin,
    _personajes1,
    _personajes2,
    _personajes3,
    _personaje1[40],
    _personaje2[40],
    _personaje3[40],
    _whitelist,
    _correoe[100],
    bool:p_loggedin,
    _pasos,
    bool:_ver1,
    bool:_ver2
};
new masterInfo[MAX_PLAYERS][_min@f@o];


enum _pi@nfo
{
        p_listid,
        p_mkid,
        p_nombre[40],
        Float:_posX,
        Float:_posY,
        Float:_posZ,
        Float:_angle,
        p_viplvl,
        p_nivel,
        p_exp,
        p_dinero,
        Float:p_vida,
        Float:p_chaleco,
        p_hambre,
        p_sed,
        p_world,
        p_interior,
        p_skin,
        p_edad,
        p_origen,
        p_sexo,
        p_negocios,
        //p_casas,
        p_bank,
        p_bankbalance,
        p_bankcredito,
        p_bolsa,
        p_inventario,
        p_empresa,
        p_empresarango,
        p_duda,
        p_dudaT,
        bool:p_spawn,


        p_barvida,
        p_barcha,

        p_en,
        p_enid,
        p_enmodels[40]
};
new personajeInfo[MAX_PLAYERS][_pi@nfo];



hook OnGameModeInit()
{
    xylosMYSQL = mysql_connect(xylos_HOST, xylos_USER, xylos_PSS, xylos_DB);

    mysql_query(/*logADM*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS `LogAdm` (`log_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `log_info` varchar(250) NOT NULL, `log_aprobado` int(10) NOT NULL)");

    mysql_query(/*Master*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS `Master` (`_dbid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `_nombre` varchar(25) NOT NULL, `_password` varchar(129) NOT NULL, `_coins` varchar(16) NULL, `_fecha` varchar(80) NULL,`_exp` int(15) NULL, `_admin` int(15) NULL, `_personajes1` int(15) NULL, `_personajes2` int(15) NULL, `_personajes3` int(15) NULL, `_personaje1` varchar(25) NULL, `_personaje2` varchar(25) NULL, `_personaje3` varchar(25) NULL, `_whitelist` int(15) NULL, `_correoe` varchar(120) NULL)");
    mysql_query/*Personajes*/(xylosMYSQL, "CREATE TABLE IF NOT EXISTS `Personajes` (`p_listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,`p_mkid` int(10) NOT NULL ,`p_nombre` varchar(25) NOT NULL, `_posX` float(10) NOT NULL, `_posY` float(10) NOT NULL, `_posZ` float(10) NOT NULL, `_angle` float(10) NOT NULL, `p_viplvl` int(10) NOT NULL, `p_nivel` int(10) NOT NULL, `p_exp` int(10) NOT NULL, `p_dinero` int(10) NOT NULL, `p_vida` float(10) NOT NULL, `p_chaleco` float(10) NOT NULL,`p_hambre` float(10) NOT NULL, `p_sed` float(10) NOT NULL,  `p_world` int(10) NOT NULL, `p_interior` int(10) NOT NULL, `p_skin` int(10) NOT NULL, `p_edad` int(10) NOT NULL,`p_origen` int(10) NOT NULL, `p_sexo` int(10) NOT NULL, `p_negocios` int(10) NOT NULL, `p_bank` int(10) NOT NULL, `p_bankbalance` int(10) NOT NULL, `p_bankcredito` int(10) NOT NULL,`p_bolsa` int(10) NOT NULL ,`p_inventario` int(4) NOT NULL, `p_empresa` int(4) NOT NULL, `p_empresarango` int(4) NOT NULL)");
    mysql_query(/*Inventario*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS Inventario (`i_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `i_mkid` int(10) NOT NULL, `i_slot1` int(10) NOT NULL, `i_slot2` int(10) NOT NULL, `i_slot3` int(10) NOT NULL, `i_slot4` int(10) NOT NULL, `i_slot5` int(10) NOT NULL, `i_slot6` int(10) NOT NULL, `i_slot7` int(10) NOT NULL, `i_slot8` int(10) NOT NULL,`i_slot9` int(10) NOT NULL, `i_slotocup1` int(10) NOT NULL, `i_slotocup2` int(10) NOT NULL, `i_slotocup3` int(10) NOT NULL, `i_slotocup4` int(10) NOT NULL, `i_slotocup5` int(10) NOT NULL, `i_slotocup6` int(10) NOT NULL, `i_slotocup7` int(10) NOT NULL, `i_slotocup8` int(10) NOT NULL, `i_slotocup9` int(10) NOT NULL,  `i_slotcant1` int(10) NOT NULL, `i_slotcant2` int(10) NOT NULL, `i_slotcant3` int(10) NOT NULL, `i_slotcant4` int(10) NOT NULL, `i_slotcant5` int(10) NOT NULL, `i_slotcant6` int(10) NOT NULL, `i_slotcant7` int(10) NOT NULL, `i_slotcant8` int(10) NOT NULL, `i_slotcant9` int(20) NOT NULL)");
    mysql_query(/*Empresas*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS `Empresas` (`e_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `e_nombre` varchar(80) NOT NULL, `e_color` int(10) NOT NULL, `e_rango1` varchar(80) NOT NULL,  `e_rango2` varchar(80) NOT NULL,  `e_rango3` varchar(80) NOT NULL,  `e_rango4` varchar(80) NOT NULL,  `e_rango5` varchar(80) NOT NULL,  `e_rango6` varchar(80) NOT NULL,  `e_tipo` int(10) NOT NULL, `e_posx` float(15) NOT NULL, `e_posy` float(15) NOT NULL, `e_posz` float(15) NOT NULL, `e_posx1` float(15) NOT NULL, `e_posy2` float(15) NOT NULL, `e_posz3` float(15) NOT NULL, `e_vw` int(10) NOT NULL, `e_miembros` int(10) NOT NULL, `e_muebles` int(10) NOT NULL, `e_prod` int(10) NOT NULL)");
    mysql_query(/*celulares*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS `celulares` (`c_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `c_mkid` int(10) NOT NULL, `c_numero` int(10) NOT NULL, `c_contacto1` int(10) NOT NULL, `c_contacto2` int(10) NOT NULL, `c_contacto3` int(10) NOT NULL, `c_contacto4` int(10) NOT NULL, `c_contacto5` int(10) NOT NULL, `c_contacto6` int(10) NOT NULL, `c_contactonombre1` varchar(28) NOT NULL, `c_contactonombre2` varchar(28) NOT NULL, `c_contactonombre3` varchar(28) NOT NULL, `c_contactonombre4` varchar(28) NOT NULL, `c_contactonombre5` varchar(28) NOT NULL, `c_contactonombre6` varchar(28) NOT NULL, `c_bateria` int(10) NOT NULL, `c_sim` int(2) NOT NULL, `c_saldo` int(10) NOT NULL, `c_estado` int(2) NOT NULL, `c_mensaje1` varchar(128) NOT NULL, `c_mensaje2` varchar(128) NOT NULL, `c_mensaje3` varchar(128) NOT NULL, `c_mensaje4` varchar(128) NOT NULL, `c_mensaje5` varchar(128) NOT NULL, `c_mensaje6` varchar(128) NOT NULL, `c_mensaje7` varchar(128) NOT NULL,`c_mensaje8` varchar(128) NOT NULL) ");
    


    print("--------Estableciendo conexion con la base de datos(MiamiSide)-------------");
    if(mysql_errno(xylosMYSQL) != 0)
    {
        print("No se pudo conectar con la base de datos");
        SendRconCommand("exit");
    }
    else 
    {
        print("Conexion establecida");
    }
    printf("                                                                                                          ");
    printf("                                                                                                                      ");
    printf("                                                                                                                      ");
    printf("                                                                                                                               ");
    printf("                                                                                                                                   ");
    printf("---------------------------------------------------------------------------------------------------------------");
    printf("---------------------------------------------Developed for Broadway Games--------------------------------------");
    printf("----------------------------------------------------------------------------------------------------------------------------------------");
    printf("                                                                                                                      ");
    printf("                                                                                                                      ");
    printf("                                                                                                                      ");
    printf("                                                                                                                 ");
    printf("          ");
    return 1;
}
hook OnGameModeExit()
{
    mysql_close(xylosMYSQL);
    return 1;
}

hook OnPlayerConnect(playerid)
{
    seteardatosraros(playerid);
    SetPlayerColor(playerid, 0xAFAFAFAA);
    return 1;
}

hook OnPlayerRequestClass(playerid, classid)
{
    if(!masterInfo[playerid][p_loggedin])
    {
        TogglePlayerSpectating(playerid, 1); 
        if(SQL::RowExistsEx("Master", "_nombre", conseguirNombre(playerid)))
        {
            new xylos[128];
            mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT _password, _dbid, _whitelist FROM Master WHERE _nombre = '%e' LIMIT 1", masterInfo[playerid][_nombre]);
            mysql_pquery(xylosMYSQL, xylos, "registraooM", "d", playerid);
            cargarTextInicial(playerid);
        }
        else
        {
            cargarTextInicial(playerid);
        }
    }
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    switch(reason)
    {
        case 0:
        {
            guardardatosMaster(playerid);
            guardardatosPersonaje(playerid);
            guardarInventario(playerid);
        }
        case 1:
        {
            guardardatosMaster(playerid);
            guardardatosPersonaje(playerid);
            guardarInventario(playerid);
        }
        case 2:
        {
            guardardatosMaster(playerid);
            guardardatosPersonaje(playerid);
            guardarInventario(playerid);
        }
    }
    seteardatosraros(playerid);
    return Y_HOOKS_CONTINUE_RETURN_1;
}
public registraooM(playerid)
{
    new tmp[120];
    cache_get_value_name(0, "_password", tmp); format(masterInfo[playerid][_password], 120, "%s", tmp);
    cache_get_value_name_int(0, "_dbid", masterInfo[playerid][_dbid]);
}
public registrarUsuario(playerid)
{
    ///
    masterInfo[playerid][_dbid] = cache_insert_id();
    masterInfo[playerid][p_loggedin] = true;
}
public registrarPersonaje(playerid)
{
    ///
    personajeInfo[playerid][p_listid] = cache_insert_id();
    //personajeInfo[playerid][p_spawn] = true;
}

public loguearUsuario(playerid)
{
        cache_get_value_name_int(0, "_dbid", masterInfo[playerid][_dbid]);
        cache_get_value_name_int(0, "_coins", masterInfo[playerid][_coins]);
        cache_get_value_name(0, "_fecha", masterInfo[playerid][_fecha]);
        cache_get_value_name_int(0, "_exp", masterInfo[playerid][_exp]);
        cache_get_value_name_int(0, "_admin", masterInfo[playerid][_admin]);
        cache_get_value_name_int(0, "_personajes1", masterInfo[playerid][_personajes1]);
        cache_get_value_name_int(0, "_personajes2", masterInfo[playerid][_personajes2]);
        cache_get_value_name_int(0, "_personajes3", masterInfo[playerid][_personajes3]);
        cache_get_value_name(0, "_personaje1", masterInfo[playerid][_personaje1]);
        cache_get_value_name(0, "_personaje2", masterInfo[playerid][_personaje2]);
        cache_get_value_name(0, "_personaje3", masterInfo[playerid][_personaje3]);
        cache_get_value_name_int(0, "_whitelist", masterInfo[playerid][_whitelist]);
        cache_get_value_name(0, "_correoe", masterInfo[playerid][_correoe]);
        masterInfo[playerid][p_loggedin] = true;
        if(masterInfo[playerid][_whitelist] == 1)
        {
            ShowXylosDialog(playerid, d_ban, TYPE_MSG, "Aviso", " tu cuenta se encuentra baneada, contacta con un administrador para mas informacion", "Continuar");
            SetTimerEx("KickearPlayer", 1000, false, "d", playerid);
            for(new i=0; i<2; i++) { TextDrawHideForPlayer(playerid, TDEditor_TD[i]); }
            for(new i=0; i<5; i++) { PlayerTextDrawHide(playerid,TDEditor_PTD[playerid][i]); }
        }
}
public loguearPersonaje(playerid)
{
        cache_get_value_name_int(0, "p_listid", personajeInfo[playerid][p_listid]);
        cache_get_value_name_int(0, "p_mkid", personajeInfo[playerid][p_mkid]);
        cache_get_value_name(0, "p_nombre", personajeInfo[playerid][p_nombre]);
        cache_get_value_name_float(0, "_posX", personajeInfo[playerid][_posX]);
        cache_get_value_name_float(0, "_posY", personajeInfo[playerid][_posY]);
        cache_get_value_name_float(0, "_posZ", personajeInfo[playerid][_posZ]);
        cache_get_value_name_float(0, "_angle", personajeInfo[playerid][_angle]);
        cache_get_value_name_int(0, "p_viplvl", personajeInfo[playerid][p_viplvl]);
        cache_get_value_name_int(0, "p_nivel", personajeInfo[playerid][p_nivel]);
        cache_get_value_name_int(0, "p_exp", personajeInfo[playerid][p_exp]);
        cache_get_value_name_int(0, "p_dinero", personajeInfo[playerid][p_dinero]);
        cache_get_value_name_float(0, "p_vida", personajeInfo[playerid][p_vida]);
        cache_get_value_name_float(0, "p_chaleco", personajeInfo[playerid][p_chaleco]);
        cache_get_value_name_int(0, "p_hambre", personajeInfo[playerid][p_hambre]);
        cache_get_value_name_int(0, "p_sed", personajeInfo[playerid][p_sed]);
        cache_get_value_name_int(0, "p_world", personajeInfo[playerid][p_world]);
        cache_get_value_name_int(0, "p_interior", personajeInfo[playerid][p_interior]);
        cache_get_value_name_int(0, "p_skin", personajeInfo[playerid][p_skin]);
        cache_get_value_name_int(0, "p_edad", personajeInfo[playerid][p_edad]);
        cache_get_value_name_int(0, "p_origen", personajeInfo[playerid][p_origen]);
        cache_get_value_name_int(0, "p_sexo", personajeInfo[playerid][p_sexo]);
        cache_get_value_name_int(0, "p_negocios", personajeInfo[playerid][p_negocios]);
        cache_get_value_name_int(0, "p_bank", personajeInfo[playerid][p_bank]);
        cache_get_value_name_int(0, "p_bankbalance", personajeInfo[playerid][p_bankbalance]);
        cache_get_value_name_int(0, "p_bankcredito", personajeInfo[playerid][p_bankcredito]);
        cache_get_value_name_int(0, "p_bolsa", personajeInfo[playerid][p_bolsa]);
        cache_get_value_name_int(0, "p_inventario", personajeInfo[playerid][p_inventario]);
        cache_get_value_name_int(0, "p_empresa", personajeInfo[playerid][p_empresa]);
        cache_get_value_name_int(0, "p_empresarango", personajeInfo[playerid][p_empresarango]);
        CancelSelectTextDraw(playerid);
        TogglePlayerSpectating(playerid, 0); 
        new string[128];
        format(string, 128, "[MiamiSide] logueaste tu personaje %s ¡Gracias por jugar!", conseguirNombre(playerid));
        enviarNotificacionG(playerid, string);
        if(personajeInfo[playerid][p_inventario] == 1)
        {
            new inv[200];
            mysql_format(xylosMYSQL, inv, sizeof(inv), "SELECT * FROM Inventario WHERE i_mkid = '%i'", personajeInfo[playerid][p_listid]);
            mysql_pquery(xylosMYSQL, inv, "loguearInventario", "d", playerid);
        }

        SetSpawnInfo(playerid, 0, personajeInfo[playerid][p_skin], personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ], personajeInfo[playerid][_angle], 0, 0, 0, 0, 0, 0);
        SpawnPlayer(playerid);

        ToggleHUDComponentForPlayer (playerid, 0, false);


        ResetPlayerMoney(playerid);
        GivePlayerMoney(playerid, personajeInfo[playerid][p_dinero]);
        SetPlayerName(playerid, personajeInfo[playerid][p_nombre]);
        SetPlayerHealth(playerid, personajeInfo[playerid][p_vida]);
        SetPlayerArmour(playerid, personajeInfo[playerid][p_chaleco]);
        SetPlayerVirtualWorld(playerid, personajeInfo[playerid][p_world]);
        SetPlayerInterior(playerid, personajeInfo[playerid][p_interior]);

        SetTimerEx("activarGuardado", 5000, false, "d", playerid);
        timerBar[playerid] = SetTimerEx("iniciarBarras", 7000, true, "d", playerid);

        SetPlayerColor(playerid, 0xAFAFAFAA);
        if(personajeInfo[playerid][p_spawn] == false)
        {
            SendClientMessage(playerid, -1, ""Chat_Gris"[MiamiSide]"Chat_Blanco" Recuerda usar /adudas(para activar) y /d para solucionar tus dudas");
        }

        StopAudioStreamForPlayer(playerid);
        congelarUsuario(playerid, 6000);
        TextDrawHideForPlayer(playerid, TDEditor_TD[0]);



        personajeInfo[playerid][p_barvida] = crearBarra(playerid,  39.0000, 0, 40.000007, 433.911163, 87.000000, 0.493333, -2147483393, 100.0000);
        personajeInfo[playerid][p_barcha] = crearBarra(playerid, 90.0000, 1, 91.666664, 433.911132, 130.0000, 0.493333, -2139062017, 100.0000);
        
        return true;
}


public guardardatosMaster(playerid)
{
        if(masterInfo[playerid][p_loggedin] == true)
        { 
            new xylos = SQL::Open(SQL::UPDATE, "Master", "_dbid", masterInfo[playerid][_dbid]);
            SQL::WriteInt(xylos, "_coins", masterInfo[playerid][_coins]);
            SQL::WriteString(xylos, "_fecha", masterInfo[playerid][_fecha]);
            SQL::WriteInt(xylos, "_exp", masterInfo[playerid][_exp]);
            SQL::WriteInt(xylos, "_admin", masterInfo[playerid][_admin]);
            SQL::WriteInt(xylos, "_personajes1", masterInfo[playerid][_personajes1]);
            SQL::WriteInt(xylos, "_personajes2", masterInfo[playerid][_personajes2]);
            SQL::WriteInt(xylos, "_personajes3", masterInfo[playerid][_personajes3]);
            SQL::WriteString(xylos, "_personaje1", masterInfo[playerid][_personaje1]);
            SQL::WriteString(xylos, "_personaje2", masterInfo[playerid][_personaje2]);
            SQL::WriteString(xylos, "_personaje3", masterInfo[playerid][_personaje3]);
            SQL::WriteInt(xylos, "_whitelist", masterInfo[playerid][_whitelist]);
            SQL::WriteString(xylos, "_correoe", masterInfo[playerid][_correoe]);
            SQL::Close(xylos);
        }
}
public guardardatosPersonaje(playerid)
{
        if(personajeInfo[playerid][p_spawn] == true)
        { 
            GetPlayerPos(playerid, personajeInfo[playerid][_posX], personajeInfo[playerid][_posY], personajeInfo[playerid][_posZ]);
            GetPlayerFacingAngle(playerid, personajeInfo[playerid][_angle]);
            GetPlayerHealth(playerid, personajeInfo[playerid][p_vida]);
            GetPlayerArmour(playerid, personajeInfo[playerid][p_chaleco]);
            new int = GetPlayerVirtualWorld(playerid);
            new xylos = SQL::Open(SQL::UPDATE, "Personajes", "p_listid", personajeInfo[playerid][p_listid]);
            SQL::WriteString(xylos, "p_nombre", personajeInfo[playerid][p_nombre]);
            SQL::WriteFloat(xylos, "_posX", personajeInfo[playerid][_posX]);
            SQL::WriteFloat(xylos, "_posY", personajeInfo[playerid][_posY]);
            SQL::WriteFloat(xylos, "_posZ", personajeInfo[playerid][_posZ]);
            SQL::WriteFloat(xylos, "_angle", personajeInfo[playerid][_angle]);
            SQL::WriteInt(xylos, "p_viplvl", personajeInfo[playerid][p_viplvl]);
            SQL::WriteInt(xylos, "p_nivel", personajeInfo[playerid][p_nivel]);
            SQL::WriteInt(xylos, "p_exp", personajeInfo[playerid][p_exp]);
            SQL::WriteInt(xylos, "p_dinero", personajeInfo[playerid][p_dinero]);
            SQL::WriteFloat(xylos, "p_vida", personajeInfo[playerid][p_vida]);
            SQL::WriteFloat(xylos, "p_chaleco", personajeInfo[playerid][p_chaleco]);
            SQL::WriteInt(xylos, "p_hambre", personajeInfo[playerid][p_hambre]);
            SQL::WriteInt(xylos, "p_sed", personajeInfo[playerid][p_sed]);
            SQL::WriteInt(xylos, "p_world", int);
            SQL::WriteInt(xylos, "p_interior", GetPlayerInterior(playerid));
            SQL::WriteInt(xylos, "p_skin", personajeInfo[playerid][p_skin]);
            SQL::WriteInt(xylos, "p_edad", personajeInfo[playerid][p_edad]);
            SQL::WriteInt(xylos, "p_origen", personajeInfo[playerid][p_origen]);
            SQL::WriteInt(xylos, "p_sexo", personajeInfo[playerid][p_sexo]);
            SQL::WriteInt(xylos, "p_negocios", personajeInfo[playerid][p_negocios]);
            SQL::WriteInt(xylos, "p_bank", personajeInfo[playerid][p_bank]);
            SQL::WriteInt(xylos, "p_bankbalance", personajeInfo[playerid][p_bankbalance]);
            SQL::WriteInt(xylos, "p_bankcredito", personajeInfo[playerid][p_bankcredito]);
            SQL::WriteInt(xylos, "p_bolsa", personajeInfo[playerid][p_bolsa]);
            SQL::WriteInt(xylos, "p_inventario", personajeInfo[playerid][p_inventario]);
            SQL::WriteInt(xylos, "p_empresa", personajeInfo[playerid][p_empresa]);
            SQL::WriteInt(xylos, "p_empresarango", personajeInfo[playerid][p_empresarango]);
            SQL::Close(xylos);
        }
}
public activarGuardado(playerid)
{
    personajeInfo[playerid][p_spawn] = true;
    timerBajar[playerid] = SetTimerEx("bajarComida", 300000, true, "d", playerid);
    timerBajar2[playerid] = SetTimerEx("bajarSed", 300000, true, "d", playerid);
    updateHud(playerid);
    if(personajeInfo[playerid][p_skin] == 0)
    {
        personajeInfo[playerid][p_skin] = 15;
        SetPlayerSkin(playerid, 15);
    }
}


stock seteardatosraros(playerid)
{
    masterInfo[playerid][_dbid] = 0;
    GetPlayerName(playerid, masterInfo[playerid][_nombre], MAX_PLAYER_NAME);
    format(masterInfo[playerid][_password], 128, "m");
    format(masterInfo[playerid][_fecha], 80, "nunca");
    masterInfo[playerid][_exp] = 0;
    masterInfo[playerid][_admin] = 0;
    masterInfo[playerid][_personajes1] = 0;
    masterInfo[playerid][_personajes2] = 0;
    masterInfo[playerid][_personajes3] = 0;
    format(masterInfo[playerid][_personaje1], 128, "m");
    format(masterInfo[playerid][_personaje2], 128, "m");
    format(masterInfo[playerid][_personaje3], 128, "m");
    masterInfo[playerid][_whitelist] = 0;
    format(masterInfo[playerid][_correoe], 128, "m");
    masterInfo[playerid][p_loggedin] = false;
    masterInfo[playerid][_ver1] = false;
    masterInfo[playerid][_ver2] = false;
}



stock conseguirNombre(playerid)
{
    new name[24];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}

