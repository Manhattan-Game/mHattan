#include <YSI_Coding\y_hooks>
hook OnGameModeInit(){
	CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/mercado", 0xFFFFFFFF, 5126.4902,490.7930, 5.8064, 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0);
	CreateDynamic3DTextLabel(""GREY"Utiliza "ORANGE"/mercadoenvios", 0xFFFFFFFF, 5117.5137,474.4400, 5.8176, 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0);
}
cmd:mercado(playerid, params[]){
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 5126.4902,490.7930, 5.8064)){
		ShowPlayerDialog(playerid, DIALOG_TRADES, DIALOG_STYLE_LIST,  ""CAPTION_DIALOG_TITLE" Mercado", "Muebles\nVehiculos", "Continuar", ""RED" cancelar");
	} else ShowTDN_OOC(playerid, "No estas en el mercado.");
}
cmd:mercadoenvios(playerid, params[]){
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 5117.5137,474.4400, 5.8176)){
		showTradesToDeliveried(playerid);
	} else ShowTDN_OOC(playerid, "No estas en mercado envios.");
}
hook OnPlayerConnect(playerid){
	editCompany[playerid] = -1;
}
hook OnPlayerDisconnect(playerid, reason){
	saveCompanies();
}
hook OnGameModeExit(){
	saveCompanies();
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
								format(stringtwo, sizeof(stringtwo), "%i - %s \n", i +1, companyModelData[i][name]);
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
						case 10: ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_CLOTHES, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" COMPANY", "Mujer\nHombre", "Continuar", ""RED" cancelar");
					}
				} else editCompany[playerid] = -1;
			} else editCompany[playerid] = -1;
		}
		case DIALOG_EDIT_COMPANY_CLOTHES:{
			if(response){
				switch(listitem){
					case 0:	ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_CLOTHES_FEMALE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un ID Skin", "Continuar", ""RED" cancelar");
					case 1: ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_CLOTHES_MALE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un ID Skin", "Continuar", ""RED" cancelar");
				}
			} else editCompany[playerid] = -1;
		}
		case DIALOG_EDIT_COMPANY_CLOTHES_MALE:{
			if(response){
				if(IsNumeric(inputtext)){
					new indxx = editCompany[playerid];
					companyData[indxx][jobs_skins][0] = strval(inputtext);
					ShowTDN_OOC(playerid, "Editaste el skin HOMBRE");
					editCompany[playerid] = -1;
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_CLOTHES_MALE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un ID Skin", "Continuar", ""RED" cancelar");
			} else editCompany[playerid] = -1;
		}
		case DIALOG_EDIT_COMPANY_CLOTHES_FEMALE:{
			if(response){
				if(IsNumeric(inputtext)){
					new indxx = editCompany[playerid];
					companyData[indxx][jobs_skins][1] = strval(inputtext);
					ShowTDN_OOC(playerid, "Editaste el skin MUJER");
					editCompany[playerid] = -1;
				} else ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY_CLOTHES_FEMALE, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un ID Skin", "Continuar", ""RED" cancelar");
			} else editCompany[playerid] = -1;
		}
		case DIALOG_EDIT_COMPANY_DIRECTION: {
			if(response){
				new indxx = editCompany[playerid];
				new indxdoor = getIndexDoorByID(companyData[indxx][doorid]);
				format(companyData[indxx][direction], 60, "%s", inputtext);
				destroyDynamicCompany(indxx);
				loadCompany(indxx, indxdoor);
				ShowTDN_OOC(playerid, "Editaste la direccion.");
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
				ShowTDN_OOC(playerid, "Editaste el tipo.");
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
					ShowTDN_OOC(playerid, "Editaste el precio.");
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
						ShowTDN_OOC(playerid, "La caja fuerte no tiene ese monto.");
						editCompany[playerid] = -1;
					}
					
				} else ShowPlayerDialog(playerid, DIALOG_MY_COMPANY_WITHDRAW, DIALOG_STYLE_INPUT, ""CAPTION_DIALOG_TITLE" COMPANY", "Ingresa un monto(Solo numeros)", "Continuar", ""RED" cancelar");
			} else editCompany[playerid] = -1;
		}
		case DIALOG_CRAFT_COMPANY: {
			if(response){
				new bool:isAmmount = false;
				new indexes[3];
				new indexInventory = companyModelData[companyData[editCompany[playerid]][type_company]][fabItems][selectCraft[playerid]];
				new value;
				for(new i;i<3;i++){
					if(inventoryModelsData[indexInventory][crafteableItems][i] != -1){
						indexes[i] = findItemById(playerid, inventoryModelsData[indexInventory][crafteableItems][i]);
						if(indexes[i] != -1){
							value = inventoryModelsData[indexInventory][crafteableAmmounts][i];
							if(inventoryModelsData[indexInventory][crafteableAmmounts][i] > 1){
								value--;
							}
							if(!findItemByAmmount(playerid, indexes[i], value)){
								isAmmount = true;
								break;
							}
						} else {
							isAmmount = true;
							break;
						}
					}
				}
				if(!isAmmount){
					new ittemm = addItem(playerid, indexInventory, 1);
					if(ittemm != -1){
						for(new e;e<3;e++){
							if(indexes[e] != -1){
								value = inventoryModelsData[indexInventory][crafteableAmmounts][e];
								if(inventoryModelsData[indexInventory][crafteableAmmounts][e] > 1){
									value--;
								}
								if(findItemByAmmount(playerid, indexes[e], inventoryModelsData[indexInventory][crafteableAmmounts][e])){
									changeItemAmmount(playerid, indexes[e], inventoryInfo[playerid][ammount][indexes[e]] - inventoryModelsData[indexInventory][crafteableAmmounts][e]);
								} else removeItem(playerid, indexes[e]);
							}
						}
						ShowTDN_OOC(playerid, "Crafteaste un objeto");
						editCompany[playerid] = -1;
						selectCraft[playerid] = -1;
					} else {
						ShowTDN_OOC(playerid, "No tienes espacio en el inventario.");
						editCompany[playerid] = -1;
						selectCraft[playerid] = -1;
					}
				} else {
					ShowTDN_OOC(playerid, "No tienes los elementos o la cantidad necesaria.");
					editCompany[playerid] = -1;
					selectCraft[playerid] = -1;
				} 
			} else {
				editCompany[playerid] = -1;
				selectCraft[playerid] = -1;
			}
		}
		case DIALOG_CRAFT_COMPANY_PRODUCT: {
			if(response){
				new indexx = getFreeCraftingIndex(playerid);
				new isItem = findItemById(playerid, companyModelData[companyData[editCompany[playerid]][type_company]][fabItems][listitem]);
				if(isItem != -1){
					if(indexx != -1){
						craftingData[indexx][crafting][listitem]++;
						changeItemAmmount(playerid, isItem, inventoryInfo[playerid][ammount][isItem] - 1);
						ShowTDN_OOC(playerid, "Añadiste un objeto al trabajo.");
						editCompany[playerid] = -1;
						craftingIsReady(playerid, indexx);
					} else {
						ShowTDN_OOC(playerid, "No tienes un trabajo activo.");
						editCompany[playerid] = -1;
					}

				} else {
					ShowTDN_OOC(playerid, "No tienes este objeto en el inventario.");
					editCompany[playerid] = -1;
				}
			} else editCompany[playerid] = -1;
		}
	}
}
hook OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){
	if(dialogid == DIALOG_ITEMS_CRAFT){
		if(response){
			if(getCountDialogItems(playerid) > 0){
				new indexInventory = companyModelData[companyData[editCompany[playerid]][type_company]][fabItems][index];
				selectCraft[playerid] = index;
				new stringgg[QUERY_MEDIUM], stringtwo[QUERY_LOW];
				new indexCraftInventory;
				for(new i;i<3;i++){
					if(inventoryModelsData[indexInventory][crafteableItems][i] != -1){
						indexCraftInventory = inventoryModelsData[indexInventory][crafteableItems][i];
						format(stringtwo, sizeof(stringtwo), "%s x%i \n", inventoryModelsData[indexCraftInventory][name], inventoryModelsData[indexInventory][crafteableAmmounts][i]);
						strcat(stringgg, stringtwo);
					}
				}
				ShowPlayerDialog(playerid, DIALOG_CRAFT_COMPANY, DIALOG_STYLE_LIST, "Necesitas los siguientes objetos:", stringgg, "Continuar", ""RED" cancelar");
			} else ShowTDN_OOC(playerid, "No hay nada que craftear.");
			
		} else editCompany[playerid] = -1;
	} 
}
cmd:crearempresa(playerid, params[]){
	new typee;
    if(characterData[playerid][p_spawn]){
    	if(accounts[playerid][_admin] > STAFF_RANK_ADMINISTRATOR_C){
    		if(!sscanf(params, "i", typee)){
	    		if(typee >= 0 && typee < 2){
	    			new DOOR_TYPS;
	    			if(typee == 0){
	    				DOOR_TYPS = DOOR_TYPE_INTERIOR;
	    			} else DOOR_TYPS = DOOR_TYPE_PHYSICAL;
	    			createDoor(playerid, DOOR_TYPS, characterData[playerid][listid], TYPE_COMPANIES, typee);
	    		} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /crearempresa [TIPO: 0= Interior, 1=Puerta Fisica]");

	    	}else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY"/crearempresa [TIPO: 0= Interior, 1=Puerta Fisica]");
	    }
    }
    return 1;
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
	    		if(!companyData[indx][loadedd]) return ShowTDN_OOC(playerid, "La empresa no esta creada.");
	    		editCompany[playerid] = indx;
	    		new stringgg[QUERY_LOW];
	    		format(stringgg, sizeof(stringgg), ""CAPTION_DIALOG_TITLE" Company ID: %i", indx);
	    		ShowPlayerDialog(playerid, DIALOG_EDIT_COMPANY, DIALOG_STYLE_LIST, stringgg, "Editar ID puerta\nEditar ID puerta garaje\nEditar direccion\nEditar tipo\nEditar precio\nEditar posicion ropero\nEditar posicion crafteo\nEditar posicion trabajo\nEditar posicion despacho interior\nEditar posicion despacho exterior\nEdita ropa trabajo", "Continuar", ""RED" cancelar");
	    	} else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarempresa [indx]");
	    } else SendClientMessage(playerid, -1, ""CAPTION_TEXT_TITLE" "GREY" /editarempresa [indx]");
    } else ShowTDN_OOC(playerid, "No tienes permisos");
    return 1;
}
cmd:cambiarme(playerid, params[]){
	new indxdoor;
	for(new i;i<MAX_COMPANIES;i++){
		if(companyData[i][listid] > 0){
			if(IsPlayerInRangeOfPoint(playerid, 3.0, companyData[i][room_pos][0], companyData[i][room_pos][1], companyData[i][room_pos][2])){
				indxdoor = getIndexDoorByID(companyData[i][doorid]);
				if(doorsInfo[indxdoor][exitVw] == GetPlayerVirtualWorld(playerid)){
					if(characterData[playerid][skin] == GetPlayerSkin(playerid)){
						if(characterData[playerid][sex] == GENDER_MALE){
						SetPlayerSkin(playerid, companyData[i][jobs_skins][0]);
						} else SetPlayerSkin(playerid, companyData[i][jobs_skins][1]);
					} else SetPlayerSkin(playerid, characterData[playerid][skin]);
					ShowTDN_OOC(playerid, "Te cambiaste de ropa.");
					break;
				}
			}
		}
	}
}
cmd:craftear(playerid, params[]){
	new indxdoor;
	for(new i;i<MAX_COMPANIES;i++){
		if(companyData[i][listid] > 0){
			if(IsPlayerInRangeOfPoint(playerid, 3.0, companyData[i][job_pos][0], companyData[i][job_pos][1], companyData[i][job_pos][2])){
				indxdoor = getIndexDoorByID(companyData[i][doorid]);
				if(doorsInfo[indxdoor][exitVw] == GetPlayerVirtualWorld(playerid)){
					new indexClothe = 0;
					if(characterData[playerid][sex] == GENDER_FEMALE){
						indexClothe = 1;
					}
					if(companyData[i][jobs_skins][indexClothe] == GetPlayerSkin(playerid)){
						showCraftMenu(playerid, i);
						break;
					}else {
						ShowTDN_OOC(playerid, "No tienes puesta la ropa de trabajo.");
						break;
					}
				}
			}
		}
	}
}

cmd:trabajar(playerid, params[]){
	new indxdoor;
	for(new i;i<MAX_COMPANIES;i++){
		if(companyData[i][listid] > 0){
			if(IsPlayerInRangeOfPoint(playerid, 3.0, companyData[i][job_pos][3], companyData[i][job_pos][4], companyData[i][job_pos][5])){
				indxdoor = getIndexDoorByID(companyData[i][doorid]);
				if(doorsInfo[indxdoor][exitVw] == GetPlayerVirtualWorld(playerid)){
					new indexClothe = 0;
					if(characterData[playerid][sex] == GENDER_FEMALE){
						indexClothe = 1;
					}
					if(companyData[i][jobs_skins][indexClothe] == GetPlayerSkin(playerid)){
						new craftidx = getFreeCraftingIndex(playerid);
						if(craftidx != -1){
							showProgressCrafting(playerid, craftidx);
						} else showCraftProductMenu(playerid, i);
						break;
					}else {
						ShowTDN_OOC(playerid, "No tienes puesta la ropa de trabajo.");
						break;
					}
				}
			}
		}
	}
}