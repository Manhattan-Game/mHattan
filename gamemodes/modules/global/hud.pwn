#include <YSI_Coding\y_hooks>
new Text:HUD_TD[2];
new PlayerText:HUD_PTD[MAX_PLAYERS][4];
new Text:NEEDS_TD[5];


new BAR_LIFE[MAX_PLAYERS] = 0;
new BAR_ARMOR[MAX_PLAYERS] = 0;
new BAR_DRUGS[MAX_PLAYERS] = 0;
new BAR_URINE[MAX_PLAYERS] = 0;
new BAR_THIRST[MAX_PLAYERS] = 0;
new BAR_HUNGRY[MAX_PLAYERS] = 0;
new BAR_FATIGUE[MAX_PLAYERS] = 0;
new BAR_STRESS[MAX_PLAYERS] = 0;


hook OnGameModeInit(){
	HUD_TD[0] = TextDrawCreate(495.981201, 20.250007, "mdl-2001:box_box");
	TextDrawTextSize(HUD_TD[0], 135.000000, 83.000000);
	TextDrawAlignment(HUD_TD[0], 1);
	TextDrawColor(HUD_TD[0], 336860415);
	TextDrawSetShadow(HUD_TD[0], 0);
	TextDrawBackgroundColor(HUD_TD[0], 255);
	TextDrawFont(HUD_TD[0], 4);
	TextDrawSetProportional(HUD_TD[0], 0);

	HUD_TD[1] = TextDrawCreate(505.051513, 30.749990, "box");
	TextDrawLetterSize(HUD_TD[1], 0.000000, 6.954612);
	TextDrawTextSize(HUD_TD[1], 555.000000, 0.000000);
	TextDrawAlignment(HUD_TD[1], 1);
	TextDrawColor(HUD_TD[1], -1);
	TextDrawUseBox(HUD_TD[1], 1);
	TextDrawBoxColor(HUD_TD[1], 505290495);
	TextDrawSetShadow(HUD_TD[1], 0);
	TextDrawBackgroundColor(HUD_TD[1], 255);
	TextDrawFont(HUD_TD[1], 1);
	TextDrawSetProportional(HUD_TD[1], 1);



	NEEDS_TD[0] = TextDrawCreate(22.774543, 195.250000, "mdl-2001:box_box");
	TextDrawTextSize(NEEDS_TD[0], 93.000000, 125.000000);
	TextDrawAlignment(NEEDS_TD[0], 1);
	TextDrawColor(NEEDS_TD[0], 336860360);
	TextDrawSetShadow(NEEDS_TD[0], 0);
	TextDrawBackgroundColor(NEEDS_TD[0], 255);
	TextDrawFont(NEEDS_TD[0], 4);
	TextDrawSetProportional(NEEDS_TD[0], 0);

	NEEDS_TD[1] = TextDrawCreate(25.754032, 287.416687, "Cansancio");
	TextDrawLetterSize(NEEDS_TD[1], 0.270219, 1.232500);
	TextDrawAlignment(NEEDS_TD[1], 1);
	TextDrawColor(NEEDS_TD[1], -1061109505);
	TextDrawSetShadow(NEEDS_TD[1], 0);
	TextDrawBackgroundColor(NEEDS_TD[1], 255);
	TextDrawFont(NEEDS_TD[1], 1);
	TextDrawSetProportional(NEEDS_TD[1], 1);

	NEEDS_TD[2] = TextDrawCreate(26.691074, 257.666687, "Higiene");
	TextDrawLetterSize(NEEDS_TD[2], 0.270219, 1.232500);
	TextDrawAlignment(NEEDS_TD[2], 1);
	TextDrawColor(NEEDS_TD[2], -1061109505);
	TextDrawSetShadow(NEEDS_TD[2], 0);
	TextDrawBackgroundColor(NEEDS_TD[2], 255);
	TextDrawFont(NEEDS_TD[2], 1);
	TextDrawSetProportional(NEEDS_TD[2], 1);


	NEEDS_TD[3] = TextDrawCreate(27.159595, 229.666641, "Hambre");
	TextDrawLetterSize(NEEDS_TD[3], 0.270219, 1.232500);
	TextDrawAlignment(NEEDS_TD[3], 1);
	TextDrawColor(NEEDS_TD[3], -1061109505);
	TextDrawSetShadow(NEEDS_TD[3], 0);
	TextDrawBackgroundColor(NEEDS_TD[3], 255);
	TextDrawFont(NEEDS_TD[3], 1);
	TextDrawSetProportional(NEEDS_TD[3], 1);

	NEEDS_TD[4] = TextDrawCreate(27.628116, 200.499938, "Sed");
	TextDrawLetterSize(NEEDS_TD[4], 0.270219, 1.232500);
	TextDrawAlignment(NEEDS_TD[4], 1);
	TextDrawColor(NEEDS_TD[4], -1061109505);
	TextDrawSetShadow(NEEDS_TD[4], 0);
	TextDrawBackgroundColor(NEEDS_TD[4], 255);
	TextDrawFont(NEEDS_TD[4], 1);
	TextDrawSetProportional(NEEDS_TD[4], 1);
}
hook OnPlayerConnect(playerid){
	HUD_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 503.945648, 28.999988, "");
	PlayerTextDrawTextSize(playerid, HUD_PTD[playerid][0], 52.000000, 65.000000);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][0], 336860415);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, HUD_PTD[playerid][0], TEXTDRAWS_MODEL_NONE);
	PlayerTextDrawSetPreviewRot(playerid, HUD_PTD[playerid][0], 0.000000, 0.000000, 0.000000, 1.200000);

	HUD_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 561.742309, 28.416667, "");
	PlayerTextDrawLetterSize(playerid, HUD_PTD[playerid][1], 0.237422, 1.057499);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][1], 1);

	HUD_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 562.210998, 86.166648, "");
	PlayerTextDrawLetterSize(playerid, HUD_PTD[playerid][2], 0.189165, 1.022500);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][2], 8388863);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][2], 1);

	HUD_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 563.148010, 70.416671, "");
	PlayerTextDrawLetterSize(playerid, HUD_PTD[playerid][3], 0.232269, 0.929166);
	PlayerTextDrawTextSize(playerid, HUD_PTD[playerid][3], 626.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][3], 1);

}
hook OnPlayerDisconnect(playerid){
	VIEW_HUD[playerid] = 0;
	BAR_LIFE[playerid] = 0;
	BAR_ARMOR[playerid] = 0;
	BAR_DRUGS[playerid] = 0;
	BAR_URINE[playerid] = 0;
	BAR_THIRST[playerid] = 0;
	BAR_HUNGRY[playerid] = 0;
	BAR_FATIGUE[playerid] = 0;
	BAR_STRESS[playerid] = 0;
	clearAllBars(playerid);
}

