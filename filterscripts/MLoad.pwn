
#include <a_samp>
#include <streamer>


AntiDeAMX()
{
    new a[][] =
    {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused a
}

#define COLOR_MESSAGE_YELLOW	0xFFDD00AA

#pragma tabsize 0
#define zhmodels_vworld   0
#define modelbaseid

main(){}

public OnFilterScriptInit()
{
    AntiDeAMX();
	Streamer_VisibleItems(STREAMER_TYPE_OBJECT, 2000);
	AddAll_MEMODS();
	return 1;
}

/* --------------------------------------------------------------------------------------------------------------------------------- */
new modelflags_flags[69] =
{
	0,2097152,4,2097156,2097284,2097220,2097280,128,68,5,132,2,2048,64,140,2176,2099328,2097348,
	196,1,129,8321,19466, 192,4100,4096,8192,32896,2162816,2130052,32900,2130048,32768,1048580,32,160,164,2097184,262148,65536,69,
	2097157,2180,2097153,130,8196,131072,1024,1028,516,8324,2105476,2105348,12420,4194304,2098180,2098244,6,640,2146436,2113668,
	2113540,2113536,2129924,2138244,2138116,2109572,2146308,2101248
};

new modelflags_index[68] =
{
	18631,18636,18637,18656,18783,19197,19489,19490,19605,19628,19857,11089,11102,11306,11324,8948,
	9099,16013,16448,12800,13116,13273,17978,990,994,17040,1223,1225,1278,1306,1315,1350,1490,1491,1492,1493,1533,14547,14570,
	4596,6489,6517,5750,3781,3948,2969,3034,1649,1651,800,881,882,904,2756,3850,3857,13595,8197,620,624,629,649,658,670,693,738,
	739,1138
};

/* --------------------------------------------------------------------------------------------------------------------------------- */
FindModelIDForFlags(flags)
{
	flags &= 0xFFFFFFDF; // remove the interior flag

	new x=0;
	while(x!=68)
	{
	    if(modelflags_flags[x] == flags) return modelflags_index[x];
	    x++;
	}
	return 19353;
}
/* --------------------------------------------------------------------------------------------------------------------------------- */

AddAllMODSRPSimpleObject(flags,newmodelid,dffpath[],txdpath[])
{
	AddSimpleModel(zhmodels_vworld,FindModelIDForFlags(flags),newmodelid,dffpath,txdpath);
}


AddAll_MEMODS()
{
	/*
	****************************************************************************************
	******************* CONVERSION MIAMI SIDE - KaizerHind | MaximousSoft ******************
	****************************************************************************************
	|																					   |
	| This conversion belongs to the MiamiSide project, converted and created by           |
    | KaizerHind and MaximousSoft.                                                         |
    | Please don't edit this file, don't delete the credits, dont edit the coordinates.    |
    | This conversion is made by KaizerHind, any edition or support u need, please		   |
    | contact me.                                                                          |
	|																					   |
	| E-mail: zaikmodding@gmail.com														   |
	|																					   |
	****************************************************************************************
	*/


    /*ddAllMODSRPSimpleObject(0, -1001, "MSide/Exterior/pr_gasbath.dff", "MSide/Exterior/beach_gas.txd");
    AddAllMODSRPSimpleObject(0, -1002, "MSide/Exterior/prp_station.dff", "MSide/Exterior/prp_beach.txd");
    AddAllMODSRPSimpleObject(0, -1003, "MSide/Exterior/rent_avehs.dff", "MSide/Exterior/rentvh_shop.txd");
    AddAllMODSRPSimpleObject(0, -1004, "MSide/Exterior/offc_cvehs.dff", "MSide/Exterior/rentvh_shop.txd");
    AddAllMODSRPSimpleObject(0, -1005, "MSide/Exterior/prp_map1.dff", "MSide/Exterior/rentvh_shop.txd");
    AddAllMODSRPSimpleObject(0, -1006, "MSide/Exterior/prp_map23.dff", "MSide/Exterior/rentvh_shop.txd");
    AddAllMODSRPSimpleObject(0, -1007, "MSide/Exterior/mai_sand0.dff", "MSide/Exterior/bchzone.txd");
    AddAllMODSRPSimpleObject(0, -1008, "MSide/Exterior/park_alqshop.dff", "MSide/Exterior/pkgshops.txd");*/

    
	
	AddCharModel (254, 25002, "skins/pablo.dff", "skins/pablo.txd");
	AddCharModel (253, 25003, "skins/xylos.dff", "skins/xylos.txd");

    print("#---------- Folder MSide Exterior Loaded ----------# \n");

	
    print("\n");
	print("#------------------------------------------------# \n");
	print("#---------- Models successfully loaded ----------# \n");
	print("#------------------------------------------------# \n");
}











