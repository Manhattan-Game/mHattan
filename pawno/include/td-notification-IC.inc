/*
    td-notification - Version 1.0

    Modes of use:
    MAX_TDN_IC: set how many TextDraw will be shown in TextDraw's Notification
    TDN_POS_X_IC: TextDraw notifications will be at the position set on the X axis
    TDN_POS_Y_IC: TextDraw notifications will be at the position set on the Y axis
    TDN_FONT_IC: TextDraw Notification will have the set font
    TDN_LETTER_SIZE_X_IC: TextDraw notifications will have the set font size on the X axis
    TDN_LETTER_SIZE_Y_IC: TextDraw notifications will have the set font size on the Y axis
    TDN_SIZE_IC: TextDraw notifications will have the set width size
    TDN_COLOR_IC: TextDraw notifications will have the set font color
    TDN_COLOR_BOX_IC: TextDraw notifications will have the set box color
    TDN_PROPORTIONAL_IC: TextDraw notifications will have the set proportional
    TDN_DISTANCE_IC: TextDraw notifications will have the set distance
    MAX_TDN_TEXT_IC: TextDraw notifications will have a maximum the set text
    TDN_MODE_DOWN_IC: TextDraw notifications will scroll down
    TDN_MODE_UP_IC: TextDraw notifications will scroll up
    TDN_TIME_IC: TextDraw notifications will hide at the set time

    TDN_MODE_DEFAULT_IC: TextDraw notifications will use the default settings

    Created by ThePez - NaS
*/
 
#if defined include_td_notification_IC
    #endinput
#endif
#define include_td_notification_IC
 
#if !defined TDN_MODE_DEFAULT_IC
    #if !defined MAX_TDN_IC
        #error "MAX_TDN_IC is not defined"
    #endif
 
    #if !defined TDN_POS_X_IC
        #error "TDN_POS_X_IC is not defined"
    #endif
 
    #if !defined TDN_POS_Y_IC
        #error "TDN_POS_Y_IC is not defined"
    #endif
 
    #if !defined TDN_FONT_IC
        #error "TDN_FONT_IC is not defined"
    #endif
 
    #if !defined TDN_LETTER_SIZE_X_IC
        #error "TDN_LETTER_SIZE_X_IC is not defined"
    #endif
 
    #if !defined TDN_LETTER_SIZE_Y_IC
        #error "TDN_LETTER_SIZE_Y_IC is not defined"
    #endif
 
    #if !defined TDN_SIZE_IC
        #error "TDN_SIZE_IC is not defined"
    #endif
 
    #if !defined TDN_COLOR_IC
        #error "TDN_COLOR_IC is not defined"
    #endif
 
    #if !defined TDN_COLOR_BOX_IC
        #error "TDN_COLOR_BOX_IC is not defined"
    #endif
 
    #if !defined TDN_PROPORTIONAL_IC
        #error "TDN_PROPORTIONAL_IC is not defined"
    #endif
 
    #if !defined TDN_DISTANCE_IC
        #error "TDN_DISTANCE_IC is not defined"
    #endif
 
    #if !defined TDN_MODE_DOWN_IC && !defined TDN_MODE_UP_IC
        #error "TDN_MODE is not defined"
    #elseif defined TDN_MODE_DOWN_IC && defined TDN_MODE_UP_IC
        #error "TDN_MODE_DOWN_IC and TDN_MODE_UP_IC is defined"
    #endif
 
    #if !defined TDN_TIME_IC
        #error "TDN_TIME_IC is not defined"
    #endif
 
    #if !defined MAX_TDN_TEXT_IC
        #error "MAX_TDN_TEXT_IC is not defined"
    #endif
#else
    #define MAX_TDN_IC 4
    #define TDN_POS_X_IC_IC 497.000000
    #define TDN_POS_Y_IC 90.000000
    #define TDN_FONT_IC 1
    #define TDN_LETTER_SIZE_X_IC 0.250000
    #define TDN_LETTER_SIZE_Y_IC 1.000000
    #define TDN_SIZE_IC 112.000000
    #define TDN_COLOR_IC 0xFFFFFFFF
    #define TDN_COLOR_BOX_IC 0x000000FF
    #define TDN_PROPORTIONAL_IC 1
    #define TDN_DISTANCE_IC 5
    #define TDN_MODE_DOWN_IC
    #define TDN_TIME_IC 20000
    #define MAX_TDN_TEXT_IC 800
#endif

#include <td-string-width>
 