cmd:hud(playerid, params){
	if(characterData[playerid][p_spawn]){
		if(VIEW_HUD[playerid] == 1){
			showNeeds(playerid);
		} else hideNeeds(playerid);
	} else ShowTDN_OOC(playerid, "Loguea primero");
}
showNeeds(playerid){
	if(characterData[playerid][p_spawn]){
		VIEW_HUD[playerid] = 0;
		for(new i;i<5;i++) {
			TextDrawShowForPlayer(playerid, NEEDS_TD[i]);
		}

		updateBarHungry(playerid);
		updateBarThirst(playerid);
		updateBarUrine(playerid);
		updateBarFatigue(playerid);
	}
}
hideNeeds(playerid){
	VIEW_HUD[playerid] = 1;
	for(new i;i<5;i++) {
		TextDrawHideForPlayer(playerid, NEEDS_TD[i]);
	}
	hideProgressBar(playerid, BAR_HUNGRY[playerid]);
	hideProgressBar(playerid, BAR_THIRST[playerid]);
	hideProgressBar(playerid, BAR_URINE[playerid]);
	hideProgressBar(playerid, BAR_FATIGUE[playerid]);
}
showHUD(playerid){
	if(characterData[playerid][p_spawn]){
		PlayerTextDrawSetString(playerid, HUD_PTD[playerid][1], GetFullName(playerid));
		updateExperience(playerid);
		updateMoney(playerid);
		for(new e;e<2;e++) TextDrawShowForPlayer(playerid, HUD_TD[e]);
		for(new i;i<4;i++) PlayerTextDrawShow(playerid, HUD_PTD[playerid][i]);

		if(BAR_LIFE[playerid] == 0) BAR_LIFE[playerid] = createProgressBar(playerid, BAR_HUD_LIFE, 563.147827, 47.666709, 625.000000, -0.026353, -1523963137, 100.0, 0);
		if(BAR_ARMOR[playerid] == 0) BAR_ARMOR[playerid] = createProgressBar(playerid, BAR_HUD_ARMOR, 563.147705, 57.583377, 625.000000, 0.067351, -2139062017, 100.0, 0);

		if(BAR_THIRST[playerid] == 0) BAR_THIRST[playerid] = createProgressBar(playerid, BAR_HUD_THIRST, 29.502212, 220.916671, 109.000000, -0.073205, -1061109505, 100.0, 0);
		if(BAR_HUNGRY[playerid] == 0) BAR_HUNGRY[playerid] = createProgressBar(playerid, BAR_HUD_HUNGRY, 29.502212, 248.916732, 109.000000, -0.073205, -1061109505, 100.0, 0);
		if(BAR_URINE[playerid] == 0) BAR_URINE[playerid] = createProgressBar(playerid, BAR_HUD_URINE, 29.033691, 276.916778, 109.000000, -0.073205, -1061109505, 100.0, 0);
		if(BAR_FATIGUE[playerid] == 0) BAR_FATIGUE[playerid] = createProgressBar(playerid, BAR_HUD_FATIGUE, 28.565170, 307.833404, 108.000000, -0.073205, -1061109505, 100.0, 0);


		updateBarLife(playerid);
		updateBarArmor(playerid);
		hideNeeds(playerid);
	}
}
updateBarLife(playerid){
	updateProgressBar(playerid, BAR_LIFE[playerid], characterData[playerid][life]);
	showProgressBar(playerid, BAR_LIFE[playerid]);
}
updateBarArmor(playerid){
	updateProgressBar(playerid, BAR_ARMOR[playerid], characterData[playerid][armor]);
	showProgressBar(playerid, BAR_ARMOR[playerid]);
}

