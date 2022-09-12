#include <YSI_Coding\y_hooks>


#define HOUSE_TYPE_INTERIOR 0
#define HOUSE_INLINE 1

enum houses@ty@pes{
 	type,
 	class[40],
 	Float:interiorCoords[4]
};
new houseModelsData[][houses@ty@pes] = {
	{HOUSE_TYPE_INTERIOR, "Clase baja 1", {5058.0483, 329.0049,1174.7034, 359.1285}},
	{HOUSE_TYPE_INTERIOR, "Clase media 1", {4901.7446, 338.1617, 1196.5110, 0.6790}},
	{HOUSE_TYPE_INTERIOR, "Clase media 2(Dos pisos)", {4723.7373,315.3955,1192.2141, 359.5511}},
	{HOUSE_TYPE_INTERIOR, "Clase media 3(Dos pisos)", {4570.2305,361.2347,1180.7999, 7.0710}},
	{HOUSE_TYPE_INTERIOR, "Clase media 4(Dos pisos)", {4727.6201,106.5551,1237.1208, 357.2949}},
	{HOUSE_TYPE_INTERIOR, "Clase media 5(Dos pisos)", {4748.4756,348.2649,1318.0228, 354.5573}},
	{HOUSE_TYPE_INTERIOR, "Clase baja 2", {4870.0308,337.1502,1387.2468, 357.9181}},
	{HOUSE_TYPE_INTERIOR, "Clase media 6", {4959.1279,527.4122,1398.2209, 86.2198}},
	{HOUSE_TYPE_INTERIOR, "Clase baja 3", {4647.2612,482.1955,1411.9133, 89.0398}},
	{HOUSE_TYPE_INTERIOR, "Clase media 7", {4580.4331,647.1934,1426.3759, 357.3538}},
	{HOUSE_TYPE_INTERIOR, "Clase media 8", {4728.2339,756.6479,1451.5750, 356.3549}}
};

hook OnGameModeInit(){
	CreateDynamicObject(14700, 5057.852050, 332.136627, 1175.203369, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14701, 4901.895019, 347.962097, 1197.581298, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14702, 4720.946777, 328.521575, 1195.510986, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14703, 4567.371093, 374.414794, 1184.096801, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14706, 4727.479492, 117.727706, 1239.323974, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14707, 4760.904296, 362.608764, 1321.606933, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14708, 4931.466308, 235.078475, 1375.274169, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14709, 4871.366699, 346.999908, 1387.715576, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14710, 4949.729003, 530.524047, 1398.736572, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14711, 4638.785156, 474.642089, 1412.514892, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14712, 4577.804687, 654.488098, 1426.946166, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14713, 4722.998046, 761.302062, 1452.379638, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14714, 4651.583984, 880.405944, 1471.729492, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14717, 4652.107421, 772.029357, 1489.322387, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14718, 4438.244140, 963.071838, 1518.911621, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14735, 6515.189453, 657.049499, 715.643798, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14736, 6670.741210, 611.090759, 737.875671, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14746, 6637.139648, 833.857849, 748.439208, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(17922, 6614.808593, 841.198974, 751.458068, 0.000000, 0.000000, 180.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14748, 6352.936035, 1047.323608, 818.260375, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14750, 6098.789062, 915.957458, 834.449645, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14754, 6247.877929, 908.631652, 848.208557, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14755, 6243.994140, 658.801635, 837.655395, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14756, 6097.506347, 547.187438, 855.821777, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14758, 6332.707519, 373.601348, 985.269531, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14759, 6003.999023, 431.315917, 1003.368652, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14760, 6086.425781, 207.151199, 1013.644104, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(15031, 5962.912597, -72.885284, 1084.165405, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(15041, 6137.386230, -17.176265, 1099.547363, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(15046, 6253.905761, -93.036796, 1106.131225, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(15054, 6260.850585, -304.697387, 1101.525024, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14815, 6501.375488, -502.951110, 1166.765991, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
	CreateDynamicObject(14534, 6670.124511, -649.409667, 1209.597778, 0.000000, 0.000000, 0.000000, -1, -1, -1, 150.00, 150.00); 
}