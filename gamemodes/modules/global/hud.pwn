#include <YSI_Coding\y_hooks>
new Text:HUD_TD[2];
new PlayerText:HUD_PTD[MAX_PLAYERS][4];


new BAR_LIFE[MAX_PLAYERS] = 0;
new BAR_ARMOR[MAX_PLAYERS] = 0;
new BAR_DRUGS[MAX_PLAYERS] = 0;
new BAR_URINE[MAX_PLAYERS] = 0;
new BAR_THIRST[MAX_PLAYERS] = 0;
new BAR_HUNGRY[MAX_PLAYERS] = 0;
new BAR_FATIGUE[MAX_PLAYERS] = 0;
new BAR_STRESS[MAX_PLAYERS] = 0;


hook OnGameModeInit(){
	HUD_TD[0] = TextDrawCreate(475.666778, 19.770351, "mdl-2001:box_hud");
	TextDrawTextSize(HUD_TD[0], 156.000000, 151.000000);
	TextDrawAlignment(HUD_TD[0], 1);
	TextDrawColor(HUD_TD[0], -1);
	TextDrawSetShadow(HUD_TD[0], 0);
	TextDrawBackgroundColor(HUD_TD[0], 255);
	TextDrawFont(HUD_TD[0], 4);
	TextDrawSetProportional(HUD_TD[0], 0);


	HUD_TD[1] = TextDrawCreate(475.666778, 19.770351, "mdl-2001:box_needs");
	TextDrawTextSize(HUD_TD[1], 156.000000, 151.000000);
	TextDrawAlignment(HUD_TD[1], 1);
	TextDrawColor(HUD_TD[1], -1);
	TextDrawSetShadow(HUD_TD[1], 0);
	TextDrawBackgroundColor(HUD_TD[1], 255);
	TextDrawFont(HUD_TD[1], 4);
	TextDrawSetProportional(HUD_TD[1], 0);
}
hook OnPlayerConnect(playerid){
	HUD_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 487.999969, 42.740749, "Adelle_Blansec");
	PlayerTextDrawLetterSize(playerid, HUD_PTD[playerid][0], 0.188333, 1.056592);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][0], 842150655);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][0], 1);

	HUD_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 615.332702, 41.911113, "$100000000000");
	PlayerTextDrawLetterSize(playerid, HUD_PTD[playerid][1], 0.139999, 0.674963);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][1], 3);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][1], 842150655);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][1], 1);

	HUD_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 587.666870, 67.214828, "6/7");
	PlayerTextDrawLetterSize(playerid, HUD_PTD[playerid][2], 0.188333, 1.056592);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][2], 842150655);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][2], 255);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][2], 1);

	HUD_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 585.333190, 114.762954, "");
	PlayerTextDrawTextSize(playerid, HUD_PTD[playerid][3], 52.000000, 43.000000);
	PlayerTextDrawAlignment(playerid, HUD_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, HUD_PTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, HUD_PTD[playerid][3], 0xFF000000);
	PlayerTextDrawSetShadow(playerid, HUD_PTD[playerid][3], 0);
	PlayerTextDrawFont(playerid, HUD_PTD[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, HUD_PTD[playerid][3], 0);
	PlayerTextDrawSetPreviewModel(playerid, HUD_PTD[playerid][3], 19382);
	PlayerTextDrawSetPreviewRot(playerid, HUD_PTD[playerid][3], 0.000000, 0.000000, 0.000000, 1.000000);
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
		TextDrawHideForPlayer(playerid, HUD_TD[0]);
		for(new i;i<3;i++) PlayerTextDrawHide(playerid, HUD_PTD[playerid][i]);
		hideProgressBar(playerid, BAR_LIFE[playerid]);
		hideProgressBar(playerid, BAR_ARMOR[playerid]);
		VIEW_HUD[playerid] = 0;
		TextDrawShowForPlayer(playerid, HUD_TD[1]);

		updateBarDrugs(playerid);
		updateBarHungry(playerid);
		updateBarThirst(playerid);
		updateBarUrine(playerid);
		updateBarFatigue(playerid);
		updateBarStress(playerid);
	}
}
hideNeeds(playerid){
	TextDrawHideForPlayer(playerid, HUD_TD[1]);
	hideProgressBar(playerid, BAR_DRUGS[playerid]);
	hideProgressBar(playerid, BAR_HUNGRY[playerid]);
	hideProgressBar(playerid, BAR_THIRST[playerid]);
	hideProgressBar(playerid, BAR_URINE[playerid]);
	hideProgressBar(playerid, BAR_FATIGUE[playerid]);
	hideProgressBar(playerid, BAR_STRESS[playerid]);
	showHUD(playerid);
}
showHUD(playerid){
	if(characterData[playerid][p_spawn]){
		VIEW_HUD[playerid] = 1;
		PlayerTextDrawSetString(playerid, HUD_PTD[playerid][0], GetFullName(playerid));
		updateExperience(playerid);
		updateMoney(playerid);
		TextDrawShowForPlayer(playerid, HUD_TD[0]);
		for(new i;i<3;i++) PlayerTextDrawShow(playerid, HUD_PTD[playerid][i]);

		if(BAR_LIFE[playerid] == 0) BAR_LIFE[playerid] = createProgressBar(playerid, BAR_HUD_LIFE, 498.666687, 63.481460, 561.000000, 0.233332, 842150655, 100.0, 0);
		if(BAR_ARMOR[playerid] == 0) BAR_ARMOR[playerid] = createProgressBar(playerid, BAR_HUD_ARMOR, 498.666595, 77.585166, 561.000000, 0.233332, 842150655, 100.0, 0);

		if(BAR_DRUGS[playerid] == 0) BAR_DRUGS[playerid] = createProgressBar(playerid, BAR_HUD_DRUGS, 498.666656, 54.355552, 547.000000, 0.233332, 842150655, 100.0, 0);
		if(BAR_HUNGRY[playerid] == 0) BAR_HUNGRY[playerid] = createProgressBar(playerid, BAR_HUD_HUNGRY, 498.666656, 66.355552, 547.000000, 0.233332, 842150655, 100.0, 0);
		if(BAR_THIRST[playerid] == 0) BAR_THIRST[playerid] = createProgressBar(playerid, BAR_HUD_THIRST, 498.666656, 76.355552, 547.000000, 0.233332, 842150655, 100.0, 0);

		if(BAR_URINE[playerid] == 0) BAR_URINE[playerid] = createProgressBar(playerid, BAR_HUD_URINE, 564.333435, 54.355552, 607.000000, 0.233332, 842150655, 100.0, 0);
		if(BAR_FATIGUE[playerid] == 0) BAR_FATIGUE[playerid] = createProgressBar(playerid, BAR_HUD_FATIGUE, 564.333435, 66.355552, 607.000000, 0.233332, 842150655, 100.0, 0);
		if(BAR_STRESS[playerid] == 0) BAR_STRESS[playerid] = createProgressBar(playerid, BAR_HUD_STRESS, 564.333435, 76.355552, 607.000000, 0.233332, 842150655, 100.0, 0);


		updateBarLife(playerid);
		updateBarArmor(playerid);
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
updateBarDrugs(playerid){
	updateProgressBar(playerid, BAR_DRUGS[playerid], characterData[playerid][drugs]);
	showProgressBar(playerid, BAR_DRUGS[playerid]);
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
updateBarStress(playerid){
	updateProgressBar(playerid, BAR_STRESS[playerid], characterData[playerid][stress]);
	showProgressBar(playerid, BAR_STRESS[playerid]);
}

updateExperience(playerid){
	new string[QUERY_LOW];
	format(string, sizeof(string), "%i/%i", characterData[playerid][exp], getExperienceFromLevel(playerid));
	PlayerTextDrawSetString(playerid, HUD_PTD[playerid][2], string);
}
updateMoney(playerid){
	new string[QUERY_LOW];
	format(string, sizeof(string), "$%i", characterData[playerid][money]);
	PlayerTextDrawSetString(playerid, HUD_PTD[playerid][1], string);
}
updateHandItem(playerid){
	PlayerTextDrawSetPreviewModel(playerid, HUD_PTD[playerid][3], inventoryModelsData[inventoryInfo[playerid][slot][8]][model]);
	PlayerTextDrawSetPreviewRot(playerid, HUD_PTD[playerid][3], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][0], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][1], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][2], inventoryModelsData[inventoryInfo[playerid][slot][8]][root][3]);
	PlayerTextDrawShow(playerid, HUD_PTD[playerid][3]);
}