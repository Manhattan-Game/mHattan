
#include <YSI_Coding\y_hooks>




hook OnGameModeInit(){
    character_TD[0] = TextDrawCreate(-2.357240, -1.333326, "box");
    TextDrawLetterSize(character_TD[0], 0.000000, 50.011703);
    TextDrawTextSize(character_TD[0], 679.000000, 0.000000);
    TextDrawAlignment(character_TD[0], 1);
    TextDrawColor(character_TD[0], -1);
    TextDrawUseBox(character_TD[0], 1);
    TextDrawBoxColor(character_TD[0], 336860415);
    TextDrawSetShadow(character_TD[0], 0);
    TextDrawBackgroundColor(character_TD[0], 255);
    TextDrawFont(character_TD[0], 1);
    TextDrawSetProportional(character_TD[0], 1);

    character_TD[1] = TextDrawCreate(184.114212, 321.833221, ">");
    TextDrawLetterSize(character_TD[1], 0.240702, 1.535833);
    TextDrawTextSize(character_TD[1], 15.000000, 47.000000);
    TextDrawAlignment(character_TD[1], 2);
    TextDrawColor(character_TD[1], -1);
    TextDrawUseBox(character_TD[1], 1);
    TextDrawBoxColor(character_TD[1], 54473727);
    TextDrawSetShadow(character_TD[1], 0);
    TextDrawBackgroundColor(character_TD[1], 255);
    TextDrawFont(character_TD[1], 1);
    TextDrawSetProportional(character_TD[1], 1);
    TextDrawSetSelectable(character_TD[1], 1);


    character_TD[2] = TextDrawCreate(299.370544, 321.249877, ">");
    TextDrawLetterSize(character_TD[2], 0.240702, 1.535833);
    TextDrawTextSize(character_TD[2], 15.000000, 47.000000);
    TextDrawAlignment(character_TD[2], 2);
    TextDrawColor(character_TD[2], -1);
    TextDrawUseBox(character_TD[2], 1);
    TextDrawBoxColor(character_TD[2], 54473727);
    TextDrawSetShadow(character_TD[2], 0);
    TextDrawBackgroundColor(character_TD[2], 255);
    TextDrawFont(character_TD[2], 1);
    TextDrawSetProportional(character_TD[2], 1);
    TextDrawSetSelectable(character_TD[2], 1);

    character_TD[3] = TextDrawCreate(414.158355, 321.249969, ">");
    TextDrawLetterSize(character_TD[3], 0.240702, 1.535833);
    TextDrawTextSize(character_TD[3], 15.000000, 47.000000);
    TextDrawAlignment(character_TD[3], 2);
    TextDrawColor(character_TD[3], -1);
    TextDrawUseBox(character_TD[3], 1);
    TextDrawBoxColor(character_TD[3], 54473727);
    TextDrawSetShadow(character_TD[3], 0);
    TextDrawBackgroundColor(character_TD[3], 255);
    TextDrawFont(character_TD[3], 1);
    TextDrawSetProportional(character_TD[3], 1);
    TextDrawSetSelectable(character_TD[3], 1);



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

    character_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 159.114196, 127.583320, "");
    PlayerTextDrawTextSize(playerid, character_PTD[playerid][0], 107.000000, 188.000000);
    PlayerTextDrawAlignment(playerid, character_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, character_PTD[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, character_PTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][0], 505290495);
    PlayerTextDrawFont(playerid, character_PTD[playerid][0], 5);
    PlayerTextDrawSetProportional(playerid, character_PTD[playerid][0], 0);
    PlayerTextDrawSetPreviewModel(playerid, character_PTD[playerid][0], TEXTDRAWS_MODEL_NONE);
    PlayerTextDrawSetPreviewRot(playerid, character_PTD[playerid][0], 0.000000, 0.000000, 30.000000, 1.500000);


    character_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 273.901947, 127.583320, "");
    PlayerTextDrawTextSize(playerid, character_PTD[playerid][1], 107.000000, 188.000000);
    PlayerTextDrawAlignment(playerid, character_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, character_PTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, character_PTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][1], 505290495);
    PlayerTextDrawFont(playerid, character_PTD[playerid][1], 5);
    PlayerTextDrawSetProportional(playerid, character_PTD[playerid][1], 0);
    PlayerTextDrawSetPreviewModel(playerid, character_PTD[playerid][1], TEXTDRAWS_MODEL_NONE);
    PlayerTextDrawSetPreviewRot(playerid, character_PTD[playerid][1], 0.000000, 0.000000, 30.000000, 1.500000);


    character_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 389.158386, 126.999992, "");
    PlayerTextDrawTextSize(playerid, character_PTD[playerid][2], 107.000000, 188.000000);
    PlayerTextDrawAlignment(playerid, character_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, character_PTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, character_PTD[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][2], 505290495);
    PlayerTextDrawFont(playerid, character_PTD[playerid][2], 5);
    PlayerTextDrawSetProportional(playerid, character_PTD[playerid][2], 0);
    PlayerTextDrawSetPreviewModel(playerid, character_PTD[playerid][2], TEXTDRAWS_MODEL_NONE);
    PlayerTextDrawSetPreviewRot(playerid, character_PTD[playerid][2], 0.000000, 0.000000, 30.000000, 1.500000);

    character_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 159.282592, 108.916656, "");
    PlayerTextDrawLetterSize(playerid, character_PTD[playerid][3], 0.330190, 1.191666);
    PlayerTextDrawAlignment(playerid, character_PTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, character_PTD[playerid][3], 54473727);
    PlayerTextDrawSetShadow(playerid, character_PTD[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, character_PTD[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, character_PTD[playerid][3], 1);

    character_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 276.413055, 108.333328, "");
    PlayerTextDrawLetterSize(playerid, character_PTD[playerid][4], 0.330190, 1.191666);
    PlayerTextDrawAlignment(playerid, character_PTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, character_PTD[playerid][4], 54473727);
    PlayerTextDrawSetShadow(playerid, character_PTD[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, character_PTD[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, character_PTD[playerid][4], 1);

    character_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 390.263854, 107.750000, "");
    PlayerTextDrawLetterSize(playerid, character_PTD[playerid][5], 0.330190, 1.191666);
    PlayerTextDrawAlignment(playerid, character_PTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, character_PTD[playerid][5], 54473727);
    PlayerTextDrawSetShadow(playerid, character_PTD[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, character_PTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, character_PTD[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, character_PTD[playerid][5], 1);



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
    if(clickedid == character_TD[1]){
        if(characterData[playerid][charactersMenu][0] == -1){
            showCreateCharacter(playerid);
        } else loadCharacterByID(playerid, characterData[playerid][charactersMenu][0]);
    }
    else if(clickedid == character_TD[1]){
        if(characterData[playerid][charactersMenu][0] == -1){
            showCreateCharacter(playerid);
        } else loadCharacterByID(playerid, characterData[playerid][charactersMenu][1]);
    }
    else if(clickedid == character_TD[3]){
        if(characterData[playerid][charactersMenu][2] == -1){
            showCreateCharacter(playerid);
        } else loadCharacterByID(playerid, characterData[playerid][charactersMenu][2]);
    }
    else if(clickedid == createCharacter_TD[1]){
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
    if(playertextid == createCharacter_PTD[playerid][1]){
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
                } else ShowPlayerDialog(playerid, DIALOG_CHARACTER_NAME, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Formato(Nombre_Apellido):", "Continuar", ""RED" atras");                
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
                    } else ShowPlayerDialog(playerid, DIALOG_CHARACTER_AGE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Minimo 18 y maximo 60:", "Continuar", ""RED" atras");
                } else ShowPlayerDialog(playerid, DIALOG_CHARACTER_AGE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Character", "Solo numeros:", "Continuar", ""RED" atras");  
            } else SelectTextDraw(playerid, 0x87868286);
        }
    }
}
