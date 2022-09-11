/*
    menu-preview - Version 0.1
    Created by ThePez - based on adri1's
*/

#if defined _inc_menu_preview
    #endinput
#endif

#define _inc_menu_preview

#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#if !defined MAX_MENU_PREVIEWS
    #define MAX_MENU_PREVIEWS 50
#endif

#if !defined MAX_MENU_PREVIEWS_PAGES
    #define MAX_MENU_PREVIEWS_PAGES 50
#endif

#if !defined MAX_MENU_TITLE
    #define MAX_MENU_TITLE 32
#endif

#if !defined MAX_MENU_MODEL_INFO
    #define MAX_MENU_MODEL_INFO 32
#endif

#define MAX_MENU_MODELS MAX_MENU_PREVIEWS_PAGES * 6

#define INVALID_MENU_ID -1

forward OnPreviewMenuResponse(playerid, menu_id, response, menu_model_id, modelid, info[]);

enum ENUM_MENU_PREVIEWS
{
    menu_preview_USE = 0,
    menu_preview_TITLE[MAX_MENU_TITLE],
    menu_preview_BG_COLOR,
    menu_preview_TEXT_COLOR,
    menu_preview_BUTTONS_BG_COLOR,
    menu_preview_MODELS,
    menu_preview_PAGES
};
new MENU_PREVIEWS[MAX_MENU_PREVIEWS][ENUM_MENU_PREVIEWS];

enum ENUM_MENU_PREVIEWS_MODELS
{
    menu_preview_USE = 0,
    menu_preview_MODELID,
    menu_preview_INFO[MAX_MENU_MODEL_INFO],
    Float:menu_preview_ROT_X,
    Float:menu_preview_ROT_Y,
    Float:menu_preview_ROT_Z,
    Float:menu_preview_ZOOM
};
new MENU_PREVIEWS_MODELS[MAX_MENU_PREVIEWS][MAX_MENU_MODELS][ENUM_MENU_PREVIEWS_MODELS];

enum ENUM_PLAYER_MENU_PREVIEWS
{
    player_menu_preview_FIRST,
    player_menu_preview_USE,
    player_menu_preview_INDEX,
    player_menu_preview_PAGE
}
new PLAYER_MENU_PREVIEWS[MAX_PLAYERS][ENUM_PLAYER_MENU_PREVIEWS];

new counter_MENU_PREVIEWS = 0,
    counter_MENU_PREVIEWS_MODELS[MAX_MENU_PREVIEWS] = {0, ...},
    PlayerText:PTD_Menu[MAX_PLAYERS][8],
    PlayerText:PTD_Menu_Models[MAX_PLAYERS][6],
    PlayerText:PTD_Menu_Models_Info[MAX_PLAYERS][6];

stock CreatePreviewMenu(const title[])
{
    new menu_index = counter_MENU_PREVIEWS;
    if(MENU_PREVIEWS[menu_index][menu_preview_USE] == 1) return INVALID_MENU_ID;

    MENU_PREVIEWS[menu_index][menu_preview_USE] = 1;

    MENU_PREVIEWS[menu_index][menu_preview_TITLE][0] = EOS;
    strcat(MENU_PREVIEWS[menu_index][menu_preview_TITLE], title, MAX_MENU_TITLE);

    MENU_PREVIEWS[menu_index][menu_preview_BG_COLOR] = 220;
    MENU_PREVIEWS[menu_index][menu_preview_TEXT_COLOR] = -1;
    MENU_PREVIEWS[menu_index][menu_preview_BUTTONS_BG_COLOR] = 1179010815;
    MENU_PREVIEWS[menu_index][menu_preview_MODELS] = 0;
    MENU_PREVIEWS[menu_index][menu_preview_PAGES] = 0;

    for(new cycle; cycle < MAX_MENU_PREVIEWS; cycle++)
    {
        if(MENU_PREVIEWS[counter_MENU_PREVIEWS][menu_preview_USE] == 1)
        {
            if(counter_MENU_PREVIEWS == MAX_MENU_PREVIEWS - 1) counter_MENU_PREVIEWS = 0;
            else counter_MENU_PREVIEWS++;
        }
        else break;
    }

    return menu_index;
}

