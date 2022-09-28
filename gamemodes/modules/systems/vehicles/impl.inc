#include <YSI_Coding\y_hooks>



hook OnGameModeInit(){
	
	velocimeter_TD[0] = TextDrawCreate(462.885162, 333.266967, "mdl-2001:box_velocimeter");
	TextDrawTextSize(velocimeter_TD[0], 178.000000, 109.000000);
	TextDrawAlignment(velocimeter_TD[0], 1);
	TextDrawColor(velocimeter_TD[0], -1);
	TextDrawSetShadow(velocimeter_TD[0], 0);
	TextDrawBackgroundColor(velocimeter_TD[0], 255);
	TextDrawFont(velocimeter_TD[0], 4);
	TextDrawSetProportional(velocimeter_TD[0], 0);
}
hook OnPlayerConnect(playerid){
	velocimeter_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 494.743957, 372.583343, "1");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][0], 0.324568, 1.949999);
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][0], 0.000000, 31.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][0], -1523963137);
	PlayerTextDrawUseBox(playerid, velocimeter_PTD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, velocimeter_PTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][0], 1);

	velocimeter_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 595.007385, 378.416534, "Admiral");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][1], 0.184480, 1.139166);
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][1], 0.000000, 74.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][1], 436207871);
	PlayerTextDrawUseBox(playerid, velocimeter_PTD[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, velocimeter_PTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][1], 1);

	velocimeter_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 581.888854, 390.666656, "off");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][2], 0.168081, 1.004999);
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][2], 0.000000, 89.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][2], 436207871);
	PlayerTextDrawUseBox(playerid, velocimeter_PTD[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, velocimeter_PTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][2], 1);

	velocimeter_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 602.035400, 390.666656, "off");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][3], 0.168081, 1.004999);
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][3], 0.000000, 89.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][3], 436207871);
	PlayerTextDrawUseBox(playerid, velocimeter_PTD[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, velocimeter_PTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][3], 1);

	velocimeter_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 621.713806, 390.083312, "off");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][4], 0.168081, 1.004999);
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][4], 0.000000, 89.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][4], 436207871);
	PlayerTextDrawUseBox(playerid, velocimeter_PTD[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, velocimeter_PTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][4], 1);

	velocimeter_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 599.224609, 404.666687, "9999");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][5], 0.100614, 1.284999);
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][5], 0.000000, 30.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][5], 436207871);
	PlayerTextDrawUseBox(playerid, velocimeter_PTD[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, velocimeter_PTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][5], 1);


}
hook OnPlayerUpdate(playerid){
	if(characterData[playerid][p_spawn]){
		if(inVehicle[playerid] != -1) updateVelocimeterVelocity(playerid, inVehicle[playerid]);
	}
	return 1;
}
hook OnPlayerStateChange(playerid, newstate, oldstate){
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER){
    	new vehicleid = GetPlayerVehicleID(playerid);
    	inVehicle[playerid] = getVehicleIndexById(vehicleid);
		showVelocimeter(playerid, inVehicle[playerid]);
		if(newstate == PLAYER_STATE_DRIVER && vehicleData[inVehicle[playerid]][enginee] == VEHICLE_PARAMS_ON){
			vehicleData[inVehicle[playerid]][timergas] = SetPlayerTimerEx(playerid, "updateVehicleGas", GAS_TIME_UPDATED, 1, "dd", playerid, inVehicle[playerid]);
		}

    }
    else if((oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER) && newstate != PLAYER_STATE_PASSENGER && newstate != PLAYER_STATE_DRIVER) {
        if(newstate == PLAYER_STATE_DRIVER && vehicleData[inVehicle[playerid]][enginee] == VEHICLE_PARAMS_ON) KillPlayerTimer(vehicleData[inVehicle[playerid]][timergas]);
        inVehicle[playerid] = -1;
		hideVelocimeter(playerid);
    }
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_VEHICLE: {
			new index = inVehicle[playerid];
			if(response){
				switch(listitem){
					case 0: {
						new bool:newvalue = false;
						if(!getVehicleParamState(vehicleData[index][enginee])) newvalue = true;
						setEngine(playerid, index, newvalue);
					}
					case 1: {
						new bool:newvalue = false;
						if(!getVehicleParamState(vehicleData[index][lightss])) newvalue = true;
						setLights(playerid, index, newvalue);
					}
					case 2: {
						new bool:newvalue = false;
						if(!getVehicleParamState(vehicleData[index][doorr])) newvalue = true;
						setDoors(playerid, index, newvalue);
					}
					case 3: {
						new bool:newvalue = false;
						if(!getVehicleParamState(vehicleData[index][boott])) newvalue = true;
						setBoot(playerid, index, newvalue);
					}
					case 4: {
						new bool:newvalue = false;
						if(!getVehicleParamState(vehicleData[index][bonnett])) newvalue = true;
						setBonnet(playerid, index, newvalue);
					}
					case 5: {
						new bool:newvalue = false;
						if(!getVehicleParamState(vehicleData[index][alarmm])) newvalue = true;
						setAlarm(playerid, index, newvalue);
					}
					case 6: ShowPlayerDialog(playerid, DIALOG_VEHICLE_WINDOWS, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" VEHICLE","Conductor(Abrir/Cerrar)\nPasajero(Abrir/Cerrar)\nTrasera derecha(Abrir/Cerrar)\nTrasera izquierda(Abrir/Cerrar)", "Continuar", ""RED" cancelar");

				}
			}
		}
		case DIALOG_VEHICLE_WINDOWS: {
			if(response){
				new index = inVehicle[playerid];
				switch(listitem){
					case 0: setWindowDriver(playerid, index, vehicleData[index][windows][0]);
					case 1: setWindowPassenger(playerid, index, vehicleData[index][windows][1]);
					case 2: setWindowBackleft(playerid, index, vehicleData[index][windows][2]);
					case 3: setWindowBackright(playerid, index, vehicleData[index][windows][3]);
				}
			}
		}
	}
}

