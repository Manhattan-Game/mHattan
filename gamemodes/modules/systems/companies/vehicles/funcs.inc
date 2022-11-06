showVehiclesMenuCraft(playerid, empindexx){
	new types, string[QUERY_LOW];
	switch(companyData[empindexx][type_company]){
		case 1: types = VEHICLES_TYPE_CARS2DOORS;
		case 2: types = VEHICLES_TYPE_CARS4DOORS;
		case 3: types = VEHICLES_TYPE_SPORTS;

	}
	for(new i;i<sizeof(vehiclesModelData);i++){
		if(vehiclesModelData[i][type] == types){
			format(string, sizeof(string), "%s", vehiclesModelData[i][name]);
			addDialogItem(playerid, vehiclesModelData[i][model], string);
		}
	}
	ShowPlayerDialogItem(playerid, DIALOG_ITEMS_CRAFT_PRODUCT_VEHI, "Producir", "Cancelar");
}