#define FURNITURE_TYPE_ONPLACED 0
#define FURNITURE_TYPE_PLACED 1


enum furnituresDa@tes{
	listid,
	toId,
	vw,
	model,
	coords[6],
	placed,
	bool:statee,
	object
};
new furnituresData[MAX_FURNITURES][furnituresDa@tes];

new editFurniture[MAX_PLAYERS];


hook OnPlayerConnect(playerid){
	editFurniture[playerid] = -1;
}

ShowFurnitures(playerid, comparationid){
	if(tonewID != -1){
		new furnitures[MAX_FURNITURES] = getFurnituresById(comparationid); 
		new string[QUERY_LONG], indexModel;
		for(new i;i<MAX_FURNITURES;i++){
			if(furnitures[i] != -1){
				indexModel = furnituresData[index][model];
				strcat(string, furnituresModelData[indexModel][name]);
			}
		}
	}
}

editFurniture(playerid, index)
{
	EditDynamicObject(playerid, furnituresData[index][object]);
	editFurniture[playerid] = index;
}

unplaceFurniture(index){
	if(furnituresData[index][statee]){
		if(furnituresData[index][placed] == FURNITURE_TYPE_PLACED){
			DestroyDynamicObject(furnituresData[index][object]);
			furnituresData[index][placed] = FURNITURE_TYPE_ONPLACED;
		}
	}
}
placeFurniture(index){
	if(!furnituresData[index][statee]){
		if(furnituresData[index][placed] == FURNITURE_TYPE_ONPLACED){
			new indexModel = furnituresData[index][model];
			furnituresData[index][object] = CreateDynamicObject(furnituresModelData[indexModel][model], furnituresData[index][coords][0], furnituresData[index][coords][1], furnituresData[index][coords][2], furnituresData[index][coords][3], furnituresData[index][coords][4], furnituresData[index][coords][5], furnituresData[index][vw]);
			furnituresData[index][placed] = FURNITURE_TYPE_PLACED;
		}
	}
}
getFurnituresById(id){
    new array[sizeof(furnituresData)];
    for(new i;i<sizeof(furnituresData); i++){
        if(furnituresData[i][toId] == id){
        	array[i] = i;
        } else array[i] = -1;
    }
    return array;
}