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
    format(accounts[playerid][_password], 128, "%s", password);
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