updateBarHungry(playerid){
	updateProgressBar(playerid, BAR_HUNGRY[playerid], characterData[playerid][hungry]);
	showProgressBar(playerid, BAR_HUNGRY[playerid]);
}
updateBarThirst(playerid){
	updateProgressBar(playerid, BAR_THIRST[playerid], characterData[playerid][thirst]);
	showProgressBar(playerid, BAR_THIRST[playerid]);
}
updateBarUrine(playerid){
	updateProgressBar(playerid, BAR_URINE[playerid], characterData[playerid][urine]);
	showProgressBar(playerid, BAR_URINE[playerid]);
}
updateBarFatigue(playerid){
	updateProgressBar(playerid, BAR_FATIGUE[playerid], characterData[playerid][fatigue]);
	showProgressBar(playerid, BAR_FATIGUE[playerid]);
}


updateExperience(playerid){
	new string[QUERY_LOW];
	format(string, sizeof(string), "EXP %i/%i", characterData[playerid][exp], getExperienceFromLevel(playerid));
	PlayerTextDrawSetString(playerid, HUD_PTD[playerid][3], string);
}
updateMoney(playerid){
	new string[QUERY_LOW];
	format(string, sizeof(string), "$%i", characterData[playerid][money]);
	PlayerTextDrawSetString(playerid, HUD_PTD[playerid][2], string);
}
updateHandItem(playerid){
	PlayerTextDrawSetPreviewModel(playerid, HUD_PTD[playerid][0], inventoryModelsData[inventoryInfo[playerid][slot][8]][model]);
	PlayerTextDrawSetPreviewRot(playerid, HUD_PTD[playerid][0], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][3]);
	PlayerTextDrawShow(playerid, HUD_PTD[playerid][0]);
}