enum InformationTDN
{
    Use,
    Line,
    Text[MAX_TDN_TEXT_IC],
    PlayerText:TextDraw,
    Float:MinPosY,
    Float:MaxPosY,
    Hide
}
new TextDrawsNotificationIC[MAX_PLAYERS][MAX_TDN_IC][InformationTDN],
    counter[MAX_PLAYERS];

forward TimerHideTDN_IC(playerid);
public TimerHideTDN_IC(playerid)
{
    for(new cycle; cycle < MAX_TDN_IC; cycle++)
    {
        if(TextDrawsNotificationIC[playerid][cycle][Hide] == -1)
        {
            TextDrawsNotificationIC[playerid][cycle][Use] = 0;
            if(TextDrawsNotificationIC[playerid][cycle][TextDraw] != PlayerText:-1)
            {
                PlayerTextDrawDestroy(playerid, TextDrawsNotificationIC[playerid][cycle][TextDraw]);
                TextDrawsNotificationIC[playerid][cycle][Line] = 0;
                TextDrawsNotificationIC[playerid][cycle][Text][0] = EOS;
                TextDrawsNotificationIC[playerid][cycle][MinPosY] = 0;
                TextDrawsNotificationIC[playerid][cycle][MaxPosY] = 0;
                TextDrawsNotificationIC[playerid][cycle][TextDraw] = PlayerText:-1;
            }
            TextDrawsNotificationIC[playerid][cycle][Hide] = -1;
            UpdateTDN_IC(playerid);

            return 1;
        }
    }
    return 0;
}

forward ShowTDN_IC(playerid, const reason[]); 
public ShowTDN_IC(playerid, const reason[])
{
    for(new cycle; cycle < MAX_TDN_IC; cycle++)
    {
        if(!TextDrawsNotificationIC[playerid][cycle][Use])
        {
            TextDrawsNotificationIC[playerid][cycle][Text][0] = EOS;
            new text[MAX_TDN_TEXT_IC];

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

            strcat(TextDrawsNotificationIC[playerid][cycle][Text], text, MAX_TDN_TEXT_IC);

            TextDrawsNotificationIC[playerid][cycle][Use] = 1;
 
            LinesTDN_IC(playerid, cycle);

            #if defined TDN_MODE_DOWN_IC

            MinPosYTDN_IC(playerid, cycle);
            MaxPosYTDN_IC(playerid, cycle);

            #endif

            #if defined TDN_MODE_UP_IC

            MaxPosYTDN_IC(playerid, cycle);
            MinPosYTDN_IC(playerid, cycle);
            
            #endif

            TextDrawsNotificationIC[playerid][cycle][Hide] = -1;

            CreateTDN_IC(playerid, cycle);

            SetTimerEx("TimerHideTDN_IC", TDN_TIME_IC, false, "i", playerid);

            return 1;
        }
    }
    return -1;
}

forward ShowTDN_Manual_IC(playerid, const reason[]); 
public ShowTDN_Manual_IC(playerid, const reason[])
{
    for(new cycle; cycle < MAX_TDN_IC; cycle++)
    {
        if(!TextDrawsNotificationIC[playerid][cycle][Use])
        {
            TextDrawsNotificationIC[playerid][cycle][Text][0] = EOS;
            new text[MAX_TDN_TEXT_IC];

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

            strcat(TextDrawsNotificationIC[playerid][cycle][Text], text, MAX_TDN_TEXT_IC);
 
            TextDrawsNotificationIC[playerid][cycle][Use] = 1;
 
            LinesTDN_IC(playerid, cycle);

            #if defined TDN_MODE_DOWN_IC

            MinPosYTDN_IC(playerid, cycle);
            MaxPosYTDN_IC(playerid, cycle);

            #endif

            #if defined TDN_MODE_UP_IC

            MaxPosYTDN_IC(playerid, cycle);
            MinPosYTDN_IC(playerid, cycle);
            
            #endif

            CreateTDN_IC(playerid, cycle);

            while(used_IC(playerid, counter[playerid]))
            {
                if(counter[playerid] == MAX_TDN_IC - 1) counter[playerid] = 0;
                else counter[playerid]++;
            }

            new TDN = counter[playerid];

            TextDrawsNotificationIC[playerid][cycle][Hide] = TDN;

            if(counter[playerid] == MAX_TDN_IC - 1) counter[playerid] = 0;
            else counter[playerid]++;

            return TDN;
        }
    }
    return -1;
}

