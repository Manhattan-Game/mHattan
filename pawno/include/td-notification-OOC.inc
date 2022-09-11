/*
    td-notification - Version 1.0

    Modes of use:
    MAX_TDN_OOC: set how many TextDraw will be shown in TextDraw's Notification
    TDN_POS_X_OOC: TextDraw notifications will be at the position set on the X axis
    TDN_POS_Y_OOC: TextDraw notifications will be at the position set on the Y axis
    TDN_FONT_OOC: TextDraw Notification will have the set font
    TDN_LETTER_SIZE_X_OOC: TextDraw notifications will have the set font size on the X axis
    TDN_LETTER_SIZE_Y_OOC: TextDraw notifications will have the set font size on the Y axis
    TDN_SIZE_OOC: TextDraw notifications will have the set width size
    TDN_COLOR_OOC: TextDraw notifications will have the set font color
    TDN_COLOR_BOX_OOC: TextDraw notifications will have the set box color
    TDN_PROPORTIONAL_OOC: TextDraw notifications will have the set proportional
    TDN_DISTANCE_OOC: TextDraw notifications will have the set distance
    MAX_TDN_TEXT_OOC: TextDraw notifications will have a maximum the set text
    TDN_MODE_DOWN_OOC: TextDraw notifications will scroll down
    TDN_MODE_UP_OOC: TextDraw notifications will scroll up
    TDN_TIME_OOC: TextDraw notifications will hide at the set time

    TDN_MODE_DEFAULT_OOC: TextDraw notifications will use the default settings

    Created by ThePez - NaS
*/
 
#if defined include_td_notification_OOC
    #endinput
#endif
#define include_td_notification_OOC
 
#if !defined TDN_MODE_DEFAULT_OOC
    #if !defined MAX_TDN_OOC
        #error "MAX_TDN_OOC is not defined"
    #endif
 
    #if !defined TDN_POS_X_OOC
        #error "TDN_POS_X_OOC is not defined"
    #endif
 
    #if !defined TDN_POS_Y_OOC
        #error "TDN_POS_Y_OOC is not defined"
    #endif
 
    #if !defined TDN_FONT_OOC
        #error "TDN_FONT_OOC is not defined"
    #endif
 
    #if !defined TDN_LETTER_SIZE_X_OOC
        #error "TDN_LETTER_SIZE_X_OOC is not defined"
    #endif
 
    #if !defined TDN_LETTER_SIZE_Y_OOC
        #error "TDN_LETTER_SIZE_Y_OOC is not defined"
    #endif
 
    #if !defined TDN_SIZE_OOC
        #error "TDN_SIZE_OOC is not defined"
    #endif
 
    #if !defined TDN_COLOR_OOC
        #error "TDN_COLOR_OOC is not defined"
    #endif
 
    #if !defined TDN_COLOR_BOX_OOC
        #error "TDN_COLOR_BOX_OOC is not defined"
    #endif
 
    #if !defined TDN_PROPORTIONAL_OOC
        #error "TDN_PROPORTIONAL_OOC is not defined"
    #endif
 
    #if !defined TDN_DISTANCE_OOC
        #error "TDN_DISTANCE_OOC is not defined"
    #endif
 
    #if !defined TDN_MODE_DOWN_OOC && !defined TDN_MODE_UP_OOC
        #error "TDN_MODE is not defined"
    #elseif defined TDN_MODE_DOWN_OOC && defined TDN_MODE_UP_OOC
        #error "TDN_MODE_DOWN_OOC and TDN_MODE_UP_OOC is defined"
    #endif
 
    #if !defined TDN_TIME_OOC
        #error "TDN_TIME_OOC is not defined"
    #endif
 
    #if !defined MAX_TDN_TEXT_OOC
        #error "MAX_TDN_TEXT_OOC is not defined"
    #endif
