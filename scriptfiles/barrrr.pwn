/*
 * Project Name: barrrr
 * Date: 02/04/2020 @ 02:24:47

 * The code below is to be used with the Progress Bar V2 include.
 *
*/

#include <a_samp>
#include <progress2>

new PlayerBar:Bar0[MAX_PLAYERS];
new PlayerBar:Bar1[MAX_PLAYERS];

public OnPlayerConnect(playerid)
{
    Bar0[playerid] = CreatePlayerProgressBar(playerid, 37.000000, 433.000000, 54.500000, 7.699999, -86, 100.0000, 0);
    Bar1[playerid] = CreatePlayerProgressBar(playerid, 131.000000, 433.000000, 39.500000, 7.699999, 852308650, 100.0000, 1);

    return 1;
}

public OnPlayerSpawn(playerid)
{
    ShowPlayerProgressBar(playerid, Bar0[playerid]);
    ShowPlayerProgressBar(playerid, Bar1[playerid]);

    return 1;
}
