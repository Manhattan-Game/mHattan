/*
 * Project Name: barvida
 * Date: 05/12/2019 @ 16:38:21

 * The code below is to be used with the Progress Bar V2 include.
 *
*/

#include <a_samp>
#include <progress2>

new PlayerBar:Bar0[MAX_PLAYERS];
new PlayerBar:Bar1[MAX_PLAYERS];
new PlayerBar:Bar2[MAX_PLAYERS];


public OnPlayerConnect(playerid)
{
    Bar0[playerid] = CreatePlayerProgressBar(playerid, 233.000000, 436.000000, 49.500000, 3.200000, -5963521, 100.0000, 0);
    Bar1[playerid] = CreatePlayerProgressBar(playerid, 298.000000, 436.000000, 49.500000, 3.200000, -2139094785, 100.0000, 0);
    Bar2[playerid] = CreatePlayerProgressBar(playerid, 374.000000, 436.000000, 49.500000, 3.200000, -1378294017, 100.0000, 0);

    return 1;
}

public OnPlayerSpawn(playerid)
{
    ShowPlayerProgressBar(playerid, Bar0[playerid]);
    ShowPlayerProgressBar(playerid, Bar1[playerid]);
    ShowPlayerProgressBar(playerid, Bar2[playerid]);
    return 1;
}