#else
    #define MAX_TDN_OOC 4
    #define TDN_POS_X_IC_IC 497.000000
    #define TDN_POS_Y_OOC 130.000000
    #define TDN_FONT_OOC 1
    #define TDN_LETTER_SIZE_X_OOC 0.250000
    #define TDN_LETTER_SIZE_Y_OOC 1.000000
    #define TDN_SIZE_OOC 112.000000
    #define TDN_COLOR_OOC 0xFFFFFFFF
    #define TDN_COLOR_BOX_OOC 0x000000FF
    #define TDN_PROPORTIONAL_OOC 1
    #define TDN_DISTANCE_OOC 5
    #define TDN_MODE_DOWN_OOC
    #define TDN_TIME_OOC 20000
    #define MAX_TDN_TEXT_OOC 800
#endif

 
enum InformationTDN_OOC
{
    Use,
    Line,
    Text[MAX_TDN_TEXT_OOC],
    PlayerText:TextDraw,
    Float:MinPosY,
    Float:MaxPosY,
    Hide
}
new TextDrawsNotificationOOC[MAX_PLAYERS][MAX_TDN_OOC][InformationTDN_OOC],
    counterOOC[MAX_PLAYERS];

forward TimerHideTDN_OOC(playerid);
public TimerHideTDN_OOC(playerid)
{
    for(new cycle; cycle < MAX_TDN_OOC; cycle++)
    {
        if(TextDrawsNotificationOOC[playerid][cycle][Hide] == -1)
        {
            TextDrawsNotificationOOC[playerid][cycle][Use] = 0;
            if(TextDrawsNotificationOOC[playerid][cycle][TextDraw] != PlayerText:-1)
            {
                PlayerTextDrawDestroy(playerid, TextDrawsNotificationOOC[playerid][cycle][TextDraw]);
                TextDrawsNotificationOOC[playerid][cycle][Line] = 0;
                TextDrawsNotificationOOC[playerid][cycle][Text][0] = EOS;
                TextDrawsNotificationOOC[playerid][cycle][MinPosY] = 0;
                TextDrawsNotificationOOC[playerid][cycle][MaxPosY] = 0;
                TextDrawsNotificationOOC[playerid][cycle][TextDraw] = PlayerText:-1;
            }
            TextDrawsNotificationOOC[playerid][cycle][Hide] = -1;
            UpdateTDN_OOC(playerid);

            return 1;
        }
    }
    return 0;
}

