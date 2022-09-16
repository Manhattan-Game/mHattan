#include <YSI_Coding\y_hooks>


#define DOOR_TYPE_NONE 0
#define DOOR_TYPE_PHYSICAL 1
#define DOOR_TYPE_INTERIOR 2
#define DOOR_TYPE_VEHICLE 3

#define DOOR_STATE_CLOSE 0
#define DOOR_STATE_OPEN 1

new editDoor[MAX_PLAYERS] = -1;

enum doors_inf@o
{
    listid,
    characterID,

    Float:enterCoords[3],
    Float:exitCoords[3],
    enterState,

    pickupEnter,
    Text3D:labelEnter,
    Text3D:labelExit,

    doorModel,
    Float:doorCoords[6],
    Float:moveDoorCoords[6],
    doorVw,
    doorState,
    doorType,

    exitVw,
    doorObject,


    doorStep
};
new doorsInfo[MAX_DOORS+1][doors_inf@o];


hook OnPlayerDisconnect(playerid, reason){
    saveDoors();
}
hook OnPlayerSpawn(playerid){
    editDoor[playerid] = -1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(characterData[playerid][p_spawn]){
        if(newkeys == KEY_CTRL_BACK)
        {
            for(new did;did<MAX_DOORS-1;did++)
            {
                if(IsPlayerInEnterDoor(playerid, did)){
                    if(doorsInfo[did][enterState] == DOOR_STATE_OPEN){
                        if(doorsInfo[did][doorType] != DOOR_TYPE_PHYSICAL){
                            SetPlayerPos(playerid, doorsInfo[did][exitCoords][0], doorsInfo[did][exitCoords][1], doorsInfo[did][exitCoords][2]);
                            SetPlayerVirtualWorld(playerid, doorsInfo[did][exitVw]);
                        }else changeStateDoor(playerid, did);

                        break;
                    } else{
                        ShowTDN_OOC(playerid, "La puerta se encuentra cerrada");
                        break;
                    }
                }else if(IsPlayerInExitDoor(playerid, 2.5, did)){
                    if(doorsInfo[did][enterState] == DOOR_STATE_OPEN){
                        SetPlayerPos(playerid, doorsInfo[did][enterCoords][0], doorsInfo[did][enterCoords][1], doorsInfo[did][enterCoords][2]);
                        SetPlayerVirtualWorld(playerid, doorsInfo[did][doorVw]);
                        break;
                    }else{
                        ShowTDN_OOC(playerid, "La puerta se encuentra cerrada");
                        break;
                    }
                }
            }
        }
    }
}
hook OP_EditDynamicObject(playerid, objectid, response, Float:xx, Float:yy, Float:zz, Float:rx, Float:ry, Float:rz){
    if(response == EDIT_RESPONSE_FINAL){
        new index = editDoor[playerid];
        if((index != -1) && (doorsInfo[index][doorStep] == 1)){
            ShowTDN_OOC(playerid, "Ahora edita la posicion de la puerta abierta.");
            doorsInfo[index][doorCoords][0] = xx;
            doorsInfo[index][doorCoords][1] = yy;
            doorsInfo[index][doorCoords][2] = zz;
            doorsInfo[index][doorCoords][3] = rx;
            doorsInfo[index][doorCoords][4] = ry;
            doorsInfo[index][doorCoords][5] = rz;
            doorsInfo[index][doorStep] = 2;
            EditDynamicObject(playerid, doorsInfo[index][doorObject]);

        } 
        else if((index != -1) && (doorsInfo[index][doorStep] == 2)){
            ShowTDN_OOC(playerid, "Editaste la puerta.");
            doorsInfo[index][moveDoorCoords][0] = xx;
            doorsInfo[index][moveDoorCoords][1] = yy;
            doorsInfo[index][moveDoorCoords][2] = zz;
            doorsInfo[index][moveDoorCoords][3] = rx;
            doorsInfo[index][moveDoorCoords][4] = ry;
            doorsInfo[index][moveDoorCoords][5] = rz;
            destroyLabels(index);
            doorsInfo[index][doorState] = DOOR_STATE_CLOSE;
            loadDoor(index);
            doorsInfo[index][doorStep] = -1;
            editDoor[playerid] = -1;

        }
    }
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    switch(dialogid){
        case DIALOG_EDIT_DOOR: {
            if(editDoor[playerid] != -1){
                if(response){
                    new index = editDoor[playerid];
                    switch(listitem){
                        case 0:{
                            changeEnterState(playerid, index);
                        }
                        case 1: {
                            destroyLabels(index);
                            new Float:posXEdit, Float:posYEdit, Float:posZEdit;
                            GetPlayerPos(playerid, posXEdit, posYEdit, posZEdit);
                            doorsInfo[index][enterCoords][0] = posXEdit;
                            doorsInfo[index][enterCoords][1] = posYEdit;
                            doorsInfo[index][enterCoords][2] = posZEdit;
                            doorsInfo[index][doorVw] = GetPlayerVirtualWorld(playerid);
                            loadDoor(index);
                            editDoor[playerid] = -1;
                        }
                        case 2: {
                            if(doorsInfo[index][doorType] != DOOR_TYPE_PHYSICAL){
                                ShowPlayerDialog(playerid, DIALOG_EDIT_DOOR_EXIT, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" Doors", "Interiores de casas\nInteriores de negocios", "Continuar", ""RED" cancelar");
                            }else {
                                ShowTDN_OOC(playerid, "Esta es una puerta fisica");
                                editDoor[playerid] = -1;
                            }
                        }
                        case 3: {
                            if(doorsInfo[index][doorType] == DOOR_TYPE_PHYSICAL){
                                editPHYSICALdoor(playerid, index);
                            } else {
                                ShowTDN_OOC(playerid, "Esta no es una puerta fisica");
                                editDoor[playerid] = -1;
                            }
                        }
                        case 4: {
                            if(doorsInfo[index][doorType] == DOOR_TYPE_PHYSICAL){
                                ShowPlayerDialog(playerid, DIALOG_EDIT_DOOR_MODEL, DIALOG_STYLE_INPUT,""CAPTION_DIALOG_TITLE" Doors", "Ingresa el modelo(solo numeros)", "Continuar", ""RED" cancelar");
                            } else {
                                ShowTDN_OOC(playerid, "Esta no es una puerta fisica");
                                editDoor[playerid] = -1;
                            }
                            
                        }
                    }
                } else editDoor[playerid] = -1;
            }
        }
        case DIALOG_EDIT_DOOR_MODEL: {
            if(response){
                if(editDoor[playerid] != -1){
                    new index = editDoor[playerid];
                    if(IsNumeric(inputtext)){
                        destroyLabels(index);
                        doorsInfo[index][doorModel] = strval(inputtext);
                        loadDoor(index);
                        editDoor[playerid] = -1;
                        ShowTDN_OOC(playerid, "Editaste el modelo de la puerta");
                    }ShowTDN_OOC(playerid, "Solo puedes ingresar numeros");
                }

            } else editDoor[playerid] = -1;
        }
        case DIALOG_EDIT_DOOR_EXIT: {
            if(response){
                if(editDoor[playerid] != -1){
                    switch(listitem){
                        case 0: {
                            showMenuHouses(playerid);
                        }
                    }
                }

            } else editDoor[playerid] = -1;
        }
        case DIALOG_EDIT_DOOR_EXIT_HOUSES: {
            if(response){
                new indexDoor = editDoor[playerid];
                doorsInfo[indexDoor][exitVw] = doorsInfo[indexDoor][listid];
                printf("%f", houseModelsData[listitem][interiorCoords][0]);
                doorsInfo[indexDoor][exitCoords][0] = houseModelsData[listitem][interiorCoords][0];
                doorsInfo[indexDoor][exitCoords][1] = houseModelsData[listitem][interiorCoords][1];
                doorsInfo[indexDoor][exitCoords][2] = houseModelsData[listitem][interiorCoords][2];
                destroyLabels(indexDoor);
                loadDoor(indexDoor);
                editDoor[playerid] = -1;
                ShowTDN_OOC(playerid, "Editaste el interior de la puerta");

            } else editDoor[playerid] = -1;
        }
    }
    
}

