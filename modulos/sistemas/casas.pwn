#include <YSI_Coding\y_hooks>

#define MAX_CASAS 340

enum hou@s_inf@o
{
    h_id,
    h_owner,
    h_direc[20],
    Float:h_posent[3],
    Float:h_posext[3],
    h_vwEnt,
    h_vw,
    h_price,
    h_type,

    h_sell,
    h_doors,

    Float:h_garagent[3],
    Float:h_garagext[3], 


    h_mueblesCount,
    h_create,

    h_pickupEnt,
    Text3D:h_textent,
    Text3D:h_textext,

    h_pickupGarageEnt,
    h_pickupGarageExit,

    h_Object

};
new houseInfo[MAX_CASAS][hou@s_inf@o];


hook OnGameModeInit(){
    for(new i;i<MAX_CASAS;i++){
        loadHouse(i);
    }
}


loadHouse(id){

    if(houseInfo[id][h_create] != 0)
    {
        if(houseInfo[id][h_sell] == 0){
            houseInfo[id][h_pickupEnt] = CreateDynamicPickup(1273, 1, houseInfo[id][h_posent][0], houseInfo[id][h_posent][1], houseInfo[id][h_posent][2], houseInfo[id][h_vwEnt]);
            houseInfo[id][h_textent] = CreateDynamic3DTextLabel(""Chat_Gris" presiona Y para entrar \n "Chat_Verde"Se vende", 0xFFFFFFFF, houseInfo[id][h_posent][0], houseInfo[id][h_posent][1], houseInfo[id][h_posent][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, houseInfo[id][h_vwEnt]);
        }
        else{ 
            houseInfo[id][h_pickupEnt] = CreateDynamicPickup(1273, 1, houseInfo[id][h_posent][0], houseInfo[id][h_posent][1], houseInfo[id][h_posent][2], houseInfo[id][h_vwEnt]);
            houseInfo[id][h_textent] = CreateDynamic3DTextLabel(""Chat_Gris" presiona Y para entrar", 0xFFFFFFFF, houseInfo[id][h_posent][0], houseInfo[id][h_posent][1], houseInfo[id][h_posent][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, houseInfo[id][h_vwEnt]);
        }

        houseInfo[id][h_textext] = CreateDynamic3DTextLabel(""Chat_Gris" presiona Y para salir", 0xFFFFFFFF, houseInfo[id][h_posext][0], houseInfo[id][h_posext][1], houseInfo[id][h_posext][2], 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, houseInfo[id][h_vw]);
    }

}

cmd:crearcasa(playerid, params[])
{
    if(personajeInfo[playerid][p_spawn] == true)
    {
        if(masterInfo[playerid][_admin] <= 5) return SendClientMessage(playerid, -1, ""Chat_Rojo"[error]"Chat_Gris" No tienes permisos suficientes.");
        {
            crearCasa(playerid, getSlotHouse(), 0);
        }
    }
    return 1;
}
cmd:editarCasa(playerid,params[])
{

}
crearCasa(playerid, hid, type){
    //MYSQL
    if(type == 0)
    {
         houseInfo[hid][h_vw] = getSlotHouse();
    }
    else houseInfo[hid][h_vw] = GetPlayerVirtualWorld(playerid);


    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    houseInfo[hid][h_sell] = 0;
    houseInfo[hid][h_posent][0] = x;
    houseInfo[hid][h_posent][1] = y;
    houseInfo[hid][h_posent][2] = z;
    houseInfo[hid][h_vwEnt] = GetPlayerVirtualWorld(playerid);
    houseInfo[hid][h_direc]= generateDirecc();

    houseInfo[hid][h_posext][0] = 3226.2202;
    houseInfo[hid][h_posext][1] = -3633.7786;
    houseInfo[hid][h_posext][2] = 10.9555;

    houseInfo[hid][h_create] = 1;

    loadHouse(hid);
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_YES)
    {
        for(new hid;hid<MAX_CASAS;hid++)
        {
            if(IsPlayerInRangeOfPoint(playerid, 2.0, houseInfo[hid][h_posent][0], houseInfo[hid][h_posent][1], houseInfo[hid][h_posent][2]) && houseInfo[hid][h_doors] == 0)
            {
                SetPlayerPos(playerid, houseInfo[hid][h_posext][0], houseInfo[hid][h_posext][1], houseInfo[hid][h_posext][2]);
                SetPlayerVirtualWorld(playerid, houseInfo[hid][h_vw]);
                break;
            }
            else if(IsPlayerInRangeOfPoint(playerid, 2.0, houseInfo[hid][h_posext][0], houseInfo[hid][h_posext][1], houseInfo[hid][h_posext][2]) && houseInfo[hid][h_doors] == 0)
            {
                SetPlayerPos(playerid, houseInfo[hid][h_posent][0], houseInfo[hid][h_posent][1], houseInfo[hid][h_posent][2]);
                SetPlayerVirtualWorld(playerid, houseInfo[hid][h_vwEnt]);
                break;
            }
        }
    }
}

generateDirecc(){
    new string[20];
    format(string, 20, "MS-%i", generarDNI());
    return string;
}



getSlotHouse()
{
    new h;
    for(new i=1;i<MAX_CASAS;i++)
    {
        if(houseInfo[i][h_vw] == 0)
        {
            h = i;
            break;
        }
    }
    return h;
}