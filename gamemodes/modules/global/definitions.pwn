
// RANKS ADM
#define BASIC_USER 0
#define BANNED_USER 1
#define STAFF_RANK_HELPER 2
#define STAFF_RANK_MODERATOR_C 3
#define STAFF_RANK_MODERATOR_B 4
#define STAFF_RANK_MODERATOR_A 4
#define STAFF_RANK_ADMINISTRATOR_C 5
#define STAFF_RANK_ADMINISTRATOR_B 6
#define STAFF_RANK_ADMINISTRATOR_A 7
#define STAFF_RANK_FOUNDER 8




// VIEW TEXTDRAWS
#define TEXTDRAWS_INVENTORY 1
#define TEXTDRAWS_DIALOG_ITEM 2
#define TEXTDRAWS_MENU 3
#define TEXTDRAWS_PHONE 4

#define TEXTDRAWS_MODEL_NONE 19382

// COLORS
#define ORANGE "{F2C80C}"
#define GREY "{D4D4D4}"
#define WHITE "{FFFFFF}"
#define RED "{FF0000}"
#define PINK "{FF00D9}"
#define PURPLE "{DFA7F2}"
#define BLUE "{A1C2FF}"
#define GREEN "{63F279}"
#define YELLOW "{FAF623}"
#define BLACK "{69670C}"
#define ICE "{03F2FF}"
#define LIME "{00FF40}"

// MAX's
#define TYPE_BUSINNES 1
#define TYPE_MARKETS 2
#define TYPE_HOUSES 3

#define MAX_BUSINESS 20
#define MAX_MARKETS 20
#define MAX_HOUSES 30
#define MAX_DOORS (MAX_BUSINESS + MAX_HOUSES + MAX_MARKETS)

#define MAX_FURNITURES (MAX_BUSINESS + MAX_MARKETS + MAX_HOUSES ) * 3 

#define MAX_FURNITURES_PER_LOCALITY_VIP_0 MAX_BUSINESS * 5
#define MAX_FURNITURES_PER_LOCALITY_VIP_1 MAX_BUSINESS * 7
#define MAX_FURNITURES_PER_LOCALITY_VIP_2 MAX_BUSINESS * 8
#define MAX_FURNITURES_PER_LOCALITY_VIP_3 MAX_BUSINESS * 10

#define MAX_DROPPED_ITEMS 50


// DIALOGS
#define d_ban 1

#define DIALOG_PASSWORD 2
#define DIALOG_EMAIL 3
#define DIALOG_CHARACTER_NAME 4
#define DIALOG_CHARACTER_AGE 5

#define DIALOG_EDIT_DOOR 6
#define DIALOG_EDIT_DOOR_MODEL 7
#define DIALOG_EDIT_DOOR_EXIT 8
#define DIALOG_EDIT_DOOR_EXIT_HOUSES 9

#define DIALOG_EDIT_HOUSE 10
#define DIALOG_EDIT_HOUSE_DOORID 11
#define DIALOG_EDIT_HOUSE_GARAJEID 12
#define DIALOG_EDIT_HOUSE_DIRECTION 13
#define DIALOG_EDIT_HOUSE_PRICE 14
#define DIALOG_EDIT_HOUSE_LEVEL 15
#define DIALOG_MY_HOUSE 16
#define DIALOG_MY_HOUSE_DEPOSIT 17
#define DIALOG_MY_HOUSE_WITHDRAW 18

#define DIALOG_EDIT_FURNITURE 19

#define DIALOG_EDIT_MARKET 20
#define DIALOG_EDIT_MARKET_DOORID 21
#define DIALOG_EDIT_MARKET_DIRECTION 22
#define DIALOG_EDIT_MARKET_PRICE 23
#define DIALOG_EDIT_MARKET_TYPE 24




#define DIALOG_ITEMS_FURNITURES 0

//MESSAGES
#define CAPTION_DIALOG_TITLE ""ORANGE" MAINLAND:"
#define CAPTION_TEXT_TITLE ""GREY" MAINLAND :"

//PROGRESS BARS
#define BAR_HUD_LIFE 1
#define BAR_HUD_ARMOR 2
#define BAR_HUD_DRUGS 3
#define BAR_HUD_HUNGRY 4
#define BAR_HUD_THIRST 5
#define BAR_HUD_URINE 6
#define BAR_HUD_FATIGUE 7
#define BAR_HUD_STRESS 8

// PLAYER
#define GENDER_MALE 0
#define GENDER_FEMALE 1

#define POS_X_SPAWN 6248.2461
#define POS_Y_SPAWN -651.5588
#define POS_Z_SPAWN 5.6164

DEFINE_HOOK_REPLACEMENT(OnPlayer, OP_);

