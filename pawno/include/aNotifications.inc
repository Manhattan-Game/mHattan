//aNotifications by Atom

#if defined _anotitications_included
    #endinput
#endif
#define _anotitications_included

#include <a_samp>
#include <YSI_Coding\y_hooks>

static
    PlayerText:Notificacion[MAX_PLAYERS][3],
    PlayerText:NOTIFICATION_MONEY_MESSAGE[MAX_PLAYERS][4],
    NotificationSlot[MAX_PLAYERS][3],
    NotificationTime[MAX_PLAYERS][3];

hook OnPlayerConnect(playerid)
{
    Notificacion[playerid][0] = CreatePlayerTextDraw(playerid, 462.000000, 141.000000, "-");
    PlayerTextDrawFont(playerid, Notificacion[playerid][0], 2);
    PlayerTextDrawLetterSize(playerid, Notificacion[playerid][0], 0.224999, 1.500000);
    PlayerTextDrawTextSize(playerid, Notificacion[playerid][0], 627.500000, 17.000000);
    PlayerTextDrawSetOutline(playerid, Notificacion[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Notificacion[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, Notificacion[playerid][0], 1);
    PlayerTextDrawColor(playerid, Notificacion[playerid][0], -1811885057);
    PlayerTextDrawBackgroundColor(playerid, Notificacion[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, Notificacion[playerid][0], 1296911666);
    PlayerTextDrawUseBox(playerid, Notificacion[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, Notificacion[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, Notificacion[playerid][0], 0);

    Notificacion[playerid][1] = CreatePlayerTextDraw(playerid, 462.000000, 171.000000, "-");
    PlayerTextDrawFont(playerid, Notificacion[playerid][1], 2);
    PlayerTextDrawLetterSize(playerid, Notificacion[playerid][1], 0.224999, 1.500000);
    PlayerTextDrawTextSize(playerid, Notificacion[playerid][1], 627.500000, 17.000000);
    PlayerTextDrawSetOutline(playerid, Notificacion[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, Notificacion[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, Notificacion[playerid][1], 1);
    PlayerTextDrawColor(playerid, Notificacion[playerid][1], -1811885057);
    PlayerTextDrawBackgroundColor(playerid, Notificacion[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, Notificacion[playerid][1], 1296911666);
    PlayerTextDrawUseBox(playerid, Notificacion[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, Notificacion[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, Notificacion[playerid][1], 0);

    Notificacion[playerid][2] = CreatePlayerTextDraw(playerid, 462.000000, 200.000000, "-");
    PlayerTextDrawFont(playerid, Notificacion[playerid][2], 2);
    PlayerTextDrawLetterSize(playerid, Notificacion[playerid][2], 0.224999, 1.500000);
    PlayerTextDrawTextSize(playerid, Notificacion[playerid][2], 627.500000, 17.000000);
    PlayerTextDrawSetOutline(playerid, Notificacion[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, Notificacion[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, Notificacion[playerid][2], 1);
    PlayerTextDrawColor(playerid, Notificacion[playerid][2], -1811885057);
    PlayerTextDrawBackgroundColor(playerid, Notificacion[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, Notificacion[playerid][2], 1296911666);
    PlayerTextDrawUseBox(playerid, Notificacion[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, Notificacion[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, Notificacion[playerid][2], 0);


    NOTIFICATION_MONEY_MESSAGE[playerid][0] = CreatePlayerTextDraw(playerid, 637.405517, 1.000027, "_");
    PlayerTextDrawLetterSize(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 0.246570, 1.098333);
    PlayerTextDrawAlignment(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 3);
    PlayerTextDrawColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 1098134015);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 255);
    PlayerTextDrawFont(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 3);
    PlayerTextDrawSetProportional(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0], 0);

    NOTIFICATION_MONEY_MESSAGE[playerid][1] = CreatePlayerTextDraw(playerid, 636.905517, 11.500028, "_");
    PlayerTextDrawLetterSize(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 0.279835, 1.034166);
    PlayerTextDrawAlignment(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 3);
    PlayerTextDrawColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], -801227009);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 255);
    PlayerTextDrawFont(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 3);
    PlayerTextDrawSetProportional(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1], 0);

    NOTIFICATION_MONEY_MESSAGE[playerid][2] = CreatePlayerTextDraw(playerid, 637.842529, 23.166696, "_");
    PlayerTextDrawLetterSize(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 0.263437, 1.045833);
    PlayerTextDrawAlignment(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 3);
    PlayerTextDrawColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 2007459839);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 255);
    PlayerTextDrawFont(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 3);
    PlayerTextDrawSetProportional(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2], 0);

    NOTIFICATION_MONEY_MESSAGE[playerid][3] = CreatePlayerTextDraw(playerid, 636.905517, 34.250038, "_");
    PlayerTextDrawLetterSize(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 0.277493, 0.981666);
    PlayerTextDrawAlignment(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 3);
    PlayerTextDrawColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], -724249857);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 255);
    PlayerTextDrawFont(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 3);
    PlayerTextDrawSetProportional(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3], 0);
    return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawDestroy(playerid,Notificacion[playerid][0]);
    PlayerTextDrawDestroy(playerid, Notificacion[playerid][1]);
    PlayerTextDrawDestroy(playerid, Notificacion[playerid][2]);
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][0]);
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][1]);
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][2]);
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MONEY_MESSAGE[playerid][3]);
    return Y_HOOKS_CONTINUE_RETURN_1;
}

