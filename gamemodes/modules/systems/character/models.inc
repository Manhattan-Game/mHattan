#define TIME_TIMER_NEEDS 120000

enum _pi@nfo
{
        listid,
        mkid,
        name[40],
        Float:posX,
        Float:posY,
        Float:posZ,
        Float:angle,
        viplevel,
        level,
        exp,
        money,
        Float:life,
        Float:armor,

        Float:drugs,
        Float:hungry,
        Float:thirst,
        Float:urine,
        Float:fatigue,
        Float:stress,

        world,
        interior,
        skin,
        age,
        origin,
        sex,
        bankbalance,
        bankcredit,
        job,
        biz,
        bizRank,

        p_duda,
        p_dudaT,
        bool:p_spawn,

        charactersMenu[3],
        viewTextdraw,

        timerNeeds
};
new characterData[MAX_PLAYERS][_pi@nfo];

new Text:character_TD[1];
new PlayerText:character_PTD[MAX_PLAYERS][9];

new Text:createCharacter_TD[2];
new PlayerText:createCharacter_PTD[MAX_PLAYERS][4];

new inputName[MAX_PLAYERS][MAX_PLAYER_NAME];
new inputAge[MAX_PLAYERS];
new inputGender[MAX_PLAYERS] = GENDER_FEMALE;

new VIEW_HUD[MAX_PLAYERS];