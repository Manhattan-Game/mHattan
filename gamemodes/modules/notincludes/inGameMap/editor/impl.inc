#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	pCurrentVcObjectIndex[playerid] = -1;
	pVcMdlTypeSelected[playerid] = 0;
	return 1;
}

cmd:evco(playerid, params[])
{
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, -1, "Syntax: /evco [id]");
	pCurrentVcObjectIndex[playerid] = GetVcObjectIndexById(params[0]);

	if(pCurrentVcObjectIndex[playerid] == -1) SendClientMessage(playerid, -1, "Invalid ID!");
	else EditDynamicObject(playerid, Vc_Objects[pCurrentVcObjectIndex[playerid]][vc_OBJECTID]);
	return 1;
}

cmd:dvco(playerid, params[])
{
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, -1, "Syntax: /dvco [id]");
	new index = GetVcObjectIndexById(params[0]);

	if(index == -1) SendClientMessage(playerid, -1, "Invalid ID!");
	else
	{
		DeleteVcObject(index, SaveVcEditorChanges);
		SendClientMessage(playerid, -1, "Object deleted!");
	}
	return 1;
}

cmd:vcodisable(playerid, params[])
{
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, -1, "Syntax: /vcodisable [id]");
	new index = GetVcObjectIndexById(params[0]);

	if(index == -1) SendClientMessage(playerid, -1, "Invalid ID!");
	else
	{
		DisableVcObject(index, SaveVcEditorChanges);
		SendClientMessage(playerid, -1, "Object disabled!");
	}
	return 1;
}

cmd:avco(playerid, params[])
{
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, -1, "Syntax: /avco [modelid]");
	if(!SaveVcEditorChanges)
	{
		SendClientMessage(playerid, -1, "VC Map saves are disabled, enable it!");
		return 1;
	}

	if(!AddVcObject(playerid, params[0])) SendClientMessage(playerid, -1, "Array full!");
	return 1;
}

cmd:ddvco(playerid, params[])
{
	if(sscanf(params, "d", params[0])) return SendClientMessage(playerid, -1, "Syntax: /ddvco [id]");
	if(!SaveVcEditorChanges)
	{
		SendClientMessage(playerid, -1, "VC Map saves are disabled, enable it!");
		return 1;
	}
	new index = GetVcObjectIndexById(params[0]);

	if(index == -1) SendClientMessage(playerid, -1, "Invalid ID!");
	else
	{
		if(!AddVcObject(playerid, -1, index)) SendClientMessage(playerid, -1, "Array full!");
	}
	return 1;
}

cmd:vcosave(playerid, params[])
{
	if(SaveVcEditorChanges)
	{
		SendClientMessage(playerid, -1, "VC Map saves disabled!");
		SaveVcEditorChanges = false;
	}
	else
	{
		SendClientMessage(playerid, -1, "VC Map saves enabled!");
		SaveVcEditorChanges = true;
	}
	return 1;
}

cmd:lvco(playerid, params[])
{
	if(vcObjects_Debug)
	{
		ToggleVcObjectsDebug(false);
		SendClientMessage(playerid, -1, "VC Map labels disabled!");
	}
	else
	{
		ToggleVcObjectsDebug(true);
		SendClientMessage(playerid, -1, "VC Map labels true!");
	}
	return 1;
}

cmd:vcoss(playerid, params[])
{
	new dialog[512], line_str[45];
	dialog = "Type\tStreamDistance\tPriority\n";
	foreach(new i : Vc_Models_Types)
	{
		format(line_str, sizeof line_str, "%s\t%.2f\t%d\n", Vc_Models_Types[i][vc_model_type_NAME], Vc_Models_Types[i][vc_model_type_STREAM_DISTANCE], Vc_Models_Types[i][vc_model_type_PRIORITY]);
		strcat(dialog, line_str);
	}
	ShowPlayerDialog(playerid, 999, DIALOG_STYLE_TABLIST_HEADERS, "Edit StreamDistance", dialog, "Edit", "Close");
	return 1;
}

cmd:gvco(playerid, params[])
{
	if(!sscanf(params, "d", params[0]))
	{
		new index = GetVcObjectIndexById(params[0]);
		if(index == -1) SendClientMessage(playerid, -1, "Invalid ID!");
		else
		{
			SetPlayerPos(playerid, Vc_Objects[index][vc_X], Vc_Objects[index][vc_Y], Vc_Objects[index][vc_Z]);
			SetPlayerFacingAngle(playerid, 0.0);
			SetPlayerVirtualWorld(playerid, Vc_Objects[index][vc_WORLDID]);
			SetPlayerInterior(playerid,  Vc_Objects[index][vc_INTERIORID]);
		}
	}
	else SendClientMessage(playerid, -1, "Syntax: /gvco <ID>");
	return 1;
}