stock SendPlayerMoneyNotification(playerid, moneyinplayer_[], moneyinbank_[], cash1_[], cash2_[], seconds = 0)
{
    PlayerTextDrawSetString(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][0], moneyinplayer_);
    PlayerTextDrawSetString(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][2], moneyinbank_);
    PlayerTextDrawSetString(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][1], cash1_);
    PlayerTextDrawSetString(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][3], cash2_);

    PlayerTextDrawShow(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][0]); 
    PlayerTextDrawShow(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][1]);
    PlayerTextDrawShow(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][2]);
    PlayerTextDrawShow(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][3]);   
    SetTimerEx("HideMoneyNotification", seconds * 1000, false, "i", playerid);
    return 1;
}

forward HideMoneyNotification(playerid);
public HideMoneyNotification(playerid)
{
    PlayerTextDrawHide(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][0]); 
    PlayerTextDrawHide(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][1]);
    PlayerTextDrawHide(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][2]);
    PlayerTextDrawHide(playerid,NOTIFICATION_MONEY_MESSAGE[playerid][3]);  
    return 1;
}

stock enviarNotificacion(playerid, text_[])
{
    if (NotificationSlot[playerid][0] == 0) 
    {
        PlayerTextDrawSetString(playerid,Notificacion[playerid][2], text_);
        PlayerTextDrawShow(playerid,Notificacion[playerid][2]); 
        NotificationSlot[playerid][0] = 1; 
        NotificationTime[playerid][0] = SetTimerEx("hideNotificationInSlot1", 7000, 0,"d",playerid); 
    }
    else if (NotificationSlot[playerid][1] == 0) 
    {
        PlayerTextDrawSetString(playerid,Notificacion[playerid][1], text_);
        PlayerTextDrawShow(playerid,Notificacion[playerid][1]); 
        NotificationSlot[playerid][1] = 1; 
        NotificationTime[playerid][1] = SetTimerEx("hideNotificationInSlot2", 7000, 0,"d",playerid); 
    }
    else if (NotificationSlot[playerid][2] == 0) 
    {
        PlayerTextDrawSetString(playerid,Notificacion[playerid][0], text_);
        PlayerTextDrawShow(playerid,Notificacion[playerid][0]); 
        NotificationSlot[playerid][2] = 1; 
        NotificationTime[playerid][2] = SetTimerEx("hideNotificationInSlot3", 7000, 0,"d",playerid);
        return 1;
    }
    return 1;
}

forward hideNotificationInSlot1(playerid);
public hideNotificationInSlot1(playerid)
{
    PlayerTextDrawHide(playerid,Notificacion[playerid][2]); 
    NotificationSlot[playerid][0] = 0; 
    return 1;
}

forward hideNotificationInSlot2(playerid);
public hideNotificationInSlot2(playerid)
{
    PlayerTextDrawHide(playerid,Notificacion[playerid][1]); 
    NotificationSlot[playerid][1] = 0; 
    return 1;
}

forward hideNotificationInSlot3(playerid);
public hideNotificationInSlot3(playerid)
{
    PlayerTextDrawHide(playerid,Notificacion[playerid][0]); 
    NotificationSlot[playerid][2] = 0; 
    return 1;
}