forward ShowTDN_OOC(playerid, const reason[]); 
public ShowTDN_OOC(playerid, const reason[])
{
    for(new cycle; cycle < MAX_TDN_OOC; cycle++)
    {
        if(!TextDrawsNotificationOOC[playerid][cycle][Use])
        {
            TextDrawsNotificationOOC[playerid][cycle][Text][0] = EOS;
            new text[MAX_TDN_TEXT_OOC];

            for(new len = strlen(reason), pos; pos < len; pos ++)
            {
                switch(reason[pos])
                {
                    case 'à': text[pos] = 151;
                    case 'á': text[pos] = 152;
                    case 'â': text[pos] = 153;
                    case 'ä': text[pos] = 154;
                    case 'À': text[pos] = 128;
                    case 'Á': text[pos] = 129;
                    case 'Â': text[pos] = 130;
                    case 'Ä': text[pos] = 131;
                    case 'è': text[pos] = 157;
                    case 'é': text[pos] = 158;
                    case 'ê': text[pos] = 159;
                    case 'ë': text[pos] = 160;
                    case 'È': text[pos] = 134;
                    case 'É': text[pos] = 135;
                    case 'Ê': text[pos] = 136;
                    case 'Ë': text[pos] = 137;
                    case 'ì': text[pos] = 161;
                    case 'í': text[pos] = 162;
                    case 'î': text[pos] = 163;
                    case 'ï': text[pos] = 164;
                    case 'Ì': text[pos] = 138;
                    case 'Í': text[pos] = 139;
                    case 'Î': text[pos] = 140;
                    case 'Ï': text[pos] = 141;
                    case 'ò': text[pos] = 165;
                    case 'ó': text[pos] = 166;
                    case 'ô': text[pos] = 167;
                    case 'ö': text[pos] = 168;
                    case 'Ò': text[pos] = 142;
                    case 'Ó': text[pos] = 143;
                    case 'Ô': text[pos] = 144;
                    case 'Ö': text[pos] = 145;
                    case 'ù': text[pos] = 169;
                    case 'ú': text[pos] = 170;
                    case 'û': text[pos] = 171;
                    case 'ü': text[pos] = 172;
                    case 'Ù': text[pos] = 146;
                    case 'Ú': text[pos] = 147;
                    case 'Û': text[pos] = 148;
                    case 'Ü': text[pos] = 149;
                    case 'ñ': text[pos] = 174;
                    case 'Ñ': text[pos] = 173;
                    case '¡': text[pos] = 64;
                    case '¿': text[pos] = 175;
                    case '`': text[pos] = 177;
                    case '&': text[pos] = 38;
                    default:  text[pos] = reason[pos];
                }
            }

            strcat(TextDrawsNotificationOOC[playerid][cycle][Text], text, MAX_TDN_TEXT_OOC);
 
            TextDrawsNotificationOOC[playerid][cycle][Use] = 1;
 
            LinesTDN_IC_OOC(playerid, cycle);

            #if defined TDN_MODE_DOWN_OOC

            MinPosYTDN_OOC(playerid, cycle);
            MaxPosYTDN_OOC(playerid, cycle);

            #endif

            #if defined TDN_MODE_UP_OOC

            MaxPosYTDN_OOC(playerid, cycle);
            MinPosYTDN_OOC(playerid, cycle);
            
            #endif

            TextDrawsNotificationOOC[playerid][cycle][Hide] = -1;

            CreateTDN_OOC(playerid, cycle);

            SetTimerEx("TimerHideTDN_OOC", TDN_TIME_OOC, false, "i", playerid);

            return 1;
        }
    }
    return -1;
}

forward ShowTDN_Manual_OOC(playerid, const reason[]); 
public ShowTDN_Manual_OOC(playerid, const reason[])
{
    for(new cycle; cycle < MAX_TDN_OOC; cycle++)
    {
        if(!TextDrawsNotificationOOC[playerid][cycle][Use])
        {
            TextDrawsNotificationOOC[playerid][cycle][Text][0] = EOS;
            new text[MAX_TDN_TEXT_OOC];

            for(new len = strlen(reason), pos; pos < len; pos ++)
            {
                switch(reason[pos])
                {
                    case 'à': text[pos] = 151;
                    case 'á': text[pos] = 152;
                    case 'â': text[pos] = 153;
                    case 'ä': text[pos] = 154;
                    case 'À': text[pos] = 128;
                    case 'Á': text[pos] = 129;
                    case 'Â': text[pos] = 130;
                    case 'Ä': text[pos] = 131;
                    case 'è': text[pos] = 157;
                    case 'é': text[pos] = 158;
                    case 'ê': text[pos] = 159;
                    case 'ë': text[pos] = 160;
                    case 'È': text[pos] = 134;
                    case 'É': text[pos] = 135;
                    case 'Ê': text[pos] = 136;
                    case 'Ë': text[pos] = 137;
                    case 'ì': text[pos] = 161;
                    case 'í': text[pos] = 162;
                    case 'î': text[pos] = 163;
                    case 'ï': text[pos] = 164;
                    case 'Ì': text[pos] = 138;
                    case 'Í': text[pos] = 139;
                    case 'Î': text[pos] = 140;
                    case 'Ï': text[pos] = 141;
                    case 'ò': text[pos] = 165;
                    case 'ó': text[pos] = 166;
                    case 'ô': text[pos] = 167;
                    case 'ö': text[pos] = 168;
                    case 'Ò': text[pos] = 142;
                    case 'Ó': text[pos] = 143;
                    case 'Ô': text[pos] = 144;
                    case 'Ö': text[pos] = 145;
                    case 'ù': text[pos] = 169;
                    case 'ú': text[pos] = 170;
                    case 'û': text[pos] = 171;
                    case 'ü': text[pos] = 172;
                    case 'Ù': text[pos] = 146;
                    case 'Ú': text[pos] = 147;
                    case 'Û': text[pos] = 148;
                    case 'Ü': text[pos] = 149;
                    case 'ñ': text[pos] = 174;
                    case 'Ñ': text[pos] = 173;
                    case '¡': text[pos] = 64;
                    case '¿': text[pos] = 175;
                    case '`': text[pos] = 177;
                    case '&': text[pos] = 38;
                    default:  text[pos] = reason[pos];
                }
            }

            strcat(TextDrawsNotificationOOC[playerid][cycle][Text], text, MAX_TDN_TEXT_OOC);
 
            TextDrawsNotificationOOC[playerid][cycle][Use] = 1;
 
            LinesTDN_IC_OOC(playerid, cycle);

            #if defined TDN_MODE_DOWN_OOC

            MinPosYTDN_OOC(playerid, cycle);
            MaxPosYTDN_OOC(playerid, cycle);

            #endif

            #if defined TDN_MODE_UP_OOC

            MaxPosYTDN_OOC(playerid, cycle);
            MinPosYTDN_OOC(playerid, cycle);
            
            #endif

            CreateTDN_OOC(playerid, cycle);

            while(used_OOC(playerid, counterOOC[playerid]))
            {
                if(counterOOC[playerid] == MAX_TDN_OOC - 1) counterOOC[playerid] = 0;
                else counterOOC[playerid]++;
            }

            new TDN = counterOOC[playerid];

            TextDrawsNotificationOOC[playerid][cycle][Hide] = TDN;

            if(counterOOC[playerid] == MAX_TDN_OOC - 1) counterOOC[playerid] = 0;
            else counterOOC[playerid]++;

            return TDN;
        }
    }
    return -1;
}

