#include <YSI_Coding\y_hooks>

#define TIME_TIMER_NEEDS 120000

enum _pi@nfo
{
        listid,
        mkid,
        name[40],
        Float:posX,
        Float:posY,
        Float:posZ,
        Float:angle,
        viplevel,
        level,
        exp,
        money,
        Float:life,
        Float:armor,

        Float:drugs,
        Float:hungry,
        Float:thirst,
        Float:urine,
        Float:fatigue,
        Float:stress,

        world,
        interior,
        skin,
        age,
        origin,
        sex,
        bankbalance,
        bankcredit,
        job,
        biz,
        bizRank,

        p_duda,
        p_dudaT,
        bool:p_spawn,

        charactersMenu[3],
        viewTextdraw,

        timerNeeds
};
new characterData[MAX_PLAYERS][_pi@nfo];

new Text:character_TD[1];
new PlayerText:character_PTD[MAX_PLAYERS][9];

new Text:createCharacter_TD[2];
new PlayerText:createCharacter_PTD[MAX_PLAYERS][4];

new inputName[MAX_PLAYERS][MAX_PLAYER_NAME];
new inputAge[MAX_PLAYERS];
new inputGender[MAX_PLAYERS] = GENDER_FEMALE;

new VIEW_HUD[MAX_PLAYERS];


