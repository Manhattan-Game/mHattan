#include <YSI_Coding\y_hooks>

hook OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){
	if(dialogid == DIALOG_ITEMS_CRAFT_PRODUCT_VEHI){
		if(response){
			if(getCountDialogItems(playerid) > 0){
				for(new i;i<sizeof(vehiclesModelData); i++){
					if(vehiclesModelData[i][model] == modelid){
						createCrafting(playerid, companyData[editCompany[playerid]][type_company], i, editCompany[playerid], vehiclesModelData[i][price], 1);
						editCompany[playerid] = -1;
						break;
					}
				}
				
			} else ShowTDN_IC(playerid, "No hay nada que producir.");
			
		} else editCompany[playerid] = -1;
	}
}