stock used_OOC(playerid, usedID)
{
    for(new cycle; cycle < MAX_TDN_OOC; cycle++)
    {
        if(TextDrawsNotificationOOC[playerid][cycle][Hide] == usedID) return 1;
    }
    return 0;
}

forward hideTDN_OOC(playerid, TDN);
public hideTDN_OOC(playerid, TDN)
{
    for(new cycle; cycle < MAX_TDN_OOC; cycle++)
    {
        if(TextDrawsNotificationOOC[playerid][cycle][Hide] == TDN)
        {
            TextDrawsNotificationOOC[playerid][cycle][Use] = 0;
            if(TextDrawsNotificationOOC[playerid][cycle][TextDraw] != PlayerText:-1)
            {
                PlayerTextDrawDestroy(playerid, TextDrawsNotificationOOC[playerid][cycle][TextDraw]);
                TextDrawsNotificationOOC[playerid][cycle][Line] = 0;
                TextDrawsNotificationOOC[playerid][cycle][Text][0] = EOS;
                TextDrawsNotificationOOC[playerid][cycle][MinPosY] = 0;
                TextDrawsNotificationOOC[playerid][cycle][MaxPosY] = 0;
                TextDrawsNotificationOOC[playerid][cycle][TextDraw] = PlayerText:-1;
            }
            TextDrawsNotificationOOC[playerid][cycle][Hide] = -1;
            UpdateTDN_OOC(playerid);
            return 1;
        }
    }
    return 0;
}

