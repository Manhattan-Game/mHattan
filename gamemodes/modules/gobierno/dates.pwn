// Gobierno para MiamiSide por Xylospeed
#include <YSI_Coding\y_hooks>

enum g_datos{
    Float:gob_fondo,
    Float:gob_impuesto,
    Float:gob_coinprice,
    Float:gob_reserva,





    gob_president,
    gob_vicepresident,

    gob_members[20],
    
}
new gobiernoInfo[g_datos];
new Text:pagodiario[3];
hook OnGameModeInit()
{

    pagodiario[0] = TextDrawCreate(280.333465, -15.903677, "mdl-2001:logo_button");
    TextDrawLetterSize(pagodiario[0], 0.000000, 0.000000);
    TextDrawTextSize(pagodiario[0], 79.000000, 61.000000);
    TextDrawAlignment(pagodiario[0], 1);
    TextDrawColor(pagodiario[0], 505290495);
    TextDrawSetShadow(pagodiario[0], 0);
    TextDrawSetOutline(pagodiario[0], 0);
    TextDrawBackgroundColor(pagodiario[0], 255);
    TextDrawFont(pagodiario[0], 4);
    TextDrawSetProportional(pagodiario[0], 0);
    TextDrawSetShadow(pagodiario[0], 0);

    pagodiario[1] = TextDrawCreate(285.333374, 4.007405, "mdl-2001:logo_masuno");
    TextDrawLetterSize(pagodiario[1], 0.000000, 0.000000);
    TextDrawTextSize(pagodiario[1], 22.000000, 20.000000);
    TextDrawAlignment(pagodiario[1], 1);
    TextDrawColor(pagodiario[1], -1);
    TextDrawSetShadow(pagodiario[1], 0);
    TextDrawSetOutline(pagodiario[1], 0);
    TextDrawBackgroundColor(pagodiario[1], 255);
    TextDrawFont(pagodiario[1], 4);
    TextDrawSetProportional(pagodiario[1], 0);
    TextDrawSetShadow(pagodiario[1], 0);

    pagodiario[2] = TextDrawCreate(311.666625, 9.555558, "nivel");
    TextDrawLetterSize(pagodiario[2], 0.231333, 1.081481);
    TextDrawAlignment(pagodiario[2], 1);
    TextDrawColor(pagodiario[2], -1);
    TextDrawSetShadow(pagodiario[2], 0);
    TextDrawSetOutline(pagodiario[2], 0);
    TextDrawBackgroundColor(pagodiario[2], 255);
    TextDrawFont(pagodiario[2], 2);
    TextDrawSetProportional(pagodiario[2], 1);
    TextDrawSetShadow(pagodiario[2], 0);

    SetTimer("pagoDiario", 4000000, true);
}

agregarFondos(Float:cantidad){
    gobiernoInfo[gob_fondo] += cantidad;
}
agregarReserva(Float:cantidad){
    gobiernoInfo[gob_reserva] += cantidad;
    gobiernoInfo[gob_impuesto] = gobiernoInfo[gob_fondo] / gobiernoInfo[gob_reserva];
}

forward pagoDiario();
public pagoDiario(){

    new Float:antiguo = gobiernoInfo[gob_fondo];
    for(new i;i<MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            new Float:x;
            switch(personajeInfo[i][p_negocios])
            {
                case 0: x = 0;
                case 1: x = 50;
                case 2: x = 120;
                case 3: x = 225;
            }
            new string[20]; format(string, 20, "%.0f", gobiernoInfo[gob_impuesto]);
            new namber = strval(string);
            new Float: h = x * namber;
            x = x + h;

            new Float:f;
            switch(personajeInfo[i][p_empresarango])
            {
                case 6:
                {
                    f = 250 * gobiernoInfo[gob_impuesto];
                }
            }
            x = x+f;
            personajeInfo[i][p_bankbalance] -= x;
            personajeInfo[i][p_exp]++;

            gobiernoInfo[gob_fondo] += x;

            new limit;
            switch(personajeInfo[i][p_nivel])
            {   
                case 0: limit = 3;
                case 1: limit = 5;
                case 2: limit = 8;
                case 3: limit = 12;
                case 4: limit = 15;
                case 5: limit = 18;
                case 6: limit = 21;
                case 7: limit = 24;
                case 8: limit = 30;
                case 9: limit = 32;
                case 10: limit = 45;
            }


            gobiernoInfo[gob_fondo] -= limit;



            if(personajeInfo[i][p_exp] >= limit)
            {
                personajeInfo[i][p_exp] = 0;
                personajeInfo[i][p_nivel]++;
                for(new d; d<3; d++) TextDrawShowForPlayer(i, pagodiario[d]);
                SetTimerEx("esconderPagodiario", 4000, false, "d", i);

            }

            new strinng[128];
            format(strinng, sizeof(strinng), ""Chat_Gris"[Pago Diario] Resumen "Chat_Verde"+$%i"Chat_Gris"(Nivel), "Chat_Rojo"-$%i "Chat_Gris"(Impuestos)", limit * 20, x);

            new strinng1[128];
            format(strinng1, sizeof(strinng1), ""Chat_Gris"[-] Nivel "Chat_Radio"%i"Chat_Gris", Experiencia "Chat_Me"%i/%i", personajeInfo[i][p_nivel], personajeInfo[i][p_exp], limit);

            SendClientMessage(i, -1, strinng);
            SendClientMessage(i, -1, strinng1);
            PlayerPlaySound(i, 1053, 0.0, 0.0, 0.0);
        }
    }
    new string[128];
    format(string, 128, ""Chat_Azul" [Gobierno] - "Chat_Gris" Antiguo Fondo %f, Nuevo Fondo "Chat_Verde"$%f", antiguo, gobiernoInfo[gob_fondo]);
    SendClientMessageToAll(-1, string);


}
cmd:gobad(playerid, params[])
{
    if(gobiernoInfo[gob_president] == personajeInfo[playerid][p_listid] || gobiernoInfo[gob_vicepresident] == personajeInfo[playerid][p_listid]) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" Solo los lideres y sublideres pueden enviar un anuncion del gobierno.");
    {
        if(sscanf(params, "s[128]", params[0]))
        {
            new string[128];
            format(string, 128, ""Chat_Azul" [Gobierno] - "Chat_Gris"%s", params[0]);
            SendClientMessageToAll(-1, string);
        }
    }
    return 1;
}

cmd:gobGuardar(playerid, params[])
{
    if(gobiernoInfo[gob_president] == personajeInfo[playerid][p_listid] || gobiernoInfo[gob_vicepresident] == personajeInfo[playerid][p_listid]) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" Solo los lideres y sublideres pueden enviar un anuncion del gobierno.");
    {
        if(!sscanf(params, "i", params[0]))
        {
            agregarReserva(params[0]);
            new string[128];
            format(string, 128, ""Chat_Azul" [Gobierno] - "Chat_Gris" se actualizo el fondo monetario(%f), Tasa de impuesto "Chat_Verde"%f", gobiernoInfo[gob_fondo], gobiernoInfo[gob_impuesto]);
            SendClientMessageToAll(-1, string);
        }
    }
    return 1;
}
forward esconderPagodiario(playerid);
public esconderPagodiario(playerid)
{
    for(new d; d<3; d++) TextDrawHideForPlayer(playerid, pagodiario[d]);
}


cmd:prue(playerid, params[])
{
    enviarNotificacion(playerid, "Cuenta Logueada");
    enviarNotificacionG(playerid, "Probando Notificaciones");
    return 1;
}