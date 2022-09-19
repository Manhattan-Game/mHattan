#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    if(dialogid == DIALOG_SELECT_MARKET_SELL_SKIN){
        if(response){
            setSkin(playerid, skinsModelData[selectedIndexItem[playerid]][model]);
            ShowTDN_OOC(playerid, "Cambiaste de ropa.");
            selectedIndexItem[playerid] = -1;
        }else{
            //falta
        }
    }
}
hook OnPlayerDialogItem(playerid, dialogid, index, modelid, bool:response){
    switch(dialogid){
        case DIALOG_SELL_SELECT_SKIN: {
            if(response){
                if(getCountDialogItems(playerid) > 0){
                finishEditItem(playerid, editMarket[playerid], index);
                } else ShowTDN_OOC(playerid, "No hay skins.");
            } else editMarket[playerid] = -1;
        }
        case DIALOG_SELL_SELECT_SKIN_MARKET: {
            if(response) {
                new indexReal = -1;
                for(new i, e=-1;i<20;i++){
                    if(index == e) {
                        indexReal = i;
                        break;
                    }
                    if(marketData[editMarket[playerid]][item][i] > 0) e++;
                }
                if(indexReal != -1){
                    if(indexReal > 0) indexReal--;
                    for(new i;i<sizeof(skinsModelData);i++){
                        if(marketData[editMarket[playerid]][item][indexReal] == i){
                            if(marketData[editMarket[playerid]][itemAmmount][indexReal] > 0){
                                if(characterData[playerid][money] >= skinsModelData[marketData[editMarket[playerid]][itemAmmount][indexReal]][price]){
                                    marketData[editMarket[playerid]][itemAmmount][indexReal]--;
                                    marketData[editMarket[playerid]][safe] += skinsModelData[marketData[editMarket[playerid]][itemAmmount][indexReal]][price];
                                    takeCharacterMoney(playerid, skinsModelData[marketData[editMarket[playerid]][itemAmmount][indexReal]][price]);
                                    selectedIndexItem[playerid] = i;
                                    ShowPlayerDialog(playerid, DIALOG_SELECT_MARKET_SELL_SKIN, DIALOG_STYLE_MSGBOX,  ""CAPTION_DIALOG_TITLE" MARKET", "¿Como quieres llevar la ropa?", "Puesta", "En bolsa");
                                } else {
                                    ShowTDN_OOC(playerid, "No tienes el dinero suficiente.");
                                    editMarket[playerid] = -1;
                                    break;
                                }
                                
                            }else {
                                ShowTDN_OOC(playerid, "El negocio no tiene stock sobre este producto.");
                                editMarket[playerid] = -1;
                                break;
                            } 
                        }
                    }
                } else editMarket[playerid] = -1;
            } else editMarket[playerid] = -1;
        }
    }
}
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