stock used_IC(playerid, usedID)
{
    for(new cycle; cycle < MAX_TDN_IC; cycle++)
    {
        if(TextDrawsNotificationIC[playerid][cycle][Hide] == usedID) return 1;
    }
    return 0;
}

forward hideTDN_IC(playerid, TDN);
public hideTDN_IC(playerid, TDN)
{
    for(new cycle; cycle < MAX_TDN_IC; cycle++)
    {
        if(TextDrawsNotificationIC[playerid][cycle][Hide] == TDN)
        {
            TextDrawsNotificationIC[playerid][cycle][Use] = 0;
            if(TextDrawsNotificationIC[playerid][cycle][TextDraw] != PlayerText:-1)
            {
                PlayerTextDrawDestroy(playerid, TextDrawsNotificationIC[playerid][cycle][TextDraw]);
                TextDrawsNotificationIC[playerid][cycle][Line] = 0;
                TextDrawsNotificationIC[playerid][cycle][Text][0] = EOS;
                TextDrawsNotificationIC[playerid][cycle][MinPosY] = 0;
                TextDrawsNotificationIC[playerid][cycle][MaxPosY] = 0;
                TextDrawsNotificationIC[playerid][cycle][TextDraw] = PlayerText:-1;
            }
            TextDrawsNotificationIC[playerid][cycle][Hide] = -1;
            UpdateTDN_IC(playerid);
            return 1;
        }
    }
    return 0;
}

stock UpdateTDN_IC(playerid)
{
    for(new cycle = 0; cycle < MAX_TDN_IC; cycle ++)
    {
        if(!TextDrawsNotificationIC[playerid][cycle][Use])
        {
            if(cycle != MAX_TDN_IC - 1)
            {
                if(TextDrawsNotificationIC[playerid][cycle + 1][Use])
                {
                    TextDrawsNotificationIC[playerid][cycle][Use] = TextDrawsNotificationIC[playerid][cycle + 1][Use];
                    TextDrawsNotificationIC[playerid][cycle][Line] = TextDrawsNotificationIC[playerid][cycle + 1][Line];
                    strcat(TextDrawsNotificationIC[playerid][cycle][Text], TextDrawsNotificationIC[playerid][cycle + 1][Text], MAX_TDN_TEXT_IC);
                    TextDrawsNotificationIC[playerid][cycle][TextDraw] = TextDrawsNotificationIC[playerid][cycle + 1][TextDraw];
                    TextDrawsNotificationIC[playerid][cycle][Hide] = TextDrawsNotificationIC[playerid][cycle + 1][Hide];

                    TextDrawsNotificationIC[playerid][cycle + 1][Use] = 0;
                    TextDrawsNotificationIC[playerid][cycle + 1][Line] = 0;
                    TextDrawsNotificationIC[playerid][cycle + 1][Text][0] = EOS;
                    TextDrawsNotificationIC[playerid][cycle + 1][TextDraw] = PlayerText:-1;
                    TextDrawsNotificationIC[playerid][cycle + 1][MinPosY] = 0;
                    TextDrawsNotificationIC[playerid][cycle + 1][MaxPosY] = 0;
                    TextDrawsNotificationIC[playerid][cycle + 1][Hide] = -1;

                    #if defined TDN_MODE_DOWN_IC

                    MinPosYTDN_IC(playerid, cycle);
                    MaxPosYTDN_IC(playerid, cycle);
                    
                    #endif

                    #if defined TDN_MODE_UP_IC
                    
                    MaxPosYTDN_IC(playerid, cycle);
                    MinPosYTDN_IC(playerid, cycle);
                    
                    #endif       
                }
            }
        }
        else if(TextDrawsNotificationIC[playerid][cycle][Use])
        {
            if(cycle != 0)
            {
                if(!TextDrawsNotificationIC[playerid][cycle - 1][Use])
                {
                    TextDrawsNotificationIC[playerid][cycle - 1][Use] = TextDrawsNotificationIC[playerid][cycle][Use];
                    TextDrawsNotificationIC[playerid][cycle - 1][Line] = TextDrawsNotificationIC[playerid][cycle][Line];
                    strcat(TextDrawsNotificationIC[playerid][cycle - 1][Text], TextDrawsNotificationIC[playerid][cycle][Text], MAX_TDN_TEXT_IC);
                    TextDrawsNotificationIC[playerid][cycle - 1][TextDraw] = TextDrawsNotificationIC[playerid][cycle][TextDraw];
                    TextDrawsNotificationIC[playerid][cycle - 1][Hide] = TextDrawsNotificationIC[playerid][cycle][Hide];

                    TextDrawsNotificationIC[playerid][cycle][Use] = 0;
                    TextDrawsNotificationIC[playerid][cycle][Line] = 0;
                    TextDrawsNotificationIC[playerid][cycle][Text][0] = EOS;
                    TextDrawsNotificationIC[playerid][cycle][TextDraw] = PlayerText:-1;
                    TextDrawsNotificationIC[playerid][cycle][MinPosY] = 0;
                    TextDrawsNotificationIC[playerid][cycle][MaxPosY] = 0;
                    TextDrawsNotificationIC[playerid][cycle][Hide] = -1;

                    #if defined TDN_MODE_DOWN_IC

                    MinPosYTDN_IC(playerid, cycle - 1);
                    MaxPosYTDN_IC(playerid, cycle - 1);
                    
                    #endif

                    #if defined TDN_MODE_UP_IC
                    
                    MaxPosYTDN_IC(playerid, cycle - 1);
                    MinPosYTDN_IC(playerid, cycle - 1);
                    
                    #endif
                }
            }
        }
        CreateTDN_IC(playerid, cycle);
    }
    return 1;
}

