#include <YSI_Coding\y_hooks>



hook OnGameModeInit(){
	
	velocimeter_TD[0] = TextDrawCreate(525.497985, 386.583496, "mdl-2001:box_box");
	TextDrawTextSize(velocimeter_TD[0], 111.000000, 56.000000);
	TextDrawAlignment(velocimeter_TD[0], 1);
	TextDrawColor(velocimeter_TD[0], 168430335);
	TextDrawSetShadow(velocimeter_TD[0], 0);
	TextDrawBackgroundColor(velocimeter_TD[0], 255);
	TextDrawFont(velocimeter_TD[0], 4);
	TextDrawSetProportional(velocimeter_TD[0], 0);

	velocimeter_TD[1] = TextDrawCreate(472.086822, 381.333465, "mdl-2001:circle");
	TextDrawTextSize(velocimeter_TD[1], 54.000000, 65.000000);
	TextDrawAlignment(velocimeter_TD[1], 1);
	TextDrawColor(velocimeter_TD[1], 168430335);
	TextDrawSetShadow(velocimeter_TD[1], 0);
	TextDrawBackgroundColor(velocimeter_TD[1], 255);
	TextDrawFont(velocimeter_TD[1], 4);
	TextDrawSetProportional(velocimeter_TD[1], 0);

	velocimeter_TD[2] = TextDrawCreate(616.391357, 390.666534, "mdl-2001:gas");
	TextDrawTextSize(velocimeter_TD[2], 16.000000, 12.000000);
	TextDrawAlignment(velocimeter_TD[2], 1);
	TextDrawColor(velocimeter_TD[2], -1);
	TextDrawSetShadow(velocimeter_TD[2], 0);
	TextDrawBackgroundColor(velocimeter_TD[2], 255);
	TextDrawFont(velocimeter_TD[2], 4);
	TextDrawSetProportional(velocimeter_TD[2], 0);

	velocimeter_TD[3] = TextDrawCreate(618.734069, 404.083251, "mdl-2001:oil");
	TextDrawTextSize(velocimeter_TD[3], 15.000000, 20.000000);
	TextDrawAlignment(velocimeter_TD[3], 1);
	TextDrawColor(velocimeter_TD[3], -1);
	TextDrawSetShadow(velocimeter_TD[3], 0);
	TextDrawBackgroundColor(velocimeter_TD[3], 255);
	TextDrawFont(velocimeter_TD[3], 4);
	TextDrawSetProportional(velocimeter_TD[3], 0);

	velocimeter_TD[4] = TextDrawCreate(491.464324, 420.999969, "km/h");
	TextDrawLetterSize(velocimeter_TD[4], 0.242108, 0.777500);
	TextDrawAlignment(velocimeter_TD[4], 1);
	TextDrawColor(velocimeter_TD[4], -1);
	TextDrawSetShadow(velocimeter_TD[4], 0);
	TextDrawBackgroundColor(velocimeter_TD[4], 255);
	TextDrawFont(velocimeter_TD[4], 1);
	TextDrawSetProportional(velocimeter_TD[4], 1);
}
hook OnPlayerConnect(playerid){
	velocimeter_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 526.903625, 418.666564, "mdl-2001:circle");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][0], 21.000000, 22.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][0], 589505535);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][0], 0);

	velocimeter_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 548.455627, 418.666625, "mdl-2001:circle");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][1], 21.000000, 22.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][1], 54473727);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][1], 0);

	velocimeter_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 570.007507, 418.666503, "mdl-2001:circle");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][2], 21.000000, 22.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][2], 589505535);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][2], 0);

	velocimeter_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 531.588867, 420.416717, "mdl-2001:doors");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][3], 12.000000, 16.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][3], 0);

	velocimeter_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 552.203796, 422.166778, "mdl-2001:windows");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][4], 14.000000, 14.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][4], 0);


	velocimeter_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 573.755859, 420.999969, "mdl-2001:lights");
	PlayerTextDrawTextSize(playerid, velocimeter_PTD[playerid][5], 14.000000, 17.000000);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][5], 0);


	velocimeter_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 593.133605, 420.999938, "Kilometraje: 38473");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][6], 0.212591, 0.964165);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, velocimeter_PTD[playerid][6], -1061109505);
	PlayerTextDrawSetShadow(playerid, velocimeter_PTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, velocimeter_PTD[playerid][6], 255);
	PlayerTextDrawFont(playerid, velocimeter_PTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, velocimeter_PTD[playerid][6], 1);

	velocimeter_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 499.429473, 403.499969, "232");
	PlayerTextDrawLetterSize(playerid, velocimeter_PTD[playerid][7], 0.348931, 1.308332);
	PlayerTextDrawAlignment(playerid, velocimeter_PTD[playerid][7], 2);
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
