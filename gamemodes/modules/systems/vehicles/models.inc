#define CAR_WINDOW_CLOSE 1
#define CAR_WINDOW_OPEN 0

enum vehicles@tpye@data{
    listid,
    characterid,
    model,
    kilometres,
    plate,
    gas,
    oil,

    enginee,
    lightss,
    alarmm,
    doorr,
    boott,
    bonnett,
    windows[4],
    tires[4],

    vehicle_vw,
    color1,
    color2,
    Float:vehicle_life,
    Float:position[4],

    vehicleidd

};
new vehicleData[MAX_VEHICLES][vehicles@tpye@data];
new inVehicle[MAX_PLAYERS];

new PlayerText:velocimeter_PTD[MAX_PLAYERS][6];
new Text:velocimeter_TD[1];


#define VEHICLES_TYPE_PLANES 0
#define VEHICLES_TYPE_HELICOPTERS 1
#define VEHICLES_TYPE_MOTORBIKES 2
#define VEHICLES_TYPE_CARS2DOORS 3
#define VEHICLES_TYPE_CARS4DOORS 4
#define VEHICLES_TYPE_SPORTS 5
#define VEHICLES_TYPE_TRUCKS 6
#define VEHICLES_TYPE_SPECIALS 7


enum vehi@clsType{
    listid,
    model,
    price,
    type,
    name[40]
};