cmd:ivco(playerid, params[])
{
	if(!sscanf(params, "d", params[0]))
	{
		new index = GetVcObjectIndexById(params[0]);
		if(index == -1) SendClientMessage(playerid, -1, "Invalid ID!");
		else
		{
			new dialog_message[256];
			format(dialog_message, sizeof dialog_message, 
				"ID: %d\nObjectID: %d\nModelID: %d\nInteriorID: %d\nWorldID: %d\nID Type: %d",
				Vc_Objects[index][vc_ID], Vc_Objects[index][vc_OBJECTID], Vc_Objects[index][vc_MODELID], Vc_Objects[index][vc_INTERIORID],
				Vc_Objects[index][vc_WORLDID], Vc_Objects[index][vc_OBJECT_TYPE]
			);
			ShowPlayerDialog(playerid, 1000, DIALOG_STYLE_MSGBOX, "VC object info", dialog_message, "X", "");
		}
	}
	else SendClientMessage(playerid, -1, "Syntax: /gvco <ID>");
	return 1;
}

cmd:ivcobjects(playerid, params[])
{
	new dialog_message[256];
	format(dialog_message, sizeof dialog_message, 
		"Total: %d\nLimit: %d\nObjects with no type: %d",
		Iter_Count(Vc_Objects), MAX_VC_OBJECTS, CountVcObjectsWithNoType()
	);

	ShowPlayerDialog(playerid, 1000, DIALOG_STYLE_MSGBOX, "Edit VC objects info", dialog_message, "X", "");
	return 1;
}

public OnVcSsDialog(playerid, dialogid, response, listitem, inputtext[])
{
	if(response)
	{
		new dialog_message[128];
		format(dialog_message, sizeof dialog_message, "Current\n%f, %d", Vc_Models_Types[pVcMdlTypeSelected[playerid]][vc_model_type_STREAM_DISTANCE], Vc_Models_Types[pVcMdlTypeSelected[playerid]][vc_model_type_PRIORITY]);
		pVcMdlTypeSelected[playerid] = listitem;

		ShowPlayerDialog(playerid, 999, DIALOG_STYLE_INPUT, "Edit StreamDistance", dialog_message, "Edit", "Close");
	}
	return 1;
}

hook OnPlayerEditDynObj(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(pCurrentVcObjectIndex[playerid] != -1)
	{
		switch(response)
		{
			case EDIT_RESPONSE_CANCEL:
			{
				if(Streamer_GetIntData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID) == _:OBJECT_TYPE_VCO)
				{
					UpdateVcObject(pCurrentVcObjectIndex[playerid]);
					pCurrentVcObjectIndex[playerid] = -1;
					SendClientMessage(playerid, -1, "Edition cancelled!");
				}
			}
			case EDIT_RESPONSE_FINAL:
			{
				Vc_Objects[pCurrentVcObjectIndex[playerid]][vc_X] = x;
				Vc_Objects[pCurrentVcObjectIndex[playerid]][vc_Y] = y;
				Vc_Objects[pCurrentVcObjectIndex[playerid]][vc_Z] = z;
				Vc_Objects[pCurrentVcObjectIndex[playerid]][vc_RX] = rx;
				Vc_Objects[pCurrentVcObjectIndex[playerid]][vc_RY] = ry;
				Vc_Objects[pCurrentVcObjectIndex[playerid]][vc_RZ] = rz;

				UpdateVcObject(pCurrentVcObjectIndex[playerid], SaveVcEditorChanges);
				pCurrentVcObjectIndex[playerid] = -1;
				SendClientMessage(playerid, -1, "Object updated!");
			}
		}
	}
	return 1;
}
forward OnPlayerDialogg(in_playerid, in_dialogid, in_response, in_listitem, string:in_inputtext[]);
public OnPlayerDialogg(in_playerid, in_dialogid, in_response, in_listitem, string:in_inputtext[])
{
			#pragma unused in_playerid, in_dialogid, in_listitem
			if(in_response)
			{
				new Float:new_ss, new_priority;
				if(sscanf(in_inputtext, "p<,>fd", new_ss, new_priority)) return SendClientMessage(in_playerid, -1, "Invalid format!");

				SetVcModelTypeSsAndPriority(pVcMdlTypeSelected[in_playerid], new_ss, new_priority, SaveVcEditorChanges);
				UpdateVcObjectsSs();
			}

			new dialog[512], line_str[45];
			dialog = "Type\tStreamDistance\tPriority\n";
			foreach(new i : Vc_Models_Types)
			{
				format(line_str, sizeof line_str, "%s\t%.2f\t%d\n", Vc_Models_Types[i][vc_model_type_NAME], Vc_Models_Types[i][vc_model_type_STREAM_DISTANCE], Vc_Models_Types[i][vc_model_type_PRIORITY]);
				strcat(dialog, line_str);
			}
			ShowPlayerDialog(in_playerid, 999, DIALOG_STYLE_TABLIST_HEADERS, "Edit StreamDistance", dialog, "Edit", "Close");
			return 1;
}
public OnPlayerViceCityObjectAdded(playerid, index)
{
	new msg[128];
	format(msg, sizeof msg, "Object added (ID: %d)!", Vc_Objects[index][vc_ID]);
	SendClientMessage(playerid, -1, msg);

	pCurrentVcObjectIndex[playerid] = index;
	EditDynamicObject(playerid, Vc_Objects[index][vc_OBJECTID]);
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
	switch(dialogid){
		case 999: OnVcSsDialog(playerid, dialogid, response, listitem, inputtext);
		case 1000: OnPlayerDialogg(playerid, dialogid, response, listitem, inputtext);
	}
	
}