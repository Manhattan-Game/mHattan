#define HOUSE_STATE_ON_SALE 0
#define HOUSE_STATE_PURCHASE 1
#define HOUSE_STATE_RENT 2

enum hous@dat@s{
	listid,
	characterid,
	doorid,
	price,
	direction[40],
	garajedoorid,
	type,
	interior,
	level,
	virtualworld,
	statee,
	safe,

	Text3D:label,
	pickup,
	bool:loaded
};

new houseData[MAX_HOUSES][hous@dat@s];
new editHouse[MAX_PLAYERS];