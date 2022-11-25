#define MAX_PASSWORD_LENGTH 13
#define MAX_EMAIL_LENGTH 60

enum _min@f@o
{
    _dbid,
    _name[24],
    _password[128],
    _coins,
    _date[80],
    _lastdate[80],
    _admin,
    
    _whitelist,
    _correo[MAX_EMAIL_LENGTH],

    bool:loggedin,
    type
};
new accounts[MAX_PLAYERS][_min@f@o];

new Text:home_TD[3];
new PlayerText:home_PTD[MAX_PLAYERS][3];

new inputPassword[MAX_PLAYERS][MAX_PASSWORD_LENGTH];
new inputEmail[MAX_PLAYERS][MAX_EMAIL_LENGTH];