cmd:vmenu(playerid, params[]){
	if(inVehicle[playerid] != -1){
		new stt = GetPlayerState(playerid);
		if(stt == PLAYER_STATE_DRIVER){
			//PERMISSION
			ShowPlayerDialog(playerid, DIALOG_VEHICLE, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" VEHICLE","Motor(Encender/apagar)\nLuces(Encender/apagar)\nPuertas(Abrir/cerrar)\nBaul(Abrir/cerrar)\nCapo(Abrir/cerrar)\nAlarma(Prender/apagar)\nVentanas\nToys", "Continuar", ""RED" cancelar");
		} else ShowTDN_OOC(playerid, "No eres el conductor.");
	} else ShowTDN_OOC(playerid, "No estas en un vehiculo.");
}
cmd:crearvehiculo(playerid, params[]){
	new mdll;
	if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
		if(!sscanf(params, "i", mdll)){
	    	if(mdll >= 0 && mdll < sizeof(vehiclesModelData)){
	    		new index = getVehicleFreeSlot();
	    		if(index != -1){
	    			new Float:getP[3];
	    			GetPlayerPos(playerid, getP[0], getP[1], getP[2]);
	    			vehicleData[index][listid] = index + 1;
	    			vehicleData[index][model] = mdll;
	    			vehicleData[index][position][0] = getP[0];
	    			vehicleData[index][position][1] = getP[1];
	    			vehicleData[index][position][2] = getP[2];
	    			vehicleData[index][windows][0] = CAR_WINDOW_CLOSE;
	    			vehicleData[index][windows][1] = CAR_WINDOW_CLOSE;
	    			vehicleData[index][windows][2] = CAR_WINDOW_CLOSE;
	    			vehicleData[index][windows][3] = CAR_WINDOW_CLOSE;
	    			vehicleData[index][vehicle_life] = 1000.0;
	    			vehicleData[index][gas] = 30;
	    			vehicleData[index][oil] = 50;
	    			vehicleData[index][kilometres] = 15;
	    			loadVehicle(index);
	    		} else ShowTDN_OOC(playerid, "No se pueden crear mas vehiculos.");
	    	} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearvehiculo [modelo]");
	    } else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearvehiculo [modelo]");
    } else ShowTDN_OOC(playerid, "No tienes permisos");
}
