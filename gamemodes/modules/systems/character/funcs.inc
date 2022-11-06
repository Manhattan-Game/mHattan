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
loadCharacterByID(playerid, cid){
        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "SELECT * FROM characters WHERE listid = '%i' LIMIT 1", cid);
        mysql_pquery(MYSQL_DB, query, "loadCharacter", "d", playerid);
        loadInventoryByID(playerid, cid);
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
                //SetPlayerInterior(playerid, characterData[playerid][interior]);
                SetPlayerColor(playerid, 0xAFAFAFAA);
                freezeUser(playerid, 3000);
                ShowInfoForPlayer(playerid, "Cargando...", 3000);
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
        
        
        
}
saveCharacter(playerid){
    if(characterData[playerid][p_spawn] == true){
        new Float:saveX, Float: saveY, Float: saveZ, Float:angleE, Float:health, Float:armour;
        GetPlayerPos(playerid, saveX, saveY, saveZ);
        GetPlayerFacingAngle(playerid, angleE);
        new interiorr = GetPlayerInterior(playerid);
        new virtualworldd = GetPlayerVirtualWorld(playerid);
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
            virtualworldd,
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
        saveInventory(playerid);
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