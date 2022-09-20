#include <YSI_Coding\y_hooks>

hook OnGameModeInit(){
    home_TD[0] = TextDrawCreate(-0.333360, -0.140706, "mdl-2001:box_login");
    TextDrawTextSize(home_TD[0], 645.000000, 448.000000);
    TextDrawAlignment(home_TD[0], 1);
    TextDrawColor(home_TD[0], -1);
    TextDrawSetShadow(home_TD[0], 0);
    TextDrawBackgroundColor(home_TD[0], 255);
    TextDrawFont(home_TD[0], 4);
    TextDrawSetProportional(home_TD[0], 0);

    home_TD[1] = TextDrawCreate(286.333435, 311.125946, "Continuar");
    TextDrawLetterSize(home_TD[1], 0.248999, 1.085630);
    TextDrawTextSize(home_TD[1], 342.000000, 10.000000);
    TextDrawAlignment(home_TD[1], 1);
    TextDrawColor(home_TD[1], 41215);
    TextDrawUseBox(home_TD[1], 1);
    TextDrawBoxColor(home_TD[1], 0);
    TextDrawSetShadow(home_TD[1], 0);
    TextDrawBackgroundColor(home_TD[1], 255);
    TextDrawFont(home_TD[1], 2);
    TextDrawSetProportional(home_TD[1], 1);
    TextDrawSetSelectable(home_TD[1], true);
}

hook OnPlayerConnect(playerid)
{
    inputPassword[playerid] = "NULL";
    inputEmail[playerid] = "NULL";
    home_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 222.666656, 248.288925, "Haz click aqui.");
    PlayerTextDrawLetterSize(playerid, home_PTD[playerid][0], 0.283666, 0.969481);
    PlayerTextDrawTextSize(playerid, home_PTD[playerid][0], 406.000000, 15.000000);
    PlayerTextDrawAlignment(playerid, home_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, home_PTD[playerid][0], 255);
    PlayerTextDrawUseBox(playerid, home_PTD[playerid][0], 1);
    PlayerTextDrawBoxColor(playerid, home_PTD[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, home_PTD[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, home_PTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, home_PTD[playerid][0], 2);
    PlayerTextDrawSetProportional(playerid, home_PTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, home_PTD[playerid][0], true);

    home_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 222.000061, 215.303695, "Nick");
    PlayerTextDrawLetterSize(playerid, home_PTD[playerid][1], 0.283666, 0.969481);
    PlayerTextDrawTextSize(playerid, home_PTD[playerid][1], 395.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, home_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, home_PTD[playerid][1], 255);
    PlayerTextDrawUseBox(playerid, home_PTD[playerid][1], 1);
    PlayerTextDrawBoxColor(playerid, home_PTD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, home_PTD[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, home_PTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, home_PTD[playerid][1], 2);

    home_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 222.000045, 282.088989, "Haz click aqui.");
    PlayerTextDrawLetterSize(playerid, home_PTD[playerid][2], 0.283666, 0.969481);
    PlayerTextDrawTextSize(playerid, home_PTD[playerid][2], 406.000000, 15.000000);
    PlayerTextDrawAlignment(playerid, home_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, home_PTD[playerid][2], 255);
    PlayerTextDrawUseBox(playerid, home_PTD[playerid][2], 1);
    PlayerTextDrawBoxColor(playerid, home_PTD[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, home_PTD[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, home_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, home_PTD[playerid][2], 2);
    PlayerTextDrawSetProportional(playerid, home_PTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, home_PTD[playerid][2], true);

    SetPlayerColor(playerid, 0xAFAFAFAA);
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){ 
    switch(dialogid){
        case DIALOG_PASSWORD:{
            if(response){
                if((strlen(inputtext) < 3) || (strlen(inputtext) > MAX_PASSWORD_LENGTH)){
                    ShowPlayerDialog(playerid, DIALOG_PASSWORD, DIALOG_STYLE_PASSWORD, ""CAPTION_DIALOG_TITLE" Account", "Ingresa una contraseña valida", "Continuar", ""RED" atras");
                }
                else{
                    PlayerTextDrawSetString(playerid, home_PTD[playerid][0], "Hidden");
                    format(inputPassword[playerid], MAX_PASSWORD_LENGTH, "%s", inputtext);
                }   

            }
        }
        case DIALOG_EMAIL:{
            if(response){
                if((strfind(inputtext, "@hotmail.com", true) != -1) || strfind(inputtext, "@gmail.com", true) != -1){ 
                    if(strlen(inputtext) < 8 || strlen(inputtext) > MAX_EMAIL_LENGTH){
                        ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Account", "Ingresa un email valido", "Continuar", ""RED" atras");
                    }
                    else{
                        format(inputEmail[playerid], MAX_EMAIL_LENGTH, "%s", inputtext);
                        PlayerTextDrawSetString(playerid, home_PTD[playerid][2], inputEmail[playerid]);
                    }
                }
                else ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Account", "Ingresa un email valido", "Continuar", ""RED" atras");
            }
        }
    }
}
hook OP_ClickTextDraw(playerid, Text:textid){
    if(home_TD[1] == textid){
        if(accounts[playerid][type] == 0){
            if((strcmp(inputPassword[playerid], "NULL")) && (strcmp(inputEmail[playerid], "NULL"))){
                bcrypt_hash(playerid, "OnPassswordHash", inputPassword[playerid], 12);
            }else ShowTDN_OOC(playerid, "Ingresa un email y una contraseña valida.");
        }else {
            if(strcmp(inputPassword[playerid], "NULL")){
                bcrypt_verify(playerid, "OnPasswordVerify", inputPassword[playerid], accounts[playerid][_password]);       
            }else ShowTDN_OOC(playerid, "Ingresa una contraseña valida.");
        }
    }
}

hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid){
    if(home_PTD[playerid][0] == playertextid){
        ShowPlayerDialog(playerid, DIALOG_PASSWORD, DIALOG_STYLE_PASSWORD, ""CAPTION_DIALOG_TITLE" Account", "Ingresa tu password:", "Continuar", ""RED" atras");
    }
    if(home_PTD[playerid][2] == playertextid){
        ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" Account", "Ingresa tu email:", "Continuar", ""RED" atras");
    }
}
hook OnPlayerRequestClass(playerid, classid)
{
    TogglePlayerSpectating(playerid, 1); 
    SelectTextDraw(playerid, 0x87868286);
    PlayerTextDrawSetString(playerid, home_PTD[playerid][1], GetFullName(playerid));
    new query[QUERY_LOW];
    mysql_format(MYSQL_DB, query, sizeof(query), "SELECT _password, _dbid, _whitelist FROM accounts WHERE _name = '%e' LIMIT 1", GetFullName(playerid));
    mysql_pquery(MYSQL_DB, query, "OnPlayerRequestHome", "d", playerid);

    return 1;
}

hook OnPlayerDisconnect(playerid, reason){
    saveAccount(playerid);
}
hook OnGameModeExit(){
    for(new i;i<MAX_PLAYERS; i++) saveAccount(i);
}