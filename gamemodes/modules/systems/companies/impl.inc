#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid){
	editCompany[playerid] = -1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case DIALOG_EDIT_COMPANY:{
			if(editCompany[playerid] != -1){
				if(response){
					new indxx = editCompany[playerid];
					new indxdoor = getIndexDoorByID(companyData[indxx][doorid]);
					switch(listitem){
						case 0: ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_DOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un indx(Puerta)", "Continuar", ""RED" cancelar");
						case 1: ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_GARAJEDOORID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un indx(Puerta)", "Continuar", ""RED" cancelar");
						case 2: ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_DIRECTION, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa una direccion", "Continuar", ""RED" cancelar");
						case 3: {
							new string[QUERY_LONG];
							new stringtwo[QUERY_LOW];
							for(new i=1;i<sizeof(companyModelData);i++){
								format(stringtwo, sizeof(stringtwo), "%i - %s \n", i, companyModelData[i][name]);
								strcat(string, stringtwo);
							}
							ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_TYPE, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" COMPANY", string, "Continuar", ""RED" cancelar");
						}
						case 4: ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_PRICE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un precio(Solo numeros)", "Continuar", ""RED" cancelar");
						case 5: {
							if(indxx != -1 && indxdoor != -1){
								updateRoomPosition(playerid, indxx, indxdoor);
							}else editCompany[playerid] = -1;
						}
						case 6: {
							if(indxx != -1 && indxdoor != -1){
								updateCraftPosition(playerid, indxx, indxdoor);
							}else editCompany[playerid] = -1;
						}
						case 7: {
							if(indxx != -1 && indxdoor != -1){
								updateJobPosition(playerid, indxx, indxdoor);
							}else editCompany[playerid] = -1;
						}
						case 8: {
							if(indxx != -1 && indxdoor != -1){
								updateDispatchIntPosition(playerid, indxx, indxdoor);
							}else editCompany[playerid] = -1;
						}
						case 9: {
							if(indxx != -1 && indxdoor != -1){
								updateDispatchExtPosition(playerid, indxx, indxdoor);
							}else editCompany[playerid] = -1;
						}
					}
				} else editCompany[playerid] = -1;
			} else editCompany[playerid] = -1;
		}
		case DIALOG_EDIT_COMPANY_DIRECTION: {
			if(response){
				new indxx = editCompany[playerid];
				new indxdoor = getIndexDoorByID(companyData[indxx][doorid]);
				format(companyData[indxx][direction], 60, "%s", inputtext);
				destroyDynamicCompany(indxx);
				loadCompany(indxx, indxdoor);
				ShowTDN_OOC(playerid, "Editaste la direccion");
				editCompany[playerid] = -1;
			} else editCompany[playerid] = -1;
		}
		case DIALOG_EDIT_COMPANY_TYPE: {
			if(response){
				new indxx = editCompany[playerid];
				new indxdoor = getIndexDoorByID(companyData[indxx][doorid]);
				companyData[indxx][type_company] = listitem+1;
				destroyDynamicCompany(indxx);
				loadCompany(indxx, indxdoor);
				ShowTDN_OOC(playerid, "Editaste el tipo");
				editCompany[playerid] = -1;
			} else editCompany[playerid] = -1;
		}
		case DIALOG_EDIT_COMPANY_PRICE: {
			if(response){
				if(IsNumeric(inputtext)){
					new indxx = editCompany[playerid];
					new indxdoor = getIndexDoorByID(companyData[indxx][doorid]);
					companyData[indxx][price] = strval(inputtext);
					destroyDynamicCompany(indxx);
					loadCompany(indxx, indxdoor);
					ShowTDN_OOC(playerid, "Editaste el precio");
					editCompany[playerid] = -1;
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_PRICE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un precio(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editCompany[playerid] = -1;
		}
		case DIALOG_MY_COMPANY:{
			if(response){
				switch(listitem){
					case 0: ShowFurnitures(playerid, companyData[editCompany[playerid]][listid], TYPE_COMPANIES);
					case 1: ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_INVITE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa el ID que quieres invitar", "Continuar", ""RED" cancelar");
					case 2: {
						new stringFinal[QUERY_LONG], string[QUERY_LOW];
						for(new i;i<MAX_PLAYERS;i++){
							if(IsPlayerConnected(i)){
								if(characterData[i][p_spawn]){
									if(characterData[i][biz] == companyData[editCompany[playerid]][listid]){
										format(string, sizeof(string), "%s \n", GetFullName(i));
										strcat(stringFinal, string);
									}
								}
							}
						}
						ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_DISMISS, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" COMPANY", stringFinal, "Continuar", ""RED" cancelar");
					}
					case 3: ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_DEPOSIT, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
					case 4: ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_WITHDRAW, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");

				}
			} else editCompany[playerid] = -1;
		}
		case DIALOG_MY_COMPANY_INVITE:{
			if(response){
				if(IsNumeric(inputtext)){
					new valueee = strval(inputtext);
					if(IsPlayerConnected(valueee)){
						new stringgg[QUERY_MEDIUM];
						format(stringgg, sizeof(stringgg), "Fuiste invitado a una empresa tipo %s, ¿Deseas aceptar?", companyModelData[companyData[editCompany[playerid]][type_company]][name]);
						ShowPlayerDialog(valueee, DIALOG_MY_COMPANY_INVITE_ID, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", stringgg, "Continuar", ""RED" cancelar");
						editCompany[valueee] = editCompany[playerid];
						editCompany[playerid] = -1;
					}else{
						ShowTDN_OOC(playerid, "Jugador no conectado.");
						editCompany[playerid] = -1;
					}
				} else ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_INVITE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa el ID que quieres invitar", "Continuar", ""RED" cancelar");
			} else editCompany[playerid] = -1;
		}
		case DIALOG_MY_COMPANY_INVITE_ID:{
			if(response){
				new stringgg[QUERY_MEDIUM];
				format(stringgg, sizeof(stringgg), ""GREY" El jugador %s se unio a tu empresa.", GetFullName(playerid));
				ShowTDN_OOC(playerid, "Aceptaste la oferta.");
				characterData[playerid][biz] = companyData[editCompany[playerid]][listid];
				sendMemberMessageComapanyId(companyData[editCompany[playerid]][listid], stringgg);
			} else {
				editCompany[playerid] = -1;
				ShowTDN_OOC(playerid, "Rechazaste la oferta.");
			}
		}
		case DIALOG_MY_COMPANY_DISMISS:{
			if(response){
				for(new i, e;i<MAX_PLAYERS;i++){
					if(IsPlayerConnected(i)){
						if(characterData[i][p_spawn]){
							if(characterData[i][biz] == companyData[editCompany[playerid]][listid]){
								if(listitem == e){
									characterData[i][biz] = 0;
									ShowTDN_OOC(i, "Te despidieron de la empresa.");
									ShowTDN_OOC(playerid, "Despediste al jugador.");
									break;
								}
								e++;
							}
						}
					}
				}
			} else editCompany[playerid] = -1;
		}
		case DIALOG_MY_COMPANY_DEPOSIT: {
			if(response){
				if(IsNumeric(inputtext)){
					new ammountss = strval(inputtext);
					if(characterData[playerid][money] >= ammountss){
						new indx = editCompany[playerid];
						companyData[indx][safe] += ammountss;
						takeCharacterMoney(playerid, ammountss);
						ShowTDN_OOC(playerid, "Depositaste dinero en la caja fuerte.");
						editCompany[playerid] = -1;
					}else {
						ShowTDN_OOC(playerid, "No tienes el dinero suficiente.");
						editCompany[playerid] = -1;
					}
					
				} else ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_DEPOSIT, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editCompany[playerid] = -1;
		}
		case DIALOG_MY_MARKET_WITHDRAW: {
			if(response){
				if(IsNumeric(inputtext)){
					new ammountss = strval(inputtext);
					new indx = editCompany[playerid];
					if(companyData[indx][safe] >= ammountss){
						companyData[indx][safe] -= ammountss;
						giveCharacterMoney(playerid, ammountss);
						ShowTDN_OOC(playerid, "Retiraste dinero de la caja fuerte.");
						editCompany[playerid] = -1;
					}else {
						ShowTDN_OOC(playerid, "La caja fuerte no tiene se monto.");
						editCompany[playerid] = -1;
					}
					
				} else ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_WITHDRAW, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editCompany[playerid] = -1;
		}
	}
}
cmd:miempresa(playerid, params[]){
	new stringgg[QUERY_LOW];
	for(new i;i<MAX_DOORS;i++){
		if(IsPlayerInExitDoor(playerid, 20.0, i)){
			for(new e;e<MAX_COMPANIES;e++){
				if(doorsInfo[i][listid] == companyData[e][doorid]){
					if(companyData[e][characterid] == characterData[playerid][listid]){
						format(stringgg, sizeof(stringgg), "Muebles\nInvitar\nDespedir\nDepositar dinero caja fuerte\nRetirar dinero caja fuerte("GREEN"$%i)", companyData[e][safe]);
						ShowPlayerDialog(playerid, DIALOG_MY_COMPANY, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" COMPANY", stringgg, "Continuar", ""RED" cancelar");
						editCompany[playerid] = e;
						break;
					} else {
						ShowTDN_OOC(playerid, "No eres el dueño de esta empresa.");
						break;
					}
				}
			}
			break;
		}
	}
	return 1;
}

cmd:editarempresa(playerid, params[]){
	new indx;
	if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
		if(!sscanf(params, "i", indx)){
	    	if(indx >= 0 && indx < MAX_COMPANIES){
	    		if(!companyData[indx][loadedd]) return ShowTDN_OOC(playerid, "La empresa no esta creada");
	    		editCompany[playerid] = indx;
	    		new stringgg[QUERY_LOW];
	    		format(stringgg, sizeof(stringgg), ""CAPTION_DIALOG_TITLE" Company ID: %i", indx);
	    		ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY, DIALOG_STYLE_LIST, stringgg, "Editar ID puerta\nEditar ID puerta garaje\nEditar direccion\nEditar tipo\nEditar precio\nEditar posicion ropero\nEditar posicion crafteo\nEditar posicion trabajo\nEditar posicion despacho interior\nEditar posicion despacho exterior", "Continuar", ""RED" cancelar");
	    	} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarempresa [indx]");
	    } else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarempresa [indx]");
    } else ShowTDN_OOC(playerid, "No tienes permisos");
    return 1;
}