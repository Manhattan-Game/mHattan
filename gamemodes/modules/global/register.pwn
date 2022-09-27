// Enums para MiamiSide por Xylospeed
#include <YSI_Coding\y_hooks>

new Text:cinematic[2];
new PlayerText: cinematic2[MAX_PLAYERS];

new Text:selectPablo[5];

new Text:register[4];
new PlayerText:registerP[MAX_PLAYERS][6];

new pasos[MAX_PLAYERS][4];

new botPablo;

new areaPablo;

#define d_Pablo

hook OnGameModeInit()
{   
    

    Audio_SetPack("default_pack");

    cinematic[0] = TextDrawCreate(-0.666652, -1.229618, "box");
    TextDrawLetterSize(cinematic[0], 0.000000, 49.900001);
    TextDrawTextSize(cinematic[0], 665.000000, 0.000000);
    TextDrawAlignment(cinematic[0], 1);
    TextDrawColor(cinematic[0], -1);
    TextDrawUseBox(cinematic[0], 1);
    TextDrawBoxColor(cinematic[0], 255);
    TextDrawSetShadow(cinematic[0], 0);
    TextDrawSetOutline(cinematic[0], 0);
    TextDrawBackgroundColor(cinematic[0], 255);
    TextDrawFont(cinematic[0], 1);
    TextDrawSetProportional(cinematic[0], 1);
    TextDrawSetShadow(cinematic[0], 0);

    cinematic[1] = TextDrawCreate(201.000015, 172.577758, "Broadway_Games");
    TextDrawLetterSize(cinematic[1], 0.655333, 2.259554);
    TextDrawAlignment(cinematic[1], 1);
    TextDrawColor(cinematic[1], -1);
    TextDrawSetShadow(cinematic[1], 0);
    TextDrawSetOutline(cinematic[1], 0);
    TextDrawBackgroundColor(cinematic[1], 255);
    TextDrawFont(cinematic[1], 0);
    TextDrawSetProportional(cinematic[1], 1);
    TextDrawSetShadow(cinematic[1], 0);
    TextDrawSetSelectable(cinematic[1], true);
}
hook OnPlayerConnect(playerid)
{

    cinematic2[playerid] = CreatePlayerTextDraw(playerid, 292.999969, 202.444442, "presenta...");
    PlayerTextDrawLetterSize(playerid, cinematic2[playerid], 0.400000, 1.600000);
    PlayerTextDrawAlignment(playerid, cinematic2[playerid], 1);
    PlayerTextDrawColor(playerid, cinematic2[playerid], -1);
    PlayerTextDrawSetShadow(playerid, cinematic2[playerid], 0);
    PlayerTextDrawSetOutline(playerid, cinematic2[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, cinematic2[playerid], 255);
    PlayerTextDrawFont(playerid, cinematic2[playerid], 1);
    PlayerTextDrawSetProportional(playerid, cinematic2[playerid], 1);
    PlayerTextDrawSetShadow(playerid, cinematic2[playerid], 0);


    
}

}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){

    switch(dialogid){

        case d_crearpj4:
        {
            if(response)
            {
                if(strfind(inputtext, "_", true) != -1)
                {
                    if(!IsNumeric(inputtext))
                    {
                        if(!SQL::RowExistsEx("Personajes", "p_nombre", inputtext))
                        { 
                        PlayerTextDrawSetString(playerid, registerP[playerid][0], inputtext);


                        new var[90];
                        format(var, 128, "Firma: %s", inputtext);
                        PlayerTextDrawSetString(playerid, registerP[playerid][3], var);
                        SetPlayerName(playerid, inputtext);


                        format(nombreMK[playerid], 60, "%s", inputtext);
                        pasos[playerid][0] = 1;
                        }
                        else ShowPlayerDialog(playerid, d_crearpj4, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa un nombre(Formato: Nombre_Apellido):", "continuar", ""Chat_Rojo" atras");
                    }
                }
                else ShowPlayerDialog(playerid, d_crearpj4, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa un nombre(Formato: Nombre_Apellido):", "continuar", ""Chat_Rojo" atras");
            }
        }
        case d_crearpj5:
        {
            if(response)
            {
                if(IsNumeric(inputtext))
                {
                    new namber = strval(inputtext);
                    if(namber < 99 && namber > 1)
                    {
                        new string[40];
                        pasos[playerid][1] = 1;
                        format(string, 128, "%i", namber);
                        PlayerTextDrawSetString(playerid, registerP[playerid][1], string);
                        edad[playerid] = namber;
                    }
                    else ShowPlayerDialog(playerid, d_crearpj5, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa tu edad(Minimo 18-90 Max):", "continuar", ""Chat_Rojo" atras");

                }
                else ShowPlayerDialog(playerid, d_crearpj5, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa tu edad(Minimo 18-90 Max):", "continuar", ""Chat_Rojo" atras");
            }
        }
        case d_crearpj6:
        {
            if(response)
            {
                pasos[playerid][2] = 1;
                sexoMK[playerid] = 1;
                PlayerTextDrawSetString(playerid, registerP[playerid][2], "Hombre");
                skinMK[playerid] = 30;

                PlayerTextDrawSetPreviewModel(playerid, registerP[playerid][5], 30);
                PlayerTextDrawShow(playerid, registerP[playerid][5]);

            }
            else
            {
                pasos[playerid][2] = 1;
                sexoMK[playerid] = 0;
                PlayerTextDrawSetString(playerid, registerP[playerid][2], "Mujer");
                skinMK[playerid] = 41;

                PlayerTextDrawSetPreviewModel(playerid, registerP[playerid][5], 41);
                PlayerTextDrawShow(playerid, registerP[playerid][5]);
            }
        }
    }
}


forward mostrarComienzoCinematica(playerid);
public mostrarComienzoCinematica(playerid){

    for(new s; s<5;s++) TextDrawShowForPlayer(playerid, selectPablo[s]);
}
cinematicPaso1(playerid){

    for(new s; s<5;s++) TextDrawHideForPlayer(playerid, selectPablo[s]);
    SetWorldTime(6);
    Audio_Play(playerid, 1);
    TogglePlayerWidescreen(playerid, true);


    for(new i; i<2;i++) TextDrawShowForPlayer(playerid, cinematic[i]);
    PlayerTextDrawShow(playerid, cinematic2[playerid]);

    SetTimerEx("cambiarText", 4000, false, "d", playerid);

    for(new h;h<100;h++) SendClientMessage(playerid, -1, " ");
}


forward cambiarText(playerid);
public cambiarText(playerid){

    TextDrawHideForPlayer(playerid, cinematic[1]);
    PlayerTextDrawSetString(playerid, cinematic2[playerid], "Miami 1983 (s)");
    SetTimerEx("camera1", 3000, false, "d", playerid);
}


forward camera1(playerid);
public camera1(playerid){

    for(new i; i<2;i++) TextDrawHideForPlayer(playerid, cinematic[i]);
    PlayerTextDrawHide(playerid, cinematic2[playerid]);
    TextDrawHideForPlayer(playerid, TDEditor_TD[0]);


    SetPlayerCameraPos(playerid, 1969.0182,2083.2849,18.2659);
    InterpolatePlayerCamera(playerid, 1969.0182,2083.2849,18.2659, 1902.5524,2060.4119, 18.0, 1941.9364,1971.2435,18.3511,  1838.1541,1978.8344,18.0950, 25000);

    SetTimerEx("camera2", 14000, false, "d", playerid);
}

forward camera2(playerid);
public camera2(playerid){
    InterpolatePlayerCamera(playerid, 1838.1541,1978.8344,18.0950, 1902.5524,2060.4119, 18.0, 1814.7450,2070.6208,18.2902, 1793.4146,1991.2638,18.8879, 25000);
    
    SetTimerEx("camera3", 12000, false, "d", playerid);
}

forward camera3(playerid);
public camera3(playerid){
    InterpolatePlayerCamera(playerid, 1814.7450,2070.6208,18.2902, 1902.5524,2060.4119, 18.0, 1741.3148,1947.4386,18.2346, 1877.4675,2036.8923,15.2437, 25000);
    SetTimerEx("camera4", 23000, false, "d", playerid);
}
forward camera4(playerid);
public camera4(playerid)
{
    Audio_Stop(playerid, 1);

    new xylos[300];
    switch(registrandoSlot[playerid])
    {
        case 1:
        {
            mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Personajes WHERE p_nombre = '%e' ", masterInfo[playerid][_personaje1]);
        }
        case 2:
        {
            mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Personajes WHERE p_nombre = '%e' ", masterInfo[playerid][_personaje2]);
        }
        case 3:
        {
            mysql_format(xylosMYSQL, xylos, sizeof(xylos), "SELECT * FROM Personajes WHERE p_nombre = '%e' ", masterInfo[playerid][_personaje3]);
        }
    }
    mysql_pquery(xylosMYSQL, xylos, "loguearPersonaje", "d", playerid);

    enviarNotificacion(playerid, "Si te acercas a la lancha entraras en zona de Mision");
    TogglePlayerWidescreen(playerid, false);
}


mostrarRegistro(playerid){

    for(new d=0; d<6; d++) PlayerTextDrawHide(playerid, personajeplayer[playerid][d]);
    TextDrawHideForPlayer(playerid, personajeglobal[0]);


    for(new i;i<4;i++) TextDrawShowForPlayer(playerid, register[i]);
    for(new a;a<6;a++) PlayerTextDrawShow(playerid, registerP[playerid][a]);

    origenMK[playerid] = generarDNI();
    new string[40]; format(string, 40, "%i", origenMK[playerid]);
    PlayerTextDrawSetString(playerid, registerP[playerid][4], string);
}



stock generarDNI(){

    new control = random(999000 - 100000) + 100000;
    return control;
}
new bool:pabloLibre;
new pabloMisionsCount;
new bool:enMision[MAX_PLAYERS];
new timerMision;
new completeCount;

hook OP_EnterDynamicArea(playerid, areaid)
{
    if(areaid == areaPablo)
    {
        if(personajeInfo[playerid][p_spawn] == true)
        {
            if(enMision[playerid] == false)
            {
                if(pabloLibre == false)
                {
                    if(personajeInfo[playerid][p_inventario] == 0) { enviarNotificacionG(playerid, "Necesitas registrar un inventario, Toca la tecla N"); }
                    enviarNotificacionG(playerid, "Entraste en zona de mision: Pablo Escobar #1");
                    if(pabloMisionsCount <= 3)
                    {
                        if(pabloMisionsCount == 0)
                        { 
                            timerMision = SetTimer("timerPablo", 15000, false);
                        }
                        pabloMisionsCount++;
                        ShowInfoForPlayer(playerid, "Fuiste agregado a la cola de Mision", 7000);
                        enMision[playerid] = true;
                    }
                }
            }
        }
    }
}
hook OP_LeaveDynamicArea(playerid, areaid)
{
    if(areaid == areaPablo)
    {
        if(personajeInfo[playerid][p_spawn] == true)
        {
            if(enMision[playerid] == false)
            {
                enviarNotificacionG(playerid, "Saliste de zona mision: Pablo Escobar #1");
                enMision[playerid] = false;
                pabloMisionsCount--;
                if(pabloMisionsCount == 0)
                {
                    KillTimer(timerMision);
                }
            }
        }
    }
}

forward timerPablo();
public timerPablo()
{
    pabloLibre = true;
    for(new i;i<MAX_PLAYERS;i++)
    {
        if(enMision[i] == true)
        {
            SetPlayerPos(i, 1829.9076,2044.1589,1.7059);
            congelarUsuario(i, 3000);
            ShowInfoForPlayer(i, "~y~~h~Pablo_Escobar: ~w~ quedese arriba de la lancha que necesito que lo necesito en algo", 3000);
        }
    }
    FCNPC_GoTo(botPablo, 1765.8585,2126.8450, 0.0638, FCNPC_MOVE_TYPE_AUTO, 0.7);
    SetTimer("timerPablo2", 5000, false);
}
forward timerPablo2();
public timerPablo2()
{
    FCNPC_GoTo(botPablo, 1555.9203,2142.0959, 0.1004, FCNPC_MOVE_TYPE_AUTO, 0.7);
    SetTimer("timerPablo3", 19000, false);
}
forward timerPablo3();
public timerPablo3()
{
    FCNPC_GoTo(botPablo, 1605.5538,2232.1719,0.9009, FCNPC_MOVE_TYPE_AUTO, 0.7);
    SetTimer("timerPablo4", 10000, false);
}
forward timerPablo4();
public timerPablo4()
{
    for(new i;i<MAX_PLAYERS;i++)
    {
        if(enMision[i] == true)
        {
            ShowInfoForPlayer(i, "~y~~h~Pablo_Escobar: ~w~ Tiren el cargamento al agua", 3000);
            agregarIttem(i, 22, 1);
            enviarNotificacionG(i, "Abre tu inventario con la tecla N y tira el cargamento al agua");
            enviarNotificacionG(i, "Tienen 20 segundos para finalizar");
        }
    }
    SetTimer("timerPablo5", 20000, false);
}
forward timerPablo5();
public timerPablo5()
{
    if(completeCount == pabloMisionsCount)
    {
        for(new i;i<MAX_PLAYERS;i++)
        {
            if(enMision[i] == true)
            {
                enviarNotificacionG(i, "Mision completada");

                personajeInfo[i][p_exp] = 0;
                personajeInfo[i][p_nivel]++;
                for(new d; d<3; d++) TextDrawShowForPlayer(i, pagodiario[d]);
                SetTimerEx("esconderPagodiario", 4000, false, "d", i);
                SetPlayerPos(i, 6005.3887,110.8860,10.5760);
                congelarUsuario(i, 2000); 
                enMision[i] = false;
            }
        }
        SetVehiclePos(vehiclesPablo[1], 1830.8799,2043.0314,-1.2193);
        FCNPC_Respawn(botPablo);
        FCNPC_EnterVehicle(botPablo, vehiclesPablo[1], 0, FCNPC_MOVE_TYPE_WALK);
        pabloLibre = false;
        pabloMisionsCount = 0;
        completeCount = 0;
    }
    else
    {
        for(new i;i<MAX_PLAYERS;i++)
        {
            if(enMision[i] == true)
            {
                congelarUsuario(i, 5000);

                SetVehiclePos(vehiclesPablo[1], 1830.8799,2043.0314,-1.2193);
                enMision[i] = false;
                ShowInfoForPlayer(i, "No completaron la mision", 3000);
                SetPlayerPos(i, 1837.5662,2039.5422,2.6687);
            }
        }
        FCNPC_Respawn(botPablo);
        FCNPC_EnterVehicle(botPablo, vehiclesPablo[1], 0, FCNPC_MOVE_TYPE_WALK);
        pabloLibre = false;
        pabloMisionsCount = 0;
        completeCount = 0;

    }
}