new vehiclesModelData[][vehi@clsType] =
	{
        {0, 0, 3165000, 0, "Nada"},
	    //0=Aviones
    	{1, 577, 3165000, VEHICLES_TYPE_PLANES, "AT-400"},
    	{2, 511, 1165000, VEHICLES_TYPE_PLANES, "Beagle"},
    	{3, 512, 865000, VEHICLES_TYPE_PLANES, "Cropduster"},
    	{4, 593, 965000, VEHICLES_TYPE_PLANES, "Dodo"},
    	{5, 520, 1165000, VEHICLES_TYPE_PLANES, "Hydra"},
    	{6, 553, 2165000, VEHICLES_TYPE_PLANES, "Nevada"},
    	{7, 476, 865000, VEHICLES_TYPE_PLANES, "Rustler"},
    	{8, 519, 1005000, VEHICLES_TYPE_PLANES, "Shamal"},
    	{9, 460, 965000, VEHICLES_TYPE_PLANES, "Skimmer"},
    	{10, 513, 995000, VEHICLES_TYPE_PLANES, "Stuntplane"},
    	//1=Helicopters
    	{11, 548, 1165000, VEHICLES_TYPE_HELICOPTERS, "Cargobob"},
    	{12, 425, 3165000, VEHICLES_TYPE_HELICOPTERS, "Hunter"},
    	{13, 417, 705000, VEHICLES_TYPE_HELICOPTERS, "Leviathan"},
    	{14, 487, 565000, VEHICLES_TYPE_HELICOPTERS, "Maverick"},
    	{15, 488, 565000, VEHICLES_TYPE_HELICOPTERS, "News Chopper"},
    	{16, 497, 865000, VEHICLES_TYPE_HELICOPTERS, "Police Maverick"},
    	{17, 563, 965000, VEHICLES_TYPE_HELICOPTERS, "Raindance"},
    	{18, 447, 905000, VEHICLES_TYPE_HELICOPTERS, "SeaSparrow"},
    	{19, 469, 965000, VEHICLES_TYPE_HELICOPTERS, "Sparrow"},
    	//2=Motos
    	{20, 581, 35000, VEHICLES_TYPE_MOTORBIKES, "Alpina BF-400"},
    	{21, 509, 5800, VEHICLES_TYPE_MOTORBIKES, "Bici Modelo A"},
    	{22, 481, 7000, VEHICLES_TYPE_MOTORBIKES, "Bici Modelo BMX"},
    	{23, 462, 9000, VEHICLES_TYPE_MOTORBIKES, "Vespa Faggio"},
    	{24, 521, 65000, VEHICLES_TYPE_MOTORBIKES, "Alpina FCR900"},
    	{25, 463, 36000, VEHICLES_TYPE_MOTORBIKES, "Harlem Mod 63"},
    	{26, 510, 7400, VEHICLES_TYPE_MOTORBIKES, "Bici Modelo MB"},
    	{27, 522, 650000, VEHICLES_TYPE_MOTORBIKES, "Alpina NRG 500"},
    	{28, 461, 54000, VEHICLES_TYPE_MOTORBIKES, "Alpina PCJ 600"},
    	{29, 448, 9500, VEHICLES_TYPE_MOTORBIKES, "Vespa PizzaBoy"},
    	{30, 468, 32000, VEHICLES_TYPE_MOTORBIKES, "Alpina Sanchez"},
    	{31, 586, 40000, VEHICLES_TYPE_MOTORBIKES, "Harlem Mod 84"},
    	{32, 471, 25000, VEHICLES_TYPE_MOTORBIKES, "KTG CuadBike"},
    	//3=Autos 2ptas std
    	
    	{33, 602, 300000, VEHICLES_TYPE_CARS2DOORS, "Meata Alpha"},
    	{34, 496, 35000, VEHICLES_TYPE_CARS2DOORS, "Blista Compact"},
    	{35, 401, 30000, VEHICLES_TYPE_CARS2DOORS, "Cowley Bravura"},
    	{36, 518, 45000, VEHICLES_TYPE_CARS2DOORS, "Monza Buccaneer"},
    	{37, 527, 30000, VEHICLES_TYPE_CARS2DOORS, "Cowley Cadrona"},
    	{38, 589, 37000, VEHICLES_TYPE_CARS2DOORS, "Blista Club"},
    	{39, 419, 28000, VEHICLES_TYPE_CARS2DOORS, "Monza Esperanto"},
    	{40, 587, 260000, VEHICLES_TYPE_CARS2DOORS, "Meata Euros"},
    	{41, 533, 44000, VEHICLES_TYPE_CARS2DOORS, "CMC Feltzer"},
    	{42, 526, 33000, VEHICLES_TYPE_CARS2DOORS, "Cowley Fortune"},
        {43, 474, 43000, VEHICLES_TYPE_CARS2DOORS, "Hold Hermes 56'"},
    	{44, 545, 96000, VEHICLES_TYPE_CARS2DOORS, "Hold Hustler 39'"},
    	{45, 517, 50000, VEHICLES_TYPE_CARS2DOORS, "Monza Majestic"},
    	{46, 410, 22000, VEHICLES_TYPE_CARS2DOORS, "Cowley Manana"},
    	{47, 600, 50000, VEHICLES_TYPE_CARS2DOORS, "Monza Picador"},
    	{48, 436, 22000, VEHICLES_TYPE_CARS2DOORS, "Cowley Previon"},
    	{49, 439, 34000, VEHICLES_TYPE_CARS2DOORS, "Monza Stallion"},
    	{50, 549, 36000, VEHICLES_TYPE_CARS2DOORS, "Monza Tampa"},
    	{51, 491, 34000, VEHICLES_TYPE_CARS2DOORS, "Monza Virgo"},
    	{52, 565, 48000, VEHICLES_TYPE_CARS2DOORS, "Blista Flash"},
    	{53, 402, 70000, VEHICLES_TYPE_CARS2DOORS, "Monza Buffalo"},
    	{54, 542, 25000, VEHICLES_TYPE_CARS2DOORS, "Monza Clover"},
    	{55, 603, 60000, VEHICLES_TYPE_CARS2DOORS, "Monza Phoenix"},
    	{56, 475, 45000, VEHICLES_TYPE_CARS2DOORS, "Monza Sabre"},
    	{57, 536, 30000, VEHICLES_TYPE_CARS2DOORS, "Monza Blade"},
    	{58, 575, 37000, VEHICLES_TYPE_CARS2DOORS, "Hold Broadway 56'"},
    	{59, 534, 28000, VEHICLES_TYPE_CARS2DOORS, "Hold Remington 64'"},
    	{60, 535, 260000, VEHICLES_TYPE_CARS2DOORS, "Monza Slamvan"},
    	{61, 576, 44000, VEHICLES_TYPE_CARS2DOORS, "Hold Tornado 59"},
    	{62, 412, 33000, VEHICLES_TYPE_CARS2DOORS, "Hold Voodoo 63"},
        {63, 555, 43000, VEHICLES_TYPE_CARS2DOORS, "Hold Hermes 56'"},
        {64, 500, 40000, VEHICLES_TYPE_CARS2DOORS, "CMC Mesa 4x4"},
        
        //4=Autos 4ptas STD
        
        
    	{65, 604, 4000, VEHICLES_TYPE_CARS4DOORS, "Hold Glendale Roto"},
    	{66, 507, 85000, VEHICLES_TYPE_CARS4DOORS, "Cowley Elegant"},
    	{67, 585, 23000, VEHICLES_TYPE_CARS4DOORS, "Cowley Emperor"},
    	{68, 466, 37000, VEHICLES_TYPE_CARS4DOORS, "Hold Glendale 68'"},
    	{69, 492, 28000, VEHICLES_TYPE_CARS4DOORS, "Monza Greenwood"},
    	{70, 546, 20000, VEHICLES_TYPE_CARS4DOORS, "Cowley Intruder"},
    	{71, 551, 54000, VEHICLES_TYPE_CARS4DOORS, "Cowley Merit"},
    	{72, 516, 28000, VEHICLES_TYPE_CARS4DOORS, "Cowley Nebula"},
        {73, 467, 35000, VEHICLES_TYPE_CARS4DOORS, "Hold Oceanic 61'"},
    	{74, 426, 96000, VEHICLES_TYPE_CARS4DOORS, "Cowley Premier'"},
    	{75, 547, 30000, VEHICLES_TYPE_CARS4DOORS, "Cowley Primo"},
    	{76, 405, 39000, VEHICLES_TYPE_CARS4DOORS, "CMC Sentinel"},
    	{77, 580, 50000, VEHICLES_TYPE_CARS4DOORS, "Hold Stafford 70"},
    	{78, 409, 22000, VEHICLES_TYPE_CARS4DOORS, "CMC Stretch"},
    	{79, 550, 34000, VEHICLES_TYPE_CARS4DOORS, "Cowley Sunrise"},
    	{80, 566, 36000, VEHICLES_TYPE_CARS4DOORS, "Monza Tahoma"},
    	{81, 540, 34000, VEHICLES_TYPE_CARS4DOORS, "CMC Vincent"},
    	{82, 421, 34000, VEHICLES_TYPE_CARS4DOORS, "Monza Washington"},
    	{83, 529, 23000, VEHICLES_TYPE_CARS4DOORS, "CMC Willard"},
    	{84, 567, 25000, VEHICLES_TYPE_CARS4DOORS, "Hold Savanna 72'"},
    	{85, 445, 35000, VEHICLES_TYPE_CARS4DOORS, "CMC Admiral"},
    	{86, 504, 445000, VEHICLES_TYPE_CARS4DOORS, "Hold Glendale Sport"},
		{87, 483, 50000, VEHICLES_TYPE_CARS4DOORS, "Hold Camper 61'"},
		//5 AutosSports
		
		{88, 429, 507000, VEHICLES_TYPE_SPORTS, "Lammar Banshee"},
    	{89, 541, 708000, VEHICLES_TYPE_SPORTS, "Lammar Bullet"},
    	{90, 415, 500000, VEHICLES_TYPE_SPORTS, "Maiuri Cheetah"},
    	{91, 480, 600000, VEHICLES_TYPE_SPORTS, "CMC Comet"},
    	{92, 562, 300000, VEHICLES_TYPE_SPORTS, "Meata Elegy"},
        {93, 434, 553000, VEHICLES_TYPE_SPORTS, "Hold Hotknife 41'"},
    	{94, 494, 80000, VEHICLES_TYPE_SPORTS, "SFMC Hotring A"},
    	{95, 502, 80000, VEHICLES_TYPE_SPORTS, "SFMC Hotring B"},
    	{96, 503, 82000, VEHICLES_TYPE_SPORTS, "SFMC Hotring C"},
    	{97, 411, 60000, VEHICLES_TYPE_SPORTS, "Maiuri Infernus"},
    	{98, 559, 322000, VEHICLES_TYPE_SPORTS, "Meata Jester"},
    	{99, 561, 100000, VEHICLES_TYPE_SPORTS, "Meata Stratum"},
    	{100, 560, 300000, VEHICLES_TYPE_SPORTS, "Meata Sultan"},
    	{101, 506, 400000, VEHICLES_TYPE_SPORTS, "Maiuri Super GT"},
    	{102, 451, 480000, VEHICLES_TYPE_SPORTS, "Maiuri Turismo"},
    	{103, 558, 70000, VEHICLES_TYPE_SPORTS, "Meata Uranus"},
    	{104, 477, 325000, VEHICLES_TYPE_SPORTS, "Meata ZR-350"},
    	
    	
    	//6 = Camionetas
    	{105, 459, 38000, VEHICLES_TYPE_TRUCKS, "Lagrand Berkley"},
    	{106, 422, 28000, VEHICLES_TYPE_TRUCKS, "Monza Bobcat"},
    	{107, 482, 45000, VEHICLES_TYPE_TRUCKS, "Lagrand Burrito"},
    	{108, 605, 5000, VEHICLES_TYPE_TRUCKS, "Hold Sadler 76' Rota"},
    	{109, 530, 300000, VEHICLES_TYPE_TRUCKS, "Forklift"},
    	{110, 418, 34000, VEHICLES_TYPE_TRUCKS, "Lagrand Moombeam"},
    	{111, 572, 400000, VEHICLES_TYPE_TRUCKS, "Mower"},
    	{112, 582, 70000, VEHICLES_TYPE_TRUCKS, "Lagrand NewsVan"},
    	{113, 413, 36000, VEHICLES_TYPE_TRUCKS, "Lagrand Pony"},
    	{114, 440, 32000, VEHICLES_TYPE_TRUCKS, "Lagrand Rumpo"},
    	{115, 543, 24000, VEHICLES_TYPE_TRUCKS, "Hold Sadler 76'"},
    	{116, 583, 682000, VEHICLES_TYPE_TRUCKS, "Tug"},
    	{117, 478, 35000, VEHICLES_TYPE_TRUCKS, "Hold Walton 68'"},
    	{118, 554, 48000, VEHICLES_TYPE_TRUCKS, "Monza Yosemite"},
		{119, 499, 80000, VEHICLES_TYPE_TRUCKS, "Lagrand Benson"},
    	{120, 609, 35000, VEHICLES_TYPE_TRUCKS, "Lagrand Boxville A"},
    	{121, 498, 35000, VEHICLES_TYPE_TRUCKS, "Lagrand Boxville B"},
    	{122, 524, 270000, VEHICLES_TYPE_TRUCKS, "Lagrand Cement Truck"},
    	{123, 532, 236000, VEHICLES_TYPE_TRUCKS, "Cosechadora"},
    	{124, 578, 232000, VEHICLES_TYPE_TRUCKS, "Lagrand DFT-30"},
    	{125, 486, 1124000, VEHICLES_TYPE_TRUCKS, "Dozer"},
    	{126, 406, 1682000, VEHICLES_TYPE_TRUCKS, "Dumper"},
    	{127, 573, 190000, VEHICLES_TYPE_TRUCKS, "SFMC Dune"},
    	{128, 455, 248000, VEHICLES_TYPE_TRUCKS, "Lagrand Flatbed"},
    	{129, 588, 80000, VEHICLES_TYPE_TRUCKS, "Hold HotDog Van 67'"},
    	{130, 403, 234000, VEHICLES_TYPE_TRUCKS, "Lagrand Linerunner"},
    	{131, 423, 70000, VEHICLES_TYPE_TRUCKS, "Hold Mr Whoopee 71'"},
    	{132, 414, 80000, VEHICLES_TYPE_TRUCKS, "Lagrand Mule"},
    	{133, 443, 236000, VEHICLES_TYPE_TRUCKS, "Lagrand Packer"},
    	{134, 515, 332000, VEHICLES_TYPE_TRUCKS, "Lagrand Roadtrain"},
    	{135, 514, 224000, VEHICLES_TYPE_TRUCKS, "Lagrand Tanker"},
    	{136, 531, 82000, VEHICLES_TYPE_TRUCKS, "Hold Tractor '65"},
    	{137, 456, 75000, VEHICLES_TYPE_TRUCKS, "Lagrand Yankee'"},
    	
    	
		//7= Gubernamentales & Especiales (No llevan precio)
		

    	{138, 416, 5555555, VEHICLES_TYPE_SPECIALS, "Cowley Ambulance"},
    	{139, 433, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand Barracks"},
    	{140, 427, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand Enforcer"},
    	{141, 490, 5555555, VEHICLES_TYPE_SPECIALS, "MASH Rancher E4 FBI"},
    	{142, 528, 5555555, VEHICLES_TYPE_SPECIALS, "MASH FBI Truck"},
    	{143, 407, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand FireTruck"},
    	{144, 544, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand FireTruck 2"},
    	{145, 523, 5555555, VEHICLES_TYPE_SPECIALS, "Alpina HPV1000"},
    	{146, 470, 5555555, VEHICLES_TYPE_SPECIALS, "MASH Patriot"},
    	{147, 596, 5555555, VEHICLES_TYPE_SPECIALS, "Cowley Elegant LS"},
    	{148, 598, 5555555, VEHICLES_TYPE_SPECIALS, "Monza VCPD Car"},
		{149, 599, 5555555, VEHICLES_TYPE_SPECIALS, "MASH Rancher E2 Police"},
    	{150, 597, 5555555, VEHICLES_TYPE_SPECIALS, "Cowley Elegant SF"},
    	{151, 432, 5555555, VEHICLES_TYPE_SPECIALS, "Rhino"},
    	{152, 601, 5555555, VEHICLES_TYPE_SPECIALS, "Swat Anti Riot"},
    	{153, 428, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand Securicar"},
    	{154, 485, 5555555, VEHICLES_TYPE_SPECIALS, "Bagagge"},
    	{155, 431, 5555555, VEHICLES_TYPE_SPECIALS, "MASH BUS"},
    	{156, 437, 5555555, VEHICLES_TYPE_SPECIALS, "MASH COACH"},
    	{157, 574, 5555555, VEHICLES_TYPE_SPECIALS, "Sweeper"},
    	{158, 525, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand TowTruck"},
    	{159, 408, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand Trashmaster"},
    	{160, 552, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand Utility Van"},
    	{161, 568, 5555555, VEHICLES_TYPE_SPECIALS, "SFMC Bandito"},
    	{162, 424, 5555555, VEHICLES_TYPE_SPECIALS, "MASH BF Injection"},
    	{163, 457, 5555555, VEHICLES_TYPE_SPECIALS, "Caddy"},
    	{164, 508, 5555555, VEHICLES_TYPE_SPECIALS, "Lagrand Journey"},
    	{165, 571, 5555555, VEHICLES_TYPE_SPECIALS, "SFMC Kart"},
    	{166, 444, 5555555, VEHICLES_TYPE_SPECIALS, "SFMC Monster A"},
    	{167, 556, 5555555, VEHICLES_TYPE_SPECIALS, "SFMC Monster B"},
		{168, 557, 5555555, VEHICLES_TYPE_SPECIALS, "SFMC Monster C"},
    	{169, 495, 5555555, VEHICLES_TYPE_SPECIALS, "SFMC Sandking"},
    	{170, 539, 5555555, VEHICLES_TYPE_SPECIALS, "Project Vortex"},
    	
    	//8= Wagons (Me los estaba olvidando csm)
    	
    	{171, 579, 56000, VEHICLES_TYPE_TRUCKS, "MASH Huntley"},
    	{172, 400, 44000, VEHICLES_TYPE_TRUCKS, "MASH Landstallker"},
    	{173, 404, 17000, VEHICLES_TYPE_TRUCKS, "Hold Perennial 74'"},
    	{174, 489, 35000, VEHICLES_TYPE_TRUCKS, "MASH Rancher E2"},
    	{175, 505, 45000, VEHICLES_TYPE_TRUCKS, "MASH Rancher E2 Lure"},
    	{176, 479, 18000, VEHICLES_TYPE_TRUCKS, "Monza Regina"},
    	{177, 442, 80000, VEHICLES_TYPE_TRUCKS, "Monza Romero"},
    	{178, 458, 45000, VEHICLES_TYPE_TRUCKS, "Cowley Solair"}

	};


