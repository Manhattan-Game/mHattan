#define CAR_WINDOW_CLOSE 1
#define CAR_WINDOW_OPEN 0

#define GAS_TIME_UPDATED 100000
#define OIL_UPDATED 4
#define CONSUME_PER_KILOMETER 2
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

    vehicleidd,
    timergas,
    distanceAmmount

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
    name[40],
    consume,
    gas_limit
};

new vehiclesModelData[][vehi@clsType] ={
        //0=Aviones
        {0, 592, 3165000, 0, "Andromada", 100, 500},
        {1, 577, 3165000, 0, "AT-400", 100, 500},
        {2, 511, 1165000, 0, "Beagle", 80, 180},
        {3, 512, 865000, 0, "Cropduster", 85, 180},
        {4, 593, 965000, 0, "Dodo", 75, 160},
        {5, 520, 1165000, 0, "Hydra", 80, 180},
        {6, 553, 2165000, 0, "Nevada", 100, 650},
        {7, 476, 865000, 0, "Rustler", 80, 180},
        {8, 519, 1005000, 0, "Shamal", 100, 190},
        {9, 460, 965000, 0, "Skimmer", 80, 150},
        {10, 513, 995000, 0, "Stuntplane", 50, 160},
        //1=Helicopters
        {11, 548, 1165000, 1, "Cargobob", 80, 200},
        {12, 425, 3165000, 1, "Hunter", 100, 500},
        {13, 417, 705000, 1, "Leviathan", 85, 450},
        {14, 487, 565000, 1, "Maverick", 80, 350},
        {15, 488, 565000, 1, "News Chopper", 80, 350},
        {16, 497, 865000, 1, "Police Maverick", 80, 350},
        {17, 563, 965000, 1, "Raindance", 85, 300},
        {18, 447, 905000, 1, "SeaSparrow", 70, 200},
        {19, 469, 965000, 1, "Sparrow", 70, 200},
        //2=Motos
        {20, 581, 35000, 2, "Alpina BF-400", 29, 20},
        {21, 509, 5800, 2, "Bici Modelo A", 0, 0},
        {22, 481, 7000, 2, "Bici Modelo BMX", 0, 0},
        {23, 462, 9000, 2, "Vespa Faggio", 10, 10},
        {24, 521, 65000, 2, "Alpina FCR900", 35, 20},
        {25, 463, 36000, 2, "Harlem Mod 63", 45, 35},
        {26, 510, 7400, 2, "Bici Modelo MB", 0, 0},
        {27, 522, 650000, 2, "Alpina NRG 500", 40, 40},
        {28, 461, 54000, 2, "Alpina PCJ 600", 38, 45},
        {29, 448, 9500, 2, "Vespa PizzaBoy", 10, 10},
        {30, 468, 32000, 2, "Alpina Sanchez", 20, 15},
        {31, 586, 40000, 2, "Harlem Mod 84", 45, 50},
        {32, 471, 25000, 2, "KTG CuadBike", 20, 25},
        //3=Autos 2ptas std
        
        {33, 602, 300000, 3, "Meata Alpha", 35, 60},
        {34, 496, 35000, 3, "Blista Compact", 30, 45},
        {35, 401, 30000, 3, "Cowley Bravura",28, 45},
        {36, 518, 45000, 3, "Monza Buccaneer", 58, 67},
        {37, 527, 30000, 3, "Cowley Cadrona", 26, 40},
        {38, 589, 37000, 3, "Blista Club", 36, 48},
        {39, 419, 28000, 3, "Monza Esperanto", 50, 60},
        {40, 587, 260000, 3, "Meata Euros", 40, 50},
        {41, 533, 44000, 3, "CMC Feltzer", 45, 55},
        {42, 526, 33000, 3, "Cowley Fortune", 40, 50},
        {43, 474, 43000, 3, "Hold Hermes 56'", 65, 70},
        {44, 545, 96000, 3, "Hold Hustler 39'", 65, 60},
        {45, 517, 50000, 3, "Monza Majestic", 60, 75},
        {46, 410, 22000, 3, "Cowley Manana", 35, 45},
        {47, 600, 50000, 3, "Monza Picador", 59, 60},
        {48, 436, 22000, 3, "Cowley Previon", 40, 50},
        {49, 439, 34000, 3, "Monza Stallion", 65, 70},
        {50, 549, 36000, 3, "Monza Tampa", 68, 70},
        {51, 491, 34000, 3, "Monza Virgo", 51, 60},
        {52, 565, 48000, 3, "Blista Flash", 40, 55},
        {53, 402, 70000, 3, "Monza Buffalo", 70, 60},
        {54, 542, 25000, 3, "Monza Clover", 60, 55},
        {55, 603, 60000, 3, "Monza Phoenix", 75, 68},
        {56, 475, 45000, 3, "Monza Sabre", 68, 60},
        {57, 536, 30000, 3, "Monza Blade", 68, 65},
        {58, 575, 37000, 3, "Hold Broadway 56'", 60, 65},
        {59, 534, 28000, 3, "Hold Remington 64'", 65, 65},
        {60, 535, 260000, 3, "Monza Slamvan", 70, 65},
        {61, 576, 44000, 3, "Hold Tornado 59", 60, 60},
        {62, 412, 33000, 3, "Hold Voodoo 63",60, 60},
        {63, 555, 43000, 3, "Hold Windsor 61'", 58, 60},
        {64, 500, 40000, 3, "CMC Mesa 4x4", 45, 50},
        
        //4=Autos 4ptas STD
        
        
        {65, 604, 4000, 4, "Hold Glendale Roto", 70, 35},
        {66, 507, 85000, 4, "Cowley Elegant", 35, 55},
        {67, 585, 23000, 4, "Cowley Emperor", 40, 60},
        {68, 466, 37000, 4, "Hold Glendale 68'", 60, 60},
        {69, 492, 28000, 4, "Monza Greenwood", 50, 65},
        {70, 546, 20000, 4, "Cowley Intruder", 45, 60},
        {71, 551, 54000, 4, "Cowley Merit", 45, 60},
        {72, 516, 28000, 4, "Cowley Nebula", 45, 65},
        {73, 467, 35000, 4, "Hold Oceanic 61'", 60, 65},
        {74, 426, 96000, 4, "Cowley Premier'", 45, 65},
        {75, 547, 30000, 4, "Cowley Primo", 45, 55},
        {76, 405, 39000, 4, "CMC Sentinel", 40, 55},
        {77, 580, 50000, 4, "Hold Stafford 70", 68, 65},
        {78, 409, 22000, 4, "CMC Stretch", 45, 60},
        {79, 550, 34000, 4, "Cowley Sunrise", 45, 60},
        {80, 566, 36000, 4, "Monza Tahoma", 60, 60},
        {81, 540, 34000, 4, "CMC Vincent", 40, 60},
        {82, 421, 34000, 4, "Monza Washington", 45, 65},
        {83, 529, 23000, 4, "CMC Willard", 45, 60},
        {84, 567, 25000, 4, "Hold Savanna 72'", 60, 55},
        {85, 445, 35000, 4, "CMC Admiral", 40, 60},
        {86, 504, 445000, 4, "Hold Glendale Sport", 70, 50},
        {87, 483, 50000, 4, "Hold Camper 61'", 35, 70},
        //5 AutosSports
        
        {88, 429, 507000, 5, "Lammar Banshee",70, 60},
        {89, 541, 708000, 5, "Lammar Bullet", 79, 65},
        {90, 415, 500000, 5, "Maiuri Cheetah", 88, 60},
        {91, 480, 600000, 5, "CMC Comet", 85, 60},
        {92, 562, 300000, 5, "Meata Elegy", 68, 70},
        {93, 434, 553000, 5, "Hold Hotknife 41'", 40, 70},
        {94, 494, 80000, 5, "SFMC Hotring A", 70, 70},
        {95, 502, 80000, 5, "SFMC Hotring B", 75, 70},
        {96, 503, 82000, 5, "SFMC Hotring C", 80, 70},
        {97, 411, 60000, 5, "Maiuri Infernus", 90, 70},
        {98, 559, 322000, 5, "Meata Jester", 70, 68},
        {99, 561, 100000, 5, "Meata Stratum", 60, 68},
        {100, 560, 300000, 5, "Meata Sultan", 65, 68},
        {101, 506, 400000, 5, "Maiuri Super GT", 85, 70},
        {102, 451, 480000, 5, "Maiuri Turismo", 95, 70},
        {103, 558, 70000, 5, "Meata Uranus", 60, 65},
        {104, 477, 325000, 5, "Meata ZR-350", 65, 65},
        
        
        //6 = Camionetas
        {105, 459, 38000, 6, "Lagrand Berkley", 60, 65},
        {106, 422, 28000, 6, "Monza Bobcat", 60, 55},
        {107, 482, 45000, 6, "Lagrand Burrito", 55, 55},
        {108, 605, 5000, 6, "Hold Sadler 76' Rota", 70, 40},
        {109, 530, 300000, 6, "Forklift", 40, 40},
        {110, 418, 34000, 6, "Lagrand Moombeam", 45, 60},
        {111, 572, 400000, 6, "Mower", 35, 60},
        {112, 582, 70000, 6, "Lagrand NewsVan", 55, 60},
        {113, 413, 36000, 6, "Lagrand Pony", 45, 60},
        {114, 440, 32000, 6, "Lagrand Rumpo", 40,60},
        {115, 543, 24000, 6, "Hold Sadler 76'", 45, 65},
        {116, 583, 682000, 6, "Tug", 35, 60},
        {117, 478, 35000, 6, "Hold Walton 68'", 35, 70},
        {118, 554, 48000, 6, "Monza Yosemite", 45, 60},
        {119, 499, 80000, 6, "Lagrand Benson", 45, 60},
        {120, 609, 35000, 6, "Lagrand Boxville A", 45, 65},
        {121, 498, 35000, 6, "Lagrand Boxville B", 45, 65},
        {122, 524, 270000, 6, "Lagrand Cement Truck", 50, 85},
        {123, 532, 236000, 6, "Cosechadora", 45, 80},
        {124, 578, 232000, 6, "Lagrand DFT-30", 45, 80},
        {125, 486, 1124000, 6, "Dozer", 45, 80},
        {126, 406, 1682000, 6, "Dumper", 45, 80},
        {127, 573, 190000, 6, "SFMC Dune", 50, 50},
        {128, 455, 248000, 6, "Lagrand Flatbed", 50, 50},
        {129, 588, 80000, 6, "Hold HotDog Van 67'", 35, 50},
        {130, 403, 234000, 6, "Lagrand Linerunner", 50, 80},
        {131, 423, 70000, 6, "Hold Mr Whoopee 71'", 35, 60},
        {132, 414, 80000, 6, "Lagrand Mule", 45, 60},
        {133, 443, 236000, 6, "Lagrand Packer", 50, 60},
        {134, 515, 332000, 6, "Lagrand Roadtrain", 55, 55},
        {135, 514, 224000, 6, "Lagrand Tanker", 50, 50},
        {136, 531, 82000, 6, "Hold Tractor '65", 35, 65},
        {137, 456, 75000, 6, "Lagrand Yankee'", 45, 60},
        
        
        //7= Gubernamentales & Especiales (No llevan precio)
        

        {138, 416, 5555555, 7, "Cowley Ambulance", 45, 80},
        {139, 433, 5555555, 7, "Lagrand Barracks", 45, 80},
        {140, 427, 5555555, 7, "Lagrand Enforcer", 45, 80},
        {141, 490, 5555555, 7, "MASH Rancher E4 FBI", 45, 60},
        {142, 528, 5555555, 7, "MASH FBI Truck", 45, 80},
        {143, 407, 5555555, 7, "Lagrand FireTruck", 45, 80},
        {144, 544, 5555555, 7, "Lagrand FireTruck 2", 45, 80},
        {145, 523, 5555555, 7, "Alpina HPV1000", 35, 50},
        {146, 470, 5555555, 7, "MASH Patriot", 55, 80},
        {147, 596, 5555555, 7, "Cowley Elegant LS", 65, 60},
        {148, 598, 5555555, 7, "Monza VCPD Car", 40, 65},
        {149, 599, 5555555, 7, "MASH Rancher E2 Police", 45, 80},
        {150, 597, 5555555, 7, "Cowley Elegant SF", 65, 50},
        {151, 432, 5555555, 7, "Rhino", 45, 80},
        {152, 601, 5555555, 7, "Swat Anti Riot", 45, 80},
        {153, 428, 5555555, 7, "Lagrand Securicar", 45, 80},
        {154, 485, 5555555, 7, "Bagagge", 35, 65},
        {155, 431, 5555555, 7, "MASH BUS", 50, 80},
        {156, 437, 5555555, 7, "MASH COACH", 55, 80},
        {157, 574, 5555555, 7, "Sweeper", 25, 60},
        {158, 525, 5555555, 7, "Lagrand TowTruck", 45, 80},
        {159, 408, 5555555, 7, "Lagrand Trashmaster", 45, 88},
        {160, 552, 5555555, 7, "Lagrand Utility Van", 45, 60},
        {161, 568, 5555555, 7, "SFMC Bandito", 35, 40},
        {162, 424, 5555555, 7, "MASH BF Injection", 45, 45},
        {163, 457, 5555555, 7, "Caddy", 25, 40},
        {164, 508, 5555555, 7, "Lagrand Journey", 45, 75},
        {165, 571, 5555555, 7, "SFMC Kart", 10, 30},
        {166, 444, 5555555, 7, "SFMC Monster A", 45, 80},
        {167, 556, 5555555, 7, "SFMC Monster B", 45, 80},
        {168, 557, 5555555, 7, "SFMC Monster C", 45, 80},
        {169, 495, 5555555, 7, "SFMC Sandking", 45, 60},
        {170, 539, 5555555, 7, "Project Vortex", 50, 100},
        
        //8= Wagons (Me los estaba olvidando csm)
        
        {171, 579, 56000, 8, "MASH Huntley", 45, 55},
        {172, 400, 44000, 8, "MASH Landstallker", 40, 65},
        {173, 404, 17000, 8, "Hold Perennial 74'", 45, 60},
        {174, 489, 35000, 8, "MASH Rancher E2", 45, 50},
        {175, 505, 45000, 8, "MASH Rancher E2 Lure", 45, 55},
        {176, 479, 18000, 8, "Monza Regina", 45, 50},
        {177, 442, 80000, 8, "Monza Romero", 45, 50},
        {178, 458, 45000, 8, "Cowley Solair", 45, 60}

};