stock DeletePreviewMenu(menu_index)
{
    if(menu_index < 0 || menu_index >= MAX_MENU_PREVIEWS || MENU_PREVIEWS[menu_index][menu_preview_USE] == 0) return 0;
    new model_index = counter_MENU_PREVIEWS_MODELS[menu_index];

    MENU_PREVIEWS[menu_index][menu_preview_USE] = 0;
    MENU_PREVIEWS[menu_index][menu_preview_TITLE][0] = EOS;
    MENU_PREVIEWS[menu_index][menu_preview_BG_COLOR] = 0;
    MENU_PREVIEWS[menu_index][menu_preview_TEXT_COLOR] = 0;
    MENU_PREVIEWS[menu_index][menu_preview_BUTTONS_BG_COLOR] = 0;
    MENU_PREVIEWS[menu_index][menu_preview_MODELS] = 0;
    MENU_PREVIEWS[menu_index][menu_preview_PAGES] = 0;

    counter_MENU_PREVIEWS = menu_index;

    for(new i; i < model_index; i++)
    {
        MENU_PREVIEWS_MODELS[menu_index][i][menu_preview_USE] = 0;
        MENU_PREVIEWS_MODELS[menu_index][i][menu_preview_MODELID] = 0;
        MENU_PREVIEWS_MODELS[menu_index][i][menu_preview_INFO] = EOS;
        MENU_PREVIEWS_MODELS[menu_index][i][menu_preview_ROT_X] = 0.0;
        MENU_PREVIEWS_MODELS[menu_index][i][menu_preview_ROT_Y] = 0.0;
        MENU_PREVIEWS_MODELS[menu_index][i][menu_preview_ROT_Z] = 0.0;
        MENU_PREVIEWS_MODELS[menu_index][i][menu_preview_ZOOM] = 0.0;
    }

    counter_MENU_PREVIEWS_MODELS[menu_index] = 0;

    return 1;
}

stock AddModelToPreviewMenu(menu_index, modelid, const info[] = "", Float:rot_x = 0.0, Float:rot_y = 0.0, Float:rot_z = 0.0, Float:zoom = 1.0)
{
    if(menu_index < 0 || menu_index >= MAX_MENU_PREVIEWS || MENU_PREVIEWS[menu_index][menu_preview_USE] != 1) return INVALID_MENU_ID;
    new model_index = counter_MENU_PREVIEWS_MODELS[menu_index];
    if(model_index < 0 || model_index >= MAX_MENU_MODELS || MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_USE] == 1) return INVALID_MENU_ID;

    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_USE] = 1;

    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_MODELID] = modelid;

    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_INFO][0] = EOS;
    strcat(MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_INFO], info, MAX_MENU_MODEL_INFO);

    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ROT_X] = rot_x;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ROT_Y] = rot_y;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ROT_Z] = rot_z;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ZOOM] = zoom;

    MENU_PREVIEWS[menu_index][menu_preview_MODELS]++;

    for(new cycle; cycle < MAX_MENU_MODELS; cycle++)
    {
        if(MENU_PREVIEWS_MODELS[menu_index][counter_MENU_PREVIEWS_MODELS[menu_index]][menu_preview_USE] == 1)
        {
            if(counter_MENU_PREVIEWS_MODELS[menu_index] == MAX_MENU_MODELS - 1) counter_MENU_PREVIEWS_MODELS[menu_index] = 0;
            else counter_MENU_PREVIEWS_MODELS[menu_index]++;
        }
        else break;
    }

    new Float:pages = floatdiv(float(MENU_PREVIEWS[menu_index][menu_preview_MODELS]), float(6));
    MENU_PREVIEWS[menu_index][menu_preview_PAGES] = floatround(pages, floatround_ceil);
    return model_index;
}