cmd:puerta(playerid, params[]){
    for(new i;i<MAX_DOORS-1;i++){
        if(IsPlayerInEnterDoor(playerid, i) || IsPlayerInExitDoor(playerid, 2.0, i)){
            new string[QUERY_MEDIUM];
            if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
                format(string, sizeof(string), ""CAPTION_DIALOG_TITLE" Doors ID: %i", i);
                ShowPlayerDialog(playerid, DIALOG_EDIT_DOOR, DIALOG_STYLE_LIST, string, "Bloquear/desbloquear puerta\nEditar posicion entrada\nEditar posicion salida\nEditar puerta(Fisica)\nEditar modelo puerta(Fisica)", "Continuar", ""RED" cancelar");
                editDoor[playerid] = i;
                break;
            }
            if(characterData[playerid][listid] == doorsInfo[i][characterID]){
                ShowPlayerDialog(playerid, DIALOG_EDIT_DOOR, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" Doors", "Bloquear/desbloquear puerta", "Continuar", ""RED" cancelar");
                editDoor[playerid] = i;
                break;
            }else{
                ShowTDN_OOC(playerid, "No eres el dueño de esta puerta");
                break;
            }
        }
    }
    return 1;
}
cmd:crearpuerta(playerid, params[]){
    new typee;
    if(characterData[playerid][p_spawn]){
        if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
            if(!sscanf(params, "i", typee)){
                if(typee >= 0 && typee < 4){
                     createDoor(playerid, typee, 55);
                } else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearpuerta [TIPO: 1= Fisica, 2=Interior, 3=Vehiculos]");

            }else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearpuerta [TIPO: 1= Fisica, 2=Interior, 3=Vehiculos]");
        }
    }
    return 1;
}

