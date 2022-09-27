#include <YSI_Coding\y_hooks>

new Text:Menuconfiguracion;
new PlayerText:menuconfig[MAX_PLAYERS][11];
enum toysads@add
{
    toy_id,
    toy_mkid,
    toy_modelid[4],
    toy_bone[4],
    Float:Toy1[9],
    Float:Toy2[9],
    Float:Toy3[9],
    Float:Toy4[9],
    toy_colocado[4],
}
new toyInfo[MAX_PLAYERS][toysads@add];
hook OnGameModeInit()
{
    mysql_query(/*celulares*/xylosMYSQL, "CREATE TABLE IF NOT EXISTS `accesorios` (`toy_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, `toy_mkid` int(3) NOT NULL, `toy_modelid1` int(10) NOT NULL,`toy_modelid2` int(10) NOT NULL, `toy_modelid3` int(10) NOT NULL, `toy_modelid4` int(10) NOT NULL, \
    `toy_bone1` int(2) NOT NULL, `toy_bone2` int(2) NOT NULL, `toy_bone3` int(2) NOT NULL, `toy_bone4` int(2) NOT NULL, \
    `toy1_pos1` float(10) NOT NULL, `toy1_pos2` float(10) NOT NULL, `toy1_pos3` float(10) NOT NULL, `toy1_pos4` float(10) NOT NULL, `toy1_pos5` float(10) NOT NULL, `toy1_pos6` float(10) NOT NULL, `toy1_pos7` float(10) NOT NULL, `toy1_pos8` float(10) NOT NULL, `toy1_pos9` float(10) NOT NULL, \
    `toy2_pos1` float(10) NOT  NULL, `toy2_pos2` float(10) NOT NULL, `toy2_pos3` float(10) NOT NULL, `toy2_pos4` float(10) NOT NULL, `toy2_pos5` float(10) NOT NULL, `toy2_pos6` float(10) NOT NULL, `toy2_pos7` float(10) NOT NULL, `toy2_pos8` float(10) NOT NULL, `toy2_pos9` float(10) NOT NULL, \
    `toy3_pos1` float(10) NOT NULL, `toy3_pos2` float(10) NOT NULL, `toy3_pos3` float(10) NOT NULL, `toy3_pos4` float(10) NOT NULL, `toy3_pos5` float(10) NOT NULL, `toy3_pos6` float(10) NOT NULL, `toy3_pos7` float(10) NOT NULL, `toy3_pos8` float(10) NOT NULL, `toy3_pos9` float(10) NOT NULL, \
    `toy4_pos1` float(10) NOT NULL, `toy4_pos2` float(10) NOT NULL, `toy4_pos3` float(10) NOT NULL, `toy4_pos4` float(10) NOT NULL, `toy4_pos5` float(10) NOT NULL, `toy4_pos6` float(10) NOT NULL, `toy4_pos7` float(10) NOT NULL, `toy4_pos8` float(10) NOT NULL, `toy4_pos9` float(10) NOT NULL, \
    `toy_colocado1` int(2) NOT NULL, `toy_colocado2` int(2) NOT NULL, `toy_colocado3` int(2) NOT NULL, `toy_colocado4` int(2) NOT NULL)");
    

    Menuconfiguracion = TextDrawCreate(216.333389, 130.111099, "mdl-2001:logo_box");
    TextDrawLetterSize(Menuconfiguracion, 0.000000, 0.000000);
    TextDrawTextSize(Menuconfiguracion, 115.000000, 152.000000);
    TextDrawAlignment(Menuconfiguracion, 1);
    TextDrawColor(Menuconfiguracion, 505290495);
    TextDrawSetShadow(Menuconfiguracion, 0);
    TextDrawSetOutline(Menuconfiguracion, 0);
    TextDrawBackgroundColor(Menuconfiguracion, 255);
    TextDrawFont(Menuconfiguracion, 4);
    TextDrawSetProportional(Menuconfiguracion, 0);
    TextDrawSetShadow(Menuconfiguracion, 0);
}
hook OnPlayerConnect(playerid)
{  
    menuconfig[playerid][0] = CreatePlayerTextDraw(playerid, 208.666717, 147.533309, "");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][0], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][0], 90.000000, 90.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][0], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][0], 0);
    PlayerTextDrawFont(playerid, menuconfig[playerid][0], 5);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][0], 0);
    PlayerTextDrawSetPreviewModel(playerid, menuconfig[playerid][0], 270);
    PlayerTextDrawSetPreviewRot(playerid, menuconfig[playerid][0], 0.000000, 0.000000, -30.000000, 1.000000);

    menuconfig[playerid][1] = CreatePlayerTextDraw(playerid, 279.666625, 137.162948, "");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][1], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][1], 38.000000, 36.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][1], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][1], 589505535);
    PlayerTextDrawFont(playerid, menuconfig[playerid][1], 5);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][1], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][1], true);
    PlayerTextDrawSetPreviewModel(playerid, menuconfig[playerid][1], 4663);
    PlayerTextDrawSetPreviewRot(playerid, menuconfig[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

    menuconfig[playerid][2] = CreatePlayerTextDraw(playerid, 279.666595, 171.177734, "");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][2], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][2], 38.000000, 36.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][2], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][2], 589505535);
    PlayerTextDrawFont(playerid, menuconfig[playerid][2], 5);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][2], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][2], true);
    PlayerTextDrawSetPreviewModel(playerid, menuconfig[playerid][2], 4663);
    PlayerTextDrawSetPreviewRot(playerid, menuconfig[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

    menuconfig[playerid][3] = CreatePlayerTextDraw(playerid, 279.666625, 205.192550, "");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][3], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][3], 38.000000, 36.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][3], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][3], 589505535);
    PlayerTextDrawFont(playerid, menuconfig[playerid][3], 5);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][3], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][3], true);
    PlayerTextDrawSetPreviewModel(playerid, menuconfig[playerid][3], 4663);
    PlayerTextDrawSetPreviewRot(playerid, menuconfig[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);

    menuconfig[playerid][4] = CreatePlayerTextDraw(playerid, 279.666595, 236.303680, "");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][4], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][4], 38.000000, 36.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][4], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][4], 589505535);
    PlayerTextDrawFont(playerid, menuconfig[playerid][4], 5);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][4], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][4], true);
    PlayerTextDrawSetPreviewModel(playerid, menuconfig[playerid][4], 4663);
    PlayerTextDrawSetPreviewRot(playerid, menuconfig[playerid][4], 0.000000, 0.000000, 0.000000, 1.000000);

    menuconfig[playerid][5] = CreatePlayerTextDraw(playerid, 232.666641, 138.977737, "Thommas_Shelby");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][5], 0.113333, 0.969479);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][5], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][5], 255);
    PlayerTextDrawFont(playerid, menuconfig[playerid][5], 2);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][5], 0);

    menuconfig[playerid][6] = CreatePlayerTextDraw(playerid, 228.666671, 248.074066, "Editar_Personaje");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][6], 0.174333, 0.957036);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][6], 277.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][6], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][6], 255);
    PlayerTextDrawUseBox(playerid, menuconfig[playerid][6], 1);
    PlayerTextDrawBoxColor(playerid, menuconfig[playerid][6], -1061109505);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][6], 255);
    PlayerTextDrawFont(playerid, menuconfig[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][6], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][6], true);

    menuconfig[playerid][7] = CreatePlayerTextDraw(playerid, 228.666671, 261.348144, "Eliminar_Personaje");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][7], 0.163999, 0.998516);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][7], 277.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][7], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][7], -1061109505);
    PlayerTextDrawUseBox(playerid, menuconfig[playerid][7], 1);
    PlayerTextDrawBoxColor(playerid, menuconfig[playerid][7], -1523963137);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][7], 255);
    PlayerTextDrawFont(playerid, menuconfig[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][7], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][7], true);

    menuconfig[playerid][8] = CreatePlayerTextDraw(playerid, 321.999938, 138.977874, "Seleccionar_Personaje");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][8], 0.185332, 1.201776);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][8], 388.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][8], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][8], -1061109505);
    PlayerTextDrawUseBox(playerid, menuconfig[playerid][8], 1);
    PlayerTextDrawBoxColor(playerid, menuconfig[playerid][8], 505290495);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][8], 255);
    PlayerTextDrawFont(playerid, menuconfig[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][8], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][8], true);

    menuconfig[playerid][9] = CreatePlayerTextDraw(playerid, 321.999969, 153.911224, "master-account");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][9], 0.185332, 1.201776);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][9], 388.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][9], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][9], -1061109505);
    PlayerTextDrawUseBox(playerid, menuconfig[playerid][9], 1);
    PlayerTextDrawBoxColor(playerid, menuconfig[playerid][9], 505290495);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][9], 255);
    PlayerTextDrawFont(playerid, menuconfig[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][9], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][9], true);

    menuconfig[playerid][10] = CreatePlayerTextDraw(playerid, 322.000000, 168.844543, "Comprar VIP");
    PlayerTextDrawLetterSize(playerid, menuconfig[playerid][10], 0.185332, 1.201776);
    PlayerTextDrawTextSize(playerid, menuconfig[playerid][10], 387.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, menuconfig[playerid][10], 1);
    PlayerTextDrawColor(playerid, menuconfig[playerid][10], 255);
    PlayerTextDrawUseBox(playerid, menuconfig[playerid][10], 1);
    PlayerTextDrawBoxColor(playerid, menuconfig[playerid][10], -1378294017);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, menuconfig[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, menuconfig[playerid][10], 255);
    PlayerTextDrawFont(playerid, menuconfig[playerid][10], 2);
    PlayerTextDrawSetProportional(playerid, menuconfig[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, menuconfig[playerid][10], 0);
    PlayerTextDrawSetSelectable(playerid, menuconfig[playerid][10], true);
}

