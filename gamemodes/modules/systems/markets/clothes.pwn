enum skins@Type{
    listid,
    name[40],
    model,
    price
};

new skinsModelData[][skins@Type] = {
    {0, "Nada", 0, 0},
    {1, "Truth", 1, 220},
    {2, "Maccer", 2, 250},
    {3, "Andre", 3, 250},
    {4, "Barry Thorne", 4, 220},
    {5, "Fat Thorne", 5, 220},
    {6, "Emmet", 6, 220},
    {7, "Taxi Driver", 7, 220},
    {8, "Janitor", 8, 220},
    {9, "Ped Normal Fem", 9, 250},
    {10, "Ped Normal Fem Mayor", 10, 220},
    {11, "Casino Crupier", 11, 350},
    {12, "Rich Woman", 12, 250},
    {13, "Street Girl", 13, 220},
    {14, "Normal Ped Masc", 14, 220},
    {15, "Mr.Whittaker", 15, 220},
    {16, "Airport Ground Worker", 16, 220},
    {17, "Businessman", 17, 350},
    {18, "Beach Visitor", 18, 220},
    {19, "DJ", 19, 220},
    {20, "Rich Guy", 20, 220},
    {21, "Normal gang Ped", 21, 220},
    {22, "Normal Black ped", 22, 220},
    {23, "BMXer", 23, 250},
    {24, "Madd Dogg Bodyguard 1", 24, 250},
    {25, "Madd Dogg Bodyguard 2", 25, 250},
    {26, "Mochilero", 26, 220},
    {27, "Construction Worker", 27, 220},
    {28, "Dealer 1", 28, 220},
    {29, "Dealer 2", 29, 220},
    {30, "Dealer 3", 30, 220},
    {31, "Pueblerina 1", 31, 220},
    {32, "Pueblerino 1", 32, 220},
    {33, "Pueblerino 2", 33, 220},
    {34, "Pueblerino 3", 34, 220},
    {35, "Jardinero", 35, 250},
    {36, "Golfista 1", 36, 250},
    {37, "Golfista 2", 37, 250},
    {38, "Ped Femenino Mayor", 38, 220},
    {39, "Pueblerina 2", 39, 220},
    {40, "Ped Femenino Rich 1", 40, 350},
    {41, "Ped Femenino Rich 2", 41, 350},
    {42, "Mecanico", 42, 220},
    {43, "Ped Masc Normal", 43, 220},
    {44, "Ped Mexicano", 44, 220},
    {45, "Beach Visitor", 45, 220},
    {46, "Ped Masculino Rich", 46, 350},
    {47, "Pandillero Green", 47, 220},
    {48, "Pandillero a Rayas", 48, 220},
    {49, "Anciano KungFu", 49, 350},
    {50, "Mecanico 2", 50, 220},
    {51, "Ciclista 1", 51, 220},
    {52, "Ciclista 2", 52, 220},
    {53, "Ped Femenino Mayor 2", 53, 220},
    {54, "Ped Femenino Mayor 3", 54, 220},
    {55, "Ped Femenino Joven 1", 55, 350},
    {56, "Ped Femenino Joven 2", 56, 350},
    {57, "Ped Oriental 1", 57, 350},
    {58, "Ped Oriental 2", 58, 220},
    {59, "Ped Joven a Rayas", 59, 350},
    {60, "Ped Joven Mangas Largas", 60, 350},
    {61, "Piloto", 61, 650},
    {62, "Colonel Fuhrberger", 62, 220},
    {63, "Prostituta 1", 63, 220},
    {64, "Prostituta 2", 64, 220},
    {65, "Kendl Jhonson", 65, 220},
    {66, "Jugador de Pool 1", 66, 220},
    {67, "Jugador de Pool 2", 67, 220},
    {68, "Parroco", 68, 220},
    {69, "PEd Femenina Joven", 69, 350},
    {70, "Cientifico", 70, 550},
    {71, "Guardia de Seguridad", 71, 220},
    {72, "Hippie 1", 72, 220},
    {73, "Hippie 2", 73, 220},
    {74, "CJ", 21112, 3220},
    {75, "Prostituta 3", 75, 220},
    {76, "Stewardess", 76, 220},
    {77, "Homeless Fem", 77, 220},
    {78, "Homeless Masc", 78, 220},
    {79, "Homeless 2", 79, 220},
    {80, "Boxer 1", 80, 550},
    {81, "Boxer 2", 81, 550},
    {82, "Black Elvis", 82, 650},
    {83, "White Elvis", 83, 650},
    {84, "Blue Elvis", 84, 650},
    {85, "Prostituta 3", 85, 220},
    {86, "Ryder", 86, 220},
    {87, "Prostituta 4", 87, 220},
    {88, "Anciana", 88, 220},
    {89, "Anciana 2", 89, 220},
    {90, "Jogger", 90, 220},
    {91, "Rich Woman", 91, 350},
    {92, "Rollerskater", 92, 220},
    {93, "Normal Ped", 93, 220},
    {94, "Normal Ped Old", 94, 220},
    {95, "Normal Ped Old 2", 95, 220},
    {96, "Jogger", 96, 220},
    {97, "Surfista", 97, 220},
    {98, "Normal Ped", 98, 250},
    {99, "Rollerskater", 99, 250},
    {100, "Motero", 100, 220},
    {101, "Ped Adolescente", 101, 250},
    {102, "Balla 1", 102, 220},
    {103, "Balla 2", 103, 220},
    {104, "Balla 3", 104, 220},
    {105, "Grove 1", 105, 220},
    {106, "Grove 2", 106, 220},
    {107, "Grove 3", 107, 220},
    {108, "Vagos 1", 108, 220},
    {109, "Vagos 2", 109, 220},
    {110, "Vagos 3", 110, 220},
    {111, "Ruso 1", 111, 350},
    {112, "Ruso 2", 112, 350},
    {113, "Ruso 3", 113, 350},
    {114, "Aztecas 1", 114, 220},
    {115, "Aztecas 2", 115, 220},
    {116, "Aztecas 3", 116, 220},
    {117, "Triada 1", 117, 450},
    {118, "Triada 2", 118, 450},
    {119, "Johnny Sindacco", 119, 350},
    {120, "Triad Boss", 120, 350},
    {121, "Da Nang Boy 1", 121, 250},
    {122, "Da Nang Boy 2", 122, 250},
    {123, "DA Nang Boy 3", 123, 250},
    {124, "Mafioso 1", 124, 350},
    {125, "Mafioso 2", 125, 350},
    {126, "Mafioso 3", 126, 350},
    {127, "Mafioso 4", 127, 350},
    {128, "Camionero", 128, 220},
    {129, "Anciana", 129, 220},
    {130, "Anciana Gorda", 130, 220},
    {131, "Campesina", 131, 220},
    {132, "Campesino", 132, 220},
    {133, "Camionero 2", 133, 220},
    {134, "Vagabundo 1", 134, 220},
    {135, "Vagabundo 2", 135, 220},
    {136, "Vagabundo 3", 136, 220},
    {137, "Vagabundo 4", 137, 220},
    {138, "Mujer de Playa 1", 138, 220},
    {139, "Mujer de Playa 2", 139, 220},
    {140, "Mujer de Playa 3", 140, 220},
    {141, "Empresaria", 141, 220},
    {142, "Taxista 2", 142, 220},
    {143, "Taxista 3", 143, 220},
    {144, "Hombre Enfermo", 144, 220},
    {145, "Mujer de Playa 4", 145, 220},
    {146, "Surfista 2", 146, 220},
    {147, "Periodista Varon", 147, 350},
    {148, "Periodista Mujer", 148, 350},
    {149, "Big Smoke Armado", 149, 850},
    {150, "Empresaria", 150, 650},
    {151, "Camionera", 151, 220},
    {152, "Colegiala traviesa", 152, 220},
    {153, "Capataz de construccion", 153, 440},
    {154, "Surfista", 154, 220},
    {155, "Pizzero", 155, 250},
    {156, "Barbero", 156, 350},
    {157, "Campesina", 157, 220},
    {158, "Granjero", 158, 220},
    {159, "Granjero", 159, 220},
    {160, "Vagabundo", 160, 220},
    {161, "Granjero 2", 161, 220},
    {162, "Granjero 3", 162, 220},
    {163, "Guardaespaldas 1", 163, 750},
    {164, "Guardaespaldas 2", 164, 750},
    {165, "Guardaespaldas 3", 165, 750},
    {166, "Guardaespaldas 4", 166, 750},
    {167, "Trabajador Cluckin Bell", 167, 220},
    {168, "Panchero", 168, 220},
    {169, "Ped Joven Simil Oriental", 169, 220},
    {170, "Ped Remera Roja y Negra", 170, 550},
    {171, "Blackjack Dealer", 171, 550},
    {172, "Casino croupier", 172, 550},
    {173, "SF Rifa 1", 173, 220},
    {174, "SF Rifa 2", 174, 220},
    {175, "SF Rifa 3", 175, 220},
    {176, "Barbero Joven Negro", 176, 220},
    {177, "Barbero Joven Blanco", 177, 220},
    {178, "Zorra", 178, 220},
    {179, "Armero", 179, 220},
    {180, "Tatuador", 180, 220},
    {181, "Punk", 181, 220},
    {182, "Taxista 3", 182, 220},
    {183, "Ped Normal Negro", 183, 220},
    {184, "Ped Normal Mexicano", 184, 220},
    {185, "Ped Clase Media", 185, 350},
    {186, "Ped Vestido a Traje", 186, 550},
    {187, "Ped Vestido a Traje", 187, 550},
    {188, "Adolescente", 188, 350},
    {189, "Valet Parking", 189, 650},
    {190, "Barbara", 190, 350},
    {191, "Helena", 191, 450},
    {192, "Michelle", 192, 550},
    {193, "Katie", 193, 550},
    {194, "Millie", 194, 550},
    {195, "Denise", 195, 250},
    {196, "Anciana Campirana", 196, 220},
    {197, "Campirana Gorda", 197, 220},
    {198, "Campirana Joven", 198, 220},
    {199, "Campirana Adulta", 199, 220},
    {200, "Vagabundo", 200, 220},
    {201, "Granjera Joven", 201, 220},
    {202, "Granjero Joven", 202, 220},
    {203, "Karate 1", 203, 650},
    {204, "Karate 2", 204, 650},
    {205, "Burger Shot Mujer", 205, 220},
    {206, "Taxi Driver 2", 206, 220},
    {207, "Prostituta", 207, 220},
    {208, "Suzie", 208, 750},
    {209, "Vendedor de Noodle", 209, 220},
    {210, "Instructor de Botes", 210, 220},
    {211, "Vendedora de Ropa", 211, 450},
    {212, "Vagabundo", 212, 220},
    {213, "Elvis Anciano", 213, 220},
    {214, "Maria Latore", 214, 750},
    {215, "Ped Femenino Negro", 215, 450},
    {216, "Ped Femenino Blanco", 216, 550},
    {217, "Clothes Shop Staff", 217, 220},
    {218, "Ped Normal Anciano", 218, 220},
    {219, "Ped Rich Woman Roja", 219, 750},
    {220, "Cab Driver", 220, 220},
    {221, "Cab Driver 2", 221, 220},
    {222, "Cab Driver 3", 222, 220},
    {223, "Ped Masculino Chulo", 223, 450},
    {224, "Ped Oriental Femenino", 224, 550},
    {225, "Ped Oriental Femenino", 225, 550},
    {226, "Skin Femenino Joven", 226, 350},
    {227, "Hombre Oriental 1", 227, 450},
    {228, "Hombre Oriental 2", 228, 450},
    {229, "Anciano Oriental", 229, 220},
    {230, "Vagabundo", 230, 220},
    {231, "Se�ora Mayor", 231, 220},
    {232, "Se�ora Mayor 2", 232, 220},
    {233, "Skin Femenino", 233, 350},
    {234, "Cab Driver", 234, 220},
    {235, "Ped Normal Anciano", 235, 220},
    {236, "Ped Normal Anciano", 236, 220},
    {237, "Prostituta", 237, 220},
    {238, "Prostituta Negra", 238, 220},
    {239, "Vagabundo", 239, 220},
    {240, "Hombre bien vestido", 240, 450},
    {241, "Gordo con Pelo Afro", 241, 220},
    {242, "Gordo con Boina", 242, 220},
    {243, "Prostituta", 243, 220},
    {244, "Streeper Femenina", 244, 350},
    {245, "Prostituta", 245, 220},
    {246, "Police Stripper", 246, 220},
    {247, "Motero", 247, 220},
    {248, "Motero", 248, 220},
    {249, "Chulo", 249, 850},
    {250, "Joven Masculino", 250, 220},
    {251, "Joven Guardavidas", 251, 220},
    {252, "Hombre en Boxer", 252, 220},
    {253, "Bus Driver", 253, 550},
    {254, "Motero", 254, 220},
    {255, "Chofer", 255, 950},
    {256, "Stripper", 256, 220},
    {257, "Stripper", 257, 220},
    {258, "Heckler", 258, 220},
    {259, "Heckler", 259, 220},
    {260, "Obrero de Construccion", 260, 220},
    {261, "Cab Driver", 261, 220},
    {262, "Cab Driver", 262, 220},
    {263, "Ped Normal Femenino", 263, 220},
    {264, "Payaso", 264, 220},
    {265, "Tempenny", 265, 3220},
    {266, "Pulaski", 266, 3220},
    {267, "Hernandez", 267, 3220},
    {268, "Dwayne", 268, 3220},
    {269, "Smoke", 269, 250},
    {270, "Sweet", 270, 350},
    {271, "Ryder", 271, 250},
    {272, "Mafioso", 272, 650},
    {273, "T-Bone Mendez", 273, 220},
    {274, "Paramedico", 274, 4220},
    {275, "Paramedico", 275, 4220},
    {276, "Paramedico", 276, 4220},
    {277, "Bombero", 277, 4220},
    {278, "Bombero", 278, 4220},
    {279, "Bombero", 279, 4220},
    {280, "Policia Masculino", 280, 4220},
    {281, "Policia Masculino", 281, 4220},
    {282, "Policia Masculino", 282, 4220},
    {283, "Policia Masculino", 283, 4220},
    {284, "Policia Masculino", 284, 4220},
    {285, "Policia Masculino", 285, 4220},
    {286, "Policia Masculino", 286, 4220},
    {287, "Militar", 287, 5220},
    {288, "Sheriff", 288, 4220},
    {289, "Zero", 289, 550},
    {290, "Ken Rosemberg", 290, 350},
    {291, "Kent Paul", 291, 350},
    {292, "Cesar", 292, 350},
    {293, "OG LOC", 293, 350},
    {294, "Woozie", 294, 750},
    {295, "Toreno", 295, 750},
    {296, "Jizzy", 296, 750},
    {297, "Madd Dogg", 297, 350},
    {298, "Catalina", 298, 650},
    {299, "Claude Speed", 299, 650},
    {300, "Policia", 300, 3220},
    {301, "Policia Masculino", 301, 3220},
    {302, "Policia Sin Uniforme", 302, 450},
    {303, "Policia Sin Uniforme", 303, 450},
    {304, "Policia Sin Uniforme", 304, 450},
    {305, "Policia Sin Uniforme", 305, 450},
    {306, "Policia Femenino", 306, 3220},
    {307, "Policia Femenino", 307, 3220},
    {308, "Paramedica Femenina", 308, 3220},
    {309, "Policia Femenino", 309, 3220},
    {310, "Sheriff Country", 310, 3350},
    {311, "Sheriff Country", 311, 3350},
    {312, "Skin VC Masculino", 20001, 3400},
    {313, "Skin VC Masculino", 20002, 3400},
    {314, "Skin VC Masculino", 20003, 3400},
    {315, "Skin VC Masculino", 20004, 3400},
    {316, "Skin VC Masculino", 20005, 3400},
    {317, "Skin VC Masculino", 20006, 3400},
    {318, "Skin VC Masculino", 20007, 3400},
    {319, "Skin VC Masculino", 20008, 3400},
    {320, "Skin VC Masculino", 20009, 3400},
    {321, "Skin VC Masculino", 20010, 3400},
    {322, "Skin VC Masculino", 20011, 3400},
    {323, "Skin VC Masculino", 20012, 3400},
    {324, "Skin VC Masculino", 20013, 3400},
    {325, "Skin VC Masculino", 20014, 3400},
    {326, "Skin VC Masculino", 20015, 3400},
    {327, "Skin VC Masculino", 20016, 3400},
    {328, "Skin VC Masculino", 20017, 3400},
    {329, "Skin VC Masculino", 20018, 3400},
    {330, "Skin VC Masculino", 20019, 3400},
    {331, "Skin VC Masculino", 20020, 3400},
    {332, "Skin VC Masculino", 20021, 3400},
    {333, "Skin VC Masculino", 20022, 3400},
    {334, "Skin VC Masculino", 20023, 3400},
    {335, "Skin VC Masculino", 20024, 3400},
    {336, "Skin VC Masculino", 20025, 3400},
    {337, "Skin VC Masculino", 20026, 3400},
    {338, "Skin VC Masculino", 20027, 3400},
    {339, "Skin VC Masculino", 20028, 3400},
    {340, "Skin VC Masculino", 20029, 3400},
    {341, "Skin VC Masculino", 20030, 3400},
    {342, "Skin VC Masculino", 20031, 3400},
    {343, "Skin VC Masculino", 20032, 3400},
    {344, "Skin VC Masculino", 20033, 3400},
    {345, "Skin VC Masculino", 20034, 3400},
    {346, "Skin VC Masculino", 20035, 3400},
    {347, "Skin VC Masculino", 20036, 3400},
    {348, "Skin VC Masculino", 20037, 3400},
    {349, "Skin VC Masculino", 20038, 3400},
    {350, "Skin VC Masculino", 20039, 3400},
    {351, "Skin VC Masculino", 20040, 3400},
    {352, "Skin VC Masculino", 20041, 3400},
    {353, "Skin VC Masculino", 20042, 3400},
    {354, "Skin VC Masculino", 20043, 3400},
    {355, "Skin VC Masculino", 20044, 3400},
    {356, "Skin VC Masculino", 20045, 3400},
    {357, "Skin VC Masculino", 20046, 3400},
    {358, "Skin VC Masculino", 20047, 3400},
    {359, "Skin VC Masculino", 20048, 3400},
    {360, "Skin VC Masculino", 20049, 3400},
    {361, "Skin VC Masculino", 20050, 3400},
    {362, "Skin VC Masculino", 20051, 3400},
    {363, "Skin VC Masculino", 20052, 3400},
    {364, "Skin VC Masculino", 20053, 3400},
    {365, "Skin VC Masculino", 20054, 3400},
    {366, "Skin VC Masculino", 20055, 3400},
    {367, "Skin VC Masculino", 20056, 3400},
    {368, "Skin VC Masculino", 20057, 3400},
    {369, "Skin VC Masculino", 20058, 3400},
    {370, "Skin VC Masculino", 20059, 3400},
    {371, "Skin VC Masculino", 20060, 3400},
    {372, "Skin VC Femenino", 20061, 3400},
    {373, "Skin VC Femenino", 20062, 3400},
    {374, "Skin VC Femenino", 20063, 3400},
    {375, "Skin VC Femenino", 20064, 3400},
    {376, "Skin VC Femenino", 20065, 3400},
    {377, "Skin VC Femenino", 20066, 3400},
    {378, "Skin VC Femenino", 20067, 3400},
    {379, "Skin VC Femenino", 20068, 3400},
    {380, "Skin VC Femenino", 20069, 3400},
    {381, "Skin VC Femenino", 20070, 3400},
    {382, "Skin VC Femenino", 20071, 3400},
    {383, "Skin VC Femenino", 20072, 3400},
    {384, "Skin VC Femenino", 20073, 3400},
    {385, "Skin VC Femenino", 20074, 3400},
    {386, "Skin VC Femenino", 20075, 3400},
    {387, "Skin VC Femenino", 20076, 3400},
    {388, "Skin VC Femenino", 20077, 3400},
    {389, "Skin VC Femenino", 20078, 3400},
    {390, "Skin VC Femenino", 20079, 3400},
    {391, "Skin VC Femenino", 20080, 3400},
    {392, "Skin VC Femenino", 20081, 3400},
    {393, "Skin VC Femenino", 20082, 3400},
    {394, "Skin VC Femenino", 20083, 3400},
    {395, "Skin VC Femenino", 20084, 3400},
    {396, "Skin VC Femenino", 20085, 3400},
    {397, "Skin VC Femenino", 20086, 3400},
    {398, "Skin VC Femenino", 20087, 3400},
    {399, "Skin VC Femenino", 20088, 3400},
    {400, "Skin VC Femenino", 20089, 3400},
    {401, "Skin VC Femenino", 20090, 3400},
    {402, "Skin VC Femenino", 20091, 3400},
    {403, "Skin VC Femenino", 20092, 3400},
    {404, "Skin VC Femenino", 20093, 3400},
    {405, "Skin VC Femenino", 20094, 3400},
    {406, "Skin VC Femenino", 20095, 3400},
    {407, "Skin VC Femenino", 20096, 3400},
    {408, "Skin VC Femenino", 20097, 3400},
    {409, "Skin VC Femenino", 20098, 3400},
    {410, "Skin VC Femenino", 20099, 3400},
    {411, "Skin VC Masculino", 20100, 3400},
    {412, "Skin VC Vice Urban", 20101, 3400},
    {413, "Skin VC Vice Urban", 20102, 3400},
    {414, "Skin VC Vice Urban", 20103, 3400},
    {415, "Skin VC Vice Urban", 20104, 3400},
    {416, "Skin VC Vice Urban", 20105, 3400},
    {417, "Skin VC Vice Urban", 20106, 3400},
    {418, "Skin VC Vice Urban", 20107, 3400},
    {419, "Skin VC Vice Urban", 20108, 3400},
    {420, "Skin VC Vice Urban", 20109, 3400},
    {421, "Skin VC Vice Urban", 20110, 3400},
    {422, "Skin VC Vice Urban", 20111, 3400},
    {423, "Skin VC Vice Urban", 20112, 3400},
    {424, "Skin VC Vice Urban", 20113, 3400},
    {425, "Skin VC Vice Urban", 20114, 3400},
    {426, "Skin VC Vice Urban", 20115, 3400},
    {427, "Skin VC Vice Urban", 20116, 3400},
    {428, "Skin VC Vice Urban", 20117, 3400},
    {429, "Skin VC Vice Urban", 20118, 3400},
    {430, "Skin VC Vice Urban", 20119, 3400},
    {431, "Skin VC Vice Urban", 20120, 3400},
    {432, "Skin VC Vice Urban", 20121, 3400},
    {433, "Skin VC Vice Urban", 20122, 3400},
    {434, "Skin VC Vice Urban", 20123, 3400},
    {435, "Skin VC Vice Urban", 20124, 3400},
    {436, "Skin VC Vice Urban", 20125, 3400},
    {437, "Skin VC Vice Urban", 20126, 3400},
    {438, "Skin VC Vice Urban", 20127, 3400},
    {439, "Skin VC Vice Urban", 20128, 3400},
    {440, "Skin VC Vice Urban", 20129, 3400},
    {441, "Skin VC Vice Urban", 20130, 3400},
    {442, "Skin VC Vice Urban", 20131, 3400},
    {443, "Skin VC Vice Urban", 20132, 3400},
    {444, "Skin VC Vice Urban", 20133, 3400},
    {445, "Skin VC Vice Urban", 20134, 3400},
    {446, "Skin VC Vice Urban", 20135, 3400},
    {447, "Skin VC Vice Urban", 20136, 3400},
    {448, "Skin VC Vice Urban", 20137, 3400},
    {449, "Skin VC Vice Urban", 20138, 3400},
    {450, "Skin VC Vice Urban", 20139, 3400},
    {451, "Skin VC Vice Urban", 20140, 3400},
    {452, "Skin VC Vice Urban", 20141, 3400},
    {453, "Skin VC Vice Urban", 20142, 3400},
    {454, "Skin VC Vice Urban", 20143, 3400},
    {455, "Skin VC Vice Urban", 20144, 3400},
    {456, "Skin VC Vice Urban", 20145, 3400},
    {457, "Skin VC Vice Urban", 20146, 3400},
    {458, "Skin VC Vice Urban", 20147, 3400},
    {459, "Skin VC Vice Urban", 20148, 3400},
    {460, "Skin VC Vice Urban", 20149, 3400},
    {461, "Skin VC Vice Urban", 20150, 3400},
    {462, "Skin VC Vice Urban", 20151, 3400},
    {463, "Skin VC Vice Urban", 20152, 3400},
    {464, "Skin VC Vice Urban", 20153, 3400},
    {465, "Skin VC Vice Urban", 20154, 3400},
    {466, "Skin VC Vice Urban", 20155, 3400},
    {467, "Skin VC Vice Urban", 20156, 3400},
    {468, "Skin VC Vice Urban", 20157, 3400},
    {469, "Skin VC Vice Urban", 20158, 3400},
    {470, "Skin VC Vice Urban", 20159, 3400},
    {471, "Skin VC Vice Urban", 20160, 3400},
    {472, "Skin VC Vice Urban", 20161, 3400},
    {473, "Skin VC Vice Urban", 20162, 3400},
    {474, "Skin VC Vice Urban", 20163, 3400},
    {475, "Skin VC Vice Urban", 20164, 3400},
    {476, "Skin VC Vice Urban", 20165, 3400},
    {477, "Skin VC Vice Urban", 20166, 3400},
    {478, "Skin VC Vice Urban", 20167, 3400},
    {479, "Skin VC Vice Urban", 20168, 3400},
    {480, "Skin VC Vice Urban", 20169, 3400},
    {481, "Skin VC Vice Urban", 20170, 3400},
    {482, "Skin VC Vice Urban", 20171, 3400},
    {483, "Skin VC Vice Urban", 20172, 3400},
    {484, "Skin VC Vice Urban", 20173, 3400},
    {485, "Skin VC Vice Urban", 20174, 3400},
    {486, "Skin VC Vice Urban", 20175, 3400},
    {487, "Skin VC Vice Urban", 20176, 3400},
    {488, "Skin VC Vice Urban", 20177, 3400},
    {489, "Skin VC Vice Urban", 20178, 3400},
    {490, "Skin VC Vice Urban", 20179, 3400},
    {491, "Skin VC Vice Urban", 20180, 3400},
    {492, "Skin VC Masculino", 20181, 3400},
    {493, "Skin VC Masculino", 20182, 3400},
    {494, "Skin VC Masculino", 20183, 3400},
    {495, "Skin VC Masculino", 20184, 3400},
    {496, "Skin VC Masculino", 20185, 3400},
    {497, "Skin VC Masculino", 20187, 3400},
    {498, "Skin VC Masculino", 20188, 3400},
    {499, "Skin VC Masculino", 20189, 3400},
    {500, "Skin VC Masculino", 20190, 3400},
    {501, "Skin VC Masculino", 20193, 3400},
    {502, "Skin VC Masculino", 20194, 3400},
    {503, "Skin VC Masculino", 20195, 3400},
    {504, "Skin VC Masculino", 20196, 3400},
    {505, "Skin VC Masculino", 20197, 3400},
    {506, "Skin VC Masculino", 20198, 3400},
    {507, "Skin VC Masculino", 20199, 3400},
    {508, "Skin VC Masculino", 20200, 3400},
    {509, "Skin VC Masculino", 20201, 3400},
    {510, "Skin VC Masculino", 20202, 3400},
    {511, "Skin VC Masculino", 20220, 3400},
	{512, "Skin VC Masculino", 20203, 3400},
    {513, "Skin VC Masculino", 20204, 3400},
    {514, "Skin VC Masculino", 20205, 3400},
    {515, "Skin VC Masculino", 20206, 3400},
    {516, "Skin VC Masculino", 20207, 3400},
    {517, "Skin VC Masculino", 20208, 3400},
    {518, "Skin VC Masculino", 20209, 3400},
    {519, "Skin VC Masculino", 20210, 3400},
    {520, "Skin VC Masculino", 20211, 3400},
    {521, "Skin VC Masculino", 20212, 3400},
    {522, "Skin VC Masculino", 20213, 3400},
    {523, "Skin VC Masculino", 20214, 3400},
    {524, "Skin VC Masculino", 20215, 3400},
    {525, "Skin VC Masculino", 20216, 3400},
    {526, "Skin VC Masculino", 20217, 3400},
    {527, "Skin VC Masculino", 20218, 3400},
    {528, "Skin VC Masculino", 20219, 3400},
    {529, "Skin VC Masculino", 20220, 3400},


};