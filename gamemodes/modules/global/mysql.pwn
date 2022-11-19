// MYSQL 

#define xylos_HOST "127.0.0.1"
#define xylos_USER "root"
#define xylos_PSS ""
#define xylos_DB "mainland"
#define xylos_DBMAP "mainland_map"

#define QUERY_LOW 280
#define QUERY_MEDIUM 480
#define QUERY_LONG 780
new MySQL:MYSQL_DB;



hook OnGameModeInit()
{
    MYSQL_DB = mysql_connect(xylos_HOST, xylos_USER, xylos_PSS, xylos_DB);

    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `LogAdm` (`log_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `log_info` varchar(250) NOT NULL, `log_state` int(1) NOT NULL)");

    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `accounts` (`_dbid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `_name` varchar(25) NOT NULL, `_password` varchar(128) NOT NULL, `_coins` int(6) NULL, `_date` varchar(80) NULL, `_lastdate` varchar(80) NULL, `_exp` int(6) NULL, `_admin` int(6) NULL, `_whitelist` int(1) NOT NULL, `_correo` varchar(40) NOT NULL)");
    
    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `characters` (`listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `mkid` int(6) NOT NULL, `name` varchar(25) NOT NULL, `posX` float(10) NOT NULL, `posY` float(10) NOT NULL, `posZ` float(10) NOT NULL, `angle` float(10) NOT NULL, `viplevel` int(10) NOT NULL, `level` int(10) NOT NULL, `exp` int(10) NOT NULL, `money` int(10) NOT NULL, `life` float(10) NOT NULL, `armor` float(10) NOT NULL, `drugs` float(10) NOT NULL, `hungry` float(10) NOT NULL, `thirst` float(10) NOT NULL, `urine` float(10) NOT NULL, `fatigue` float(10) NOT NULL, `stress` float(10) NOT NULL,   `world` int(10) NOT NULL, `interior` int(10) NOT NULL, `skin` int(10) NOT NULL, `age` int(10) NOT NULL,`origin` int(10) NOT NULL, `sex` int(10) NOT NULL, `bankbalance` int(10) NOT NULL, `bankcredit` int(10) NOT NULL, `job` int(4) NOT NULL, `biz` int(4) NOT NULL, `bizRank` int(4) NOT NULL)");
    
    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `inventory` (`listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `characterid` int(10) NOT NULL, `slot1` int(10) NOT NULL, `slot2` int(10) NOT NULL, `slot3` int(10) NOT NULL, `slot4` int(10) NOT NULL, `slot5` int(10) NOT NULL, `slot6` int(10) NOT NULL, `slot7` int(10) NOT NULL, `slot8` int(10) NOT NULL,`slot9` int(10) NOT NULL, `amount1` int(10) NOT NULL, `amount2` int(10) NOT NULL, `amount3` int(10) NOT NULL, `amount4` int(10) NOT NULL, `amount5` int(10) NOT NULL, `amount6` int(10) NOT NULL, `amount7` int(10) NOT NULL, `amount8` int(10) NOT NULL,`amount9` int(10) NOT NULL)");
    
    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `houses` (`listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `characterid` int(10) NOT NULL, `doorid` int(10) NOT NULL, `price` int(10) NOT NULL, `direction` varchar(40) NOT NULL, `garajedoorid` int(10) NOT NULL, `type` int(10) NOT NULL, `interior` int(10) NOT NULL, `level` int(10) NOT NULL, `virtualworld` int(10) NOT NULL, `statee` int(10) NOT NULL, `safe` int(10) NOT NULL)");
    
    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `markets` (`listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `characterid` int(10) NOT NULL, `doorid` int(10) NOT NULL, `safe` int(10) NOT NULL, `level` int(10) NOT NULL, `type` int(10) NOT NULL, `coordsSell1` float(10) NOT NULL, `coordsSell2` float(10) NOT NULL, `coordsSell3` float(10) NOT NULL, `sale` int(10) NOT NULL, `vw` int(10) NOT NULL, \
    `item1` int(10) NOT NULL, `item2` int(10) NOT NULL, `item3` int(10) NOT NULL, `item4` int(10) NOT NULL, `item5` int(10) NOT NULL, `item6` int(10) NOT NULL, `item7` int(10) NOT NULL, `item8` int(10) NOT NULL, `item9` int(10) NOT NULL, `item10` int(10) NOT NULL, `item11` int(10) NOT NULL, `item12` int(10) NOT NULL, `item13` int(10) NOT NULL, `item14` int(10) NOT NULL, `item15` int(10) NOT NULL, `item16` int(10) NOT NULL, `item17` int(10) NOT NULL, `item18` int(10) NOT NULL, `item19` int(10) NOT NULL, `item20` int(10) NOT NULL, \
    `itemAmount1` int(10) NOT NULL, `itemAmount2` int(10) NOT NULL, `itemAmount3` int(10) NOT NULL, `itemAmount4` int(10) NOT NULL, `itemAmount5` int(10) NOT NULL, `itemAmount6` int(10) NOT NULL, `itemAmount7` int(10) NOT NULL, `itemAmount8` int(10) NOT NULL, `itemAmount9` int(10) NOT NULL, `itemAmount10` int(10) NOT NULL, `itemAmount11` int(10) NOT NULL, `itemAmount12` int(10) NOT NULL, `itemAmount13` int(10) NOT NULL, `itemAmount14` int(10) NOT NULL, `itemAmount15` int(10) NOT NULL, `itemAmount16` int(10) NOT NULL, `itemAmount17` int(10) NOT NULL, `itemAmount18` int(10) NOT NULL, `itemAmount19` int(10) NOT NULL, `itemAmount20` int(10) NOT NULL, \
    `price` int(10) NOT NULL, `direction` varchar(60) NOT NULL)");
   
    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `doors` (`listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `characterid` int(10) NOT NULL, `enterX` float(10) NOT NULL, `enterY` float(10) NOT NULL, `enterZ` float(10) NOT NULL, `enterAngle` float(10) NOT NULL, \
    `exitX` float(10) NOT NULL, `exitY` float(10) NOT NULL, `exitZ` float(10) NOT NULL, `exitAngle` float(10) NOT NULL, `enterState` int(10) NOT NULL, `doorModel` int(10) NOT NULL, \
    `doorCoords1` float(10) NOT NULL, `doorCoords2` float(10) NOT NULL, `doorCoords3` float(10) NOT NULL, `doorCoords4` float(10) NOT NULL, `doorCoords5` float(10) NOT NULL, `doorCoords6` float(10) NOT NULL, \
    `movedoorCoords1` float(10) NOT NULL, `movedoorCoords2` float(10) NOT NULL, `movedoorCoords3` float(10) NOT NULL, `movedoorCoords4` float(10) NOT NULL, `movedoorCoords5` float(10) NOT NULL, `movedoorCoords6` float(10) NOT NULL, \
    `doorVw` int(10) NOT NULL, `exitVw` int(10) NOT NULL, `doorState` int(10) NOT NULL, `doorType` int(10) NOT NULL )");

    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `furnitures` (`listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `toId` int(10) NOT NULL, `vw` int(10) NOT NULL, `model` int(10) NOT NULL, `type` int(10) NOT NULL, `type_use` int(10) NOT NULL, \
        `coords1` float(10) NOT NULL, `coords2` float(10) NOT NULL, `coords3` float(10) NOT NULL, `coords4` float(10) NOT NULL, `coords5` float(10) NOT NULL, `coords6` float(10) NOT NULL, `placed` int(10) NOT NULL, \
        `item1` int(10) NOT NULL, `item2` int(10) NOT NULL, `item3` int(10) NOT NULL, `itemAmmount1` int(10) NOT NULL, `itemAmmount2` int(10) NOT NULL, `itemAmmount3` int(10) NOT NULL)");

    mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `companies` (`listid` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `characterid` int(10) NOT NULL, `name` varchar(60) NOT NULL, `type_company` int(10) NOT NULL, `price` int(10) NOT NULL, \
    `doorid` int(10) NOT NULL, `garajedoorid` int(10) NOT NULL, `direction` varchar(60) NOT NULL, `jobskin1` int(10) NOT NULL, `jobskin2` int(10) NOT NULL, `safe` int(10) NOT NULL, `sale` int(10) NOT NULL, \
    `room1` float(10) NOT NULL, `room2` float(10) NOT NULL, `room3` float(10) NOT NULL, `job1` float(10) NOT NULL, `job2` float(10) NOT NULL, `job3` float(10) NOT NULL, `job4` float(10) NOT NULL, `job5` float(10) NOT NULL, `job6` float(10) NOT NULL, \
    `dispatch1` float(10) NOT NULL, `dispatch2` float(10) NOT NULL, `dispatch3` float(10) NOT NULL, `dispatch4` float(10) NOT NULL, `dispatch5` float(10) NOT NULL, `dispatch6` float(10) NOT NULL)");


    //mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `phones` (`c_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `c_mkid` int(10) NOT NULL, `c_numero` int(10) NOT NULL, `c_contacto1` int(10) NOT NULL, `c_contacto2` int(10) NOT NULL, `c_contacto3` int(10) NOT NULL, `c_contacto4` int(10) NOT NULL, `c_contacto5` int(10) NOT NULL, `c_contacto6` int(10) NOT NULL, `c_contactonombre1` varchar(28) NOT NULL, `c_contactonombre2` varchar(28) NOT NULL, `c_contactonombre3` varchar(28) NOT NULL, `c_contactonombre4` varchar(28) NOT NULL, `c_contactonombre5` varchar(28) NOT NULL, `c_contactonombre6` varchar(28) NOT NULL, `c_bateria` int(10) NOT NULL, `c_sim` int(2) NOT NULL, `c_saldo` int(10) NOT NULL, `c_estado` int(2) NOT NULL, `c_mensaje1` varchar(128) NOT NULL, `c_mensaje2` varchar(128) NOT NULL, `c_mensaje3` varchar(128) NOT NULL, `c_mensaje4` varchar(128) NOT NULL, `c_mensaje5` varchar(128) NOT NULL, `c_mensaje6` varchar(128) NOT NULL, `c_mensaje7` varchar(128) NOT NULL,`c_mensaje8` varchar(128) NOT NULL) ");
    
    /* mysql_query(MYSQL_DB, "CREATE TABLE IF NOT EXISTS `vehicles` (`v_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,`v_mkid` int(10) NOT NULL,`v_model` int(10) NOT NULL, `v_pos0` float(10) NOT NULL, `v_pos1` float(10) NOT NULL, `v_pos2` float(10) NOT NULL, `v_pos3` float(10) NOT NULL, `v_vw` int(10) NOT NULL, `v_color1` int(10) NOT NULL, `v_color2` int(10) NOT NULL, 
    `v_respawn` int(10) NOT NULL, `v_vida` float(10) NOT NULL, `v_puertas` int(10) NOT NULL, `v_motor` int(10) NOT NULL, `v_luces` int(10) NOT NULL, `v_baul` int(10) NOT NULL, `v_capo` int(10) NOT NULL, `v_gasolina` int(10) NOT NULL, `v_aceite` int(10) NOT NULL, `v_empresa` int(10) NOT NULL, `v_faccion` int(10) NOT NULL, 
    `v_baul1` int(3) NOT NULL, `v_baul2` int(3) NOT NULL, `v_baul3` int(3) NOT NULL, `v_baul4` int(3) NOT NULL, `v_baul5` int(3) NOT NULL, `v_baul6` int(3) NOT NULL, `v_baul7` int(3) NOT NULL, `v_baul8` int(3) NOT NULL, `v_baul9` int(3) NOT NULL, 
    `v_baulcant1` int(3) NOT NULL,`v_baulcant2` int(3) NOT NULL, `v_baulcant3` int(3) NOT NULL,`v_baulcant4` int(3) NOT NULL, `v_baulcant5` int(3) NOT NULL, `v_baulcant6` int(3) NOT NULL, `v_baulcant7` int(3) NOT NULL, `v_baulcant8` int(3) NOT NULL, `v_baulcant9` int(3) NOT NULL, 
    `v_attachobject1` int(3) NOT NULL, `v_attachobject2` int(3) NOT NULL, `v_attachobject3` int(3) NOT NULL, `v_attachobject4` int(3) NOT NULL, `v_attachobject5` int(3) NOT NULL, `v_attachobject6` int(3) NOT NULL, `v_attachobject7` int(3) NOT NULL, `v_attachobject8` int(3) NOT NULL, `v_attachobject9` int(3) NOT NULL, 
    `v_attachmodel1` int(3) NOT NULL, `v_attachmodel2` int(3) NOT NULL, `v_attachmodel3` int(3) NOT NULL, `v_attachmodel4` int(3) NOT NULL, `v_attachmodel5` int(3) NOT NULL, `v_attachmodel6` int(3) NOT NULL, `v_attachmodel7` int(3) NOT NULL, `v_attachmodel8` int(3) NOT NULL, `v_attachmodel9` int(3) NOT NULL, 
    `v_attachx1` float(10) NOT NULL, `v_attachx2` float(10) NOT NULL, `v_attachx3` float(10) NOT NULL, `v_attachx4` float(10) NOT NULL, `v_attachx5` float(10) NOT NULL, `v_attachx6` float(10) NOT NULL, `v_attachx7` float(10) NOT NULL, `v_attachx8` float(10) NOT NULL, `v_attachx9` float(10) NOT NULL, 
    `v_attachy1` float(10) NOT NULL, `v_attachy2` float(10) NOT NULL, `v_attachy3` float(10) NOT NULL, `v_attachy4` float(10) NOT NULL, `v_attachy5` float(10) NOT NULL, `v_attachy6` float(10) NOT NULL, `v_attachy7` float(10) NOT NULL, `v_attachy8` float(10) NOT NULL, `v_attachy9` float(10) NOT NULL, 
    `v_attachz1` float(10) NOT NULL, `v_attachz2` float(10) NOT NULL, `v_attachz3` float(10) NOT NULL, `v_attachz4` float(10) NOT NULL, `v_attachz5` float(10) NOT NULL, `v_attachz6` float(10) NOT NULL, `v_attachz7` float(10) NOT NULL, `v_attachz8` float(10) NOT NULL, `v_attachz9` float(10) NOT NULL, 
    `v_rotx1` float(10) NOT NULL, `v_rotx2` float(10) NOT NULL, `v_rotx3` float(10) NOT NULL, `v_rotx4` float(10) NOT NULL, `v_rotx5` float(10) NOT NULL, `v_rotx6` float(10) NOT NULL, `v_rotx7` float(10) NOT NULL, `v_rotx8` float(10) NOT NULL, `v_rotx9` float(10) NOT NULL, 
    `v_roty1` float(10) NOT NULL, `v_roty2` float(10) NOT NULL, `v_roty3` float(10) NOT NULL, `v_roty4` float(10) NOT NULL, `v_roty5` float(10) NOT NULL, `v_roty6` float(10) NOT NULL, `v_roty7` float(10) NOT NULL, `v_roty8` float(10) NOT NULL, `v_roty9` float(10) NOT NULL, 
    `v_rotz1` float(10) NOT NULL, `v_rotz2` float(10) NOT NULL, `v_rotz3` float(10) NOT NULL, `v_rotz4` float(10) NOT NULL, `v_rotz5` float(10) NOT NULL, `v_rotz6` float(10) NOT NULL, `v_rotz7` float(10) NOT NULL, `v_rotz8` float(10) NOT NULL, `v_rotz9` float(10) NOT NULL, `v_frenomano` int(3) NOT NULL)"); 

    */

    print("Estableciendo conexion con la base de datos...");
    if(mysql_errno(MYSQL_DB) != 0)
    {
        print("No se pudo conectar con la base de datos.");
        SendRconCommand("exit");
    }
    else 
    {
        print("Conexion establecida.");
    }
    printf("                                                                                                          ");
    printf("                                                                                                                      ");
    printf("                                                                                                                      ");
    printf("                                                                                                                               ");
    printf("                                                                                                                                   ");
    printf("---------------------------------------------------------------------------------------------------------------");
    printf("---------------------------------------------Developed for Broadway Games--------------------------------------");
    printf("-------------------------------------------------------------------------------------------------------------------------------");
    printf("                                                                                                                      ");
    printf("                                                                                                                      ");
    printf("                                                                                                                      ");
    printf("                                                                                                                 ");
    printf("          ");
}
hook OnGameModeExit()
{
    mysql_close(MYSQL_DB);
}
