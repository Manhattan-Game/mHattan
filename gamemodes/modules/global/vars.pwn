#define d_login 0
#define d_login2 1
#define d_login3 2
#define d_crearpj4 3 // 6
#define d_crearpj5 4
#define d_crearpj6 5
//Empresa
#define d_empresa 6
#define d_empresaretirar 7
#define d_empresadepositar 8
#define d_gestmiembros 9
#define d_editmember 10
#define d_modifyrange 11
#define d_editmueble 12
// NEGOCIOS
#define d_negocio 13
#define d_negociodepositar 14
#define d_negocioretirar 15
#define d_negocioproduct 16
#define d_negociostock 17
#define d_productPrice 18

// DIALOG AUTOS
#define d_baul 19
#define d_gps 20
#define d_gpsemp 21
#define d_gpsneg 22
#define d_gestskin 23


#define countXylosDialog 7


//colores
#define Chat_Blanco "{FFFFFF}"
#define Chat_Rosa "{FF00D9}"
#define Chat_Violeta "{DFA7F2}"
#define Chat_Azul "{A1C2FF}"
#define Chat_Verde "{63F279}"
#define Chat_Amarillo "{FAF623}"
#define Chat_Negro "{69670C}"
#define Chat_Rojo "{FF0000}"
#define Chat_Naranja "{F2C80C}"
#define Chat_Hielo "{03F2FF}"
#define Chat_Lima "{00FF40}"
#define Chat_Gris "{D4D4D4}"
#define Chat_Me 	"{A5D52E}"
#define Chat_Duda "{0C3E9C}"
#define Chat_Radio "{A06013}"
#define Chat_Phone "{77927F}"
// MAXIMOS
#define MAX_DINERO_MANO 50000
#define D_PAGO_DIARIO 1000

//TECLAS
#define HOLDING(%0) \
    ((newkeys & (%0)) == (%0))


#define EmbrageM KEY_LOOK_BEHIND
#define ArribaM KEY_YES
#define AbajoM KEY_NO



// LOGIN by xylos
new compararpass[MAX_PLAYERS][64];
// PERSONAJES BY XYLOS 
new edad[MAX_PLAYERS] = 18;
new origenMK[MAX_PLAYERS] = 1;
new sexoMK[MAX_PLAYERS] = 1;
new skinMK[MAX_PLAYERS] = 55;
new nombreMK[MAX_PLAYERS][60];
// Niveles xylos
new maxEXP[MAX_PLAYERS];
// canal de dudas
new timerDudas[MAX_PLAYERS];

//celular
new EnLlamada[MAX_PLAYERS];
new bool:llamando[MAX_PLAYERS];
new bool:yaenllamada[MAX_PLAYERS];
new eligiendoC[MAX_PLAYERS];
new eligiendoM[MAX_PLAYERS];
new mensajeA[MAX_PLAYERS];
// coches
new timerVelocimetro[MAX_PLAYERS];
new bool:enVelocimetro[MAX_PLAYERS];
new marcha[MAX_PLAYERS];
new embrage[MAX_PLAYERS];
new reversa[MAX_PLAYERS];

new editandoCoche[MAX_PLAYERS];
new attachandoA[MAX_PLAYERS];
new slotv[MAX_PLAYERS];
new eligiendoAttach[MAX_PLAYERS];
new eligiendoBaul[MAX_PLAYERS];


new registrandoSlot[MAX_PLAYERS];
new vehiclesPablo[4];


enum trabajo@sdd
{
	bool:taxi_servicio,
	taxi_client,
	taxi_tarifa,
	taxi_timer
};
new trabajoData[MAX_PLAYERS][trabajo@sdd];