stock UpdateTDN_OOC(playerid)
{
    for(new cycle = 0; cycle < MAX_TDN_OOC; cycle ++)
    {
        if(!TextDrawsNotificationOOC[playerid][cycle][Use])
        {
            if(cycle != MAX_TDN_OOC - 1)
            {
                if(TextDrawsNotificationOOC[playerid][cycle + 1][Use])
                {
                    TextDrawsNotificationOOC[playerid][cycle][Use] = TextDrawsNotificationOOC[playerid][cycle + 1][Use];
                    TextDrawsNotificationOOC[playerid][cycle][Line] = TextDrawsNotificationOOC[playerid][cycle + 1][Line];
                    strcat(TextDrawsNotificationOOC[playerid][cycle][Text], TextDrawsNotificationOOC[playerid][cycle + 1][Text], MAX_TDN_TEXT_OOC);
                    TextDrawsNotificationOOC[playerid][cycle][TextDraw] = TextDrawsNotificationOOC[playerid][cycle + 1][TextDraw];
                    TextDrawsNotificationOOC[playerid][cycle][Hide] = TextDrawsNotificationOOC[playerid][cycle + 1][Hide];

                    TextDrawsNotificationOOC[playerid][cycle + 1][Use] = 0;
                    TextDrawsNotificationOOC[playerid][cycle + 1][Line] = 0;
                    TextDrawsNotificationOOC[playerid][cycle + 1][Text][0] = EOS;
                    TextDrawsNotificationOOC[playerid][cycle + 1][TextDraw] = PlayerText:-1;
                    TextDrawsNotificationOOC[playerid][cycle + 1][MinPosY] = 0;
                    TextDrawsNotificationOOC[playerid][cycle + 1][MaxPosY] = 0;
                    TextDrawsNotificationOOC[playerid][cycle + 1][Hide] = -1;

                    #if defined TDN_MODE_DOWN_OOC

                    MinPosYTDN_OOC(playerid, cycle);
                    MaxPosYTDN_OOC(playerid, cycle);
                    
                    #endif

                    #if defined TDN_MODE_UP_OOC
                    
                    MaxPosYTDN_OOC(playerid, cycle);
                    MinPosYTDN_OOC(playerid, cycle);
                    
                    #endif       
                }
            }
        }
        else if(TextDrawsNotificationOOC[playerid][cycle][Use])
        {
            if(cycle != 0)
            {
                if(!TextDrawsNotificationOOC[playerid][cycle - 1][Use])
                {
                    TextDrawsNotificationOOC[playerid][cycle - 1][Use] = TextDrawsNotificationOOC[playerid][cycle][Use];
                    TextDrawsNotificationOOC[playerid][cycle - 1][Line] = TextDrawsNotificationOOC[playerid][cycle][Line];
                    strcat(TextDrawsNotificationOOC[playerid][cycle - 1][Text], TextDrawsNotificationOOC[playerid][cycle][Text], MAX_TDN_TEXT_OOC);
                    TextDrawsNotificationOOC[playerid][cycle - 1][TextDraw] = TextDrawsNotificationOOC[playerid][cycle][TextDraw];
                    TextDrawsNotificationOOC[playerid][cycle - 1][Hide] = TextDrawsNotificationOOC[playerid][cycle][Hide];

                    TextDrawsNotificationOOC[playerid][cycle][Use] = 0;
                    TextDrawsNotificationOOC[playerid][cycle][Line] = 0;
                    TextDrawsNotificationOOC[playerid][cycle][Text][0] = EOS;
                    TextDrawsNotificationOOC[playerid][cycle][TextDraw] = PlayerText:-1;
                    TextDrawsNotificationOOC[playerid][cycle][MinPosY] = 0;
                    TextDrawsNotificationOOC[playerid][cycle][MaxPosY] = 0;
                    TextDrawsNotificationOOC[playerid][cycle][Hide] = -1;

                    #if defined TDN_MODE_DOWN_OOC

                    MinPosYTDN_OOC(playerid, cycle - 1);
                    MaxPosYTDN_OOC(playerid, cycle - 1);
                    
                    #endif

                    #if defined TDN_MODE_UP_OOC
                    
                    MaxPosYTDN_OOC(playerid, cycle - 1);
                    MinPosYTDN_OOC(playerid, cycle - 1);
                    
                    #endif
                }
            }
        }
        CreateTDN_OOC(playerid, cycle);
    }
    return 1;
}