stock MinPosYTDN_IC(playerid, TDN)
{
    #if defined TDN_MODE_DOWN_IC

    if(TDN == 0)
    {
        TextDrawsNotificationIC[playerid][TDN][MinPosY] = TDN_POS_Y_IC;
    }
    else
    {
        TextDrawsNotificationIC[playerid][TDN][MinPosY] = TextDrawsNotificationIC[playerid][TDN - 1][MaxPosY] + TDN_DISTANCE_IC;
    }
    return 1;

    #endif

    #if defined TDN_MODE_UP_IC

    TextDrawsNotificationIC[playerid][TDN][MinPosY] = TextDrawsNotificationIC[playerid][TDN][MaxPosY] - ((TDN_LETTER_SIZE_Y_IC * 2) + 2) - ((TDN_LETTER_SIZE_Y_IC * 5.75) * TextDrawsNotificationIC[playerid][TDN][Line]) - ((TextDrawsNotificationIC[playerid][TDN][Line] - 1) * ((TDN_LETTER_SIZE_Y_IC * 2) + 2 + TDN_LETTER_SIZE_Y_IC)) - (TDN_LETTER_SIZE_Y_IC + 3);
    return 1;

    #endif
}

stock MaxPosYTDN_IC(playerid, TDN)
{
    #if defined TDN_MODE_DOWN_IC

    TextDrawsNotificationIC[playerid][TDN][MaxPosY] = TextDrawsNotificationIC[playerid][TDN][MinPosY] + (TDN_LETTER_SIZE_Y_IC * 2) + 2 + (TDN_LETTER_SIZE_Y_IC * 5.75 * TextDrawsNotificationIC[playerid][TDN][Line]) + ((TextDrawsNotificationIC[playerid][TDN][Line] - 1) * ((TDN_LETTER_SIZE_Y_IC * 2) + 2 + TDN_LETTER_SIZE_Y_IC)) + TDN_LETTER_SIZE_Y_IC + 3;
    return 1;

    #endif

    #if defined TDN_MODE_UP_IC

    if(TDN == 0)
    {
        TextDrawsNotificationIC[playerid][TDN][MaxPosY] = TDN_POS_Y_IC;
    }
    else
    {
        TextDrawsNotificationIC[playerid][TDN][MaxPosY] = TextDrawsNotificationIC[playerid][TDN - 1][MinPosY] - TDN_DISTANCE_IC;
    }
    return 1;

    #endif
}