cmd:config(playerid, paramas[])
{
    mostrarConfiguracion(playerid);
    return 1;
}
mostrarConfiguracion(playerid)
{
    TextDrawShowForPlayer(playerid, Menuconfiguracion);
    for(new d;d<11;d++) PlayerTextDrawShow(playerid, menuconfig[playerid][d]);

    PlayerTextDrawSetPreviewModel(playerid, menuconfig[playerid][0], personajeInfo[playerid][p_skin]);
    PlayerTextDrawSetString(playerid, menuconfig[playerid][5], personajeInfo[playerid][p_nombre]);

    for(new i;i<4;i++) PlayerTextDrawSetPreviewModel(playerid, menuconfig[playerid][i+1], toyInfo[playerid][toy_modelid][i]);

}
guardarToys(playerid)
{
    if(SQL::RowExists("accesorios", "toy_mkid", personajeInfo[playerid][p_listid]))
    {
        new xylos = SQL::Open(SQL::UPDATE, "accesorios", "toy_mkid", personajeInfo[playerid][p_listid]);
        SQL::WriteInt(xylos, "toy_mkid", toyInfo[playerid][toy_mkid]);

        SQL::WriteInt(xylos, "toy_modelid1", toyInfo[playerid][toy_modelid][0]);
        SQL::WriteInt(xylos, "toy_modelid2", toyInfo[playerid][toy_modelid][1]);
        SQL::WriteInt(xylos, "toy_modelid3", toyInfo[playerid][toy_modelid][2]);
        SQL::WriteInt(xylos, "toy_modelid4", toyInfo[playerid][toy_modelid][3]);


        SQL::WriteInt(xylos, "toy_bone1", toyInfo[playerid][toy_bone][0]);
        SQL::WriteInt(xylos, "toy_bone2", toyInfo[playerid][toy_bone][1]);
        SQL::WriteInt(xylos, "toy_bone3", toyInfo[playerid][toy_bone][2]);
        SQL::WriteInt(xylos, "toy_bone4", toyInfo[playerid][toy_bone][3]);

        SQL::WriteFloat(xylos, "toy1_pos1", toyInfo[playerid][Toy1][0]);
        SQL::WriteFloat(xylos, "toy1_pos2", toyInfo[playerid][Toy1][1]);
        SQL::WriteFloat(xylos, "toy1_pos3", toyInfo[playerid][Toy1][2]);
        SQL::WriteFloat(xylos, "toy1_pos4", toyInfo[playerid][Toy1][3]);
        SQL::WriteFloat(xylos, "toy1_pos5", toyInfo[playerid][Toy1][4]);
        SQL::WriteFloat(xylos, "toy1_pos6", toyInfo[playerid][Toy1][5]);
        SQL::WriteFloat(xylos, "toy1_pos7", toyInfo[playerid][Toy1][6]);
        SQL::WriteFloat(xylos, "toy1_pos8", toyInfo[playerid][Toy1][7]);
        SQL::WriteFloat(xylos, "toy1_pos9", toyInfo[playerid][Toy1][8]);


        SQL::WriteFloat(xylos, "toy2_pos1", toyInfo[playerid][Toy2][0]);
        SQL::WriteFloat(xylos, "toy2_pos2", toyInfo[playerid][Toy2][1]);
        SQL::WriteFloat(xylos, "toy2_pos3", toyInfo[playerid][Toy2][2]);
        SQL::WriteFloat(xylos, "toy2_pos4", toyInfo[playerid][Toy2][3]);
        SQL::WriteFloat(xylos, "toy2_pos5", toyInfo[playerid][Toy2][4]);
        SQL::WriteFloat(xylos, "toy2_pos6", toyInfo[playerid][Toy2][5]);
        SQL::WriteFloat(xylos, "toy2_pos7", toyInfo[playerid][Toy2][6]);
        SQL::WriteFloat(xylos, "toy2_pos8", toyInfo[playerid][Toy2][7]);
        SQL::WriteFloat(xylos, "toy2_pos9", toyInfo[playerid][Toy2][8]);

        SQL::WriteFloat(xylos, "toy3_pos1", toyInfo[playerid][Toy3][0]);
        SQL::WriteFloat(xylos, "toy3_pos2", toyInfo[playerid][Toy3][1]);
        SQL::WriteFloat(xylos, "toy3_pos3", toyInfo[playerid][Toy3][2]);
        SQL::WriteFloat(xylos, "toy3_pos4", toyInfo[playerid][Toy3][3]);
        SQL::WriteFloat(xylos, "toy3_pos5", toyInfo[playerid][Toy3][4]);
        SQL::WriteFloat(xylos, "toy3_pos6", toyInfo[playerid][Toy3][5]);
        SQL::WriteFloat(xylos, "toy3_pos7", toyInfo[playerid][Toy3][6]);
        SQL::WriteFloat(xylos, "toy3_pos8", toyInfo[playerid][Toy3][7]);
        SQL::WriteFloat(xylos, "toy3_pos9", toyInfo[playerid][Toy3][8]);

        SQL::WriteFloat(xylos, "toy4_pos1", toyInfo[playerid][Toy4][0]);
        SQL::WriteFloat(xylos, "toy4_pos2", toyInfo[playerid][Toy4][1]);
        SQL::WriteFloat(xylos, "toy4_pos3", toyInfo[playerid][Toy4][2]);
        SQL::WriteFloat(xylos, "toy4_pos4", toyInfo[playerid][Toy4][3]);
        SQL::WriteFloat(xylos, "toy4_pos5", toyInfo[playerid][Toy4][4]);
        SQL::WriteFloat(xylos, "toy4_pos6", toyInfo[playerid][Toy4][5]);
        SQL::WriteFloat(xylos, "toy4_pos7", toyInfo[playerid][Toy4][6]);
        SQL::WriteFloat(xylos, "toy4_pos8", toyInfo[playerid][Toy4][7]);
        SQL::WriteFloat(xylos, "toy4_pos9", toyInfo[playerid][Toy4][8]);

        SQL::WriteInt(xylos, "toy_colocado1", toyInfo[playerid][toy_colocado][0]);
        SQL::WriteInt(xylos, "toy_colocado2", toyInfo[playerid][toy_colocado][1]);
        SQL::WriteInt(xylos, "toy_colocado3", toyInfo[playerid][toy_colocado][2]);
        SQL::WriteInt(xylos, "toy_colocado4", toyInfo[playerid][toy_colocado][3]);

        SQL::Close(xylos);
    }
}
cargarToys(playerid)
{
    if(SQL::RowExists("accesorios", "toy_mkid", personajeInfo[playerid][p_listid]))
    {
        new xylos = SQL::Open(SQL::READ, "accesorios", "toy_mkid", personajeInfo[playerid][p_listid]);
        SQL::ReadInt(xylos, "toy_id", toyInfo[playerid][toy_id]);
        SQL::ReadInt(xylos, "toy_mkid", toyInfo[playerid][toy_mkid]);

        SQL::ReadInt(xylos, "toy_modelid1", toyInfo[playerid][toy_modelid][0]);
        SQL::ReadInt(xylos, "toy_modelid2", toyInfo[playerid][toy_modelid][1]);
        SQL::ReadInt(xylos, "toy_modelid3", toyInfo[playerid][toy_modelid][2]);
        SQL::ReadInt(xylos, "toy_modelid4", toyInfo[playerid][toy_modelid][3]);


        SQL::ReadInt(xylos, "toy_bone1", toyInfo[playerid][toy_bone][0]);
        SQL::ReadInt(xylos, "toy_bone2", toyInfo[playerid][toy_bone][1]);
        SQL::ReadInt(xylos, "toy_bone3", toyInfo[playerid][toy_bone][2]);
        SQL::ReadInt(xylos, "toy_bone4", toyInfo[playerid][toy_bone][3]);

        SQL::ReadFloat(xylos, "toy1_pos1", toyInfo[playerid][Toy1][0]);
        SQL::ReadFloat(xylos, "toy1_pos2", toyInfo[playerid][Toy1][1]);
        SQL::ReadFloat(xylos, "toy1_pos3", toyInfo[playerid][Toy1][2]);
        SQL::ReadFloat(xylos, "toy1_pos4", toyInfo[playerid][Toy1][3]);
        SQL::ReadFloat(xylos, "toy1_pos5", toyInfo[playerid][Toy1][4]);
        SQL::ReadFloat(xylos, "toy1_pos6", toyInfo[playerid][Toy1][5]);
        SQL::ReadFloat(xylos, "toy1_pos7", toyInfo[playerid][Toy1][6]);
        SQL::ReadFloat(xylos, "toy1_pos8", toyInfo[playerid][Toy1][7]);
        SQL::ReadFloat(xylos, "toy1_pos9", toyInfo[playerid][Toy1][8]);


        SQL::ReadFloat(xylos, "toy2_pos1", toyInfo[playerid][Toy2][0]);
        SQL::ReadFloat(xylos, "toy2_pos2", toyInfo[playerid][Toy2][1]);
        SQL::ReadFloat(xylos, "toy2_pos3", toyInfo[playerid][Toy2][2]);
        SQL::ReadFloat(xylos, "toy2_pos4", toyInfo[playerid][Toy2][3]);
        SQL::ReadFloat(xylos, "toy2_pos5", toyInfo[playerid][Toy2][4]);
        SQL::ReadFloat(xylos, "toy2_pos6", toyInfo[playerid][Toy2][5]);
        SQL::ReadFloat(xylos, "toy2_pos7", toyInfo[playerid][Toy2][6]);
        SQL::ReadFloat(xylos, "toy2_pos8", toyInfo[playerid][Toy2][7]);
        SQL::ReadFloat(xylos, "toy2_pos9", toyInfo[playerid][Toy2][8]);

        SQL::ReadFloat(xylos, "toy3_pos1", toyInfo[playerid][Toy3][0]);
        SQL::ReadFloat(xylos, "toy3_pos2", toyInfo[playerid][Toy3][1]);
        SQL::ReadFloat(xylos, "toy3_pos3", toyInfo[playerid][Toy3][2]);
        SQL::ReadFloat(xylos, "toy3_pos4", toyInfo[playerid][Toy3][3]);
        SQL::ReadFloat(xylos, "toy3_pos5", toyInfo[playerid][Toy3][4]);
        SQL::ReadFloat(xylos, "toy3_pos6", toyInfo[playerid][Toy3][5]);
        SQL::ReadFloat(xylos, "toy3_pos7", toyInfo[playerid][Toy3][6]);
        SQL::ReadFloat(xylos, "toy3_pos8", toyInfo[playerid][Toy3][7]);
        SQL::ReadFloat(xylos, "toy3_pos9", toyInfo[playerid][Toy3][8]);

        SQL::ReadFloat(xylos, "toy4_pos1", toyInfo[playerid][Toy4][0]);
        SQL::ReadFloat(xylos, "toy4_pos2", toyInfo[playerid][Toy4][1]);
        SQL::ReadFloat(xylos, "toy4_pos3", toyInfo[playerid][Toy4][2]);
        SQL::ReadFloat(xylos, "toy4_pos4", toyInfo[playerid][Toy4][3]);
        SQL::ReadFloat(xylos, "toy4_pos5", toyInfo[playerid][Toy4][4]);
        SQL::ReadFloat(xylos, "toy4_pos6", toyInfo[playerid][Toy4][5]);
        SQL::ReadFloat(xylos, "toy4_pos7", toyInfo[playerid][Toy4][6]);
        SQL::ReadFloat(xylos, "toy4_pos8", toyInfo[playerid][Toy4][7]);
        SQL::ReadFloat(xylos, "toy4_pos9", toyInfo[playerid][Toy4][8]);

        SQL::ReadInt(xylos, "toy_colocado1", toyInfo[playerid][toy_colocado][0]);
        SQL::ReadInt(xylos, "toy_colocado2", toyInfo[playerid][toy_colocado][1]);
        SQL::ReadInt(xylos, "toy_colocado3", toyInfo[playerid][toy_colocado][2]);
        SQL::ReadInt(xylos, "toy_colocado4", toyInfo[playerid][toy_colocado][3]);

        SQL::Close(xylos);
    }
}