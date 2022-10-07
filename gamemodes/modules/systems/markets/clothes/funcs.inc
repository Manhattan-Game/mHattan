showMarketSkins(playerid){
    new string[QUERY_LOW];
    new index = editMarket[playerid];
    new indexSkin;
    if(index != -1){
        for(new i;i<20;i++){
            if(marketData[index][item][i] > 0){
                indexSkin = marketData[index][item][i];
                format(string, sizeof(string), "%s $%i", skinsModelData[indexSkin][name], skinsModelData[indexSkin][price]);
                addDialogItem(playerid, skinsModelData[indexSkin][model], string); 
            }
        }
        ShowPlayerDialogItem(playerid, DIALOG_SELL_SELECT_SKIN_MARKET, "SKINS", "Comprar");
    }
    
}
showAllSkins(playerid){
    new string[QUERY_LOW];
    for(new i;i<sizeof(skinsModelData);i++){
        format(string, sizeof(string), "%s $%i", skinsModelData[i][name], skinsModelData[i][price]);
        addDialogItem(playerid, skinsModelData[i][model], string);
        
    }
    ShowPlayerDialogItem(playerid, DIALOG_SELL_SELECT_SKIN, "SKINS", "Comprar");
}