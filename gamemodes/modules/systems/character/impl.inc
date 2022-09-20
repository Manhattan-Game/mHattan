#include <YSI_Coding\y_hooks>




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