stock RemovePreviewMenuModel(menu_index, model_index)
{
    if(menu_index < 0 || menu_index >= MAX_MENU_PREVIEWS || MENU_PREVIEWS[menu_index][menu_preview_USE] == 0) return 0;
    if(model_index < 0 || model_index >= MAX_MENU_MODELS) return 0;
    if(MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_USE] == 0) return 1;

    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_USE] = 0;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_MODELID] = 0;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_INFO] = EOS;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ROT_X] = 0.0;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ROT_Y] = 0.0;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ROT_Z] = 0.0;
    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_ZOOM] = 0.0;

    counter_MENU_PREVIEWS_MODELS[menu_index] = model_index;

    MENU_PREVIEWS[menu_index][menu_preview_MODELS]--;

    new Float:pages = floatdiv(float(MENU_PREVIEWS[menu_index][menu_preview_MODELS]), float(6));
    MENU_PREVIEWS[menu_index][menu_preview_PAGES] = floatround(pages, floatround_ceil);
    return 1;
}

stock SetPreviewMenuModel(menu_index, model_index, modelid)
{
    if(menu_index < 0 || menu_index >= MAX_MENU_PREVIEWS || MENU_PREVIEWS[menu_index][menu_preview_USE] == 0) return 0;
    if(model_index < 0 || model_index >= MAX_MENU_MODELS || MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_USE] == 0) return 0;

    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_MODELID] = modelid;
    return 1;
}

stock SetPreviewMenuInfo(menu_index, model_index, const info[])
{
    if(menu_index < 0 || menu_index >= MAX_MENU_PREVIEWS || MENU_PREVIEWS[menu_index][menu_preview_USE] == 0) return 0;
    if(model_index < 0 || model_index >= MAX_MENU_MODELS || MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_USE] == 0) return 0;

    MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_INFO][0] = EOS;
    strcat(MENU_PREVIEWS_MODELS[menu_index][model_index][menu_preview_INFO], info, MAX_MENU_MODEL_INFO);

    return 1;
}

stock ShowPreviewMenuForPlayer(playerid, menu_index, select_color = -1)
{
    if(menu_index < 0 || menu_index >= MAX_MENU_PREVIEWS || MENU_PREVIEWS[menu_index][menu_preview_USE] == 0) return 0;
    if(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_USE] == 1) return 0;

    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_USE] = 1;
    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX] = menu_index;
    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] = 1;

    UpdatePreviewMenuForPlayer(playerid);
    SelectTextDraw(playerid, select_color);
    return 1;
}

