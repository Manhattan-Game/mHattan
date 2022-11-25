#include <YSI_Coding\y_hooks>

#define MAX_DIALOG_ITEMS 600
#define MAX_DIALOG_PER_PAGE_ITEMS 10 // ! Dont' please


new DIALOG_ITEMS[MAX_PLAYERS][MAX_DIALOG_ITEMS];
new DIALOG_DESCRIPTION[MAX_PLAYERS][MAX_DIALOG_ITEMS][60];
new SELECTED_ITEM[MAX_PLAYERS];
new SELECTED_PAGE[MAX_PLAYERS];
new SELECTED_DIALOGID[MAX_PLAYERS];
new Text:DIALOG_TD[3];
new PlayerText:DIALOG_PTD[MAX_PLAYERS][15];
hook OnGameModeInit(){

	DIALOG_TD[0] = TextDrawCreate(185.000000, 91.118515, "mdl-2001:box_box");
	TextDrawTextSize(DIALOG_TD[0], 276.000000, 199.000000);
	TextDrawAlignment(DIALOG_TD[0], 1);
	TextDrawColor(DIALOG_TD[0], 336860415);
	TextDrawSetShadow(DIALOG_TD[0], 0);
	TextDrawBackgroundColor(DIALOG_TD[0], 255);
	TextDrawFont(DIALOG_TD[0], 4);
	TextDrawSetProportional(DIALOG_TD[0], 0);
	TextDrawSetSelectable(DIALOG_TD[0], false);
	
	DIALOG_TD[1] = TextDrawCreate(413.333435, 248.488830, "<");
	TextDrawLetterSize(DIALOG_TD[1], 0.254333, 1.575111);
	TextDrawTextSize(DIALOG_TD[1], 420.000000, 10.000000);
	TextDrawAlignment(DIALOG_TD[1], 1);
	TextDrawColor(DIALOG_TD[1], -1);
	TextDrawUseBox(DIALOG_TD[1], 1);
	TextDrawBoxColor(DIALOG_TD[1], 0);
	TextDrawSetShadow(DIALOG_TD[1], 0);
	TextDrawFont(DIALOG_TD[1], 2);
	TextDrawSetProportional(DIALOG_TD[1], 1);
	TextDrawSetSelectable(DIALOG_TD[1], true);

	DIALOG_TD[2] = TextDrawCreate(446.000091, 248.074050, ">");
	TextDrawLetterSize(DIALOG_TD[2], 0.254333, 1.575111);
	TextDrawTextSize(DIALOG_TD[2], 453.000000, 10.000000);
	TextDrawAlignment(DIALOG_TD[2], 1);
	TextDrawColor(DIALOG_TD[2], -1);
	TextDrawUseBox(DIALOG_TD[2], 1);
	TextDrawBoxColor(DIALOG_TD[2], 0);
	TextDrawSetShadow(DIALOG_TD[2], 0);
	TextDrawFont(DIALOG_TD[2], 1);
	TextDrawSetProportional(DIALOG_TD[2], 1);
	TextDrawSetSelectable(DIALOG_TD[2], true);
}