stock LinesTDN_IC(playerid, TDN)
{
    new lines = 1, Float:width, lastspace = -1, supr, len = strlen(TextDrawsNotificationIC[playerid][TDN][Text]);
 
    for(new i = 0; i < len; i ++)
    {
        if(TextDrawsNotificationIC[playerid][TDN][Text][i] == '~')
        {
            if(supr == 0)
            {
                supr = 1;
                if(TextDrawsNotificationIC[playerid][TDN][Text][i+2] != '~') SendClientMessage(playerid, -1, "Error: '~' used incorrectly'");
            }
            else if(supr == 1) supr = 0;
        }
        else
        {
            if(supr == 1)
            {
                if(TextDrawsNotificationIC[playerid][TDN][Text][i] == 'n')
                {
                    lines ++;
                    lastspace = -1;
                    width = 0;
                }
            }
            else
            {
                if(TextDrawsNotificationIC[playerid][TDN][Text][i] == ' ') lastspace = i;
 
                width += TDN_LETTER_SIZE_X_IC * GetTextDrawCharacterWidth(TextDrawsNotificationIC[playerid][TDN][Text][i], TDN_FONT_IC, bool:TDN_PROPORTIONAL_IC);

                if(width > TDN_SIZE_IC - 3)
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
    
    TextDrawsNotificationIC[playerid][TDN][Line] = lines;
 
    return 1;
}

stock CreateTDN_IC(playerid, TDN)
{
    if(TextDrawsNotificationIC[playerid][TDN][Use] == 1)
    {
        if(TextDrawsNotificationIC[playerid][TDN][TextDraw] != PlayerText:-1)
        {
            PlayerTextDrawDestroy(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw]);
        }
    
        TextDrawsNotificationIC[playerid][TDN][TextDraw] = CreatePlayerTextDraw(playerid, TDN_POS_X_IC, TextDrawsNotificationIC[playerid][TDN][MinPosY], TextDrawsNotificationIC[playerid][TDN][Text]);
        PlayerTextDrawFont(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], TDN_FONT_IC);
        PlayerTextDrawLetterSize(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], TDN_LETTER_SIZE_X_IC, TDN_LETTER_SIZE_Y_IC);
        PlayerTextDrawTextSize(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], floatadd(TDN_POS_X_IC, TDN_SIZE_IC), 1.000000);
        PlayerTextDrawSetOutline(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], 1);
        PlayerTextDrawSetShadow(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], 0);
        PlayerTextDrawAlignment(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], 1);
        PlayerTextDrawColor(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], TDN_COLOR_IC);
        PlayerTextDrawBackgroundColor(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], TDN_COLOR_BOX_IC);
        PlayerTextDrawBoxColor(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], TDN_COLOR_BOX_IC);
        PlayerTextDrawUseBox(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], 1);
        PlayerTextDrawSetProportional(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], TDN_PROPORTIONAL_IC);
        PlayerTextDrawSetSelectable(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw], 0);
        PlayerTextDrawShow(playerid, TextDrawsNotificationIC[playerid][TDN][TextDraw]);
    }
    return 1;
}

public OnGameModeInit()
{
    for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
    {
        for(new TDN = 0; TDN < MAX_TDN_IC; TDN++)
        {
            TextDrawsNotificationIC[playerid][TDN][TextDraw] = PlayerText:-1;
            TextDrawsNotificationIC[playerid][TDN][Hide] = -1;
        }
    }
    #if defined TDN_IC_OnGameModeInit
		return TDN_IC_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit TDN_IC_OnGameModeInit
#if defined TDN_IC_OnGameModeInit
	forward TDN_IC_OnGameModeInit();
#endif

 
public OnFilterScriptInit()
{
    for(new playerid = 0; playerid < MAX_PLAYERS; playerid++)
    {
        for(new TDN = 0; TDN < MAX_TDN_IC; TDN++)
        {
            TextDrawsNotificationIC[playerid][TDN][TextDraw] = PlayerText:-1;
            TextDrawsNotificationIC[playerid][TDN][Hide] = -1;
        }
    }
    #if defined TDN_IC_OnFilterScriptInit
		return TDN_IC_OnFilterScriptInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif

#define OnFilterScriptInit TDN_IC_OnFilterScriptInit
#if defined TDN_IC_OnFilterScriptInit
	forward TDN_IC_OnFilterScriptInit();
#endif

public OnPlayerDisconnect(playerid, reason)
{
    for(new cycle; cycle < MAX_TDN_IC; cycle++)
    {
        TextDrawsNotificationIC[playerid][cycle][Use] = 0;
        TextDrawsNotificationIC[playerid][cycle][Line] = 0;
        TextDrawsNotificationIC[playerid][cycle][Text][0] = EOS;
        TextDrawsNotificationIC[playerid][cycle][MinPosY] = 0;
        TextDrawsNotificationIC[playerid][cycle][MaxPosY] = 0;
        TextDrawsNotificationIC[playerid][cycle][Hide] = -1;
        TextDrawsNotificationIC[playerid][cycle][TextDraw] = PlayerText:-1;
    }
    #if defined TDN_IC_OnPlayerDisconnect
		return TDN_IC_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect TDN_IC_OnPlayerDisconnect
#if defined TDN_IC_OnPlayerDisconnect
	forward TDN_IC_OnPlayerDisconnect(playerid, reason);
#endif