createDoor(playerid, DOOR_TYPE, characterIDD, forModule = -1, other = -1){
    if(characterIDD > 0){
        new index = getFreeDoorSlot();
        new Float:posXEdit, Float:posYEdit, Float:posZEdit;
        GetPlayerPos(playerid, posXEdit, posYEdit, posZEdit);
        doorsInfo[index][enterCoords][0] = posXEdit;
        doorsInfo[index][enterCoords][1] = posYEdit;
        doorsInfo[index][enterCoords][2] = posZEdit;
        if(DOOR_TYPE == DOOR_TYPE_PHYSICAL){
            doorsInfo[index][exitCoords][0] = posXEdit;
            doorsInfo[index][exitCoords][1] = posYEdit;
            doorsInfo[index][exitCoords][2] = posZEdit;
        }
        
        doorsInfo[index][doorVw] = GetPlayerVirtualWorld(playerid);
        doorsInfo[index][characterID] = characterIDD;
        doorsInfo[index][doorType] = DOOR_TYPE;
        doorsInfo[index][doorModel] = 1557;

        new query[QUERY_MEDIUM];
        mysql_format(MYSQL_DB, query, sizeof(query), "INSERT INTO doors(characterid, enterX, enterY, enterZ, doorVw, doorType, doorModel, exitVw) VALUES('%d', '%f', '%f', '%f', '%d', '%d', '%d', '%d')",
            characterIDD,
            doorsInfo[index][enterCoords][0], doorsInfo[index][enterCoords][1], doorsInfo[index][enterCoords][2],
            doorsInfo[index][doorVw],
            DOOR_TYPE,
            doorsInfo[index][doorModel], index +1
        ); 
        mysql_pquery(MYSQL_DB, query, "onCreateDoor", "dddd", playerid, index, forModule, other);
    }
}

