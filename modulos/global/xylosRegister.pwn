// Enums para MiamiSide por Xylospeed
#include <YSI_Coding\y_hooks>

new Text:cinematic[2];
new PlayerText: cinematic2[MAX_PLAYERS];

new Text:selectPablo[5];

new Text:register[4];
new PlayerText:registerP[MAX_PLAYERS][6];

new pasos[MAX_PLAYERS][4];


new vehicle[5];

hook OnGameModeInit()
{   
    vehicle[0] = CreateVehicle(446, 1827.1440,2043.9427,1.3079,13.4632, 1, 7, 0);
    vehicle[1] = CreateVehicle(452, 1841.9701,2055.1973,0.0988,35.7101, 1, 7, 0);
    vehicle[2] = CreateVehicle(417, 1906.1827,2100.5588,10.1940,250.3221, 1, 1, 0);
    vehicle[3] = CreateVehicle(471, 1815.7085,2001.2273,4.5096,183.5815, 1, 1, 0);
    vehicle[4] = CreateVehicle(454, 1842.6195,1964.3938,1.3602,202.0682, 1, 1, 0);

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



    selectPablo[0] = TextDrawCreate(207.666641, 104.392578, "mdl-2001:logo_box");
    TextDrawLetterSize(selectPablo[0], 0.000000, 0.000000);
    TextDrawTextSize(selectPablo[0], 229.000000, 176.000000);
    TextDrawAlignment(selectPablo[0], 1);
    TextDrawColor(selectPablo[0], 505290495);
    TextDrawSetShadow(selectPablo[0], 0);
    TextDrawSetOutline(selectPablo[0], 0);
    TextDrawBackgroundColor(selectPablo[0], 255);
    TextDrawFont(selectPablo[0], 4);
    TextDrawSetProportional(selectPablo[0], 0);
    TextDrawSetShadow(selectPablo[0], 0);

    selectPablo[1] = TextDrawCreate(344.333251, 123.888908, "mdl-2001:pablo");
    TextDrawLetterSize(selectPablo[1], 0.000000, 0.000000);
    TextDrawTextSize(selectPablo[1], 49.000000, 96.000000);
    TextDrawAlignment(selectPablo[1], 1);
    TextDrawColor(selectPablo[1], -1);
    TextDrawSetShadow(selectPablo[1], 0);
    TextDrawSetOutline(selectPablo[1], 0);
    TextDrawBackgroundColor(selectPablo[1], 255);
    TextDrawFont(selectPablo[1], 4);
    TextDrawSetProportional(selectPablo[1], 0);
    TextDrawSetShadow(selectPablo[1], 0);
    TextDrawSetSelectable(selectPablo[1], true);

    selectPablo[2] = TextDrawCreate(251.666595, 123.059249, "mdl-2001:ronald");
    TextDrawLetterSize(selectPablo[2], 0.000000, 0.000000);
    TextDrawTextSize(selectPablo[2], 49.000000, 97.000000);
    TextDrawAlignment(selectPablo[2], 1);
    TextDrawColor(selectPablo[2], -1);
    TextDrawSetShadow(selectPablo[2], 0);
    TextDrawSetOutline(selectPablo[2], 0);
    TextDrawBackgroundColor(selectPablo[2], 255);
    TextDrawFont(selectPablo[2], 4);
    TextDrawSetProportional(selectPablo[2], 0);
    TextDrawSetShadow(selectPablo[2], 0);
    TextDrawSetSelectable(selectPablo[2], true);

    selectPablo[3] = TextDrawCreate(331.999969, 224.014892, "ventajas(contacto con camello, 10.000 y misiones Pablo Escobar");
    TextDrawLetterSize(selectPablo[3], 0.267666, 1.027554);
    TextDrawTextSize(selectPablo[3], 409.000000, 0.000000);
    TextDrawAlignment(selectPablo[3], 1);
    TextDrawColor(selectPablo[3], -1);
    TextDrawUseBox(selectPablo[3], 1);
    TextDrawBoxColor(selectPablo[3], -1523963137);
    TextDrawSetShadow(selectPablo[3], 0);
    TextDrawSetOutline(selectPablo[3], 0);
    TextDrawBackgroundColor(selectPablo[3], 255);
    TextDrawFont(selectPablo[3], 1);
    TextDrawSetProportional(selectPablo[3], 1);
    TextDrawSetShadow(selectPablo[3], 0);

    selectPablo[4] = TextDrawCreate(236.000015, 224.429733, "ventajas(contaco con gobierno, 10.000 y misiones Ronald Reagan)");
    TextDrawLetterSize(selectPablo[4], 0.266333, 1.039998);
    TextDrawTextSize(selectPablo[4], 313.000000, 0.000000);
    TextDrawAlignment(selectPablo[4], 1);
    TextDrawColor(selectPablo[4], -1);
    TextDrawUseBox(selectPablo[4], 1);
    TextDrawBoxColor(selectPablo[4], -1523963137);
    TextDrawSetShadow(selectPablo[4], 0);
    TextDrawSetOutline(selectPablo[4], 0);
    TextDrawBackgroundColor(selectPablo[4], 255);
    TextDrawFont(selectPablo[4], 1);
    TextDrawSetProportional(selectPablo[4], 1);
    TextDrawSetShadow(selectPablo[4], 0);



    register[0] = TextDrawCreate(224.999969, 76.600013, "mdl-2001:logo_box");
    TextDrawLetterSize(register[0], 0.000000, 0.000000);
    TextDrawTextSize(register[0], 204.000000, 139.000000);
    TextDrawAlignment(register[0], 1);
    TextDrawColor(register[0], 505290495);
    TextDrawSetShadow(register[0], 0);
    TextDrawSetOutline(register[0], 0);
    TextDrawBackgroundColor(register[0], 255);
    TextDrawFont(register[0], 4);
    TextDrawSetProportional(register[0], 0);
    TextDrawSetShadow(register[0], 0);

    register[2] = TextDrawCreate(306.666564, 215.562973, "mdl-2001:logo_box");
    TextDrawLetterSize(register[2], 0.000000, 0.000000);
    TextDrawTextSize(register[2], 21.000000, 22.000000);
    TextDrawAlignment(register[2], 1);
    TextDrawColor(register[2], 505290495);
    TextDrawSetShadow(register[2], 0);
    TextDrawSetOutline(register[2], 0);
    TextDrawBackgroundColor(register[2], 255);
    TextDrawFont(register[2], 4);
    TextDrawSetProportional(register[2], 0);
    TextDrawSetShadow(register[2], 0);

    register[3] = TextDrawCreate(309.333404, 215.562973, "mdl-2001:logo_yes");
    TextDrawLetterSize(register[3], 0.000000, 0.000000);
    TextDrawTextSize(register[3], 15.000000, 22.000000);
    TextDrawAlignment(register[3], 1);
    TextDrawColor(register[3], -1);
    TextDrawSetShadow(register[3], 0);
    TextDrawSetOutline(register[3], 0);
    TextDrawBackgroundColor(register[3], 255);
    TextDrawFont(register[3], 4);
    TextDrawSetProportional(register[3], 0);
    TextDrawSetShadow(register[3], 0);
    TextDrawSetSelectable(register[3], true);




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


    registerP[playerid][0] = CreatePlayerTextDraw(playerid, 303.666717, 104.133377, "Nombre_Apellido");
    PlayerTextDrawLetterSize(playerid, registerP[playerid][0], 0.219666, 1.342813);
    PlayerTextDrawTextSize(playerid, registerP[playerid][0], 399.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, registerP[playerid][0], 1);
    PlayerTextDrawColor(playerid, registerP[playerid][0], -1);
    PlayerTextDrawUseBox(playerid, registerP[playerid][0], 1);
    PlayerTextDrawBoxColor(playerid, registerP[playerid][0], 673720575);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, registerP[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, registerP[playerid][0], 255);
    PlayerTextDrawFont(playerid, registerP[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, registerP[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][0], 0);
    PlayerTextDrawSetSelectable(playerid, registerP[playerid][0], true);

    registerP[playerid][1] = CreatePlayerTextDraw(playerid, 304.000000, 125.288917, "Edad");
    PlayerTextDrawLetterSize(playerid, registerP[playerid][1], 0.219666, 1.342813);
    PlayerTextDrawTextSize(playerid, registerP[playerid][1], 399.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, registerP[playerid][1], 1);
    PlayerTextDrawColor(playerid, registerP[playerid][1], -1);
    PlayerTextDrawUseBox(playerid, registerP[playerid][1], 1);
    PlayerTextDrawBoxColor(playerid, registerP[playerid][1], 673720575);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, registerP[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, registerP[playerid][1], 255);
    PlayerTextDrawFont(playerid, registerP[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, registerP[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][1], 0);
    PlayerTextDrawSetSelectable(playerid, registerP[playerid][1], true);

    registerP[playerid][2] = CreatePlayerTextDraw(playerid, 303.666625, 146.859329, "Sexo");
    PlayerTextDrawLetterSize(playerid, registerP[playerid][2], 0.219666, 1.342813);
    PlayerTextDrawTextSize(playerid, registerP[playerid][2], 399.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, registerP[playerid][2], 1);
    PlayerTextDrawColor(playerid, registerP[playerid][2], -1);
    PlayerTextDrawUseBox(playerid, registerP[playerid][2], 1);
    PlayerTextDrawBoxColor(playerid, registerP[playerid][2], 673720575);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, registerP[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, registerP[playerid][2], 255);
    PlayerTextDrawFont(playerid, registerP[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, registerP[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][2], 0);
    PlayerTextDrawSetSelectable(playerid, registerP[playerid][2], true);

    registerP[playerid][3] = CreatePlayerTextDraw(playerid, 248.333328, 173.822341, "Firma");
    PlayerTextDrawLetterSize(playerid, registerP[playerid][3], 0.219666, 1.342813);
    PlayerTextDrawTextSize(playerid, registerP[playerid][3], 398.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, registerP[playerid][3], 1);
    PlayerTextDrawColor(playerid, registerP[playerid][3], -1);
    PlayerTextDrawUseBox(playerid, registerP[playerid][3], 1);
    PlayerTextDrawBoxColor(playerid, registerP[playerid][3], 673720575);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, registerP[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, registerP[playerid][3], 255);
    PlayerTextDrawFont(playerid, registerP[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, registerP[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][3], 0);
    PlayerTextDrawSetSelectable(playerid, registerP[playerid][3], false);

    registerP[playerid][4] = CreatePlayerTextDraw(playerid, 365.333435, 83.807434, "443235");
    PlayerTextDrawLetterSize(playerid, registerP[playerid][4], 0.197000, 1.251554);
    PlayerTextDrawAlignment(playerid, registerP[playerid][4], 1);
    PlayerTextDrawColor(playerid, registerP[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, registerP[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, registerP[playerid][4], 255);
    PlayerTextDrawFont(playerid, registerP[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, registerP[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][4], 0);


    registerP[playerid][5] = CreatePlayerTextDraw(playerid, 222.666687, 89.044410, "");
    PlayerTextDrawLetterSize(playerid, registerP[playerid][5], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, registerP[playerid][5], 88.000000, 74.000000);
    PlayerTextDrawAlignment(playerid, registerP[playerid][5], 1);
    PlayerTextDrawColor(playerid, registerP[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, registerP[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, registerP[playerid][5], 0);
    PlayerTextDrawFont(playerid, registerP[playerid][5], 5);
    PlayerTextDrawSetProportional(playerid, registerP[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, registerP[playerid][5], 0);
    PlayerTextDrawSetPreviewModel(playerid, registerP[playerid][5], 270);
    PlayerTextDrawSetPreviewRot(playerid, registerP[playerid][5], 0.000000, 0.000000, 0.000000, 1.000000);
}
hook OnPlayerClickTextDraw(playerid, Text:clickedid){
    if(clickedid == selectPablo[1]){
        cinematicPaso1(playerid);
    }
    else if(clickedid == register[3]){
        if(pasos[playerid][0] == 1 && pasos[playerid][1] == 1 && pasos[playerid][2] == 1)
        {
                new xylos[400];
                mysql_format(xylosMYSQL, xylos, sizeof(xylos), "INSERT INTO Personajes(p_mkid, p_nombre, _posX, _posY, _posZ, _angle, p_viplvl, p_dinero, p_vida, p_chaleco, p_world, p_interior, p_skin, p_edad, p_origen, p_sexo, p_negocios, p_bank, p_bolsa, p_hambre, p_sed) VALUES('%d', '%s', 1883.1490,2029.6323,10.3347, 19, 0, 5000, 100.0, 0.0 , 0, 0, '%d', '%d', '%d', '%d', 0, 0, 0, 100, 100)", 
                masterInfo[playerid][_dbid], 
                nombreMK[playerid],
                skinMK[playerid],
                edad[playerid], 
                origenMK[playerid],
                sexoMK[playerid]);
                mysql_pquery(xylosMYSQL, xylos, "registrarPersonaje", "d", playerid);

                if(masterInfo[playerid][_personajes1] == 0)
                {
                    masterInfo[playerid][_personajes1] = 1;
                    format(masterInfo[playerid][_personaje1], 40, "%s", nombreMK[playerid]);
                }
                else if(masterInfo[playerid][_personajes2] == 0)
                {
                    masterInfo[playerid][_personajes2] = 1;
                    format(masterInfo[playerid][_personaje2], 40, "%s", nombreMK[playerid]);
                }

                else if(masterInfo[playerid][_personajes3] == 0 && masterInfo[playerid][_exp] == 1)
                {
                    masterInfo[playerid][_personajes3] = 1;
                    format(masterInfo[playerid][_personaje3], 40, "%s", nombreMK[playerid]);
                }
                enviarNotificacion(playerid, "Se esta creando tu cuenta aguarda un segundo.");
                for(new i;i<4;i++) TextDrawHideForPlayer(playerid, register[i]);
                for(new a;a<6;a++) PlayerTextDrawHide(playerid, registerP[playerid][a]);
                SetTimerEx("mostrarComienzoCinematica", 1500, false, "d", playerid);
        }
        else enviarNotificacion(playerid, "Completa el registro");
    }
}
hook OP_ClickPlayerTextDraw(playerid, PlayerText: playertextid){

    if(playertextid == registerP[playerid][0]){
        ShowPlayerDialog(playerid, d_crearpj4, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa un nombre(Formato: Nombre_Apellido):", "continuar", ""Chat_Rojo" atras");
    }
    else if(playertextid == registerP[playerid][1]){

        ShowPlayerDialog(playerid, d_crearpj5, DIALOG_STYLE_INPUT, "MiamiSide", "Ingresa tu edad(Minimo 18-90 Max):", "continuar", ""Chat_Rojo" atras");
    }
    else if(playertextid == registerP[playerid][2]){
        ShowPlayerDialog(playerid, d_crearpj6, DIALOG_STYLE_MSGBOX, "MiamiSide", "Elige tu Sexo(No tu genero)", "Hombre", "Mujer");
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
    SetTimerEx("camera1", 5000, false, "d", playerid);
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