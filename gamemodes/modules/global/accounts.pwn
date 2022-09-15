#include <YSI_Coding\y_hooks>
#define MAX_PASSWORD_LENGTH 13
#define MAX_EMAIL_LENGTH 60

enum _min@f@o
{
    _dbid,
    _name[24],
    _password[128],
    _coins,
    _date[80],
    _lastdate[80],
    _admin,
    
    _whitelist,
    _correo[MAX_EMAIL_LENGTH],

    bool:loggedin,
    type
};
new accounts[MAX_PLAYERS][_min@f@o];

new Text:home_TD[2];
new PlayerText:home_PTD[MAX_PLAYERS][3];

new inputPassword[MAX_PLAYERS][MAX_PASSWORD_LENGTH];
new inputEmail[MAX_PLAYERS][MAX_EMAIL_LENGTH];
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

forward OnPlayerRequestHome(playerid);
public OnPlayerRequestHome(playerid){
    if(cache_num_rows())
    {
        cache_get_value_name_int(0, "_dbid", accounts[playerid][_dbid]);
        cache_get_value_name(0, "_password", accounts[playerid][_password]);
        cache_get_value_name(0, "_whitelist", accounts[playerid][_whitelist]);
        loadLogin(playerid);
    } else loadRegister(playerid);

}

forward OnRegisterAccount(playerid);
public OnRegisterAccount(playerid)
{
    accounts[playerid][_dbid] = cache_insert_id();
    accounts[playerid][loggedin] = true;

    loadLogin(playerid);
}

loadRegister(playerid){
    for(new e; e<2; e++) TextDrawShowForPlayer(playerid, home_TD[e]);
    for(new i; i<3; i++) PlayerTextDrawShow(playerid, home_PTD[playerid][i]);
    accounts[playerid][type] = 0;
}
loadLogin(playerid){
    for(new e; e<2; e++) TextDrawShowForPlayer(playerid, home_TD[e]);
    for(new i; i<3; i++) PlayerTextDrawShow(playerid, home_PTD[playerid][i]);
    

    PlayerTextDrawSetSelectable(playerid, home_PTD[playerid][2], false);

    PlayerTextDrawSetString(playerid, home_PTD[playerid][2], "------@hotmail.com");
    PlayerTextDrawSetString(playerid, home_PTD[playerid][0], "Haz click aqui.");
    PlayerTextDrawHide(playerid, home_PTD[playerid][2]);

    accounts[playerid][type] = 1;
    inputPassword[playerid] = "NULL";
    inputEmail[playerid] = "NULL";
}

forward OnPassswordHash(playerid);
public OnPassswordHash(playerid){
    new password[64];
    bcrypt_get_hash(password);  
    new query[QUERY_MEDIUM];
    mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO accounts(_name, _password, _admin, _whitelist, _date, _correo) VALUES ('%e', '%e', 0, 0, '%e', '%e')",
        GetFullName(playerid),  
        password,
        GetCompleteDate(),
        accounts[playerid][_correo]
    );
    mysql_pquery(MYSQL_DB, query, "OnRegisterAccount", "d", playerid);
}

forward OnPasswordVerify(playerid, bool:success);
public OnPasswordVerify(playerid, bool:success){
    if(success){
        new query[QUERY_LOW];
        mysql_format(MYSQL_DB, query, sizeof(query), "SELECT * FROM accounts WHERE _name = '%e' LIMIT 1", GetFullName(playerid));
        mysql_pquery(MYSQL_DB, query, "loadDataAccount", "d", playerid);
        ShowTDN_OOC(playerid, "Cuenta logueada, estamos cargando tus datos");
    } else{
        ShowTDN_OOC(playerid, "Password incorrecta.");
    }
} 

forward loadDataAccount(playerid);
public loadDataAccount(playerid)
{
    if(cache_num_rows())
    {
        cache_get_value_name(0, "_name", accounts[playerid][_name]);
        cache_get_value_name_int(0, "_dbid", accounts[playerid][_dbid]);
        cache_get_value_name_int(0, "_coins", accounts[playerid][_coins]);
        cache_get_value_name(0, "_date", accounts[playerid][_date]);
        cache_get_value_name(0, "_lastdate", accounts[playerid][_lastdate]);
        cache_get_value_name_int(0, "_admin", accounts[playerid][_admin]);
        cache_get_value_name_int(0, "_whitelist", accounts[playerid][_whitelist]);
        cache_get_value_name(0, "_correo", accounts[playerid][_correo]);
        if(accounts[playerid][_whitelist] == 1)
        {
            Kick(playerid);
        }
        accounts[playerid][loggedin] = true;
        for(new e; e<2; e++) TextDrawHideForPlayer(playerid, home_TD[e]);
        for(new i; i<3; i++) PlayerTextDrawHide(playerid, home_PTD[playerid][i]);
        showSelectCharacter(playerid,  accounts[playerid][_dbid]);
    } else loadRegister(playerid);
        
}

saveAccount(playerid){
    if(accounts[playerid][loggedin]){
        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE accounts SET `_lastdate`='%e', `_coins`='%d', `_admin`='%d', `_whitelist`='%d' WHERE _dbid = '%d' LIMIT 1",
            GetCompleteDate(),
            accounts[playerid][_coins],
            accounts[playerid][_admin],
            accounts[playerid][_whitelist],
            accounts[playerid][_dbid]

        );
        mysql_pquery(MYSQL_DB, query);
    }
}

