#include <YSI_Coding\y_hooks>



hook OnGameModeInit(){
	
	velocimeter_TD[0] = TextDrawCreate(567.665039, 387.749908, "mdl-2001:box_box");
	TextDrawTextSize(velocimeter_TD[0], 62.000000, 52.000000);
	TextDrawAlignment(velocimeter_TD[0], 1);
	TextDrawColor(velocimeter_TD[0], 168430335);
	TextDrawSetShadow(velocimeter_TD[0], 0);
	TextDrawBackgroundColor(velocimeter_TD[0], 255);
	TextDrawFont(velocimeter_TD[0], 4);
	TextDrawSetProportional(velocimeter_TD[0], 0);

	velocimeter_TD[1] = TextDrawCreate(488.953613, 408.749969, "mdl-2001:box_box");
	TextDrawTextSize(velocimeter_TD[1], 75.000000, 31.000000);
	TextDrawAlignment(velocimeter_TD[1], 1);
	TextDrawColor(velocimeter_TD[1], 168430335);
	TextDrawSetShadow(velocimeter_TD[1], 0);
	TextDrawBackgroundColor(velocimeter_TD[1], 255);
	TextDrawFont(velocimeter_TD[1], 4);
	TextDrawSetProportional(velocimeter_TD[1], 0);

	velocimeter_TD[2] = TextDrawCreate(492.701477, 412.250030, "mdl-2001:gas");
	TextDrawTextSize(velocimeter_TD[2], 14.000000, 11.000000);
	TextDrawAlignment(velocimeter_TD[2], 1);
	TextDrawColor(velocimeter_TD[2], -1);
	TextDrawSetShadow(velocimeter_TD[2], 0);
	TextDrawBackgroundColor(velocimeter_TD[2], 255);
	TextDrawFont(velocimeter_TD[2], 4);
	TextDrawSetProportional(velocimeter_TD[2], 0);

	velocimeter_TD[3] = TextDrawCreate(492.701354, 419.250000, "mdl-2001:oil");
	TextDrawTextSize(velocimeter_TD[3], 13.000000, 23.000000);
	TextDrawAlignment(velocimeter_TD[3], 1);
	TextDrawColor(velocimeter_TD[3], -1);
	TextDrawSetShadow(velocimeter_TD[3], 0);
	TextDrawBackgroundColor(velocimeter_TD[3], 255);
	TextDrawFont(velocimeter_TD[3], 4);
	TextDrawSetProportional(velocimeter_TD[3], 0);

	velocimeter_TD[4] = TextDrawCreate(509.736724, 417.500122, "box");
	TextDrawLetterSize(velocimeter_TD[4], 0.000000, 0.207907);
	TextDrawTextSize(velocimeter_TD[4], 559.000000, 0.000000);
	TextDrawAlignment(velocimeter_TD[4], 1);
	TextDrawColor(velocimeter_TD[4], -1);
	TextDrawUseBox(velocimeter_TD[4], 1);
	TextDrawBoxColor(velocimeter_TD[4], 589505535);
	TextDrawSetShadow(velocimeter_TD[4], 0);
	TextDrawBackgroundColor(velocimeter_TD[4], 255);
	TextDrawFont(velocimeter_TD[4], 1);
	TextDrawSetProportional(velocimeter_TD[4], 1);

	velocimeter_TD[5] = TextDrawCreate(509.736724, 430.333465, "box");
	TextDrawLetterSize(velocimeter_TD[5], 0.000000, 0.207907);
	TextDrawTextSize(velocimeter_TD[5], 559.000000, 0.000000);
	TextDrawAlignment(velocimeter_TD[5], 1);
	TextDrawColor(velocimeter_TD[5], -1);
	TextDrawUseBox(velocimeter_TD[5], 1);
	TextDrawBoxColor(velocimeter_TD[5], 589505535);
	TextDrawSetShadow(velocimeter_TD[5], 0);
	TextDrawBackgroundColor(velocimeter_TD[5], 255);
	TextDrawFont(velocimeter_TD[5], 1);
	TextDrawSetProportional(velocimeter_TD[5], 1);

	velocimeter_TD[6] = TextDrawCreate(504.414764, 388.333312, "mdl-2001:box_box");
	TextDrawTextSize(velocimeter_TD[6], 60.000000, 19.000000);
	TextDrawAlignment(velocimeter_TD[6], 1);
	TextDrawColor(velocimeter_TD[6], 168430335);
	TextDrawSetShadow(velocimeter_TD[6], 0);
	TextDrawBackgroundColor(velocimeter_TD[6], 255);
	TextDrawFont(velocimeter_TD[6], 4);
	TextDrawSetProportional(velocimeter_TD[6], 0);
}
hook OnPlayerConnect(playerid){
	velocimeter_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 570.007507, 412.249969, "mdl-2001:circle");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][0], 19.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][0], 589505535);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][0], 0);

	velocimeter_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 589.216979, 412.249969, "mdl-2001:circle");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][1], 19.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][1], 54473727);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][1], 0);

	velocimeter_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 608.426391, 412.249969, "mdl-2001:circle");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][2], 19.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][2], 589505535);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][2], 0);

	velocimeter_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 573.286987, 414.583343, "mdl-2001:doors");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][3], 12.000000, 14.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][3], 0);

	velocimeter_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 592.027954, 413.416687, "mdl-2001:lights");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][4], 13.000000, 18.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][4], 0);

	velocimeter_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 610.768859, 415.750030, "mdl-2001:windows");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][5], 13.000000, 12.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][5], 0);

	velocimeter_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 534.568420, 391.833374, "000034");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][6], 0.264127, 1.179998);
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][6], 0.000000, 50.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][6], -2139062017);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][6], 1);

	velocimeter_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 574.861083, 390.083435, "290_km/h");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][7], 0.243045, 1.325832);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][7], 54473727);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][7], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][7], 1);


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
		} else ShowTDN_IC(playerid, "No eres el conductor.");
	} else ShowTDN_IC(playerid, "No estas en un vehiculo.");
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
	    			vehicleData[index][vehicle_vw] = GetPlayerVirtualWorld(playerid);
	    			vehicleData[index][gas] = 40;
	    			vehicleData[index][oil] = 50;
	    			vehicleData[index][kilometres] = 77;
	    			loadVehicle(index);
	    		} else ShowTDN_IC(playerid, "No se pueden crear mas vehiculos.");
	    	} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearvehiculo [modelo]");
	    } else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearvehiculo [modelo]");
    } else ShowTDN_IC(playerid, "No tienes permisos");
}