stock MinPosYTDN_OOC(playerid, TDN)
{
    #if defined TDN_MODE_DOWN_OOC

    if(TDN == 0)
    {
        TextDrawsNotificationOOC[playerid][TDN][MinPosY] = TDN_POS_Y_OOC;
    }
    else
    {
        TextDrawsNotificationOOC[playerid][TDN][MinPosY] = TextDrawsNotificationOOC[playerid][TDN - 1][MaxPosY] + TDN_DISTANCE_OOC;
    }
    return 1;

    #endif

    #if defined TDN_MODE_UP_OOC

    TextDrawsNotificationOOC[playerid][TDN][MinPosY] = TextDrawsNotificationOOC[playerid][TDN][MaxPosY] - ((TDN_LETTER_SIZE_Y_OOC * 2) + 2) - ((TDN_LETTER_SIZE_Y_OOC * 5.75) * TextDrawsNotificationOOC[playerid][TDN][Line]) - ((TextDrawsNotificationOOC[playerid][TDN][Line] - 1) * ((TDN_LETTER_SIZE_Y_OOC * 2) + 2 + TDN_LETTER_SIZE_Y_OOC)) - (TDN_LETTER_SIZE_Y_OOC + 3);
    return 1;

    #endif
}

stock MaxPosYTDN_OOC(playerid, TDN)
{
    #if defined TDN_MODE_DOWN_OOC

    TextDrawsNotificationOOC[playerid][TDN][MaxPosY] = TextDrawsNotificationOOC[playerid][TDN][MinPosY] + (TDN_LETTER_SIZE_Y_OOC * 2) + 2 + (TDN_LETTER_SIZE_Y_OOC * 5.75 * TextDrawsNotificationOOC[playerid][TDN][Line]) + ((TextDrawsNotificationOOC[playerid][TDN][Line] - 1) * ((TDN_LETTER_SIZE_Y_OOC * 2) + 2 + TDN_LETTER_SIZE_Y_OOC)) + TDN_LETTER_SIZE_Y_OOC + 3;
    return 1;

    #endif

    #if defined TDN_MODE_UP_OOC

    if(TDN == 0)
    {
        TextDrawsNotificationOOC[playerid][TDN][MaxPosY] = TDN_POS_Y_OOC;
    }
    else
    {
        TextDrawsNotificationOOC[playerid][TDN][MaxPosY] = TextDrawsNotificationOOC[playerid][TDN - 1][MinPosY] - TDN_DISTANCE_OOC;
    }
    return 1;

    #endif
}

stock LinesTDN_IC_OOC(playerid, TDN)
{
    new lines = 1, Float:width, lastspace = -1, supr, len = strlen(TextDrawsNotificationOOC[playerid][TDN][Text]);
 
    for(new i = 0; i < len; i ++)
    {
        if(TextDrawsNotificationOOC[playerid][TDN][Text][i] == '~')
        {
            if(supr == 0)
            {
                supr = 1;
                if(TextDrawsNotificationOOC[playerid][TDN][Text][i+2] != '~') SendClientMessage(playerid, -1, "Error: '~' used incorrectly'");
            }
            else if(supr == 1) supr = 0;
        }
        else
        {
            if(supr == 1)
            {
                if(TextDrawsNotificationOOC[playerid][TDN][Text][i] == 'n')
                {
                    lines ++;
                    lastspace = -1;
                    width = 0;
                }
            }
            else
            {
                if(TextDrawsNotificationOOC[playerid][TDN][Text][i] == ' ') lastspace = i;
 
                width += TDN_LETTER_SIZE_X_OOC * GetTextDrawCharacterWidth(TextDrawsNotificationOOC[playerid][TDN][Text][i], TDN_FONT_OOC, bool:TDN_PROPORTIONAL_OOC);

                if(width > TDN_SIZE_OOC - 3)
                {
                    if(lastspace != i && lastspace != -1)
                    {
                        lines ++;
                        i = lastspace;
                        lastspace = -1;
                        width = 0;
                    }
                    else
                    {
                        lines ++;
                        lastspace = -1;
                        width = 0;
                    }
                }
            }
        }
    }
    
    TextDrawsNotificationOOC[playerid][TDN][Line] = lines;
 
    return 1;
}