loadDoor(index){
    if(doorsInfo[index][doorType] == DOOR_TYPE_PHYSICAL){
        DestroyDynamicObject(doorsInfo[index][doorObject]);
        if(doorsInfo[index][doorState] == DOOR_STATE_OPEN){
            doorsInfo[index][doorObject] = CreateDynamicObject(doorsInfo[index][doorModel], doorsInfo[index][moveDoorCoords][0], doorsInfo[index][moveDoorCoords][1], doorsInfo[index][moveDoorCoords][2], doorsInfo[index][moveDoorCoords][3], doorsInfo[index][moveDoorCoords][4], doorsInfo[index][moveDoorCoords][5], doorsInfo[index][doorVw]);
        }else doorsInfo[index][doorObject] = CreateDynamicObject(doorsInfo[index][doorModel], doorsInfo[index][doorCoords][0], doorsInfo[index][doorCoords][1], doorsInfo[index][doorCoords][2], doorsInfo[index][doorCoords][3], doorsInfo[index][doorCoords][4], doorsInfo[index][doorCoords][5], doorsInfo[index][doorVw]);
        doorsInfo[index][labelEnter] = CreateDynamic3DTextLabel(""GREY"Pulsa "ORANGE"H"GREY" para abrir/cerrar", 0xFFFFFFFF, doorsInfo[index][doorCoords][0], doorsInfo[index][doorCoords][1], doorsInfo[index][doorCoords][2]+1.2, 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[index][doorVw]);
    } else{
        doorsInfo[index][labelEnter] = CreateDynamic3DTextLabel(""GREY"Pulsa "ORANGE"H"GREY" para entrar", 0xFFFFFFFF, doorsInfo[index][enterCoords][0], doorsInfo[index][enterCoords][1], doorsInfo[index][enterCoords][2] - 0.5, 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[index][doorVw]);
        doorsInfo[index][labelExit] = CreateDynamic3DTextLabel(""GREY"Pulsa "ORANGE"H"GREY" para salir", 0xFFFFFFFF, doorsInfo[index][exitCoords][0], doorsInfo[index][exitCoords][1], doorsInfo[index][exitCoords][2] - 0.5, 5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, doorsInfo[index][exitVw]);
    }
    doorsInfo[index][enterState] = DOOR_STATE_OPEN;
}
destroyLabels(index){
    if(index != -1){
        DestroyDynamic3DTextLabel(doorsInfo[index][labelEnter]);
        DestroyDynamic3DTextLabel(doorsInfo[index][labelExit]);
    }
}
editPHYSICALdoor(playerid, index){
    if(doorsInfo[index][doorType] == DOOR_TYPE_PHYSICAL){
        new Float:posXEdit, Float:posYEdit, Float:posZEdit;
        GetPlayerPos(playerid, posXEdit, posYEdit, posZEdit);
        DestroyDynamicObject(doorsInfo[index][doorObject]);
        doorsInfo[index][doorObject] = CreateDynamicObject(doorsInfo[index][doorModel], posXEdit, posYEdit, posZEdit-1.0, 1.0, 1.0, 1.0, GetPlayerVirtualWorld(playerid));
        EditDynamicObject(playerid, doorsInfo[index][doorObject]);
        editDoor[playerid] = index;
        doorsInfo[index][doorStep] = 1;
        ShowTDN_OOC(playerid, "Edita la posicion de la puerta CERRADA");
    }
}