hook OnPlayerConnect(playerid){
	DIALOG_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 189.666687, 98.325881, "Muebles");
	PlayerTextDrawLetterSize(playerid, DIALOG_PTD[playerid][0], 0.264999, 1.504592);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][0], 1);

	DIALOG_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 188.000045, 117.666671, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][1], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][1], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][1], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][1], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 242.000061, 117.666679, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][2], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][2], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][2], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][2], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 296.000061, 117.666648, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][3], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][3], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][3], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][3], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 350.666809, 117.666679, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][4], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][4], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][4], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][4], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][4], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 405.333587, 117.666633, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][5], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][5], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][5], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][5], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 188.333541, 182.792510, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][6], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][6], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][6], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][6], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][6], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][6], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 243.000152, 183.207290, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][7], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][7], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][7], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][7], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][7], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][7], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][8] = CreatePlayerTextDraw(playerid, 296.333496, 182.792526, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][8], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][8], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][8], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][8], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][8], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][8], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][8], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][9] = CreatePlayerTextDraw(playerid, 350.666870, 182.377746, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][9], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][9], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][9], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][9], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][9], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][9], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][9], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 405.000274, 182.792526, "");
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][10], 51.000000, 61.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][10], 505290480);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][10], 5);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][10], true);
	PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][10], 0);
	PlayerTextDrawSetPreviewRot(playerid, DIALOG_PTD[playerid][10], 0.000000, 0.000000, 0.000000, 1.000000);

	DIALOG_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 189.666717, 252.637100, "Descripcion:");
	PlayerTextDrawLetterSize(playerid, DIALOG_PTD[playerid][11], 0.173000, 1.073185);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][11], 255);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][11], 1);

	DIALOG_PTD[playerid][12] = CreatePlayerTextDraw(playerid, 427.666717, 250.148223, "1/1");
	PlayerTextDrawLetterSize(playerid, DIALOG_PTD[playerid][12], 0.173000, 1.073185);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][12], 1);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][12], 255);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][12], 1);

	DIALOG_PTD[playerid][13] = CreatePlayerTextDraw(playerid, 257.666748, 265.911102, "Button1");
	PlayerTextDrawLetterSize(playerid, DIALOG_PTD[playerid][13], 0.277333, 1.351111);
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][13], 10.000000, 136.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][13], 2);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][13], -1);
	PlayerTextDrawUseBox(playerid, DIALOG_PTD[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, DIALOG_PTD[playerid][13], 54473727);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][13], 255);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][13], true);

	DIALOG_PTD[playerid][14] = CreatePlayerTextDraw(playerid, 393.333343, 265.911010, "Cancelar");
	PlayerTextDrawLetterSize(playerid, DIALOG_PTD[playerid][14], 0.277333, 1.351111);
	PlayerTextDrawTextSize(playerid, DIALOG_PTD[playerid][14], 10.000000, 121.000000);
	PlayerTextDrawAlignment(playerid, DIALOG_PTD[playerid][14], 2);
	PlayerTextDrawColor(playerid, DIALOG_PTD[playerid][14], -1);
	PlayerTextDrawUseBox(playerid, DIALOG_PTD[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, DIALOG_PTD[playerid][14], 336860415);
	PlayerTextDrawSetShadow(playerid, DIALOG_PTD[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][14], 255);
	PlayerTextDrawFont(playerid, DIALOG_PTD[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, DIALOG_PTD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, DIALOG_PTD[playerid][14], true);
	clearDialogItem(playerid);
}
hook OP_ClickTextDraw(playerid, Text:clickedid){
	if(clickedid == DIALOG_TD[1]){
		if(SELECTED_PAGE[playerid] > 0){
			SELECTED_PAGE[playerid]--;
			updatePage(playerid);
		}
	}else if(clickedid == DIALOG_TD[2]){
		if(SELECTED_PAGE[playerid] < getTotalPages(playerid) - 1){
			SELECTED_PAGE[playerid]++;
			updatePage(playerid);
		}
	}

}
hook OP_ClickPlayerTextDraw(playerid, PlayerText:playertextid){
	for(new i=1; i<11; i++){
		if(playertextid == DIALOG_PTD[playerid][i]){
			selectDialogItem(playerid, i);
		}
	}
	if(playertextid == DIALOG_PTD[playerid][13]){
		new index;
		if(SELECTED_PAGE[playerid] > 0){
			index = MAX_DIALOG_PER_PAGE_ITEMS * SELECTED_PAGE[playerid];
		}
		index = index + SELECTED_ITEM[playerid];
		CallRemoteFunction("OnPlayerDialogItem", "ddddb", playerid, SELECTED_DIALOGID[playerid], index-1, DIALOG_ITEMS[playerid][index-1], true);
		clearDialogItem(playerid);
	} else if(playertextid == DIALOG_PTD[playerid][14]) {
		clearDialogItem(playerid);
		CallRemoteFunction("OnPlayerDialogItem", "ddddb", playerid, 0, 0, 0, false);

	}
}


forward OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response);
public OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){

}