hook OnGameModeInit(){
        character_TD[0] = TextDrawCreate(-2.000014, -4.703687, "mdl-2001:box_pj");
        TextDrawTextSize(character_TD[0], 646.000000, 454.000000);
        TextDrawAlignment(character_TD[0], 1);
        TextDrawColor(character_TD[0], -1);
        TextDrawSetShadow(character_TD[0], 0);
        TextDrawBackgroundColor(character_TD[0], 255);
        TextDrawFont(character_TD[0], 4);
        TextDrawSetProportional(character_TD[0], 0);


        createCharacter_TD[0] = TextDrawCreate(-6.000021, -2.629625, "mdl-2001:box_player");
        TextDrawTextSize(createCharacter_TD[0], 649.000000, 458.000000);
        TextDrawAlignment(createCharacter_TD[0], 1);
        TextDrawColor(createCharacter_TD[0], -1);
        TextDrawSetShadow(createCharacter_TD[0], 0);
        TextDrawBackgroundColor(createCharacter_TD[0], 255);
        TextDrawFont(createCharacter_TD[0], 4);
        TextDrawSetProportional(createCharacter_TD[0], 0);

        createCharacter_TD[1] = TextDrawCreate(436.666442, 239.822082, "_>_");
        TextDrawLetterSize(createCharacter_TD[1], 0.121333, 2.155851);
        TextDrawTextSize(createCharacter_TD[1], 452.000000, 10.000000);
        TextDrawAlignment(createCharacter_TD[1], 1);
        TextDrawColor(createCharacter_TD[1], 41215);
        TextDrawUseBox(createCharacter_TD[1], 1);
        TextDrawBoxColor(createCharacter_TD[1], 0);
        TextDrawSetShadow(createCharacter_TD[1], 0);
        TextDrawBackgroundColor(createCharacter_TD[1], 255);
        TextDrawFont(createCharacter_TD[1], 1);
        TextDrawSetProportional(createCharacter_TD[1], 1);
        TextDrawSetSelectable(createCharacter_TD[1], true);
}
hook OnPlayerConnect(playerid){
        character_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 208.000015, 187.355499, "");
        PlayerTextDrawTextSize(playerid, character_PTD[playerid][0], 58.000000, 96.000000);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][0], 1);
        PlayerTextDrawColor(playerid, character_PTD[playerid][0], -1);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][0], 0);
        PlayerTextDrawFont(playerid, character_PTD[playerid][0], 5);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][0], 0);
        PlayerTextDrawSetSelectable(playerid, character_PTD[playerid][0], true);
        PlayerTextDrawSetPreviewModel(playerid, character_PTD[playerid][0], 19382);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][0], 0xFF000000);
        PlayerTextDrawSetPreviewRot(playerid, character_PTD[playerid][0], 0.000000, 0.000000, 10.000000, 1.000000);

        character_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 291.333374, 187.955499, "");
        PlayerTextDrawTextSize(playerid, character_PTD[playerid][1], 58.000000, 96.000000);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][1], 1);
        PlayerTextDrawColor(playerid, character_PTD[playerid][1], -1);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][1], 0);
        PlayerTextDrawFont(playerid, character_PTD[playerid][1], 5);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][1], 0);
        PlayerTextDrawSetSelectable(playerid, character_PTD[playerid][1], true);
        PlayerTextDrawSetPreviewModel(playerid, character_PTD[playerid][1], 19382);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][1], 0xFF000000);
        PlayerTextDrawSetPreviewRot(playerid, character_PTD[playerid][1], 0.000000, 0.000000, 10.000000, 1.000000);

        character_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 375.333312, 187.955499, "");
        PlayerTextDrawTextSize(playerid, character_PTD[playerid][2], 58.000000, 96.000000);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][2], 1);
        PlayerTextDrawColor(playerid, character_PTD[playerid][2], -1);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][2], 0);
        PlayerTextDrawFont(playerid, character_PTD[playerid][2], 5);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][2], 0);
        PlayerTextDrawSetSelectable(playerid, character_PTD[playerid][2], true);
        PlayerTextDrawSetPreviewModel(playerid, character_PTD[playerid][2], 19382);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][2], 0xFF000000);
        PlayerTextDrawSetPreviewRot(playerid, character_PTD[playerid][2], 0.000000, 0.000000, 10.000000, 1.000000);

        character_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 238.000015, 293.288726, "Registrar");
        PlayerTextDrawLetterSize(playerid, character_PTD[playerid][3], 0.167666, 1.168592);
        PlayerTextDrawTextSize(playerid, character_PTD[playerid][3], 10.000000, 57.000000);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][3], 2);
        PlayerTextDrawColor(playerid, character_PTD[playerid][3], 41215);
        PlayerTextDrawUseBox(playerid, character_PTD[playerid][3], 1);
        PlayerTextDrawBoxColor(playerid, character_PTD[playerid][3], 0);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][3], 0);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][3], -1061109505);
        PlayerTextDrawFont(playerid, character_PTD[playerid][3], 2);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][3], 1);
        PlayerTextDrawSetSelectable(playerid, character_PTD[playerid][3], true);

        character_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 321.666595, 293.288726, "Registrar");
        PlayerTextDrawLetterSize(playerid, character_PTD[playerid][4], 0.167666, 1.168592);
        PlayerTextDrawTextSize(playerid, character_PTD[playerid][4], 10.000000, 57.000000);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][4], 2);
        PlayerTextDrawColor(playerid, character_PTD[playerid][4], 41215);
        PlayerTextDrawUseBox(playerid, character_PTD[playerid][4], 1);
        PlayerTextDrawBoxColor(playerid, character_PTD[playerid][4], 0);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][4], 0);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][4], -1061109505);
        PlayerTextDrawFont(playerid, character_PTD[playerid][4], 2);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][4], 1);
        PlayerTextDrawSetSelectable(playerid, character_PTD[playerid][4], true);

        character_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 405.999908, 293.288726, "Registrar");
        PlayerTextDrawLetterSize(playerid, character_PTD[playerid][5], 0.167666, 1.168592);
        PlayerTextDrawTextSize(playerid, character_PTD[playerid][5], 10.000000, 57.000000);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][5], 2);
        PlayerTextDrawColor(playerid, character_PTD[playerid][5], 41215);
        PlayerTextDrawUseBox(playerid, character_PTD[playerid][5], 1);
        PlayerTextDrawBoxColor(playerid, character_PTD[playerid][5], 0);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][5], 0);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][5], -1061109505);
        PlayerTextDrawFont(playerid, character_PTD[playerid][5], 2);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][5], 1);
        PlayerTextDrawSetSelectable(playerid, character_PTD[playerid][5], true);

        character_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 208.666717, 174.237014, "Disponible");
        PlayerTextDrawLetterSize(playerid, character_PTD[playerid][6], 0.199666, 1.089778);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][6], 1);
        PlayerTextDrawColor(playerid, character_PTD[playerid][6], -1);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][6], 0);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][6], 255);
        PlayerTextDrawFont(playerid, character_PTD[playerid][6], 1);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][6], 1);

        character_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 292.000030, 174.237014, "Disponible");
        PlayerTextDrawLetterSize(playerid, character_PTD[playerid][7], 0.199666, 1.089778);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][7], 1);
        PlayerTextDrawColor(playerid, character_PTD[playerid][7], -1);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][7], 0);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][7], 255);
        PlayerTextDrawFont(playerid, character_PTD[playerid][7], 1);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][7], 1);

        character_PTD[playerid][8] = CreatePlayerTextDraw(playerid, 374.000000, 174.237014, "Disponible");
        PlayerTextDrawLetterSize(playerid, character_PTD[playerid][8], 0.199666, 1.089778);
        PlayerTextDrawAlignment(playerid, character_PTD[playerid][8], 1);
        PlayerTextDrawColor(playerid, character_PTD[playerid][8], -1);
        PlayerTextDrawSetShadow(playerid, character_PTD[playerid][8], 0);
        PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][8], 255);
        PlayerTextDrawFont(playerid, character_PTD[playerid][8], 1);
        PlayerTextDrawSetProportional(playerid, character_PTD[playerid][8], 1);



        createCharacter_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 207.333343, 182.377777, "");
        PlayerTextDrawTextSize(playerid, createCharacter_PTD[playerid][0], 60.000000, 97.000000);
        PlayerTextDrawAlignment(playerid, createCharacter_PTD[playerid][0], 1);
        PlayerTextDrawColor(playerid, createCharacter_PTD[playerid][0], -1);
        PlayerTextDrawSetShadow(playerid, createCharacter_PTD[playerid][0], 0);
        PlayerTextDrawFont(playerid, createCharacter_PTD[playerid][0], 5);
        PlayerTextDrawSetProportional(playerid, createCharacter_PTD[playerid][0], 0);
        PlayerTextDrawSetPreviewModel(playerid, createCharacter_PTD[playerid][0], 150);
        PlayerTextDrawBackgroundColor(playerid, createCharacter_PTD[playerid][0], 0xFF000000);
        PlayerTextDrawSetPreviewRot(playerid, createCharacter_PTD[playerid][0], 0.000000, 0.000000, 40.000000, 1.000000);

        createCharacter_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 281.999908, 203.274032, ".");
        PlayerTextDrawTextSize(playerid, createCharacter_PTD[playerid][1], 400.000000, 16.000000);
        PlayerTextDrawLetterSize(playerid, createCharacter_PTD[playerid][1], 0.214333, 1.193481);
        PlayerTextDrawAlignment(playerid, createCharacter_PTD[playerid][1], 1);
        PlayerTextDrawColor(playerid, createCharacter_PTD[playerid][1], 255);
        PlayerTextDrawSetShadow(playerid, createCharacter_PTD[playerid][1], 0);
        PlayerTextDrawBackgroundColor(playerid, createCharacter_PTD[playerid][1], 255);
        PlayerTextDrawFont(playerid, createCharacter_PTD[playerid][1], 2);
        PlayerTextDrawSetProportional(playerid, createCharacter_PTD[playerid][1], 1);
        PlayerTextDrawSetSelectable(playerid, createCharacter_PTD[playerid][1], true);

        createCharacter_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 282.333221, 236.459182, ".");
        PlayerTextDrawTextSize(playerid, createCharacter_PTD[playerid][2], 400.000000, 16.000000);
        PlayerTextDrawLetterSize(playerid, createCharacter_PTD[playerid][2], 0.214333, 1.193481);
        PlayerTextDrawAlignment(playerid, createCharacter_PTD[playerid][2], 1);
        PlayerTextDrawColor(playerid, createCharacter_PTD[playerid][2], 255);
        PlayerTextDrawSetShadow(playerid, createCharacter_PTD[playerid][2], 0);
        PlayerTextDrawBackgroundColor(playerid, createCharacter_PTD[playerid][2], 255);
        PlayerTextDrawFont(playerid, createCharacter_PTD[playerid][2], 2);
        PlayerTextDrawSetProportional(playerid, createCharacter_PTD[playerid][2], 1);
        PlayerTextDrawSetSelectable(playerid, createCharacter_PTD[playerid][2], true);

        createCharacter_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 280.999877, 271.718597, "Mujer");
        PlayerTextDrawTextSize(playerid, createCharacter_PTD[playerid][3], 400.000000, 16.000000);
        PlayerTextDrawLetterSize(playerid, createCharacter_PTD[playerid][3], 0.214333, 1.193481);
        PlayerTextDrawAlignment(playerid, createCharacter_PTD[playerid][3], 1);
        PlayerTextDrawColor(playerid, createCharacter_PTD[playerid][3], 255);
        PlayerTextDrawSetShadow(playerid, createCharacter_PTD[playerid][3], 0);
        PlayerTextDrawBackgroundColor(playerid, createCharacter_PTD[playerid][3], 255);
        PlayerTextDrawFont(playerid, createCharacter_PTD[playerid][3], 2);
        PlayerTextDrawSetProportional(playerid, createCharacter_PTD[playerid][3], 1);
        PlayerTextDrawSetSelectable(playerid, createCharacter_PTD[playerid][3], true);
        characterData[playerid][timerNeeds] = SetPlayerTimerEx(playerid, "timerNeds", TIME_TIMER_NEEDS, 1, "d", playerid);
}
hook OP_ClickTextDraw(playerid, Text:clickedid){
        if(clickedid == createCharacter_TD[1]){
                if((strcmp(inputName[playerid], "NULL")) && (inputAge[playerid] > 18)){
                        for(new e;e<3;e++){
                                if(characterData[playerid][charactersMenu][e] == -1){
                                        createCharacter(playerid);
                                        break;
                                }
                        }
                }else ShowTDN_OOC(playerid, "Ingresa un nombre y una edad valida.");
        }

}
hook OnPlayerDisconnect(playerid, reason){
    if(characterData[playerid][p_spawn]){
        KillPlayerTimer(characterData[playerid][timerNeeds]);
    } 
    saveCharacter(playerid);
    characterData[playerid][p_spawn] = false;
}
hook OnGameModeExit(){
    for(new i;i<MAX_PLAYERS; i++) saveCharacter(i);
}
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid){
        if(playertextid == character_PTD[playerid][3]){
                if(characterData[playerid][charactersMenu][0] == -1){
                        showCreateCharacter(playerid);
                } else loadCharacterByID(playerid, characterData[playerid][charactersMenu][0]);
        } else if(playertextid == character_PTD[playerid][4]){
                if(characterData[playerid][charactersMenu][1] == -1){
                        showCreateCharacter(playerid);
                } else loadCharacterByID(playerid, characterData[playerid][charactersMenu][1]);
        } else if(playertextid == character_PTD[playerid][5]){
                if(characterData[playerid][charactersMenu][2] == -1){
                        showCreateCharacter(playerid);
                } else loadCharacterByID(playerid, characterData[playerid][charactersMenu][2]);
        }

        else if(playertextid == createCharacter_PTD[playerid][1]){
                CancelSelectTextDraw(playerid);
                ShowPlayerDialog(playerid, DIALOG_CHARACTER_NAME, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Formato(Nombre_Apellido):", "Continuar", ""RED" atras");
        }else if(playertextid == createCharacter_PTD[playerid][2]){
                CancelSelectTextDraw(playerid);
                ShowPlayerDialog(playerid, DIALOG_CHARACTER_AGE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Solo numeros(18-60)", "Continuar", ""RED" atras");
        } else if(playertextid == createCharacter_PTD[playerid][3]){
                changeSex(playerid);
        }
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
        switch(dialogid){
                case DIALOG_CHARACTER_NAME: {
                        if(response){
                                if(strfind(inputtext, "_", true) != -1){
                                    if(!IsNumeric(inputtext)){
                                        new query[QUERY_MEDIUM];
                                        format(inputName[playerid], MAX_PLAYER_NAME, "%s", inputtext);
                                        mysql_format(MYSQL_DB, query, sizeof(query), "SELECT listid FROM characters WHERE name = '%e' LIMIT 1", inputtext);
                                        mysql_pquery(MYSQL_DB, query, "verifyNameDatabase", "d", playerid);
                                    }
                                }
                                else ShowPlayerDialog(playerid, DIALOG_CHARACTER_NAME, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Formato(Nombre_Apellido):", "Continuar", ""RED" atras");
                                
                        } else SelectTextDraw(playerid, 0x87868286);
                }
                case DIALOG_CHARACTER_AGE: {
                        if(response){
                                if(IsNumeric(inputtext)){
                                        new value = strval(inputtext);
                                        if((value > 18) && (value < 61)){
                                                inputAge[playerid] = value;
                                                PlayerTextDrawSetString(playerid, createCharacter_PTD[playerid][2], inputtext);
                                                SelectTextDraw(playerid, 0x87868286);
                                        }
                                         else ShowPlayerDialog(playerid, DIALOG_CHARACTER_AGE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Minimo 18 y maximo 60:", "Continuar", ""RED" atras");
                                }
                                else ShowPlayerDialog(playerid, DIALOG_CHARACTER_AGE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Solo numeros:", "Continuar", ""RED" atras");  
                        } else SelectTextDraw(playerid, 0x87868286);
                }
        }
}
showSelectCharacter(playerid, makeId){
        TextDrawShowForPlayer(playerid, character_TD[0]);
        for(new e;e<3;e++) characterData[playerid][charactersMenu][e] = -1;

        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "SELECT * FROM characters WHERE mkid = '%i' LIMIT 3", makeId);
        mysql_pquery(MYSQL_DB, query, "loadCharacters", "d", playerid);
}
showCreateCharacter(playerid){
        inputName[playerid] = "NULL";
        inputAge[playerid] = -1;
        inputGender[playerid] = GENDER_FEMALE;
        PlayerTextDrawSetPreviewModel(playerid, createCharacter_PTD[playerid][0], 150);
        PlayerTextDrawSetString(playerid, createCharacter_PTD[playerid][1], ".");
        PlayerTextDrawSetString(playerid, createCharacter_PTD[playerid][2], ".");
        PlayerTextDrawSetString(playerid, createCharacter_PTD[playerid][3], "Mujer");
        TextDrawHideForPlayer(playerid, character_TD[0]);
        for(new i;i<9;i++) PlayerTextDrawHide(playerid, character_PTD[playerid][i]);

        
        for(new j;j<2;j++) TextDrawShowForPlayer(playerid, createCharacter_TD[j]);
        for(new e;e<4;e++) PlayerTextDrawShow(playerid, createCharacter_PTD[playerid][e]);
}
changeSex(playerid){
        new skinCreateCharacter;
        if(inputGender[playerid] == GENDER_MALE){
                inputGender[playerid] = GENDER_FEMALE;
                skinCreateCharacter = 150;
                PlayerTextDrawSetString(playerid, createCharacter_PTD[playerid][3], "Mujer");
        } else if(inputGender[playerid] == GENDER_FEMALE){
                inputGender[playerid] = GENDER_MALE;
                skinCreateCharacter = 72;
                PlayerTextDrawSetString(playerid, createCharacter_PTD[playerid][3], "Hombre");
        }

        PlayerTextDrawSetPreviewModel(playerid, createCharacter_PTD[playerid][0], skinCreateCharacter);
        PlayerTextDrawShow(playerid, createCharacter_PTD[playerid][0]);
}

createCharacter(playerid){
        new skinToPlayer = 72;
        if(inputGender[playerid] == GENDER_FEMALE) skinToPlayer = 150;
        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO characters(mkid, name, posX, posY, posZ, angle, viplevel, money, life, world, interior, skin, age, sex, drugs, hungry, thirst, urine, fatigue, stress) VALUES('%d', '%s', '%f', '%f', '%f', 0.0, 0, 1500, 100.0, 0, 0, '%d', '%d', '%d', 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)",
                accounts[playerid][_dbid],
                inputName[playerid],
                POS_X_SPAWN, POS_Y_SPAWN, POS_Z_SPAWN,
                skinToPlayer,
                inputAge[playerid],
                inputGender[playerid]
        ); 
        mysql_pquery(MYSQL_DB, query, "onCreateCharacter", "d", playerid);
}
forward onCreateCharacter(playerid);
public onCreateCharacter(playerid){
        for(new j;j<2;j++) TextDrawHideForPlayer(playerid, createCharacter_TD[j]);
        for(new i;i<4;i++) PlayerTextDrawHide(playerid, createCharacter_PTD[playerid][i]);

        TextDrawShowForPlayer(playerid, character_TD[0]);
        for(new e;e<9;e++) PlayerTextDrawShow(playerid, character_PTD[playerid][e]);

        showSelectCharacter(playerid, accounts[playerid][_dbid]);
        createInventory(cache_insert_id());
}

forward verifyNameDatabase(playerid);
public verifyNameDatabase(playerid){
    if(cache_num_rows()){
            ShowPlayerDialog(playerid, DIALOG_CHARACTER_NAME, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Nombre ocupado", "Continuar", ""RED" atras");
    }else 
    {
        PlayerTextDrawSetString(playerid, createCharacter_PTD[playerid][1], inputName[playerid]);
        SelectTextDraw(playerid, 0x87868286);
    }
}

forward loadCharacters(playerid);
public loadCharacters(playerid){
        new skinUsed; 
        new nameUsed[MAX_PLAYER_NAME];
        if(cache_num_rows() > 0){
                for(new i;i<cache_num_rows();i++){
                       if(i < 3){
                            cache_get_value_name_int(i, "listid", characterData[playerid][charactersMenu][i]);
                            cache_get_value_name_int(i, "skin", skinUsed);
                            cache_get_value_name(i, "name", nameUsed);

                            PlayerTextDrawSetString(playerid, character_PTD[playerid][3+i], "Seleccionar");
                            PlayerTextDrawSetString(playerid, character_PTD[playerid][6+i], nameUsed);

                            PlayerTextDrawSetPreviewModel(playerid, character_PTD[playerid][i], skinUsed);
                       }
                }
        }
        for(new i;i<9;i++) PlayerTextDrawShow(playerid, character_PTD[playerid][i]);
}
loadCharacterByID(playerid, characterID){
        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "SELECT * FROM characters WHERE listid = '%i' LIMIT 1", characterID);
        mysql_pquery(MYSQL_DB, query, "loadCharacter", "d", playerid);
        loadInventoryByID(playerid, characterID);
}
forward loadCharacter(playerid);
public loadCharacter(playerid){
        if(cache_num_rows()){
                cache_get_value_name_int(0, "listid", characterData[playerid][listid]);
                cache_get_value_name_int(0, "mkid", characterData[playerid][mkid]);
                cache_get_value_name(0, "name", characterData[playerid][name]);
                cache_get_value_name_float(0, "posX", characterData[playerid][posX]);
                cache_get_value_name_float(0, "posY", characterData[playerid][posY]);
                cache_get_value_name_float(0, "posZ", characterData[playerid][posZ]);
                cache_get_value_name_float(0, "angle", characterData[playerid][angle]);
                cache_get_value_name_int(0, "viplevel", characterData[playerid][viplevel]);
                cache_get_value_name_int(0, "level", characterData[playerid][level]);
                cache_get_value_name_int(0, "exp", characterData[playerid][exp]);
                cache_get_value_name_int(0, "money", characterData[playerid][money]);
                cache_get_value_name_float(0, "life", characterData[playerid][life]);
                cache_get_value_name_float(0, "armor", characterData[playerid][armor]);

                cache_get_value_name_float(0, "drugs", characterData[playerid][drugs]);
                cache_get_value_name_float(0, "hungry", characterData[playerid][hungry]);
                cache_get_value_name_float(0, "thirst", characterData[playerid][thirst]);
                cache_get_value_name_float(0, "urine", characterData[playerid][urine]);
                cache_get_value_name_float(0, "fatigue", characterData[playerid][fatigue]);
                cache_get_value_name_float(0, "stress", characterData[playerid][stress]);

                cache_get_value_name_int(0, "world", characterData[playerid][world]);
                cache_get_value_name_int(0, "interior", characterData[playerid][interior]);
                cache_get_value_name_int(0, "skin", characterData[playerid][skin]);
                cache_get_value_name_int(0, "age", characterData[playerid][age]);
                cache_get_value_name_int(0, "origin", characterData[playerid][origin]);
                cache_get_value_name_int(0, "sex", characterData[playerid][sex]);
                cache_get_value_name_int(0, "bankbalance", characterData[playerid][bankbalance]);
                cache_get_value_name_int(0, "bankcredit", characterData[playerid][bankcredit]);
                cache_get_value_name_int(0, "job", characterData[playerid][job]);
                cache_get_value_name_int(0, "biz", characterData[playerid][biz]);
                cache_get_value_name_int(0, "bizRank", characterData[playerid][bizRank]);
                CancelSelectTextDraw(playerid);
                TogglePlayerSpectating(playerid, 0);

                SetSpawnInfo(playerid, 0, characterData[playerid][skin], characterData[playerid][posX], characterData[playerid][posY], 
                characterData[playerid][posZ], characterData[playerid][angle], 0, 0, 0, 0, 0, 0);
                SpawnPlayer(playerid);

                giveCharacterMoney(playerid, characterData[playerid][money]);
                SetPlayerName(playerid, characterData[playerid][name]);
                SetPlayerVirtualWorld(playerid, characterData[playerid][world]);
                SetPlayerInterior(playerid, characterData[playerid][interior]);
                SetPlayerColor(playerid, 0xAFAFAFAA);
                freezeUser(playerid, 3000);
                setLife(playerid, characterData[playerid][life]);
                setArmor(playerid, characterData[playerid][armor]);
                new string[128];
                format(string, 128, "Gracias por confiar %s!.", GetFullName(playerid));
                ShowTDN_OOC(playerid, string);


                characterData[playerid][viewTextdraw] = -1;
                TextDrawHideForPlayer(playerid, character_TD[0]);
                for(new i;i<9;i++) PlayerTextDrawHide(playerid, character_PTD[playerid][i]);
                characterData[playerid][p_spawn] = true;
                showHUD(playerid);
        }
        
        ShowInfoForPlayer(playerid, "~w~ Pulsa ~y~ ~h~ N ~w~ para abrir tu inventario", 3000);
        SendClientMessage(playerid, -1, ""GREY"[MiamiSide]"WHITE" Si tocaste la tecla ESC y un textdraw no se cerro usa "ORANGE"/select"WHITE" y cierralo de su respectivo icono");
}
saveCharacter(playerid){
    if(characterData[playerid][p_spawn] == true){
        new Float:saveX, Float: saveY, Float: saveZ, Float:angleE, Float:health, Float:armour;
        GetPlayerPos(playerid, saveX, saveY, saveZ);
        GetPlayerFacingAngle(playerid, angleE);
        new interiorr = GetPlayerInterior(playerid);
        new virtualworld = GetPlayerVirtualWorld(playerid);
        GetPlayerHealth(playerid, health);
        GetPlayerArmour(playerid, armour);

        new query[QUERY_LONG];
        mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE characters SET `posX`='%f', `posY`='%f', `posZ`='%f', `angle`='%f', `viplevel`='%d', `level`='%d', `exp`='%d', `money`='%d', `life`='%f', `armor`='%f', `drugs`='%f', `hungry`='%f', `thirst`='%f', `urine`='%f', `fatigue`='%f', `stress`='%f',  `world`='%d', `interior`='%d', `skin`='%d', `age`='%d', `origin`='%d', `sex`='%d', `bankbalance`='%d', `bankcredit`='%d', `job`='%d', `biz`='%d', `bizRank`='%d' WHERE listid = '%d' LIMIT 1",
            saveX, saveY, saveZ, angleE,
            characterData[playerid][viplevel],
            characterData[playerid][level],
            characterData[playerid][exp],
            characterData[playerid][money],
            health,
            armour,
            characterData[playerid][drugs],
            characterData[playerid][hungry],
            characterData[playerid][thirst],
            characterData[playerid][urine],
            characterData[playerid][fatigue],
            characterData[playerid][stress],
            virtualworld,
            interiorr,
            characterData[playerid][skin],
            characterData[playerid][age],
            characterData[playerid][origin],
            characterData[playerid][sex],
            characterData[playerid][bankbalance],
            characterData[playerid][bankcredit],
            characterData[playerid][job],
            characterData[playerid][biz],
            characterData[playerid][bizRank],
            characterData[playerid][listid]
            );
        mysql_pquery(MYSQL_DB, query);
    }
}

forward timerNeds(playerid);
public timerNeds(playerid){
    if(characterData[playerid][p_spawn]){
        setDrugs(playerid, characterData[playerid][drugs]-1.1);
        setHungry(playerid, characterData[playerid][hungry]-1.1); 
        setThirst(playerid, characterData[playerid][thirst]-1.1);
        setUrine(playerid, characterData[playerid][urine]-1.1);
        setFatigue(playerid, characterData[playerid][fatigue]-1.1);
        setStress(playerid, characterData[playerid][stress]-1.1);
        if(VIEW_HUD[playerid] == 0){
            updateBarDrugs(playerid);
            updateBarHungry(playerid);
            updateBarThirst(playerid);
            updateBarUrine(playerid);
            updateBarFatigue(playerid);
            updateBarStress(playerid);
        }
        if(characterData[playerid][drugs] < 10.0){
            ShowTDN_OOC(playerid, "Mira tus necesidades");
        } else if(characterData[playerid][hungry] < 10.0){
            ShowTDN_OOC(playerid, "Mira tus necesidades");
        } else if(characterData[playerid][thirst] < 10.0){
            ShowTDN_OOC(playerid, "Mira tus necesidades");
        } else if(characterData[playerid][urine] < 10.0){
            ShowTDN_OOC(playerid, "Mira tus necesidades");
        } else if(characterData[playerid][fatigue] < 10.0){
            ShowTDN_OOC(playerid, "Mira tus necesidades");
        } else if(characterData[playerid][stress] < 10.0){
            ShowTDN_OOC(playerid, "Mira tus necesidades");
        }
    }
}

getExperienceFromLevel(playerid){
    switch(characterData[playerid][level]){
        case 0 : return 5;
        case 1 : return 7;
        case 2 : return 11;
        case 3 : return 15;
    }
    return 5;
}

// USER ABREVIATTIONS

giveCharacterMoney(playerid, ammountt){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][money] += ammountt;
        ResetPlayerMoney(playerid);
        GivePlayerMoney(playerid, characterData[playerid][money]);
        updateMoney(playerid);
    }
}

takeCharacterMoney(playerid, ammountt){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][money] -= ammountt;
        ResetPlayerMoney(playerid);
        GivePlayerMoney(playerid, characterData[playerid][money]);
        updateMoney(playerid);
    }
}

setSkin(playerid, skinn){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][skin] = skinn;
        SetPlayerSkin(playerid, skinn);
    }
}
setLife(playerid, Float:lifee){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][life] = lifee;
        SetPlayerHealth(playerid, lifee);
    }
}
setArmor(playerid, Float:armorr){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][armor] = armorr;
        SetPlayerArmour(playerid, armorr);
    }
}

setDrugs(playerid, Float:drugss){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][drugs] = drugss;
    }
}
setHungry(playerid, Float:hungryy){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][hungry] = hungryy;
    }
}

setThirst(playerid, Float:thirstt){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][thirst] = thirstt;
    }
}

setUrine(playerid, Float:urinee){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][urine] = urinee;
    }
}

setFatigue(playerid, Float:fatiguee){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][fatigue] = fatiguee;
    }
}

setStress(playerid, Float:stresss){
    if(characterData[playerid][p_spawn]){
        characterData[playerid][stress] = stresss;
    }
}