changeEnterState(playerid, index){
    if(doorsInfo[index][enterState] == DOOR_STATE_CLOSE){
        doorsInfo[index][enterState] = DOOR_STATE_OPEN;
        ShowTDN_OOC(playerid, "Desbloqueaste la puerta.");
    }else {
        doorsInfo[index][enterState] = DOOR_STATE_CLOSE;
        ShowTDN_OOC(playerid, "Bloqueaste la puerta.");
    }
}
changeStateDoor(playerid, index){
    if(doorsInfo[index][doorType] == DOOR_TYPE_PHYSICAL){
        if(doorsInfo[index][enterState] == DOOR_STATE_OPEN){
            if(doorsInfo[index][doorState] == DOOR_STATE_CLOSE){
            MoveDynamicObject(doorsInfo[index][doorObject], doorsInfo[index][moveDoorCoords][0], doorsInfo[index][moveDoorCoords][1], doorsInfo[index][moveDoorCoords][2], 14.0, doorsInfo[index][moveDoorCoords][3], doorsInfo[index][moveDoorCoords][4], doorsInfo[index][moveDoorCoords][5]);
            doorsInfo[index][doorState] = DOOR_STATE_OPEN;
            ShowTDN_OOC(playerid, "Abriste la puerta.");
            }else{
                MoveDynamicObject(doorsInfo[index][doorObject], doorsInfo[index][doorCoords][0], doorsInfo[index][doorCoords][1], doorsInfo[index][doorCoords][2], 14.0, doorsInfo[index][doorCoords][3], doorsInfo[index][doorCoords][4], doorsInfo[index][doorCoords][5]);
                doorsInfo[index][doorState] = DOOR_STATE_CLOSE;
                ShowTDN_OOC(playerid, "Cerraste la puerta.");
            }
        } else ShowTDN_OOC(playerid, "La puerta se encuentra cerrada.");
    }
}

IsPlayerInEnterDoor(playerid, did){
    if((IsPlayerInRangeOfPoint(playerid, 2.0, doorsInfo[did][enterCoords][0], doorsInfo[did][enterCoords][1], doorsInfo[did][enterCoords][2])) && (doorsInfo[did][doorVw] == GetPlayerVirtualWorld(playerid))) return true;
    return false;
}
IsPlayerInExitDoor(playerid, Float:range, did){
    if((IsPlayerInRangeOfPoint(playerid, range,  doorsInfo[did][exitCoords][0], doorsInfo[did][exitCoords][1], doorsInfo[did][exitCoords][2])) && (doorsInfo[did][exitVw] == GetPlayerVirtualWorld(playerid))) return true;
    return false;
}

getFreeDoorSlot()
{
    for(new i;i<MAX_DOORS-1;i++)
    {
        if(doorsInfo[i][listid] == 0) return i;
    }
    return -1;
}
getIndexDoorByID(idd){
    for(new i;i<MAX_DOORS-1; i++){
        if(doorsInfo[i][listid] == idd) return i;
    }
    return -1;
}

forward onCreateDoor(playerid, index, forModule, other);
public onCreateDoor(playerid, index, forModule, other){
    doorsInfo[index][listid] = cache_insert_id();
    if(forModule != -1){
        switch(forModule){
            case TYPE_HOUSES: createHouse(playerid, other, doorsInfo[index][listid]);
            case TYPE_MARKETS: createMarket(playerid, other, doorsInfo[index][listid]);
        }
    }
    loadDoor(index);
}

