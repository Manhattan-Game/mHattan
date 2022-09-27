cmd:s(playerid, params[]){
	new text[248], string[248];
	if(characterData[playerid][p_spawn]){
		if(!sscanf(params, "s[248]", text)){
			format(string, 200, ""GREY"[ID:%i] "GREY"%s"GREY" dice despacio: %s.", playerid, GetFullName(playerid), text);
			sendDoubleLineMessage(playerid, 5.0, -1, string);
		} else SendClientMessage(playerid, -1, ""RED"Error: "GREY"/s (Susurrar).");
	}
}
cmd:b(playerid, params[]){
	new text[248], string[248];
	if(characterData[playerid][p_spawn]){
		if(!sscanf(params, "s[248]", text)){
			format(string, 200, ""GREY"[ID:%i] "GREY"%s"GREY": ((%s)).", playerid, GetFullName(playerid), text);
			sendDoubleLineMessage(playerid, 10.0, -1, string);
		} else SendClientMessage(playerid, -1, ""RED"Error: "GREY"/b ((OOC)).");
	}
}

cmd:g(playerid, params[]){
	new text[248], string[248];
	if(characterData[playerid][p_spawn]){
		if(!sscanf(params, "s[248]", text)){
			format(string, 200, ""GREY"[ID:%i] "GREY"%s"GREY" grita: ¡%s!.", playerid, GetFullName(playerid), text);
			sendDoubleLineMessage(playerid, 17.0, -1, string);
		} else SendClientMessage(playerid, -1, ""RED"Error: "GREY"/g (Gritar).");
	}
}


cmd:me(playerid, params[]){
	new text[248], string[248];
	if(characterData[playerid][p_spawn]){
		if(!sscanf(params, "s[248]", text)){
			format(string, 200, ""ROL_ME"%s %s.", GetFullName(playerid), text);
			sendDoubleLineMessage(playerid, 10.0, -1, string);
		} else SendClientMessage(playerid, -1, ""RED"Error: "GREY"/me (Accion).");
	}
}

cmd:do(playerid, params[]){
	new text[248], string[248];
	if(characterData[playerid][p_spawn]){
		if(!sscanf(params, "s[248]", text)){
			format(string, 200, ""ROL_DO"%s ((%s)).", text, GetFullName(playerid));
			sendDoubleLineMessage(playerid, 10.0, -1, string);
		} else SendClientMessage(playerid, -1, ""RED"Error: "GREY"/do (Contexto).");
	}
}