UpdatePreviewMenuForPlayer(playerid)
{
    if(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX] < 0 || PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX] >= MAX_MENU_PREVIEWS || MENU_PREVIEWS[PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX]][menu_preview_USE] == 0) return 0;
    
    new menu_index = PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX],
        td_model_index;

    if(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_FIRST])
    {
        PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_FIRST] = 0;

        PlayerTextDrawShow(playerid, PTD_Menu[playerid][0]);

        if(isnull(MENU_PREVIEWS[menu_index][menu_preview_TITLE])) {}
        else
        {
            PlayerTextDrawColor(playerid, PTD_Menu[playerid][1], MENU_PREVIEWS[menu_index][menu_preview_TEXT_COLOR]);
            PlayerTextDrawSetString(playerid, PTD_Menu[playerid][1], MENU_PREVIEWS[menu_index][menu_preview_TITLE]);
            PlayerTextDrawShow(playerid, PTD_Menu[playerid][1]);
        }

        if(MENU_PREVIEWS[menu_index][menu_preview_PAGES] > 1)
        {
            PlayerTextDrawColor(playerid, PTD_Menu[playerid][4], MENU_PREVIEWS[menu_index][menu_preview_TEXT_COLOR]);
            PlayerTextDrawColor(playerid, PTD_Menu[playerid][5], MENU_PREVIEWS[menu_index][menu_preview_TEXT_COLOR]);

            PlayerTextDrawShow(playerid, PTD_Menu[playerid][2]);
            PlayerTextDrawShow(playerid, PTD_Menu[playerid][3]);
            PlayerTextDrawShow(playerid, PTD_Menu[playerid][4]);
            PlayerTextDrawShow(playerid, PTD_Menu[playerid][5]);
        }

    }
    else
    {
        for(new cycle; cycle < 6; cycle++)
        {
            PlayerTextDrawHide(playerid, PTD_Menu_Models[playerid][cycle]);
            PlayerTextDrawHide(playerid, PTD_Menu_Models_Info[playerid][cycle]);
        }
    }
    new td_str[6];
    
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][6], MENU_PREVIEWS[menu_index][menu_preview_TEXT_COLOR]);

    format(td_str, sizeof td_str, "%d/%d", PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE], MENU_PREVIEWS[menu_index][menu_preview_PAGES]);
    PlayerTextDrawSetString(playerid, PTD_Menu[playerid][6], td_str);
    PlayerTextDrawShow(playerid, PTD_Menu[playerid][6]);

    PlayerTextDrawShow(playerid, PTD_Menu[playerid][7]);

    for(new index = (PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] * 6) - 6; index < PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] * 6; index++)
    {
        if(MENU_PREVIEWS_MODELS[menu_index][index][menu_preview_USE] == 1)
        {
            PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models[playerid][td_model_index], MENU_PREVIEWS[menu_index][menu_preview_BUTTONS_BG_COLOR]);
            PlayerTextDrawSetPreviewModel(playerid, PTD_Menu_Models[playerid][td_model_index], MENU_PREVIEWS_MODELS[menu_index][index][menu_preview_MODELID]);
            PlayerTextDrawSetPreviewRot(playerid, PTD_Menu_Models[playerid][td_model_index], MENU_PREVIEWS_MODELS[menu_index][index][menu_preview_ROT_X], MENU_PREVIEWS_MODELS[menu_index][index][menu_preview_ROT_Y], MENU_PREVIEWS_MODELS[menu_index][index][menu_preview_ROT_Z], MENU_PREVIEWS_MODELS[menu_index][index][menu_preview_ZOOM]);
            PlayerTextDrawShow(playerid, PTD_Menu_Models[playerid][td_model_index]);

            PlayerTextDrawColor(playerid, PTD_Menu_Models_Info[playerid][td_model_index], MENU_PREVIEWS[menu_index][menu_preview_TEXT_COLOR]);
            PlayerTextDrawSetString(playerid, PTD_Menu_Models_Info[playerid][td_model_index], MENU_PREVIEWS_MODELS[menu_index][index][menu_preview_INFO]);

            PlayerTextDrawShow(playerid, PTD_Menu_Models_Info[playerid][td_model_index]);
        }
        td_model_index++;
    }
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_USE] == 1)
    {
        if(playertextid == PTD_Menu[playerid][2] || playertextid == PTD_Menu[playerid][4])
        {
            if(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] == MENU_PREVIEWS[PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX]][menu_preview_PAGES])
            {
                PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] = 1;
            }
            else PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE]++;

            UpdatePreviewMenuForPlayer(playerid);
        }
        else if(playertextid == PTD_Menu[playerid][3] || playertextid == PTD_Menu[playerid][5])
        {
            if(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] == 1)
            {
                PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] = MENU_PREVIEWS[PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX]][menu_preview_PAGES];
            }
            else PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE]--;

            UpdatePreviewMenuForPlayer(playerid);
        }
        else if(playertextid == PTD_Menu[playerid][7])
        {
            for(new i; i < 8; i++)
            {
                PlayerTextDrawHide(playerid, PTD_Menu[playerid][i]);
            }
            for(new i; i < 6; i++)
            {
                PlayerTextDrawHide(playerid, PTD_Menu_Models[playerid][i]);
                PlayerTextDrawHide(playerid, PTD_Menu_Models_Info[playerid][i]);
            }

            CallRemoteFunction("OnPreviewMenuResponse", "iddddd", playerid, PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX], false, -1, -1, "");

            PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_FIRST] = 1;
            PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_USE] = 0;
            PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX] = 0;
            PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] = 0;
        }
        else
        {
            for(new index ; index < 6; index ++)
            {
                if(playertextid == PTD_Menu_Models[playerid][index])
                {
                    for(new i; i < 8; i++)
                    {
                        PlayerTextDrawHide(playerid, PTD_Menu[playerid][i]);
                    }
                    for(new i; i < 6; i++)
                    {
                        PlayerTextDrawHide(playerid, PTD_Menu_Models[playerid][i]);
                        PlayerTextDrawHide(playerid, PTD_Menu_Models_Info[playerid][i]);
                    }
                    
                    CallRemoteFunction("OnPreviewMenuResponse", "iddddd", playerid, PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX], true, (PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] * 6) - 6 + index, MENU_PREVIEWS_MODELS[PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX]][(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] * 6) - 6 + index][menu_preview_MODELID], MENU_PREVIEWS_MODELS[PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX]][(PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] * 6) - 6 + index][menu_preview_INFO]);

                    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_FIRST] = 1;
                    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_USE] = 0;
                    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX] = 0;
                    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] = 0;
                    return 1;
                }
            }
        }
    }
    
    #if defined MP_OnPlayerClickPlayerTextDraw
        return MP_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerClickPlayerTD
    #undef OnPlayerClickPlayerTD