forward loadDoors();
public loadDoors(){
    if(cache_num_rows()){
        for(new i=0;i<cache_num_rows();i++){
            cache_get_value_name_int(i, "listid", doorsInfo[i][listid]);
            cache_get_value_name_int(i, "characterid", doorsInfo[i][characterID]);

            cache_get_value_name_float(i, "enterX", doorsInfo[i][enterCoords][0]);
            cache_get_value_name_float(i, "enterY", doorsInfo[i][enterCoords][1]);
            cache_get_value_name_float(i, "enterZ", doorsInfo[i][enterCoords][2]);
            cache_get_value_name_float(i, "exitX", doorsInfo[i][exitCoords][0]);
            cache_get_value_name_float(i, "exitY", doorsInfo[i][exitCoords][1]);
            cache_get_value_name_float(i, "exitZ", doorsInfo[i][exitCoords][2]);

            cache_get_value_name_int(i, "enterState", doorsInfo[i][enterState]);
            cache_get_value_name_int(i, "doorModel", doorsInfo[i][doorModel]);

            cache_get_value_name_float(i, "doorCoords1", doorsInfo[i][doorCoords][0]);
            cache_get_value_name_float(i, "doorCoords2", doorsInfo[i][doorCoords][1]);
            cache_get_value_name_float(i, "doorCoords3", doorsInfo[i][doorCoords][2]);
            cache_get_value_name_float(i, "doorCoords4", doorsInfo[i][doorCoords][3]);
            cache_get_value_name_float(i, "doorCoords5", doorsInfo[i][doorCoords][4]);
            cache_get_value_name_float(i, "doorCoords6", doorsInfo[i][doorCoords][5]);

            cache_get_value_name_float(i, "movedoorCoords1", doorsInfo[i][moveDoorCoords][0]);
            cache_get_value_name_float(i, "movedoorCoords2", doorsInfo[i][moveDoorCoords][1]);
            cache_get_value_name_float(i, "movedoorCoords3", doorsInfo[i][moveDoorCoords][2]);
            cache_get_value_name_float(i, "movedoorCoords4", doorsInfo[i][moveDoorCoords][3]);
            cache_get_value_name_float(i, "movedoorCoords5", doorsInfo[i][moveDoorCoords][4]);
            cache_get_value_name_float(i, "movedoorCoords6", doorsInfo[i][moveDoorCoords][5]);

            cache_get_value_name_int(i, "doorVw", doorsInfo[i][doorVw]);
            cache_get_value_name_int(i, "exitVw", doorsInfo[i][exitVw]);
            cache_get_value_name_int(i, "doorState", doorsInfo[i][doorState]);
            cache_get_value_name_int(i, "doorType", doorsInfo[i][doorType]);

            loadDoor(i);
        }
        mysql_pquery(MYSQL_DB, "SELECT * FROM HOUSES", "loadHouses");
        mysql_pquery(MYSQL_DB, "SELECT * FROM MARKETS", "loadMarkets");
    }
}

saveDoors(){
    new query[QUERY_LONG];
    for(new i; i<MAX_DOORS-1;i++){
        if(doorsInfo[i][characterID] > 0){
            mysql_format(MYSQL_DB, query, sizeof(query), "UPDATE doors SET `characterid`='%d', `enterX`='%f', `enterY`='%f', `enterZ`='%f', `exitX`='%f', `exitY`='%f', `exitZ`='%f', `enterState`='%d', `doorModel`='%d', \
            `doorCoords1`='%f', `doorCoords2`='%f', `doorCoords3`='%f', `doorCoords4`='%f', `doorCoords5`='%f', `doorCoords6`='%f', `movedoorCoords1`='%f', `movedoorCoords2`='%f', `movedoorCoords3`='%f', `movedoorCoords4`='%f', `movedoorCoords5`='%f', `movedoorCoords6`='%f', \
            `doorVw`='%d', `exitVw`='%d', `doorState`='%d', `doorType`='%d' WHERE listid = '%d' LIMIT 1",
            doorsInfo[i][characterID],
            doorsInfo[i][enterCoords][0],
            doorsInfo[i][enterCoords][1],
            doorsInfo[i][enterCoords][2],
            doorsInfo[i][exitCoords][0],
            doorsInfo[i][exitCoords][1],
            doorsInfo[i][exitCoords][2],
            doorsInfo[i][enterState],
            doorsInfo[i][doorModel],
            doorsInfo[i][doorCoords][0],
            doorsInfo[i][doorCoords][1],
            doorsInfo[i][doorCoords][2],
            doorsInfo[i][doorCoords][3],
            doorsInfo[i][doorCoords][4],
            doorsInfo[i][doorCoords][5],

            doorsInfo[i][moveDoorCoords][0],
            doorsInfo[i][moveDoorCoords][1],
            doorsInfo[i][moveDoorCoords][2],
            doorsInfo[i][moveDoorCoords][3],
            doorsInfo[i][moveDoorCoords][4],
            doorsInfo[i][moveDoorCoords][5],
            doorsInfo[i][doorVw],
            doorsInfo[i][exitVw],
            doorsInfo[i][doorState],
            doorsInfo[i][doorType],
            doorsInfo[i][listid]);
            mysql_pquery(MYSQL_DB, query);
        }
    }
}