ShowPlayerDialogItem(playerid, dialogid, const title[], const button[]){
	SELECTED_DIALOGID[playerid] = dialogid;
	SELECTED_ITEM[playerid] = 1;
	PlayerTextDrawSetString(playerid, DIALOG_PTD[playerid][0], title);
	PlayerTextDrawSetString(playerid, DIALOG_PTD[playerid][13], button);
	PlayerTextDrawShow(playerid, DIALOG_PTD[playerid][0]);
	for(new e;e<3;e++) TextDrawShowForPlayer(playerid, DIALOG_TD[e]);
	for(new j=11;j<15;j++) PlayerTextDrawShow(playerid, DIALOG_PTD[playerid][j]);
	characterData[playerid][viewTextdraw] = TEXTDRAWS_DIALOG_ITEM;
	updatePage(playerid);
	selectDialogItem(playerid, SELECTED_ITEM[playerid]);
	SelectTextDraw(playerid, 0x87868286);
}
addDialogItem(playerid, modelid, const descriptionn[]){
	new index = getFreeDialogItemSlot(playerid);
	if(index != -1){
		DIALOG_ITEMS[playerid][index] = modelid;
		format(DIALOG_DESCRIPTION[playerid][index], 60, "%s", descriptionn);
	}
}
updatePage(playerid){
	if(characterData[playerid][viewTextdraw] == TEXTDRAWS_DIALOG_ITEM){
		new indexTD;
		if(SELECTED_PAGE[playerid] > 0){
			indexTD = MAX_DIALOG_PER_PAGE_ITEMS * SELECTED_PAGE[playerid];
		}
		
		for(new i=1; i<MAX_DIALOG_PER_PAGE_ITEMS+1; i++){
			if(DIALOG_ITEMS[playerid][(indexTD + i) -1] != TEXTDRAWS_MODEL_NONE){
				PlayerTextDrawSetPreviewModel(playerid, DIALOG_PTD[playerid][i], DIALOG_ITEMS[playerid][(indexTD + i) -1]);
				//PlayerTextDrawSetPreviewRot(playerid, inventarioTDD[playerid][oldindex], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][i]][root][3]);
				PlayerTextDrawShow(playerid, DIALOG_PTD[playerid][i]);
			}else PlayerTextDrawHide(playerid, DIALOG_PTD[playerid][i]);
			
		}
		new string[QUERY_LOW];
		format(string, sizeof(string), "%i/%i", SELECTED_PAGE[playerid] + 1, getTotalPages(playerid));
		PlayerTextDrawSetString(playerid, DIALOG_PTD[playerid][12], string);
	}

}
selectDialogItem(playerid, itemid){
	new oldindex = SELECTED_ITEM[playerid];
	new index = itemid;
	new otherOldIndex = 1;
	if(SELECTED_PAGE[playerid] > 0) {
		index = itemid + (MAX_DIALOG_PER_PAGE_ITEMS * SELECTED_PAGE[playerid]);
		otherOldIndex = oldindex + (MAX_DIALOG_PER_PAGE_ITEMS * SELECTED_PAGE[playerid]);
	}

	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][oldindex], 505290480);
	if(DIALOG_ITEMS[playerid][otherOldIndex-1] != TEXTDRAWS_MODEL_NONE){
		PlayerTextDrawShow(playerid, DIALOG_PTD[playerid][oldindex]);
	}

	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][itemid], 473720575);
	if(getCountDialogItems(playerid) > 0) PlayerTextDrawShow(playerid, DIALOG_PTD[playerid][itemid]);

	new string[QUERY_LOW];
	format(string, sizeof(string), "Descripcion: %s", DIALOG_DESCRIPTION[playerid][index-1]);
	PlayerTextDrawSetString(playerid, DIALOG_PTD[playerid][11], string);

	SELECTED_ITEM[playerid] = itemid;
}
clearDialogItem(playerid){
	PlayerTextDrawBackgroundColor(playerid, DIALOG_PTD[playerid][SELECTED_ITEM[playerid]], 505290480);
	for(new i; i<MAX_DIALOG_ITEMS; i++){
		DIALOG_ITEMS[playerid][i] = TEXTDRAWS_MODEL_NONE;
	}
	SELECTED_ITEM[playerid] = 0;
	SELECTED_PAGE[playerid] = 0;
	for(new e;e<3;e++) TextDrawHideForPlayer(playerid, DIALOG_TD[e]);
	for(new j;j<15;j++) PlayerTextDrawHide(playerid, DIALOG_PTD[playerid][j]);
	CancelSelectTextDraw(playerid);
	characterData[playerid][viewTextdraw] = -1;
}
getCountDialogItems(playerid){
	new total;
	for(new i; i<MAX_DIALOG_ITEMS; i++){
		if(DIALOG_ITEMS[playerid][i] != TEXTDRAWS_MODEL_NONE) total++;
	}
	return total;
}
getTotalPages(playerid){
	new totalitems = getCountDialogItems(playerid);
	new totalPages = totalitems / MAX_DIALOG_PER_PAGE_ITEMS;
	if(totalPages == 0) totalPages++;
	return totalPages;

}
getFreeDialogItemSlot(playerid){
	for(new i; i<MAX_DIALOG_ITEMS; i++){
		if(DIALOG_ITEMS[playerid][i] == TEXTDRAWS_MODEL_NONE) return i;
	}
	return -1;
}