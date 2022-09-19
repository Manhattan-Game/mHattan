#include <YSI_Coding\y_hooks>

hook OnScriptInit()
{
	
	print("[INFO]: Cargando VICE CITY OBJECTS...");
	mysql_tquery(vc_map_db, "SELECT objects.*, models_type.type FROM objects INNER JOIN models_type on objects.modelid = models_type.modelid WHERE objects.enabled = '1';", "OnViceCityObjectsLoad");
	return 1;
}
public OnPlayerViceCityObjectAdding(playerid, modelid3, Float:x3, Float:y3, Float:z3, Float:rx3, Float:ry3, Float:rz3, world3, interior3)
{
	new index = Iter_Free(Vc_Objects);
	CreateVCObject(cache_insert_id(), modelid3, x3, y3, z3, rx3, ry3, rz3, world3, interior3, 0, index);
	CallRemoteFunction("OnPlayerViceCityObjectAdded", "id", playerid, index);

	mysql_format(vc_map_db, QUERY_BUFFER, sizeof QUERY_BUFFER, "SELECT * FROM models_type WHERE modelid = '%d';", modelid3);

	mysql_tquery(vc_map_db, QUERY_BUFFER, "OnQueryLoad", "dd", modelid3, index);
	return 1;
}

forward OnViceCityObjectsLoad();
public OnViceCityObjectsLoad(){
		new rows3, objects;
		if(cache_get_row_count(rows3))
		{
			for(new i = 0; i != rows3; i ++)
			{
				if(objects >= MAX_VC_OBJECTS)
				{
					printf("[WARNING]: Limite 'Vc_Objects' superado (%d)", MAX_VC_OBJECTS);
					break;
				}

				new id4, modelid4, Float:x4, Float:y4, Float:z4, Float:rx4, Float:ry4, Float:rz4, world4, interior4, types, bool:type_isnull;
				cache_get_value_name_int(i, "id", id4);
				cache_get_value_name_int(i, "modelid", modelid4);
				cache_get_value_name_float(i, "x", x4);
				cache_get_value_name_float(i, "y", y4);
				cache_get_value_name_float(i, "z", z4);
				cache_get_value_name_float(i, "rx", rx4);
				cache_get_value_name_float(i, "ry", ry4);
				cache_get_value_name_float(i, "rz", rz4);
				cache_get_value_name_int(i, "world", world4);
				cache_get_value_name_int(i, "interior", interior4);
				cache_is_value_name_null(i, "type", type_isnull);
				if(!type_isnull) cache_get_value_name_int(i, "type", types);
				//
				CreateVCObject(id4, modelid4, x4, y4, z4, rx4, ry4, rz4, world4, interior4, types, i);
				objects ++;
			}
			printf("[OK]: VICE CITY OBJECTS cargado (%d de %d objetos, MAX: %d)", objects, rows3, MAX_VC_OBJECTS);
		}
		else
		{
			print("[ERROR]: No se pudo cargar en 'OnViceCityObjectsLoad' (db error)");
		}
}
forward OnQueryLoad(modelidd, index);
public OnQueryLoad(modelidd, index){
		new rows4;
		if(cache_get_row_count(rows4))
		{
			if(rows4)
			{
				new bool:is_null;
				cache_is_value_name_null(0, "type", is_null);

				if(!is_null)
				{
					new type, type_index = -1;
					cache_get_value_name_int(0, "type", type);
					type_index = GetVCModelTypeIndexById(type);
					if(type_index != -1) SetVcObjectModelType(index, type_index);
				}
			}
			else
			{
				mysql_format(vc_map_db, QUERY_BUFFER, sizeof QUERY_BUFFER, "INSERT INTO models_type (modelid) VALUES ('%d');", modelidd);
				mysql_tquery(vc_map_db, QUERY_BUFFER, "", "");
			}
		}
}