#else
    #define _ALS_OnPlayerClickPlayerTD
#endif

#define OnPlayerClickPlayerTextDraw MP_OnPlayerClickPlayerTextDraw
#if defined MP_OnPlayerClickPlayerTextDraw
    forward MP_OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid);
#endif

public OnGameModeInit()
{

    print("-------------------");
    print(" Menu Preview Load ");
    print("-------------------");
    print(" ");

    #if defined MP_OnGameModeInit
        return MP_OnGameModeInit();
    #else
        return 1;
    #endif
}
#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif

#define OnGameModeInit MP_OnGameModeInit
#if defined MP_OnGameModeInit
    forward MP_OnGameModeInit();
#endif

public OnPlayerConnect(playerid)
{
    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_FIRST] = 1;

    PTD_Menu[playerid][0] = CreatePlayerTextDraw(playerid, 199.000000, 135.000000, "mdl-2001:logo_box");
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][0], 4);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][0], 250.000000, 201.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][0], 1);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][0], 673720575);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][0], 0);

    PTD_Menu[playerid][1] = CreatePlayerTextDraw(playerid, 318.000000, 145.000000, "title");
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][1], 0.324999, 1.299998);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][1], 2);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][1], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][1], 0);

    PTD_Menu[playerid][2] = CreatePlayerTextDraw(playerid, 230.000000, 299.000000, "mdl-2001:logo_button");
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][2], 4);
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][2], 40.000000, 41.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][2], 1);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][2], 505290495);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][2], -1);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][2], 1);

    PTD_Menu[playerid][3] = CreatePlayerTextDraw(playerid, 365.000000, 299.000000, "mdl-2001:logo_button");
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][3], 40.000000, 41.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][3], 1);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][3], 505290495);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][3], -1);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][3], 1);

    PTD_Menu[playerid][4] = CreatePlayerTextDraw(playerid, 250.000000, 313.000000, "<<");
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][4], 0.324999, 1.299998);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][4], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][4], 2);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][4], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][4], 1);

    PTD_Menu[playerid][5] = CreatePlayerTextDraw(playerid, 386.000000, 313.000000, ">>");
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][5], 0.324999, 1.299998);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][5], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][5], 2);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][5], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][5], 1);

    PTD_Menu[playerid][6] = CreatePlayerTextDraw(playerid, 318.000000, 313.000000, "0/0");
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][6], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][6], 0.324999, 1.299998);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][6], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][6], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][6], 2);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][6], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][6], 0);

    PTD_Menu[playerid][7] = CreatePlayerTextDraw(playerid, 411.000000, 141.000000, "mdl-2001:logo_cancel");
    PlayerTextDrawFont(playerid, PTD_Menu[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, PTD_Menu[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu[playerid][7], 11.500000, 11.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu[playerid][7], 1);
    PlayerTextDrawColor(playerid, PTD_Menu[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu[playerid][7], 1);

    PTD_Menu_Models[playerid][0] = CreatePlayerTextDraw(playerid, 220.000000, 164.000000, "");
    PlayerTextDrawFont(playerid, PTD_Menu_Models[playerid][0], 5);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models[playerid][0], 63.000000, 69.500000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models[playerid][0], 1);
    PlayerTextDrawColor(playerid, PTD_Menu_Models[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models[playerid][0], 505290495);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models[playerid][0], 1);
    PlayerTextDrawSetPreviewModel(playerid, PTD_Menu_Models[playerid][0], 0);
    PlayerTextDrawSetPreviewRot(playerid, PTD_Menu_Models[playerid][0], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehCol(playerid, PTD_Menu_Models[playerid][0], 1, 1);

    PTD_Menu_Models[playerid][1] = CreatePlayerTextDraw(playerid, 287.000000, 164.000000, "");
    PlayerTextDrawFont(playerid, PTD_Menu_Models[playerid][1], 5);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models[playerid][1], 63.000000, 69.500000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models[playerid][1], 1);
    PlayerTextDrawColor(playerid, PTD_Menu_Models[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models[playerid][1], 505290495);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models[playerid][1], 1);
    PlayerTextDrawSetPreviewModel(playerid, PTD_Menu_Models[playerid][1], 0);
    PlayerTextDrawSetPreviewRot(playerid, PTD_Menu_Models[playerid][1], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehCol(playerid, PTD_Menu_Models[playerid][1], 1, 1);

    PTD_Menu_Models[playerid][2] = CreatePlayerTextDraw(playerid, 355.000000, 164.000000, "");
    PlayerTextDrawFont(playerid, PTD_Menu_Models[playerid][2], 5);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models[playerid][2], 63.000000, 69.500000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models[playerid][2], 1);
    PlayerTextDrawColor(playerid, PTD_Menu_Models[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models[playerid][2], 505290495);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models[playerid][2], 1);
    PlayerTextDrawSetPreviewModel(playerid, PTD_Menu_Models[playerid][2], 0);
    PlayerTextDrawSetPreviewRot(playerid, PTD_Menu_Models[playerid][2], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehCol(playerid, PTD_Menu_Models[playerid][2], 1, 1);

    PTD_Menu_Models[playerid][3] = CreatePlayerTextDraw(playerid, 219.000000, 238.000000, "");
    PlayerTextDrawFont(playerid, PTD_Menu_Models[playerid][3], 5);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models[playerid][3], 63.000000, 69.500000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models[playerid][3], 1);
    PlayerTextDrawColor(playerid, PTD_Menu_Models[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models[playerid][3], 505290495);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models[playerid][3], 1);
    PlayerTextDrawSetPreviewModel(playerid, PTD_Menu_Models[playerid][3], 0);
    PlayerTextDrawSetPreviewRot(playerid, PTD_Menu_Models[playerid][3], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehCol(playerid, PTD_Menu_Models[playerid][3], 1, 1);

    PTD_Menu_Models[playerid][4] = CreatePlayerTextDraw(playerid, 287.000000, 237.000000, "");
    PlayerTextDrawFont(playerid, PTD_Menu_Models[playerid][4], 5);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models[playerid][4], 63.000000, 69.500000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models[playerid][4], 1);
    PlayerTextDrawColor(playerid, PTD_Menu_Models[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models[playerid][4], 505290495);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models[playerid][4], 1);
    PlayerTextDrawSetPreviewModel(playerid, PTD_Menu_Models[playerid][4], 0);
    PlayerTextDrawSetPreviewRot(playerid, PTD_Menu_Models[playerid][4], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehCol(playerid, PTD_Menu_Models[playerid][4], 1, 1);

    PTD_Menu_Models[playerid][5] = CreatePlayerTextDraw(playerid, 355.000000, 237.000000, "");
    PlayerTextDrawFont(playerid, PTD_Menu_Models[playerid][5], 5);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models[playerid][5], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models[playerid][5], 63.000000, 69.500000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models[playerid][5], 1);
    PlayerTextDrawColor(playerid, PTD_Menu_Models[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models[playerid][5], 505290495);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models[playerid][5], 1);
    PlayerTextDrawSetPreviewModel(playerid, PTD_Menu_Models[playerid][5], 0);
    PlayerTextDrawSetPreviewRot(playerid, PTD_Menu_Models[playerid][5], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehCol(playerid, PTD_Menu_Models[playerid][5], 1, 1);

    PTD_Menu_Models_Info[playerid][0] = CreatePlayerTextDraw(playerid, 283.000000, 227.000000, "_");
    PlayerTextDrawFont(playerid, PTD_Menu_Models_Info[playerid][0], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models_Info[playerid][0], 0.180000, 0.720000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models_Info[playerid][0], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models_Info[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models_Info[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models_Info[playerid][0], 3);
    PlayerTextDrawColor(playerid, PTD_Menu_Models_Info[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models_Info[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models_Info[playerid][0], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models_Info[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models_Info[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models_Info[playerid][0], 0);

    PTD_Menu_Models_Info[playerid][1] = CreatePlayerTextDraw(playerid, 350.000000, 227.000000, "_");
    PlayerTextDrawFont(playerid, PTD_Menu_Models_Info[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models_Info[playerid][1], 0.180000, 0.720000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models_Info[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models_Info[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models_Info[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models_Info[playerid][1], 3);
    PlayerTextDrawColor(playerid, PTD_Menu_Models_Info[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models_Info[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models_Info[playerid][1], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models_Info[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models_Info[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models_Info[playerid][1], 0);

    PTD_Menu_Models_Info[playerid][2] = CreatePlayerTextDraw(playerid, 418.000000, 227.000000, "_");
    PlayerTextDrawFont(playerid, PTD_Menu_Models_Info[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models_Info[playerid][2], 0.180000, 0.720000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models_Info[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models_Info[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models_Info[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models_Info[playerid][2], 3);
    PlayerTextDrawColor(playerid, PTD_Menu_Models_Info[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models_Info[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models_Info[playerid][2], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models_Info[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models_Info[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models_Info[playerid][2], 0);

    PTD_Menu_Models_Info[playerid][3] = CreatePlayerTextDraw(playerid, 283.000000, 301.000000, "_");
    PlayerTextDrawFont(playerid, PTD_Menu_Models_Info[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models_Info[playerid][3], 0.180000, 0.720000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models_Info[playerid][3], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models_Info[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models_Info[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models_Info[playerid][3], 3);
    PlayerTextDrawColor(playerid, PTD_Menu_Models_Info[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models_Info[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models_Info[playerid][3], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models_Info[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models_Info[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models_Info[playerid][3], 0);

    PTD_Menu_Models_Info[playerid][4] = CreatePlayerTextDraw(playerid, 350.000000, 301.000000, "_");
    PlayerTextDrawFont(playerid, PTD_Menu_Models_Info[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models_Info[playerid][4], 0.180000, 0.720000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models_Info[playerid][4], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models_Info[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models_Info[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models_Info[playerid][4], 3);
    PlayerTextDrawColor(playerid, PTD_Menu_Models_Info[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models_Info[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models_Info[playerid][4], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models_Info[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models_Info[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models_Info[playerid][4], 0);

    PTD_Menu_Models_Info[playerid][5] = CreatePlayerTextDraw(playerid, 418.000000, 301.000000, "_");
    PlayerTextDrawFont(playerid, PTD_Menu_Models_Info[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid, PTD_Menu_Models_Info[playerid][5], 0.180000, 0.720000);
    PlayerTextDrawTextSize(playerid, PTD_Menu_Models_Info[playerid][5], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PTD_Menu_Models_Info[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, PTD_Menu_Models_Info[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, PTD_Menu_Models_Info[playerid][5], 3);
    PlayerTextDrawColor(playerid, PTD_Menu_Models_Info[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, PTD_Menu_Models_Info[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, PTD_Menu_Models_Info[playerid][5], 0);
    PlayerTextDrawUseBox(playerid, PTD_Menu_Models_Info[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, PTD_Menu_Models_Info[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, PTD_Menu_Models_Info[playerid][5], 0);

    #if defined MP_OnPlayerConnect
        return MP_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect MP_OnPlayerConnect
#if defined MP_OnPlayerConnect
    forward MP_OnPlayerConnect(playerid);
#endif

public OnPlayerDisconnect(playerid, reason)
{
    for(new i; i < 8; i++)
    {
        PlayerTextDrawDestroy(playerid, PTD_Menu[playerid][i]);
    }
    for(new i; i < 6; i++)
    {
        PlayerTextDrawDestroy(playerid, PTD_Menu_Models[playerid][i]);
        PlayerTextDrawDestroy(playerid, PTD_Menu_Models_Info[playerid][i]);
    }

    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_FIRST] = 0;
    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_USE] = 0;
    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_INDEX] = 0;
    PLAYER_MENU_PREVIEWS[playerid][player_menu_preview_PAGE] = 0;

    #if defined MP_OnPlayerDisconnect
        return MP_OnPlayerDisconnect(playerid, reason);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect MP_OnPlayerDisconnect
#if defined MP_OnPlayerDisconnect
    forward MP_OnPlayerDisconnect(playerid, reason);
#endif