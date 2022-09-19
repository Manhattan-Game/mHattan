#include <YSI_Coding\y_hooks>

hook OnScriptInit()
{
	print("[MySQL] Conectando con la base de datos (vc_map)...");
	vc_map_db = mysql_connect(xylos_HOST, xylos_USER, xylos_PSS, xylos_DB);
	if(mysql_errno(vc_map_db) == 0) printf("[MySQL] Base de datos conectada (%d)", _:vc_map_db);
	else
	{
		printf("[MySQL] No se pudo conectar con la base de datos (vc_map) (%d)", mysql_errno(vc_map_db));
		SendRconCommand("exit");
	}
	return 1;
}

hook OnScriptExit()
{
	mysql_close(vc_map_db);
	return 1;
}