#include <YSI_Coding\y_hooks>

#define FURNITURE_TYPE_BED 0
#define FURNITURE_TYPE_TABLES 1
#define FURNITURE_TYPE_ALLOWANCES 2
#define FURNITURE_TYPE_CUISINE 3
#define FURNITURE_TYPE_CHAIRS 4
#define FURNITURE_TYPE_COUCH 5
#define FURNITURE_TYPE_BATH 6
#define FURNITURE_TYPE_RANDOM 7 
#define FURNITURE_TYPE_SMALL 8
#define FURNITURE_TYPE_DECOR 9
#define FURNITURE_TYPE_ELECTRONIC 10

enum furnituresTypes{
    listid,
    model,
    price,
    type,
    name[40]
};

new furnituresModelData[][furnituresTypes] = {
	//CAMAS
    {0, TEXTDRAWS_MODEL_NONE, 5000, FURNITURE_TYPE_BED, "Nada"},
    {1, 2603, 300, FURNITURE_TYPE_BED, "Cama Base"},
    {2, 1771, 300, FURNITURE_TYPE_BED, "Cama Cutre"},
    {3, 2302, 700, FURNITURE_TYPE_BED, "Cama 2 plz Base"},
    {4, 14866, 820, FURNITURE_TYPE_BED, "Cama 2 plazas Comfort"},
    {5, 11720, 980, FURNITURE_TYPE_BED, "Cama 2 plazas Deluxe"},
    {6, 1700, 950, FURNITURE_TYPE_BED, "Cama 2 plazas Deluxe2"},
    {7, 2300, 1300, FURNITURE_TYPE_BED, "Cama y Mueble Combo"},
    {8, 2301, 1500, FURNITURE_TYPE_BED, "Cama y Mueble Combo 2"},
    {9, 2090, 800, FURNITURE_TYPE_BED, "Cama 2 plazas Std"},
    {10, 14446, 1500, FURNITURE_TYPE_BED, "Cama Tipo Zebra"},
    {11, 2298, 1200, FURNITURE_TYPE_BED, "Combo Cama y Mesas"},
    {12, 2299, 700, FURNITURE_TYPE_BED, "Cama 2 plazas"},
    {13, 1701, 720, FURNITURE_TYPE_BED, "Cama 2 plazas 2"},
    {14, 1745, 800, FURNITURE_TYPE_BED, "Cama 2 plazas 3"},
    {15, 2575, 9000, FURNITURE_TYPE_BED, "Cama de hotel"},
    {16, 1725, 1255, FURNITURE_TYPE_BED, "Cama 2 plazas 4"},
    {17, 2563, 1500, FURNITURE_TYPE_BED, "Cama lujosa"},
    {18, 1796, 400, FURNITURE_TYPE_BED, "Cama simple"},
    //MESAS
    {19, 2644, 400, FURNITURE_TYPE_TABLES, "Mesa Cuadrada chica"},
    {20, 2764, 500, FURNITURE_TYPE_TABLES, "Mesa Cuadrada con mantel"},
    {21, 2370, 550, FURNITURE_TYPE_TABLES, "Mesa Ratona"},
    {22, 2319, 650, FURNITURE_TYPE_TABLES, "Mesa Ratona 2"},
    {23, 2083, 700, FURNITURE_TYPE_TABLES, "Mesa Ratona 3"},
    {24, 1814, 600, FURNITURE_TYPE_TABLES, "Mesa Ratona 4"},
    {25, 1817, 750, FURNITURE_TYPE_TABLES, "Mesa Ratona 5"},
    {26, 2357, 900, FURNITURE_TYPE_TABLES, "Mesa Familiar"},
    {27, 2115, 750, FURNITURE_TYPE_TABLES, "Mesa Standard"},
    {28, 2111, 500, FURNITURE_TYPE_TABLES, "Mesa Redonda Chica"},
    {29, 2030, 900, FURNITURE_TYPE_TABLES, "Mesa Redonda Marmol"},
    {30, 1433, 500, FURNITURE_TYPE_TABLES, "Mesa Cuadrada Chica"},
    {31, 2763, 800, FURNITURE_TYPE_TABLES, "Mesa Cuadrada Roja"},
    {32, 1516, 500, FURNITURE_TYPE_TABLES, "Mesa Cuadrada Madera"},
    {33, 2571, 1200, FURNITURE_TYPE_TABLES, "Set Sofa + Mesa Ratona"},
    {34, 2762, 1000, FURNITURE_TYPE_TABLES, "Mesa Familiar Roja"},
    {35, 3094, 4000, FURNITURE_TYPE_TABLES, "Mesa de Pool"},
    {36, 2964, 3800, FURNITURE_TYPE_TABLES, "Mesa de Pool 2"},
    {37, 14651, 4900, FURNITURE_TYPE_TABLES, "Mesa de Pool 3"},
    {38, 2637, 1000, FURNITURE_TYPE_TABLES, "Mesa Rectagular Familiar"},
    {39, 1822, 600, FURNITURE_TYPE_TABLES, "Mesa Ratona Redonda"},
	//Mesadas
	{40, 2164, 400, FURNITURE_TYPE_ALLOWANCES, "Mesada Curva"},
    {41, 2132, 600, FURNITURE_TYPE_ALLOWANCES, "Mesada Clasica"},
    {42, 2157, 600, FURNITURE_TYPE_ALLOWANCES, "Mesada Madera"},
    {43, 2339, 350, FURNITURE_TYPE_ALLOWANCES, "Mesada Simple"},
    {44, 2445, 800, FURNITURE_TYPE_ALLOWANCES, "Mesada Marmol"},
    {45, 2139, 500, FURNITURE_TYPE_ALLOWANCES, "Mesada Marmol 2"},
    {46, 19929, 1050, FURNITURE_TYPE_ALLOWANCES, "Mesada Larga"},
 	{47, 19930, 400, FURNITURE_TYPE_ALLOWANCES, "Mesada Corta"},
  	{48, 19925, 820, FURNITURE_TYPE_ALLOWANCES, "Mesada Esquinera"},
   	{49, 2455, 800, FURNITURE_TYPE_ALLOWANCES, "Mesada Colorida"},
	{50, 2424, 700, FURNITURE_TYPE_ALLOWANCES, "Mesada Metalica"},
    {51, 2130, 900, FURNITURE_TYPE_ALLOWANCES, "Mesada Fregadero Roja"},
    {52, 2136, 1000, FURNITURE_TYPE_ALLOWANCES, "Mesada Con Fregadero"},
	//Cocina
    {53, 19927, 600, FURNITURE_TYPE_CUISINE, "Fregadero"},
    {54, 2154, 710, FURNITURE_TYPE_CUISINE, "Fregadero 2"},
    {55, 2013, 800, FURNITURE_TYPE_CUISINE, "Fregadero Premium"},
    {56, 2131, 500, FURNITURE_TYPE_CUISINE, "Alacena"},
 	{57, 19924, 800, FURNITURE_TYPE_CUISINE, "Extractor de aire"},
  	{58, 19923, 1000, FURNITURE_TYPE_CUISINE, "Horno Restaurante 1"},
   	{59, 2417, 1000, FURNITURE_TYPE_CUISINE, "Horno Restaurante 2"},
   	{60, 19915, 700, FURNITURE_TYPE_CUISINE, "Cocina Basica Blanca"},
    {61, 2294, 900, FURNITURE_TYPE_CUISINE, "Cocina con Extractor"},
    {62, 2170, 500, FURNITURE_TYPE_CUISINE, "Cocina Basica"},
    {63, 2017, 1200, FURNITURE_TYPE_CUISINE, "Cocina De Alta Gama"},
    {64, 2360, 1710, FURNITURE_TYPE_CUISINE, "Refrigerador"},
    {65, 19916, 1400, FURNITURE_TYPE_CUISINE, "Heladera"},
    {66, 19830, 300, FURNITURE_TYPE_CUISINE, "Licuadora"},
 	{67, 2421, 400, FURNITURE_TYPE_CUISINE, "Microhondas"},
  	{68, 2149, 500, FURNITURE_TYPE_CUISINE, "Microhondas 2"},
   	{69, 1780, 1000, FURNITURE_TYPE_CUISINE, "Minibar"},
   	{70, 1208, 500, FURNITURE_TYPE_CUISINE, "Lavaplatos"},
    {71, 2135, 400, FURNITURE_TYPE_CUISINE, "Cocina Gama Baja"},
    {72, 2127, 1200, FURNITURE_TYPE_CUISINE, "Heladera Roja Art Deco"},
    //Sillas
    {73, 1811, 600, FURNITURE_TYPE_CHAIRS, "Silla Basica"},
    {74, 2636, 710, FURNITURE_TYPE_CHAIRS, "Silla Madera"},
    {75, 2356, 800, FURNITURE_TYPE_CHAIRS, "Silla Giratoria"},
    {76, 2079, 500, FURNITURE_TYPE_CHAIRS, "Silla Madera Oscura"},
 	{77, 1720, 800, FURNITURE_TYPE_CHAIRS, "Silla Clara"},
  	{78, 2776, 1000, FURNITURE_TYPE_CHAIRS, "Silla Circular"},
   	{79, 2124, 1000, FURNITURE_TYPE_CHAIRS, "Silla Familiar"},
   	{80, 1739, 700, FURNITURE_TYPE_CHAIRS, "Silla Familiar 2"},
    {81, 2788, 900, FURNITURE_TYPE_CHAIRS, "Silla Cuadriculada"},
    {82, 19999, 500, FURNITURE_TYPE_CHAIRS, "Silla Oficina"},
    {83, 19996, 1200, FURNITURE_TYPE_CHAIRS, "Silla Cutre"},
    {84, 11734, 1710, FURNITURE_TYPE_CHAIRS, "Silla Mesedora"},
    {85, 2122, 1400, FURNITURE_TYPE_CHAIRS, "Silla Con Cobertor"},
    {86, 2123, 300, FURNITURE_TYPE_CHAIRS, "Silla Deco"},
 	{87, 2096, 400, FURNITURE_TYPE_CHAIRS, "Silla Mesedora"},
  	{88, 1714, 500, FURNITURE_TYPE_CHAIRS, "Silla Giratoria"},
   	{89, 1805, 1000, FURNITURE_TYPE_CHAIRS, "Banqueta 1"},
   	{90, 1716, 500, FURNITURE_TYPE_CHAIRS, "Banqueta 2"},
   	//sofas
    {91, 2748, 400, FURNITURE_TYPE_COUCH, "Sofa Restaurante"},
    {92, 1724, 400, FURNITURE_TYPE_COUCH, "Sofa Cubo Simple"},
    {93, 1704, 400, FURNITURE_TYPE_COUCH, "Sofa Cubo Simple 2"},
    {94, 1708, 520, FURNITURE_TYPE_COUCH, "Sofa Elegante"},
    {95, 11682, 580, FURNITURE_TYPE_COUCH, "Sofa Esquinero"},
    {96, 2291, 450, FURNITURE_TYPE_COUCH, "Sofa Simple"},
    {97, 1711, 350, FURNITURE_TYPE_COUCH, "Sofa Bajo"},
    {98, 1735, 400, FURNITURE_TYPE_COUCH, "Sofa Madera"},
    {99, 2293, 300, FURNITURE_TYPE_COUCH, "Sofa Sin respaldo"},
    {100, 1723, 800, FURNITURE_TYPE_COUCH, "Sofa Doble"},
    {101, 1764, 700, FURNITURE_TYPE_COUCH, "Sofa Doble Baja calidad"},
    {102, 1702, 800, FURNITURE_TYPE_COUCH, "Sofa Claro"},
    {103, 1713, 1000, FURNITURE_TYPE_COUCH, "Sofa Elegante"},
    {104, 1757, 920, FURNITURE_TYPE_COUCH, "Sofa de Cuero Original"},
    {105, 1759, 280, FURNITURE_TYPE_COUCH, "Sofa Simple"},
    {106, 11717, 1950, FURNITURE_TYPE_COUCH, "Sofa Rojo Art Deco"},
    {107, 1706, 860, FURNITURE_TYPE_COUCH, "Sofa Cubico de Madera"},
    {108, 1707, 1850, FURNITURE_TYPE_COUCH, "Sofa Art Classic Car"},
    {109, 1760, 1000, FURNITURE_TYPE_COUCH, "Sofa 3 Cuerpos base"},
    {110, 2290, 2500, FURNITURE_TYPE_COUCH, "Sofa 3 Cuerpos de cuero"},
    //Ba�o
    {111, 11709, 300, FURNITURE_TYPE_BATH, "Fregadero Clasico"},
    {112, 2518, 200, FURNITURE_TYPE_BATH, "Fregadero Standard"},
    {113, 2097, 400, FURNITURE_TYPE_BATH, "Bañadera Standard"},
    {114, 11494, 350, FURNITURE_TYPE_BATH, "Lluvia Clasica"},
    {115, 2515, 400, FURNITURE_TYPE_BATH, "Lavamanos"},
    {116, 2524, 600, FURNITURE_TYPE_BATH, "Lavamanos con pie"},
    {117, 2526, 800, FURNITURE_TYPE_BATH, "Bañadera"},
    {118, 2516, 750, FURNITURE_TYPE_BATH, "Bañadera 2"},
    {119, 2522, 1000, FURNITURE_TYPE_BATH, "Bañadera de lujo"},
    {120, 2519, 780, FURNITURE_TYPE_BATH, "Bañadera 3"},
    {121, 11732, 2800, FURNITURE_TYPE_BATH, "Jacuzzi"},
    {122, 2521, 300, FURNITURE_TYPE_BATH, "Inodoro Base"},
    {123, 2525, 400, FURNITURE_TYPE_BATH, "Inodoro Standard"},
    {124, 2528, 600, FURNITURE_TYPE_BATH, "Inodoro Premuim"},
    {125, 2741, 120, FURNITURE_TYPE_BATH, "Jabonera"},
    {126, 2739, 600, FURNITURE_TYPE_BATH, "Lavamanos Con Pie"},
    {127, 2523, 700, FURNITURE_TYPE_BATH, "Kit Lavamanos y Tapete"},
    {128, 14480, 2000, FURNITURE_TYPE_BATH, "Kit de Baño"},
    {129, 11707, 160, FURNITURE_TYPE_BATH, "Porta Toalla"},
    //Miscelaneas
    {130, 19617, 2500, FURNITURE_TYPE_RANDOM, "Disco de oro"},
    {131, 2828, 300, FURNITURE_TYPE_RANDOM, "Cuadro doble"},
    {132, 1736, 3000, FURNITURE_TYPE_RANDOM, "Alce de Taxidermia"},
    {133, 2289, 500, FURNITURE_TYPE_RANDOM, "Cuadro de Ciudad"},
    {134, 2280, 200, FURNITURE_TYPE_RANDOM, "Cuadro Paisaje"},
    {135, 14752, 200, FURNITURE_TYPE_RANDOM, "Cortinas Clasicas"},
    {136, 11724, 3000, FURNITURE_TYPE_RANDOM, "Chimenea"},
    {137, 2257, 700, FURNITURE_TYPE_RANDOM, "Cuadro Art Deco"},
    {138, 19172, 1000, FURNITURE_TYPE_RANDOM, "Cuadro San Fierro"},
    {139, 19173, 1000, FURNITURE_TYPE_RANDOM, "Cuadro XL"},
    {140, 19174, 1000, FURNITURE_TYPE_RANDOM, "Cuadro San Fierro 2"},
    {141, 1649, 1000, FURNITURE_TYPE_RANDOM, "Ventana de Cristal"},
    {142, 2176, 2000, FURNITURE_TYPE_RANDOM, "Adorno de Marmol"},
    {143, 2282, 120, FURNITURE_TYPE_RANDOM, "Cuadro de Bosque"},
    {144, 2277, 120, FURNITURE_TYPE_RANDOM, "Cuadro de Gato"},
    {145, 2276, 140, FURNITURE_TYPE_RANDOM, "Cuadro SF 3"},
    {146, 2263, 110, FURNITURE_TYPE_RANDOM, "Cuadro Ciudad Noche"},
    {147, 2258, 110, FURNITURE_TYPE_RANDOM, "Cuadro Ciudad Dia"},
    {148, 2260, 110, FURNITURE_TYPE_RANDOM, "Cuadro Paisaje 2"},
    {149, 2261, 100, FURNITURE_TYPE_RANDOM, "Cuadro Puente"},
    {150, 2284, 150, FURNITURE_TYPE_RANDOM, "Cuadro Iglesia"},
    {151, 2267, 150, FURNITURE_TYPE_RANDOM, "Cuadro Titanic"},
    {152, 2273, 150, FURNITURE_TYPE_RANDOM, "Cuadro Flores"},
    {153, 2268, 150, FURNITURE_TYPE_RANDOM, "Cuadro Gatito"},
    {154, 3471, 4000, FURNITURE_TYPE_RANDOM, "Leon de Piedra"},
    {155, 1371, 3000, FURNITURE_TYPE_RANDOM, "Hipopotamo de piedra"},
    {156, 3962, 800, FURNITURE_TYPE_RANDOM, "Cuadro Red Square"},
    {157, 1828, 1200, FURNITURE_TYPE_RANDOM, "Alfombra Tigre"},
    {158, 2631, 200, FURNITURE_TYPE_RANDOM, "Alfombra Roja"},
    {159, 2833, 250, FURNITURE_TYPE_RANDOM, "Alfombra Persa"},
    {160, 2818, 250, FURNITURE_TYPE_RANDOM, "Alfombra Cuadriculada"},
    {161, 2817, 250, FURNITURE_TYPE_RANDOM, "Alfombra Circular"},
    {162, 2835, 300, FURNITURE_TYPE_RANDOM, "Alfombra Ovalada"},
    {163, 1808, 400, FURNITURE_TYPE_RANDOM, "Dispenser de Agua Lux"},
    {164, 2002, 800, FURNITURE_TYPE_RANDOM, "Dispenser de Agua Premium"},
    {165, 2630, 1500, FURNITURE_TYPE_RANDOM, "Bicicleta de Gym"},
    {166, 19806, 300, FURNITURE_TYPE_RANDOM, "Candil Clasico"},
    {167, 11726, 300, FURNITURE_TYPE_RANDOM, "Candil Clasico 2"},
    {168, 1661, 500, FURNITURE_TYPE_RANDOM, "Ventilador de Techo"},
    {169, 14527, 600, FURNITURE_TYPE_RANDOM, "Ventilador de Techo 2"},
    {170, 1738, 1000, FURNITURE_TYPE_RANDOM, "Radiador de Calor"},
    {171, 11721, 1200, FURNITURE_TYPE_RANDOM, "Radiador de Calor"},

	//Peque�os objetos 
    
    
    {172, 11718, 120, FURNITURE_TYPE_SMALL, "Olla 1"},
    {173, 19584, 130, FURNITURE_TYPE_SMALL, "Olla 2"},
    {174, 2822, 140, FURNITURE_TYPE_SMALL, "Platos"},
    {175, 2870, 120, FURNITURE_TYPE_SMALL, "Tinajas"},
    {176, 19825, 120, FURNITURE_TYPE_SMALL, "Reloj"},
    {177, 11706, 150, FURNITURE_TYPE_SMALL, "Tacho de basura"},
    {178, 2613, 110, FURNITURE_TYPE_SMALL, "Tacho de basura 2"},
    {179, 2869, 160, FURNITURE_TYPE_SMALL, "Velas Largas"},
    {280, 11744, 100, FURNITURE_TYPE_SMALL, "Plato"},
    {281, 19993, 230, FURNITURE_TYPE_SMALL, "Bowl"},
    {282, 19591, 100, FURNITURE_TYPE_SMALL, "Abanico"},
    {283, 14705, 200, FURNITURE_TYPE_SMALL, "Tinaja de marmol"},
    {284, 1778, 300, FURNITURE_TYPE_SMALL, "Mopa de Limpieza"},
    {285, 1510, 240, FURNITURE_TYPE_SMALL, "Cenicero"},
    {286, 2253, 250, FURNITURE_TYPE_SMALL, "Maceta empotada"},
    {287, 2194, 140, FURNITURE_TYPE_SMALL, "Cactus"},
    {288, 2245, 300, FURNITURE_TYPE_SMALL, "Flores Rojas"},
    {289, 2780, 600, FURNITURE_TYPE_SMALL, "Camara de seguridad"},
    {290, 2864, 100, FURNITURE_TYPE_SMALL, "Vajilla"},
    
    //Muebles
    
    {291, 2307, 600, FURNITURE_TYPE_DECOR, "Sofa"},
    {292, 2329, 600, FURNITURE_TYPE_DECOR, "Armario de Pino"},
    {293, 912, 400, FURNITURE_TYPE_DECOR, "Armario Pino Chico"},
    {294, 1730, 330, FURNITURE_TYPE_DECOR, "Armario de Clase baja"},
    {295, 2088, 800, FURNITURE_TYPE_DECOR, "Armario de algarrobo"},
    {296, 14640, 500, FURNITURE_TYPE_DECOR, "Mesa de luz"},
    {297, 2087, 400, FURNITURE_TYPE_DECOR, "Armario mediano"},
    {298, 2390, 100, FURNITURE_TYPE_DECOR, "Conjunto de prendas"},
    {299, 2394, 400, FURNITURE_TYPE_DECOR, "Conjunto de prendas"},
    {300, 2573, 1000, FURNITURE_TYPE_DECOR, "Combo vestidor"},
    {301, 2570, 600, FURNITURE_TYPE_DECOR, "Vestidor"},
    {302, 2576, 1100, FURNITURE_TYPE_DECOR, "Combo vestidor 2"},
    {303, 2074, 1100, FURNITURE_TYPE_DECOR, "Combo vestidor 3"},
    {304, 2569, 900, FURNITURE_TYPE_DECOR, "Vestidor de pared"},
    {305, 2025, 1200, FURNITURE_TYPE_DECOR, "Placar clasico"},
    {306, 2200, 2000, FURNITURE_TYPE_DECOR, "Placar contemporaneo"},
    
    //Electronica
    
    {307, 2313, 400, FURNITURE_TYPE_ELECTRONIC, "Mesada + TV y VCR"},
    {308, 14772, 600, FURNITURE_TYPE_ELECTRONIC, "TV Sharp"},
    {309, 1747, 300, FURNITURE_TYPE_ELECTRONIC, "TV Mangler"},
    {310, 2322, 550, FURNITURE_TYPE_ELECTRONIC, "TV Hitachi"},
    {311, 2318, 650, FURNITURE_TYPE_ELECTRONIC, "TV Philips"},
    {312, 1781, 400, FURNITURE_TYPE_ELECTRONIC, "TV Sanyo"},
    {313, 1752, 700, FURNITURE_TYPE_ELECTRONIC, "TV Toshiba"},
    {314, 1751, 550, FURNITURE_TYPE_ELECTRONIC, "TV Onward"},
    {315, 1717, 500, FURNITURE_TYPE_ELECTRONIC, "TV Philco"},
    {316, 2224, 2000, FURNITURE_TYPE_ELECTRONIC, "TV Sphere Deluxe"},
    {317, 2595, 1200, FURNITURE_TYPE_ELECTRONIC, "TV + VCR Hitachi"},
    {318, 1429, 800, FURNITURE_TYPE_ELECTRONIC, "TV Akai"},
    {319, 1749, 500, FURNITURE_TYPE_ELECTRONIC, "TV Surrevilance"},
    {320, 1786, 1200, FURNITURE_TYPE_ELECTRONIC, "TV Mitsubishi"},
    {321, 1750, 500, FURNITURE_TYPE_ELECTRONIC, "TV Sansui"},
    {322, 14604, 1500, FURNITURE_TYPE_ELECTRONIC, "TV y VCR Onward"},
    {323, 2028, 600, FURNITURE_TYPE_ELECTRONIC, "Family Game"},
    {324, 1719, 600, FURNITURE_TYPE_ELECTRONIC, "Consola Atari"},
    {325, 1839, 500, FURNITURE_TYPE_ELECTRONIC, "Centro Musical Toshiba"},
    {326, 1809, 700, FURNITURE_TYPE_ELECTRONIC, "Equipo HI FI Technics"},
    {327, 2099, 900, FURNITURE_TYPE_ELECTRONIC, "Centro Musical Wilco"},
    {328, 2100, 880, FURNITURE_TYPE_ELECTRONIC, "Centro Musical Ranser"},
    {329, 2103, 850, FURNITURE_TYPE_ELECTRONIC, "Boombox Hitachi J3"},
    {330, 14806, 3800, FURNITURE_TYPE_ELECTRONIC, "Centro Musical Pioneer"},
    {331, 2227, 1000, FURNITURE_TYPE_ELECTRONIC, "Stereo B&O Beocord 1"},
    {332, 2225, 1000, FURNITURE_TYPE_ELECTRONIC, "Stereo B&O Beocord 2"},
    {333, 2104, 1500, FURNITURE_TYPE_ELECTRONIC, "Equipo Musical Pioneer"},
    {334, 1782, 650, FURNITURE_TYPE_ELECTRONIC, "Betacam Sony BT83"},
    {335, 1785, 650, FURNITURE_TYPE_ELECTRONIC, "VCR JVC PV2"},
    {336, 1787, 800, FURNITURE_TYPE_ELECTRONIC, "Betacam Hitachi HT23"},
    {337, 1788, 900, FURNITURE_TYPE_ELECTRONIC, "Cassetera Pioneer CTF-5BK"},
    {338, 1790, 700, FURNITURE_TYPE_ELECTRONIC, "VCR Philips SMK 4Head"},
    {339, 2296, 1200, FURNITURE_TYPE_ELECTRONIC, "Pack TV y Mueble"},
    {340, 2091, 1300, FURNITURE_TYPE_ELECTRONIC, "Pack TV y Mueble 2"},
    {341, 1781, 400, FURNITURE_TYPE_ELECTRONIC, "TV Winco SuperColor"},
    {342, 2231, 550, FURNITURE_TYPE_ELECTRONIC, "Bafle Technics SU9"},
    {343, 2232, 750, FURNITURE_TYPE_ELECTRONIC, "Bafle Sansui SM459"},
    {344, 1840, 450, FURNITURE_TYPE_ELECTRONIC, "Bafle Akai E35"},
    {345, 2230, 750, FURNITURE_TYPE_ELECTRONIC, "Bafle B&O Beosound 1"},
    {346, 2229, 450, FURNITURE_TYPE_ELECTRONIC, "Bafle Sankyo L100"},
    {347, 2233, 900, FURNITURE_TYPE_ELECTRONIC, "Bafle Thonet&Vander"},
    {348, 19616, 700, FURNITURE_TYPE_ELECTRONIC, "Amplif Guitarra Fender"},
    {349, 11705, 150, FURNITURE_TYPE_ELECTRONIC, "Telefono a Disco"},
    {350, 19807, 300, FURNITURE_TYPE_ELECTRONIC, "Telefono a Teclas"},
    {351, 1958, 500, FURNITURE_TYPE_ELECTRONIC, "Mixer Denon DN2"},
    {352, 14527, 500, FURNITURE_TYPE_ELECTRONIC, "Ventilador"},
    {353, 1208, 400, FURNITURE_TYPE_ELECTRONIC, "Lavaropa"},
    {354, 2202, 2000, FURNITURE_TYPE_ELECTRONIC, "Fotocopiadora"},
    {355, 2192, 300, FURNITURE_TYPE_ELECTRONIC, "Ventilador de Mesa"},
    {356, 2190, 1500, FURNITURE_TYPE_ELECTRONIC, "Commodore 64"},
    {357, 19814, 15, FURNITURE_TYPE_ELECTRONIC, "Tomacorriente"},
    {358, 19813, 15, FURNITURE_TYPE_ELECTRONIC, "Tomacorriente 2"},
    {359, 19827, 15, FURNITURE_TYPE_ELECTRONIC, "Switch de luz"},
    {360, 19828, 500, FURNITURE_TYPE_ELECTRONIC, "Switch de luz 2"},
    {361, 19610, 400, FURNITURE_TYPE_ELECTRONIC, "Microfono Newmann"},
    {362, 2726, 400, FURNITURE_TYPE_ELECTRONIC, "Velador"}
    
};


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    if(dialogid == DIALOG_SELECT_MARKET_FURNITURES){
        if(response){
            new array[sizeof(furnituresModelData)];
            array = getModelsByType(listitem);
            for(new i;i<sizeof(furnituresModelData);i++){
                if(array[i] != -1){
                    addDialogItem(playerid, furnituresModelData[array[i]][model], furnituresModelData[array[i]][name]);
                }
            }
            ShowPlayerDialogItem(playerid, DIALOG_ITEMS_SELECT_FURNITURE, "Muebles", "Seleccionar");
        }
    }
}


getModelsByType(typee){
    new array[sizeof(furnituresModelData)];
    for(new i;i<sizeof(furnituresModelData); i++){
        if(furnituresModelData[i][type] == typee) {
            array[i] = i;
        }else array[i] = -1;
    }
    return array;
}

SelectFurnituresByType(playerid, dialogid){
    ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, ""CAPTION_DIALOG_TITLE" FURNITURES", "Camas\nMesas\nMesadas\nCocina\nSillas\nSofa\nBaño\nAleatorio\nObjetos pequeños\nDecoracion\nElectronica", "Continuar", ""RED" cancelar");
}