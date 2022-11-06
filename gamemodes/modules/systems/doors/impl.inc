#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid, reason){
    saveDoors();
}
hook OnPlayerSpawn(playerid){
    editDoor[playerid] = -1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(characterData[playerid][p_spawn]){
        if(newkeys & KEY_YES){
            new Float:range = 2.5;
            for(new did;did<MAX_DOORS-1;did++){
                if(doorsInfo[did][doorType] == DOOR_TYPE_VEHICLE) {
                    range = 6.0;
                }
                if(IsPlayerInEnterDoor(playerid, range, did)){
                    if(doorsInfo[did][enterState] == DOOR_STATE_OPEN){
                        if(doorsInfo[did][doorType] != DOOR_TYPE_PHYSICAL){
                            SetPlayerPos(playerid, doorsInfo[did][exitCoords][0], doorsInfo[did][exitCoords][1], doorsInfo[did][exitCoords][2]);
                            SetPlayerVirtualWorld(playerid, doorsInfo[did][exitVw]);
                            SetPlayerFacingAngle(playerid, doorsInfo[did][exitCoords][3]);
                            if(doorsInfo[did][doorType] == DOOR_TYPE_VEHICLE){
                                if(IsPlayerInAnyVehicle(playerid)){
                                    SetVehiclePos(GetPlayerVehicleID(playerid), doorsInfo[did][exitCoords][0], doorsInfo[did][exitCoords][1], doorsInfo[did][exitCoords][2]);
                                    SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), doorsInfo[did][exitVw]);
                                    PutPlayerInVehicle(playerid, GetPlayerVehicleID(playerid), 0);
                                    SetVehicleZAngle(GetPlayerVehicleID(playerid), doorsInfo[did][exitCoords][3]);
                                }
                            }
                            break;
                        }else changeStateDoor(playerid, did);

                        break;
                    } else{
                        ShowTDN_OOC(playerid, "La puerta se encuentra cerrada");
                        break;
                    }
                }else if(IsPlayerInExitDoor(playerid, range, did)){
                    if(doorsInfo[did][enterState] == DOOR_STATE_OPEN){
                        if(doorsInfo[did][doorType] != DOOR_TYPE_PHYSICAL){
                            SetPlayerPos(playerid, doorsInfo[did][enterCoords][0], doorsInfo[did][enterCoords][1], doorsInfo[did][enterCoords][2]);
                            SetPlayerVirtualWorld(playerid, doorsInfo[did][doorVw]);
                            SetPlayerFacingAngle(playerid, doorsInfo[did][enterCoords][3]);
                            if(doorsInfo[did][doorType] == DOOR_TYPE_VEHICLE){
                                if(IsPlayerInAnyVehicle(playerid)){
                                    SetVehiclePos(GetPlayerVehicleID(playerid), doorsInfo[did][enterCoords][0], doorsInfo[did][enterCoords][1], doorsInfo[did][enterCoords][2]);
                                    SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), doorsInfo[did][doorVw]);
                                    PutPlayerInVehicle(playerid, GetPlayerVehicleID(playerid), 0);
                                    SetVehicleZAngle(GetPlayerVehicleID(playerid), doorsInfo[did][enterCoords][3]);
                                }
                            }
                            break;
                        }
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
            if(IsValidDynamicObject(doorsInfo[index][doorObject]))
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
                        case 5: {
                            new Float:angl;
                            GetPlayerFacingAngle(playerid, angl);
                            doorsInfo[index][enterCoords][3] = angl;
                            editDoor[playerid] = -1;
                            ShowTDN_OOC(playerid, "Editaste el angulo de la puerta entrada");
                        }
                        case 6: {
                            new Float:angl;
                            GetPlayerFacingAngle(playerid, angl);
                            doorsInfo[index][exitCoords][3] = angl;
                            editDoor[playerid] = -1;
                            ShowTDN_OOC(playerid, "Editaste el angulo de la puerta salida");
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
        if(IsPlayerInEnterDoor(playerid, 2.5, i) || IsPlayerInExitDoor(playerid, 2.5, i)){
            new string[QUERY_MEDIUM];
            if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
                format(string, sizeof(string), ""CAPTION_DIALOG_TITLE" Doors ID: %i", i);
                ShowPlayerDialog(playerid, DIALOG_EDIT_DOOR, DIALOG_STYLE_LIST, string, "Bloquear/desbloquear puerta\nEditar posicion entrada\nEditar posicion salida\nEditar puerta(Fisica)\nEditar modelo puerta(Fisica)\nEditar Angle entrada\nEditar Angle salida", "Continuar", ""RED" cancelar");
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