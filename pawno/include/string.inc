#include <a_samp>

mostrarBolsillo(playerid)
{
	new text[1000];

	for(new i;i<MAX_BOLSILLOS;i++)
	{
		if(infoBolsillo[playerid][jslot][i] != 0)
		{
			strcat(text, " %i - Slot ocupado \n", i+1);
		}
		else
		{
			strcat(text, " %i - Slot libre \n", i+1);
		}
	}
	ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, "Bolsillos", text, "boton 1", "boton 2");
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case mydialogid:
		{
			if(response) // si toca boton continuar
			{
				switch(listitem)
				{
					case 0:
					case 1:
					case 2:
					case 3:
					case 4:
					case 5:
					case 6: // funcion
					case 7:// funcion 
				}
			}
		}
	}
}