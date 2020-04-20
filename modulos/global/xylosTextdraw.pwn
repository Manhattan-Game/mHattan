#include <YSI_Coding\y_hooks>

//login AND register
new Text:TDEditor_TD[3];
new PlayerText:TDEditor_PTD[MAX_PLAYERS][5];
//logonew Text:logo[7];
//personaje select
new Text:personajeglobal[1];
new PlayerText:personajeplayer[MAX_PLAYERS][6];
//
new PlayerText:crearpersonajee[MAX_PLAYERS][12];
new Text:crearpersonaje[2];
//subir nivel
new Text:subirnivel[4];
//CAMBIAR PJ
new PlayerText:cambiarpj[MAX_PLAYERS][4];



hook OnGameModeInit()
{
       // Login & Register by xylos
        TDEditor_TD[0] = TextDrawCreate(-1.666679, -1.800001, "mdl-2001:logo_fondo");
        TextDrawLetterSize(TDEditor_TD[0], 0.000000, 0.000000);
        TextDrawTextSize(TDEditor_TD[0], 643.000000, 451.000000);
        TextDrawAlignment(TDEditor_TD[0], 1);
        TextDrawColor(TDEditor_TD[0], -1);
        TextDrawSetShadow(TDEditor_TD[0], 0);
        TextDrawSetOutline(TDEditor_TD[0], 0);
        TextDrawBackgroundColor(TDEditor_TD[0], 255);
        TextDrawFont(TDEditor_TD[0], 4);
        TextDrawSetProportional(TDEditor_TD[0], 0);
        TextDrawSetShadow(TDEditor_TD[0], 0);

        TDEditor_TD[1] = TextDrawCreate(237.333312, 78.259284, "mdl-2001:logo_box");
        TextDrawLetterSize(TDEditor_TD[1], 0.000000, 0.000000);
        TextDrawTextSize(TDEditor_TD[1], 151.000000, 153.000000);
        TextDrawAlignment(TDEditor_TD[1], 1);
        TextDrawColor(TDEditor_TD[1], 757935615);
        TextDrawSetShadow(TDEditor_TD[1], 0);
        TextDrawSetOutline(TDEditor_TD[1], 0);
        TextDrawBackgroundColor(TDEditor_TD[1], 255);
        TextDrawFont(TDEditor_TD[1], 4);
        TextDrawSetProportional(TDEditor_TD[1], 0);
        TextDrawSetShadow(TDEditor_TD[1], 0);

        TDEditor_TD[2] = TextDrawCreate(290.000030, 76.599983, "mdl-2001:logo_m");
        TextDrawLetterSize(TDEditor_TD[2], 0.000000, 0.000000);
        TextDrawTextSize(TDEditor_TD[2], 38.000000, 47.000000);
        TextDrawAlignment(TDEditor_TD[2], 1);
        TextDrawColor(TDEditor_TD[2], -1);
        TextDrawSetShadow(TDEditor_TD[2], 0);
        TextDrawSetOutline(TDEditor_TD[2], 0);
        TextDrawBackgroundColor(TDEditor_TD[2], 255);
        TextDrawFont(TDEditor_TD[2], 4);
        TextDrawSetProportional(TDEditor_TD[2], 0);
        TextDrawSetShadow(TDEditor_TD[2], 0);
        TextDrawSetShadow(TDEditor_TD[1], 0);

        // seleccion personaje
        personajeglobal[0] = TextDrawCreate(181.666732, 124.303756, "mdl-2001:logo_box");
        TextDrawLetterSize(personajeglobal[0], 0.000000, 0.000000);
        TextDrawTextSize(personajeglobal[0], 286.000000, 175.000000);
        TextDrawAlignment(personajeglobal[0], 1);
        TextDrawColor(personajeglobal[0], 757935615);
        TextDrawSetShadow(personajeglobal[0], 0);
        TextDrawSetOutline(personajeglobal[0], 0);
        TextDrawBackgroundColor(personajeglobal[0], 255);
        TextDrawFont(personajeglobal[0], 4);
        TextDrawSetProportional(personajeglobal[0], 0);
        TextDrawSetShadow(personajeglobal[0], 0);

        // crear personaje
        crearpersonaje[0] = TextDrawCreate(267.523742, 101.679985, "¡Crea_tu_personaje!");
        TextDrawLetterSize(crearpersonaje[0], 0.400000, 1.600000);
        TextDrawAlignment(crearpersonaje[0], 1);
        TextDrawColor(crearpersonaje[0], -1523963137);
        TextDrawSetShadow(crearpersonaje[0], 0);
        TextDrawSetOutline(crearpersonaje[0], 0);
        TextDrawBackgroundColor(crearpersonaje[0], 255);
        TextDrawFont(crearpersonaje[0], 1);
        TextDrawSetProportional(crearpersonaje[0], 1);
        TextDrawSetShadow(crearpersonaje[0], 0);

        crearpersonaje[1] = TextDrawCreate(269.809448, 121.733352, "box");
        TextDrawLetterSize(crearpersonaje[1], 0.000000, -0.095238);
        TextDrawTextSize(crearpersonaje[1], 390.000000, 0.000000);
        TextDrawAlignment(crearpersonaje[1], 1);
        TextDrawColor(crearpersonaje[1], -5963521);
        TextDrawUseBox(crearpersonaje[1], 1);
        TextDrawBoxColor(crearpersonaje[1], 875639220);
        TextDrawSetShadow(crearpersonaje[1], 0);
        TextDrawSetOutline(crearpersonaje[1], 0);
        TextDrawBackgroundColor(crearpersonaje[1], 255);
        TextDrawFont(crearpersonaje[1], 1);
        TextDrawSetProportional(crearpersonaje[1], 1);
        TextDrawSetShadow(crearpersonaje[1], 0);

        // subir nivel
        subirnivel[0] = TextDrawCreate(280.857238, 12.933335, "box");
        TextDrawLetterSize(subirnivel[0], 0.000000, 2.076190);
        TextDrawTextSize(subirnivel[0], 375.000000, 0.000000);
        TextDrawAlignment(subirnivel[0], 1);
        TextDrawColor(subirnivel[0], -1);
        TextDrawUseBox(subirnivel[0], 1);
        TextDrawBoxColor(subirnivel[0], 1145324724);
        TextDrawSetShadow(subirnivel[0], 0);
        TextDrawSetOutline(subirnivel[0], 0);
        TextDrawBackgroundColor(subirnivel[0], 255);
        TextDrawFont(subirnivel[0], 1);
        TextDrawSetProportional(subirnivel[0], 1);
        TextDrawSetShadow(subirnivel[0], 0);

        subirnivel[1] = TextDrawCreate(280.476196, 9.520006, "O");
        TextDrawLetterSize(subirnivel[1], 0.680761, 2.491732);
        TextDrawAlignment(subirnivel[1], 1);
        TextDrawColor(subirnivel[1], -5963521);
        TextDrawSetShadow(subirnivel[1], 0);
        TextDrawSetOutline(subirnivel[1], 0);
        TextDrawBackgroundColor(subirnivel[1], 255);
        TextDrawFont(subirnivel[1], 2);
        TextDrawSetProportional(subirnivel[1], 1);
        TextDrawSetShadow(subirnivel[1], 0);

        subirnivel[2] = TextDrawCreate(284.285797, 17.626659, "+1");
        TextDrawLetterSize(subirnivel[2], 0.291047, 0.998400);
        TextDrawAlignment(subirnivel[2], 1);
        TextDrawColor(subirnivel[2], -5963521);
        TextDrawSetShadow(subirnivel[2], 0);
        TextDrawSetOutline(subirnivel[2], 0);
        TextDrawBackgroundColor(subirnivel[2], 255);
        TextDrawFont(subirnivel[2], 1);
        TextDrawSetProportional(subirnivel[2], 1);
        TextDrawSetShadow(subirnivel[2], 0);

        subirnivel[3] = TextDrawCreate(303.714324, 15.919986, "Subiste_de_nivel");
        TextDrawLetterSize(subirnivel[3], 0.178285, 1.309866);
        TextDrawAlignment(subirnivel[3], 1);
        TextDrawColor(subirnivel[3], -1061109505);
        TextDrawSetShadow(subirnivel[3], 0);
        TextDrawSetOutline(subirnivel[3], 0);
        TextDrawBackgroundColor(subirnivel[3], 255);
        TextDrawFont(subirnivel[3], 2);
        TextDrawSetProportional(subirnivel[3], 1);
        TextDrawSetShadow(subirnivel[3], 0);
        
        return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OnGameModeExit()
{
        // Destroy textdraw's
        for(new h;h<2;h++)      TextDrawDestroy(TDEditor_TD[h]);
        for(new j;j<2;j++)      TextDrawDestroy(crearpersonaje[j]);
        for(new t; t<4; t++)    TextDrawDestroy(subirnivel[t]);
        return Y_HOOKS_CONTINUE_RETURN_1;
}
hook OnPlayerDisconnect(playerid, reason)
{
        // destroy Textdraw's
        for(new u;u<11; u++)    PlayerTextDrawDestroy(playerid, crearpersonajee[playerid][u]);
        for(new g;g<6;g++)      PlayerTextDrawDestroy(playerid, personajeplayer[playerid][g]);
        for(new p;p<4;p++)      PlayerTextDrawDestroy(playerid, TDEditor_PTD[playerid][p]);

        return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerConnect(playerid)
{
        // login & register by xylos
        TDEditor_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 254.000061, 124.459289, "xylospeed");
        PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][0], 0.232333, 1.317924);
        PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][0], 366.000000, 0.000000);
        PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][0], 1);
        PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][0], 255);
        PlayerTextDrawUseBox(playerid, TDEditor_PTD[playerid][0], 1);
        PlayerTextDrawBoxColor(playerid, TDEditor_PTD[playerid][0], -1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][0], 0);
        PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][0], 0);
        PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][0], -1);
        PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][0], 1);
        PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][0], 1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][0], 0);
        PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][0], true);

        TDEditor_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 253.666763, 145.200042, "password");
        PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][1], 0.232333, 1.317924);
        PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][1], 366.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][1], 1);
        PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][1], 255);
        PlayerTextDrawUseBox(playerid, TDEditor_PTD[playerid][1], 1);
        PlayerTextDrawBoxColor(playerid, TDEditor_PTD[playerid][1], -1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][1], 0);
        PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][1], 0);
        PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][1], -1);
        PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][1], 1);
        PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][1], 1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][1], 0);
        PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][1], true);

        TDEditor_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 252.666702, 206.592819, "Registrar");
        PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][2], 0.232333, 1.317924);
        PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][2], 287.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][2], 1);
        PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][2], -1);
        PlayerTextDrawUseBox(playerid, TDEditor_PTD[playerid][2], 1);
        PlayerTextDrawBoxColor(playerid, TDEditor_PTD[playerid][2], 336860415);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][2], 0);
        PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][2], 0);
        PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][2], -1);
        PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][2], 1);
        PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][2], 1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][2], 0);
        PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][2], true);

        
        TDEditor_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 292.666656, 206.592834, "Cancelar");
        PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][3], 0.232333, 1.317924);
        PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][3], 328.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][3], 1);
        PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][3], -1);
        PlayerTextDrawUseBox(playerid, TDEditor_PTD[playerid][3], 1);
        PlayerTextDrawBoxColor(playerid, TDEditor_PTD[playerid][3], -1523963137);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);
        PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][3], 0);
        PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][3], -1);
        PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][3], 1);
        PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][3], 1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);
        PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][3], true);



        TDEditor_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 253.333404, 166.355590, "email");
        PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][4], 0.232333, 1.317924);
        PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][4], 366.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][4], 1);
        PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][4], 255);
        PlayerTextDrawUseBox(playerid, TDEditor_PTD[playerid][4], 1);
        PlayerTextDrawBoxColor(playerid, TDEditor_PTD[playerid][4], -1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);
        PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][4], 0);
        PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][4], -1);
        PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][4], 1);
        PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][4], 1);
        PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);
        PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][4], true);

        // Personajes by xylos
        

        personajeplayer[playerid][0] = CreatePlayerTextDraw(playerid, 214.000091, 141.311004, "");
        PlayerTextDrawLetterSize(playerid, personajeplayer[playerid][0], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, personajeplayer[playerid][0], 69.000000, 114.000000);
        PlayerTextDrawAlignment(playerid, personajeplayer[playerid][0], 1);
        PlayerTextDrawColor(playerid, personajeplayer[playerid][0], -1);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][0], 0);
        PlayerTextDrawSetOutline(playerid, personajeplayer[playerid][0], 0);
        PlayerTextDrawBackgroundColor(playerid, personajeplayer[playerid][0], 0);
        PlayerTextDrawFont(playerid, personajeplayer[playerid][0], 5);
        PlayerTextDrawSetProportional(playerid, personajeplayer[playerid][0], 0);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][0], 0);
        PlayerTextDrawSetPreviewModel(playerid, personajeplayer[playerid][0], 270);
        PlayerTextDrawSetPreviewRot(playerid, personajeplayer[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

        personajeplayer[playerid][1] = CreatePlayerTextDraw(playerid, 282.000091, 140.066543, "");
        PlayerTextDrawLetterSize(playerid, personajeplayer[playerid][1], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, personajeplayer[playerid][1], 69.000000, 114.000000);
        PlayerTextDrawAlignment(playerid, personajeplayer[playerid][1], 1);
        PlayerTextDrawColor(playerid, personajeplayer[playerid][1], -1);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][1], 0);
        PlayerTextDrawSetOutline(playerid, personajeplayer[playerid][1], 0);
        PlayerTextDrawBackgroundColor(playerid, personajeplayer[playerid][1], 0);
        PlayerTextDrawFont(playerid, personajeplayer[playerid][1], 5);
        PlayerTextDrawSetProportional(playerid, personajeplayer[playerid][1], 0);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][1], 0);
        PlayerTextDrawSetPreviewModel(playerid, personajeplayer[playerid][1], 270);
        PlayerTextDrawSetPreviewRot(playerid, personajeplayer[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

        personajeplayer[playerid][2] = CreatePlayerTextDraw(playerid, 351.333496, 140.066513, "");
        PlayerTextDrawLetterSize(playerid, personajeplayer[playerid][2], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, personajeplayer[playerid][2], 69.000000, 114.000000);
        PlayerTextDrawAlignment(playerid, personajeplayer[playerid][2], 1);
        PlayerTextDrawColor(playerid, personajeplayer[playerid][2], -1);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][2], 0);
        PlayerTextDrawSetOutline(playerid, personajeplayer[playerid][2], 0);
        PlayerTextDrawBackgroundColor(playerid, personajeplayer[playerid][2], 0);
        PlayerTextDrawFont(playerid, personajeplayer[playerid][2], 5);
        PlayerTextDrawSetProportional(playerid, personajeplayer[playerid][2], 0);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][2], 0);
        PlayerTextDrawSetPreviewModel(playerid, personajeplayer[playerid][2], 270);
        PlayerTextDrawSetPreviewRot(playerid, personajeplayer[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);


        personajeplayer[playerid][3] = CreatePlayerTextDraw(playerid, 221.666687, 268.814819, "Slot_vacio");
        PlayerTextDrawLetterSize(playerid, personajeplayer[playerid][3], 0.163333, 1.429926);
        PlayerTextDrawTextSize(playerid, personajeplayer[playerid][3], 280.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, personajeplayer[playerid][3], 1);
        PlayerTextDrawColor(playerid, personajeplayer[playerid][3], -1);
        PlayerTextDrawUseBox(playerid, personajeplayer[playerid][3], 1);
        PlayerTextDrawBoxColor(playerid, personajeplayer[playerid][3], 505290495);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][3], 0);
        PlayerTextDrawSetOutline(playerid, personajeplayer[playerid][3], 0);
        PlayerTextDrawBackgroundColor(playerid, personajeplayer[playerid][3], 255);
        PlayerTextDrawFont(playerid, personajeplayer[playerid][3], 1);
        PlayerTextDrawSetProportional(playerid, personajeplayer[playerid][3], 1);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][3], 0);
        PlayerTextDrawSetSelectable(playerid, personajeplayer[playerid][3], true);

        personajeplayer[playerid][4] = CreatePlayerTextDraw(playerid, 291.000122, 268.814727, "Slot_vacio");
        PlayerTextDrawLetterSize(playerid, personajeplayer[playerid][4], 0.163333, 1.429926);
        PlayerTextDrawTextSize(playerid, personajeplayer[playerid][4], 350.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, personajeplayer[playerid][4], 1);
        PlayerTextDrawColor(playerid, personajeplayer[playerid][4], -1);
        PlayerTextDrawUseBox(playerid, personajeplayer[playerid][4], 1);
        PlayerTextDrawBoxColor(playerid, personajeplayer[playerid][4], 505290495);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][4], 0);
        PlayerTextDrawSetOutline(playerid, personajeplayer[playerid][4], 0);
        PlayerTextDrawBackgroundColor(playerid, personajeplayer[playerid][4], 255);
        PlayerTextDrawFont(playerid, personajeplayer[playerid][4], 1);
        PlayerTextDrawSetProportional(playerid, personajeplayer[playerid][4], 1);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][4], 0);
        PlayerTextDrawSetSelectable(playerid, personajeplayer[playerid][4], true);

        personajeplayer[playerid][5] = CreatePlayerTextDraw(playerid, 361.666809, 269.229522, "Slot_vacio");
        PlayerTextDrawLetterSize(playerid, personajeplayer[playerid][5], 0.163333, 1.429926);
        PlayerTextDrawTextSize(playerid, personajeplayer[playerid][5], 420.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, personajeplayer[playerid][5], 1);
        PlayerTextDrawColor(playerid, personajeplayer[playerid][5], -1);
        PlayerTextDrawUseBox(playerid, personajeplayer[playerid][5], 1);
        PlayerTextDrawBoxColor(playerid, personajeplayer[playerid][5], 505290495);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][5], 0);
        PlayerTextDrawSetOutline(playerid, personajeplayer[playerid][5], 0);
        PlayerTextDrawBackgroundColor(playerid, personajeplayer[playerid][5], 255);
        PlayerTextDrawFont(playerid, personajeplayer[playerid][5], 1);
        PlayerTextDrawSetProportional(playerid, personajeplayer[playerid][5], 1);
        PlayerTextDrawSetShadow(playerid, personajeplayer[playerid][5], 0);
        PlayerTextDrawSetSelectable(playerid, personajeplayer[playerid][5], true);


        // crear personaje
        crearpersonajee[playerid][0] = CreatePlayerTextDraw(playerid, 292.285705, 129.413360, "Nombre_Apellido");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][0], 0.266285, 1.472000);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][0], 366.000000, 17.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][0], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][0], -1061109505);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][0], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][0], 875639220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][0], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][0], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][0], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][0], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][0], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][0], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][0], true);

        crearpersonajee[playerid][1] = CreatePlayerTextDraw(playerid, 291.904754, 151.173339, "SEXO: Hombre");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][1], 0.266285, 1.472000);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][1], 366.000000, 17.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][1], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][1], -1061109505);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][1], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][1], 875639220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][1], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][1], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][1], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][1], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][1], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][1], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][1], true);

        crearpersonajee[playerid][2] = CreatePlayerTextDraw(playerid, 291.904754, 173.359985, "EDAD: 18");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][2], 0.266285, 1.472000);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][2], 366.000000, 17.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][2], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][2], -1061109505);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][2], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][2], 875639220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][2], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][2], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][2], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][2], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][2], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][2], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][2], true);

        crearpersonajee[playerid][3] = CreatePlayerTextDraw(playerid, 291.523803, 196.399963, "Origen: Italia");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][3], 0.266285, 1.472000);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][3], 366.000000, 17.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][3], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][3], -1061109505);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][3], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][3], 875639220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][3], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][3], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][3], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][3], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][3], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][3], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][3], true);

        crearpersonajee[playerid][4] = CreatePlayerTextDraw(playerid, 291.904754, 220.293319, "Crear_personaje");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][4], 0.225142, 1.365334);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][4], 350.000000, 17.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][4], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][4], -1061109505);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][4], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][4], 8388863);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][4], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][4], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][4], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][4], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][4], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][4], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][4], true);

        crearpersonajee[playerid][5] = CreatePlayerTextDraw(playerid, 355.904693, 220.719985, "X");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][5], 0.355428, 1.365333);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][5], 365.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][5], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][5], -1061109505);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][5], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][5], -2147483393);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][5], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][5], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][5], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][5], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][5], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][5], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][5], true);


        crearpersonajee[playerid][6] = CreatePlayerTextDraw(playerid, 275.523773, 151.600036, "<");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][6], 0.400761, 1.356800);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][6], 285.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][6], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][6], -5963521);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][6], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][6], 2081559220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][6], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][6], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][6], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][6], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][6], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][6], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][6], true);

        crearpersonajee[playerid][7] = CreatePlayerTextDraw(playerid, 372.285614, 152.026702, ">");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][7], 0.400761, 1.356800);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][7], 382.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][7], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][7], -5963521);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][7], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][7], 2081559220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][7], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][7], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][7], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][7], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][7], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][7], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][7], true);

        crearpersonajee[playerid][8] = CreatePlayerTextDraw(playerid, 275.523773, 173.360015, "<");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][8], 0.400761, 1.356800);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][8], 285.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][8], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][8], -5963521);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][8], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][8], 2081559220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][8], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][8], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][8], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][8], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][8], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][8], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][8], true);

        crearpersonajee[playerid][9] = CreatePlayerTextDraw(playerid, 373.428466, 173.786682, ">");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][9], 0.400761, 1.356800);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][9], 383.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][9], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][9], -5963521);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][9], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][9], 2081559220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][9], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][9], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][9], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][9], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][9], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][9], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][9], true);

        crearpersonajee[playerid][10] = CreatePlayerTextDraw(playerid, 275.904724, 196.399993, "<");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][10], 0.400761, 1.356800);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][10], 285.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][10], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][10], -5963521);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][10], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][10], 2081559220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][10], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][10], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][10], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][10], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][10], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][10], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][10], true);

        crearpersonajee[playerid][11] = CreatePlayerTextDraw(playerid, 373.428466, 196.826660, ">");
        PlayerTextDrawLetterSize(playerid, crearpersonajee[playerid][11], 0.400761, 1.356800);
        PlayerTextDrawTextSize(playerid, crearpersonajee[playerid][11], 384.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, crearpersonajee[playerid][11], 1);
        PlayerTextDrawColor(playerid, crearpersonajee[playerid][11], -5963521);
        PlayerTextDrawUseBox(playerid, crearpersonajee[playerid][11], 1);
        PlayerTextDrawBoxColor(playerid, crearpersonajee[playerid][11], 2081559220);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][11], 0);
        PlayerTextDrawSetOutline(playerid, crearpersonajee[playerid][11], 0);
        PlayerTextDrawBackgroundColor(playerid, crearpersonajee[playerid][11], 255);
        PlayerTextDrawFont(playerid, crearpersonajee[playerid][11], 1);
        PlayerTextDrawSetProportional(playerid, crearpersonajee[playerid][11], 1);
        PlayerTextDrawSetShadow(playerid, crearpersonajee[playerid][11], 0);
        PlayerTextDrawSetSelectable(playerid, crearpersonajee[playerid][11], true);
        
        // Cambiar PJ

        cambiarpj[playerid][0] = CreatePlayerTextDraw(playerid, 262.714294, 183.159973, "");
        PlayerTextDrawLetterSize(playerid, cambiarpj[playerid][0], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, cambiarpj[playerid][0], 44.000000, 59.000000);
        PlayerTextDrawAlignment(playerid, cambiarpj[playerid][0], 1);
        PlayerTextDrawColor(playerid, cambiarpj[playerid][0], -1);
        PlayerTextDrawSetShadow(playerid, cambiarpj[playerid][0], 0);
        PlayerTextDrawSetOutline(playerid, cambiarpj[playerid][0], 0);
        PlayerTextDrawBackgroundColor(playerid, cambiarpj[playerid][0], 875639210);
        PlayerTextDrawFont(playerid, cambiarpj[playerid][0], 5);
        PlayerTextDrawSetProportional(playerid, cambiarpj[playerid][0], 0);
        PlayerTextDrawSetShadow(playerid, cambiarpj[playerid][0], 0);
        PlayerTextDrawSetSelectable(playerid, cambiarpj[playerid][0], true);
        PlayerTextDrawSetPreviewModel(playerid, cambiarpj[playerid][0], 270);
        PlayerTextDrawSetPreviewRot(playerid, cambiarpj[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);

        cambiarpj[playerid][1] = CreatePlayerTextDraw(playerid, 262.714324, 120.013305, "");
        PlayerTextDrawLetterSize(playerid, cambiarpj[playerid][1], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, cambiarpj[playerid][1], 44.000000, 59.000000);
        PlayerTextDrawAlignment(playerid, cambiarpj[playerid][1], 1);
        PlayerTextDrawColor(playerid, cambiarpj[playerid][1], -1);
        PlayerTextDrawSetShadow(playerid, cambiarpj[playerid][1], 0);
        PlayerTextDrawSetOutline(playerid, cambiarpj[playerid][1], 0);
        PlayerTextDrawBackgroundColor(playerid, cambiarpj[playerid][1], 875639210);
        PlayerTextDrawFont(playerid, cambiarpj[playerid][1], 5);
        PlayerTextDrawSetProportional(playerid, cambiarpj[playerid][1], 0);
        PlayerTextDrawSetShadow(playerid, cambiarpj[playerid][1], 0);
        PlayerTextDrawSetSelectable(playerid, cambiarpj[playerid][1], true);
        PlayerTextDrawSetPreviewModel(playerid, cambiarpj[playerid][1], 294);
        PlayerTextDrawSetPreviewRot(playerid, cambiarpj[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

        cambiarpj[playerid][2] = CreatePlayerTextDraw(playerid, 310.333160, 119.586585, "");
        PlayerTextDrawLetterSize(playerid, cambiarpj[playerid][2], 0.000000, 0.000000);
        PlayerTextDrawTextSize(playerid, cambiarpj[playerid][2], 44.000000, 59.000000);
        PlayerTextDrawAlignment(playerid, cambiarpj[playerid][2], 1);
        PlayerTextDrawColor(playerid, cambiarpj[playerid][2], -1);
        PlayerTextDrawSetShadow(playerid, cambiarpj[playerid][2], 0);
        PlayerTextDrawSetOutline(playerid, cambiarpj[playerid][2], 0);
        PlayerTextDrawBackgroundColor(playerid, cambiarpj[playerid][2], 875639210);
        PlayerTextDrawFont(playerid, cambiarpj[playerid][2], 5);
        PlayerTextDrawSetProportional(playerid, cambiarpj[playerid][2], 0);
        PlayerTextDrawSetShadow(playerid, cambiarpj[playerid][2], 0);
        PlayerTextDrawSetSelectable(playerid, cambiarpj[playerid][2], true);
        PlayerTextDrawSetPreviewModel(playerid, cambiarpj[playerid][2], 305);
        PlayerTextDrawSetPreviewRot(playerid, cambiarpj[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

        cambiarpj[playerid][3] = CreatePlayerTextDraw(playerid, 311.714263, 186.586669, "X");
        PlayerTextDrawLetterSize(playerid, cambiarpj[playerid][3], 0.405333, 1.036800);
        PlayerTextDrawTextSize(playerid, cambiarpj[playerid][3], 321.000000, 10.000000);
        PlayerTextDrawAlignment(playerid, cambiarpj[playerid][3], 1);
        PlayerTextDrawColor(playerid, cambiarpj[playerid][3], -2139062017);
        PlayerTextDrawUseBox(playerid, cambiarpj[playerid][3], 1);
        PlayerTextDrawBoxColor(playerid, cambiarpj[playerid][3], -2147483393);
        PlayerTextDrawSetShadow(playerid,cambiarpj[playerid][3], 0);
        PlayerTextDrawSetOutline(playerid, cambiarpj[playerid][3], 0);
        PlayerTextDrawBackgroundColor(playerid, cambiarpj[playerid][3], 255);
        PlayerTextDrawFont(playerid, cambiarpj[playerid][3], 1);
        PlayerTextDrawSetProportional(playerid,cambiarpj[playerid][3], 1);
        PlayerTextDrawSetShadow(playerid, cambiarpj[playerid][3], 0);
        PlayerTextDrawSetSelectable(playerid, cambiarpj[playerid][3], true);

        return Y_HOOKS_CONTINUE_RETURN_0;
}