#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    if(dialogid == DIALOG_SELECT_MARKET_SELL_SKIN){
        if(response){
            setSkin(playerid, skinsModelData[selectedIndexItem[playerid]][model]);
            ShowTDN_IC(playerid, "Cambiaste de ropa.");
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
                } else ShowTDN_IC(playerid, "No hay skins.");
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
                                    ShowTDN_IC(playerid, "No tienes el dinero suficiente.");
                                    editMarket[playerid] = -1;
                                    break;
                                }
                                
                            }else {
                                ShowTDN_IC(playerid, "El negocio no tiene stock sobre este producto.");
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