stock CreateTDN_OOC(playerid, TDN)
{
    if(TextDrawsNotificationOOC[playerid][TDN][Use] == 1)
    {
        if(TextDrawsNotificationOOC[playerid][TDN][TextDraw] != PlayerText:-1)
        {
            PlayerTextDrawDestroy(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw]);
        }
    
        TextDrawsNotificationOOC[playerid][TDN][TextDraw] = CreatePlayerTextDraw(playerid, TDN_POS_X_OOC, TextDrawsNotificationOOC[playerid][TDN][MinPosY], TextDrawsNotificationOOC[playerid][TDN][Text]);
        PlayerTextDrawFont(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], TDN_FONT_OOC);
        PlayerTextDrawLetterSize(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], TDN_LETTER_SIZE_X_OOC, TDN_LETTER_SIZE_Y_OOC);
        PlayerTextDrawTextSize(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], floatadd(TDN_POS_X_OOC, TDN_SIZE_OOC), 1.000000);
        PlayerTextDrawSetOutline(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], 1);
        PlayerTextDrawSetShadow(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], 0);
        PlayerTextDrawAlignment(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], 1);
        PlayerTextDrawColor(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], TDN_COLOR_OOC);
        PlayerTextDrawBackgroundColor(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], TDN_COLOR_BOX_OOC);
        PlayerTextDrawBoxColor(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], TDN_COLOR_BOX_OOC);
        PlayerTextDrawUseBox(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], 1);
        PlayerTextDrawSetProportional(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], TDN_PROPORTIONAL_OOC);
        PlayerTextDrawSetSelectable(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw], 0);
        PlayerTextDrawShow(playerid, TextDrawsNotificationOOC[playerid][TDN][TextDraw]);
    }
    return 1;
}

public OnGameModeInit()
{
    for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
    {
        for(new TDN = 0; TDN < MAX_TDN_OOC; TDN++)
        {
            TextDrawsNotificationOOC[playerid][TDN][TextDraw] = PlayerText:-1;
            TextDrawsNotificationOOC[playerid][TDN][Hide] = -1;
        }
    }
    #if defined TDN_OOC_OnGameModeInit
		return TDN_OOC_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit TDN_OOC_OnGameModeInit
#if defined TDN_OOC_OnGameModeInit
	forward TDN_OOC_OnGameModeInit();
#endif

 
public OnFilterScriptInit()
{
    for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
    {
        for(new TDN = 0; TDN < MAX_TDN_OOC; TDN++)
        {
            TextDrawsNotificationOOC[playerid][TDN][TextDraw] = PlayerText:-1;
            TextDrawsNotificationOOC[playerid][TDN][Hide] = -1;
        }
    }
    #if defined TDN_OOC_OnFilterScriptInit
		return TDN_OOC_OnFilterScriptInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif

#define OnFilterScriptInit TDN_OOC_OnFilterScriptInit
#if defined TDN_OOC_OnFilterScriptInit
	forward TDN_OOC_OnFilterScriptInit();
#endif

public OnPlayerDisconnect(playerid, reason)
{
    for(new cycle; cycle < MAX_TDN_OOC; cycle++)
    {
        TextDrawsNotificationOOC[playerid][cycle][Use] = 0;
        TextDrawsNotificationOOC[playerid][cycle][Line] = 0;
        TextDrawsNotificationOOC[playerid][cycle][Text][0] = EOS;
        TextDrawsNotificationOOC[playerid][cycle][MinPosY] = 0;
        TextDrawsNotificationOOC[playerid][cycle][MaxPosY] = 0;
        TextDrawsNotificationOOC[playerid][cycle][Hide] = -1;
        TextDrawsNotificationOOC[playerid][cycle][TextDraw] = PlayerText:-1;
    }
    #if defined TDN_OOC_OnPlayerDisconnect
		return TDN_OOC_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect TDN_OOC_OnPlayerDisconnect
#if defined TDN_OOC_OnPlayerDisconnect
	forward TDN_OOC_OnPlayerDisconnect(playerid, reason);
#endif