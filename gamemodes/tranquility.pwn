/*

		T*R*A*N*Q*U*L*I*T*Y - RPG SIMULATION.
		
		MRWARHEAD from 2018
		October 2018

*/

#if !defined _samp_included
	#tryinclude a_samp
		#if !defined _samp_included
		    #error Error: Include: a_samp
		#endif
#endif

// ... OWN DEVELOPMENTS ....

#tryinclude TRNQLT\Ccmd
#tryinclude TRNQLT\Gvar
#tryinclude TRNQLT\Vectoral_Vector
#tryinclude TRNQLT\Streamer
#tryinclude TRNQLT\Sscanf
#tryinclude TRNQLT\Mxdate
#tryinclude TRNQLT\Mysql
#tryinclude TRNQLT\Foreach

#tryinclude DVLPMNTS\Security
#tryinclude DVLPMNTS\Memory

#define TAXI_PRICEROUT		0.6
#define TAXI_PRICERENT		500

#define DIALOG_BASE_X   	75.0
#define DIALOG_BASE_Y   	130.0
#define DIALOG_WIDTH    	550.0
#define DIALOG_HEIGHT   	180.0
#define SPRITE_DIM_X     	30.0
#define SPRITE_DIM_Y     	35.0
#define INVNUMBERS 			79
#define TOTAL_ITEMS         INVNUMBERS
#define SELECTION_ITEMS 	84
#define ITEMS_PER_LINE  	14

#define NameServer 			"Tranquility Simulation"

#pragma dynamic             8192

#define SECOND_FLOOD        4
#define REPORT_FLOOD		60

#define d_Box               0
#define d_Input             1
#define d_List              2
#define d_Password          3

#define D_NULL 				0
#define D_REG				1
#define D_LOG               7
#define D_HOUSE             8
#define D_MENU              25
#define D_ADMIN             80
#define D_ADD               100
#define D_GPS               150
#define D_ERROR             250
#define D_CMDHELP           260
#define D_ATM               285
#define D_ACTION            325
#define D_STATS             380
#define D_EXTRA             385
#define D_DINFO             400
#define D_ITEMS             450
#define D_AUTO              550
#define D_DRIVE_EXAM        570
#define D_BUSINESS          585
#define D_NEWS              600
#define D_WORK              633
#define D_MOBILE            700
#define D_SMI               800
#define D_BANK              830
#define D_FRACTION          900
#define D_BUY               1000
#define D_RULER             1300
#define D_MONEYBACK         1350
#define D_TD				1500
#define D_PARK              1700
#define D_AUG               1800
#define D_AMBIENT           1900

#define COLOR_BOX           0x00000050
#define	COLOR_GREY 			0xAFAFAFAA
#define COLOR_GREEN 		0x33AA33AA
#define COLOR_RED 			0xAA3333AA
#define COLOR_PAYCHEC       0xa4cd00AA
#define COLOR_BLACK 		0x000000AA
#define COLOR_WHITE 		0xFFFFFFAA
#define COLOR_YELLOW        0xFFEE00FF
#define COLOR_PLAYER        0xFFFFFF10
#define COLOR_ORANGE 		0xFF9900AA
#define COLOR_PURPLE 		0xC2A2DAAA
#define COLOR_GRELIN        0x317CDFAA
#define COLOR_CREAM         0xFFFEBFFF
#define COLOR_LIGHTRED 		0xFF6347AA
#define COLOR_BLUE          0x33CCFFAA
#define COLOR_AQUA      	0x7FC0E3FF

#define MAX_GPS             200
#define MAX_ENTERS          15
#define MAX_BIZZ            15
#define MAX_BAUTO           15
#define MAX_ATM             15
#define MAX_HOUSE           50
#define MAX_FRACTION        15
#define MAX_TAXI            3
#define MAX_Q               512
#define MAX_F               192
#define MAX_SS              150
#define MAX_C               360
#define MAX_CC              100
#define MAX_V               64
#define MAX_T               64
#define MAX_S               1024

#define POS_X 				1821.3362
#define POS_Y 				-1311.8143
#define POS_Z 				28.9101

#define AH_X                1502.6322
#define AH_Y                1306.2178
#define AH_Z                1093.8641

#define LoggedTimeOver 		"[!] ����� �� ����������� ����������, ��� ������ �� ���� �������: {FFFFFF}/q(uit)"
#define PlayerNeedLogged 	"[!] ���������� ����������������, ��� ������ �� ���� �������: {FFFFFF}/q(uit)"
#define NotTruePassword 	"[!] �������� ������ ��� ������ �� ���� �������: {FFFFFF}/q(uit)"
#define PlayerRepFlood		"[!] ����������� � �������������� ������� �������� ������ ��� � 1 ������."
#define PlayerIsNotInCar 	"[!] �� ������ ���������� � ����������!"
#define CarHasNoFuel 		"[!] � ������ ���������� ������!"
#define NotEnoughMoney      "[!] ������������ �������."
#define PlayerNotInHome 	"[!] ����� ��� ����."
#define PlayerIsNotInHome 	"[!] �� �� ���������� � ����."
#define NoFlood 			"[!] ���������� ���������� ����!"

#define HOST    			"localhost"
#define USER    			"root"
#define BASE      			"trnqlt"
#define PASS    			"W3wvqis3Sz"

#define TABLE_ACCOUNT       "accounts"
#define TABLE_ENTERS        "enters"
#define TABLE_BIZZ          "organizations"
#define TABLE_GPS           "gps"
#define TABLE_CARS          "cars"
#define TABLE_ATM           "atm"
#define TABLE_HOUSE         "house"

#define GetName(%0) cDataInfo[%0][Name]

#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

#define vFractions(%0)      CarsCreated[%0]

#define OwnedVeh(%0)        VehCreated[%0]

#define Round(%0) \
		for(new d, x = cvector_g_size(FOR_SERVERS); d != x; %0 &=0, %0 +- cvector_g_get(FOR_SERVERS, d++))

#define void%0(%1)     \
        forward%0(%1); \
	    public%0(%1)
	    
#define SendAdmin(%0,%1,%2)  format(form, 148, %1,%2) && SendAdminMessage(%0, form)
#define SendMes(%0,%1,%2,%3) format(form, 148, %2,%3) && SendClientMessage(%0, %1, form)

#define KickFromServer(%0)	SetTimerEx("Quit", GetPlayerPing(%0)*2, false, "i", %0)

enum TRANQUILIZATOR_DATA
{
	Float:ObjPos[3],
	ObjID,
	ObjData
};
new PlayerInv[MAX_PLAYERS][INVNUMBERS];

new InvObjects[INVNUMBERS] =
{
	1581,
	2663,
	1666,
	1546,
	2806,
	2804,
	2856,
	2768,
	2814,
	2769,
	349,
	348,
	355,
	356,
	358,
	352,
	353,
	372,
	2040,//
	2040,
	2040,
	2040,
	2040,
	2040,
	2040,
	2040,//
	336,
	339,
	337,
	335,
	334,
	1575,
	1644,
	1578,
	1580,
	328,
	2709,
	1579,
	1242,
	1085,
	2969,
	3013,
	1650,
	1650,
	1509,
	1509,
	2386,
	2386,
	2386,
	3026,
	371,
	19167,
	18875,
	330,
	2710,
	327,
	841,
	2859,
	1455,
	346,
	347,
	350,
	359,
	2040,
	2040,
	2040,
	2040,
	2386,
	2386,
	1310,
	1310,
	357,
	351,
	342,
	344,
	2040,
	2040,
	2926,
	1279
};

enum SUB_DATA
{
	iD_sub[64],
	iD_text[512]
};

enum CHARACTERS_DATA
{
	IP[16],
	pLic[5],
	pGun[13],
	pMail[64],
	pLics[16],
	pGuns[40],
	pAmmo[13],
	pAmmos[160],
	pNation[32],
	pSkills[40],
	pGunSkill[7],
	pRegData[16],
	pPassword[32],
	pAdmPassword[32],
	Name[MAX_PLAYER_NAME],
	pSpawns,
	pWanted,
	pWantedTime,
	pMarried[MAX_PLAYER_NAME],
	pJobAmounts[30],
	pJobAmount[3],
	Float:pPos[4],
	pCrimes,
   	pWantedWho,
   	pWantedReason,
   	pGPS,
   	pPack,
   	pSlots,
};
new cDataInfo[MAX_PLAYERS][CHARACTERS_DATA];

enum bzInfo
{
	id,
	Float:bEntrx,
	Float:bEntry,
	Float:bEntrz,
	Float:bExitx,
	Float:bExity,
	Float:bExitz,
	Float:bMenux,
	Float:bMenuy,
	Float:bMenuz,
	bOwner[MAX_PLAYER_NAME],
	bPrice,
	bMoney,
	bType,
	bLic,
	bInt,
	bVW,
	bLock,
	bEnter,
	bMIcon,
	bIcon,
	bPickup,
	bPickupExit,
	bName[MAX_PLAYER_NAME],
	bProduct,
	bTill,
	bMenu,
	bLockTime
};

new BizzInfo[MAX_BIZZ][bzInfo],BizzPay[MAX_BIZZ];
new Text3D:LABELBIZZ[MAX_BIZZ];

enum HOUSE_DATA
{
	hID,
	hLock,
	hPrice,
	hMIcon,
	hOplata,
	hInt[2],
	hProd[3],
	hPickup[2],
	hOwner[32],
	hDiscript[16],
	Float:hCar[4],
	Float:hEntr[3],
	Float:hExit[3]
};
new HouseInfo[MAX_HOUSE][HOUSE_DATA];


enum ATM_DATA { id, Float:aX, Float:aY, Float:aZ, Float:arZ };
new ATMInfo[MAX_ATM][ATM_DATA], ATM[MAX_ATM];
new Text3D: LABELATM[MAX_ATM];

enum tInfo
{
	tModel,
	Float:tPosX,
	Float:tPosY,
	Float:tPosZ,
	Float:tPosA
};

new t_Info[MAX_TAXI][tInfo] = {
{420, 1736.6744, -1859.7969, 13.2723, 270.0},
{420, 1745.0928, -1859.7969, 13.2709, 270.0},
{420, 1762.7397, -1859.7969, 13.2713, 270.0}
};

enum SAZONE_MAIN
{
	SAZONE_NAME[32],
	Float:SAZONE_AREA[6]
};
new gZoneInfo[365][SAZONE_MAIN] = {
{"The Big Ear",	                {-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
{"Aldea Malvada",               {-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
{"Angel Pine",                  {-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
{"Arco del Oeste",              {-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
{"Avispa Country Club",         {-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
{"Avispa Country Club",         {-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
{"Avispa Country Club",         {-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
{"Avispa Country Club",         {-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
{"Avispa Country Club",         {-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
{"Avispa Country Club",         {-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
{"Back o Beyond",               {-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
{"Battery Point",               {-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
{"Bayside",                     {-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
{"Bayside Marina",              {-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
{"Beacon Hill",                 {-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
{"Blackfield",                  {964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
{"Blackfield",                  {964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
{"Blackfield Chapel",           {1375.60,596.30,-89.00,1558.00,823.20,110.90}},
{"Blackfield Chapel",           {1325.60,596.30,-89.00,1375.60,795.00,110.90}},
{"Blackfield Intersection",     {1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
{"Blackfield Intersection",     {1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
{"Blackfield Intersection",     {1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
{"Blackfield Intersection",     {1375.60,823.20,-89.00,1457.30,919.40,110.90}},
{"Blueberry",                   {104.50,-220.10,2.30,349.60,152.20,200.00}},
{"Blueberry",                   {19.60,-404.10,3.80,349.60,-220.10,200.00}},
{"Blueberry Acres",             {-319.60,-220.10,0.00,104.50,293.30,200.00}},
{"Caligula's Palace",           {2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
{"Caligula's Palace",           {2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
{"Calton Heights",              {-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
{"Chinatown",                   {-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
{"City Hall",                   {-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
{"Come-A-Lot",                  {2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
{"Commerce",                    {1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},
{"Commerce",                    {1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
{"Commerce",                    {1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
{"Commerce",                    {1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
{"Commerce",                    {1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
{"Commerce",                    {1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},
{"Conference Center",           {1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},
{"Conference Center",           {1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},
{"Cranberry Station",           {-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
{"Creek",                       {2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
{"Dillimore",                   {580.70,-674.80,-9.50,861.00,-404.70,200.00}},
{"Doherty",                     {-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
{"Doherty",                     {-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
{"Downtown",                    {-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},
{"Downtown",                    {-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
{"Downtown",                    {-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
{"Downtown",                    {-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
{"Downtown",                    {-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
{"Downtown",                    {-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
{"Downtown Los Santos",         {1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
{"Downtown Los Santos",         {1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
{"Downtown Los Santos",         {1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
{"Downtown Los Santos",         {1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
{"Downtown Los Santos",         {1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
{"Downtown Los Santos",         {1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
{"Downtown Los Santos",         {1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
{"Downtown Los Santos",         {1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
{"Downtown Los Santos",         {1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},
{"East Beach",                  {2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},
{"East Beach",                  {2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
{"East Beach",                  {2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
{"East Beach",                  {2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},
{"East Los Santos",             {2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},
{"East Los Santos",             {2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
{"East Los Santos",             {2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
{"East Los Santos",             {2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
{"East Los Santos",             {2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
{"East Los Santos",             {2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
{"East Los Santos",             {2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},
{"Easter Basin",                {-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
{"Easter Basin",                {-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
{"Easter Bay Airport",          {-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
{"Easter Bay Airport",          {-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
{"Easter Bay Airport",          {-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
{"Easter Bay Airport",          {-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
{"Easter Bay Airport",          {-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
{"Easter Bay Airport",          {-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
{"Easter Bay Airport",          {-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
{"Easter Bay Airport",          {-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
{"Easter Bay Chemicals",        {-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
{"Easter Bay Chemicals",        {-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
{"El Castillo del Diablo",      {-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
{"El Castillo del Diablo",      {-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
{"El Castillo del Diablo",      {-208.50,2337.10,0.00,8.40,2487.10,200.00}},
{"El Corona",                   {1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},
{"El Corona",                   {1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},
{"El Quebrados",                {-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
{"Esplanade East",              {-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
{"Esplanade East",              {-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
{"Esplanade East",              {-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
{"Esplanade North",             {-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
{"Esplanade North",             {-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
{"Esplanade North",             {-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
{"Fallen Tree",                 {-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
{"Fallow Bridge",               {434.30,366.50,0.00,603.00,555.60,200.00}},
{"Fern Ridge",                  {508.10,-139.20,0.00,1306.60,119.50,200.00}},
{"Financial",                   {-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
{"Fisher's Lagoon",             {1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
{"Flint Intersection",          {-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
{"Flint Range",                 {-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
{"Fort Carson",                 {-376.20,826.30,-3.00,123.70,1220.40,200.00}},
{"Foster Valley",               {-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
{"Foster Valley",               {-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
{"Foster Valley",               {-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
{"Foster Valley",               {-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
{"Frederick Bridge",            {2759.20,296.50,0.00,2774.20,594.70,200.00}},
{"Gant Bridge",                 {-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
{"Gant Bridge",                 {-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
{"Ganton",                      {2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},
{"Ganton",                      {2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},
{"Garcia",                      {-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
{"Garcia",                      {-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
{"Garver Bridge",               {-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
{"Garver Bridge",               {-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
{"Garver Bridge",               {-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
{"Glen Park",                   {1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},
{"Glen Park",                   {1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},
{"Glen Park",                   {1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},
{"Green Palms",                 {176.50,1305.40,-3.00,338.60,1520.70,200.00}},
{"Greenglass College",          {964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
{"Greenglass College",          {964.30,930.80,-89.00,1166.50,1044.60,110.90}},
{"Hampton Barns",               {603.00,264.30,0.00,761.90,366.50,200.00}},
{"Hankypanky Point",            {2576.90,62.10,0.00,2759.20,385.50,200.00}},
{"Harry Gold Parkway",          {1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
{"Hashbury",                    {-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
{"Hilltop Farm",                {967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
{"Hunter Quarry",               {337.20,710.80,-115.20,860.50,1031.70,203.70}},
{"Idlewood",                    {1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},
{"Idlewood",                    {1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
{"Idlewood",                    {1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
{"Idlewood",                    {1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
{"Idlewood",                    {2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
{"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
{"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},
{"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
{"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
{"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
{"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
{"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},
{"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
{"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
{"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
{"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
{"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
{"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
{"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
{"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
{"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
{"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
{"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
{"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
{"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
{"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
{"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
{"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
{"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
{"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
{"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
{"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
{"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
{"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
{"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
{"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
{"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
{"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
{"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
{"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
{"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
{"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
{"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
{"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
{"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},
{"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
{"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
{"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
{"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
{"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
{"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},
{"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
{"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
{"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
{"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
{"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
{"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
{"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
{"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
{"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
{"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
{"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
{"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
{"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},
{"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},
{"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},
{"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},
{"Los Santos International",    {1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},
{"Los Santos International",    {1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
{"Los Santos International",    {1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
{"Los Santos International",    {1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
{"Los Santos International",    {1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
{"Los Santos International",    {2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
{"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},
{"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
{"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
{"Market",                      {787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},
{"Market",                      {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
{"Market",                      {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
{"Market",                      {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
{"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},
{"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
{"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
{"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},
{"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
{"Montgomery Intersection",     {1546.60,208.10,0.00,1745.80,347.40,200.00}},
{"Montgomery Intersection",     {1582.40,347.40,0.00,1664.60,401.70,200.00}},
{"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},
{"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
{"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
{"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
{"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
{"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
{"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
{"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
{"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
{"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
{"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
{"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
{"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
{"Mulholland Intersection",     {1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
{"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
{"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},
{"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
{"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
{"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
{"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
{"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
{"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
{"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
{"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
{"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
{"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
{"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
{"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
{"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
{"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
{"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},
{"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
{"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
{"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
{"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
{"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},
{"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
{"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
{"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
{"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
{"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
{"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
{"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
{"Randolph Industrial Estate",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
{"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
{"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
{"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
{"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
{"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
{"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
{"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
{"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
{"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},
{"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
{"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
{"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
{"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
{"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
{"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
{"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
{"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
{"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
{"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
{"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
{"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
{"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
{"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
{"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
{"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},
{"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
{"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
{"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
{"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
{"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
{"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
{"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
{"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
{"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
{"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
{"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},
{"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
{"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
{"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
{"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},
{"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},
{"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
{"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
{"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
{"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
{"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
{"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
{"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
{"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
{"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},
{"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
{"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
{"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
{"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
{"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},
{"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
{"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
{"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
{"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
{"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
{"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
{"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
{"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
{"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
{"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
{"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
{"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
{"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
{"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
{"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
{"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
{"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},
{"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
{"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
{"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
{"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
{"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
{"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},
{"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
{"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
{"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
{"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
{"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},
{"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
{"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
{"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
{"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
{"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
{"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},
{"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
{"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
{"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
{"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
{"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
{"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
{"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
{"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
{"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
{"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
{"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
{"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
{"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
{"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
{"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
{"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
};

#define MAX_ADVERT 100
enum aInfo
{
	id,
	aText[128],
	aName[MAX_PLAYER_NAME],
	aPhone,
};
new AI[MAX_ADVERT][aInfo];

enum VEHICLE_DATA
{
	vModel,
	vColor1,
	vColor2,
	vPrice,
	vOwner [ 24 ],
	Float: vPosX,
	Float: vPosY,
	Float: vPosZ,
	Float: vPosA,
	vPlate [ 32 ],
	vLocked
};

new VehicleInfo				[MAX_BAUTO] [VEHICLE_DATA],
	VehCreated				[MAX_VEHICLES],
	TOTAL_VEHS, Car[360];

enum ENTER_DATA
{
	id,
	Float:pX,
	Float:pY,
	Float:pZ,
	pM,
	pT,
	pI,
	pV,
	Float:ptX,
	Float:ptY,
	Float:ptZ,
	Float:ptFa,
	ptI,
	ptV,
	Name[32],
	pP
};
new EntersInfo[MAX_ENTERS][ENTER_DATA];

enum GPS_DATA
{
	gID,
	gName[64],
	Float:gLoc[3]
};
new GPSInfo[MAX_GPS][GPS_DATA];

new PlayerText:RegAuth[53];
new PlayerText:ChooseSkin[41];
new PlayerText:gCurrentPageTextDrawId[MAX_PLAYERS];
new PlayerText:gHeaderTextDrawId[MAX_PLAYERS];
new PlayerText:gBackgroundTextDrawId[MAX_PLAYERS];
new PlayerText:gItemsNumber[MAX_PLAYERS][INVNUMBERS];
new PlayerText:gSelectionItems[MAX_PLAYERS][INVNUMBERS];
new Text:LogoType, Text:LogoType1;

new GPS_ACTIVE[MAX_PLAYERS];
new Text3D:CargoText[1];
new ghour;
new GZ_ZONE;
new bool:Ether[MAX_PLAYERS];
new FOR_SERVERS;
new bool:EtherCalled[MAX_PLAYERS];
new CellTime[MAX_PLAYERS];
new bool:Phone[MAX_PLAYERS];
new TOTALCARGO;
new bool:TaxiJobStarted[MAX_PLAYERS];
new bool:PlayerEnteredPoint[MAX_PLAYERS];
new bool:PlayerCalledTaxi[MAX_PLAYERS];
new bool:PlayerRentTaxi[MAX_PLAYERS];
new bool:PlayerTaxiStarted[MAX_PLAYERS];
new ExitCarTimer[MAX_PLAYERS];
new TaxiDialogTimer[MAX_PLAYERS];
new PlayerService[MAX_PLAYERS];
new GetPlayerRentTaxi[MAX_PLAYERS];
new PlayerExitCount[MAX_PLAYERS];
new Float:FIRSTPOS[MAX_PLAYERS][3];
new Float:LASTPOS[MAX_PLAYERS][3];
new TAXI_ID[MAX_TAXI];
new Text3D:TAXI_TEXT[MAX_TAXI];
new CheckNewBank[MAX_PLAYERS];
new Invite_JOB[MAX_PLAYERS];
new PDcar[57];
new Market[MAX_PLAYERS], Mark[MAX_PLAYERS], Offer[MAX_PLAYERS], Opt[MAX_PLAYERS], AdvertTime;
new bool:PlayerCuffed[MAX_PLAYERS];
new CargoPick[1], LessPick[1];
new ParcPick[1];
new WoodTimer[MAX_PLAYERS];
new animlib[MAX_PLAYERS][30], animname[MAX_PLAYERS][30];
new Text:Speed[MAX_PLAYERS][22];
new Text3D:Marks[2], Text3D:A_Shop[2];
new gTime[3];
new Vehicle[7];
new Mysql, Timer;
new Menu:SkinMenu[2];
new allowedfactions[] = { 8, 9, 10, 11, 12};
new query[MAX_Q], form[MAX_F], spect[MAX_SS], c_business[MAX_C], coordc[MAX_CC], var[MAX_V], tcp[MAX_T], string[MAX_S];
new Mobile[MAX_PLAYERS];
new Text:AmountDraw[MAX_PLAYERS];
new Text:ProcentDraw[MAX_PLAYERS];
new Text:AmountLDraw[MAX_PLAYERS];
new TOTALHOUSE, TOTALBIZZ, TOTALADVERT, TOTALATM, TOTALENTERS, TOTALGPS;
new JoinReg[30][] = { {122},{210},{229},{2},{44},{96},{101},{184},{48},{6},{37},{60},{7},{24},{25},{3},{30},{177},/*�*/{12},{41},{55},{56},{90},{93},{69},{40},{9},{13},{64},{243} };

new ShowRulesDialog[1800];
new RulesDialog[18][] =
{
	{"{E6B122}1. ��������\n"},
	{"{FFFFFF}- ��������� ������������ ����� ����, ��������, ���� ��� CLEO �������\n"},
	{"{FFFFFF}- �������� DeathMatch (DM) - �������� � ��������� ����� ������� ��� �������\n"},
	{"{FFFFFF}- ��������� ������� ������� �� ������ (�� �����, ��� ��� ���������� � ����)\n"},
	{"{FFFFFF}- ��������� �������� ����� ������ �� ���� ��� �������� �� ����\n"},
	{"{FFFFFF}- ��������� ������� �� ����� � ����� �������� �� ����������\n"},
	{"{FFFFFF}- ��������� ������������� ������������ ������� ��� �������� ��������� ������ �������\n\n"},
	{"{E6B122}2. ������� �������\n"},
	{"{FFFFFF}- �������� ���, ����������� ������ �������\n"},
	{"{FFFFFF}- ��������� ������ ������ ������� (�� ����������� � �������� ��������\n"},
	{"{FFFFFF}- ��������� ������ ���������� (�������� ''kak igrat' na etom servere???'')\n"},
	{"{FFFFFF}- ��������� ����� ������� ��������� ��������\n"},
	{"{FFFFFF}- ��������� ������� (����� ��������� ���������� �����, ��� ����� ��� ��������� ��������)\n\n"},
	{"{E6B122}3. �������������\n"},
	{"{FFFFFF}- ���������� �������� ������������� ������� � ����� ������� ��������� ������ ������\n"},
	{"{FFFFFF}- ������������� �������������� �������� �������� ������� ��� ������� ����������� ������\n"},
	{"{FFFFFF}- ������� ����� ����������� ����� ����� ��������� ��� ����� ����� (��������, ������������ ����������� ������)\n"},
	{"{FFFFFF}- ���� �������� ������� ��������� � ��� ��������, ��������� � ��������������"}
};

new ShowDriveDialog[1500];
new DriveDialog[15][] =
{
	{"{E6B122}1. ����� �������\n"},
	{"{FFFFFF}- ����� ������������� �������� �������� ������ � ����� �������,\n"},
	{"{FFFFFF}- ��� ���� �������� ������ ��������� ��� ��������� ������ ��������� �� ����������� ��� ������ ����������\n"},
	{"{FFFFFF}- ��� ��� �������� ������� ��������� � ������� 02, � ��������� ���.\n\n"},
	{"{E6B122}2. �������� ��������\n"},
	{"{FFFFFF}- � �������� ������ ����������� �������� ������������ ������� �� ��������� �� ����� 50 ��/�\n"},
	{"{FFFFFF}- � ����� ����� � �� �������� ����������� �� ����� 30 ��/�\n"},
	{"{FFFFFF}- �� ��������� ������ ����������� �������� ���\n"},
	{"{FFFFFF}- ����� �������� ������������ ��������, ������� {0F8FCD}Num 4 {FFFFFF}.\n\n"},
	{"{E6B122}3. ��������� � �������\n"},
	{"{FFFFFF}- ��������� � ������� ������������ ������� ����������� �� ������ ������� ������ �� �������\n"},
	{"{FFFFFF}- � ���������� ��������� ��� ����� ������.\n\n"},
	{"{E6B122}4. ���\n"},
	{"{FFFFFF}- ��� ���� ���������� � ���������� �������, �������� ������ ������� �������� � ��������� � �������\n"},
	{"{FFFFFF}- �������� ������ ���������� �������/��������/��������� �� ������ �����������, ���� ��� �������."}
};

new gWood[38], WoodP[38], TOTALTREE;
new Float:Wood[][3] = {
	{-750.2000122,-157.5370026,66.0350037},
	{-711.8060303,-179.0319977,64.4960022},
	{-679.9680176,-179.4949951,61.8339996},
	{-657.0419922,-112.7610016,61.7270012},
	{-670.2169800,-174.7209930,60.4840012},
	{-645.4423828,-132.9521484,61.6320000},
	{-703.9873047,-108.1845703,66.3079987},
	{-671.0664062,-88.2119141,63.2220001},
	{-659.8007812,-89.8779297,62.2849998},
	{-643.1074219,-147.9228516,63.2989998},
	{-654.3154297,-141.6699219,60.5400009},
	{-663.8720703,-127.9794922,59.9269981},
	{-662.0986328,-148.3554688,59.6180000},
	{-673.1420288,-136.9120026,58.8279991},
	{-723.8759766,-195.5390015,66.3769989},
	{-680.4453125,-148.3261719,59.9189987},
	{-683.3857422,-122.3339844,61.4650002},
	{-688.1484375,-105.6562500,64.1429977},
	{-699.9248047,-129.1474609,65.5139999},
	{-693.5517578,-136.9414062,63.5660019},
	{-713.2568359,-197.9736328,67.3720016},
	{-702.5097656,-190.0068359,65.1600037},
	{-690.4238281,-200.7275391,66.5159988},
	{-690.5312500,-183.6718750,63.4370003},
	{-697.0185547,-177.0214844,62.6329994},
	{-711.5498047,-188.4101562,65.8720016},
	{-740.0239868,-164.3639984,66.3140030},
	{-722.2451172,-184.1347656,65.6930008},
	{-730.7431641,-191.5781250,65.4729996},
	{-727.8164062,-184.1787109,65.3850021},
	{-731.6396484,-159.5820312,65.7979965},
	{-760.5097656,-152.9121094,65.0260010},
	{-755.0498047,-168.6611328,66.5350037},
	{-733.9730225,-143.4779968,65.9619980},
	{-728.1699219,-131.7451172,66.8369980},
	{-708.1710205,-122.8440018,67.9089966},
	{-714.6279907,-147.3619995,66.0390015},
	{-649.9329834,-107.3590012,61.7220001}
};

main()
{
}

public OnGameModeInit()
{
	// LOGOTYPE
	LogoType = TextDrawCreate(499.000000, 2.187500, "TRANQUILITY");
	TextDrawLetterSize(LogoType, 0.449999, 1.600000);
	TextDrawAlignment(LogoType, 1);
	TextDrawColor(LogoType, -1378294017);
	TextDrawSetShadow(LogoType, 0);
	TextDrawSetOutline(LogoType, 1);
	TextDrawBackgroundColor(LogoType, 51);
	TextDrawFont(LogoType, 1);
	TextDrawSetProportional(LogoType, 1);

	LogoType1 = TextDrawCreate(499.500000, 14.000000, "Simulation");
	TextDrawLetterSize(LogoType1, 0.343500, 0.943751);
	TextDrawAlignment(LogoType1, 1);
	TextDrawColor(LogoType1, -1);
	TextDrawSetShadow(LogoType1, 0);
	TextDrawSetOutline(LogoType1, 1);
	TextDrawBackgroundColor(LogoType1, 51);
	TextDrawFont(LogoType1, 1);
	TextDrawSetProportional(LogoType1, 1);

    Mysql = mysql_connect(HOST, USER, BASE, PASS);
    for(new i = 0; i < MAX_TAXI; i++)
	{
	    new str[30];
	    TAXI_ID[i] = CreateVehicle(t_Info[i][tModel], t_Info[i][tPosX], t_Info[i][tPosY], t_Info[i][tPosZ], t_Info[i][tPosA], 6, 6, -1);
		format(str, sizeof(str), "{000000}TAXI %d", i+1);
		SetVehicleNumberPlate(TAXI_ID[i], str);
		SetVehicleToRespawn(TAXI_ID[i]);
		TAXI_TEXT[i] = Create3DTextLabel("[{FFFFFF}����������{DEF200}]\n{13EB3A}��������", 0xDEF200FF, 0.0, 0.0, 0.0, 50.0, 0, 1);
        Attach3DTextLabelToVehicle(TAXI_TEXT[i], TAXI_ID[i], 0.0, -0.3, 1.0);
	}
    FOR_SERVERS = cvector();
    LoadMenu();
    LoadMap();
	ShowNameTags(1);
    DisableNameTagLOS();
	ShowPlayerMarkers(2);
	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	SetGameModeText(NameServer);
	SetNameTagDrawDistance(30.0);
	LimitPlayerMarkerRadius(100.0);
	ManualVehicleEngineAndLights();
	gettime(gTime[0], gTime[1], gTime[2]);
	SetTimer("SecTimer", 1000, 1);
	SetWorldTime(gTime[0]);
	LoadMySql();
	
	ParcPick[0] = CreatePickup(1559, 23, 1114.8312,-1750.0389,13.5703,0);
	CargoPick[0] = CreatePickup(1275, 23, 2137.5396,-2282.5151,20.6719,0);
	LessPick[0] = CreatePickup(1275, 23, -759.6343,-133.6706,65.7941,0);
	return true;
}

public OnGameModeExit()
{
	for(new i = 0; i <MAX_BAUTO; i++) DestroyVehicle(i);
	for(new i=0; i<MAX_TAXI; i++)
	{
	    DestroyVehicle(TAXI_ID[i]);
	    TAXI_ID[i] = INVALID_VEHICLE_ID;
	    Delete3DTextLabel(TAXI_TEXT[i]);
	}
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
		{
			PlayerEnteredPoint[i] = false;
	    	GetPlayerRentTaxi[i] = INVALID_VEHICLE_ID;
	    	PlayerRentTaxi[i] = false;
	    	PlayerCalledTaxi[i] = false;
	    	TaxiJobStarted[i] = false;
	    	PlayerTaxiStarted[i] = false;
	    	PlayerService[i] = INVALID_PLAYER_ID;
	    	for(new d=0; d<MAX_PLAYERS; d++)
			{
	    		if(IsPlayerConnected(d) && PlayerCalledTaxi[d]) RemovePlayerMapIcon(i, d);
	  		}
    	}
	}
	return mysql_close(Mysql);
}

public OnPlayerConnect(playerid)
{
	gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	for(new x=0; x < INVNUMBERS; x++)
	{
		gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		gItemsNumber[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
	}
	cvector_push_back(FOR_SERVERS, playerid);
	LoadTextDraw(playerid);
	PlayerEnteredPoint[playerid] = false;
    GetPlayerRentTaxi[playerid] = INVALID_VEHICLE_ID;
    PlayerRentTaxi[playerid] = false;
    PlayerCalledTaxi[playerid] = false;
    TaxiJobStarted[playerid] = false;
    PlayerTaxiStarted[playerid] = false;
    PlayerService[playerid] = INVALID_PLAYER_ID;
	LoadData(playerid);

	#include TRNQLT\MvDell.inc
	
	SetPVarInt(playerid, "wrongPass", 3);
    GetPlayerName(playerid, cDataInfo[playerid][Name], MAX_PLAYER_NAME);
   	mysql_format(Mysql, query, sizeof(query),"SELECT * FROM `"TABLE_ACCOUNT"` WHERE name = '%e'", GetName(playerid));
   	mysql_function_query(Mysql, query, true, "OnPlayerLogin", "i", playerid);
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	new idx = cvector_find(FOR_SERVERS, playerid);
	if(idx != -1)
	{
	    cvector_remove(FOR_SERVERS, idx);
	}
	TextDrawDestroy(LogoType);
	TextDrawDestroy(LogoType1);
	for(new i; i < 22; ++i) TextDrawDestroy(Speed[playerid][i]);
	TextDrawDestroy(ProcentDraw[playerid]);
	TextDrawDestroy(AmountLDraw[playerid]);
	TextDrawDestroy(AmountDraw[playerid]);
	SavePlayer(playerid);
	if(GetPVarInt(playerid, "Cargo") > 0)
	{
		DeletePVar(playerid, "OldCargoSkin");
		DeletePVar(playerid, "Cargo");
	}
	if(GetPVarInt(playerid, "LessPil") > 0)
	{
	    DeletePVar(playerid, "OldLessSkin");
		DeletePVar(playerid, "LessPil");
		DeletePVar(playerid, "LessProc");
		DeletePVar(playerid, "Wood");
		DeletePVar(playerid, "LessStatus");
	}
	return true;
}

public OnPlayerSpawn(playerid)
{
    GivePlayerWeapon(playerid, 10, 1);
	SetPlayerInterior(playerid, 0);
	SetHealth(playerid, GetPVarFloat(playerid, "pHeal")+1);
	DeletePVar(playerid, "wrongPass");
	StopAudioStreamForPlayer(playerid);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerColor(playerid, COLOR_PLAYER);
	SetMoney(playerid, GetPVarInt(playerid, "pCash"));
	SetPlayerSkin(playerid, GetPVarInt(playerid, "pModel"));
	SetPlayerScore(playerid, GetPVarInt(playerid, "pLevel"));
	if(GetPVarInt(playerid, "pChar") > 0) SetPlayerSkin(playerid,GetPVarInt(playerid, "pChar"));
	if(GetPVarInt(playerid, "Clothes") > 0)
	{
	    TogglePlayerControllable(playerid, false);
	    SetPlayerVirtualWorld(playerid, playerid);
	  	SetPlayerInterior(playerid,10);
	    SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	   	SetPlayerFacingAngle(playerid, 90.0);
	   	SetPlayerCameraPos(playerid,256.0815,-43.0475,1003.0234);
	   	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
		SetPlayerInt(GetName(playerid), "Spawns", GetPVarInt(playerid, "pSpawns"));
		SetPVarInt(playerid, "pSpawns", 1);

		switch(GetPVarInt(playerid,"Clothes"))
        {
			case 1:
			{
				ShowMenuForPlayer(SkinMenu[0],playerid);
		  		if(GetPVarInt(playerid, "pSex"))
		  		{
		  		    switch(GetPVarInt(playerid, "Nation"))
		  		    {
		  		        case 0: { SetPlayerSkin(playerid, JoinReg[0][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[0][0]); DeletePVar(playerid, "CharReg"); }
						case 1: { SetPlayerSkin(playerid, JoinReg[3][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[3][0]); SetPVarInt(playerid,"CharReg", 3); }
						case 2: { SetPlayerSkin(playerid, JoinReg[6][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[6][0]); SetPVarInt(playerid,"CharReg", 6); }
						case 3: { SetPlayerSkin(playerid, JoinReg[9][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[9][0]); SetPVarInt(playerid,"CharReg", 9); }
						case 4: { SetPlayerSkin(playerid, JoinReg[12][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[12][0]); SetPVarInt(playerid,"CharReg", 12); }
						case 5: { SetPlayerSkin(playerid, JoinReg[15][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[15][0]); SetPVarInt(playerid,"CharReg", 15); }
					}
				}
		  		else
		  		{
		    		switch(GetPVarInt(playerid, "Nation"))
		  		    {
		  		        case 0: { SetPlayerSkin(playerid, JoinReg[18][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[18][0]); SetPVarInt(playerid,"CharReg", 18); }
						case 1: { SetPlayerSkin(playerid, JoinReg[20][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[20][0]); SetPVarInt(playerid,"CharReg", 20); }
						case 2: { SetPlayerSkin(playerid, JoinReg[22][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[22][0]); SetPVarInt(playerid,"CharReg", 22); }
						case 3: { SetPlayerSkin(playerid, JoinReg[24][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[24][0]); SetPVarInt(playerid,"CharReg", 24); }
						case 4: { SetPlayerSkin(playerid, JoinReg[26][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[26][0]); SetPVarInt(playerid,"CharReg", 26); }
						case 5: { SetPlayerSkin(playerid, JoinReg[28][0]); SetPVarInt(playerid, "ChosenSkin", JoinReg[28][0]); SetPVarInt(playerid,"CharReg", 28); }
					}
			    }
			}
		}
	}
	else
	{
		for(new i = 1; i <= TOTALHOUSE; ++i)
		{
			if(!strcmp(HouseInfo[i][hOwner],GetName(playerid),true))
			{
                SetPVarInt(playerid, "PlayerHouse", i);
   				if(GetPVarInt(playerid,"SpawnChange")) continue;
				SetPlayerInterior(playerid,HouseInfo[i][hInt][0]);
				SetPlayerVirtualWorld(playerid,HouseInfo[i][hInt][1]);
				SetPlayerPos(playerid,HouseInfo[i][hExit][0],HouseInfo[i][hExit][1],HouseInfo[i][hExit][2]);
				return true;
			}
		}
		Gps_Activate(playerid);
		StopAudioStreamForPlayer(playerid);
		switch(GetPVarInt(playerid, "pSpawns"))
		{
		    case 1:
		    {
		        SetPlayerPos(playerid, 1153.8118, -1768.6190, 16.5938);
          		SetPlayerInterior(playerid, false), SetPlayerVirtualWorld(playerid, false);
			}
			case 5:
			{
			    switch(GetPVarInt(playerid, "pMember"))
			    {
			        case 1..10: return 1;
			        case 11:
			        {
			            if(GetPVarInt(playerid, "pMember") == 11)
			    		{
			        		SetPlayerPos(playerid, 234.4603,111.8911,1003.2257);
			        		SetPlayerInterior(playerid, 10), SetPlayerVirtualWorld(playerid, false);
			    		}
			        }
			        case 18:
			        {
			            SetPlayerPos(playerid, 2337.8586, -1139.8269, 1054.3047);
			        	SetPlayerInterior(playerid, 12), SetPlayerVirtualWorld(playerid, false);
			        }
			        case 20:
			        {
			            SetPlayerPos(playerid, 944.7838, -45.5911, 1001.1166);
			        	SetPlayerInterior(playerid, 3), SetPlayerVirtualWorld(playerid, false);
			        }
			        
			    }
			}
		}
	}
	return true;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	if(OwnedVeh(vehicleid) != 0)
	{
	    VehicleInfo[OwnedVeh(vehicleid)][vColor1] = color1;
	    VehicleInfo[OwnedVeh(vehicleid)][vColor2] = color2;
	    SaveVehicles(OwnedVeh(vehicleid));
	}
	return true;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	DisablePlayerRaceCheckpoint(playerid);
	SavePlayer(playerid);
   	if(GetPVarInt(playerid,"GPS")) DeletePVar(playerid,"GPS");
   	if(GetPVarInt(playerid, "Cargo") > 0)
	{
		DeletePVar(playerid, "OldCargoSkin");
		DeletePVar(playerid, "Cargo");
	}
	if(GetPVarInt(playerid, "LessPil") > 0)
	{
	    DeletePVar(playerid, "OldLessSkin");
		DeletePVar(playerid, "LessPil");
		DeletePVar(playerid, "Wood");
		DeletePVar(playerid, "LessProc");
		DeletePVar(playerid, "LessStatus");
	}
	TextDrawHideForPlayer(playerid,ProcentDraw[playerid]);
	TextDrawHideForPlayer(playerid,AmountLDraw[playerid]);
	TextDrawHideForPlayer(playerid,AmountDraw[playerid]);
	return true;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(GetPVarInt(playerid, "skinc_active") == 0) return 0;
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{
		DestroySelectionMenu(playerid);
		SetPVarInt(playerid, "skinc_active", 0);
		PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
		return true;
	}
	return false;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == RegAuth[36])
	{
	    ShowPlayerDialog(playerid, D_REG, d_Input, "{6699FF}������", "{FFFFFF}������� ������ ��� ������ ��������\n�� ����� ������������� ������ ���, ��� ����� �� ������.\n\n\t{1DBF3A}�����:\n\t- ������ ����� �������� �� ������� � ��������� ��������\n\t- ������ ������������ � ��������\n\t- ����� ������ �� 6-�� �� 15-�� ��������", "�����","�����");
	}
	if(playertextid == RegAuth[37])
	{
	    ShowPlayerDialog(playerid, D_REG+1, d_Input, "{6699FF}����������� �����", "{FFFFFF}������� ����� ����� ����������� �����\n��������� ���, �� ������� ������������ ������ � ��������\n� ������ ������ ��� ���� �������� ������\n\n{6699FF}�� email ����� ������ ���, ������� �� ������\n������ � ��������� ���� ��� �����������.\n��������� � ������������ ����� � ������� '�����'", "�����", "�����");
	}
	if(playertextid == RegAuth[38])
	{
	    ShowPlayerDialog(playerid, D_REG+2, d_Box, "{6699FF}���", "{FFFFFF}�������� ��� ������ ���������:", "�������", "�������");
	}
	if(playertextid == RegAuth[40])
	{
		for(new i = 21; i < 52; ++i) PlayerTextDrawHide(playerid, RegAuth[i]);
	}
	return true;
}

PlayerText:CreatePlayerHeaderTextDraw(playerid, Float:Xpos, Float:Ypos)
{
	new sinfo[64];
	format(sinfo,sizeof(sinfo),"TRANQUILIZATOR (%d / %d)", cDataInfo[playerid][pSlots], cDataInfo[playerid][pPack]*10);
	new PlayerText:txtInit;
	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, sinfo);
	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.35, 2.0);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
	PlayerTextDrawSetOutline(playerid, txtInit, 1);
	PlayerTextDrawColor(playerid, txtInit, 0xa8902fFF);
	PlayerTextDrawShow(playerid, txtInit);
	return txtInit;
}

PlayerText:CreatePlayerBackgroundTextDraw(playerid, Float:Xpos, Float:Ypos, Float:Width, Float:Height)
{
	new PlayerText:txtBackground = CreatePlayerTextDraw(playerid, Xpos, Ypos,
	"                                            ~n~");
	PlayerTextDrawUseBox(playerid, txtBackground, 1);
	PlayerTextDrawBoxColor(playerid, txtBackground, 0x3d3d3dBB);
	PlayerTextDrawLetterSize(playerid, txtBackground, 5.0, 5.0);
	PlayerTextDrawFont(playerid, txtBackground, 0);
	PlayerTextDrawSetShadow(playerid, txtBackground, 0);
	PlayerTextDrawSetOutline(playerid, txtBackground, 0);
	PlayerTextDrawColor(playerid, txtBackground,0x000000FF);
	PlayerTextDrawTextSize(playerid, txtBackground, Width, Height);
	PlayerTextDrawBackgroundColor(playerid, txtBackground, 0x3d3d3dBB);
	PlayerTextDrawShow(playerid, txtBackground);
	return txtBackground;
}

PlayerText:CreateCurrentPageTextDraw(playerid, Number, Float:Xpos, Float:Ypos)
{
	new PlayerText:txtInit;
	new strh[16];
	format(strh, sizeof(strh), "x%d", Number);
	txtInit = CreatePlayerTextDraw(playerid, Xpos, Ypos, strh);
	PlayerTextDrawUseBox(playerid, txtInit, 0);
	PlayerTextDrawLetterSize(playerid, txtInit, 0.4, 0.8);
	PlayerTextDrawFont(playerid, txtInit, 1);
	PlayerTextDrawSetShadow(playerid, txtInit, 0);
	PlayerTextDrawSetOutline(playerid, txtInit, 1);
	PlayerTextDrawColor(playerid, txtInit, 0xffffffFF);
	PlayerTextDrawShow(playerid, txtInit);
	return txtInit;
}

ShowPlayerModelPreviews(playerid)
{
	new Float:BaseX = DIALOG_BASE_X;
	new Float:BaseY = DIALOG_BASE_Y - (SPRITE_DIM_Y * 0.33);
	new linetracker = 0;
	DestroyPlayerModelPreviews(playerid);
	new adm = 0;
	for(new slot;slot<INVNUMBERS;slot++)
	{
		if(PlayerInv[playerid][slot] > 0 && slot != 0)
		{
			if(linetracker == 0)
			{
				BaseX = DIALOG_BASE_X + 25.0;
				BaseY += SPRITE_DIM_Y + 1.0;
			}
			gItemsNumber[playerid][adm] = CreateCurrentPageTextDraw(playerid, PlayerInv[playerid][slot], BaseX, BaseY);
			BaseX += SPRITE_DIM_X + 1.0;
			linetracker++;
			if(linetracker == ITEMS_PER_LINE) linetracker = 0;
			adm ++;
		}
	}
}

DestroyPlayerModelPreviews(playerid)
{
	new x = 0;
	while(x != INVNUMBERS)
	{
		if(gSelectionItems[playerid][x] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, gSelectionItems[playerid][x]);
			PlayerTextDrawDestroy(playerid, gItemsNumber[playerid][x]);
			gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
			gItemsNumber[playerid][x] = gItemsNumber[playerid][x];
		}
		x++;
	}
}

DestroySelectionMenu(playerid)
{
	DestroyPlayerModelPreviews(playerid);

	PlayerTextDrawDestroy(playerid, gHeaderTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gBackgroundTextDrawId[playerid]);
	PlayerTextDrawDestroy(playerid, gCurrentPageTextDrawId[playerid]);

	gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
	gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(IsTaxiCar(vehicleid) && TaxiJobStarted[playerid] && GetPlayerRentTaxi[playerid] == vehicleid)
	{
	    new Float:hp;
	    GetVehicleHealth(vehicleid, hp);
	    if(hp < 250) return 1;
	    PlayerExitCount[playerid] = 10;
    	SendClientMessage(playerid, -1, "{B5E01B}[M] ��������� ������� � ����������.");
    	ExitCarTimer[playerid] = SetTimerEx("OnPlayerExitCar", 1000, true, "i", playerid);
		return true;
	}
	if(IsTaxiCar(vehicleid) && PlayerTaxiStarted[GetPlayerCarDriver(playerid)] && PlayerEnteredPoint[playerid])
	{
   		new t_str[128];
	    DisablePlayerCheckpoint(GetPlayerCarDriver(playerid));
		DisablePlayerCheckpoint(playerid);
		GivePlayerMoney(playerid, -GetPriceTaxiEx(playerid));
		GivePlayerMoney(GetPlayerCarPass(playerid), GetPriceTaxiEx(playerid));
		format(t_str, sizeof(t_str), "~g~+%d$", GetPriceTaxiEx(playerid));
		GameTextForPlayer(GetPlayerCarDriver(playerid), t_str, 1000, 1);
		format(t_str, sizeof(t_str), "~r~-%d$", GetPriceTaxiEx(playerid));
		GameTextForPlayer(playerid, t_str, 1000, 1);
		new name[24];GetPlayerName(playerid, name, 24);
   		format(t_str, sizeof(t_str), "{B5E01B}[W] �������� %s ������� ���������� ������, ��� ���� ��������.", name);
		SendClientMessage(GetPlayerCarDriver(playerid), -1, t_str);
		SendClientMessage(playerid, -1, "{B5E01B}[W] ����� ������� ����� ������, ��� ���� ��������.");
		PlayerTaxiStarted[GetPlayerCarDriver(playerid)] = false;
		for(new i=0; i<MAX_TAXI; i++)
		{
			if(TAXI_ID[i] == GetPlayerVehicleID(GetPlayerCarDriver(playerid)))
			{
		        Update3DTextLabelText(TAXI_TEXT[i], 0xDEF200FF, "[{FFFFFF}����������{DEF200}]\n{13EB3A}��������");
		        break;
		    }
		}
		return true;
	}
	return true;
}

public OnVehicleDeath(vehicleid, killerid)
{
    if(OwnedVeh(vehicleid) != 0)
	{
		DestroyVehicle(vehicleid);
		new Vehicles = CreateVehicle(VehicleInfo[OwnedVeh(vehicleid)][vModel], VehicleInfo[OwnedVeh(vehicleid)][vPosX], VehicleInfo[OwnedVeh(vehicleid)][vPosY], VehicleInfo[OwnedVeh(vehicleid)][vPosZ], VehicleInfo[OwnedVeh(vehicleid)][vPosA], VehicleInfo[OwnedVeh(vehicleid)][vColor1], VehicleInfo[OwnedVeh(vehicleid)][vColor2], 500000);
        SetVehicleNumberPlate( Vehicles, VehicleInfo[OwnedVeh(vehicleid)][vPlate]);
	}
	for(new i=0; i<MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i) && GetPlayerRentTaxi[i] == vehicleid)
		{
			SendClientMessage(i, -1, "0{E63030}[W] ���� ���������� ���� ����������. ������� �.");
	  		KillTimer(ExitCarTimer[i]);
			GetPlayerRentTaxi[i] = INVALID_VEHICLE_ID;
			TaxiJobStarted[i] = false;
			PlayerTaxiStarted[i] = false;
			for(new d=0; d<MAX_PLAYERS; d++)
			{
	    		if(IsPlayerConnected(d) && PlayerCalledTaxi[d]) RemovePlayerMapIcon(i, d);
	  		}
			break;
    	}
	}
	return true;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(IsPlayerInDynamicCP(playerid, Invite_JOB[playerid])) Jobs_Invite(playerid);
	if(GetPVarInt(playerid, "Cargo") > 0 && GetPVarInt(playerid, "CargoYes") < 1 && IsPlayerInRangeOfPoint(playerid, 1.4, 2231.0959,-2285.3909,14.3751))
	{
	    if(GetPVarInt(playerid,"FloodCargo") > gettime()) return true;
	    DisablePlayerCheckpoint(playerid);
	    ClearAnimations(playerid);
		TOTALCARGO -= 1;
		string = "";
		format(string, 128, "������: {e2ba00}%d �� 500", TOTALCARGO);
	    Update3DTextLabelText(CargoText[0], -1, string);
		SendClientMessage(playerid, -1, "[W] �� ����� ����� � ����������. �������� ��� �� �����");
		SetPVarInt(playerid, "CargoYes", 1);
		SetPVarInt(playerid,"FloodCargo", gettime() + 15);
		ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
		SetPlayerAttachedObject(playerid, 2, 2060, 5, 0.01, 0.1, 0.2, 100, 10, 85);
		SetPlayerCheckpoint(playerid,2172.5432,-2255.7092,13.3042,1.4);
    	return true;
	}
	if(GetPVarInt(playerid, "Cargo") > 0 && GetPVarInt(playerid, "CargoYes") > 0 && IsPlayerInRangeOfPoint(playerid, 1.4, 2172.5432,-2255.7092,13.3042))
	{
	    if(TOTALCARGO <= 0)
		{
			DisablePlayerCheckpoint(playerid),SendClientMessage(playerid, COLOR_YELLOW, "[W] � ������ ����������� �����!");
			ClearAnimations(playerid);
			ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
			RemovePlayerAttachedObject(playerid,2);
			return true;
		}
	    DisablePlayerCheckpoint(playerid);
        RemovePlayerAttachedObject(playerid,2);
		SetPlayerCheckpoint(playerid,2231.0959,-2285.3909,14.3751,1.4);
		SetPVarInt(playerid, "CargoYes",0);
		cDataInfo[playerid][pJobAmount][1]++;
		ClearAnimations(playerid);
		ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
    	return true;
	}
	new vehicleid = GetPlayerVehicleID(playerid);
	if(PlayerTaxiStarted[playerid] && IsTaxiCar(vehicleid))
	{
	    new z_str[128];
	    DisablePlayerCheckpoint(GetPlayerCarPass(playerid));
		DisablePlayerCheckpoint(playerid);
		TogglePlayerControllable(playerid, false);
		SetTimerEx("OnPlayerFinishedRace", 700, false, "i", playerid);
		ShowPlayerDialog(GetPlayerCarPass(playerid), D_TD+4, DIALOG_STYLE_LIST, "{AFE01B}������� ������������", "\
		1. �������\n2. ������\n3. �����\n4. ������", "�������", "�����");
		SendClientMessage(playerid, -1, "{B5E01B}[M] �� �������� ����� ����������.");
		SendClientMessage(GetPlayerCarPass(playerid), -1, "{B5E01B}[M] �� �������� ����� ����������.");
		GivePlayerMoney(playerid, GetPriceTaxi(playerid));
		GivePlayerMoney(GetPlayerCarPass(playerid), -GetPriceTaxi(playerid));
		format(z_str, sizeof(z_str), "~g~+%d$", GetPriceTaxi(playerid));
		GameTextForPlayer(playerid, z_str, 1000, 1);
		format(z_str, sizeof(z_str), "~r~-%d$", GetPriceTaxi(playerid));
		GameTextForPlayer(GetPlayerCarPass(playerid), z_str, 1000, 1);
		PlayerTaxiStarted[playerid] = false;
		for(new i=0; i<MAX_TAXI; i++)
		{
			if(TAXI_ID[i] == GetPlayerVehicleID(playerid))
			{
		        Update3DTextLabelText(TAXI_TEXT[i], 0xDEF200FF, "[{FFFFFF}����������{DEF200}]\n{13EB3A}��������");
		        break;
		    }
		}
	}
	if(GetPVarInt(playerid, "LessPil") > 0 && IsPlayerInRangeOfPoint(playerid, 3.0, -749.0853,-121.2919,66.0043))
	{
	    DisablePlayerCheckpoint(playerid);
	    RemovePlayerAttachedObject(playerid,3);
	    new rand = 30 + random(50);
	    cDataInfo[playerid][pJobAmount][2] += rand;
	    string = ""; format(string,30,"+%d",rand);
	    ClearAnimations(playerid); ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
	    DeletePVar(playerid, "Wood");
	    SetPVarInt(playerid, "LessProc", 0);
	    SetPVarInt(playerid, "LessStatus", 0);
	    TextDrawShowForPlayer(playerid, ProcentDraw[playerid]);
		SetPVarInt(playerid, "Wood", TOTALTREE);
		TOTALTREE++;
		SetPlayerCheckpoint(playerid, Wood[GetPVarInt(playerid, "Wood")][0], Wood[GetPVarInt(playerid, "Wood")][1], Wood[GetPVarInt(playerid, "Wood")][2], 3.0);
		return true;
	}
	return true;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
/*1. �������� ������������\n2. ����������� ����\n3. ����������� ����\n4. ������������\n5. ������� �������
6. ����������� �������\n7. ������������ �����\n8. ���� Alhambra\n9. ��������\n10. ���������
11. ���������\n12. ������� ������\n13. ������� ������ Binco\n14. ������� ������ DS\n15. ��������
16. ����������\n17. ����-��� Burger Shot\n18. ������� �����
19. ������� ���������\n20. �����������\n21. ���������� ������
22. ��������������\n23. ����� ����������*/
    for(new idx = 1; idx <= TOTALBIZZ;idx++)
	{
 		if(checkpointid == BizzInfo[idx][bMenu])
 		{
			if(BizzInfo[idx][bType] == 1) ReagncyeList(playerid, idx);
			if(BizzInfo[idx][bType] == 2) BanksList(playerid, idx);
			if(BizzInfo[idx][bType] == 3) BanksList(playerid, idx);
			if(BizzInfo[idx][bType] == 4) CandyList(playerid, idx);
			if(BizzInfo[idx][bType] == 5) ToyList(playerid, idx);
			if(BizzInfo[idx][bType] == 6) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 7) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 8) DrinkList(playerid, idx);
			if(BizzInfo[idx][bType] == 9) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 10) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 11) DriveList(playerid, idx);
			if(BizzInfo[idx][bType] == 12) GunzList(playerid, idx);
			if(BizzInfo[idx][bType] == 13) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 14) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 15) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 16) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 17) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 18) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 19) HomeList(playerid, idx);
			if(BizzInfo[idx][bType] == 20) HomeList(playerid, idx);
		}
	}
    if(GetPVarInt(playerid,"GPS"))
	{
        DeletePVar(playerid,"GPS");
		DestroyDynamicCP(GPS_ACTIVE[playerid]);
		RemovePlayerMapIcon(playerid, 99);
		SendClientMessage(playerid, COLOR_GREEN, "[G] �� �������� ����� ����������!");
	}
	return true;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    if(pickupid == CargoPick[0])
	{
	    if(GetPVarInt(playerid, "Cargo") == 1) return ShowPlayerDialog(playerid, D_WORK+6, d_Box, "{6699FF}��������", "{FFFFFF}�� ������ ��������� ������?", "��", "���");
	    if(ghour == 0 || ghour == 3 || ghour == 6 || ghour == 9 || ghour == 12 || ghour == 15 || ghour == 18 || ghour == 21)
		{
		    if(TOTALCARGO <= 0) SendClientMessage(playerid, COLOR_WHITE, "[W] � ��������� ������ ������, ��������� �����!");
			else if(GetPVarInt(playerid, "Cargo") == 0) ShowPlayerDialog(playerid, D_WORK+5, 0, "{6699FF}��������", "{FFFFFF}�� ������� ���������� ���������?", "��", "���");
		}
		else SendClientMessage(playerid,COLOR_WHITE,"[W] ������ ��� ������, ��������� �����!");
		return 1;
	}
    if(pickupid == LessPick[0])
	{
  		if(GetPVarInt(playerid, "LessPil") == 0) ShowPlayerDialog(playerid, D_WORK+2, d_Box, "{6699FF}���������", "{FFFFFF}�� ������ ������ ������ �� ���������?", "��", "���");
		else ShowPlayerDialog(playerid, D_WORK+3, d_Box, "{6699FF}���������", "{FFFFFF}�� ������ ��������� ������ �� ���������?", "��", "���");
		return true;
	}
	if(pickupid == ParcPick[0])
	{
	    ShowPlayerDialog(playerid, D_PARK, d_Box, "{6699FF}������ ��������", "\t\t\t{FFFFFF}����������� �����\n{FFFFFF}������ ������ ����� ��������� � ����������� ������ ������������� ��������, ��� �����\n������������� ����������� ����������� �����, ������� ������������ ��������������\n������ ������ ������������� �������� �� ������������� ��������.\n\n��������� ��������: 150$\n\n\t��� ����, ����� �������� �������� ������� '��', ��� ������ '���'.", "��", "���");
		return true;
	}
	if(pickupid == WoodP[GetPVarInt(playerid, "Wood")])
	{
	    ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
		SetPlayerAttachedObject(playerid,3,1463,5,0.045000,0.152000,0.217000,100.199966,-176.199951,102.500015,0.567000,0.327000,0.516000);
		SetPlayerCheckpoint(playerid,-749.0853,-121.2919,66.0043,3.0);
		SetPVarInt(playerid, "LessStatus", 1);
		SetPlayerArmedWeapon(playerid, 0);
		DestroyPickup(pickupid);
    	return true;
	}
    for(new idx = 1; idx <= TOTALBIZZ;idx++)
    {
    	if(pickupid == BizzInfo[idx][bPickup])
        {
  		   	if(!strcmp(BizzInfo[idx][bOwner],"None",true))
		  	{
		  	    SetPVarInt(playerid, "PlayerBizz", idx);
 				format(string, 128, "{FFFFFF}����� �������:\t{6699FF}�%i\n{FFFFFF}���������:\t\t{6699FF}%i\n\n{FFFFFF}�� ������ ����� � ������?",idx,BizzInfo[idx][bPrice]);
		  		if(BizzInfo[idx][bType] != 2) return ShowPlayerDialog(playerid, D_BUSINESS+1, d_Box, "{6699FF}�����������", string, "����", "�����");
		  	}
		  	else
		  	{
		  	    SetPVarInt(playerid, "PlayerBizz", idx);
		  	    if(BizzInfo[idx][bType] < 21)
		  	    {
		  	        if(BizzInfo[idx][bEnter] > 0) format(string, 128, "{FFFFFF}���� �����: %i ��������\n\n�� ������ ����� � ������?", BizzInfo[idx][bEnter]);
		  	        else format(string, 128, "{FFFFFF}���� ���������\n\n�� ������ ����� � ������?");
		  	        return ShowPlayerDialog(playerid, D_BUSINESS, d_Box, "{6699FF}�����������", string, "��", "���");
		  	    }
		  		if(BizzInfo[idx][bType] != 2) return ShowPlayerDialog(playerid, D_BUSINESS, d_Box, "{6699FF}�����������", "�� ������ ����� � ������?", "��", "���");
		  	}
        }
        if(pickupid == BizzInfo[idx][bPickupExit] && BizzInfo[idx][bType] != 22)
        { SetPVarInt(playerid, "PlayerBizz", idx); return ShowPlayerDialog(playerid, D_BUSINESS+2, d_Box, "{6699FF}�����������", "{FFFFFF}�� ������� ��� ������ �������� ������?", "��", "���"); }
    }
	for(new i = 1; i <= TOTALHOUSE; ++i)
	{
    	if(pickupid == HouseInfo[i][hPickup])
    	{
    	    SetPVarInt(playerid, "PlayerHome", i);
	        if(!strcmp(HouseInfo[i][hOwner],"None", true))
	        {
	            format(string, 100, "{FFFFFF}����� ����:\t#%d\n\n{FFFFFF}���������:\t%d\n{FFFFFF}�����:\t\t%s", i, HouseInfo[i][hPrice], HouseInfo[i][hDiscript]);
                return ShowPlayerDialog(playerid, D_HOUSE, d_Box,"{6699FF}���", string, "������", "�����");
 			}
			else
			{
				format(string, 100, "{FFFFFF}����� ����:\t�%d\n\n��������:\t%s\n�����:\t\t%s",i, HouseInfo[i][hOwner], HouseInfo[i][hDiscript]);
			    return ShowPlayerDialog(playerid, D_HOUSE, d_Box, "{6699FF}���", string, "�����", "�����");
			}
    	}
    }
    for(new i; i <= TOTALENTERS; i++)
	{
	    if(pickupid == EntersInfo[i][pP])
	    {
			SetPlayerPos(playerid,EntersInfo[i][ptX],EntersInfo[i][ptY],EntersInfo[i][ptZ]);
	       	SetPlayerFacingAngle(playerid, EntersInfo[i][ptFa]);
   	    	SetPlayerInterior(playerid,EntersInfo[i][ptI]);
   	    	SetPlayerVirtualWorld(playerid,EntersInfo[i][ptV]);
   	    	break;
   		}
   	}
	return true;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
	if(GetPVarInt(playerid, "LessPil") > 0 && GetPVarInt(issuerid, "LessPil") > 0 && weaponid == 9)
 	{
  		new Float:shealth,Float:slx, Float:sly, Float:slz;
	    GetPlayerHealth(issuerid, shealth);
		SetHealth(issuerid, shealth-10);
		GetPlayerPos(issuerid, slx, sly, slz);
		SetPlayerPos(issuerid, slx, sly, slz+10);
		PlayerPlaySound(issuerid, 1130, slx, sly, slz+10);
    	SetPlayerArmedWeapon(issuerid,0);
    	return true;
    }
    return true;
}

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	new Float:old[3], Float:oldRot[3];
	GetObjectPos(objectid, old[0], old[1], old[2]); GetObjectRot(objectid, oldRot[0], oldRot[1], oldRot[2]);
	if(!playerobject) { if(!IsValidObject(objectid)) return; MoveObject(objectid, fX, fY, fZ, 10.0, fRotX, fRotY, fRotZ); }
	if(response == EDIT_RESPONSE_FINAL)
	{
		if(!playerobject)
		{
		    if(GetPVarInt(playerid, "ObjectATM") >= 1)
		    {
   		 		TOTALATM++;
				ATMInfo[TOTALATM][aX] = fX; ATMInfo[TOTALATM][aY] = fY; ATMInfo[TOTALATM][aZ] = fZ; ATMInfo[TOTALATM][arZ] = fRotZ;
	 			format(query, 255,"INSERT INTO "TABLE_ATM" (ID, X, Y, Z, FA) VALUES (%i,'%f','%f','%f','%f')",
			    TOTALATM,ATMInfo[TOTALATM][aX],ATMInfo[TOTALATM][aY],ATMInfo[TOTALATM][aZ], ATMInfo[TOTALATM][arZ]);
				mysql_function_query(Mysql, query, false, "", "");
				SendMes(playerid,COLOR_ORANGE,"[A] �� ���������� �������� ����� %i",TOTALATM);
				ATM[TOTALATM] = CreateObject(2754, fX, fY, fZ, fRotX, fRotY, fRotZ);
				LABELATM[TOTALATM] = CreateDynamic3DTextLabel("{6699FF}��������\n{C3C3C3}������� ALT", COLOR_GREEN, ATMInfo[TOTALATM][aX], ATMInfo[TOTALATM][aY], ATMInfo[TOTALATM][aZ], 20.0);
				DeletePVar(playerid, "ObjectATM"), DeletePVar(playerid, "NearvehATM");
			}
		}
	}
	if(response == EDIT_RESPONSE_CANCEL)
	{
		if(!playerobject) SetObjectPos(objectid, old[0], old[1], old[2]), SetObjectRot(objectid, oldRot[0], oldRot[1], oldRot[2]);
		else SetPlayerObjectPos(playerid, objectid, old[0], old[1], old[2]), SetPlayerObjectRot(playerid, objectid, oldRot[0], oldRot[1], oldRot[2]);
	}
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:Current = GetPlayerMenu(playerid);
	if(SkinMenu[0] == Current && GetPVarInt(playerid,"Clothes") == 1)
	{
		switch(row)
		{
			case 0:
			{
				if(GetPVarInt(playerid, "pSex"))
				{
				    switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") >= 2) DeletePVar(playerid, "CharReg"); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") >= 5) SetPVarInt(playerid,"CharReg", 3); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") >= 8) SetPVarInt(playerid,"CharReg", 6); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") >= 11) SetPVarInt(playerid,"CharReg", 9); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") >= 14) SetPVarInt(playerid,"CharReg", 12); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") >= 17) SetPVarInt(playerid,"CharReg", 15); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				else
				{
    				switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") >= 19) SetPVarInt(playerid,"CharReg", 18); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") >= 21) SetPVarInt(playerid,"CharReg", 20); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") >= 23) SetPVarInt(playerid,"CharReg", 22); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") >= 25) SetPVarInt(playerid,"CharReg", 24); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") >= 27) SetPVarInt(playerid,"CharReg", 26); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") >= 29) SetPVarInt(playerid,"CharReg", 28); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				ShowMenuForPlayer(SkinMenu[0],playerid);
			}
			case 1:
			{
				if(GetPVarInt(playerid, "pSex"))
				{
   					switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") <= 0) SetPVarInt(playerid,"CharReg", 2); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") <= 3) SetPVarInt(playerid,"CharReg", 5); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") <= 6) SetPVarInt(playerid,"CharReg", 8); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") <= 9) SetPVarInt(playerid,"CharReg", 11); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") <= 12) SetPVarInt(playerid,"CharReg", 14); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") <= 15) SetPVarInt(playerid,"CharReg", 17); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				else
				{
					switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") <= 18) SetPVarInt(playerid,"CharReg", 19); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") <= 20) SetPVarInt(playerid,"CharReg", 21); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") <= 22) SetPVarInt(playerid,"CharReg", 23); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") <= 24) SetPVarInt(playerid,"CharReg", 25); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") <= 26) SetPVarInt(playerid,"CharReg", 27); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") <= 28) SetPVarInt(playerid,"CharReg", 29); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				ShowMenuForPlayer(SkinMenu[1],playerid);
			}
			case 2:
			{
				SetPVarInt(playerid, "pModel", GetPVarInt(playerid, "ChosenSkin"));
				DeletePVar(playerid, "Nation");
				DeletePVar(playerid, "CharReg");
				DeletePVar(playerid, "Clothes");
				DeletePVar(playerid, "ChosenSkin");
				TogglePlayerControllable(playerid, true);
				CreateAccount(playerid, cDataInfo[playerid][pPassword]);
			}
		}
	}
	if(SkinMenu[1] == Current && GetPVarInt(playerid,"Clothes") == 1)
	{
		switch(row)
		{
			case 0:
			{
				if(GetPVarInt(playerid, "pSex"))
				{
   					switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") <= 0) SetPVarInt(playerid,"CharReg", 2); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") <= 3) SetPVarInt(playerid,"CharReg", 5); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") <= 6) SetPVarInt(playerid,"CharReg", 8); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") <= 9) SetPVarInt(playerid,"CharReg", 11); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") <= 12) SetPVarInt(playerid,"CharReg", 14); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") <= 15) SetPVarInt(playerid,"CharReg", 17); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				else
				{
					switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") <= 18) SetPVarInt(playerid,"CharReg", 19); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") <= 20) SetPVarInt(playerid,"CharReg", 21); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") <= 22) SetPVarInt(playerid,"CharReg", 23); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") <= 24) SetPVarInt(playerid,"CharReg", 25); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") <= 26) SetPVarInt(playerid,"CharReg", 27); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") <= 28) SetPVarInt(playerid,"CharReg", 29); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")-1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				ShowMenuForPlayer(SkinMenu[1],playerid);
			}
			case 1:
			{
				if(GetPVarInt(playerid, "pSex"))
				{
				    switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") >= 2) DeletePVar(playerid, "CharReg"); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") >= 5) SetPVarInt(playerid,"CharReg", 3); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") >= 8) SetPVarInt(playerid,"CharReg", 6); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") >= 11) SetPVarInt(playerid,"CharReg", 9); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") >= 14) SetPVarInt(playerid,"CharReg", 12); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") >= 17) SetPVarInt(playerid,"CharReg", 15); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				else
				{
					switch(GetPVarInt(playerid, "Nation"))
					{
					    case 0: { if(GetPVarInt(playerid,"CharReg") >= 19) SetPVarInt(playerid,"CharReg", 18); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 1: { if(GetPVarInt(playerid,"CharReg") >= 21) SetPVarInt(playerid,"CharReg", 20); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 2: { if(GetPVarInt(playerid,"CharReg") >= 23) SetPVarInt(playerid,"CharReg", 22); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 3: { if(GetPVarInt(playerid,"CharReg") >= 25) SetPVarInt(playerid,"CharReg", 24); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 4: { if(GetPVarInt(playerid,"CharReg") >= 27) SetPVarInt(playerid,"CharReg", 26); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					    case 5: { if(GetPVarInt(playerid,"CharReg") >= 29) SetPVarInt(playerid,"CharReg", 28); else SetPVarInt(playerid,"CharReg", GetPVarInt(playerid,"CharReg")+1); }
					}
					SetPlayerSkin(playerid, JoinReg[GetPVarInt(playerid,"CharReg")][0]);
					SetPVarInt(playerid, "ChosenSkin", JoinReg[GetPVarInt(playerid,"CharReg")][0]);
				}
				ShowMenuForPlayer(SkinMenu[0],playerid);
			}
			case 2:
			{
				SetPVarInt(playerid, "pModel", GetPVarInt(playerid, "ChosenSkin"));
				DeletePVar(playerid, "Nation");
				DeletePVar(playerid, "CharReg");
				DeletePVar(playerid, "Clothes");
				DeletePVar(playerid, "ChosenSkin");
				TogglePlayerControllable(playerid, true);
				CreateAccount(playerid, cDataInfo[playerid][pPassword]);
				SpawnPlayer(playerid);
			}
		}
	}
	return true;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(!PlayerEnteredPoint[playerid])
	{
	    GetPlayerPos(GetPlayerCarDriver(playerid), FIRSTPOS[GetPlayerCarDriver(playerid)][0], FIRSTPOS[GetPlayerCarDriver(playerid)][1], FIRSTPOS[GetPlayerCarDriver(playerid)][2]);
	    GetPlayerPos(playerid, FIRSTPOS[playerid][0], FIRSTPOS[playerid][1], FIRSTPOS[playerid][2]);
	    LASTPOS[playerid][0] = fX;LASTPOS[GetPlayerCarDriver(playerid)][0] = fX;
	    LASTPOS[playerid][1] = fY;LASTPOS[GetPlayerCarDriver(playerid)][1] = fY;
	    LASTPOS[playerid][2] = fZ;LASTPOS[GetPlayerCarDriver(playerid)][2] = fZ;
	    new psoobsh[256];
	    format(psoobsh, sizeof(psoobsh), "{00FFFF}\
		����� ����������:{FFFFFF} %s\n\
		{00FFFF}��������� �������:{FFFFFF} %d$\n\
		{999999}����� ������� ����� ����������\n\
		����� �� ������ '�����'\
		", GetPlayerPoint(playerid), GetPriceTaxi(GetPlayerCarDriver(playerid)));
		ShowPlayerDialog(playerid, D_TD+1, DIALOG_STYLE_MSGBOX, "����������", psoobsh, "������", "�����");
	}
	return true;
}

public OnPlayerUpdate(playerid)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) UpdateSpeed(playerid);
    if(GetPVarInt(playerid,"Cargo") > 0)
    {
	    spect = "";
		format(spect, 24, "AMOUNT: %d", cDataInfo[playerid][pJobAmount][1]);
		TextDrawSetString(AmountDraw[playerid],spect);
		if(!strcmp(animlib[playerid], "PED", true) && !strcmp(animname[playerid], "FALL_GLIDE", true) && GetPVarInt(playerid,"CargoYes") == 1)
		{
            if(TOTALCARGO <= 0)
			{
			    DisablePlayerCheckpoint(playerid);
	        	RemovePlayerAttachedObject(playerid,2);
	        	ClearAnimations(playerid);
				ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
				SendClientMessage(playerid, COLOR_GREY, "[W] � ������� ������ ��� ������!");
			    return true;
			}
		}
	}
	else TextDrawHideForPlayer(playerid, AmountDraw[playerid]);
   	if(GetPVarInt(playerid,"LessPil") > 0)
    {
		if(GetPVarInt(playerid,"LessProc") > 100) return true;
	    spect = "";
		format(spect,24,"PROCENT: %d%",GetPVarInt(playerid,"LessProc"));
		TextDrawSetString(ProcentDraw[playerid],spect);

		spect = "";
		format(spect,24,"AMOUNT: %d KG", cDataInfo[playerid][pJobAmount][2]);
		TextDrawSetString(AmountLDraw[playerid],spect);
	}
	else
	{
	    TextDrawHideForPlayer(playerid, ProcentDraw[playerid]);
	    TextDrawHideForPlayer(playerid, AmountLDraw[playerid]);
	}
	new Float:POS[3],vehicleid = GetPlayerVehicleID(playerid);
	if(TaxiJobStarted[playerid] && IsTaxiCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    for(new i=0; i<MAX_PLAYERS; i++)
	    {
			if(IsPlayerConnected(i) && PlayerCalledTaxi[i])
			{
				GetPlayerPos(i, POS[0], POS[1], POS[2]);
				SetPlayerMapIcon(playerid, i, POS[0], POS[1], POS[2], 0, 0xF0F000FF, MAPICON_GLOBAL);
			}
		}
	}
	if(GetPVarInt(playerid,"LessProc") >= 100)
	{
	    MoveObject(gWood[GetPVarInt(playerid,"Wood")], Wood[GetPVarInt(playerid, "Wood")][0], Wood[GetPVarInt(playerid, "Wood")][1], Wood[GetPVarInt(playerid, "Wood")][2]+0.004,0.004, 0.00000000,90.00000000,0.00000000);
        SetPVarInt(playerid, "LessProc", 0);
        TextDrawHideForPlayer(playerid, ProcentDraw[playerid]);
		WoodTimer[playerid] = SetTimerEx("GatWood",2000,false,"i",playerid);
	}
	return true;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	switch(newstate)
	{
	    case 2: for(new i; i < 22; ++i) TextDrawShowForPlayer(playerid, Speed[playerid][i]);
	    default: for(new i; i < 22; ++i) TextDrawHideForPlayer(playerid, Speed[playerid][i]);
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    if(OwnedVeh(GetPlayerVehicleID(playerid)) != 0)
	    {
	        if(strmatch(VehicleInfo[OwnedVeh(GetPlayerVehicleID(playerid))][vOwner], "None"))
	        {
		        format(Car, sizeof(Car), "{FFFFFF}��� ����������:\t�������\n��������� �������: %i$\n\n��� ������� ���� ������ ������� ''������''", VehicleInfo[OwnedVeh(GetPlayerVehicleID(playerid))][vPrice]);
		        ShowPlayerDialog(playerid, D_AUTO, d_Box, "{6699FF}���������", Car, "������", "�����");
		        TogglePlayerControllable(playerid, false);
			}
			else if(strmatch(VehicleInfo[OwnedVeh(GetPlayerVehicleID(playerid))][vOwner], GetName(playerid))) return true;
			else
			{
			    format(Car, sizeof(Car), "[V] ��������� �������������� ��: {6699FF}%s", VehicleInfo[OwnedVeh(GetPlayerVehicleID(playerid))][vOwner]);
                SendClientMessage(playerid, COLOR_WHITE, Car);
				RemovePlayerFromVehicle(playerid);
			}
			
		}
	}
    new zrsr[192], vehicleid = GetPlayerVehicleID(playerid), bool:onepass;
	if(newstate == PLAYER_STATE_DRIVER && IsTaxiCar(vehicleid))
  	{
	   	if(GetPlayerRentTaxi[playerid] != vehicleid)
		{
   			format(zrsr, sizeof(zrsr), "{FFFFFF}\
  			����� �������� ��������� ����������, ��� ����� � ����������.\n\
			���� ������: {CECECE}%d$\
			", TAXI_PRICERENT);
	   		ShowPlayerDialog(playerid, D_TD, DIALOG_STYLE_MSGBOX, "{AFE01B}������ ����������", zrsr, "��", "���");
			PlayerRentTaxi[playerid] = true;
			TaxiDialogTimer[playerid] = SetTimerEx("OnPlayerShowTaxiDialog", 1000, true, "i", playerid);
		}
  		else
		{
			KillTimer(ExitCarTimer[playerid]);
		}
    }
	if(newstate == PLAYER_STATE_PASSENGER && IsTaxiCar(vehicleid) && GetPlayerRentTaxi[playerid] != vehicleid)
	{
	    new bool:owned;
	   	for(new i=0; i<MAX_PLAYERS; i++)
		{
   			if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == 0 && GetPlayerRentTaxi[i] == vehicleid && TaxiJobStarted[i])
  			{
			   	owned = true;
			   	break;
   			}
   		}
	    if(!owned) return RemovePlayerFromVehicle(playerid);
	   	for(new i; i < MAX_PLAYERS; i++)
		{
   			if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) != 0 && i != playerid)
  			{
			   	onepass = true;
			   	break;
   			}
   		}
		if(PlayerCalledTaxi[playerid])
		{
			PlayerCalledTaxi[playerid] = false;
			for(new i=0; i<MAX_PLAYERS; i++)
			{
	    		if(IsPlayerConnected(i) && TaxiJobStarted[i]) RemovePlayerMapIcon(i, playerid);
	  		}
	  	}
		if(onepass)
		{
			format(zrsr, sizeof(zrsr), "{B5E01B}[W] � ��� � ���������� ��� �������� %s", GetName(playerid));
			SendClientMessage(GetPlayerCarDriver(playerid), -1, zrsr);
			return 1;
		}
   		PlayerEnteredPoint[playerid] = false;
		format(zrsr, sizeof(zrsr), "{B5E01B}[W] � ��� � ���������� ��� �������� %s (��������� ���� �� ������� �������)", GetName(playerid));
		SendClientMessage(GetPlayerCarDriver(playerid), -1, zrsr);
		ShowPlayerDialog(playerid, D_TD+7, d_Box, "{AFE01B}����������", "\
		{FFFFFF}���������� ������ �� ����� � �� �����,\n\
		� ������� ��� ���������� �����������.", "�������", "");
	}
	return true;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(!GetPVarInt(playerid,"Logged")) return true;
    if(GetPVarInt(playerid, "LessPil") == 1 && PRESSED(KEY_FIRE))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2.5, Wood[GetPVarInt(playerid, "Wood")][0], Wood[GetPVarInt(playerid, "Wood")][1], Wood[GetPVarInt(playerid, "Wood")][2]))
		{
			if(!strcmp(animlib[playerid], "CHAINSAW", true) && !strcmp(animname[playerid], "CSAW_1", true) || !strcmp(animlib[playerid], "CHAINSAW", true) && !strcmp(animname[playerid], "CSAW_2", true))
			{
				SetPVarInt(playerid, "LessProc", GetPVarInt(playerid, "LessProc") + 4);
				return true;
			}
		}
	}
	if(PRESSED(KEY_FIRE) || PRESSED(KEY_HANDBRAKE) || PRESSED(KEY_CROUCH) || PRESSED(KEY_ACTION))
    {
       	if(GetPVarInt(playerid,"Cargo") > 0 && GetPVarInt(playerid,"CargoYes") > 0 && IsPlayerAttachedObjectSlotUsed(playerid, 2))
        {
            ClearAnimations(playerid);
        	ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
		}
    }
    else if(newkeys & KEY_JUMP && !(oldkeys & KEY_JUMP) && GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED) ApplyAnimation(playerid, "GYMNASIUM", "gym_jog_falloff",4.1,0,1,1,0,0);
	if(PRESSED(KEY_SECONDARY_ATTACK) || PRESSED(KEY_JUMP) || PRESSED(KEY_SPRINT))
    {
        if(GetPVarInt(playerid,"LessPil") > 0 && GetPVarInt(playerid,"LessStatus") > 0 && IsPlayerAttachedObjectSlotUsed(playerid, 3))
        {
			SendClientMessage(playerid, -1, "[W] �� ������� ��������� ������!");
            DisablePlayerCheckpoint(playerid);
	        RemovePlayerAttachedObject(playerid,3);
			ClearAnimations(playerid);
			ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
			DeletePVar(playerid, "Wood");
		    SetPVarInt(playerid, "LessProc", 0);
		    SetPVarInt(playerid, "LessStatus", 0);
		    TextDrawShowForPlayer(playerid, ProcentDraw[playerid]);
			SetPVarInt(playerid, "Wood", TOTALTREE);
			TOTALTREE++;
			SetPlayerCheckpoint(playerid, Wood[GetPVarInt(playerid, "Wood")][0], Wood[GetPVarInt(playerid, "Wood")][1], Wood[GetPVarInt(playerid, "Wood")][2], 3.0);
		}
		else if(GetPVarInt(playerid,"Cargo") > 0 && GetPVarInt(playerid,"CargoYes") > 0 && IsPlayerAttachedObjectSlotUsed(playerid, 2))
        {
            SendClientMessage(playerid, COLOR_RED, "[W] �� ������� �����. ����������� ��� ���.");
            if(TOTALCARGO <= 0)
			{
			    DisablePlayerCheckpoint(playerid);
	        	RemovePlayerAttachedObject(playerid,2);
	        	ClearAnimations(playerid);
				ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
				SendClientMessage(playerid, COLOR_GREY, "[W] � ������� ������ ��� ������.");
			    return true;
			}
            DisablePlayerCheckpoint(playerid);
	        RemovePlayerAttachedObject(playerid,2);
			SetPlayerCheckpoint(playerid,2231.0959,-2285.3909,14.3751,1.4);
			SetPVarInt(playerid, "CargoYes",0);
			ClearAnimations(playerid);
			ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
		}
    }
   	if(newkeys & KEY_FIRE)
   	{
		if(GetPVarInt(playerid, "pAKey") == 1)
		{
			cmd::li(playerid, "\1");
		}
	}
   	if(newkeys & KEY_WALK)
	{
		if(GetPVarInt(playerid, "pAKey") == 1)
		{
			cmd::atm(playerid, "\1");
		}
	}
	if(newkeys & KEY_SUBMISSION)
	{
		if(GetPVarInt(playerid, "pAKey") == 1)
		{
			cmd::en(playerid, "\1");
	 	}
	}
	if(newkeys & KEY_ANALOG_DOWN)
	{
		if(GetPVarInt(playerid, "pAKey") == 1)
	 	{
	 		cmd::boot(playerid, "\1");
	 	}
	}
	if(newkeys & KEY_ANALOG_UP) if(GetPVarInt(playerid, "pAKey") == 1) { cmd::bonnet(playerid, "\1"); }
	if(newkeys & KEY_YES)
	{
	    if(GetPVarInt(playerid, "Sell") == 1)
	    {
	        SendClientMessage(playerid, 0x1E90FFFF, "{1E90FF}[I] �� ��������� �������� ������");
	        SetPlayerAttachedObject(playerid, 4, 18643, 6, 0.111052, 0.021643, -0.000846, 122.280899, 62.752510, 58.071044, 1.200000, 1.283168, 1.200000);
	        SetPVarInt(playerid, "Sell", 0);
		}
		if(GetPVarInt(playerid, "KeyHeal") == 1)
	    {
	        new p = GetPVarInt(playerid, "PlayerHeal");
			SetHealth(playerid, 100);
			if(GetPlayerDrunkLevel(playerid) > 0) SetPlayerDrunkLevel(playerid, 0);
			SendMes(playerid, 0x6495EDFF, "[ME] %s ������� ���", GetName(p));
			SendMes(p, 0x6495EDFF, "[P] �� �������� �������� %s", GetName(playerid));
			DeletePVar(playerid, "PlayerHeal");
  			DeletePVar(playerid, "KeyHeal");
  			return true;
	    }
	}
	if(newkeys & KEY_NO)
	{
	    if(GetPVarInt(playerid, "Sell") == 1)
	    {
	        SendClientMessage(playerid, 0x1E90FFFF, "{1E90FF}[I] �� ��������� ������� �������� ������");
	        SetPVarInt(playerid, "Sell", 0);
 		}
 		if(GetPVarInt(playerid, "KeyHeal") == 1)
	    {
	        new p = GetPVarInt(playerid, "PlayerHeal");
	        SendMes(p, 0x6495EDFF, "[S] ������� %s �������� ����������� ����������", GetName(playerid));
		    DeletePVar(playerid, "PlayerHeal");
		    DeletePVar(playerid, "KeyHeal");
		    return 1;
	    }
	}
    return true;
}

public OnPlayerText(playerid, text[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(text[0] == 0x20) return false;
    if(!GetPVarInt(playerid,"Logged")) return false;
    if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid,"PED","IDLE_CHAT", 4.1, 0,1,1,1, 1);
	SetTimerEx("ClearText", 2400, false, "i", playerid);
	if(!IsPlayerInAnyVehicle(playerid)  && GetPVarInt(playerid,"CargoYes") != 1 && GetPVarInt(playerid,"Animation") != 1)
	{
  		ApplyAnimation(playerid,"PED","IDLE_CHAT",8.1,0,1,1,1,1);
       	SetTimerEx("ClearAnimText", 1400, false, "d", playerid);
	}
	if(GetPVarInt(playerid,"AntiFlood") > gettime())
	{
	    SendClientMessage(playerid, COLOR_LIGHTRED, NoFlood);
	    SetPVarInt(playerid,"Flood", GetPVarInt(playerid,"Flood")+5);
		return false;
	}
	if(Mobile[playerid] != -1 && Ether[playerid] == false)
	{
	    string = "";
		format(string, 128, "[Z] %s: %s", GetName(playerid), text);
		ProxDetector(playerid, 20.0, COLOR_GREY, string);
  		if(Mobile[Mobile[playerid]] == playerid) SendClientMessage(Mobile[playerid], COLOR_YELLOW, string);
		return 0;
	}
	if(GetPVarInt(playerid, "pTS1") == 1)
	{
	    if(GetPVarInt(playerid, "pTS4") == 1)
	    {
	        if(GetPVarInt(playerid, "pTS5") == 1)
	        {
			    format(string, 128, "[...] - {C3C3C3}%s {FFFFFF}(%s)", text, GetName(playerid));
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
	}
	if(GetPVarInt(playerid, "pTS1") == 1)
	{
	    if(GetPVarInt(playerid, "pTS4") == 1)
	    {
	        if(GetPVarInt(playerid, "pTS5") == 1)
	        {
			    format(string, 128, "[...] - {C3C3C3}%s {FFFFFF}(%s[%d])", text, GetName(playerid), playerid);
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
	}
	if(GetPVarInt(playerid, "pTS1") == 1)
	{
	    if(GetPVarInt(playerid, "pTS4") == 0)
	    {
	        if(GetPVarInt(playerid, "pTS1") == 1)
	        {
				format(string, 128, "[...] - {C3C3C3}%s", text);
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
	}
	if(GetPVarInt(playerid, "pTS1") == 1)
	{
	    if(GetPVarInt(playerid, "pTS4") == 0)
	    {
	        if(GetPVarInt(playerid, "pTS5") == 0)
	        {
				format(string, 128, "[...] - {C3C3C3}%s", text);
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
	}
	if(GetPVarInt(playerid, "pTS1") == 0)
	{
	    if(GetPVarInt(playerid, "pTS4") == 1)
	    {
	        if(GetPVarInt(playerid, "pTS5") == 0)
	        {
				format(string, 128, "[...] %s: %s",GetName(playerid), text);
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
	}
	if(GetPVarInt(playerid, "pTS1") == 0)
	{
	    if(GetPVarInt(playerid, "pTS4") == 1)
	    {
	        if(GetPVarInt(playerid, "pTS5") == 1)
	        {
				format(string, 128, "[...] %s[%d]: %s",GetName(playerid), playerid, text);
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
	}
	if(GetPVarInt(playerid, "pTS1") == 0)
	{
	    if(GetPVarInt(playerid, "pTS4") == 0)
	    {
	        if(GetPVarInt(playerid, "pTS5") == 0)
	        {
				format(string, 128, "[...] %s", text);
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
 	}
	if(GetPVarInt(playerid, "pTS1") == 0)
	{
	    if(GetPVarInt(playerid, "pTS4") == 0)
	    {
	        if(GetPVarInt(playerid, "pTS5") == 1)
	        {
				format(string, 128, "[...] %s", text);
				ProxDetector(playerid, 30.0, COLOR_WHITE, string);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 30.0, 2000);
				SetPVarInt(playerid,"AntiFlood",gettime() + SECOND_FLOOD);
				return false;
			}
		}
 	}
 	return false;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
	    case D_NULL: return true;
	    case D_REG:
	    {
			if(!response) return SendClientMessage(playerid, COLOR_LIGHTRED, PlayerNeedLogged), KickFromServer(playerid);
			if(!strlen(inputtext) || strlen(inputtext) < 6 || strlen(inputtext) > 15)
			{
				return ShowPlayerDialog(playerid, D_ERROR, d_Box, "{6699FF}������", "{FFFFFF}����� ������ ������ ���� �� 6 �� 15 ��������\n������������� ������������ ������� � ��������� �����, � ����� ����� �����", "������", "");
   			}
   			strmid(cDataInfo[playerid][pPassword], inputtext, 0, strlen(inputtext), 32);
			return ShowPlayerDialog(playerid, D_REG+1, d_Input, "{6699FF}����������� �����", "{FFFFFF}������� ����� ����� ����������� �����\n��������� ���, �� ������� ������������ ������ � ��������\n� ������ ������ ��� ���� �������� ������\n\n{6699FF}�� email ����� ������ ���, ������� �� ������\n������ � ��������� ���� ��� �����������.\n��������� � ������������ ����� � ������� '�����'", "�����", "�����");
		}
		case D_REG+1:
		{
  			if(response)
			{
				if(strlen(inputtext) > 8 && strfind(inputtext, "@", true) != -1 && strfind(inputtext, ".", true) != -1)
            	{
            	    strmid(cDataInfo[playerid][pMail], inputtext, 0, strlen(inputtext), 64);
   				}
				return ShowPlayerDialog(playerid, D_ERROR+1, d_Box, "{6699FF}������", "{FFFFFF}�������� ������ ����� ����������� �����", "������", "");
			}
		}
		case D_REG+2:
		{
		    if(!response) DeletePVar(playerid, "pSex");
			else SetPVarInt(playerid, "pSex", 1);
		}
		case D_REG+3:
		{
		    if(response) return ShowPlayerDialog(playerid, D_REG+4, d_Input, "{6699FF}�������", "{FFFFFF}������� ������� ������� ������ ���������:\n\n{6699FF}��� �������� �� ��� ����� ����.\n������� ����� ���� �� 18 �� 65 ���\n\n���� �������� ������ �� �������� ��� � �������.\n�������� ������� �������� ������ ����� '�������������� ����������� �������'.","�����", "�����");
			else return ShowPlayerDialog(playerid, D_REG+2, d_Box, "{6699FF}���", "{FFFFFF}�������� ��� ������ ���������:", "�������", "�������");
		}
		case D_REG+4:
		{
		    if(response)
		    {
		    	if(strlen(inputtext) != 2 || strval(inputtext) < 18 || strval(inputtext) > 65)
		    	{
		        return ShowPlayerDialog(playerid, D_ERROR+2, d_Box, "{6699FF}������", "{FFFFFF}�������� ���� ��������", "������", "");
		    	}
		        SetPVarInt(playerid, "pAge", strval(inputtext));
				if(!GetPVarInt(playerid, "pSex")) ShowPlayerDialog(playerid, D_REG+5, d_List , "{6699FF}��������������","{FFFFFF}1. ������\n2. �������\n3. ���������\n4. ����������\n5. ��������������\n6. ����������������\n", "�����", "�����");
				else ShowPlayerDialog(playerid, D_REG+5, d_List , "{6699FF}��������������","{FFFFFF}1. ������\n2. �������\n3. ���������\n4. ����������\n5. ��������������\n6. ����������������\n", "�����", "�����");
				return true;
		    }
		    else
		    {
		        format(ShowRulesDialog, sizeof(ShowRulesDialog), "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
				RulesDialog[0], RulesDialog[1], RulesDialog[2], RulesDialog[3], RulesDialog[4], RulesDialog[5], RulesDialog[6], RulesDialog[7], RulesDialog[8], RulesDialog[9], RulesDialog[10], RulesDialog[11], RulesDialog[12], RulesDialog[13], RulesDialog[14], RulesDialog[15], RulesDialog[16], RulesDialog[17]);
				ShowPlayerDialog(playerid, D_REG+3, d_Box, "{6699FF}������� �������", ShowRulesDialog, "�����", "�����");
		    }
		}
		case D_REG+5:
		{
		    switch(listitem)
		    {
				case 0: strmid(cDataInfo[playerid][pNation], (GetPVarInt(playerid, "pSex")) ? ("������") : ("������"), 0, strlen((GetPVarInt(playerid, "pSex")) ? ("������") : ("������")), 32);
				case 1: strmid(cDataInfo[playerid][pNation], (GetPVarInt(playerid, "pSex")) ? ("�������") : ("�������"), 0, strlen((GetPVarInt(playerid, "pSex")) ? ("�������") : ("�������")), 32);
				case 2: strmid(cDataInfo[playerid][pNation], (GetPVarInt(playerid, "pSex")) ? ("���������") : ("���������"), 0, strlen((GetPVarInt(playerid, "pSex")) ? ("���������") : ("���������")), 32);
				case 3: strmid(cDataInfo[playerid][pNation], (GetPVarInt(playerid, "pSex")) ? ("����������") : ("����������"), 0, strlen((GetPVarInt(playerid, "pSex")) ? ("����������") : ("����������")), 32);
				case 4: strmid(cDataInfo[playerid][pNation], (GetPVarInt(playerid, "pSex")) ? ("��������������") : ("��������������"), 0, strlen((GetPVarInt(playerid, "pSex")) ? ("��������������") : ("��������������")), 32);
				case 5: strmid(cDataInfo[playerid][pNation], (GetPVarInt(playerid, "pSex")) ? ("����������������") : ("����������������"), 0, strlen((GetPVarInt(playerid, "pSex")) ? ("����������������") : ("����������������")), 32);
		    }
		    if(response)
		    {
			    SetSpawnInfo(playerid, 255, GetPVarInt(playerid, "pModel"), 0, 0, 0, 1.0, -1, -1, -1, -1, -1, -1);
				SetPVarInt(playerid, "Nation", listitem);
				SetPVarInt(playerid, "Clothes", 1);
				SetPVarInt(playerid, "Logged", 1);
				SetHealth(playerid, 100);
				return SpawnPlayer(playerid);
			}
			else ShowPlayerDialog(playerid, D_REG+4, d_Input, "{6699FF}�������", "{FFFFFF}������� ������� ������� ������ ���������:\n\n{6699FF}��� �������� �� ��� ����� ����.\n������� ����� ���� �� 18 �� 65 ���\n\n���� �������� ������ �� �������� ��� � �������.\n�������� ������� �������� ������ ����� '�������������� ����������� �������'.","�����", "�����");
		}
		case D_LOG:
		{
  			if(!response) return SendClientMessage(playerid, COLOR_LIGHTRED, PlayerNeedLogged), KickFromServer(playerid);
        	if(!strlen(inputtext))
			{
				format(string, 200, "{FFFFFF}����� ���������� �� ������ "NameServer"\n{FFFFFF}��� ��� ���������������\n\n�����:{6699FF} %s\n{FFFFFF}������� ������:",GetName(playerid));
				return ShowPlayerDialog(playerid, D_LOG, d_Input, "{6699FF}�����������", string, "����","�����");
			}
			mysql_format(Mysql, query, sizeof(query),"SELECT * FROM "TABLE_ACCOUNT" WHERE name = '%e' LIMIT 1",GetName(playerid));
    		return mysql_function_query(Mysql, query, true, "BadLogin","is", playerid, inputtext);
		}
		case D_HOUSE:
		{
			if(!response) return true;
			new idx = GetPVarInt(playerid, "PlayerHome");
  			if(!strcmp(HouseInfo[idx][hOwner],"None",true)) return ShowPlayerDialog(playerid, D_HOUSE+1, d_Box, "{6699FF}������", "{FFFFFF}�������� ������� ��� ��� ������ ������", "��������", "����");
			else
			{
				if(HouseInfo[idx][hLock]) GameTextForPlayer(playerid, "~r~LOCK", 777, 1);
				else
				{
    				SetPlayerPos(playerid,HouseInfo[idx][hExit][0],HouseInfo[idx][hExit][1],HouseInfo[idx][hExit][2]);
					SetPlayerInterior(playerid,HouseInfo[idx][hInt][0]);
					SetPlayerVirtualWorld(playerid,HouseInfo[idx][hInt][1]);
					return true;
				}
			}
			return true;
		}
		case D_HOUSE+1:
		{
		    new idx = GetPVarInt(playerid, "PlayerHome");
		    if(GetPlayerHouse(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[H] �� �������� �����!");
		    if(response)
		    {
		        if(GetMoney(playerid) < HouseInfo[idx][hPrice]) return SendClientMessage(playerid, COLOR_LIGHTRED, NotEnoughMoney);
		        GiveMoney(playerid, -HouseInfo[idx][hPrice]);
				SendMes(playerid, COLOR_CREAM, "[H] �� ������ ��� �� $%i. �������: $%i",HouseInfo[idx][hPrice], GetMoney(playerid));
		    }
		    else
		    {
				if(GetPVarInt(playerid, "Bank") < HouseInfo[idx][hPrice]) return SendClientMessage(playerid, COLOR_LIGHTRED, NotEnoughMoney);
				SetPVarInt(playerid, "Bank", GetPVarInt(playerid, "Bank") - HouseInfo[idx][hPrice]);
				SetPlayerInt(GetName(playerid), "Bank", GetPVarInt(playerid, "Bank"));
				SendMes(playerid, COLOR_CREAM, "[H] �� ������ ��� �� $%i. ������� �� �����: $%i.",HouseInfo[idx][hPrice], GetPVarInt(playerid, "Bank"));
		    }
		    SetPlayerInterior(playerid, HouseInfo[idx][hInt][0]);
		    SetPlayerVirtualWorld(playerid, HouseInfo[idx][hInt][1]);
			SetPlayerPos(playerid, HouseInfo[idx][hExit][0], HouseInfo[idx][hExit][1], HouseInfo[idx][hExit][2]);
			strmid(HouseInfo[idx][hOwner], GetName(playerid), 0, strlen(GetName(playerid)), MAX_PLAYER_NAME);
			SendClientMessage(playerid, COLOR_CREAM, "[H] �������� ����� �������: /setup");
			SetHouseStr(idx, "Owner", HouseInfo[idx][hOwner]);
		    return UpdateHouse(idx);
		}
		case D_HOUSE+2:
		{
  			if(!response) return true;
		    new i = GetPVarInt(playerid, "PlayerHouse");
		    switch(listitem)
		    {
		        case 0:
		        {
		            if(!HouseInfo[i][hLock])
		            {
   	 					HouseInfo[i][hLock] = 1;
					 	format(string, 16, "~r~LOCK");
					 	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					 	GameTextForPlayer(playerid, string, 777, 1);
		 				return SetHouseInt(i, "Lock", HouseInfo[i][hLock]);
					}
					else
					{
                        HouseInfo[i][hLock] = 0;
					 	format(string, 16, "~g~UNLOCK");
					 	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					 	GameTextForPlayer(playerid, string, 777, 1);
						return SetHouseInt(i, "Lock", HouseInfo[i][hLock]);
					}
		        }
				case 1:
				{
					new h_string[64];
					format(h_string, sizeof(h_string), "{FFFFFF}�� ����� �������� �����: {6699FF}%i {FFFFFF}��������", HouseInfo[i][hOplata]);
					return ShowPlayerDialog(playerid, D_HOUSE+4, d_Box, "{6699FF}������", h_string, "�����", "�����");
				}
				case 2: return true;
				case 3: return ShowPlayerDialog(playerid, D_HOUSE+3, d_Box, "{6699FF}������� ���", "{FFFFFF}�� ������ ������� ���� ���?", "��", "���");
		    }
		    return true;
		}
		case D_HOUSE+3:
		{
		    if(!response) return true;
	   		new i = GetPVarInt(playerid, "PlayerHouse");
		    strmid(HouseInfo[i][hOwner], "None", 0, strlen("None"), MAX_PLAYER_NAME);
		    SetHouseStr(i, "Owner", "None");
		    SetHouseInt(i, "Oplata", 0);
		    SetHouseInt(i, "Lock", 0);
			HouseInfo[i][hOplata] = 0;
			HouseInfo[i][hLock] = 0;
			UpdateHouse(i);
			SendClientMessage(playerid, COLOR_CREAM, "[H] �� ������� ��� �����.");
			SetPVarInt(playerid, "Bank", GetPVarInt(playerid, "Bank") +HouseInfo[i][hPrice] / 2);
			SetPlayerInt(GetName(playerid), "Bank", GetPVarInt(playerid, "Bank"));
			if(GetPVarInt(playerid, "CREVEH") > 0)
			{
				DestroyVehicle(GetPVarInt(playerid,"CREVEH"));
				DeletePVar(playerid,"CREVEH");
			}
		}
		case D_HOUSE+4: ShowPlayerDialog(playerid, D_HOUSE+2, d_List, "{6699FF}���� ������������", "{FFFFFF}1. ������� ��� ������� ���\n2. ������ ����\n3. ���������\n4. ������� ���", "�������", "�����");
		case D_BUSINESS:
		{
		    if(!response) return true;
		    if(response)
		    {
			    new idx = GetPVarInt(playerid, "PlayerBizz");
			    if(GetMoney(playerid) < BizzInfo[idx][bEnter]) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ������������ �����.");
			    GiveMoney(playerid, -BizzInfo[idx][bEnter]);
			    BizzInfo[idx][bMoney] += BizzInfo[idx][bEnter];
			    BizzPay[idx] += BizzInfo[idx][bEnter];
			    SetBizzInt(idx, "money", BizzInfo[idx][bMoney]);
			    SetPlayerPos(playerid,BizzInfo[idx][bExitx], BizzInfo[idx][bExity], BizzInfo[idx][bExitz]);
				SetPlayerInterior(playerid,BizzInfo[idx][bInt]);
				SetPlayerVirtualWorld(playerid,BizzInfo[idx][bVW]);
			}
			return true;
		}
		case D_BUSINESS+1:
		{
  			if(!response) return true;
  			if(response)
  			{
			    new idx = GetPVarInt(playerid, "PlayerBizz");
			    SetPlayerPos(playerid,BizzInfo[idx][bExitx], BizzInfo[idx][bExity], BizzInfo[idx][bExitz]);
				SetPlayerInterior(playerid,BizzInfo[idx][bInt]);
				SetPlayerVirtualWorld(playerid,BizzInfo[idx][bVW]);
			}
			return true;
		}
		case D_BUSINESS+2:
		{
  			if(!response) return true;
		    new idx = GetPVarInt(playerid, "PlayerBizz");
		    SetPlayerPos(playerid,BizzInfo[idx][bEntrx], BizzInfo[idx][bEntry], BizzInfo[idx][bEntrz]);
			SetPlayerInterior(playerid,0);
			SetPlayerVirtualWorld(playerid,0);
			return true;
		}
		case D_BUSINESS+7:
		{
  			if(!response) return true;
		    new i = GetPVarInt(playerid, "PlayerBizz");
		    switch(listitem)
		    {
		        case 0: BizzStats(playerid, i);
				case 1:
				{
				    if(BizzInfo[i][bLock] == 0) return SendClientMessage(playerid, COLOR_GREY, "[B] ������ ��� ������!");
				    if(BizzInfo[i][bProduct] <= 0 || BizzInfo[i][bLic] == 0) return SendClientMessage(playerid, COLOR_GREY, "[B] � ������� ��� ��������� ��� ��� ��������!");
				    BizzInfo[i][bLock] = 0, BizzInfo[i][bLockTime] = 0;
				    SetBizzInt(i, "block", BizzInfo[i][bLock]);
					SetBizzInt(i, "locktime", BizzInfo[i][bLockTime]);
				    SendClientMessage(playerid, COLOR_LIGHTRED, "[B] �� ������� ������. ������ ������� �� ���������� ��������� � ���������");
				    return SendClientMessage(playerid, COLOR_LIGHTRED, "[B] � ��������� ������ �� ������ �������� ������");
				}
				case 2: return ShowPlayerDialog(playerid, D_BUSINESS+8, d_Input, "{6699FF}����", "{FFFFFF}������� ���� �� ����� � ���������:", "������", "�����");
		        case 3:
				{
				    if(BizzInfo[i][bType] < 21) return ShowPlayerDialog(playerid, D_BUSINESS+9, d_Input, "{6699FF}����", "{FFFFFF}������� ���� �� ���� � ��������:", "������", "�����");
				    else return SendClientMessage(playerid, COLOR_GREY, "[!] ������� �������� ��������.");
				}
				case 4:
				{
				    ShowPlayerDialog(playerid, D_BUSINESS+12, d_Box, "{6699FF}�������� ��������", "{FFFFFF}�� ������� ��� ������ �������� 5.000 ��������� ���������� 50.000$?", "��", "���");
				}
				case 5: return ShowPlayerDialog(playerid, D_BUSINESS+10, d_Box, "{6699FF}������� �������", "{FFFFFF}�� ������ ������� ���� ������?\n\n{FF6347}��������! ��� ������ ������ �������� ��������� �������!", "�������", "�����");
		    }
		    return true;
		}
		case D_BUSINESS+8:
		{
		    if(!response)
		    {
		        if(GetPlayerBizz(playerid) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� ��������!");
				return ShowPlayerDialog(playerid, D_BUSINESS+7, 2, "{6699FF}���� �����������", "1. ���������� � �������\n2. ������� ������\n3. ���������� ���� �� �����\n4. ���������� ���� �� ����\n5. �������� ��������\n6. ������� ������", "�������", "�����");
		    }
		    new price, i = GetPVarInt(playerid, "PlayerBizz");
		    if(sscanf(inputtext, "i", price)) return ShowPlayerDialog(playerid, D_BUSINESS+8, d_Box, "{6699FF}����", "{FFFFFF}������� ���� �� ����� � ���������:", "������", "�����");
		    if(price < 1 || price > 100) return ShowPlayerDialog(playerid, D_BUSINESS+8, d_Box, "{6699FF}����", "{FFFFFF}������� ���� �� ����� � ���������:", "������", "�����");
		    BizzInfo[i][bTill] = price;
		    SetBizzInt(i, "till", price);
		    return SendMes(playerid, COLOR_CREAM, "[B] �� ���������� ���� �� �����: {6699FF}%i ���������", price);
		}
		case D_BUSINESS+9:
		{
		    if(!response)
		    {
		        if(GetPlayerBizz(playerid) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� ��������!");
				return ShowPlayerDialog(playerid, D_BUSINESS+7, 2, "{6699FF}���� �����������", "1. ���������� � �������\n2. ������� ������\n3. ���������� ���� �� �����\n4. ���������� ���� �� ����\n5. �������� ��������\n6. ������� ������", "�������", "�����");
		    }
		    new enter, i = GetPVarInt(playerid, "PlayerBizz");
		    if(sscanf(inputtext, "i", enter)) return ShowPlayerDialog(playerid, D_BUSINESS+9, d_Input, "{6699FF}����", "{FFFFFF}������� ���� �� ���� � ��������:", "������", "�����");
		    if(enter < 1 || enter > 10000) return ShowPlayerDialog(playerid, D_BUSINESS+9, d_Input, "{6699FF}����", "{FFFFFF}������� ���� �� ���� � ��������:\n{FF0000}���� �� ���� �� 0 �� 10.000$!", "������", "�����");
		    BizzInfo[i][bEnter] = enter;
		    SetBizzInt(i, "penter", enter);
		    return SendMes(playerid, COLOR_CREAM, "[B] �� ���������� ���� �� ����: {6699FF}%i$.", enter);
		}
		case D_BUSINESS+10:
		{
		    if(!response)
		    {
		        if(response)
  				{
	  			    if(GetPlayerBizz(playerid) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� ��������!");
					return ShowPlayerDialog(playerid, D_BUSINESS+7, 2, "{6699FF}���� �����������", "1. ���������� � �������\n2. ������� ������\n3. ���������� ���� �� �����\n4. ���������� ���� �� ����\n5. �������� ��������\n6. ������� ������", "�������", "�����");
  				}
		    }
			if(response)
			{
				new i = GetPVarInt(playerid, "PlayerBizz");
				strmid(BizzInfo[i][bOwner], "None", 0, strlen("None"), MAX_PLAYER_NAME);
				BizzInfo[i][bLock] = 0;
				SendClientMessage(playerid, COLOR_LIGHTRED, "[B] �� ������� ���� ������. ������ � ������� ���������� �� ��� ����");
				SetPVarInt(playerid, "Bank", GetPVarInt(playerid, "Bank") + BizzInfo[i][bPrice] / 2 + BizzInfo[i][bMoney]);
				BizzInfo[i][bMoney] = 0, BizzInfo[i][bLic] = 0, BizzInfo[i][bEnter] = 100, BizzInfo[i][bTill] = 50;
	            SetPlayerInt(GetName(playerid), "Bank", GetPVarInt(playerid, "Bank"));
				format(query, sizeof(query), "UPDATE "TABLE_BIZZ" SET owner = '%s', block = %d, money = %d, lic = %d, penter = %d, till = %d WHERE id = %d",
				BizzInfo[i][bOwner], BizzInfo[i][bLock], BizzInfo[i][bMoney], BizzInfo[i][bLic], BizzInfo[i][bEnter], BizzInfo[i][bTill],i);
				mysql_function_query(Mysql, query, false, "", "");
				UpdateBizz(i);
			}
		}
		case D_BUSINESS+11:
		{
		    if(response)
  			{
  			    if(GetPlayerBizz(playerid) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� ��������!");
				return ShowPlayerDialog(playerid, D_BUSINESS+7, 2, "{6699FF}���� �����������", "1. ���������� � �������\n2. ������� ������\n3. ���������� ���� �� �����\n4. ���������� ���� �� ����\n5. �������� ��������\n6. ������� ������", "�������", "�����");
  			}
		}
		case D_BUSINESS+12:
		{
		    if(!response) return ShowPlayerDialog(playerid, D_BUSINESS+7, 2, "{6699FF}���� �����������", "1. ���������� � �������\n2. ������� ������\n3. ���������� ���� �� �����\n4. ���������� ���� �� ����\n5. �������� ��������\n6. ������� ������", "�������", "�����");
		    if(response)
		    {
		        if(GetMoney(playerid) < 50000) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ������������ �������.");
				GivePlayerMoney(playerid, -50000);
				BizzInfo[playerid][bProduct] += 5000;
		    }
		}
		case D_MENU:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0: return Stats(playerid);
		        case 1:
				{
				    if(!GetPVarInt(playerid, "Admin")) return ShowPlayerDialog(playerid, D_MENU+1, d_List, "{6699FF}������� �������", "{ADFF2F}1. �������� ��������\n{FFFFFF}2. ����� �������\n3. ������� ����\n4. ������� ����\n5. ������� �����������", "�������","�����");
				    return ShowPlayerDialog(playerid, D_MENU+1, d_List, "{6699FF}������� C������", "{ADFF2F}1. �������� ��������\n{FFFFFF}2. ����� �������\n3. ������� ����\n4. ������� ����\n5. ������� �����������\n6. ������� ��������������", "�������","�����");
				}
		        case 2:
		        {
		            format(ShowRulesDialog, sizeof(ShowRulesDialog), "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
					RulesDialog[0], RulesDialog[1], RulesDialog[2], RulesDialog[3], RulesDialog[4], RulesDialog[5], RulesDialog[6], RulesDialog[7], RulesDialog[8], RulesDialog[9], RulesDialog[10], RulesDialog[11], RulesDialog[12], RulesDialog[13], RulesDialog[14], RulesDialog[15], RulesDialog[16], RulesDialog[17]);
					ShowPlayerDialog(playerid, D_MENU+5, d_Box, "{6699FF}������� �������", ShowRulesDialog, "�����", "�����");
		        }
		        case 4: return ShowPlayerDialog(playerid, D_MENU+20, d_List, "{6699FF}��������� ������������", "{FFFFFF}1. ���������� � ����������\n2. ��������� ���������� �������\n3. ��������� ������", "�������", "�����");
		        case 5: return ShowPlayerDialog(playerid, D_MENU+7, d_List, "{6699FF}���������", "{FFFFFF}1. ����������", "�������", "�����");
		        case 6: return EditSettings(playerid);
				case 7: return ShowPlayerDialog(playerid, D_MENU+4, d_Input, "{6699FF}����� � ��������������", "{FFFFFF}������� ��� ��������� ��� ������������� �������\n��� ������ ���� ������� � �����\n\n{6699FF}���� �� ������ ������ ������ �� ������,\n����������� ������� ��� ID � ������� ������", "���������", "�����");
		        case 8:
		        {
		            new ExtraUses[720];
		            new ExtraUses2[64];
		            new ExtraUses3[64];
		            ExtraUses = "";
		            strcat(ExtraUses, "{FFFFFF}� ���� ������� �� ������� ���������� � ������������ ��������������\n");
		            strcat(ExtraUses, "{FFFFFF}����������� �������. ��� ��������� �� ��������� ������������� ��\n");
		            strcat(ExtraUses, "{FFFFFF}������� ���� ������ ��������. ������ � ���� ����� ��������,\n");
		            strcat(ExtraUses, "{FFFFFF}�������� ���� ������� ����. �������� ���� ��������������\n");
		            strcat(ExtraUses, "{FFFFFF}������������, � ����� � �������� ���������� ����� �� ������\n");
		            strcat(ExtraUses, "{FFFFFF}������ �� �����: {DAA520}www.ru (� ������� ''�������������'')\n\n");
		            strcat(ExtraUses, "{42AAFF}����������:\n");
		            format(ExtraUses2, sizeof(ExtraUses2), "{FFFFFF}����� ��������:\t\t\t%i\n", GetPVarInt(playerid, "pID"));
		            strcat(ExtraUses, ExtraUses2);
		            format(ExtraUses3, sizeof(ExtraUses3), "{FFFFFF}������� ��������� �����:\t\t%i\n", GetPVarInt(playerid, "pExtra"));
		            strcat(ExtraUses, ExtraUses3);
		            strcat(ExtraUses, "{FFFFFF}�������������� ������� ������:  {FF0000}�{FFFFFF}����� ������, WebMoney (WMR), Qiwi");
					return ShowPlayerDialog(playerid, D_EXTRA, d_Box, "{6699FF}�������������", ExtraUses, "��������", "�����");
				}
				case 9:
				{
				    Tranquilizator(playerid);
				}
    		}
		    return true;
		}
		case D_MENU+1:
		{
		    if(!response) return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		    switch(listitem)
		    {
		        case 0: ShowPlayerDialog(playerid, D_CMDHELP+1, d_Input, "{6699FF}�������� �������", "{FFFFFF}������� ������������ ��� �������\n��� ��������� � ��������:", "��������", "�����");
		        case 1:
		        {
					new player_cmd[577];
		            strcat(player_cmd, "{FFFFFF}[ /setup ]{F0DC82} - ���� ������\n");
		            strcat(player_cmd, "{FFFFFF}[ /pass ]{F0DC82} - ����� ���������\n");
		            strcat(player_cmd, "{FFFFFF}[ /time ]{F0DC82} - ����\n");
		            strcat(player_cmd, "{FFFFFF}[ /pay ]{F0DC82} - �������� �����\n");
		            strcat(player_cmd, "{FFFFFF}[ /setspawn ]{F0DC82} - �������� ����� ���������\n");
		            strcat(player_cmd, "{FFFFFF}[ /dinfo ]{F0DC82} - ������� ��������\n");
		            strcat(player_cmd, "{FFFFFF}[ /action]{F0DC82} - ��������\n");
		            strcat(player_cmd, "{FFFFFF}[ /do ]{F0DC82} - �������� �� 1 ����\n");
		            strcat(player_cmd, "{FFFFFF}[ /me ]{F0DC82} - ���������� ��������\n");
		            strcat(player_cmd, "{FFFFFF}[ /n ]{F0DC82} - OOC ���\n");
		            strcat(player_cmd, "{FFFFFF}[ /try ]{F0DC82} - ������� ��������� ���-��\n");
		            strcat(player_cmd, "{FFFFFF}[ /s }{F0DC82} - ���������� ��� ����\n");
		            ShowPlayerDialog(playerid, D_CMDHELP, d_Box, "{6699FF}����� �������", player_cmd, "�����", "�����");
		        }
				case 2:
				{
				    new vehicle_cmd[512];
				    strcat(vehicle_cmd, "{FFFFFF}[ /en ]{F0DC82} - ������� / ��������� ���������\n");
				    strcat(vehicle_cmd, "{FFFFFF}[ /car ]{F0DC82} - ���������� ������������ ���������\n");
				    strcat(vehicle_cmd, "{FFFFFF}[ /li ]{F0DC82} - �������� / ��������� ����\n");
				    strcat(vehicle_cmd, "{FFFFFF}[ /boot ]{F0DC82} - ������� / ������� ��������\n");
				    strcat(vehicle_cmd, "{FFFFFF}[ /eject ]{F0DC82} - ��������� ������ �� ����������\n");
				    strcat(vehicle_cmd, "{FFFFFF}[ /bonnet ]{F0DC82} - ������� / ������� �����\n");
				    ShowPlayerDialog(playerid, D_CMDHELP, d_Box, "{6699FF}������� ����", vehicle_cmd, "�����", "�����");
				}
				case 3:
				{
				    new home_cmd[512];
				    strcat(home_cmd, "{FFFFFF}[ /house ]{F0DC82} - ���� ������������\n");
				    strcat(home_cmd, "{FFFFFF}[ /exit ]{F0DC82} - �������� ������������\n");
				    ShowPlayerDialog(playerid, D_CMDHELP, d_Box, "{6699FF}������� ����", home_cmd, "�����", "�����");
				}
				case 4:
				{
				    new organize_cmd[3092];
				    if(GetPVarInt(playerid, "pMember") == 1)
				    {
				        strcat(organize_cmd, "{FFFFFF}[ /payment ]{F0DC82} - ��������� ������� ��� ��������������� �����������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 2)
				    {
				        strcat(organize_cmd, "{FFFFFF}[ /case ]{F0DC82} - ���������� ������ �����\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 3)
				    {
                        strcat(organize_cmd, "{FFFFFF}[ /case ]{F0DC82} - ���������� ������ �����\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 4)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /superinvite ]{F0DC82} - ������ ������������� � ������ � �����\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 5)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /superinvite ]{F0DC82} - ������ ������������� � ������ � �����\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 6)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /superinvite ]{F0DC82} - ������ ������������� � ������ � �����\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 7)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /superinvite ]{F0DC82} - ������ ������������� � ������ � �����\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 8)
				    {
				        strcat(organize_cmd, "{FFFFFF}[ /incar ]{F0DC82} - �������� � ����������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /case ]{F0DC82} - ������ �������������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /wanted ]{F0DC82} - ������ �������������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 9)
				    {
				        strcat(organize_cmd, "{FFFFFF}[ /incar ]{F0DC82} - �������� � ����������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /case ]{F0DC82} - ������ �������������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /wanted ]{F0DC82} - ������ �������������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 10)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /incar ]{F0DC82} - �������� � ����������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /case ]{F0DC82} - ������ �������������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /wanted ]{F0DC82} - ������ �������������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 12)
				    {
				        strcat(organize_cmd, "{FFFFFF}[ //t ]{F0DC82} - ���������� ������������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /u ]{F0DC82} - ���������� ������������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /bring ]{F0DC82} - ���������� ������������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /audience ]{F0DC82} - ���������� ������������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /camera ]{F0DC82} - ���������� ������������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /light ]{F0DC82} - ���������� ������������\n");
				        strcat(organize_cmd, "{FFFFFF}[ /makeskin ]{F0DC82} - ���������� ������������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /edit ]{F0DC82} - ���������� ������������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 13)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /edit ]{F0DC82} - ���������� ������������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 14)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /edit ]{F0DC82} - ���������� ������������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 15)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /hp ]{F0DC82} - ������ ��������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 16)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /hp ]{F0DC82} - ������ ��������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    if(GetPVarInt(playerid, "pMember") == 17)
				    {
					    strcat(organize_cmd, "{FFFFFF}[ /hp ]{F0DC82} - ������ ��������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /star ]{F0DC82} - ���������� ����������� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /jail ]{F0DC82} - ����� ���������\n");
					    strcat(organize_cmd, "{FFFFFF}[ /unjail ]{F0DC82} - ������ ���������\n");
				    }
				    ShowPlayerDialog(playerid, D_CMDHELP, d_Box, "{6699FF}������� �����������", organize_cmd, "�����", "�����");
				}
				case 5:
				{
				    new administrator_cmd[1256];
				    strcat(administrator_cmd, "{FFFFFF}[ /admin ]{F0DC82} - ����������� ��� ������� ������� ��������������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /a ]{F0DC82} - ����������������� ���\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /kick ]{F0DC82} - ������� ������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /fixveh ]{F0DC82} - �������� ���������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /setfuel ]{F0DC82} - �������� ������� ������� � ������������ ��������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /sethp ]{F0DC82} - �������� � ������ ������� ��������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /ao ]{F0DC82} - ��������������� ����������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /tp ]{F0DC82} - ����������������� � ������������ ������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /veh ]{F0DC82} - ������� ��������� � ������� 2-� ������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /dveh ]{F0DC82} - ���������� ���������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /gethere ]{F0DC82} - ��������������� ������ � ����\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /setstats ]{F0DC82} - ��������� ���������� � ������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /tpcor ]{F0DC82} - �������� �� ��������� �����������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /add ]{F0DC82} - ������������ ����\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /settime ]{F0DC82} - ��������� �������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /payday ]{F0DC82} - ������ �������� ���� �������\n");
				    strcat(administrator_cmd, "{FFFFFF}[ /givemoney ]{F0DC82} - ������ ����� ������ ����������\n");
				    ShowPlayerDialog(playerid, D_CMDHELP, d_Box, "{6699FF}������� ��������������", administrator_cmd, "�����", "�����");
					}
		    }
		    return true;
		}
		case D_MENU+2:
		{
		    if(!response) return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		    switch(listitem)
		    {
		        case 0..1: return true;
      		}
		    return true;
		}
		case D_MENU+3:
		{
		    if(!response) return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		    return true;
		}
		case D_MENU+4:
		{
		    if(!response) return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		  	if(GetPVarInt(playerid,"AntiFloodRep") > gettime()) return SendClientMessage(playerid, COLOR_LIGHTRED, PlayerRepFlood);
			SendAdmin(COLOR_LIGHTRED, "[A] [R] ������ �� %s (ID: %d): %s", GetName(playerid), playerid, inputtext);
			SetPVarInt(playerid,"AntiFloodRep",gettime() + REPORT_FLOOD);
			return SendClientMessage(playerid, COLOR_CREAM, "[S] ��� ������ ��� ��������� �������������");
		}
		case D_MENU+5: if(response) ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		case D_MENU+7:
		{
		    if(response)
		    {
		        string = "";
		        strcat(string, "{FFFFFF}1. ������������ �������� ��������� � ������� ����� ����������\n�����. ������� �������� ����� ����������� ���������.\n\n");
		        strcat(string, "2. ������������� �������� ��� �������������� ��������� ������� ��\n���������� � ����������� (������� /escape).");
		        strcat(string, "��� ������������� �� ��\n������� �������� ����������� �� ������������ �������.\n\n");
		        strcat(string, "3. ����������� �������� ��� �������������� � �������� ����������� �� \n����� ������� ���������.");
		        strcat(string, "��� ������� ��������� �� ������� �\n������� �� ����� ������ ���������.\n\n");
		        strcat(string, "4. ������ ���� ����������� ���������� � ����� ������, ������� �\n��������� � ������� ������� ����������.\n\n");
		        strcat(string, "5. ���� �������� ��������, ��������� ���������� ��� ����� �����������\n������ �� ����� �������� ��� ��������� ������.\n\n");
		        ShowPlayerDialog(playerid, D_MENU+15, d_Box, "{6699FF}����������", string, "�����", "�����");
      		}
			else return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		}
		case D_MENU+15:
		{
		    if(response) ShowPlayerDialog(playerid, D_MENU+7, d_List, "{6699FF}���������", "{FFFFFF}1. ����������", "�������", "�����");
			else return true;
		}
		case D_MENU+16:
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:
		            {
		                if(GetPVarInt(playerid, "pTS1") == 1)
		                {
		                    SetPVarInt(playerid, "pTS1", 0), EditSettings(playerid);
						}
						else SetPVarInt(playerid, "pTS1", 1), EditSettings(playerid);
					}
					case 1:
					{
					    if(GetPVarInt(playerid, "pTS2") == 1)
					    {
					        SetPVarInt(playerid, "pTS2", 0), EditSettings(playerid);
						}
						else SetPVarInt(playerid, "pTS1", 1), EditSettings(playerid);
					}
					case 2:
					{
					    if(GetPVarInt(playerid, "pTS3") == 1)
					    {
					        SetPVarInt(playerid, "pTS3", 0), EditSettings(playerid);
						}
						else SetPVarInt(playerid, "pTS3", 1), EditSettings(playerid);
					}
					case 3:
					{
					    if(GetPVarInt(playerid, "pTS4") == 1)
					    {
					        SetPVarInt(playerid, "pTS4", 0), EditSettings(playerid);
						}
						else SetPVarInt(playerid, "pTS4", 1), EditSettings(playerid);
					}
					case 4:
					{
					    if(GetPVarInt(playerid, "pTS5") == 1)
					    {
					        SetPVarInt(playerid, "pTS5", 0), EditSettings(playerid);
						}
						else SetPVarInt(playerid, "pTS5", 1), EditSettings(playerid);
					}
					case 5:
					{
					    if(GetPVarInt(playerid, "pAKey") == 1)
					    {
					        SetPVarInt(playerid, "pAKey", 0), EditSettings(playerid);
						}
						else SetPVarInt(playerid, "pAKey", 1), EditSettings(playerid);
					}
					case 6:
					{
					    SendClientMessage(playerid, COLOR_CREAM, "[P] ������ ��������� ������� ���������!");
					    SetPlayerInt(GetName(playerid), "ts1", GetPVarInt(playerid, "pTS1"));
					    SetPlayerInt(GetName(playerid), "ts2", GetPVarInt(playerid, "pTS2"));
					    SetPlayerInt(GetName(playerid), "ts3", GetPVarInt(playerid, "pTS3"));
					    SetPlayerInt(GetName(playerid), "ts4", GetPVarInt(playerid, "pTS4"));
					    SetPlayerInt(GetName(playerid), "ts5", GetPVarInt(playerid, "pTS5"));
					    SetPlayerInt(GetName(playerid), "akey", GetPVarInt(playerid, "pAKey"));
					}
				}
			}
			else ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		}
		case D_MENU+20:
		{
		    switch(listitem)
		    {
		        case 0:
		        {
				    if(response)
				    {
				        string = "";
				        strcat(string, "{FFFFFF}��� �� ������ �������� ��������� ������������ ������ ��������.\n��� ������� �������� ��� �� ������. ���������� ��� ���� ������:\n� �������������� Email, ���������� �������� ��� ��������� ����.\n");
				        strcat(string, "���� �� �������� ������, �� ��� ����������� ������ ������ �����\n������������� ���� Email, �������� ��� ���� (� ����������� ��\n");
				        strcat(string, "����� ��������). ����� �������� �� ������� � ������, ������\n������ ����� � ���� ������������. ���������� ��� ���� ��������:\n\n");
				        strcat(string, "{6699FF}1. ����������� ������\n2. ����������� ������ ���� IP �� ��������� � ����\n3. �� �����������\n\n");
				        strcat(string, "{FFFFFF}������ � ������ �����, ������ �� ������� ����������. ��� ��������\n�������, �� ������� ����� ����������� ���� ������ ���� �������\n�������");
				        strcat(string, "(������ 2 ����� IP ������) ������ �� ��������� � ���,\n������� ���� �������� ��� �����������. ������� ������� �������\n������ ������,");
				        strcat(string, "���� ��� ����� ��������� ���������� ����� �\n������� ����������.");
				        ShowPlayerDialog(playerid, D_MENU+21, d_Box, "{6699FF}���������� � ����������", string, "�����", "�����");
					}
					else return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
				}
				case 1: ShowPlayerDialog(playerid, D_MENU+23, d_Input, "{6699FF}��������� ���������� �������", "{FFFFFF}������� ��� ����������� ��������� ������\n������ ��� ������� � ����� ��������������\n������ ����������� ����� � ������� �����.\n\n����� �������� �� ������ ������ ���������\n����� �� ��� ������.", "�����", "�����");
			}
		}
		case D_MENU+21:
		{
		    if(response)
		    {
		        return ShowPlayerDialog(playerid, D_MENU+20, d_List, "{6699FF}��������� ������������", "{FFFFFF}1. ���������� � ����������\n2. ��������� ���������� �������\n3. ��������� ������", "�������", "�����");
			}
			else return true;
		}
		case D_MENU+22:
		{
		    if(response) return true;
		    else return ShowPlayerDialog(playerid, D_MENU+20, d_List, "{6699FF}��������� ������������", "{FFFFFF}1. ���������� � ����������\n2. ��������� ���������� �������\n3. ��������� ������", "�������", "�����");
		}
		case D_MENU+23:
		{
		    if(response)
		    {
		        return ShowPlayerDialog(playerid, D_MENU+27, d_Input, "{6699FF}��������� ���������� ������", "{FFFFFF}������� ��� ����������� ��������� �����\n������ ��� ������� � ����� ������ �� ��������� ������.\n��� ������� ������ ��� �������\n�������������.\n\n������ �� ���������� ��������� �����.\n����� �� �������� �������� �������.", "������", "�����");
			}
			else return ShowPlayerDialog(playerid, D_MENU+20, d_List, "{6699FF}��������� ������������", "{FFFFFF}1. ���������� � ����������\n2. ��������� ���������� �������\n3. ��������� ������", "�������", "�����");
		}
		case D_ADMIN:
		{
  			if(!response) return true;
		    if(!strlen(inputtext)) return ShowPlayerDialog(playerid, D_ADMIN, d_Input, "{6699FF}�����������", "{FFFFFF}������� ����������������� ����:", "����", "�����");
			if(strlen(inputtext) < 1 || strlen(inputtext) > 32) return ShowPlayerDialog(playerid, D_ADMIN, d_Input, "{6699FF}�����������", "{FFFFFF}������� ����������������� ����:", "����", "�����");
      		if(strcmp(inputtext, cDataInfo[playerid][pAdmPassword], true)) return SendClientMessage(playerid, COLOR_LIGHTRED, NotTruePassword), KickFromServer(playerid);
        	else
			{
			    SetPVarInt(playerid, "AdmLogged", 1);
			    SetPVarInt(playerid, "SendAdmin", 1);
			    return SendAdmin(COLOR_LIGHTRED, "[A] ����� %s (ID: %i) �������������(���) ��� �������������", GetName(playerid), playerid);
			}
		}
		case D_ADMIN+1:
		{
  			if(!response) return true;
  			SetPVarInt(playerid, "PlayerStats", listitem+1);
			switch(listitem)
			{
			   	case 0: return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}��� ������", "{FFFFFF}������� ��� ��� ������:", "��������", "�����");
			   	case 1: return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}���� ������", "{FFFFFF}������� ���� ��� ������:", "��������", "�����");
			   	case 2: return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������� ������", "{FFFFFF}������� ������� ��� ������:", "��������", "�����");
			    case 3: return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������ ������", "{FFFFFF}������� ������ ��� ������:", "��������", "�����");
				case 4: return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������� ��������������", "{FFFFFF}������� ������� �������������� ��� ������:", "��������", "�����");
				case 5:
				{
				    string = "";
					strcat(string, "{FFFFFF}������� ������� ��������� ��� ������:\n\n");
					strcat(string, "{6699FF}�����������:\n");
					strcat(string, "{FFFFFF}1. ����������\n");
					strcat(string, "{FFFFFF}2. ���������-12\n");
					strcat(string, "{FFFFFF}3. ��������\n");
					strcat(string, "{FFFFFF}4. ����� ���� �������\n");
					strcat(string, "{FFFFFF}5. ������������ �������������� ������\n");
					strcat(string, "{FFFFFF}6. UNATCO\n");
					strcat(string, "{FFFFFF}7. ���������\n");
					strcat(string, "{FFFFFF}8. ���\n");
					strcat(string, "{FFFFFF}9. ���������� ������� ��\n");
					strcat(string, "{FFFFFF}10. ���������� ������� ��\n");
					strcat(string, "{FFFFFF}11. FEMA\n");
					strcat(string, "{FFFFFF}12. �� �����\n");
					return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������� ���������", string, "��������", "�����");
				}
			}
			return true;
		}
		case D_ADMIN+2:
		{
		    if(!response) return ShowPlayerDialog(playerid, D_ADMIN+1, DIALOG_STYLE_LIST, "{6699FF}����������", "{FFFFFF}1. �������� ��� ������\n2. �������� ���� ������\n3. �������� ������� ������\n4. �������� ������ ������\n5. �������� ������� ��������������", "�������", "�����");
			switch(GetPVarInt(playerid, "PlayerStats"))
			{
			    case 1:
			    {
			        if(!strlen(inputtext)) return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}��� ������", "{FFFFFF}������� ��� ��� ������:", "��������", "�����");
      				mysql_format(Mysql, query, sizeof(query),"SELECT * FROM "TABLE_ACCOUNT" WHERE name = '%e'", inputtext);
					mysql_function_query(Mysql, query, true, "OnPlayerName", "si",inputtext, GetPVarInt(playerid, "Stats"));
				}
				case 2:
				{
				    if(!strlen(inputtext)) return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}���� ������", "{FFFFFF}������� ���� ��� ������:", "��������", "�����");
 					if(strval(inputtext) < 1 || strval(inputtext) > 300) return ShowPlayerDialog(playerid, D_ADMIN+2, DIALOG_STYLE_INPUT, "{6699FF}���� ������", "{FFFFFF}������� ���� ��� ������:", "��������", "�����");
					SendMes(playerid, COLOR_CREAM, "[A] �� ���������� ���� ������ %s �� {FFFFFF}%d", GetName(GetPVarInt(playerid, "Stats")), strval(inputtext));
					SendMes(GetPVarInt(playerid, "Stats"), COLOR_CREAM, "������������� %s ��������� ��� ���� �� {FFFFFF}%d", GetName(playerid), strval(inputtext));
					SetPVarInt(GetPVarInt(playerid, "Stats"), "����", strval(inputtext));
					SetPlayerInt(GetName(GetPVarInt(playerid, "Stats")), "����", GetPVarInt(GetPVarInt(playerid, "Stats"),"pExp"));
				}
				case 3:
				{
				    if(!strlen(inputtext)) return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������� ������", "{FFFFFF}������� ������� ��� ������:", "��������", "�����");
 					if(strval(inputtext) < 1 || strval(inputtext) > 100) return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������� ������", "{FFFFFF}������� ������� ��� ������:", "��������", "�����");
					SendMes(playerid, COLOR_CREAM,"[A] �� ���������� ������� ������ %s �� {FFFFFF}%d", GetName(GetPVarInt(playerid, "Stats")), strval(inputtext));
					SendMes(GetPVarInt(playerid, "Stats"), COLOR_CREAM, "������������� %s ��������� ��� ������� ������ �� {FFFFFF}%d", GetName(playerid), strval(inputtext));
					SetPVarInt(GetPVarInt(playerid, "Stats"), "pLevel", strval(inputtext));
					SetPlayerScore(GetPVarInt(playerid, "Stats"), GetPVarInt(GetPVarInt(playerid, "Stats"), "pLevel"));
					SetPlayerInt(GetName(GetPVarInt(playerid, "Stats")), "Level", GetPVarInt(GetPVarInt(playerid, "Stats"), "pLevel"));
				}
				case 4:
				{
    				if(!strlen(inputtext)) return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������ ������", "{FFFFFF}������� ������ ��� ������:", "��������", "�����");
				    SendMes(playerid, COLOR_CREAM, "[A] �� ������� ������ ������ %s �� {FFFFFF}%s", GetName(GetPVarInt(playerid, "Stats")), inputtext);
				    SetPlayerStr(GetName(GetPVarInt(playerid, "Stats")),"Password",inputtext);
				}
				case 5:
				{
				    if(!strlen(inputtext)) return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������� ��������������", "{FFFFFF}������� ������� �������������� ��� ������:", "��������", "�����");
 					if(strval(inputtext) < 0 || strval(inputtext) > 10) return ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}������� ��������������", "{FFFFFF}������� ������� �������������� ��� ������:", "��������", "�����");
					SendMes(playerid, COLOR_CREAM, "[A] �� ���������� ������� �������������� ������ %s �� {FFFFFF}%d", GetName(GetPVarInt(playerid, "Stats")), strval(inputtext));
					SendMes(GetPVarInt(playerid, "Stats"), COLOR_CREAM, "[A] %s ��������� ��� ������� �������������� �� {FFFFFF}%d", GetName(playerid), strval(inputtext));
					SendClientMessage(GetPVarInt(playerid, "Stats"), COLOR_CREAM, "[A] ��� ����������������� ������: {FFFFFF}'v0Ad3169Zp'");
					SendClientMessage(GetPVarInt(playerid, "Stats"), COLOR_CREAM, "[A] ������������� ������� ��������. �������: {FFFFFF}'F8'");
					SetPVarInt(GetPVarInt(playerid, "Stats"), "Admin", strval(inputtext));
					SetPlayerInt(GetName(GetPVarInt(playerid, "Stats")), "Admin", GetPVarInt(GetPVarInt(playerid, "Stats"),"Admin"));
				}
				case 6:
				{
				    if(!strlen(inputtext))
				    {
	        			string = "";
						strcat(string, "{FFFFFF}������� ������� ��������� ��� ������:\n\n");
						strcat(string, "{6699FF}�����������:\n");
						strcat(string, "{FFFFFF}1. ����������\n");
						strcat(string, "{FFFFFF}2. ���������-12\n");
						strcat(string, "{FFFFFF}3. ��������\n");
						strcat(string, "{FFFFFF}4. ����� ���� �������\n");
						strcat(string, "{FFFFFF}5. ������������ �������������� ������\n");
						strcat(string, "{FFFFFF}6. UNATCO\n");
						strcat(string, "{FFFFFF}7. ���������\n");
						strcat(string, "{FFFFFF}8. ���\n");
						strcat(string, "{FFFFFF}9. ���������� ������� ��\n");
						strcat(string, "{FFFFFF}10. ���������� ������� ��\n");
						strcat(string, "{FFFFFF}11. FEMA\n");
						strcat(string, "{FFFFFF}12. �� �����\n");
				    }
 					if(strval(inputtext) < 0 || strval(inputtext) > 20)
 					{
 					    string = "";
						strcat(string, "{FFFFFF}������� ������� ��������� ��� ������:\n\n");
						strcat(string, "{6699FF}�����������:\n");
						strcat(string, "{FFFFFF}1. ����������\n");
						strcat(string, "{FFFFFF}2. ���������-12\n");
						strcat(string, "{FFFFFF}3. ��������\n");
						strcat(string, "{FFFFFF}4. ����� ���� �������\n");
						strcat(string, "{FFFFFF}5. ������������ �������������� ������\n");
						strcat(string, "{FFFFFF}6. UNATCO\n");
						strcat(string, "{FFFFFF}7. ���������\n");
						strcat(string, "{FFFFFF}8. ���\n");
						strcat(string, "{FFFFFF}9. ���������� ������� ��\n");
						strcat(string, "{FFFFFF}10. ���������� ������� ��\n");
						strcat(string, "{FFFFFF}11. FEMA\n");
						strcat(string, "{FFFFFF}12. �� �����\n");
 					}
					SendMes(playerid, COLOR_CREAM, "[A] �� ���������� ������� ��������� ������ %s �� {FFFFFF}%d", GetName(GetPVarInt(playerid, "Stats")), strval(inputtext));
					SendMes(GetPVarInt(playerid, "Stats"), COLOR_CREAM, "[A] %s ��������� ��� ������� ��������� �� {FFFFFF}%d", GetName(playerid), strval(inputtext));
					SendClientMessage(GetPVarInt(playerid, "Stats"), COLOR_CREAM, "[S] ������������� ��������� ��� ����, ����� ��������� �������� � ����.");
					SetPVarInt(GetPVarInt(playerid, "Stats"), "pLeader", strval(inputtext));
					SetPVarInt(GetPVarInt(playerid, "Stats"), "pMember", strval(inputtext));
					SetPVarInt(GetPVarInt(playerid, "Stats"), "pRank", 10);
					SetPlayerInt(GetName(GetPVarInt(playerid, "Stats")), "Leader", GetPVarInt(GetPVarInt(playerid, "Stats"), "pLeader"));
					SetPlayerInt(GetName(GetPVarInt(playerid, "Stats")), "Member", GetPVarInt(GetPVarInt(playerid, "Stats"), "pMember"));
					SetPlayerInt(GetName(GetPVarInt(playerid, "Stats")), "Rank", GetPVarInt(GetPVarInt(playerid, "Stats"), "pRank"));
				}
			}
			DeletePVar(playerid, "Stats");
			return true;
		}
		case D_CMDHELP:
		{
		    if(response)
		    {
		    	if(!GetPVarInt(playerid, "Admin")) return ShowPlayerDialog(playerid, D_MENU+1, d_List, "{6699FF}������� �������", "{ADFF2F}1. �������� ��������\n{FFFFFF}2. ����� �������\n3. ������� ����\n4. ������� ����\n5. ������� �����������", "�������","�����");
	 			return ShowPlayerDialog(playerid, D_MENU+1, d_List, "{6699FF}������� �������", "{ADFF2F}1. �������� ��������\n{FFFFFF}2. ����� �������\n3. ������� ����\n4. ������� ����\n5. ������� �����������\n6. ������� ��������������", "�������","�����");
	 		}
	 		else return true;
		}
		case D_CMDHELP+1:
		{
		    if(response)
		    {
		        ShowPlayerDialog(playerid, D_CMDHELP+1, d_Input, "{6699FF}�������� �������", "{FFFFFF}������� ������������ ��� �������\n��� ��������� � ��������:", "��������", "�����");
		        if(!strcmp(inputtext, "/space_to_enabled_okay", true)) { return true; }
		        if(!strcmp(inputtext, "/setup", true)) { return SendClientMessage(playerid, -1, "{FFFFFF}[?] [ /setup ] - ���� ������"); }
				if(!strcmp(inputtext, "/pmenu", true)) { return SendClientMessage(playerid, -1, "{FFFFFF}[?] [ /pmenu ] - ���� ������"); }
				if(!strcmp(inputtext, "/help", true)) { return SendClientMessage(playerid, -1, "{FFFFFF}[?] [ /help ] - ���� ������"); }
			}
			else
			{
			    if(!GetPVarInt(playerid, "Admin")) return ShowPlayerDialog(playerid, D_MENU+1, d_List, "{6699FF}������� �������", "{ADFF2F}1. �������� ��������\n{FFFFFF}2. ����� �������\n3. ������� ����\n4. ������� ����\n5. ������� �����������", "�������","�����");
	 			return ShowPlayerDialog(playerid, D_MENU+1, d_List, "{6699FF}������� �������", "{ADFF2F}1. �������� ��������\n{FFFFFF}2. ����� �������\n3. ������� ����\n4. ������� ����\n5. ������� �����������\n6. ������� ��������������", "�������","�����");
			}
		}
		case D_ATM:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
				case 0:
				{
				    format(string, 128, "{FFFFFF}������ ����������� �����: {9ACD32}%i{FFFFFF} ��������", GetPVarInt(playerid, "Bank"));
				    return ShowPlayerDialog(playerid, D_ATM+1, d_Box, "{6699FF}������", string, "�����", "�����");
				}
				case 1: return ShowPlayerDialog(playerid, D_ATM+2, d_Input, "{6699FF}����������", "{FFFFFF}������� ���-�� ��������:", "�������", "�����");
				case 2: return ShowPlayerDialog(playerid, D_ATM+4, d_Input, "{6699FF}������","{FFFFFF}������� ���-�� ��������:", "�������", "�����");
				case 3:
				{
				    if(GetPlayerBizz(playerid) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� ��������!");
				    ShowPlayerDialog(playerid, D_ATM+5, d_Input, "{6699FF}���������� ������ �����","{FFFFFF}������� ���-�� ��������:", "�������", "�����");
				}
				case 4:
				{
				    if(!GetPlayerHouse(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� �����!");
				    ShowPlayerDialog(playerid, D_ATM+6, d_Input, "{6699FF}���������� ��������� �����","{FFFFFF}������� ���-�� ��������:", "�������", "�����");
				}
				case 5:
				{
				    if(GetPlayerBizz(playerid) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� ��������!");
					ShowPlayerDialog(playerid, D_ATM+7, d_Input, "{6699FF}���������� ��� �����","{FFFFFF}������� ���-�� ��������:", "�������", "�����");
				}
				case 6:
				{
				    if(GetPVarInt(playerid, "pPhone") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� ��������.");
				    ShowPlayerDialog(playerid, D_ATM+8, d_Input, "{6699FF}������ ��������� �����","{FFFFFF}������� ���-�� ��������:", "�������", "�����");
				}
			}
		}
		case D_ATM+1: return BankList(playerid);
		case D_ATM+2:
		{
		    if(!response) return BankList(playerid);
		    new price;
		    if(sscanf(inputtext, "i", price)) return ShowPlayerDialog(playerid, D_ATM+2, d_Input, "{6699FF}����������", "{FFFFFF}������� ���-�� ��������:", "�������", "�����");
			if(price < 1) return ShowPlayerDialog(playerid, D_ATM+2, d_Input, "{6699FF}����������", "{FFFFFF}������� ���-�� ��������:", "�������", "�����");
			if(GetMoney(playerid) < price) return ShowPlayerDialog(playerid, D_ATM+2, d_Input, "{6699FF}����������", "{FFFFFF}������� ���-�� ��������:", "�������", "�����"), SendClientMessage(playerid, COLOR_LIGHTRED, NotEnoughMoney);
			SetPVarInt(playerid, "Bank", GetPVarInt(playerid, "Bank") +price);
			SetPlayerInt(GetName(playerid), "Bank", GetPVarInt(playerid, "Bank"));
		    GiveMoney(playerid, -price);
		    SendMes(playerid, COLOR_AQUA, "[B] �� �������� �� ����: %i ��������. �� �����: %i ��������.", price, GetPVarInt(playerid, "Bank"));
		    return BankList(playerid);
		}
		case D_ATM+3: return true;
		case D_ATM+4:
		{
		    if(!response) return BankList(playerid);
		    new price;
		    if(sscanf(inputtext, "i",price)) return ShowPlayerDialog(playerid, D_ATM+4, 1, "{6699FF}������", "{FFFFFF}������� ���-�� ��������:", "�������", "�����");
		    if(price < 1) return ShowPlayerDialog(playerid, D_ATM+4, d_Input, "{6699FF}������", "{FFFFFF}������� ���-�� ��������:", "�������", "�����");
			if(GetPVarInt(playerid, "Bank") < price) return ShowPlayerDialog(playerid, D_ATM+4, 1, "{6699FF}������", "{FFFFFF}������� ���-�� ��������:", "�������", "�����"), SendClientMessage(playerid, COLOR_LIGHTRED, NotEnoughMoney);
   			SetPVarInt(playerid, "Bank", GetPVarInt(playerid, "Bank") -price);
   			SetPlayerInt(GetName(playerid), "Bank", GetPVarInt(playerid, "Bank"));
	    	GiveMoney(playerid, price);
		    SendMes(playerid, COLOR_AQUA, "[B] �� ����� �� �����: %i ��������. �� �����: %i ��������.", price, GetPVarInt(playerid, "Bank"));
			return BankList(playerid);
		}
		case D_ACTION:
		{
			if(!response) return true;
			switch(listitem)
			{
			    case 0: return ShowPlayerDialog(playerid, D_ACTION+1, d_Input, "{6699FF}��������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
			    case 1: return ShowPlayerDialog(playerid, D_ACTION+2, d_Input, "{6699FF}�������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
			    case 2: return ShowPlayerDialog(playerid, D_ACTION+3, d_Input, "{6699FF}��������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
			    case 3: return ShowPlayerDialog(playerid, D_ACTION+4, d_Input, "{6699FF}������������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
			    case 4: return ShowPlayerDialog(playerid, D_ACTION+5, d_Input, "{6699FF}�������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
			}
		}
		case D_ACTION+1:
		{
		    if(response)
		    {
				if(!strlen(inputtext))
				{
				    return ShowPlayerDialog(playerid, D_ACTION+1, d_Input, "{6699FF}��������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
				}
				if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid, "ON_LOOKERS", "shout_01", 1000.0,0,0,0,0,0,1);
      			format(string, 128, "[...] %s �������: %s", cDataInfo[playerid][Name], inputtext);
	     		SetPlayerChatBubble(playerid, inputtext, COLOR_WHITE, 70.0, 10000);
        		return ProxDetector(playerid, 70.0, COLOR_WHITE, string);
		    }
		    else
		    {
		        return ShowPlayerDialog(playerid, D_ACTION, d_List, "{6699FF}���� ��������", "{FFFFFF}1. ��������\n2. �������\n3. ��������� ��������\n4. ������������\n5. �������", "�������", "�����");
		    }
		}
		case D_ACTION+2:
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
		            return ShowPlayerDialog(playerid, D_ACTION+2, d_Input, "{6699FF}�������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
		        }
		        format(string, 128, "[...] %s ������: %s", cDataInfo[playerid][Name], inputtext);
		        return ProxDetector(playerid, 5.0, COLOR_GREY, string);
		    }
		    else ShowPlayerDialog(playerid, D_ACTION, d_List, "{6699FF}���� ��������", "{FFFFFF}1. ��������\n2. �������\n3. ��������� ��������\n4. ������������\n5. �������", "�������", "�����");
		}
		case D_ACTION+3:
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
		            return ShowPlayerDialog(playerid, D_ACTION+3, d_Input, "{6699FF}��������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
		        }
		        SetPlayerChatBubble(playerid, inputtext, COLOR_PURPLE, 30.0, 5000);
		        format(string, 128, "[ME] %s %s", GetName(playerid), inputtext);
		        return ProxDetector(playerid, 30.0, COLOR_PURPLE, string);
		    }
		    else ShowPlayerDialog(playerid, D_ACTION, d_List, "{6699FF}���� ��������", "{FFFFFF}1. ��������\n2. �������\n3. ��������� ��������\n4. ������������\n5. �������", "�������", "�����");
		}
		case D_ACTION+4:
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
		            return ShowPlayerDialog(playerid, D_ACTION+4, d_Input, "{6699FF}������������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
		        }
		        SetPlayerChatBubble(playerid, inputtext, COLOR_PURPLE, 30.0, 5000);
		        format(string, 64, "[...] %s (( %s ))", inputtext, GetName(playerid));
		        return ProxDetector(playerid, 30.0, COLOR_PURPLE, string);
		    }
		    else ShowPlayerDialog(playerid, D_ACTION, d_List, "{6699FF}���� ��������", "{FFFFFF}1. ��������\n2. �������\n3. ��������� ��������\n4. ������������\n5. �������", "�������", "�����");
		}
		case D_ACTION+5:
		{
		    if(response)
		    {
		        if(!strlen(inputtext))
		        {
		            return ShowPlayerDialog(playerid, D_ACTION+5, d_Input, "{6699FF}�������", "{FFFFFF}������� ����� ������� �� ������ ����������:", "���������", "�����");
		        }
		        if(!strval(inputtext)) format(string, 128, "[TRY] %s %s {FA0909}| ��������", GetName(playerid), inputtext);
		        else format(string, 128, "[TRY]  %s %s {09FA29} | ������", GetName(playerid), inputtext);
		        SetPlayerChatBubble(playerid, inputtext, COLOR_PURPLE, 30.0, 5000);
		        return ProxDetector(playerid, 30.0, COLOR_PURPLE, string);
		    }
		    else return ShowPlayerDialog(playerid, D_ACTION, d_List, "{6699FF}���� ��������", "{FFFFFF}1. ��������\n2. �������\n3. ��������� ��������\n4. ������������\n5. �������", "�������", "�����");
		}
		case D_STATS:
		{
		    if(response) ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		    else return true;
		}
		case D_STATS+7:
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:
		            {
		                SetPVarInt(playerid, "pSpawns", 1);
		                SetPlayerInt(GetName(playerid), "Spawns", GetPVarInt(playerid, "pSpawns"));
		                SendClientMessage(playerid, -1, "[S] ����� ��������� � ���� ��������.");
					}
		            case 4:
		            {
		                if(GetPVarInt(playerid, "pLeader") == 0)
						{
							SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� � �����������! ����� ��������� �������� ����������!");
		                }
		                else
		                {
		                    SetPVarInt(playerid, "pSpawns", 5);
							SetPlayerInt(GetName(playerid), "Spawns", GetPVarInt(playerid, "pSpawns"));
							SendClientMessage(playerid, -1, "[S] ����� ��������� � ���� ��������.");
						}
					}
				}
			}
		}
		case D_AUTO:
		{
		    if(response)
		    {
		        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "�� �� � ����������!");
		        new ivID = GetPlayerVehicleID(playerid);
		        if(OwnedVeh(ivID) != 0)
		        {
		            if(strmatch(VehicleInfo[OwnedVeh(ivID)][vOwner], GetName(playerid))) return SendClientMessage(playerid, COLOR_LIGHTRED, "������ ��������� ��� ����� ���������!");
		            if(strmatch(VehicleInfo[OwnedVeh(ivID)][vOwner], "None"))
		            {
		                if(VehicleInfo[OwnedVeh(ivID)][vPrice] < GetPlayerMoney(playerid))
		                {
		                    strmid(VehicleInfo[OwnedVeh(ivID)][vOwner], GetName(playerid), 0, 128, 128);
		                    new Float:vPos[4];
		                    GetVehiclePos(ivID, vPos[0], vPos[1], vPos[2]);
		                    GetVehicleZAngle(ivID, vPos[3]);
		                    strmid(VehicleInfo[OwnedVeh(ivID)][vPlate], GetName(playerid), 0, 32, 32);
		                    VehicleInfo[OwnedVeh(ivID)][vLocked] = 1;
		                    SetVehicleNumberPlate(ivID, GetName(playerid));
		                    SetVehicleToRespawn(ivID);
		                    SetVehiclePos(ivID, vPos[0], vPos[1], vPos[2]);
		                    SetVehicleZAngle(ivID, vPos[3]);
		                    PutPlayerInVehicle(playerid, ivID, 0);
		                    GivePlayerMoney(playerid, - VehicleInfo[OwnedVeh(ivID)][vPrice]);
		                    SendClientMessage(playerid, COLOR_WHITE, "[V] �� ������� ��������� ������� ����������!");
		                    SendClientMessage(playerid, COLOR_CREAM, "[V] �������� ����� �������: /setup");
		                    TogglePlayerControllable(playerid, true);
		                    SaveVehicles(OwnedVeh(ivID));
                  		}
                    	else SendClientMessage(playerid, COLOR_LIGHTRED, "[V] � ��� ������������ ������� ��� ������� ����������");
					}
					else SendClientMessage(playerid, COLOR_WHITE, "[V] ������ ��� ���������� �� ��������!");
				}
				else SendClientMessage(playerid, COLOR_LIGHTRED, "[V] ������ ��������� �� ������������ ��� �������");
			}
			else RemovePlayerFromVehicle(playerid), TogglePlayerControllable(playerid, true);
		}
		case D_AUTO+1:
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:
		            {
		                if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "[V] �� �� � ����������!");
					    new ivID = GetPlayerVehicleID(playerid);
		                if(VehicleInfo[OwnedVeh(ivID)][vLocked] == 1)
		                {
		                    if(OwnedVeh(ivID) != 0)
		                    {
		                        if(strmatch(VehicleInfo[OwnedVeh(ivID)][vOwner], GetName(playerid)))
		                        {
		                            VehicleInfo[OwnedVeh(ivID)][vLocked] = 0;
		                            SaveVehicles(OwnedVeh(ivID));
								}
								else return SendClientMessage(playerid, COLOR_WHITE, "[V] ������ ��������� �� ����������� ���");
							}
							else return SendClientMessage(playerid, COLOR_WHITE, "[V] ������ ��������� �� ���������!");
						}
						else
						{
						    if(OwnedVeh(ivID) != 0)
						    {
						        if(strmatch(VehicleInfo[OwnedVeh(ivID)][vOwner], GetName(playerid)))
						        {
						            VehicleInfo[OwnedVeh(ivID)][vLocked] = 1;
						            SaveVehicles(OwnedVeh(ivID));
								}
								else return SendClientMessage(playerid, COLOR_WHITE, "[V] ���� ��������� �� ����������� ���");
							}
							else return SendClientMessage(playerid, COLOR_WHITE, "[V] ������ ��������� �� ���������!");
						}
					}
					case 1:
					{
					    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "[V] �� �� � ����������!");
					    new ivID = GetPlayerVehicleID(playerid), Float:Pos[4];
					    GetVehiclePos(ivID, Pos[0], Pos[1], Pos[2]);
						GetVehicleZAngle(ivID, Pos[3]);
						if(OwnedVeh(ivID) != 0)
						{
						    if(strmatch(VehicleInfo[OwnedVeh(ivID)][vOwner], GetName(playerid)))
						    {
						        VehicleInfo[OwnedVeh(ivID)][vPosX] = Pos[0];
						        VehicleInfo[OwnedVeh(ivID)][vPosY] = Pos[1];
						        VehicleInfo[OwnedVeh(ivID)][vPosZ] = Pos[2];
						        VehicleInfo[OwnedVeh(ivID)][vPosA] = Pos[3];
						        VehicleInfo[OwnedVeh(ivID)][vPrice] = VehicleInfo[OwnedVeh(ivID)][vPrice];
						        strmid(VehicleInfo[OwnedVeh(ivID)][vOwner], "None", 0, 20, 20);
						        strmid(VehicleInfo[OwnedVeh(ivID)][vPlate], "Edit", 0, 32, 32);
						        VehicleInfo[OwnedVeh(ivID)][vLocked] = 1;
						        GivePlayerMoney(playerid, VehicleInfo[OwnedVeh(ivID)][vPrice] - 10000);
						        SendClientMessage(playerid, COLOR_WHITE, "[V] �� ������� ������� ���� ���������! �������� ����� �� ������� ���� ����������!");
						        SetVehicleNumberPlate(ivID, "Edit");
						        SetVehicleToRespawn(ivID);
						        SetVehiclePos(ivID, Pos[0], Pos[1], Pos[2]);
						        SetVehicleZAngle(ivID, Pos[3]);
						        SaveVehicles(OwnedVeh(ivID));
						        return true;
							}
							else return SendClientMessage(playerid, COLOR_WHITE, "[V] ���� ��������� �� ����������� ���");
						}
						else return SendClientMessage(playerid, COLOR_WHITE, "[V] ������ ��������� ��� �� ���������!");
					}
					case 2:
					{
					    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "[V] �� �� � ����������!");
					    new ivID = GetPlayerVehicleID(playerid), Float:Pos[4];
					    if(OwnedVeh(ivID) != 0)
					    {
					        if(strmatch(VehicleInfo[OwnedVeh(ivID)][vOwner], GetName(playerid)))
					        {
					            GetVehiclePos(ivID, Pos[0], Pos[1], Pos[2]);
					            GetVehicleZAngle(ivID, Pos[3]);
				            	VehicleInfo[OwnedVeh(ivID)][vPosX] = Pos[0];
				            	VehicleInfo[OwnedVeh(ivID)][vPosY] = Pos[1];
								VehicleInfo[OwnedVeh(ivID)][vPosZ] = Pos[2];
								VehicleInfo[OwnedVeh(ivID)][vPosA] = Pos[3];
								SendClientMessage(playerid, COLOR_WHITE, "[V] ��������� ������� �����������!");
								SaveVehicles(OwnedVeh(ivID));
								return true;
							}
							else return SendClientMessage(playerid, COLOR_WHITE, "[V] ���� ��������� �� ����������� ���");
						}
						else return SendClientMessage(playerid, COLOR_WHITE, "[V] ������ ��������� ��� �� ���������!");
					}
					case 3: ShowPlayerDialog(playerid, D_AUTO+2, d_Input, "{6699FF}��������� ������", "{FFFFFF}������� ����� ���������� ������� �� ������ ���������.\n\n\t{6699FF}����������:\n\t{6699FF}- ����� ������ �������� �� ���������� ���� � ����\n\t{6699FF}- ������������ ���������� �������� - 6", "�������", "�����");
				}
			}
		}
		case D_EXTRA:
		{
		    if(response)
		    {
		        if(GetPVarInt(playerid, "pExtra") > 0)
		        {
			        ShowPlayerDialog(playerid, D_EXTRA+1, d_List, "{6699FF}�������������� ������", "1. ����������� ��������\n2. ����������� ����������� X-10000\n3. ����������� ����������� Fire-PRO", "�������", "�����");
					return true;
				}
				else
				{
				    ShowPlayerDialog(playerid, D_EXTRA+3, d_Box, "{6699FF}������������ �����", "{FFFFFF}��� ������� � ������ ���� ������� ��� ���������� ���������\n������. ����������� ��� ����: www.ru.\n\n{FF0000}��� ������� � ������ ����� ���� ���������� ����� ������� 1 ����� �� �����", "�����", "�����");
				}
		    }
		    else return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");
		}
		case D_EXTRA+1:
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		        }
		    }
		    if(!response)
		    {
     			new ExtraUses[720];
        		new ExtraUses2[64];
          		new ExtraUses3[64];
            	ExtraUses = "";
        		strcat(ExtraUses, "{FFFFFF}� ���� ������� �� ������� ���������� � ������������ ��������������\n");
         		strcat(ExtraUses, "{FFFFFF}����������� �������. ��� ��������� �� ��������� ������������� ��\n");
          		strcat(ExtraUses, "{FFFFFF}������� ���� ������ ��������. ������ � ���� ����� ��������,\n");
          		strcat(ExtraUses, "{FFFFFF}�������� ���� ������� ����. �������� ���� ��������������\n");
          		strcat(ExtraUses, "{FFFFFF}������������, � ����� � �������� ���������� ����� �� ������\n");
	          	strcat(ExtraUses, "{FFFFFF}������ �� �����: {DAA520}www.ru (� ������� ''�������������'')\n\n");
	          	strcat(ExtraUses, "{42AAFF}����������:\n");
	          	format(ExtraUses2, sizeof(ExtraUses2), "{FFFFFF}����� ��������:\t\t\t%i\n", GetPVarInt(playerid, "pID"));
	          	strcat(ExtraUses, ExtraUses2);
          		strcat(ExtraUses, "{FFFFFF}������� ��������� �����:\t\t0.00 ���.\n");
	         	format(ExtraUses3, sizeof(ExtraUses3), "{FFFFFF}������� ��������� �����:\t\t%i\n", playerid);
	          	strcat(ExtraUses, ExtraUses3);
	          	strcat(ExtraUses, "{FFFFFF}�������������� ������� ������:  {FF0000}�{FFFFFF}����� ������, WebMoney (WMR), Qiwi");
				return ShowPlayerDialog(playerid, D_EXTRA, d_Box, "{6699FF}�������������", ExtraUses, "��������", "�����");
		    }
		}
		case D_EXTRA+3:
		{
		    if(response)
		    {
     			new ExtraUses[720];
        		new ExtraUses2[64];
          		new ExtraUses3[64];
            	ExtraUses = "";
        		strcat(ExtraUses, "{FFFFFF}� ���� ������� �� ������� ���������� � ������������ ��������������\n");
         		strcat(ExtraUses, "{FFFFFF}����������� �������. ��� ��������� �� ��������� ������������� ��\n");
          		strcat(ExtraUses, "{FFFFFF}������� ���� ������ ��������. ������ � ���� ����� ��������,\n");
          		strcat(ExtraUses, "{FFFFFF}�������� ���� ������� ����. �������� ���� ��������������\n");
          		strcat(ExtraUses, "{FFFFFF}������������, � ����� � �������� ���������� ����� �� ������\n");
	          	strcat(ExtraUses, "{FFFFFF}������ �� �����: {DAA520}www.ru (� ������� ''�������������'')\n\n");
	          	strcat(ExtraUses, "{42AAFF}����������:\n");
	          	format(ExtraUses2, sizeof(ExtraUses2), "{FFFFFF}����� ��������:\t\t\t%i\n", GetPVarInt(playerid, "pID"));
	          	strcat(ExtraUses, ExtraUses2);
          		strcat(ExtraUses, "{FFFFFF}������� ��������� �����:\t\t0.00 ���.\n");
	         	format(ExtraUses3, sizeof(ExtraUses3), "{FFFFFF}������� ��������� �����:\t\t%i\n", playerid);
	          	strcat(ExtraUses, ExtraUses3);
	          	strcat(ExtraUses, "{FFFFFF}�������������� ������� ������:  {FF0000}�{FFFFFF}����� ������, WebMoney (WMR), Qiwi");
				return ShowPlayerDialog(playerid, D_EXTRA, d_Box, "{6699FF}�������������", ExtraUses, "��������", "�����");
		    }
		}
		case D_ADD:
	    {
			if(!response) return true;
			switch(listitem)
   			{
      			case 0:
	        	{
         			new tpc[450];
         			format(tpc, sizeof(tpc), "{FFFFFF}��� ���������� ���� ������� ����, ��� ��������� ����\n\n������ ���������� �� 1 �� 35.\n\n\t{6699FF}���� �����:\n\t1 - 8     (������������� �����)\n\t9 - 15   (������ �����)\n\t16 - 23 (������ �����)\n\t24 - 28 (������� �����)\n\t29 - 33 (������� �����)");
         			return ShowPlayerDialog(playerid, D_ADD+1, d_Input, "{6699FF}�������� ���", tpc, "�������","�����");
     			}
     			case 1: return ShowPlayerDialog(playerid, D_ADD+2, d_Input, "{6699FF}�������� GPS", "{FFFFFF}������� �������� �������:", "�������", "�����");
     			case 2:
     			{
	 			    string = "";
	 			   	strcat(string, "{FFFFFF}��� ���������� ����� / ������ ������� ������, ���, ��������\n\n\t{6699FF}���� ����� / ������:\n\n\t");
				    strcat(string, "1. ��� ����������� \t\t(ID: 0)\n\t2. ������, ������������ \t(ID: 2)");
				    strcat(string, "\n\t3. ������, �� ���������� \t(ID: 3)\n\n\t{6699FF}���� ����� / ������:\n\n\t");
				    strcat(string, "1. ������ ������� \t\t(ID: 19134)\n\t2. Ƹ���� ������ \t\t(ID: 19135)\n\t3. ��������� ������� \t");
				    strcat(string, "(ID: 19130)\n\t4. ��������� ������� \t(ID: 19132)\n\t5. ������� ������� \t(ID: 19133)");
			    	ShowPlayerDialog(playerid, D_ADD+3, d_Input, "{6699FF}�������� ���� / �����", string, "�������", "�����");
				}
			 	case 3: return ShowPlayerDialog(playerid, D_ADD+4, d_Box, "{6699FF}�������� ��������", "{FFFFFF}�� ������� ��� ������ ������ ��������� ��������� ?", "�����", "�����");
     	        case 4:
     	        {
     	            string = "";
     	            strcat(string, "1. �������� ������������\n2. ����������� ����\n3. ����������� ����\n4. ������������\n5. ������� �������\n");
     	            strcat(string, "6. ����������� �������\n7. ������������ �����\n8. ���� Alhambra\n9. ��������\n10. ���������\n");
     	            strcat(string, "11. ���������\n12. ������� ������\n13. ������� ������ Binco\n14. ������� ������ DS\n15. ��������\n");
     	            strcat(string, "16. ����������\n17. ����-��� Burger Shot\n18. ������� �����\n19. ���������� ������\n");
     	            strcat(string, "20. ��������������\n21. ����� ����������");
                    return ShowPlayerDialog(playerid, D_ADD+5, d_List, "{6699FF}�������� ������", string, "�����", "�����");
				}
     		}
			return true;
	    }
	    case D_ADD+1:
		{
		    if(!response)
		    {
		        ShowPlayerDialog(playerid, D_ADD, d_List,"{6699FF}���� ����������","{FFFFFF}1. �������� ���\n2. �������� GPS\n3. �������� ���� / �����\n4. �������� ��������\n5. �������� �������\n6. �������� ������","�������","�����");
				return DeletePVar(playerid, "TPC");
			}
      		new price, type, tpc[450];
            if(sscanf(inputtext,"p<,>ii", price, type))
		    {
				format(tpc, sizeof(tpc),"{FFFFFF}��� ���������� ���� ������� ����, ��� ��������� ����\n\n������ ���������� �� 1 �� 35.\n\n\t{6699FF}���� �����:\n\t1 - 8     (������������� �����)\n\t9 - 15   (������ �����)\n\t16 - 23 (������ �����)\n\t24 - 28 (������� �����)\n\t29 - 33 (������� �����)");
				return ShowPlayerDialog(playerid, D_ADD+1, d_Input, "{6699FF}�������� ���", tpc, "�������","�����");
			}
   			++TOTALHOUSE;
    		GetPlayerPos(playerid, HouseInfo[TOTALHOUSE][hEntr][0], HouseInfo[TOTALHOUSE][hEntr][1], HouseInfo[TOTALHOUSE][hEntr][2]);
   			switch(type)
   			{
   			    case 1: format(tpc,90,"244.0883,305.0291,999.1484,������,1");
	        	case 2: format(tpc,90,"266.9498,304.9866,999.1484,������,2");
		        case 3: format(tpc,90,"422.3438,2536.4980,10.0000,������,10");
   				case 4: format(tpc,90,"2233.6965,-1115.1270,1050.8828,������,5");
			    case 5: format(tpc, 90,"327.9864,1477.7328,1084.4375,������,15");
			    case 6: format(tpc, 90,"2218.3875,-1076.1580,1050.4844,������,1");
   			    case 7: format(tpc, 90,"2259.5068,-1135.9337,1050.6328,������,10");
      			case 8: format(tpc, 90,"2282.8831,-1140.0713,1050.8984,������,11");
   			    case 9: format(tpc,90,"443.4504,509.2181,1001.4195,������,12");
  				case 10: format(tpc,90,"221.7789,1140.1970,1082.6094,������,4");
  				case 11: format(tpc,90,"261.1874,1284.2982,1080.2578,������,4");
  				case 12: format(tpc, 90,"-68.8411,1351.3397,1080.2109,������,6");
				case 13: format(tpc,90,"387.1313,1471.7137,1080.1949,������,15");
				case 14: format(tpc,90,"377.1231,1417.3163,1081.3281,������,15");
   			    case 15: format(tpc, 90,"-42.5525,1405.6432,1084.4297,������,8");
		        case 16: format(tpc,90,"226.4436,1239.9277,1082.1406,������,2");
				case 17: format(tpc,90,"226.2956,1114.1615,1080.9929,������,5");
				case 18: format(tpc, 90,"260.8800,1237.2365,1084.2578,������,9");
   			    case 19: format(tpc, 90,"2237.5413,-1081.1516,1049.04,������,2");
		        case 20: format(tpc,90,"295.2479,1472.2650,1080.2578,������,15");
		        case 21: format(tpc,90,"2807.6919,-1174.2933,1025.5703,������,8");
 				case 22: format(tpc, 90,"2196.8469,-1204.3524,1049.0234,������,6");
		        case 23: format(tpc, 90,"2365.3345,-1135.5907,1050.8826,������,8");
   			    case 24: format(tpc,90,"447.2238,1397.2926,1084.3047,�������,2");
   			    case 25: format(tpc, 90,"24.0716,1340.1615,1084.3750,�������,10");
   			    case 26: format(tpc,90,"-260.4934,1456.8430,1084.3672,�������,4");
   			    case 27: format(tpc, 90,"-283.6001,1471.2211,1084.3750,�������,15");
		        case 28: format(tpc,90,"2324.3977,-1149.0601,1050.7101,�������,12");
        		case 29: format(tpc, 90,"83.0791,1322.2808,1083.8662,�������,9");
		        case 30: format(tpc,90,"235.2748,1186.6809,1080.2578,�������,3");
		        case 31: format(tpc, 90,"140.2660,1366.1091,1083.8594,�������,5");
                case 32: format(tpc, 90,"234.1541,1063.7206,1084.2123,�������,6");
		        case 33: format(tpc, 90,"2317.7983,-1026.7651,1050.2178,�������,9");
			}
			sscanf(tcp, "p<,>ffff",HouseInfo[TOTALHOUSE][hCar][0], HouseInfo[TOTALHOUSE][hCar][1], HouseInfo[TOTALHOUSE][hCar][2], HouseInfo[TOTALHOUSE][hCar][3]);
   			sscanf(tpc,"p<,>fffs[16]i",HouseInfo[TOTALHOUSE][hExit][0],HouseInfo[TOTALHOUSE][hExit][1],HouseInfo[TOTALHOUSE][hExit][2],HouseInfo[TOTALHOUSE][hDiscript],HouseInfo[TOTALHOUSE][hInt][0]);
			HouseInfo[TOTALHOUSE][hPrice] = price;
			HouseInfo[TOTALHOUSE][hInt][1] = TOTALHOUSE;
   			strmid(HouseInfo[TOTALHOUSE][hOwner], "None", 0, strlen("None"), MAX_PLAYER_NAME);
			HouseInfo[TOTALHOUSE][hMIcon] = CreateDynamicMapIcon(HouseInfo[TOTALHOUSE][hEntr][0], HouseInfo[TOTALHOUSE][hEntr][1], HouseInfo[TOTALHOUSE][hEntr][2], 31, 0,-1,-1,-1,200.0);
   			HouseInfo[TOTALHOUSE][hPickup][0] = CreatePickup(1273, 1, HouseInfo[TOTALHOUSE][hEntr][0], HouseInfo[TOTALHOUSE][hEntr][1], HouseInfo[TOTALHOUSE][hEntr][2]);
 			format(query, sizeof(query), "INSERT INTO "TABLE_HOUSE" (ID, EntrX, EntrY, EntrZ, ExitX, ExitY, ExitZ, CarX, CarY, CarZ, CarFA, Discript, Price, Inter, Virtual) \
		 	VALUES (%d,'%f','%f','%f','%f','%f','%f','%f','%f','%f','%f','%s',%d,%d,%d)",TOTALHOUSE, HouseInfo[TOTALHOUSE][hEntr][0],HouseInfo[TOTALHOUSE][hEntr][1],HouseInfo[TOTALHOUSE][hEntr][2],
			HouseInfo[TOTALHOUSE][hExit][0],HouseInfo[TOTALHOUSE][hExit][1],HouseInfo[TOTALHOUSE][hExit][2], HouseInfo[TOTALHOUSE][hCar][0],HouseInfo[TOTALHOUSE][hCar][1],HouseInfo[TOTALHOUSE][hCar][2],HouseInfo[TOTALHOUSE][hCar][3],
			HouseInfo[TOTALHOUSE][hDiscript],HouseInfo[TOTALHOUSE][hPrice],HouseInfo[TOTALHOUSE][hInt][0],HouseInfo[TOTALHOUSE][hInt][1]);
			mysql_function_query(Mysql, query, false, "", "");
			return SendMes(playerid, COLOR_LIGHTRED,"[H] ��� ����� %i ������", TOTALHOUSE);
		}
		case D_ADD+2:
		{
 			new Str[32];
    		if(sscanf(inputtext,"s[32]",Str)) return ShowPlayerDialog(playerid, D_ADD+2, d_Input, "{6699FF}�������� GPS", "{FFFFFF}������� �������� �������:", "�������", "�����");
			if(response)
			{
				++TOTALGPS;
				strmid(GPSInfo[TOTALGPS][gName], Str, 0, strlen(Str), MAX_PLAYER_NAME);
				GetPlayerPos(playerid, GPSInfo[TOTALGPS][gLoc][0], GPSInfo[TOTALGPS][gLoc][1], GPSInfo[TOTALGPS][gLoc][2]);
	 			format(query, 128, "INSERT INTO "TABLE_GPS" (ID, Name, X, Y, Z) VALUES (%d,'%s','%f','%f','%f')",TOTALGPS, Str, GPSInfo[TOTALGPS][gLoc][0], GPSInfo[TOTALGPS][gLoc][1], GPSInfo[TOTALGPS][gLoc][2]);
				mysql_function_query(Mysql, query, false, "", "");
				return SendMes(playerid, COLOR_LIGHTRED,"[A] GPS %i ������", TOTALGPS);
			}
			else ShowPlayerDialog(playerid, D_ADD, d_List,"{6699FF}���� ����������","{FFFFFF}1. �������� ���\n2. �������� GPS\n3. �������� ���� / �����\n4. �������� ��������\n5. �������� �������\n6. �������� ������","�������","�����");
 		}
		case D_ADD+3:
		{
		    new type, model, name[32], Float:Cord[3];
     		if(sscanf(inputtext,"p<,>iis[32]",type,model,name))
     		{
     		    string = "";
 			   	strcat(string, "{FFFFFF}��� ���������� ����� / ������ ������� ������, ���, ��������\n\n\t{6699FF}���� ����� / ������:\n\n\t");
			    strcat(string, "1. ��� ����������� \t\t(ID: 0)\n\t2. ������, ������������ \t(ID: 2)");
			    strcat(string, "\n\t3. ������, �� ���������� \t(ID: 3)\n\n\t{6699FF}���� ����� / ������:\n\n\t");
			    strcat(string, "1. ������ ������� \t\t(ID: 19134)\n\t2. Ƹ���� ������ \t\t(ID: 19135)\n\t3. ��������� ������� \t");
			    strcat(string, "(ID: 19130)\n\t4. ��������� ������� \t(ID: 19132)\n\t5. ������� ������� \t(ID: 19133)");
		    	ShowPlayerDialog(playerid, D_ADD+3, d_Input, "{6699FF}�������� ���� / �����", string, "�������", "�����");
			}
   			if(response)
			{
				GetPlayerPos(playerid, Cord[0], Cord[1], Cord[2]);
				format(coordc, sizeof(coordc), "%f, %f, %f, %d, %d, %d, %d, %s", Cord[0], Cord[1], Cord[2], model, type, GetPlayerInterior(playerid),GetPlayerVirtualWorld(playerid), name);
	            SendClientMessage(playerid, COLOR_LIGHTRED, "[A] ���������� �������. ���������� �������� ����������: /ppc");
	            SetPVarInt(playerid,"PPC", 1);
            }
            else ShowPlayerDialog(playerid, D_ADD, d_List,"{6699FF}���� ����������","{FFFFFF}1. �������� ���\n2. �������� GPS\n3. �������� ���� / �����\n4. �������� ��������\n5. �������� �������\n6. �������� ������","�������","�����");
    	}
		case D_ADD+4:
   		{
   		    if(response)
   		    {
	   		    new Float:Cord[4];
	   		    GetPlayerPos(playerid, Cord[0], Cord[1], Cord[2]);
	   		    GetPlayerFacingAngle(playerid, Cord[3]);
	   		    SetPVarInt(playerid, "ATM", 1);
	   		    new objectid = CreateObject(2754, Cord[0], Cord[1], Cord[2]-0.35, 0.0, 0.0, 0.0);
	   		    SetPVarInt(playerid, "ObjectATM", objectid), EditObject(playerid, objectid);
   		    }
   		    else ShowPlayerDialog(playerid, D_ADD, d_List,"{6699FF}���� ����������","{FFFFFF}1. �������� ���\n2. �������� GPS\n3. �������� ���� / �����\n4. �������� ��������\n5. �������� �������\n6. �������� ������","�������","�����");
   		}
   		case D_ADD+5:
   		{
   		    if(response)
   		    {
	   		    switch(listitem)
	   		    {
	   		        case 0: format(c_business, sizeof(c_business), "1494.4468, 1303.5784, 1093.2891, 1501.6743, 1306.4769, 1093.2891, 3, 35, 1");
	   		        case 2: format(c_business, sizeof(c_business), "1455.8530, -977.3076, -79.2749, 1463.3005, -982.7077, -79.2749, 0, 52, 3");
	   		        case 4: format(c_business, sizeof(c_business), "-2240.7825, 137.2136,1035.4141, -2237.1941, 130.1793, 1035.4141, 6, 11, 5");
	   		        case 5: format(c_business, sizeof(c_business), "-25.9596, -188.2593, 1003.5469, -10.4987, -178.2574, 1003.5469, 17, 17, 6");
					case 8: format(c_business, sizeof(c_business), "-794.9959, 489.2806, 1376.1953, -787.9787, 500.0738, 1371.7422, 1, 50, 9");
					case 10: format(c_business, sizeof(c_business), "-2026.8778, -103.6028, 1035.1831, -2026.7643, -114.3421, 1035.1719, 3, 36, 11");
					case 12: format(c_business, sizeof(c_business), "207.6331, -111.2666,1005.1328, 207.6139, -100.3266, 1005.2578, 15, 45, 13");
					case 13: format(c_business, sizeof(c_business), "204.2840,-168.8608,1000.5234, 204.4176, -159.3506, 1000.5234, 14, 45, 14");
					case 18: format(c_business, sizeof(c_business), "343.7177, 305.0711, 999.1484, 348.6338, 302.6144, 999.1484, 6, 25, 19");
					case 19: format(c_business, sizeof(c_business), "411.9760, -54.4450, 1001.8984, 414.4109, -48.9723, 1001.8984, 12, 7, 20");
					case 20: format(c_business, sizeof(c_business), "-204.3588, -27.3473, 1002.2734, -201.9817, -25.0212, 1002.2734, 16, 39, 21");
				}
				return ShowPlayerDialog(playerid, D_ADD+6, d_Input, "{6699FF}�������� ������", "{FFFFFF}��� �������� ������� ������� ����, ��������", "������", "�����");
			}
			else return ShowPlayerDialog(playerid, D_ADD, d_List,"{6699FF}���� ����������","{FFFFFF}1. �������� ���\n2. �������� GPS\n3. �������� ���� / �����\n4. �������� ��������\n5. �������� ������","�������","�����");
		}
		case D_ADD+6:
		{
		    if(!response) return true;
  			new price,name[32];
  			if(sscanf(inputtext,"p<,>is[32]",price,name)) return ShowPlayerDialog(playerid, D_ADD+7, d_Input, "{6699FF}�������� ������", "{FFFFFF}��� �������� ������� ������� ����, ��������", "������", "�����");
			if(price < 1) return ShowPlayerDialog(playerid, D_ADD+7, d_Input, "{6699FF}�������� ������", "{FFFFFF}��� �������� ������� ������� ����, ��������", "������", "�����");
			TOTALBIZZ++;
            sscanf(c_business,"p<,>ffffffiii",
            BizzInfo[TOTALBIZZ][bExitx],BizzInfo[TOTALBIZZ][bExity],BizzInfo[TOTALBIZZ][bExitz],
            BizzInfo[TOTALBIZZ][bMenux],BizzInfo[TOTALBIZZ][bMenuy],BizzInfo[TOTALBIZZ][bMenuz],
			BizzInfo[TOTALBIZZ][bInt],BizzInfo[TOTALBIZZ][bMIcon], BizzInfo[TOTALBIZZ][bType]);
		    GetPlayerPos(playerid,BizzInfo[TOTALBIZZ][bEntrx],BizzInfo[TOTALBIZZ][bEntry],BizzInfo[TOTALBIZZ][bEntrz]);
			strmid(BizzInfo[TOTALBIZZ][bOwner], "None", 0, strlen("None"), MAX_PLAYER_NAME);
            strmid(BizzInfo[TOTALBIZZ][bName], name, 0, strlen(name), MAX_PLAYER_NAME);
            BizzInfo[TOTALBIZZ][bVW] = TOTALBIZZ; BizzInfo[TOTALBIZZ][bPrice] = price;
			BizzInfo[TOTALBIZZ][bEnter] = 100; BizzInfo[TOTALBIZZ][bTill] = 50;
			if(BizzInfo[TOTALBIZZ][bType] > 22) BizzInfo[TOTALBIZZ][bIcon] = CreateDynamicMapIcon(BizzInfo[TOTALBIZZ][bEntrx], BizzInfo[TOTALBIZZ][bEntry], BizzInfo[TOTALBIZZ][bEntrz], BizzInfo[TOTALBIZZ][bMIcon], 0, -1, -1, -1, 200.0);
            if(BizzInfo[TOTALBIZZ][bType] != 22)
			{
			    format(string, 128, "{6699FF}%s\n{FFFFFF}����������� ��������", BizzInfo[TOTALBIZZ][bName]);
				LABELBIZZ[TOTALBIZZ] = Create3DTextLabel(string,COLOR_GREEN,BizzInfo[TOTALBIZZ][bEntrx], BizzInfo[TOTALBIZZ][bEntry], BizzInfo[TOTALBIZZ][bEntrz], 20.0, 0, 1);
			 	BizzInfo[TOTALBIZZ][bPickup] = CreatePickup(19135,1, BizzInfo[TOTALBIZZ][bEntrx], BizzInfo[TOTALBIZZ][bEntry], BizzInfo[TOTALBIZZ][bEntrz]);
                BizzInfo[TOTALBIZZ][bMenu] = CreateDynamicCP(BizzInfo[TOTALBIZZ][bMenux],BizzInfo[TOTALBIZZ][bMenuy],BizzInfo[TOTALBIZZ][bMenuz], 1.0,BizzInfo[TOTALBIZZ][bVW],BizzInfo[TOTALBIZZ][bInt]);
			}
			else
			{
			    format(string, 128, "{6699FF}%s\n{FFFFFF}��� ��������", BizzInfo[TOTALBIZZ][bName],BizzInfo[TOTALBIZZ][bTill] / 3);
				LABELBIZZ[TOTALBIZZ] = Create3DTextLabel(string,COLOR_GREEN,BizzInfo[TOTALBIZZ][bEntrx], BizzInfo[TOTALBIZZ][bEntry], BizzInfo[TOTALBIZZ][bEntrz],20.0,0,1);
			}
			format(query, sizeof(query), "INSERT INTO "TABLE_BIZZ" (id, x, y, z, xt, yt, zt,menux,menuy,menuz, vint, virt, owner, name, price, type, icon) VALUES (%i, '%f', '%f', '%f', '%f', '%f', '%f','%f', '%f', '%f',%i, %i, '%s', '%s', %i, %i, %i)",
			TOTALBIZZ, BizzInfo[TOTALBIZZ][bEntrx], BizzInfo[TOTALBIZZ][bEntry], BizzInfo[TOTALBIZZ][bEntrz], BizzInfo[TOTALBIZZ][bExitx], BizzInfo[TOTALBIZZ][bExity], BizzInfo[TOTALBIZZ][bExitz], BizzInfo[TOTALBIZZ][bMenux],BizzInfo[TOTALBIZZ][bMenuy],BizzInfo[TOTALBIZZ][bMenuz]
			,BizzInfo[TOTALBIZZ][bInt],BizzInfo[TOTALBIZZ][bVW],BizzInfo[TOTALBIZZ][bOwner],BizzInfo[TOTALBIZZ][bName], BizzInfo[TOTALBIZZ][bPrice], BizzInfo[TOTALBIZZ][bType],BizzInfo[TOTALBIZZ][bMIcon]);
			mysql_function_query(Mysql, query, false, "", "");
            return SendMes(playerid,COLOR_ORANGE,"[A] ������ ����� %d ������",TOTALBIZZ);
		}
   		case D_DRIVE_EXAM:
   		{
   		    if(response)
   		    {
			   	string = "";
				strcat(string, "{6699FF}���� ������� �������� ������ ���������� ����������� � �� ��������:\n\n");
				strcat(string, "{0F8FCD}����� Ctrl\t{FFFFFF}������� ��� ��������� ���������\n");
				strcat(string, "{0F8FCD}����� Alt\t{FFFFFF}�������� ��� ��������� ����\n");
				strcat(string, "{0F8FCD}������ Ctrl\t{FFFFFF}������� ��� ������� ������ {6699FF}(������ ��� �������� ������)\n");
				strcat(string, "{0F8FCD}Num 4\t\t{FFFFFF}�������� ��� ��������� ������������ ��������\n");
				strcat(string, "{0F8FCD}Num 8\t\t{FFFFFF}���������� ������� � ���������� {6699FF}(���� ��� ������� � ������ ������)\n");
				strcat(string, "{0F8FCD}Num 2\t\t{FFFFFF}��������� ��������� {6699FF}(��������� � ��������� ��������)\n\n");
				strcat(string, "{FDC910}������������ ��������� ���������� ������ ����������\n����� ������ ������ ������� '�����'");
				ShowPlayerDialog(playerid, D_DRIVE_EXAM+1, d_Box, "{6699FF}������ 1: ���������� ��������� ����������", string, "�����", "�����");
			}
			else return true;
		}
		case D_DRIVE_EXAM+1:
		{
		    if(response)
		    {
		        for(new i; i < 22; ++i) TextDrawShowForPlayer(playerid, Speed[playerid][i]);
		    
			    string = "";
			    strcat(string, "{FFFFFF}������ ����������� ���������� � ������ ������ ���� ������ ��� ������ �� �������� � ����� ���������\n");
			    strcat(string, "{FFFFFF}��� ����������� �������� � ��� ������� ���������. ����, ���������� �������� �������� �� ���� ������:\n\n");
			    strcat(string, "\t{FFFFFF}SPEED: 50 {FF0000}|||||{FFFFFF}||||||||||||\n");
			    strcat(string, "\t{FFFFFF}FUEL:   7  {FF0000} |{FFFFFF}||||||||||||||||\n");
			    strcat(string, "\t{FFFFFF}MILEAGE: 10 KM\n");
			    strcat(string, "\t{FFFFFF}B {FF0000}C {FFFFFF}L {6699FF}B {FFFFFF}M\n\n");
			    strcat(string, "{6699FF}�� ������ ������� ������ ��������� �������� ����������:\n");
			    strcat(string, "{FFFFFF}SPEED: 50\t\t���������� ������� �������� ����������\n");
			    strcat(string, "{FFFFFF}FUEL:  7\t\t���������� ���������� ������� � ����\n");
			    strcat(string, "{FFFFFF}MILEAGE: 10 KM\t���������� ������ ���������� ������� �� ��������, �� ������� ������� ���� ����������\n\n");
			    strcat(string, "{6699FF}�� ������ ������� ��������� �������� ����������:\n");
			    strcat(string, "{FFFFFF}B\t(��� {FF0000}B{FFFFFF}) ���������� ������ �� ����� ��� ������\n");
			    strcat(string, "{FF0000}C\t{FFFFFF}(��� {FFFFFF}O) ���������� ������ ��� ������ ���������\n");
			    strcat(string, "{FFFFFF}L\t��������� ����������� ����� ���\n");
			    strcat(string, "{6699FF}B\t{FFFFFF}���������� ������ ��� ������ �������� � ����������\n");
			    strcat(string, "{FF0000}M\t{FFFFFF}���������� ������� ��� ���������� ������������ ��������\n\n");
			    strcat(string, "{6699FF}����������:\n1. ������ ����������� ����������� ��� � �������\n2. ����������� ���������� �� ������ ���� {FFFFFF}������ {6699FF}�����");
		    	ShowPlayerDialog(playerid, D_DRIVE_EXAM+2, d_Box, "{6699FF}������ 2: ������ �����������", string, "�����", "�����");
			}
			else ShowPlayerDialog(playerid, D_DRIVE_EXAM, d_Box, "{6699FF}��������", "{FFFFFF}��� ������� ������� ��� ������ �������������\n� �������� �� ��������\n\n{DAA520}��� ����, ����� ������ �������� ������� '�����'", "�����", "�����");
		}
		case D_DRIVE_EXAM+2:
		{
		    if(response)
		    {
		        for(new i; i < 22; ++i) TextDrawHideForPlayer(playerid, Speed[playerid][i]);
		    
			    string = "";
			    strcat(string, "{FFFFFF}��������� ����� �� ������� ���������� ����������. ������� ��� ����� ����� ���������:\n\n");
			    strcat(string, "{6699FF}1. �� ����������� �������\n{FFFFFF}��� ����� ��������� � ��� � �������{0F8FCD} Num 2{FFFFFF}. ������ ������� ���������� ��� ��������� �� 10 ������\n\n");			    strcat(string, "{6699FF}2. �������� � ��������\n{FFFFFF}����� ������ �������� ���� ���������� �� ����� ������ ��-�� ���������� �������\n");
			    strcat(string, "{FFFFFF}������� ��������� �������� � �������� {0F8FCD}/fill{FFFFFF}. �� �������� �������� �������� 15 ������\n");
			    strcat(string, "{FFFFFF}����� ����� ������ ��������� � ����������, ������� ������ ���������. 15 ������ ������ ������ ����� ������� �� ��������� ��������\n\n");
			    strcat(string, "{999999}�������� ������:\n1. �������� ����� �������� �������� 100 ������ �������. ��� ������ �� 30 ����� ������������ ������ ���������\n");
			    strcat(string, "{999999}2. ������ ���������� ��������� ����� �������� �� ������ ��� ����� ������ �� �����! ���� �� ������� ��������� ������ �������\n");
			    strcat(string, "{999999}3. ����� �� ������ �� ��������� ������� ���� �������� ������� ����� ������� �������� (/p)hone\n\n");
			    strcat(string, "{6699FF}�������� ��������� ����� � ����� ����������� ������ ���� ������ �������� (/p)hone\n");
			    strcat(string, "{6699FF}�������� ��������, ��� ���� ��������� ��� ������������ ���� ��������� ��������, �� ������� �������� ��� ���������� ��� ������!");
			    ShowPlayerDialog(playerid, D_DRIVE_EXAM+3, d_Box, "{6699FF}������ 3: �������� � ������", string, "�����", "�����");
			}
			else
			{
				for(new i; i < 22; ++i) TextDrawHideForPlayer(playerid, Speed[playerid][i]);
			
				string = "";
				strcat(string, "{6699FF}���� ������� �������� ������ ���������� ����������� � �� ��������:\n\n");
				strcat(string, "{0F8FCD}����� Ctrl\t{FFFFFF}������� ��� ��������� ���������\n");
				strcat(string, "{0F8FCD}����� Alt\t{FFFFFF}�������� ��� ��������� ����\n");
				strcat(string, "{0F8FCD}������ Ctrl\t{FFFFFF}������� ��� ������� ������ {6699FF}(������ ��� �������� ������)\n");
				strcat(string, "{0F8FCD}Num 4\t\t{FFFFFF}�������� ��� ��������� ������������ ��������\n");
				strcat(string, "{0F8FCD}Num 8\t\t{FFFFFF}���������� ������� � ���������� {6699FF}(���� ��� ������� � ������ ������)\n");
				strcat(string, "{0F8FCD}Num 2\t\t{FFFFFF}��������� ��������� {6699FF}(��������� � ��������� ��������)\n\n");
				strcat(string, "{FDC910}������������ ��������� ���������� ������ ����������\n����� ������ ������ ������� '�����'");
				ShowPlayerDialog(playerid, D_DRIVE_EXAM+1, d_Box, "{6699FF}������ 1: ���������� ��������� ����������", string, "�����", "�����");
			}
		}
		case D_DRIVE_EXAM+3:
		{
		    if(response)
		    {
			    format(ShowDriveDialog, sizeof(ShowDriveDialog), "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
				DriveDialog[0], DriveDialog[2], DriveDialog[3], DriveDialog[4], DriveDialog[5], DriveDialog[6], DriveDialog[7], DriveDialog[8], DriveDialog[9], DriveDialog[10], DriveDialog[11], DriveDialog[12], DriveDialog[13], DriveDialog[14]);
				return ShowPlayerDialog(playerid, D_DRIVE_EXAM+4, d_Box, "{6699FF}������ 4: ������� ��������� ��������", ShowDriveDialog, "�����", "�����");
			}
			else
			{
			    for(new i; i < 22; ++i) TextDrawShowForPlayer(playerid, Speed[playerid][i]);
			    
			    string = "";
			    strcat(string, "{FFFFFF}������ ����������� ���������� � ������ ������ ���� ������ ��� ������ �� �������� � ����� ���������\n");
			    strcat(string, "{FFFFFF}��� ����������� �������� � ��� ������� ���������. ����, ���������� �������� �������� �� ���� ������:\n\n");
			    strcat(string, "\t{FFFFFF}SPEED: 50 {FF0000}|||||{FFFFFF}||||||||||||\n");
			    strcat(string, "\t{FFFFFF}FUEL:   7  {FF0000} |{FFFFFF}||||||||||||||||\n");
			    strcat(string, "\t{FFFFFF}MILEAGE: 10 KM\n");
			    strcat(string, "\t{FFFFFF}B {FF0000}C {FFFFFF}L {6699FF}B {FFFFFF}M\n\n");
			    strcat(string, "{6699FF}�� ������ ������� ������ ��������� �������� ����������:\n");
			    strcat(string, "{FFFFFF}SPEED: 50\t\t���������� ������� �������� ����������\n");
			    strcat(string, "{FFFFFF}FUEL:  7\t\t���������� ���������� ������� � ����\n");
			    strcat(string, "{FFFFFF}MILEAGE: 10 KM\t���������� ������ ���������� ������� �� ��������, �� ������� ������� ���� ����������\n\n");
			    strcat(string, "{6699FF}�� ������ ������� ��������� �������� ����������:\n");
			    strcat(string, "{FFFFFF}B\t(��� {FF0000}B{FFFFFF}) ���������� ������ �� ����� ��� ������\n");
			    strcat(string, "{FF0000}C\t{FFFFFF}(��� {FFFFFF}O) ���������� ������ ��� ������ ���������\n");
			    strcat(string, "{FFFFFF}L\t��������� ����������� ����� ���\n");
			    strcat(string, "{6699FF}B\t{FFFFFF}���������� ������ ��� ������ �������� � ����������\n");
			    strcat(string, "{FF0000}M\t{FFFFFF}���������� ������� ��� ���������� ������������ ��������\n\n");
			    strcat(string, "{6699FF}����������:\n1. ������ ����������� ����������� ��� � �������\n2. ����������� ���������� �� ������ ���� {FFFFFF}������ {6699FF}�����");
		    	ShowPlayerDialog(playerid, D_DRIVE_EXAM+2, d_Box, "{6699FF}������ 2: ������ �����������", string, "�����", "�����");
			}
		}
		case D_DRIVE_EXAM+4:
		{
		    if(response)
		    {
			    string = "";
			    strcat(string, "{FFFFFF}�������� �� �� ����������� ������ � ������ ���������� � ����� ��������\n");			    strcat(string, "{FFFFFF}���� �� ������������ � ���-����, �� ����������� �� ��������� � ��������� ������ ������ ��� ���!\n\n{FDC910}������ ��� ����� �� ��������!\n��� ���� ����� ��������� �������� ������� '�����'");
			    ShowPlayerDialog(playerid, D_DRIVE_EXAM+5, d_Box, "{6699FF}����������", string, "�����", "�����");
			}
			else
			{
				string = "";
			    strcat(string, "{FFFFFF}��������� ����� �� ������� ���������� ����������. ������� ��� ����� ����� ���������:\n\n");
			    strcat(string, "{6699FF}1. �� ����������� �������\n{FFFFFF}��� ����� ��������� � ��� � �������{0F8FCD} Num 2{FFFFFF}. ������ ������� ���������� ��� ��������� �� 10 ������\n\n");			    strcat(string, "{6699FF}2. �������� � ��������\n{FFFFFF}����� ������ �������� ���� ���������� �� ����� ������ ��-�� ���������� �������\n");
			    strcat(string, "{FFFFFF}������� ��������� �������� � �������� {0F8FCD}/fill{FFFFFF}. �� �������� �������� �������� 15 ������\n");
			    strcat(string, "{FFFFFF}����� ����� ������ ��������� � ����������, ������� ������ ���������. 15 ������ ������ ������ ����� ������� �� ��������� ��������\n\n");
			    strcat(string, "{999999}�������� ������:\n1. �������� ����� �������� �������� 100 ������ �������. ��� ������ �� 30 ����� ������������ ������ ���������\n");
			    strcat(string, "{999999}2. ������ ���������� ��������� ����� �������� �� ������ ��� ����� ������ �� �����! ���� �� ������� ��������� ������ �������\n");
			    strcat(string, "{999999}3. ����� �� ������ �� ��������� ������� ���� �������� ������� ����� ������� �������� (/p)hone\n\n");
			    strcat(string, "{6699FF}�������� ��������� ����� � ����� ����������� ������ ���� ������ �������� (/p)hone\n");
			    strcat(string, "{6699FF}�������� ��������, ��� ���� ��������� ��� ������������ ���� ��������� ��������, �� ������� �������� ��� ���������� ��� ������!");
			    ShowPlayerDialog(playerid, D_DRIVE_EXAM+3, d_Box, "{6699FF}������ 3: �������� � ������", string, "�����", "�����");
			}
		}
		case D_DRIVE_EXAM+5:
		{
		    if(response)
		    {
		        return true;
			}
		    else
		    {
		    	format(ShowDriveDialog, sizeof(ShowDriveDialog), "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
				DriveDialog[0], DriveDialog[2], DriveDialog[3], DriveDialog[4], DriveDialog[5], DriveDialog[6], DriveDialog[7], DriveDialog[8], DriveDialog[9], DriveDialog[10], DriveDialog[11], DriveDialog[12], DriveDialog[13], DriveDialog[14]);
				return ShowPlayerDialog(playerid, D_DRIVE_EXAM+4, d_Box, "{6699FF}������ 4: ������� ��������� ��������", ShowDriveDialog, "�����", "�����");
			}
		}
		case D_GPS:
		{
		    if(!response) return true;
   			new str[512], strr[1000];
		    switch(listitem)
		    {

      			case 0:
				{
					for(new i = 1; i <= 10; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
					SetPVarInt(playerid, "GPSID", 1);
					ShowPlayerDialog(playerid, D_GPS+1, d_List, "{6699FF}������������ ����������", strr, "��������", "�����");
				}
		        case 1:
				{
					for(new i = 11; i <= 19; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
					SetPVarInt(playerid, "GPSID", 4);
					ShowPlayerDialog(playerid, D_GPS+2, d_List, "{6699FF}�����������", strr, "��������", "�����");
				}
 		       	case 2:
			    {
					for(new i = 31; i <= 48; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
			    	SetPVarInt(playerid, "GPSID", 20);
			    	ShowPlayerDialog(playerid, D_GPS+3, d_List, "{6699FF}������", strr, "��������", "�����");
				}
				case 3:
			    {
					for(new i = 49; i <= 55; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
			    	SetPVarInt(playerid, "GPSID", 20);
			    	ShowPlayerDialog(playerid, D_GPS+4, d_List, "{6699FF}�������� �������", strr, "��������", "�����");
				}
				case 4:
			    {
					for(new i = 56; i <= 67; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
			    	SetPVarInt(playerid, "GPSID", 20);
			    	ShowPlayerDialog(playerid, D_GPS+5, d_List, "{6699FF}�����", strr, "��������", "�����");
				}
				case 5:
			    {
					for(new i = 68; i <= 72; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
			    	SetPVarInt(playerid, "GPSID", 20);
			    	ShowPlayerDialog(playerid, D_GPS+6, d_List, "{6699FF}����������", strr, "��������", "�����");
				}
				case 6:
			    {
					for(new i = 73; i <= 88; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
			    	SetPVarInt(playerid, "GPSID", 20);
			    	ShowPlayerDialog(playerid, D_GPS+7, d_List, "{6699FF}��������������", strr, "��������", "�����");
				}
				case 7:
			    {
					for(new i = 89; i <= 94; i++) { format(str, 64, "{B3F9B0}> {FFFFFF}%s\n", GPSInfo[i][gName]); strcat(strr,str); }
			    	SetPVarInt(playerid, "GPSID", 20);
			    	ShowPlayerDialog(playerid, D_GPS+8, d_List, "{6699FF}���������", strr, "��������", "�����");
				}
				case 8:
				{
				    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   				ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
				}
			}
   		}
		case D_GPS+1:
		{
		    if(response)
		    {
		        SetPVarInt(playerid,"GPS",1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
			    GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
				SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 19, 0, MAPICON_GLOBAL);
				SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
				PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
				DeletePVar(playerid, "GPSID");
  			}
		  	else
		  	{
		  	    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
		  	}
  			return true;
		}
		case D_GPS+2:
		{
		    if(response)
		    {
			    SetPVarInt(playerid,"GPS", 1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
				GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
                SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 48, 0, MAPICON_GLOBAL);
				SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
                PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
		  		DeletePVar(playerid, "GPSID");
  			}
  			else
  			{
  			    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
  			}
  			return true;
		}
		case D_GPS+3:
		{
		    if(response)
		    {
			    SetPVarInt(playerid,"GPS",1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
				GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
                SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 11, 0, MAPICON_GLOBAL);
			 	SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
                PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
			 	DeletePVar(playerid, "GPSID");
  			}
  			else
  			{
  			    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
  			}
  			return true;
		}
		case D_GPS+4:
		{
		    if(response)
		    {
			    SetPVarInt(playerid,"GPS",1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
				GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
				SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 9, 0, MAPICON_GLOBAL);
			 	SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
                PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
				DeletePVar(playerid, "GPSID");
  			}
			else
			{
			    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
			}
  			return true;
		}
		case D_GPS+5:
		{
		    if(response)
		    {
			    SetPVarInt(playerid,"GPS",1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
				GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
				SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 52, 0, MAPICON_GLOBAL);
			 	SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
                PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
				DeletePVar(playerid, "GPSID");
  			}
  			else
  			{
  			    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
  			}
  			return true;
		}
		case D_GPS+6:
		{
		    if(response)
		    {
			    SetPVarInt(playerid,"GPS",1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
				GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
				SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 55, 0, MAPICON_GLOBAL);
			 	SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
                PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
				DeletePVar(playerid, "GPSID");
  			}
			else
			{
			    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
			}
  			return true;
		}
		case D_GPS+7:
		{
		    if(response)
		    {
			    SetPVarInt(playerid,"GPS",1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
				GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
				SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 63, 0, MAPICON_GLOBAL);
		  		SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
				PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
 				DeletePVar(playerid, "GPSID");
  			}
  			else
  			{
  			    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
  			}
  			return true;
		}
		case D_GPS+8:
		{
		    if(response)
		    {
			    SetPVarInt(playerid,"GPS",1);
			    DestroyDynamicCP(GPS_ACTIVE[playerid]);
				GPS_ACTIVE[playerid] = CreateDynamicCP(GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 3.0, -1, -1, playerid);
				SetPlayerMapIcon(playerid, 99, GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][0], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][1], GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gLoc][2], 22, 0, MAPICON_GLOBAL);
		  		SendMes(playerid, COLOR_GREEN, "[G] �� �������� �� �����: %s",GPSInfo[listitem+GetPVarInt(playerid, "GPSID")][gName]);
				PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
 				DeletePVar(playerid, "GPSID");
  			}
  			else
  			{
  			    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   			ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
  			}
  			return true;
		}
		
		case D_ERROR: return ShowPlayerDialog(playerid, D_REG, d_Input, "{6699FF}������", "{FFFFFF}������� ������ ��� ������ ��������\n�� ����� ������������� ������ ���, ��� ����� �� ������.\n\n\t{1DBF3A}�����:\n\t- ������ ����� �������� �� ������� � ��������� ��������\n\t- ������ ������������ � ��������\n\t- ����� ������ �� 6-�� �� 15-�� ��������", "�����","�����");
		case D_ERROR+1: return ShowPlayerDialog(playerid, D_REG+1, d_Input, "{6699FF}����������� �����", "{FFFFFF}������� ����� ����� ����������� �����\n��������� ���, �� ������� ������������ ������ � ��������\n� ������ ������ ��� ���� �������� ������\n\n{6699FF}�� email ����� ������ ���, ������� �� ������\n������ � ��������� ���� ��� �����������.\n��������� � ������������ ����� � ������� '�����'", "�����", "�����");
		case D_ERROR+2: return ShowPlayerDialog(playerid, D_REG+4, d_Input,"{6699FF}�������", "{FFFFFF}������� ������� ������� ������ ���������:\n\n{6699FF}��� �������� �� ��� ����� ����.\n������� ����� ���� �� 18 �� 65 ���\n\n���� �������� ������ �� �������� ��� � �������.\n�������� ������� �������� ������ ����� '�������������� ����������� �������'.","�����", "�����");
		case D_MOBILE:
		{
		    switch(listitem)
		    {
		        case 0:
		        {
					format(string, sizeof(string), "{FFFFFF}�� ����� ��������� �����: %i$", GetPVarInt(playerid, "pCashOnMobile"));
					return ShowPlayerDialog(playerid, D_MOBILE+1, d_Box, "{6699FF}��������� ����", string, "�����", "�����");
		        }
		        case 1:
		        {
		            format(string, sizeof(string), "%s\n", GetName(playerid));
					return ShowPlayerDialog(playerid, D_MOBILE+2, d_List, "{6699FF}���������� �����", string, "�������", "�����");
		        }
		        case 2:
		        {
		            return ShowPlayerDialog(playerid, D_MOBILE+3, d_Box, "{6699FF}�������� �������", "{FFFFFF}������� ����� �������� � ����� ������� �������� ��������\n\n{6699FF}��������:\n\t- 740356, Rogar_Hillz\n\t- ����� �� ������ ��������� 10 ��������", "��������", "�����");
		        }
		        case 3:
		        {
		            switch(GetPVarInt(playerid, "Phone"))
		            {
		                case 0:
		                {
		                    SetPVarInt(playerid, "Phone", 0);
		                	SendClientMessage(playerid, -1, "[M] �� �������� �������!");
		                }
		                case 1:
		                {
		                    SetPVarInt(playerid, "Phone", 1);
		                	SendClientMessage(playerid, -1, "[M] �� ��������� �������!");
		                }
		            }
		        }
		        
			}
		}
		case D_MOBILE+1:
		{
		    if(response) ShowPlayerDialog(playerid, D_MOBILE, d_List, "{6699FF}������� �������", "1. ���������� ������\n2. ���������� �����\n3. �������� �������\n4. ���/���� �������", "�������", "�����");
		}
		case D_MOBILE+2:
		{
		    if(!response) ShowPlayerDialog(playerid, D_MOBILE, d_List, "{6699FF}������� �������", "1. ���������� ������\n2. ���������� �����\n3. �������� �������\n4. ���/���� �������", "�������", "�����");
		}
		case D_MOBILE+3:
		{
		    if(!response) ShowPlayerDialog(playerid, D_MOBILE, d_List, "{6699FF}������� �������", "1. ���������� ������\n2. ���������� �����\n3. �������� �������\n4. ���/���� �������", "�������", "�����");
		}
		case D_WORK+2:
		{
    		SetPVarInt(playerid, "OldLessSkin",GetPlayerSkin(playerid));
			SetPVarInt(playerid, "LessPil", 1);
			TextDrawShowForPlayer(playerid, ProcentDraw[playerid]);
			TextDrawShowForPlayer(playerid, AmountLDraw[playerid]);
			SetPVarInt(playerid, "Wood", TOTALTREE);
			TOTALTREE++;
			SetPlayerCheckpoint(playerid, Wood[GetPVarInt(playerid, "Wood")][0], Wood[GetPVarInt(playerid, "Wood")][1], Wood[GetPVarInt(playerid, "Wood")][2], 3.0);
			GivePlayerWeapon(playerid, 9, 1);
			SendClientMessage(playerid, -1, "[W] �� ������ ������ �� ���������, ����������, ������� ������");
		}
		case D_WORK+3:
		{
            SendMes(playerid, -1, "[W] �� ��������� ������� ����, ��� ���������: %i$", cDataInfo[playerid][pJobAmount][2]*2);
			GiveMoney(playerid, cDataInfo[playerid][pJobAmount][2]*2);
			if(IsPlayerAttachedObjectSlotUsed(playerid, 3)) RemovePlayerAttachedObject(playerid, 3);
			if(IsPlayerAttachedObjectSlotUsed(playerid, 4)) RemovePlayerAttachedObject(playerid, 4);
			cDataInfo[playerid][pJobAmount][2] = 0;
			DeletePVar(playerid, "OldLessSkin");
			DeletePVar(playerid, "LessPil");
			DeletePVar(playerid, "Wood");
			TextDrawHideForPlayer(playerid, ProcentDraw[playerid]);
			TextDrawHideForPlayer(playerid, AmountLDraw[playerid]);
			DisablePlayerCheckpoint(playerid);
			ResetPlayerWeapons(playerid);
		}
		case D_WORK+4:
		{
		    new Float:X, Float:Y, Float:Z;
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0: X=1097.6217, Y=-1796.5940, Z=13.6047;
		        case 1: X=-761.8846, Y=-142.5731, Z=65.6930;
		        case 2: X=2196.6277, Y=-2257.3381, Z=13.5469;
		        case 3: X=641.4872, Y=846.4285, Z=-42.9609;
		        case 4: X=-1585.9127, Y=715.8604, Z=-5.2422;
		        case 5: X=2289.5046, Y=2452.4695, Z=10.8203;
		        case 6: X=2495.5559, Y=-1666.6296, Z=13.0708;
		        case 7: X=2023.9126, Y=-1132.1450, Z=24.3797;
		        case 8: X=2743.6360, Y=-1398.1372, Z=35.9393;
		        case 9: X=1871.2664, Y=-1926.1224, Z=13.2740;
		        case 10: X=2138.2339, Y=-1616.7936, Z=13.2920;
		        case 11: X=-1521.9741, Y=480.8362, Z=7.1875;
		        case 12: X=1560.9878, Y=-1237.1444, Z=292.0180;
		    }
	    	SetPlayerPos(playerid, X, Y, Z);
	    	SetPlayerInterior(playerid,0);
	    	SetPlayerVirtualWorld(playerid,0);
		}
		case D_WORK+5:
		{
			if(!response) return 1;
    		SetPVarInt(playerid, "OldCargoSkin",GetPlayerSkin(playerid));
			SetPVarInt(playerid, "Cargo", 1);
			SetPlayerCheckpoint(playerid,2231.0959,-2285.3909,14.3751,1.4);
			TextDrawShowForPlayer(playerid, AmountDraw[playerid]);
			SendClientMessage(playerid, COLOR_PAYCHEC, "[W] �� ������� ���������� ���������.");
			return 1;
		}
		case D_WORK+6:
		{
			if(!response) return 1;
            SendMes(playerid, COLOR_PAYCHEC, "[W] �� ��������� ������� ����, ��� ���������: %i$",cDataInfo[playerid][pJobAmount][1]*250);
			GiveMoney(playerid, cDataInfo[playerid][pJobAmount][1]*250);
			if(IsPlayerAttachedObjectSlotUsed(playerid, 3)) RemovePlayerAttachedObject(playerid, 3);
			cDataInfo[playerid][pJobAmount][1] = 0;
			DeletePVar(playerid, "OldCargoSkin"); DeletePVar(playerid, "Cargo");
			TextDrawHideForPlayer(playerid, AmountDraw[playerid]);
			DisablePlayerCheckpoint(playerid);
			SavePlayer(playerid);
			return 1;
		}
		case D_SMI:
		{
		    if(!response) return true;
		    switch(listitem)
		    {
		        case 0: AdvertList(playerid);
		    }
		}
		case D_SMI+5:
		{
		    if(!response) return true;
		    SetPVarInt(playerid, "AdvertID", listitem+1);
		    ShowPlayerDialog(playerid, D_SMI+6, 2, "{6699FF}����������", "1. ��������� ����������\n2. �������� ����������\n3. ������� ����������\n4. ��������� ����������\n5. ��������� �������������", "�������", "�����");
		}
		case D_SMI+6:
		{
		    if(!response) { DeletePVar(playerid, "AdvertID"); return AdvertList(playerid); }
      		switch(listitem)
      		{
      		    case 0:
  				{
          			string = "";
  				    format(string, 256, "{FFFFFF}����������: %s - �����������: %s",AI[GetPVarInt(playerid, "AdvertID")][aText],AI[GetPVarInt(playerid, "AdvertID")][aName]);
					ShowPlayerDialog(playerid, D_SMI+7, d_Box, "{6699FF}����������", string, "�����", "");
			  	}
      		    case 1:
			  	{
			  	    string = "";
		    		format(string, 256, "{FFFFFF}����������: %s - �����������: %s",AI[GetPVarInt(playerid, "AdvertID")][aText],AI[GetPVarInt(playerid, "AdvertID")][aName]);
					ShowPlayerDialog(playerid, D_SMI+8, d_Input, "{6699FF}����������", string, "���������", "�����");
			  	}
      		    case 2:
      		    {
      		        for(new i = GetPVarInt(playerid, "AdvertID"); i <= TOTALADVERT - 1; i++) memcpy(AI[i], AI[i+1], 0, 512);
					TOTALADVERT--;
					SendClientMessage(playerid, COLOR_LIGHTRED, "[S] ���������� ������� ������� � ���� ������ ���.");
      		        DeletePVar(playerid, "AdvertID");
      		        AdvertList(playerid);
      		    }
      		    case 3:
			  	{
			  	    if(AdvertTime > gettime())
				  	{
				  		DeletePVar(playerid, "AdvertID");
				  		SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ���������� ���������� ����� ������ �� ��������� 20 ������!");
      		        	return AdvertList(playerid);
					}
					string = "";
 	  				format(string, 256, "[$] %s. �����������: %s. �������: %i",AI[GetPVarInt(playerid, "AdvertID")][aText], AI[GetPVarInt(playerid, "AdvertID")][aName], AI[GetPVarInt(playerid, "AdvertID")][aPhone]);
					SendClientMessageToAll(COLOR_GREEN, string);
					string = "";
 	  				format(string, 256, "[$] �������� ������� %s %s)", Ranks_Type(playerid), GetName(playerid));
					SendClientMessageToAll(COLOR_GREEN, string);
					for(new i = GetPVarInt(playerid, "AdvertID"); i <= TOTALADVERT - 1; i++) memcpy(AI[i], AI[i+1], 0, 512);
					TOTALADVERT--;
					AdvertTime = gettime() + 20;
					DeletePVar(playerid, "AdvertID");
      		        AdvertList(playerid);
			  	}
      		    case 4:
			  	{
			  	    string = "";
			  	  	format(string, 256, "[A] [$] %s. �����������: %s (��������: %s)",AI[GetPVarInt(playerid, "AdvertID")][aText], AI[GetPVarInt(playerid, "AdvertID")][aName], GetName(playerid));
					SendAdminMessage(COLOR_LIGHTRED, string);
      				for(new i = GetPVarInt(playerid, "AdvertID"); i <= TOTALADVERT - 1; i++) memcpy(AI[i], AI[i+1], 0, 512);
					TOTALADVERT--;
					SendClientMessage(playerid, COLOR_LIGHTRED, "[S] ���������� ���������� �������������!");
      		        DeletePVar(playerid, "AdvertID");
      		        AdvertList(playerid);
			  	}
      		}
		}
		case D_SMI+7: ShowPlayerDialog(playerid, D_SMI+6, d_List, "{6699FF}����������", "1. ��������� ����������\n2. �������� ����������\n3. ������� ����������\n4. ��������� ����������\n5. ��������� �������������", "�������", "�����");
		case D_SMI+8:
		{
		    if(!response) return ShowPlayerDialog(playerid, D_SMI+6, d_List, "{6699FF}����������", "1. ��������� ����������\n2. �������� ����������\n3. ������� ����������\n4. ��������� ����������\n5. ��������� �������������", "�������", "�����");
		    new text[60];
		    if(sscanf(inputtext, "s[60]",text))
			{
 				format(string, 128, "����������: %s - �����������: %s",AI[GetPVarInt(playerid, "AdvertID")][aText],AI[GetPVarInt(playerid, "AdvertID")][aName]);
				return ShowPlayerDialog(playerid, D_SMI+8, 1, "{6699FF}����������", string, "�������", "�����");
			}
			strmid(AI[GetPVarInt(playerid, "AdvertID")][aText],text,0,strlen(text),sizeof(text));
			SendClientMessage(playerid, COLOR_GREEN, "[S] ���������� ��������������� � ������ � ��������.");
			ShowPlayerDialog(playerid, D_SMI+6, d_List, "{6699FF}����������", "1. ��������� ����������\n2. �������� ����������\n3. ������� ����������\n4. ��������� ����������\n5. ��������� �������������", "�������", "�����");
		}
		case D_TD:
		{
			PlayerRentTaxi[playerid] = false;
		    if(response)
		    {
				if(GetPlayerMoney(playerid) < TAXI_PRICERENT)
				{
				    new taZ[128];
				    format(taZ, sizeof(taZ), "[!] � ��� �� ���������� ������� ��� ������. ����: %d$", TAXI_PRICERENT);
					SendClientMessage(playerid, COLOR_LIGHTRED, taZ);
					RemovePlayerFromVehicle(playerid);
					return true;
				}
				GiveMoney(playerid, -TAXI_PRICERENT);
	       		SetGVarFloat("Fuel", 100, GetPlayerVehicleID(playerid));
	  			SendClientMessage(playerid, -1, "{B5E01B}[W] �� ������� ���������� ����������. (����������� �������: /unrent ����� �������� ������).");
	  			GetPlayerRentTaxi[playerid] = GetPlayerVehicleID(playerid);
	  			TaxiJobStarted[playerid] = true;
		    }
		    else
		    {
				RemovePlayerFromVehicle(playerid);
			}
		}
		case D_TD+1:
		{
		    if(response)
	    	{
			new taz2[256];
	    	if(GetPlayerMoney(playerid) < GetPriceTaxi(playerid))
			{
				SendClientMessage(playerid, -1, "{27C400}� ��� ������������ ������� ��� �������. ������� ������ �������.");
			    format(taz2, sizeof(taz2), "{FFFFFF}\
				����� ����������:{FFFFFF} %s\n\
				{00FFFF}��������� �������:{FFFFFF} %d$\n\
				{999999}����� ������� ����� ����������\n\
				������� �� ������ '�����'\
				", GetPlayerPoint(playerid), GetPriceTaxi(GetPlayerCarDriver(playerid)));
				ShowPlayerDialog(playerid, D_TD+1, DIALOG_STYLE_MSGBOX, "{AFE01B}����������", taz2, "������", "�����");
				return 1;
			}
	    	format(taz2, sizeof(taz2), "{FFFFFF}\
			����� ����������:{FFFFFF} %s\n\
			{00FFFF}������ �������:{FFFFFF} %d$\n\
			{999999}����� �������� �����\n\
			����� �� ������ '������'\
			", GetPlayerPoint(playerid), GetPriceTaxi(GetPlayerCarPass(playerid)));
			ShowPlayerDialog(GetPlayerCarDriver(playerid), D_TD+2, DIALOG_STYLE_MSGBOX, "{AFE01B}����������", taz2, "������", "������");
	        SendClientMessage(playerid, -1, "{B5E01B}[M] ������� ������� ������. ��������� ������ �� �������� ����������");
	        PlayerEnteredPoint[playerid] = true;
		    }
		    else
		    {
				ShowPlayerDialog(playerid, 00000, DIALOG_STYLE_MSGBOX, "{AFE01B}����������", "{FFFFFF}\
				���������� ������ �� ����� � �� �����,\n\
				� ������� ��� ���������� �����������.", "�������", "");
		    }
		}
		case D_TD+2:
		{
			if(response)
		    {
			    PlayerTaxiStarted[playerid] = true;
				SetPlayerCheckpoint(playerid, LASTPOS[playerid][0], LASTPOS[playerid][1], LASTPOS[playerid][2], 5.0);
			    SetPlayerCheckpoint(GetPlayerCarPass(playerid), LASTPOS[playerid][0], LASTPOS[playerid][1], LASTPOS[playerid][2], 5.0);
			    SendClientMessage(GetPlayerCarPass(playerid), -1, "{B5E01B}[M] �������� ���������� ������� ��� �� ������ ����������.");
				SendClientMessage(playerid, -1, "{B5E01B}[W] ������������� � �������� �������, ������� ������ �� �����.");
				for(new i; i < MAX_TAXI; i++)
				{
				    if(TAXI_ID[i] == GetPlayerVehicleID(playerid))
				    {
				       	Update3DTextLabelText(TAXI_TEXT[i], 0xDEF200FF, "[{FFFFFF}����������{DEF200}]\n{EB1313}������");
	           			break;
					}
				}
			}
		    else
		    {
				SendClientMessage(GetPlayerCarPass(playerid), -1, "{B5E01B}M] �������� ��������� ������� ��� �� ������ ����������.");
				SendClientMessage(playerid, -1, "{B5E01B}[W] �� ���������� ������� ���������.");
				RemovePlayerFromVehicle(GetPlayerCarPass(playerid));
			}
			return true;
		}
		case D_TD+3:
		{
		    if(!response) return true;
			for(new d; d < MAX_PLAYERS; d++)
			{
				if(IsPlayerConnected(d) && IsTaxiCar(GetPlayerVehicleID(d))) RemovePlayerFromVehicle(d);
			}
			SendClientMessage(playerid, -1, "{B5E01B}[W] ������ ���������� ������� ��������.");
			KillTimer(ExitCarTimer[playerid]);
			TaxiJobStarted[playerid] = false;
			PlayerTaxiStarted[playerid] = false;
			SetVehicleToRespawn(GetPlayerRentTaxi[playerid]);
			GetPlayerRentTaxi[playerid] = INVALID_VEHICLE_ID;
			for(new d; d < MAX_PLAYERS; d++)
			{
		    	if(IsPlayerConnected(d) && PlayerCalledTaxi[d]) RemovePlayerMapIcon(playerid, d);
			}
		}
		case D_TD+4:
		{
		    if(!response) return true;
			switch(listitem)
			{
			    case 0: SendClientMessage(PlayerService[playerid], -1, "{B5E01B}[W] ������� �������, ��� �� ��������� ��� '�������'.");
			    case 1: SendClientMessage(PlayerService[playerid], -1, "{B5E01B}[W] ������� �������, ��� �� ��������� ��� '������'.");
			    case 2: SendClientMessage(PlayerService[playerid], -1, "{B5E01B}[W] ������� �������, ��� �� ��������� ��� '�����������������'.");
	  			case 3: SendClientMessage(PlayerService[playerid], -1, "{B5E01B}[W] ������� �������, ��� �� ��������� ��� '������'.");
			}
			PlayerService[playerid] = INVALID_PLAYER_ID;
		}
		case D_FRACTION:
		{
		    new p = GetPVarInt(playerid, "PlayerInvite");
		    if(response)
		    {
                SetPVarInt(playerid, "pMember", GetPVarInt(p, "pMember"));
		        SendMes(playerid,COLOR_BLUE,"[F] �� �������������� � ����������� \"%s\"", playerid);
		        SendMes(p,COLOR_BLUE,"[F] %s ������ ����������� �������������� � \"%s\"", GetName(playerid));
                SetPVarInt(playerid, "pJob", 0);
				SetPVarInt(playerid, "pRank", 1);
				Colors_Type(playerid);
				DeletePVar(playerid, "PlayerInvite");
				return true;
		    }
		    else SendMes(p,COLOR_BLUE,"[F] %s �������� ����������� �������������� � \"%s\"", GetName(playerid));
            DeletePVar(playerid, "PlayerInvite");
		}
		case D_PARK:
		{
		    if(response) return true;
		    else return false;
		}
		case D_BUY:
		{
			if(!response) return 1;
	  		new i = GetPVarInt(playerid, "PlayerBizzz"),till = BizzInfo[i][bTill];
		    switch(listitem)
		    {
		        case 0:
		        {
		            if(GetPVarInt(playerid, "pPhone") == 1) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���� ��������� �������.");
					if(GetMoney(playerid) < till*14) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ������������ �������.");
					GivePlayerMoney(playerid, -till*14);
					BizzInfo[i][bMoney] += till*14;
					BizzPay[i] += till*14;
					BizzInfo[i][bProduct] -= 50;
					new randphone = 10000 + random(999999);
					SetPVarInt(playerid, "pPhone", randphone);
					SetPlayerInt(GetName(playerid), "Mobile", GetPVarInt(playerid, "pPhone"));
					SendMes(playerid, COLOR_BLUE, "[M] �� ������ ��������� �������, ��� �������� �����: %i", randphone);
					SetBizzInt(i, "money", BizzInfo[i][bMoney]);
					SetBizzInt(i, "product", BizzInfo[i][bProduct]);
					HomeList(playerid, i);
				}
			}
		}
		case D_BUY+1:
		{
		    if(!response) return true;
		    if(response)
		    {
		        new i = GetPVarInt(playerid, "PlayerBizzz"),till = BizzInfo[i][bTill];
		        if(GetMoney(playerid) < till*16) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ������������ �����!");
				GivePlayerMoney(playerid, -till*16);
				BizzInfo[i][bMoney] += till*16;
				BizzPay[i] += till*6;
				BizzInfo[i][bProduct] -= 10;
		    	Bank_Money(playerid);
			}
		}
		case D_RULER:
		{
		    if(!response) { DeletePVar(playerid, "PlayerLic"); return true; }
		    new p = GetPVarInt(playerid, "PlayerLic");
		    switch(listitem)
		    {
  				case 0:
  				{
  				    string = "";
		    		format(string, sizeof(string), "{FFFFFF}�������� %s\n���������� ��� ������������ ����� �� 1000$",GetName(playerid));
  					ShowPlayerDialog(p, D_RULER+1, 0," {6699FF}�������� | �����", string, "��������", "������");
				}
				case 1:
  				{
  				    string = "";
		    		format(string, sizeof(string), "{FFFFFF}�������� %s\n���������� ��� �������� ��\n������ ��������� �� 2500$",GetName(playerid));
  					ShowPlayerDialog(p,D_RULER+2,0,"{6699FF}�������� | ������ ��", string, "��������", "������");
				}
				case 2:
  				{
  				    string = "";
		    		format(string, sizeof(string), "{FFFFFF}�������� %s\n���������� ��� �������� ��\n��������� ��������� �� 10000$",GetName(playerid));
  					ShowPlayerDialog(p,D_RULER+3,0,"{6699FF}�������� | ��������� ��", string, "��������", "������");
				}
				case 3:
  				{
  				    string = "";
		    		format(string, sizeof(string), "{FFFFFF}�������� %s\n���������� ��� ����������\n�� ������� ������ �� 5000$",GetName(playerid));
  					ShowPlayerDialog(p,D_RULER+4,0,"{6699FF}�������� | ������", string, "��������", "������");
				}
			}
			SetPVarInt(p, "LicPlayer", playerid);
			DeletePVar(playerid, "PlayerLic");
		}
		case D_RULER+1:
		{
		    if(!response) {DeletePVar(playerid, "LicPlayer");return 1;}
		    new p = GetPVarInt(playerid, "LicPlayer");
		    if(GetPlayerMoney(playerid) < 1000)
			{
				SendClientMessage(playerid, COLOR_LIGHTRED,"[!] � ��� ������������ �������!");
				SendClientMessage(p, COLOR_LIGHTRED,"[!] � ������ ������������ �������!");
				DeletePVar(playerid, "LicPlayer");
				return 1;
			}
			GivePlayerMoney(playerid, -1000);
		    SendMes(playerid, COLOR_PAYCHEC, "[DL] �� ������ ������������ ����� � %s �� 1000$", GetName(p));
		    SendMes(p, COLOR_PAYCHEC, "[DL] %s ������ � ��� ������������ ����� �� 1000$", GetName(playerid));
		    cDataInfo[playerid][pLic][0] = 1;
			DeletePVar(playerid, "LicPlayer");
		}
		case D_RULER+2:
		{
		    if(!response) {DeletePVar(playerid, "LicPlayer");return 1;}
		    new p = GetPVarInt(playerid, "LicPlayer");
		    if(GetPlayerMoney(playerid) < 2500)
			{
				SendClientMessage(playerid, COLOR_LIGHTRED,"[!] � ��� ������������ �������!");
				SendClientMessage(p, COLOR_LIGHTRED,"[!] � ������ ������������ �������!");
				DeletePVar(playerid, "LicPlayer");
				return 1;
			}
			GivePlayerMoney(playerid, -2500);
		    SendMes(playerid, COLOR_PAYCHEC, "[DL] �� ������ �������� �� ������ ��������� � %s �� 2500$", GetName(p));
		    SendMes(p, COLOR_PAYCHEC, "[DL] %s ������ � ��� �������� �� ������ ��������� �� 2500$", GetName(playerid));
		    cDataInfo[playerid][pLic][1] = 1;
			DeletePVar(playerid, "LicPlayer");
		}
		case D_RULER+3:
		{
		    if(!response) {DeletePVar(playerid, "LicPlayer");return 1;}
		    new p = GetPVarInt(playerid, "LicPlayer");
		    if(GetPlayerMoney(playerid) < 10000)
			{
				SendClientMessage(playerid, COLOR_LIGHTRED,"[!] � ��� ������������ �������!");
				SendClientMessage(p, COLOR_LIGHTRED,"[!] � ������ ������������ �������!");
				DeletePVar(playerid, "LicPlayer");
				return 1;
			}
			GivePlayerMoney(playerid, -10000);
		    SendMes(playerid, COLOR_PAYCHEC, "[DL] �� ������ �������� �� ��������� ��������� � %s �� 5000$", GetName(p));
		    SendMes(p, COLOR_PAYCHEC, "[DL] %s ������ � ��� �������� �� ��������� ��������� �� 5000$", GetName(playerid));
		    cDataInfo[playerid][pLic][2] = 1;
			DeletePVar(playerid, "LicPlayer");
		}
		case D_RULER+4:
		{
		    if(!response) {DeletePVar(playerid, "LicPlayer");return 1;}
		    new p = GetPVarInt(playerid, "LicPlayer");
		    if(GetPlayerMoney(playerid) < 5000)
			{
				SendClientMessage(playerid, COLOR_GREEN,"� ��� ������������ �������!");
				SendClientMessage(p, COLOR_GREEN,"� ������ ������������ �������!");
				DeletePVar(playerid, "LicPlayer");
				return 1;
			}
			GivePlayerMoney(playerid, -5000);
		    SendMes(playerid, COLOR_PAYCHEC, "�� ������ ���������� �� ������� ������ � %s �� %d$", GetName(p));
		    SendMes(p, COLOR_PAYCHEC, "%s ������ � ��� ���������� �� ������� ������ �� %d$", GetName(playerid));
		    cDataInfo[playerid][pLic][3] = 1;
			DeletePVar(playerid, "LicPlayer");
		}
		case D_MONEYBACK:
		{
	        // BTS
		}
		case D_BANK:
		{
		    switch(listitem)
		    {
		        case 0:
		        {
		            query = "";
					format(query, sizeof(query), "SELECT * FROM `bank` WHERE `playerid` = '%d'", GetPVarInt(playerid, "pID"));
					mysql_function_query(Mysql, query, true, "LoadAccountBank", "d", playerid);
		        }
		        case 1: ShowPlayerDialog(playerid, D_BANK+2, d_Input, "{6699FF}������� ����", "{FFFFFF}������� �������� �����:", "�����", "�����");
		    }
		}
		case D_BANK+1:
		{
		    new text_1[64], account,text_2[64];
			if(sscanf(inputtext, "p<�>s[128]s[24]", text_1, text_2)) return true;
		    sscanf(text_2, "d", account); SetPVarInt(playerid, "AccountBank", account), SetPVarString(playerid, "AccountName", text_1);
			string = "";
			format(string, sizeof(string), "{FFFFFF}���� {81cb00}�%d{ffffff}\n����������: {81cb00}%s{ffffff}\n������� PIN-��� �����:", account, text_1);
			ShowPlayerDialog(playerid, D_BANK+3, d_Input, "{6699FF}���������� ����", string, "�����", "�����");
		}
		case D_BANK+2:
		{
		    if(!response) return true;
		    new name[16];
		    if(sscanf(inputtext,"s[16]",name)) return ShowPlayerDialog(playerid, D_BANK+2, d_Input, "{6699FF}������� ����", "{FFFFFF}������� �������� �����:", "�����", "�����");
			if(strlen(name) < 3 || strlen(name) > 16) return ShowPlayerDialog(playerid, D_BANK+2, d_Input, "{6699FF}������� ����", "{FFFFFF}������� �������� �����:", "�����", "�����");
			query = "";
			format(query, 256, "UPDATE `bank` SET `pin` = '0000' WHERE id = '%d'", GetPVarInt(playerid,"AccountBank"));
			mysql_function_query(Mysql, query, false, "", "");
			string = "";
			ShowPlayerDialog(playerid, 0, d_Box, "{6699FF}����", "{FFFFFF}�� ������� ����� ���� � �����.\n\n\
			��� ������� � ���� ����������� PIN-���: {ff0000}0000{ffffff}. ����� �����\n\
			������������ ����������� ������� ��� �� ����� �������.\n\
			��� ������� �������� ���� �� ������������� ���������.", "������", "");
			string = "";
			format(string, 128, "INSERT INTO `bank` (playerid, name) VALUES ('%i','%s')", GetPVarInt(playerid, "pID"), name);
			mysql_function_query(Mysql, string, false, "", "");
		}
		case D_BANK+3:
		{
		    if(!response) return Bank_Money(playerid);
		    new atext[16];
		    GetPVarString(playerid,"AccountName", atext, 16);
	     	string = ""; format(string, sizeof(string), "{ffffff}���� {81cb00}�%d{ffffff}\n����������: {81cb00}%s{ffffff}\n������� PIN-��� �����:", GetPVarInt(playerid,"AccountBank"),atext);
			if(!strlen(inputtext) || strlen(inputtext) < 3 || strlen(inputtext) > 16) return ShowPlayerDialog(playerid, D_BANK+3, d_Input, "{6699FF}����", string, "�����", "�����");
			query = "";
			format(query, sizeof(query), "SELECT * FROM `bank` WHERE `id` = '%d' and `pin` = '%s' LIMIT 1;", GetPVarInt(playerid,"AccountBank"),inputtext);
			mysql_function_query(Mysql, query, true, "GetPinAccountBank", "d", playerid);
		}
		case D_BANK+4:
		{
		    if(response)
		    {
	  			switch(listitem)
			    {
			        case 0:
			        {
						query = "";
						format(query, sizeof(query), "SELECT * FROM `bank` WHERE `id` = '%d'", GetPVarInt(playerid,"AccountBank"));
						mysql_function_query(Mysql, query, true, "InfoAccountBank", "d", playerid);
			        }
			        case 1:
			        {
			            query = "";
						format(query, sizeof(query), "SELECT * FROM `bank_log` WHERE `myid` = '%d' ORDER BY id DESC LIMIT 5", GetPVarInt(playerid,"AccountBank"));
						mysql_function_query(Mysql, query, true, "LogAccountBank", "d", playerid);
			        }
			        case 2: ShowPlayerDialog(playerid, D_BANK+5, d_Input, "{6699FF}����� ������", "{FFFFFF}������� �����:", "�����", "�����");
			        case 3: ShowPlayerDialog(playerid, D_BANK+6, d_Input, "{6699FF}�������� ������", "{FFFFFF}������� �����:", "��������", "�����");
			        case 4: ShowPlayerDialog(playerid, D_BANK+7, d_Input, "{6699FF}������� �������", "{FFFFFF}������� ����� �����, �� �������\n������ ����������� �������:", "�����", "�����");
			        case 5: ShowPlayerDialog(playerid, D_BANK+8, d_Input, "{6699FF}��������� PIN-����", "{FFFFFF}������� ����� PIN-���.\n����� �� 4 �� 20 ��������:", "�����", "�����");
				}
			}
		}
		case D_BANK+5:
		{
		    if(!response) { ShowPlayerDialog(playerid, D_BANK+4, d_List, "{6699FF}���������� ��������", "1. ���������� � �����\n2. ������� ��������\n3. ����� ������\n4. �������� ������\n5. ��������� �� ������ ����\n6. �������� PIN-���", "�������", "�����"); return true; }
			new money;
			if(sscanf(inputtext,"i",money)) return ShowPlayerDialog(playerid, D_BANK+5,DIALOG_STYLE_INPUT, "{6699FF}����� ������", "������� �����:", "�����", "������");
			if(money < 1 || money > 1000000) return ShowPlayerDialog(playerid,D_BANK+5,DIALOG_STYLE_INPUT, "{6699FF}����� ������", "������� �����:", "�����", "������");
            query = "";
			format(query, sizeof(query), "SELECT * FROM `bank` WHERE `id` = '%d' and `playerid` = '%d'", GetPVarInt(playerid,"AccountBank"), GetPVarInt(playerid, "pID"));
			mysql_function_query(Mysql, query, true, "GetBankMoney", "dd", playerid, money);
		}
		case D_BANK+6:
		{
            if(!response) {ShowPlayerDialog(playerid, D_BANK+4, d_List, "{6699FF}���������� ��������", "1. ���������� � �����\n2. ������� ��������\n3. ����� ������\n4. �������� ������\n5. ��������� �� ������ ����\n6. �������� PIN-���", "�������", "�����"); return true; }
			new money;
			if(sscanf(inputtext,"i",money)) return ShowPlayerDialog(playerid, D_BANK+6,DIALOG_STYLE_INPUT, "{6699FF}�������� ������", "������� �����:", "��������", "������");
			if(money < 1 || money > 1000000) return ShowPlayerDialog(playerid, D_BANK+6,DIALOG_STYLE_INPUT, "{6699FF}�������� ������", "������� �����:", "��������", "������");
            query = "";
			format(query, sizeof(query), "SELECT * FROM `bank` WHERE `id` = '%d' and `playerid` = '%d'", GetPVarInt(playerid,"AccountBank"), GetPVarInt(playerid, "pID"));
			mysql_function_query(Mysql, query, true, "PutBankMoney", "dd", playerid, money);
		}
		case D_BANK+7:
		{
		    if(!response) { ShowPlayerDialog(playerid, D_BANK+4, d_List, "{6699FF}���������� ��������", "1. ���������� � �����\n2. ������� ��������\n3. ����� ������\n4. �������� ������\n5. ��������� �� ������ ����\n6. �������� PIN-���", "�������", "�����"); return true;}
            new account;
			if(sscanf(inputtext,"i",account)) return ShowPlayerDialog(playerid, D_BANK+7,DIALOG_STYLE_INPUT, "{6699FF}������� �������", "������� ����� �����, �� �������\n������ ����������� �������:", "�����", "������");
			if(account < 1000 || account > 9999) return ShowPlayerDialog(playerid, D_BANK+7,DIALOG_STYLE_INPUT, "{6699FF}������� �������", "������� ����� �����, �� �������\n������ ����������� �������:", "�����", "������");
            SetPVarInt(playerid, "PayAccountBank", account);
            string = "";
			format(string, sizeof(string), "{ffffff}������� �� ����:\t{f26c00}�%d{ffffff}\n������� ����� ��� ��������:", account);
			ShowPlayerDialog(playerid, D_BANK+9,DIALOG_STYLE_INPUT, "{6699FF}������� �������", string, "���������", "�����");
		}
		case D_BANK+8:
		{
		    if(!response) { ShowPlayerDialog(playerid, D_BANK+4, d_List, "{6699FF}���������� ��������", "1. ���������� � �����\n2. ������� ��������\n3. ����� ������\n4. �������� ������\n5. ��������� �� ������ ����\n6. �������� PIN-���", "�������", "�����"); return true;}
		    new AtmPass[64];
			if(sscanf(inputtext,"s",AtmPass)) return ShowPlayerDialog(playerid, D_BANK+8,DIALOG_STYLE_INPUT, "{6699FF}��������� PIN-����", "������� ����� PIN-���.\n����� �� 4 �� 8 ����:", "��", "������");
			if(strlen(AtmPass) < 4 && strlen(AtmPass) > 20) return ShowPlayerDialog(playerid, D_BANK+8,DIALOG_STYLE_INPUT, "{6699FF}��������� PIN-����", "������� ����� PIN-���.\n����� �� 4 �� 8 ����:", "��", "������");
			query = "";
			format(query, 256, "UPDATE `bank` SET `pin` = '%s' WHERE id = '%d'", AtmPass, GetPVarInt(playerid,"AccountBank"));
			mysql_function_query(Mysql, query, false, "", "");
			string = "";
			format(string, sizeof(string), "{ffffff}����:\t\t\t\t{f26c00}�%d\n{ffffff}����� PIN-���:\t\t{f26c00}%s", GetPVarInt(playerid,"AccountBank"),AtmPass);
			ShowPlayerDialog(playerid, D_BANK+10,0, "{6699FF}��������� PIN-����", string, "�����", "�����");
		}
		case D_BANK+9:
		{
		    if(!response) { ShowPlayerDialog(playerid, D_BANK+4, d_List, "{6699FF}���������� ��������", "1. ���������� � �����\n2. ������� ��������\n3. ����� ������\n4. �������� ������\n5. ��������� �� ������ ����\n6. �������� PIN-���", "�������", "�����"); return true;}
            new money;
            string = "";
			format(string, sizeof(string), "{ffffff}������� �� ����:\t{f26c00}�%d{ffffff}\n������� ����� ��� ��������:", GetPVarInt(playerid,"PayAccountBank"));
			if(sscanf(inputtext,"i",money)) return ShowPlayerDialog(playerid, D_BANK+9,DIALOG_STYLE_INPUT, "{6699FF}������� �������", string, "���������", "������");
			if(money < 1 || money > 1000000) return ShowPlayerDialog(playerid, D_BANK+9,DIALOG_STYLE_INPUT, "{6699FF}������� �������", string, "���������", "������");
            query = "";
			format(query, sizeof(query), "SELECT * FROM `bank` WHERE `id` = '%d'", GetPVarInt(playerid,"AccountBank"));
			mysql_function_query(Mysql, query, true, "PayAccountBank", "dd", playerid,money);
		}
		case D_BANK+10:
		{
		    if(response) return ShowPlayerDialog(playerid, D_BANK+4, d_List, "{6699FF}���������� ��������", "1. ���������� � �����\n2. ������� ��������\n3. ����� ������\n4. �������� ������\n5. ��������� �� ������ ����\n6. �������� PIN-���", "�������", "�����");
		}
		case D_BANK+11:
		{
		    if(!response) return true;
		    if(CheckNewBank[playerid] == 1)
		    {
			    query = "";
				format(query,128,"INSERT INTO `bank` (fix,playerid,name) VALUES ('1','%i','�������� ����')", GetPVarInt(playerid, "pID"));
				mysql_function_query(Mysql, query, false, "", "");
				SendClientMessage(playerid, -1,"[B] �� ������� �������� ���� � �����!");
				SendClientMessage(playerid, -1,"[B] ��� PIN-��� �� ��������� 0000");
				CheckNewBank[playerid] = 0;
				CheckBank(playerid);
			}
			else SendClientMessage(playerid, -1,"[B] � ��� ��� ���� �������� ���� � �����!");
		}
	}
	return true;
}

stock LoadMySql()
{
	mysql_set_charset("cp1251_general_ci");
	mysql_function_query(Mysql, "SET NAMES 'cp1251'", false, "", "");
	mysql_function_query(Mysql, "SELECT * FROM `"TABLE_BIZZ"` ORDER BY `"TABLE_BIZZ"`.`id` ASC", true, "LoadOrg", "");
	mysql_function_query(Mysql, "SELECT * FROM `"TABLE_ATM"`", true, "LoadATM", "");
 	mysql_function_query(Mysql, "SELECT * FROM `"TABLE_CARS"`", true, "LoadVehicle", "");
 	mysql_function_query(Mysql, "SELECT * FROM `"TABLE_ENTERS"`", true, "LoadEnters", "");
 	mysql_function_query(Mysql, "SELECT * FROM `"TABLE_HOUSE"`", true, "LoadHouse", "");
 	mysql_function_query(Mysql, "SELECT * FROM `"TABLE_GPS"`", true, "LoadGPS", "");
	return true;
}

stock AdvertList(playerid)
{
	new str[50];
	string = "";
	for(new i = 1; i <= TOTALADVERT;i++)
	{
		format(str, sizeof(str), "�%i - �������: %s\n",i, AI[i][aName]);
		strcat(string, str);
	}
	if(TOTALADVERT == 0) return ShowPlayerDialog(playerid, 0, d_Box, "{6699FF}����������", "{FFFFFF}��� ���������� ��� ��������.", "�����", "");
	ShowPlayerDialog(playerid, D_SMI+5, d_List, "{6699FF}����������", string, "�������", "�����");
	return true;
}

stock CreateDroppedInv(zzz1, Float:gPosX, Float:gPosY, Float:gPosZ)
{
	if(zzz1 == 0) return true;
	new f = total_vehicles_from_files+1;
	for(new a = 0; a < total_vehicles_from_files; a++)
	{
		if(dInvData[a][ObjPos][0] == 0.0)
		{
			f = a;
			break;
		}
	}
	if(f > total_vehicles_from_files) return true;
	dInvData[f][ObjData] = zzz1;
	dInvData[f][ObjPos][0] = gPosX;
	dInvData[f][ObjPos][1] = gPosY;
	dInvData[f][ObjPos][2] = gPosZ;
	new x_l = random(2);
	new y_l = random(2);
	dInvData[f][ObjID] = CreateDynamicObject(InvObjects[id], dInvData[f][ObjPos][0]+x_l, dInvData[f][ObjPos][1]+y_l, dInvData[f][ObjPos][2]-1.0, 0.0, 360.0, 250.0);
	if(zzz1 == 78) SetDynamicObjectMaterial(dInvData[f][ObjID], 0, 2060, "cj_ammo", "CJ_CANVAS2", 0);
	return true;
}

stock CreateDroppedInvWorld(zzz, Float:x, Float:y, Float:z)
{
	if(zzz == 0) return 1;
	new f = total_vehicles_from_files+1;
	for(new a = 0; a < total_vehicles_from_files; a++)
	{
		if(dInvData[a][ObjPos][0] == 0.0)
		{
			f = a;
			break;
		}
	}
	dInvData[f][ObjData] = zzz;
	dInvData[f][ObjPos][0] = x;
	dInvData[f][ObjPos][1] = y;
	dInvData[f][ObjPos][2] = z;
	dInvData[f][ObjID] = CreateDynamicObject(InvObjects[dInvData[f][ObjData]], dInvData[f][ObjPos][0]/*+x_l*/, dInvData[f][ObjPos][1]/*+y_l*/, dInvData[f][ObjPos][2], 0.0, 360.0, 300.0);
	if(zzz == 78) SetDynamicObjectMaterial(dInvData[f][ObjID], 0, 2060, "cj_ammo", "CJ_CANVAS2", 0);
	return 1;
}

stock LoadMenu()
{
	SkinMenu[0] = CreateMenu("Choose", 1, 20.0, 130.0, 200.0);
	AddMenuItem(SkinMenu[0],0,"NEXT");
	AddMenuItem(SkinMenu[0],0,"BACK");
	AddMenuItem(SkinMenu[0],0,"SPAWN");
	
	SkinMenu[1] = CreateMenu("Choose", 1, 20.0, 130.0, 200.0);
	AddMenuItem(SkinMenu[1],0,"BACK");
	AddMenuItem(SkinMenu[1],0,"NEXT");
	AddMenuItem(SkinMenu[1],0,"SPAWN");
	return true;
}

stock LoadData(playerid)
{
    Mobile[playerid] = -1;
    return true;
}

stock LoadMap()
{
	//WORK
	query = "";
	format(query, 128, "������: {e2ba00}%d �� 500",TOTALCARGO);
	CargoText[0] = Create3DTextLabel(query, -1, 2231.0959, -2285.3909, 14.3751, 8.0, 0, 0);
	//HOUSES
	CreateObject(19168, 1797.8475, -1881.6311, 15.0892,   90.00, 0.00, 0.00);
    CreateObject(19169, 1799.3453, -1881.6311, 15.0892,   90.00, 0.00, 0.00);
    CreateObject(19170, 1797.8475, -1881.6311, 13.5896,   90.00, 0.00, 0.00);
    CreateObject(19171, 1799.3472, -1881.6311, 13.5896,   90.00, 0.00, 0.00);
	//less
	for(new i; i < sizeof(Wood); i++) gWood[i] = CreateObject(616, Wood[i][0], Wood[i][1], Wood[i][2],0.0000000,0.0000000,0.0000000);

	#include TRNQLT\Jcts.inc
	CreateDynamic3DTextLabel("{FFFF00}���� �� ������", -1, 370.2711, 178.5977, 1009.2657, 10.0);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    Invite_JOB[i] = CreateDynamicCP(370.1880, 187.5764, 1008.3893, 1.0, -1, -1, i, 20.0);
	}
	//A_Shop[0] = Create3DTextLabel("{FFFFFF}�������� ������\n���������: {CC0000}�������",0xFFFFFFFF, 1764.6361,-1885.7416,14.8846,25.0,0,0);
	return true;
}

stock LoadTextDraw(playerid)
{
	//
    RegAuth[0] = CreatePlayerTextDraw(playerid, 189.000000, 181.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[0], 0);
	PlayerTextDrawFont(playerid, RegAuth[0], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[0], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[0], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[0], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[0], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[0], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[0], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[0], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[0], 261.000000, 210.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[0], 0);

	RegAuth[1] = CreatePlayerTextDraw(playerid, 184.000000, 164.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[1], 0);
	PlayerTextDrawFont(playerid, RegAuth[1], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[1], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[1], 387389951);
	PlayerTextDrawSetOutline(playerid, RegAuth[1], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[1], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[1], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[1], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[1], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[1], 31.000000, 31.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[1], 0);

	RegAuth[2] = CreatePlayerTextDraw(playerid, 424.000000, 164.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[2], 0);
	PlayerTextDrawFont(playerid, RegAuth[2], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[2], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[2], 387389951);
	PlayerTextDrawSetOutline(playerid, RegAuth[2], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[2], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[2], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[2], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[2], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[2], 31.000000, 31.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[2], 0);

	RegAuth[3] = CreatePlayerTextDraw(playerid, 197.000000, 169.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[3], 0);
	PlayerTextDrawFont(playerid, RegAuth[3], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[3], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[3], 387389951);
	PlayerTextDrawSetOutline(playerid, RegAuth[3], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[3], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[3], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[3], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[3], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[3], 243.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[3], 0);

	RegAuth[4] = CreatePlayerTextDraw(playerid, 184.000000, 377.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[4], 0);
	PlayerTextDrawFont(playerid, RegAuth[4], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[4], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[4], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[4], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[4], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[4], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[4], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[4], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[4], 31.000000, 31.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[4], 0);

	RegAuth[5] = CreatePlayerTextDraw(playerid, 424.000000, 377.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[5], 0);
	PlayerTextDrawFont(playerid, RegAuth[5], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[5], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[5], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[5], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[5], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[5], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[5], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[5], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[5], 31.000000, 31.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[5], 0);

	RegAuth[6] = CreatePlayerTextDraw(playerid, 197.000000, 383.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[6], 0);
	PlayerTextDrawFont(playerid, RegAuth[6], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[6], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[6], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[6], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[6], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[6], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[6], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[6], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[6], 243.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[6], 0);

	RegAuth[7] = CreatePlayerTextDraw(playerid, 190.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[7], 0);
	PlayerTextDrawFont(playerid, RegAuth[7], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[7], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[7], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[7], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[7], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[7], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[7], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[7], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[7], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[7], 0);

	RegAuth[8] = CreatePlayerTextDraw(playerid, 191.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[8], 0);
	PlayerTextDrawFont(playerid, RegAuth[8], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[8], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[8], 387389951);
	PlayerTextDrawSetOutline(playerid, RegAuth[8], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[8], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[8], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[8], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[8], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[8], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[8], 0);

	RegAuth[9] = CreatePlayerTextDraw(playerid, 429.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[9], 0);
	PlayerTextDrawFont(playerid, RegAuth[9], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[9], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[9], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[9], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[9], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[9], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[9], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[9], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[9], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[9], 0);

	RegAuth[10] = CreatePlayerTextDraw(playerid, 428.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[10], 0);
	PlayerTextDrawFont(playerid, RegAuth[10], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[10], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[10], 387389951);
	PlayerTextDrawSetOutline(playerid, RegAuth[10], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[10], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[10], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[10], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[10], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[10], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[10], 0);

	RegAuth[11] = CreatePlayerTextDraw(playerid, 218.000000, 174.000000, "Registration");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[11], 286331903);
	PlayerTextDrawFont(playerid, RegAuth[11], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[11], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[11], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[11], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[11], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[11], 0);

	RegAuth[12] = CreatePlayerTextDraw(playerid, 293.000000, 174.000000, "Choose skin");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[12], 286331903);
	PlayerTextDrawFont(playerid, RegAuth[12], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[12], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[12], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[12], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[12], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[12], 0);

	RegAuth[13] = CreatePlayerTextDraw(playerid, 364.000000, 174.000000, "Authorization");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[13], 286331903);
	PlayerTextDrawFont(playerid, RegAuth[13], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[13], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[13], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[13], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[13], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[13], 0);

	RegAuth[15] = CreatePlayerTextDraw(playerid, 205.000000, 184.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[15], 0);
	PlayerTextDrawFont(playerid, RegAuth[15], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[15], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[15], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[15], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[15], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[15], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[15], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[15], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[15], 80.000000, 1.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[15], 0);

	RegAuth[16] = CreatePlayerTextDraw(playerid, 294.000000, 196.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[16], 0);
	PlayerTextDrawFont(playerid, RegAuth[16], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[16], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[16], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[16], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[16], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[16], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[16], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[16], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[16], 50.000000, 50.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[16], 0);

	RegAuth[17] = CreatePlayerTextDraw(playerid, 296.000000, 196.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[17], 0);
	PlayerTextDrawFont(playerid, RegAuth[17], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[17], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[17], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[17], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[17], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[17], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[17], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[17], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[17], 50.000000, 50.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[17], 0);

	RegAuth[18] = CreatePlayerTextDraw(playerid, 300.000000, 200.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[18], 0);
	PlayerTextDrawFont(playerid, RegAuth[18], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[18], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[18], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[18], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[18], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[18], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[18], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[18], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[18], 42.000000, 42.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[18], 0);

	RegAuth[19] = CreatePlayerTextDraw(playerid, 298.000000, 200.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[19], 0);
	PlayerTextDrawFont(playerid, RegAuth[19], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[19], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[19], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[19], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[19], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[19], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[19], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[19], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[19], 42.000000, 42.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[19], 0);

	RegAuth[20] = CreatePlayerTextDraw(playerid, 313.000000, 205.000000, "T");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[20], -1523897601);
	PlayerTextDrawFont(playerid, RegAuth[20], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[20], 0.510000, 3.000000);
	PlayerTextDrawColor(playerid, RegAuth[20], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[20], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[20], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[20], 0);

	RegAuth[21] = CreatePlayerTextDraw(playerid, 343.000000, 334.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[21], 0);
	PlayerTextDrawFont(playerid, RegAuth[21], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[21], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[21], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[21], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[21], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[21], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[21], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[21], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[21], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[21], 0);

	RegAuth[22] = CreatePlayerTextDraw(playerid, 261.000000, 244.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[22], 0);
	PlayerTextDrawFont(playerid, RegAuth[22], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[22], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[22], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[22], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[22], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[22], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[22], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[22], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[22], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[22], 0);

	RegAuth[23] = CreatePlayerTextDraw(playerid, 277.000000, 249.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[23], 0);
	PlayerTextDrawFont(playerid, RegAuth[23], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[23], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[23], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[23], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[23], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[23], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[23], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[23], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[23], 83.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[23], 0);

	RegAuth[24] = CreatePlayerTextDraw(playerid, 343.000000, 244.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[24], 0);
	PlayerTextDrawFont(playerid, RegAuth[24], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[24], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[24], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[24], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[24], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[24], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[24], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[24], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[24], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[24], 0);

	RegAuth[25] = CreatePlayerTextDraw(playerid, 343.000000, 274.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[25], 0);
	PlayerTextDrawFont(playerid, RegAuth[25], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[25], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[25], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[25], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[25], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[25], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[25], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[25], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[25], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[25], 0);

	RegAuth[26] = CreatePlayerTextDraw(playerid, 277.000000, 279.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[26], 0);
	PlayerTextDrawFont(playerid, RegAuth[26], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[26], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[26], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[26], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[26], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[26], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[26], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[26], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[26], 83.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[26], 0);

	RegAuth[27] = CreatePlayerTextDraw(playerid, 261.000000, 274.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[27], 0);
	PlayerTextDrawFont(playerid, RegAuth[27], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[27], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[27], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[27], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[27], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[27], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[27], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[27], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[27], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[27], 0);

	RegAuth[28] = CreatePlayerTextDraw(playerid, 261.000000, 304.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[28], 0);
	PlayerTextDrawFont(playerid, RegAuth[28], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[28], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[28], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[28], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[28], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[28], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[28], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[28], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[28], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[28], 0);

	RegAuth[29] = CreatePlayerTextDraw(playerid, 277.000000, 309.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[29], 0);
	PlayerTextDrawFont(playerid, RegAuth[29], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[29], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[29], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[29], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[29], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[29], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[29], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[29], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[29], 83.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[29], 0);

	RegAuth[30] = CreatePlayerTextDraw(playerid, 343.000000, 304.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[30], 0);
	PlayerTextDrawFont(playerid, RegAuth[30], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[30], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[30], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[30], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[30], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[30], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[30], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[30], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[30], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[30], 0);

	RegAuth[31] = CreatePlayerTextDraw(playerid, 277.000000, 339.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[31], 0);
	PlayerTextDrawFont(playerid, RegAuth[31], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[31], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[31], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[31], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[31], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[31], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[31], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[31], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[31], 83.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[31], 0);

	RegAuth[32] = CreatePlayerTextDraw(playerid, 261.000000, 334.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[32], 0);
	PlayerTextDrawFont(playerid, RegAuth[32], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[32], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[32], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[32], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[32], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[32], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[32], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[32], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[32], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[32], 0);

	RegAuth[33] = CreatePlayerTextDraw(playerid, 281.000000, 364.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[33], 0);
	PlayerTextDrawFont(playerid, RegAuth[33], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[33], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[33], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[33], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[33], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[33], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[33], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[33], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[33], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[33], 0);

	RegAuth[34] = CreatePlayerTextDraw(playerid, 323.000000, 364.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[34], 0);
	PlayerTextDrawFont(playerid, RegAuth[34], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[34], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[34], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[34], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[34], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[34], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[34], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[34], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[34], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[34], 0);

	RegAuth[35] = CreatePlayerTextDraw(playerid, 297.000000, 369.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[35], 0);
	PlayerTextDrawFont(playerid, RegAuth[35], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[35], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[35], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[35], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[35], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[35], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[35], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[35], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[35], 43.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[35], 0);

	RegAuth[36] = CreatePlayerTextDraw(playerid, 320.000000, 254.000000, "Password");
	PlayerTextDrawAlignment(playerid, RegAuth[36], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[36], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[36], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[36], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[36], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[36], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[36], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[36], 1);

	RegAuth[37] = CreatePlayerTextDraw(playerid, 320.000000, 283.000000, "e-mail");
	PlayerTextDrawAlignment(playerid, RegAuth[37], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[37], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[37], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[37], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[37], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[37], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[37], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[37], 1);

	RegAuth[38] = CreatePlayerTextDraw(playerid, 320.000000, 313.000000, "sex");
	PlayerTextDrawAlignment(playerid, RegAuth[38], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[38], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[38], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[38], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[38], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[38], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[38], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[38], 1);

	RegAuth[39] = CreatePlayerTextDraw(playerid, 320.000000, 343.000000, "Referal");
	PlayerTextDrawAlignment(playerid, RegAuth[39], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[39], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[39], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[39], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[39], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[39], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[39], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[39], 1);

	RegAuth[40] = CreatePlayerTextDraw(playerid, 319.000000, 373.000000, "next");
	PlayerTextDrawAlignment(playerid, RegAuth[40], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[40], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[40], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[40], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[40], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[40], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[40], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[40], 1);

	RegAuth[41] = CreatePlayerTextDraw(playerid, 247.000000, 248.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[41], 0);
	PlayerTextDrawFont(playerid, RegAuth[41], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[41], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[41], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[41], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[41], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[41], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[41], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[41], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[41], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[41], 0);

	RegAuth[42] = CreatePlayerTextDraw(playerid, 248.000000, 248.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[42], 0);
	PlayerTextDrawFont(playerid, RegAuth[42], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[42], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[42], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[42], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[42], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[42], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[42], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[42], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[42], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[42], 0);

	RegAuth[43] = CreatePlayerTextDraw(playerid, 247.000000, 278.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[43], 0);
	PlayerTextDrawFont(playerid, RegAuth[43], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[43], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[43], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[43], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[43], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[43], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[43], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[43], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[43], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[43], 0);

	RegAuth[44] = CreatePlayerTextDraw(playerid, 248.000000, 278.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[44], 0);
	PlayerTextDrawFont(playerid, RegAuth[44], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[44], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[44], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[44], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[44], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[44], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[44], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[44], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[44], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[44], 0);

	RegAuth[45] = CreatePlayerTextDraw(playerid, 247.000000, 308.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[45], 0);
	PlayerTextDrawFont(playerid, RegAuth[45], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[45], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[45], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[45], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[45], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[45], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[45], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[45], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[45], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[45], 0);

	RegAuth[46] = CreatePlayerTextDraw(playerid, 247.000000, 338.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[46], 0);
	PlayerTextDrawFont(playerid, RegAuth[46], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[46], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[46], -1523897601);
	PlayerTextDrawSetOutline(playerid, RegAuth[46], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[46], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[46], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[46], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[46], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[46], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[46], 0);

	RegAuth[47] = CreatePlayerTextDraw(playerid, 248.000000, 308.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[47], 0);
	PlayerTextDrawFont(playerid, RegAuth[47], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[47], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[47], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[47], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[47], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[47], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[47], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[47], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[47], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[47], 0);

	RegAuth[48] = CreatePlayerTextDraw(playerid, 248.000000, 338.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, RegAuth[48], 0);
	PlayerTextDrawFont(playerid, RegAuth[48], 4);
	PlayerTextDrawLetterSize(playerid, RegAuth[48], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, RegAuth[48], 286331903);
	PlayerTextDrawSetOutline(playerid, RegAuth[48], 0);
	PlayerTextDrawSetProportional(playerid, RegAuth[48], 1);
	PlayerTextDrawSetShadow(playerid, RegAuth[48], 1);
	PlayerTextDrawUseBox(playerid, RegAuth[48], 1);
	PlayerTextDrawBoxColor(playerid, RegAuth[48], 255);
	PlayerTextDrawTextSize(playerid, RegAuth[48], 22.000000, 22.000000);
	PlayerTextDrawSetSelectable(playerid, RegAuth[48], 0);

	RegAuth[49] = CreatePlayerTextDraw(playerid, 258.000000, 253.000000, "1");
	PlayerTextDrawAlignment(playerid, RegAuth[49], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[49], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[49], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[49], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[49], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[49], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[49], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[49], 0);

	RegAuth[50] = CreatePlayerTextDraw(playerid, 258.000000, 283.000000, "2");
	PlayerTextDrawAlignment(playerid, RegAuth[50], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[50], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[50], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[50], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[50], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[50], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[50], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[50], 0);

	RegAuth[51] = CreatePlayerTextDraw(playerid, 258.000000, 313.000000, "3");
	PlayerTextDrawAlignment(playerid, RegAuth[51], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[51], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[51], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[51], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[51], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[51], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[51], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[51], 0);

	RegAuth[52] = CreatePlayerTextDraw(playerid, 258.000000, 343.000000, "4");
	PlayerTextDrawAlignment(playerid, RegAuth[52], 2);
	PlayerTextDrawBackgroundColor(playerid, RegAuth[52], 387389951);
	PlayerTextDrawFont(playerid, RegAuth[52], 2);
	PlayerTextDrawLetterSize(playerid, RegAuth[52], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, RegAuth[52], -1);
	PlayerTextDrawSetOutline(playerid, RegAuth[52], 1);
	PlayerTextDrawSetProportional(playerid, RegAuth[52], 1);
	PlayerTextDrawSetSelectable(playerid, RegAuth[52], 0);
	//
	ChooseSkin[0] = CreatePlayerTextDraw(playerid, 169.000000, 181.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[0], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[0], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[0], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[0], 286331903);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[0], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[0], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[0], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[0], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[0], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[0], 301.000000, 200.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[0], 0);

	ChooseSkin[1] = CreatePlayerTextDraw(playerid, 164.000000, 164.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[1], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[1], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[1], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[1], 387389951);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[1], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[1], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[1], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[1], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[1], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[1], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[1], 0);

	ChooseSkin[2] = CreatePlayerTextDraw(playerid, 444.000000, 164.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[2], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[2], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[2], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[2], 387389951);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[2], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[2], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[2], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[2], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[2], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[2], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[2], 0);

	ChooseSkin[3] = CreatePlayerTextDraw(playerid, 177.000000, 169.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[3], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[3], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[3], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[3], 387389951);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[3], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[3], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[3], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[3], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[3], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[3], 283.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[3], 0);

	ChooseSkin[4] = CreatePlayerTextDraw(playerid, 164.000000, 367.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[4], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[4], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[4], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[4], 286331903);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[4], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[4], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[4], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[4], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[4], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[4], 31.000000, 31.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[4], 0);

	ChooseSkin[5] = CreatePlayerTextDraw(playerid, 444.000000, 367.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[5], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[5], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[5], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[5], 286331903);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[5], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[5], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[5], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[5], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[5], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[5], 31.000000, 31.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[5], 0);

	ChooseSkin[6] = CreatePlayerTextDraw(playerid, 177.000000, 373.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[6], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[6], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[6], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[6], 286331903);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[6], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[6], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[6], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[6], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[6], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[6], 283.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[6], 0);

	ChooseSkin[7] = CreatePlayerTextDraw(playerid, 170.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[7], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[7], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[7], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[7], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[7], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[7], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[7], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[7], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[7], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[7], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[7], 0);

	ChooseSkin[8] = CreatePlayerTextDraw(playerid, 171.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[8], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[8], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[8], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[8], 387389951);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[8], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[8], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[8], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[8], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[8], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[8], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[8], 0);

	ChooseSkin[9] = CreatePlayerTextDraw(playerid, 449.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[9], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[9], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[9], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[9], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[9], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[9], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[9], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[9], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[9], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[9], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[9], 0);

	ChooseSkin[10] = CreatePlayerTextDraw(playerid, 448.000000, 169.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[10], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[10], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[10], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[10], 387389951);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[10], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[10], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[10], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[10], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[10], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[10], 21.000000, 21.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[10], 0);

	ChooseSkin[11] = CreatePlayerTextDraw(playerid, 198.000000, 174.000000, "Registration");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[11], 286331903);
	PlayerTextDrawFont(playerid, ChooseSkin[11], 2);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[11], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, ChooseSkin[11], -1);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[11], 1);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[11], 1);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[11], 0);

	ChooseSkin[12] = CreatePlayerTextDraw(playerid, 293.000000, 174.000000, "Choose skin");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[12], 286331903);
	PlayerTextDrawFont(playerid, ChooseSkin[12], 2);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[12], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, ChooseSkin[12], -1);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[12], 1);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[12], 1);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[12], 0);

	ChooseSkin[13] = CreatePlayerTextDraw(playerid, 384.000000, 174.000000, "Authorization");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[13], 286331903);
	PlayerTextDrawFont(playerid, ChooseSkin[13], 2);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[13], 0.180000, 1.100000);
	PlayerTextDrawColor(playerid, ChooseSkin[13], -1);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[13], 1);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[13], 1);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[13], 0);

	ChooseSkin[14] = CreatePlayerTextDraw(playerid, 241.000000, 218.000000, "����� TextDraw");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[14], 286331903);
	PlayerTextDrawFont(playerid, ChooseSkin[14], 5);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[14], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[14], -1);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[14], 1);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[14], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[14], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[14], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[14], 150.000000, 140.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[14], 0);

	ChooseSkin[15] = CreatePlayerTextDraw(playerid, 277.000000, 184.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[15], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[15], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[15], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[15], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[15], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[15], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[15], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[15], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[15], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[15], 80.000000, 1.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[15], 0);

	ChooseSkin[16] = CreatePlayerTextDraw(playerid, 294.000000, 189.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[16], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[16], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[16], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[16], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[16], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[16], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[16], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[16], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[16], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[16], 50.000000, 50.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[16], 0);

	ChooseSkin[17] = CreatePlayerTextDraw(playerid, 296.000000, 189.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[17], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[17], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[17], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[17], 286331903);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[17], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[17], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[17], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[17], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[17], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[17], 50.000000, 50.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[17], 0);

	ChooseSkin[18] = CreatePlayerTextDraw(playerid, 300.000000, 193.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[18], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[18], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[18], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[18], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[18], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[18], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[18], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[18], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[18], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[18], 42.000000, 42.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[18], 0);

	ChooseSkin[19] = CreatePlayerTextDraw(playerid, 298.000000, 193.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[19], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[19], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[19], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[19], 286331903);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[19], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[19], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[19], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[19], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[19], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[19], 42.000000, 42.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[19], 0);

	ChooseSkin[20] = CreatePlayerTextDraw(playerid, 313.000000, 198.000000, "R");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[20], -1523897601);
	PlayerTextDrawFont(playerid, ChooseSkin[20], 2);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[20], 0.509999, 3.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[20], 286331903);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[20], 1);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[20], 1);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[20], 0);

	ChooseSkin[21] = CreatePlayerTextDraw(playerid, 350.000000, 354.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[21], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[21], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[21], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[21], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[21], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[21], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[21], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[21], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[21], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[21], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[21], 0);

	ChooseSkin[22] = CreatePlayerTextDraw(playerid, 254.000000, 354.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[22], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[22], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[22], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[22], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[22], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[22], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[22], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[22], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[22], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[22], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[22], 0);

	ChooseSkin[23] = CreatePlayerTextDraw(playerid, 264.000000, 364.000000, "ld_beat:left");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[23], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[23], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[23], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[23], 387389951);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[23], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[23], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[23], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[23], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[23], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[23], 10.000000, 11.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[23], 0);

	ChooseSkin[24] = CreatePlayerTextDraw(playerid, 361.000000, 364.000000, "ld_beat:right");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[24], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[24], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[24], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[24], 387389951);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[24], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[24], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[24], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[24], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[24], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[24], 10.000000, 11.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[24], 0);

	ChooseSkin[33] = CreatePlayerTextDraw(playerid, 281.000000, 354.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[33], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[33], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[33], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[33], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[33], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[33], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[33], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[33], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[33], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[33], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[33], 0);

	ChooseSkin[34] = CreatePlayerTextDraw(playerid, 323.000000, 354.000000, "ld_beat:chit");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[34], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[34], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[34], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[34], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[34], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[34], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[34], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[34], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[34], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[34], 31.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[34], 0);

	ChooseSkin[35] = CreatePlayerTextDraw(playerid, 297.000000, 359.000000, "ld_spac:white");
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[35], 0);
	PlayerTextDrawFont(playerid, ChooseSkin[35], 4);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[35], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ChooseSkin[35], -1523897601);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[35], 0);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[35], 1);
	PlayerTextDrawSetShadow(playerid, ChooseSkin[35], 1);
	PlayerTextDrawUseBox(playerid, ChooseSkin[35], 1);
	PlayerTextDrawBoxColor(playerid, ChooseSkin[35], 255);
	PlayerTextDrawTextSize(playerid, ChooseSkin[35], 43.000000, 20.000000);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[35], 0);

	ChooseSkin[40] = CreatePlayerTextDraw(playerid, 320.000000, 362.000000, "CHOOSE");
	PlayerTextDrawAlignment(playerid, ChooseSkin[40], 2);
	PlayerTextDrawBackgroundColor(playerid, ChooseSkin[40], 387389951);
	PlayerTextDrawFont(playerid, ChooseSkin[40], 2);
	PlayerTextDrawLetterSize(playerid, ChooseSkin[40], 0.200000, 1.299999);
	PlayerTextDrawColor(playerid, ChooseSkin[40], -1);
	PlayerTextDrawSetOutline(playerid, ChooseSkin[40], 1);
	PlayerTextDrawSetProportional(playerid, ChooseSkin[40], 1);
	PlayerTextDrawSetSelectable(playerid, ChooseSkin[40], 0);
	//cargo
	AmountDraw[playerid] = TextDrawCreate(500.5, 190.0, "_");
 	TextDrawBackgroundColor(AmountDraw[playerid], COLOR_BLACK);
 	TextDrawLetterSize(AmountDraw[playerid],0.200000,1.000000);
 	TextDrawFont(AmountDraw[playerid], 2);
 	TextDrawColor(AmountDraw[playerid], COLOR_BLUE);
 	TextDrawSetOutline(AmountDraw[playerid], 1);
 	TextDrawSetProportional(AmountDraw[playerid],1);
 	TextDrawSetShadow(AmountDraw[playerid],1);
	//less
	ProcentDraw[playerid] = TextDrawCreate(500.5, 190.0, "_");
 	TextDrawBackgroundColor(ProcentDraw[playerid], COLOR_BLACK);
 	TextDrawLetterSize(ProcentDraw[playerid],0.200000,1.000000);
 	TextDrawFont(ProcentDraw[playerid], 2);
 	TextDrawColor(ProcentDraw[playerid], COLOR_BLUE);
 	TextDrawSetOutline(ProcentDraw[playerid], 1);
 	TextDrawSetProportional(ProcentDraw[playerid],1);
 	TextDrawSetShadow(ProcentDraw[playerid],1);

 	AmountLDraw[playerid] = TextDrawCreate(500.5, 200.0, "_");
 	TextDrawBackgroundColor(AmountLDraw[playerid], COLOR_BLACK);
 	TextDrawLetterSize(AmountLDraw[playerid],0.200000,1.000000);
 	TextDrawFont(AmountLDraw[playerid], 2);
 	TextDrawColor(AmountLDraw[playerid], COLOR_BLUE);
 	TextDrawSetOutline(AmountLDraw[playerid], 1);
 	TextDrawSetProportional(AmountLDraw[playerid],1);
 	TextDrawSetShadow(AmountLDraw[playerid],1);

	Speed[playerid][0] = TextDrawCreate(573.000000, 358.000000, "IIIIIIIIIIIIIII");
	TextDrawBackgroundColor(Speed[playerid][0], -1);
	TextDrawLetterSize(Speed[playerid][0], 0.419999, 1.600000);
	TextDrawColor(Speed[playerid][0], 0xFFFFFF33);
	TextDrawSetShadow(Speed[playerid][0], 0);

	Speed[playerid][1] = TextDrawCreate(570.000000, 362.000000, "_");
	TextDrawAlignment(Speed[playerid][1], 2);
	TextDrawBackgroundColor(Speed[playerid][1], 255);
	TextDrawLetterSize(Speed[playerid][1], 0.419999, 1.000000);
	TextDrawColor(Speed[playerid][1], -1);
	TextDrawSetShadow(Speed[playerid][1], 0);
	TextDrawUseBox(Speed[playerid][1], 1);
	TextDrawBoxColor(Speed[playerid][1], COLOR_BOX);
	TextDrawTextSize(Speed[playerid][1], 0.000000, -124.000000);

	Speed[playerid][2] = TextDrawCreate(530.000000, 359.000000, "SPEED:");
	TextDrawAlignment(Speed[playerid][2], 2);
	TextDrawBackgroundColor(Speed[playerid][2], 255);
	TextDrawLetterSize(Speed[playerid][2], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][2], -1);
	TextDrawSetShadow(Speed[playerid][2], 1);

	Speed[playerid][3] = TextDrawCreate(570.000000, 375.000000, "_");
	TextDrawAlignment(Speed[playerid][3], 2);
	TextDrawBackgroundColor(Speed[playerid][3], 255);
	TextDrawLetterSize(Speed[playerid][3], 0.419999, 1.000000);
	TextDrawColor(Speed[playerid][3], -1);
	TextDrawSetShadow(Speed[playerid][3], 0);
	TextDrawUseBox(Speed[playerid][3], 1);
	TextDrawBoxColor(Speed[playerid][3], COLOR_BOX);
	TextDrawTextSize(Speed[playerid][3], 0.000000, -124.000000);

	Speed[playerid][4] = TextDrawCreate(550.000000, 372.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][4], 255);
	TextDrawLetterSize(Speed[playerid][4], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][4], -1);
	TextDrawSetShadow(Speed[playerid][4], 1);

	Speed[playerid][5] = TextDrawCreate(570.000000, 388.000000, "_");
	TextDrawAlignment(Speed[playerid][5], 2);
	TextDrawBackgroundColor(Speed[playerid][5], 255);
	TextDrawLetterSize(Speed[playerid][5], 0.419999, 1.000000);
	TextDrawColor(Speed[playerid][5], -1);
	TextDrawSetShadow(Speed[playerid][5], 0);
	TextDrawUseBox(Speed[playerid][5], 1);
	TextDrawBoxColor(Speed[playerid][5], COLOR_BOX);
	TextDrawTextSize(Speed[playerid][5], 0.000000, -124.000000);

	Speed[playerid][6] = TextDrawCreate(573.000000, 371.000000, "IIIIIIIIIIIIIII");
	TextDrawBackgroundColor(Speed[playerid][6], -1);
	TextDrawLetterSize(Speed[playerid][6], 0.419999, 1.600000);
	TextDrawColor(Speed[playerid][6], 0xFFFFFF33);
	TextDrawSetShadow(Speed[playerid][6], 0);

	Speed[playerid][7] = TextDrawCreate(527.000000, 372.000000, "FUEL:");
	TextDrawAlignment(Speed[playerid][7], 2);
	TextDrawBackgroundColor(Speed[playerid][7], 255);
	TextDrawLetterSize(Speed[playerid][7], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][7], -1);
	TextDrawSetShadow(Speed[playerid][7], 1);

	Speed[playerid][8] = TextDrawCreate(550.000000, 359.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][8], 255);
	TextDrawLetterSize(Speed[playerid][8], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][8], -1);
	TextDrawSetShadow(Speed[playerid][8], 1);

	Speed[playerid][9] = TextDrawCreate(570.000000, 401.000000, "_");
	TextDrawAlignment(Speed[playerid][9], 2);
	TextDrawBackgroundColor(Speed[playerid][9], 255);
	TextDrawLetterSize(Speed[playerid][9], 0.419999, 1.000000);
	TextDrawColor(Speed[playerid][9], -1);
	TextDrawSetShadow(Speed[playerid][9], 0);
	TextDrawUseBox(Speed[playerid][9], 1);
	TextDrawBoxColor(Speed[playerid][9], COLOR_BOX);
	TextDrawTextSize(Speed[playerid][9], 0.000000, -124.000000);

	Speed[playerid][10] = TextDrawCreate(536.000000, 385.000000, "MILEAGE:");
	TextDrawAlignment(Speed[playerid][10], 2);
	TextDrawBackgroundColor(Speed[playerid][10], 255);
	TextDrawLetterSize(Speed[playerid][10], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][10], -1);
	TextDrawSetShadow(Speed[playerid][10], 1);

	Speed[playerid][11] = TextDrawCreate(563.000000, 385.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][11], 255);
	TextDrawLetterSize(Speed[playerid][11], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][11], -1);
	TextDrawSetShadow(Speed[playerid][11], 1);

	Speed[playerid][12] = TextDrawCreate(513.000000, 398.000000, "E");
	TextDrawBackgroundColor(Speed[playerid][12], 255);
	TextDrawLetterSize(Speed[playerid][12], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][12], -205);
	TextDrawSetShadow(Speed[playerid][12], 0);

	Speed[playerid][13] = TextDrawCreate(524.000000, 398.000000, "L");
	TextDrawBackgroundColor(Speed[playerid][13], 255);
	TextDrawLetterSize(Speed[playerid][13], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][13], -205);
	TextDrawSetShadow(Speed[playerid][13], 0);

	Speed[playerid][14] = TextDrawCreate(534.000000, 398.000000, "B");
	TextDrawBackgroundColor(Speed[playerid][14], 255);
	TextDrawLetterSize(Speed[playerid][14], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][14], -205);
	TextDrawSetShadow(Speed[playerid][14], 0);

	Speed[playerid][15] = TextDrawCreate(546.000000, 398.000000, "O");
	TextDrawBackgroundColor(Speed[playerid][15], 255);
	TextDrawLetterSize(Speed[playerid][15], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][15], -205);
	TextDrawSetShadow(Speed[playerid][15], 0);

	Speed[playerid][16] = TextDrawCreate(573.000000, 358.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][16], 0x00000033);
	TextDrawLetterSize(Speed[playerid][16], 0.419999, 1.600000);
	TextDrawColor(Speed[playerid][16], -1);
	TextDrawSetShadow(Speed[playerid][16], 0);

	Speed[playerid][17] = TextDrawCreate(573.000000, 371.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][17], 0x00000033);
	TextDrawLetterSize(Speed[playerid][17], 0.419999, 1.600000);
	TextDrawColor(Speed[playerid][17], -1);
	TextDrawSetShadow(Speed[playerid][17], 0);

	Speed[playerid][18] = TextDrawCreate(513.000000, 398.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][18], 0x00000033);
	TextDrawLetterSize(Speed[playerid][18], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][18], -1);
	TextDrawSetShadow(Speed[playerid][18], 0);

	Speed[playerid][19] = TextDrawCreate(524.000000, 398.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][19], 0x00000033);
	TextDrawLetterSize(Speed[playerid][19], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][19], -1);
	TextDrawSetShadow(Speed[playerid][19], 0);

	Speed[playerid][20] = TextDrawCreate(534.000000, 398.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][20], 0x00000033);
	TextDrawLetterSize(Speed[playerid][20], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][20], -1);
	TextDrawSetShadow(Speed[playerid][20], 0);

	Speed[playerid][21] = TextDrawCreate(546.000000, 398.000000, " ");
	TextDrawBackgroundColor(Speed[playerid][21], 0x00000033);
	TextDrawLetterSize(Speed[playerid][21], 0.270000, 1.399999);
	TextDrawColor(Speed[playerid][21], -1);
	TextDrawSetShadow(Speed[playerid][21], 0);

	for(new i; i < 22; ++i)
	{
		TextDrawFont(Speed[playerid][i], 2);
		TextDrawSetOutline(Speed[playerid][i], 0);
		TextDrawSetProportional(Speed[playerid][i], 1);
	}
}

stock GetFreeSeat(vehicleid)
{
	if(!vehicleid) return -1;
	new model = GetVehicleModel(vehicleid);
	new maxs = GetMaxSeat(model) - 1;
	new bool:seat[3], cnt;
	for(new i; i < MAX_PLAYERS; i++)
	{
	    if(!IsPlayerConnected(i) || GetPlayerVehicleID(i) != vehicleid) continue;
		new pseat = GetPlayerVehicleSeat(i);
		if(pseat < 1 || pseat > 3) continue;
		seat[pseat-1] = true;
		cnt++;
		if(cnt >= maxs) return -1;
	}
	for(new i; i < 3; i++) if(!seat[i]) return i+1;
	return -1;
}

stock GetMaxSeat(modelid)
{
	switch(modelid)
	{
	    case 596..598,427,490: return 4;
	    case 599,497,528: return 2;
	}
	return -1;
}

stock PutPlayerInVehicleEx(playerid, vehicleid, passenger)
{
	PutPlayerInVehicle(playerid, vehicleid, passenger);
 	SetTimerEx("AntiNopPutPlayerInVehicle" , 1000, false, "i", playerid);
}

stock LoadAccount(playerid)
{
	mysql_format(Mysql, query, sizeof(query),"SELECT * FROM `"TABLE_ACCOUNT"` WHERE name = '%e'  LIMIT 1", GetName(playerid));
    return mysql_function_query(Mysql, query, true, "LoadAcc", "i", playerid);
}

stock Stats(playerid)
{
	new v_type[64];
	switch(GetPVarInt(playerid, "pTicket"))
	{
		case 0: v_type = "-";
		case 1: v_type = "��������";
	}
	format(string, sizeof(string),
	"{FFFFFF}___________________________________________________________\n\
	���:\t\t\t\t\t%s\n\
	�������:\t\t\t\t%i\n\
	� �����:\t\t\t\t%i� / %i�\n\
	��������������:\t\t\t%s\n\n\
	\
	�������:\t\t\t\t0\n\
	���������:\t\t\t\t0\n\
	����� ��������:\t\t\t%i\n\n\
	\
	������ / ���������:\t\t\t%s\n\
	�����������:\t\t\t\t%s\n\
	������� �����:\t\t\t%s\n\n\
	\
	���:\t\t\t\t\t%s\n\
	�����������:\t\t\t\t%s\n\
	___________________________________________________________",
	GetName(playerid), GetPVarInt(playerid, "pAge"), GetPVarInt(playerid, "pLevel"), GetPVarInt(playerid, "pExp"), cDataInfo[playerid][pNation], GetPVarInt(playerid, "pPhone"), Ranks_Type(playerid), Fractions_Type(playerid), v_type, (GetPVarInt(playerid, "pSex")) ? ("�������") : ("�������"), cDataInfo[playerid][pRegData]);
	return ShowPlayerDialog(playerid,D_STATS,d_Box,"{6699FF}����������",string,"�����","�����");
}

stock Passport(playerid)
{
    new v_type[64];
	switch(GetPVarInt(playerid, "pTicket"))
	{
		case 0: v_type = "-";
		case 1: v_type = "��������";
	}
	format(string, sizeof(string),
	"{FFFFFF}___________________________________________________________\n\
	���:\t\t\t\t\t%s\n\
	�������:\t\t\t\t%i\n\
	� �����:\t\t\t\t%i� / %i� \n\
	��������������:\t\t\t%s\n\n\
	\
	�������:\t\t\t\t0\n\
	���������:\t\t\t\t0\n\
	����� ��������:\t\t\t%i\n\n\
	\
	������ / ���������\t\t\t%s\n\
	�����������:\t\t\t\t%s\n\
	������� �����:\t\t\t%s\n\n\
	\
	���:\t\t\t\t\t%s\n\
	___________________________________________________________",
	GetName(playerid), GetPVarInt(playerid, "pAge"), GetPVarInt(playerid, "pLevel"), GetPVarInt(playerid, "pExp"), cDataInfo[playerid][pNation], GetPVarInt(playerid, "pPhone"), Ranks_Type(playerid), Fractions_Type(playerid), v_type, (GetPVarInt(playerid, "pSex")) ? ("�������") : ("�������"));
	return ShowPlayerDialog(playerid,D_STATS+1,d_Box,"{6699FF}�������",string,"�����","�����");
}

stock MiniMap_SecondaryATM()
{
	for(new i = 1; i <= TOTALATM; i++)
	{
	    new Float:natmx, Float:natmy, Float:natmz;
	    GetMiniMapCoord(ATMInfo[i][aX], ATMInfo[i][aY], natmx, natmy, natmz);
	    CreateObject(19177, natmx, natmy, natmz, 90.00, 0, 0.0);
	}
}

stock MiniMap_DoubleHome()
{
	for(new i = 1; i <= TOTALHOUSE; i++)
	{
	    new idx = GetPVarInt(i, "PlayerHome");
	    new Float:natmx, Float:natmy, Float:natmz;
	    GetHomeMapCoord(HouseInfo[idx][hEntr][0], HouseInfo[idx][hEntr][1], natmx, natmy, natmz);
	    CreateObject(19178, natmx, natmy, natmz, 90.00, 0, 0.0);
	}
}

stock GetMiniMapCoord(Float:x, Float:y, &Float:nx, &Float:ny, &Float:nz)
{
    nx = x/2000;
    nz = y/2000;
    ny = POS_Y;
    nx+=POS_X;
    nz+=POS_Z;
}

stock GetHomeMapCoord(Float:x, Float:y, &Float:nx, &Float:ny, &Float:nz)
{
    nx = x/2000;
    nz = y/2000;
    ny = AH_Y;
    nx+=AH_X;
    nz+=AH_Z;
}

stock Markets(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 4.0,1764.6361,-1885.7416,14.8846)) return true;
	return false;
}

stock Fractions_Type(playerid)
{
	new fractions_strings[1024];
	switch(GetPVarInt(playerid, "pLeader"))
	{
	    case 0: fractions_strings = "���";
	    case 1: fractions_strings = "���������";
	    case 2: fractions_strings = "���������-12";
	    case 3: fractions_strings = "��������";
	    case 4: fractions_strings = "����� ���� �������";
	    case 5: fractions_strings = "������������ �������������� ������";
	    case 6: fractions_strings = "UNATCO";
	    case 7: fractions_strings = "���������";
	    case 8: fractions_strings = "���";
	    case 9: fractions_strings = "���������� ������� ��";
	    case 10: fractions_strings = "���������� ������� ��";
	    case 11: fractions_strings = "FEMA";
	    case 12: fractions_strings = "�� �����";

	}
	switch(GetPVarInt(playerid, "pMember"))
	{
 		case 0: fractions_strings = "���";
	    case 1: fractions_strings = "���������";
	    case 2: fractions_strings = "���������-12";
	    case 3: fractions_strings = "��������";
	    case 4: fractions_strings = "����� ���� �������";
	    case 5: fractions_strings = "������������ �������������� ������";
	    case 6: fractions_strings = "UNATCO";
	    case 7: fractions_strings = "���������";
	    case 8: fractions_strings = "���";
	    case 9: fractions_strings = "���������� ������� ��";
	    case 10: fractions_strings = "���������� ������� ��";
	    case 11: fractions_strings = "FEMA";
	    case 12: fractions_strings = "�� �����";
	}
	return fractions_strings;
}

stock Colors_Type(playerid)
{
	switch(GetPVarInt(playerid, "pMember"))
	{
	    case 1: SetPlayerColor(playerid, COLOR_LIGHTRED);
	    case 2: SetPlayerColor(playerid, COLOR_GREEN);
	    case 3: SetPlayerColor(playerid, COLOR_GREEN);
	    case 4: SetPlayerColor(playerid, COLOR_AQUA);
	    case 5: SetPlayerColor(playerid, COLOR_AQUA);
	    case 6: SetPlayerColor(playerid, COLOR_AQUA);
	    case 7: SetPlayerColor(playerid, COLOR_AQUA);
	    case 8: SetPlayerColor(playerid, COLOR_GRELIN);
	    case 9: SetPlayerColor(playerid, COLOR_GRELIN);
	    case 10: SetPlayerColor(playerid, COLOR_GRELIN);
	    case 11: SetPlayerColor(playerid, COLOR_BLUE);
	    case 12: SetPlayerColor(playerid, COLOR_ORANGE);
	}
}

stock Ranks_Type(playerid)
{
	/*
		1. ����������
		2. ���������-12
		3. ��������
		4. ����� ���� �������
		5. ������������ �������������� ������
		6. UNATCO
		7. ���������
		8. ���
		9. ���������� ������� ��
		10. ���������� ������� ��
		11. FEMA
		12. �� �����
	*/
	new ranks_strings[1024];
	if(GetPVarInt(playerid, "pLeader") == 1 || GetPVarInt(playerid, "pMember") == 1)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 2 || GetPVarInt(playerid, "pMember") == 2)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 3 || GetPVarInt(playerid, "pMember") == 3)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 4 || GetPVarInt(playerid, "pMember") == 4)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 5 || GetPVarInt(playerid, "pMember") == 5)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 6 || GetPVarInt(playerid, "pMember") == 6)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 7 || GetPVarInt(playerid, "pMember") == 7)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 8 || GetPVarInt(playerid, "pMember") == 8)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 9 || GetPVarInt(playerid, "pMember") == 9)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 10 || GetPVarInt(playerid, "pMember") == 10)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 11 || GetPVarInt(playerid, "pMember") == 11)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 12 || GetPVarInt(playerid, "pMember") == 12)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 13 || GetPVarInt(playerid, "pMember") == 13)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 14 || GetPVarInt(playerid, "pMember") == 14)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 15 || GetPVarInt(playerid, "pMember") == 15)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 16 || GetPVarInt(playerid, "pMember") == 16)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 17 || GetPVarInt(playerid, "pMember") == 17)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "��������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "�����-���������";
		    case 4: ranks_strings = "�������� �� ����������� ������������";
		    case 5: ranks_strings = "�������� �� ������";
		    case 6: ranks_strings = "�������� �� ���";
		    case 7: ranks_strings = "�������� ������� ��������������";
		    case 8: ranks_strings = "�������� �� ���";
		    case 9: ranks_strings = "����-���������";
		    case 10: ranks_strings = "���������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 18 || GetPVarInt(playerid, "pMember") == 18)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "�����";
		    case 2: ranks_strings = "������";
		    case 3: ranks_strings = "�������";
		    case 4: ranks_strings = "�����";
		    case 5: ranks_strings = "������";
		    case 6: ranks_strings = "����-�����";
		    case 7: ranks_strings = "������";
		    case 8: ranks_strings = "�������";
		    case 9: ranks_strings = "����������";
		    case 10: ranks_strings = "�������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 21 || GetPVarInt(playerid, "pMember") == 21)
 	{
		switch(GetPVarInt(playerid, "pRank"))
		{
		    case 1: ranks_strings = "������";
		    case 2: ranks_strings = "��������";
		    case 3: ranks_strings = "����������";
		    case 4: ranks_strings = "�����";
		    case 5: ranks_strings = "�����-�����";
		    case 6: ranks_strings = "����������";
		    case 7: ranks_strings = "�����";
		    case 8: ranks_strings = "�����";
		    case 9: ranks_strings = "�������";
		    case 10: ranks_strings = "������";
		}
	}
	if(GetPVarInt(playerid, "pLeader") == 0 || GetPVarInt(playerid, "pMember") == 0)
	{
	    switch(GetPVarInt(playerid, "pJob"))
     	{
      		case 0: ranks_strings = "�����������";
      		case 1: ranks_strings = "������� ��������";
      		case 2: ranks_strings = "��������";
      		case 3: ranks_strings = "��������� �������";
      		case 4: ranks_strings = "�������� ��������";
      		case 5: ranks_strings = "������������";
      		case 6: ranks_strings = "������������";
      		case 7: ranks_strings = "������������";
      		case 8: ranks_strings = "������������";
		}
	}
	return ranks_strings;
}

stock IsInAllowedF(fnumbers)
{
    for(new i = 0; i < sizeof(allowedfactions); i++)
    {
        if(fnumbers == allowedfactions[i]) return true;
    }
    return 0;
}

stock BankList(playerid)return ShowPlayerDialog(playerid, D_ATM, d_List, "{6699FF}��������", "{FFFFFF}1. ������ �����\n2. ��������� ����\n3. ����� �� �����\n4. ���������� ������ �����\n5. ���������� ��������� �����\n6. ���������� ��� �����\n7. ������ ��������� �����\n8. �������������������\n9. ����������� �������\n10. �������", "�������", "�����");

stock Drive(playerid) return ShowPlayerDialog(playerid, D_DRIVE_EXAM, d_Box, "{6699FF}��������", "{FFFFFF}��� ������� ������� ��� ������ �������������\n� �������� �� ��������\n\n{DAA520}��� ����, ����� ������ �������� ������� '�����'", "�����", "�����");

stock Jobs_Invite(playerid)
{
	if(GetPVarInt(playerid, "pMember") == 0)
	{
		ShowPlayerDialog(playerid, D_WORK+1, d_List, "{6699FF}���� �� ������", "{FFFFFF}1. ������� ��������\t\t{6699FF}5 �������\n{FFFFFF}2. ��������\t\t\t{6699FF}3 �������\n{FFFFFF}3. ��������� ���������\t{6699FF}5 �������\n{FFFFFF}4. �������� ��������\t\t{6699FF}2 �������\n{FFFFFF}5. ������������\t\t{6699FF}7 �������", "�������", "�����");
	}
	else
	{
	    format(string, sizeof(string), "{FFFFFF}�� �������� � ����������� '%s'\n\
		� ���� ������ ���������� �� ������, �� ��� ������� �������� �.\n��� ���� ���� ���������� � �����������, ����� ��� ����, �� ����������\n\n\
		�� ������� ��� ������ ��������� �� �����������?", Fractions_Type(playerid));
		ShowPlayerDialog(playerid, D_WORK, d_Box, "{6699FF}���� �� ������", string, "��", "���");
	}
	return true;
}

stock SetPlayerFloat(username[], stolb[], Float:znach)
{
	mysql_format(Mysql, query, sizeof(query),"UPDATE `"TABLE_ACCOUNT"` SET Heal = '%f' WHERE name = '%e' LIMIT 1", stolb, Float:znach, username);
	return mysql_function_query(Mysql, query, false, "", "");
}

stock SetHealth(playerid, Float:Heal)
{
	SetPVarFloat(playerid, "pHeal", Heal);
	SetPlayerHealth(playerid, GetPVarFloat(playerid, "pHeal"));
	SetPlayerFloat(GetName(playerid), "Heal", Heal);
	return true;
}

stock EditSettings(playerid)
{
	new c_settings[128], f_settings[128], n_settings[128], i_settings[128], m_settings[128], u_settings[100];
	if(GetPVarInt(playerid, "pTS1") == 1) format(c_settings, sizeof(c_settings), "{0F8FCD}Tranquility");
	else if(GetPVarInt(playerid, "pTS1") == 0) format(c_settings, sizeof(c_settings), "{FF0000}�����������");
	if(GetPVarInt(playerid, "pTS2") == 1) format(f_settings, sizeof(f_settings), "{00FF00}�������");
	else if(GetPVarInt(playerid, "pTS2") == 0) format(f_settings, sizeof(f_settings), "{FF0000}��������");
	if(GetPVarInt(playerid, "pTS3") == 1) format(n_settings, sizeof(n_settings), "{00FF00}��������");
	else if(GetPVarInt(playerid, "pTS3") == 0) format(n_settings, sizeof(n_settings), "{FF0000}���������");
	if(GetPVarInt(playerid, "pTS4") == 1) format(i_settings, sizeof(i_settings), "{00FF00}��������");
	else if(GetPVarInt(playerid, "pTS4") == 0) format(i_settings, sizeof(i_settings), "{FF0000}���������");
	if(GetPVarInt(playerid, "pTS5") == 1) format(m_settings, sizeof(m_settings), "{00FF00}��������");
	else if(GetPVarInt(playerid, "pTS5") == 0) format(m_settings, sizeof(m_settings), "{FF0000}���������");
	if(GetPVarInt(playerid, "pAKey") == 1) format(u_settings, sizeof(u_settings), "{00FF00}������� � �������");
	else if(GetPVarInt(playerid, "pAKey") == 0) format(u_settings, sizeof(u_settings), "{00FF88}������. ���������");
	format(string, sizeof(string), "{FFFFFF}�������� ���\t\t\t%s\n{FFFFFF}��� �����������\t\t%s\n{FFFFFF}���� ��� ��������\t\t%s\n{FFFFFF}���� � ����\t\t\t%s\n{FFFFFF}ID ������� � ����\t\t%s\n{FFFFFF}������. �����������\t\t%s\n{FF0000}[���������]", c_settings, f_settings, n_settings, i_settings, m_settings, u_settings);
	return ShowPlayerDialog(playerid, D_MENU+16, d_List, "{6699FF}������ ���������", string, "���|����", "�����");
}

stock SetPlayerInt(username[], stolb[], znach)
{
	mysql_format(Mysql, query, sizeof(query),"UPDATE `"TABLE_ACCOUNT"` SET %e = '%d' WHERE name = '%e' LIMIT 1", stolb, znach, username);
	return mysql_function_query(Mysql, query, false, "", "");
}

strmatch(const String1[], const String2[])
{   if((strcmp(String1, String2, true, strlen(String2)) == 0) && (strlen(String2) == strlen(String1))) { return true; }
	else { return false; }
}

stock SetPlayerStr(username[], stolb[], znach[])
{
	mysql_format(Mysql, query, sizeof(query),"UPDATE `"TABLE_ACCOUNT"` SET %e = '%e' WHERE name = '%e' LIMIT 1", stolb, znach, username);
	return mysql_function_query(Mysql, query, false, "", "");
}

stock SetHouseInt(idx, stolb[], znach)
{
	mysql_format(Mysql, query, sizeof(query),"UPDATE "TABLE_HOUSE" SET  %e = '%i' WHERE id = '%i' LIMIT 1", stolb, znach, idx);
	return mysql_function_query(Mysql, query, false, "", "");
}

stock SetBizzStr(idx, stolb[], znach[])
{
	format(query, 128, "UPDATE `"TABLE_BIZZ"` SET %s = '%s' WHERE id = '%d' LIMIT 1", stolb, znach, idx);
	return mysql_function_query(Mysql, query, false, "", "");
}
stock SetBizzInt(idx, stolb[], znach)
{
	format(query, 128, "UPDATE `"TABLE_BIZZ"` SET %s = '%d' WHERE id = '%d' LIMIT 1", stolb, znach, idx);
	return mysql_function_query(Mysql, query, false, "", "");
}

stock SetHouseStr(idx, stolb[], znach[])
{
	mysql_format(Mysql, query, sizeof(query),"UPDATE `"TABLE_HOUSE"` SET %e = '%e' WHERE id = '%i' LIMIT 1", stolb, znach, idx);
	return mysql_function_query(Mysql, query, false, "", "");
}

stock BizzStats(playerid, idx)
{
	if(BizzInfo[idx][bType] != 22)
	{
		format(string, 500, "{FFFFFF}�������� �������:\t\t{6699FF}%s\n{FFFFFF}��������:\t\t\t{6699FF}%s\n\n{FFFFFF}�� ����� �������:\t\t{6699FF}%i $\n{FFFFFF}� ���� ���� ����������:\t{6699FF}%i $\n{FFFFFF}���� �� �����:\t\t{6699FF}%i ���������\n\n{FFFFFF}���������:\t\t\t{6699FF}%i / 20000\n\n{FFFFFF}������:\t\t\t\t%s\n{FFFFFF}�������� �� ������:\t\t%s",
		BizzInfo[idx][bName], BizzInfo[idx][bOwner], BizzInfo[idx][bMoney], BizzPay[idx], BizzInfo[idx][bTill], BizzInfo[idx][bProduct],(!BizzInfo[idx][bLock])?("{00FF00}������") : ("{FF0000}�������"),(!BizzInfo[idx][bLic])?("{FF6347}���"):("{00D900}��"));
 	}
 	else
 	{
 		format(string, 500, "{FFFFFF}�������� �������:\t\t{6699FF}%s\n{ffffff}��������:\t\t\t{6699FF}%s\n\n{FFFFFF}�� ����� �������:\t\t{6699FF}%i $\n{FFFFFF}� ���� ���� ����������:\t{6699FF}%i $\n{FFFFFF}���� �� 1 ����:\t\t{6699FF}%i $\n\n{ffffff}�������:\t\t\t{6699FF}%i / 50000\n\n{FFFFFF}������:\t\t\t\t%s\n{FFFFFF}�������� �� ������:\t\t%s",
		BizzInfo[idx][bName], BizzInfo[idx][bOwner], BizzInfo[idx][bMoney], BizzPay[idx], BizzInfo[idx][bTill] / 3, BizzInfo[idx][bProduct],(!BizzInfo[idx][bLock])?("{00FF00}������") : ("{FF0000}�������"),(!BizzInfo[idx][bLic])?("{FF0000}�����������"):("{00FF00}������������"));
 	}
 	return ShowPlayerDialog(playerid, D_BUSINESS+11, d_Box, "{6699FF}���������� �������", string, "�����", "�����");
}

stock UpdateBizz(idx)
{
	Delete3DTextLabel(LABELBIZZ[idx]);
	if(BizzInfo[idx][bType] < 22)
	{
	    if(!strcmp(BizzInfo[idx][bOwner], "None", true))
	    {
	        format(string, 128, "{6699FF}%s\n{FFFFFF}����������� ��������", BizzInfo[TOTALBIZZ][bName]);
	        LABELBIZZ[idx] = Create3DTextLabel(string, COLOR_WHITE, BizzInfo[idx][bEntrx], BizzInfo[idx][bEntry], BizzInfo[idx][bEntrz], 20.0, 0, 1);
		}
		else
		{
		    format(string, 128, "{FFFFFF}{6699FF}%s\n{FFFFFF}��������: %s", BizzInfo[idx+1][bName], BizzInfo[idx+1][bOwner]); LABELBIZZ[idx+1] = Create3DTextLabel(string,COLOR_GREEN,BizzInfo[idx+1][bEntrx], BizzInfo[idx+1][bEntry], BizzInfo[idx+1][bEntrz],20.0, 0, 1);
			LABELBIZZ[idx] = Create3DTextLabel(string, COLOR_WHITE, BizzInfo[idx][bEntrx], BizzInfo[idx][bEntry], BizzInfo[idx][bEntrz], 20.0, 0, 1);
		}
	}
	else
	{
	    if(!strcmp(BizzInfo[idx][bOwner], "None", true))
	    {
	        format(string, 128, "{6699FF}%s\n{FFFFFF}����������� ��������", BizzInfo[TOTALBIZZ][bName]);
	        LABELBIZZ[idx] = Create3DTextLabel(string, COLOR_WHITE, BizzInfo[idx][bEntrx], BizzInfo[idx][bEntry], BizzInfo[idx][bEntrz], 20.0, 0, 1);
		}
		else
		{
		    format(string, 128, "{6699FF}%s\n{FFFFFF}��������: %s\n���� �� 10 ������: {6699FF}%i", BizzInfo[TOTALBIZZ][bName], BizzInfo[idx][bOwner], BizzInfo[idx], BizzInfo[idx][bTill] /3);
		    LABELBIZZ[idx] = Create3DTextLabel(string, COLOR_WHITE, BizzInfo[idx][bEntrx], BizzInfo[idx][bEntry], BizzInfo[idx][bEntrz], 20.0, 0, 1);
		}
	}
	return true;
}

stock UpdateHouse(idx)
{
	DestroyPickup(HouseInfo[idx][hPickup][0]);
    DestroyDynamicMapIcon(HouseInfo[idx][hMIcon]);
   	if(!strcmp(HouseInfo[idx][hOwner],"None",true))
	{
	    new Float:natmx, Float:natmy, Float:natmz;
 		GetMiniMapCoord(HouseInfo[idx][hEntr][0], HouseInfo[idx][hEntr][1], natmx, natmy, natmz);
   		CreateObject(19178, natmx, natmy, natmz, 90.00, 0, 0.0);
		HouseInfo[idx][hMIcon] = CreateDynamicMapIcon(HouseInfo[idx][hEntr][0], HouseInfo[idx][hEntr][1], HouseInfo[idx][hEntr][2], 31, 0,-1,-1,-1,200.0);
		HouseInfo[idx][hPickup][0] = CreatePickup(1273, 1, HouseInfo[idx][hEntr][0], HouseInfo[idx][hEntr][1], HouseInfo[idx][hEntr][2]);
 	}
	else
	{
		HouseInfo[idx][hMIcon] = CreateDynamicMapIcon(HouseInfo[idx][hEntr][0], HouseInfo[idx][hEntr][1], HouseInfo[idx][hEntr][2], 32, 0,-1,-1,-1,200.0);
		HouseInfo[idx][hPickup][0] = CreatePickup(1272, 1, HouseInfo[idx][hEntr][0], HouseInfo[idx][hEntr][1], HouseInfo[idx][hEntr][2]);
	}
	return true;
}

stock SendAdminMessage(color, str[])
{
	for(new idx = 0, playerid = 0; idx < cvector_size(FOR_SERVERS); idx++)
	{
	    playerid = cvector_get(FOR_SERVERS, idx);
	    if(playerid != -1 && GetPlayerTeam(playerid) == 0) continue;
	    if(!GetPVarInt(idx, "Logged")) continue;
	    if(GetPVarInt(idx, "Admin") > 0 && GetPVarInt(idx, "SendAdmin") != 0) SendClientMessage(idx, color, str);
	}
	return true;
}

stock SendRMes(family, color, str[])
{
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
	    if(!IsPlayerConnected(i)) continue;
	    if(GetPVarInt(i, "pMember") == family) SendClientMessage(i, color, str);
	}
	return true;
}

stock SendFMes(color, str[])
{
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(GetPVarInt(i, "pMember") == 1 || GetPVarInt(i, "pMember") == 2 || GetPVarInt(i, "pMember") == 3 || GetPVarInt(i, "pMember") == 4 || GetPVarInt(i, "pMember") == 5)  SendClientMessage(i, color, str);
	}
	return true;
}

stock ProxDetector(playerid, Float:Rad = 10.0, color, text[])
{
    new Float:Pos[3];
	GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
	foreach (new i : Player)
    {
        if(!GetPVarInt(playerid,"Logged")) continue;
       	if(!IsPlayerInRangeOfPoint(i, Rad, Pos[0], Pos[1], Pos[2])) continue;
       	if(GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid) && GetPlayerInterior(playerid) == GetPlayerInterior(i)) SendClientMessage(i, color, text);
    }
    return true;
}

stock CreateAccount(playerid, pass[])
{
	SendClientMessage(playerid, COLOR_WHITE, "[*] - �� ������� �������� ����������� � {BFF9B0}/setup - ����� � ��������������");
	SendClientMessage(playerid, COLOR_WHITE, "[*] - ��� ������������ ����������� ��������� ��� ���� ������������, ���������: {B3F9B0}/setup - ��������� ������������");
	SendClientMessage(playerid, COLOR_WHITE, "[*] - ������ ��� �� ����������� ������������, ��� ��� �� ���� ������� �� �������� ����������. ��, ���������� ������, ������� � ��������.");
	SendClientMessage(playerid, COLOR_WHITE, "[*] - ������������ ����������� ��������� {B3F9B0}'������ �� ����'{FFFFFF}. ������� ��� ������� ������� �� ����������!");
	SendClientMessage(playerid, COLOR_WHITE, "[*] - ��� ����, ����� �������������� � ��� ���� ������ ����, ����������� ��������������� ���������� '��������', ������� �������� ��� ");
	SendClientMessage(playerid, COLOR_WHITE, "'�������' ������ �����, ����������� ���������� � ����. ����������� ������� ������� ������������ �����������.");
	SendClientMessage(playerid, COLOR_WHITE, "[*] - ����������� ��� � ����, ����� ������� ������� �������� ��� � ������ ���������� ����������. ������ �� �� ����� ������� �� �����. �� ����. �� ����������.");
	SendClientMessage(playerid, COLOR_RED, "[!] ��������� ����������� �� ���������� ������ GTA San Andreas ����� ����, ��� � ������������ ��� ����������� �������.");
	GivePlayerWeapon(playerid, 10, 1);
	new ip[32], data[16];
	GetPlayerIp(playerid, ip, 32);
	format(data, 16, "%s",date("%dd.%mm.%yyyy",gettime()));
	mysql_format(Mysql, query, sizeof(query),"INSERT INTO "TABLE_ACCOUNT" (name, password, ip, datareg, sex, model, mail, spawns, age, nation) VALUES ('%e', '%e', '%e', '%e', %d, %d, '%e', '%d', %d, '%s')", GetName(playerid), pass, ip, data, GetPVarInt(playerid, "pSex"), GetPVarInt(playerid, "pModel"), cDataInfo[playerid][pMail], GetPVarInt(playerid, "pSpawns"), GetPVarInt(playerid, "pAge"), cDataInfo[playerid][pNation]);
	mysql_function_query(Mysql, query, false, "", "");
	return LoadAccount(playerid);
}

stock GetPlayerBizz(playerid)
{
	new bizz;
	for(new i = 1; i <= TOTALBIZZ; i++)
	{
	    if(!strcmp(BizzInfo[i][bOwner], GetName(playerid), true))
	    {
	        SetPVarInt(playerid, "PlayerBizz", i);
	        bizz++;
	        break;
		}
	}
	return bizz;
}

stock GetPlayerHouse(playerid)
{
	new house;
	for(new i = 1; i <= TOTALHOUSE; ++i)
	{
		if(!strcmp(HouseInfo[i][hOwner],GetName(playerid),true))
		{
			SetPVarInt(playerid, "PlayerHouse", i);
			++house;
			break;
		}
	}
	return house;
}

stock Converts(seconds, stringTo[], size = sizeof(stringTo))
{
    stringTo[0] = 0x0;
    new result[4];
    result[0] = floatround(seconds / (3600 * 24));
    result[1] = floatround(seconds / 3600);
    result[2] = floatround((seconds / 60) - (result[1] * 60));
    result[3] = floatround(seconds - ((result[1] * 3600) + (result[2] * 60)));
    switch(result[0])
    {
        case 0:
        {
            switch(result[1])
            {
                case 0: format(stringTo, size,"%02d:%02d", result[2], result[3]);
                default: format(stringTo, size,"%d:%02d:%02d", result[1], result[2], result[3]);
            }
        }
    }
    return stringTo;
}

stock SpeedSecond(playerid)
{
    new Str[16], Vehicleid = GetPlayerVehicleID(playerid);
   	if(!GetGVarFloat("Fuel", Vehicleid))
	{
		GetVehicleParamsEx(Vehicleid,Vehicle[0],Vehicle[1],Vehicle[2],Vehicle[3],Vehicle[4],Vehicle[5],Vehicle[6]);
		SetVehicleParamsEx(Vehicleid,VEHICLE_PARAMS_OFF,Vehicle[1],Vehicle[2],Vehicle[3],Vehicle[4],Vehicle[5],Vehicle[6]);
 		DeleteGVar("Engine", Vehicleid);
	}
	SetGVarFloat("Mileage", GetGVarFloat("Mileage", Vehicleid) +((GetSpeed(playerid) / 2.5) / 1000), Vehicleid);
	format(Str, sizeof(Str), "%.0f KM", GetGVarFloat("Mileage", Vehicleid));
	TextDrawSetString(Speed[playerid][11] , Str);
	format(Str, sizeof(Str), "%.0f", GetGVarFloat("Fuel", Vehicleid));
 	TextDrawSetString(Speed[playerid][4], Str);
  	if(!GetGVarInt("Engine", Vehicleid)) TextDrawSetString(Speed[playerid][18], " ");
    else TextDrawSetString(Speed[playerid][18], "~g~E");
    if(!GetGVarInt("Lights", Vehicleid)) TextDrawSetString(Speed[playerid][19], " ");
    else TextDrawSetString(Speed[playerid][19], "~g~L");
    if(!GetGVarInt("Bonet", Vehicleid)) TextDrawSetString(Speed[playerid][20], " ");
    else TextDrawSetString(Speed[playerid][20], "~g~B");
    if(!GetGVarInt("Alarm", Vehicleid)) TextDrawSetString(Speed[playerid][21], " ");
    else TextDrawSetString(Speed[playerid][21], "~g~A");
   	switch(floatround(GetGVarFloat("Fuel", Vehicleid)))
	{
 		case 0..5: TextDrawSetString(Speed[playerid][17], " ");
	 	case 6..10: TextDrawSetString(Speed[playerid][17], "~r~~h~~h~I");
  		case 11..15: TextDrawSetString(Speed[playerid][17], "~r~~h~~h~II");
  		case 16..20: TextDrawSetString(Speed[playerid][17], "~r~~h~~h~III");
   		case 21..25: TextDrawSetString(Speed[playerid][17], "~r~~h~~h~IIII");
    	case 26..30: TextDrawSetString(Speed[playerid][17], "~y~~h~IIIII");
    	case 31..35: TextDrawSetString(Speed[playerid][17], "~y~~h~IIIIII");
    	case 36..40: TextDrawSetString(Speed[playerid][17], "~y~~h~IIIIIII");
    	case 41..45: TextDrawSetString(Speed[playerid][17], "~y~~h~IIIIIIII");
    	case 46..50: TextDrawSetString(Speed[playerid][17], "~y~~h~IIIIIIIII");
    	case 51..55: TextDrawSetString(Speed[playerid][17], "~y~~h~IIIIIIIIII");
    	case 56..60: TextDrawSetString(Speed[playerid][17], "~w~~h~IIIIIIIIIII");
    	case 61..65: TextDrawSetString(Speed[playerid][17], "~w~~h~IIIIIIIIIIII");
    	case 66..70: TextDrawSetString(Speed[playerid][17], "~w~~h~IIIIIIIIIIIII");
    	case 71..75: TextDrawSetString(Speed[playerid][17], "~w~~h~IIIIIIIIIIIIII");
    	case 76..150: TextDrawSetString(Speed[playerid][17], "~w~~h~IIIIIIIIIIIIIII");
	}
}

stock UpdateSpeed(playerid)
{
	new Str[16], SPD = GetSpeed(playerid);
	format(Str, sizeof(Str), "%i", SPD);
	TextDrawSetString(Speed[playerid][8], Str);
	switch(SPD)
	{
	    case 0..5: TextDrawSetString(Speed[playerid][16], " ");
	    case 6..10: TextDrawSetString(Speed[playerid][16], "~w~~h~I");
	    case 11..20: TextDrawSetString(Speed[playerid][16], "~w~~h~II");
	    case 21..30: TextDrawSetString(Speed[playerid][16], "~w~~h~III");
	    case 31..40: TextDrawSetString(Speed[playerid][16], "~w~~h~IIII");
	    case 41..50: TextDrawSetString(Speed[playerid][16], "~w~~h~IIIII");
	    case 51..60: TextDrawSetString(Speed[playerid][16], "~w~~h~IIIIII");
	    case 61..70: TextDrawSetString(Speed[playerid][16], "~w~~h~IIIIIII");
	    case 71..80: TextDrawSetString(Speed[playerid][16], "~w~~h~IIIIIIII");
	    case 81..90: TextDrawSetString(Speed[playerid][16], "~w~~h~IIIIIIIII");
	    case 91..100: TextDrawSetString(Speed[playerid][16], "~y~~h~IIIIIIIIII");
	    case 101..110: TextDrawSetString(Speed[playerid][16], "~y~~h~IIIIIIIIIII");
	    case 111..120: TextDrawSetString(Speed[playerid][16], "~y~~h~IIIIIIIIIIII");
	    case 121..130: TextDrawSetString(Speed[playerid][16], "~y~~h~IIIIIIIIIIIII");
	    case 131..140: TextDrawSetString(Speed[playerid][16], "~r~~h~~h~IIIIIIIIIIIIII");
	    case 141..999: TextDrawSetString(Speed[playerid][16], "~r~~h~~h~IIIIIIIIIIIIIII");
	}
}

stock GetSpeed(playerid)
{
    new Float:ST[3];
    if(!IsPlayerInAnyVehicle(playerid)) GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
	else GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    return floatround(floatsqroot(ST[0]*ST[0]+ST[1]*ST[1]+ST[2]*ST[2])*200);
}

stock PayDayTimer()
{
	new Time[3];
    gettime(Time[0], Time[1], Time[2]);
    if((Time[0] > gTime[0]) || (!Time[0] && gTime[0] == 23))
	{
		gTime[0] = Time[0];
		SetWorldTime(Time[0]);
		SetWeather(random(10));
  		PayDay();
	}
	return true;
}

stock PayDay()
{
	foreach(new i : Player)
	{
		if(!GetPVarInt(i, "Logged")) continue;
		GameTextForPlayer(i, "PayDay", 5000, 1);
		SendMes(i, COLOR_WHITE, "[S] ������� �����: {6699FF}%i:00", gTime[0]);
		SetPVarInt(i, "pExp", GetPVarInt(i, "pExp")+1);
		if(GetPVarInt(i, "pExp") >= GetPVarInt(i, "pLevel")*8)
		{
		    new years_month[64];
		    switch(GetPVarInt(i, "pLevel"))
		    {
		        case 1: years_month = "���";
		        case 2..4: years_month = "����";
		        case 5..20: years_month = "���";
		        case 21: years_month = "���";
		        case 22..24: years_month = "����";
		        case 25..30: years_month = "���";
		        case 31: years_month = "���";
		        case 32..34: years_month = "����";
		        case 35..40: years_month = "���";
		    }
			SetPVarInt(i, "pLevel", GetPVarInt(i, "pLevel")+1);
			SetPVarInt(i, "pExp", 0);
			SetPlayerInt(GetName(i), "Level", GetPVarInt(i, "pLevel"));
			SetPlayerInt(GetName(i), "Exp", GetPVarInt(i, "pExp"));
			SetPlayerScore(i, GetPVarInt(i, "pLevel"));
			SendMes(i, 0xFF0000FF, "[P] ��� ������� ������� �������! ������ �� ���������� � ����� %i %s.", GetPVarInt(i, "pLevel"), years_month);
		}
	}
	return true;
}

stock SavePlayer(playerid)
{
	format(cDataInfo[playerid][pJobAmounts],30,"%i,%i,%i", cDataInfo[playerid][pJobAmount][0], cDataInfo[playerid][pJobAmount][1], cDataInfo[playerid][pJobAmount][2]);
	query = "";
	format(query,sizeof(query),"UPDATE `"TABLE_ACCOUNT"` SET `JobAmount` = '%s' WHERE `Name` = '%s'", cDataInfo[playerid][pJobAmounts], GetName(playerid));
	mysql_function_query(Mysql, query, false, "", "");
	return true;
}

stock GiveMoney(playerid, amount)
{
    GivePlayerMoney(playerid, amount);
	SetPVarInt(playerid, "pCash", GetPlayerMoney(playerid));
	return SetPlayerInt(GetName(playerid), "Cash", GetMoney(playerid));
}

stock SetMoney(playerid, amount)
{
    ResetPlayerMoney(playerid);
    GivePlayerMoney(playerid, amount);
	SetPVarInt(playerid, "pCash", amount);
	return SetPlayerInt(GetName(playerid), "Cash", GetMoney(playerid));
}

stock ResetMoney(playerid)
{
    ResetPlayerMoney(playerid);
	DeletePVar(playerid, "pCash");
	return SetPlayerInt(GetName(playerid), "Cash", GetMoney(playerid));
}

stock GetMoney(playerid) return GetPVarInt(playerid, "pCash");

stock IsPlayerInRangeOfPlayer(Float:radi, playerid, targetid)
{
	GetPlayerPos(targetid, cDataInfo[targetid][pPos][0], cDataInfo[targetid][pPos][1], cDataInfo[targetid][pPos][2]);
	if(IsPlayerInRangeOfPoint(playerid, radi, cDataInfo[targetid][pPos][0], cDataInfo[targetid][pPos][1], cDataInfo[targetid][pPos][2])) return true;
	return false;
}

stock LeaveFractionPlayer(playerid)
{
	SetPVarInt(playerid, "pLeader", 0);
	SetPVarInt(playerid, "pMember", 0);
	SetPVarInt(playerid, "pRank", 0);
 	SpawnPlayer(playerid);
}

stock InvitePlayer(playerid)
{
	for(new i = 1; i < 9; i++)
	{
	    if(GetPVarInt(playerid, "pMember") == i && GetPVarInt(playerid, "pRank") >= 9) return true;
	}
	return false;
}

stock UnInvitePlayer(playerid)
{
	for(new i = 1; i < 9; i++)
	{
	    if(GetPVarInt(playerid, "pMember") == i && GetPVarInt(playerid, "pRank") >= 9) return true;
	}
	return false;
}

stock IsAV(playerid)
{
	if(GetPVarInt(playerid, "pMember") == 4) return true;
	if(GetPVarInt(playerid, "pMember") == 5) return true;
	if(GetPVarInt(playerid, "pMember") == 6) return true;
	if(GetPVarInt(playerid, "pMember") == 7) return true;
	return false;
}

stock IsACop(playerid)
{
	if(GetPVarInt(playerid, "pMember") == 8) return true;
	if(GetPVarInt(playerid, "pMember") == 9) return true;
	if(GetPVarInt(playerid, "pMember") == 10) return true;
	if(GetPVarInt(playerid, "pMember") == 1) return true;
	return false;
}

stock SetPlayerCriminal(playerid, killerid[], reason[])
{
	cDataInfo[playerid][pCrimes]++;
	strmid(cDataInfo[playerid][pWantedWho], killerid, 0, strlen(killerid), MAX_PLAYER_NAME);
	strmid(cDataInfo[playerid][pWantedReason], reason, 0, strlen(reason), 32);
	SendMes(playerid, COLOR_LIGHTRED,"[R] �� ��������� ������������: [ %s ]. ��������: %s. ������� ������� �������: %i", reason, killerid, cDataInfo[playerid][pCrimes]);
	SendMes(playerid, COLOR_YELLOW, "[F] ��� ������� �������: %i", cDataInfo[playerid][pWanted]);
	foreach(new i: Player)
	{
		if(IsACop(i)) SendMes(i, COLOR_ORANGE, "[R] %s. ������������: %s. �������������: %s", killerid, reason, GetName(playerid));
	}
	return true;
}

stock HomeList(playerid, idx)
{
    SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������� ��� ���������!");
	string = "";
	format(string, 512, "1. �������\t\t\t%i$\n2. ����� ��������\t\t%i$",
	BizzInfo[idx][bTill]*14, BizzInfo[idx][bTill]*3);
	ShowPlayerDialog(playerid, D_BUY, d_List, "{6699FF}������� 24/7", string, "�������", "�����");
	return true;
}

stock BanksList(playerid, idx)
{
    SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ����� ����������� ������������ ������!");
	string = "";
	format(string, 128, "{FFFFFF}�� ������� ��� ������ ��������������� �������� �����?\n������ ����� �����: %i$",
	BizzInfo[idx][bTill]*16);
	ShowPlayerDialog(playerid, D_BUY+1, d_List, "{6699FF}������ �����", string, "�������", "�����");
    return true;
}

stock DrinkList(playerid, idx)
{
    SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������� ��� ���������!");
	string = "";
	format(string, 512, "1. ������\t\t\t%i$",
	BizzInfo[idx][bTill]*12);
	ShowPlayerDialog(playerid, D_BUY+2, d_List, "{6699FF}���", string, "�������", "�����");
	return true;
}

stock CandyList(playerid, idx)
{
	SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������� ��� ���������!");
	string = "";
	format(string, 512, "1. ��������\t\t\t\t%i$",
	BizzInfo[idx][bTill]*7);
	ShowPlayerDialog(playerid, D_BUY+3, d_List, "{6699FF}������������", string, "�������", "�����");
	return true;
}

stock GunzList(playerid, idx)
{
	SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��������� �������� ����������� ������!");
	string = "";
	format(string, 512, "1. ������\t1 ����\t\t%i$",
	BizzInfo[idx][bTill]*15);
	ShowPlayerDialog(playerid, D_BUY+4, d_List, "{6699FF}������� ������", string, "�������", "�����");
	return true;
}

stock DriveList(playerid, idx)
{
	SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ����� �������� �������� ����� ������������� �� ���!");
	string = "";
	format(string, 512, "1. ������������� �����\n2. ���������\t\t\t\t%i$\n{FB2E01}3. ������� ��������� ��������",
	BizzInfo[idx][bTill]*20);
	ShowPlayerDialog(playerid, D_BUY+5, d_List, "{6699FF}����� ��������", string, "�������", "�����");
	return true;
}

stock ToyList(playerid, idx)
{
	SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������� ��� ���������!");
	string = "";
	format(string, 512, "1. RC Bandit\t\t\t%i$",
	BizzInfo[idx][bTill]*7);
	ShowPlayerDialog(playerid, D_BUY+6, d_List, "{6699FF}������� �������", string, "�������", "�����");
	return true;
}

stock ReagncyeList(playerid, idx)
{
	SetPVarInt(playerid, "PlayerBizzz", idx);
	if(BizzInfo[idx][bProduct] < 50) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �������� �������� ���������� � ������������. ���������� ������� �����.");
	string = "";
	format(string, 512, "1. ���������� � ��������� �����\t%i$\n2. ��������� �� �����\n3. ������� ��������\n4. �������\n5. ������ �����\t\t\t%i$",
	BizzInfo[idx][bTill]*20, BizzInfo[idx][bTill]*45);
	ShowPlayerDialog(playerid, D_BUY+6, d_List, "{6699FF}�������� ������������", string, "�������", "�����");
	return true;
}

stock Bank_Money(playerid)
{
	ShowPlayerDialog(playerid, D_BANK, d_List, "{6699FF}���� �����", "1. ��� �����\n2. ������� ����\n3. ���������� � �����", "�������", "�����");
	return true;
}

void ClearAnimText(playerid) return ApplyAnimation(playerid, "CARRY", "crry_prtial" ,4.0 , 0 , 0 , 0 , 0 , 0);
void SecTimer()
{
    new newhour,newminute,newsecond;
    gettime(newhour, newminute, newsecond);
	PayDayTimer();
	MiniMap_DoubleHome();
	MiniMap_SecondaryATM();
	if((newhour > ghour) || (newhour == 0 && ghour == 23))
    {
        ghour = newhour;
	    if(ghour == 0 || ghour == 3 || ghour == 6 || ghour == 9 || ghour == 12 || ghour == 15 || ghour == 18 || ghour == 21 && TOTALCARGO <= 0)
		{
			TOTALCARGO = 500;
			string = "";
			format(string, 128, "[W] ������: {e2ba00}%d �� 500", TOTALCARGO);
		    Update3DTextLabelText(CargoText[0], -1, string);
		    SendClientMessageToAll(0x008D03AA,"[W] �� ����� �������� ����, ��� �������!");
		}
	}
	foreach(new i : Player)
	{
		if(!GetPVarInt(i, "Logged"))
		{
			SetPVarInt(i, "TimeLogged", GetPVarInt(i,"TimeLogged") +1);
			if(GetPVarInt(i,"TimeLogged") > 180)
			{
				SendClientMessage(i, COLOR_LIGHTRED, LoggedTimeOver);
				DeletePVar(i, "TimeLogged");
				KickFromServer(i);
			}
			continue;
		}
		if(GetPVarInt(i, "Flood") > 30) KickFromServer(i);
		if(GetPlayerState(i) == PLAYER_STATE_DRIVER) SpeedSecond(i);
		if(GetPVarInt(i, "pMuted") > 0)
		{
		    SetPVarInt(i, "pMuted", GetPVarInt(i, "pMuted")-1);
            SetPlayerInt(GetName(i), "Mute", GetPVarInt(i, "pMuted"));
            if(GetPVarInt(i, "pMuted") <= 0)
            {
                SetPlayerInt(GetName(i), "Mute", GetPVarInt(i, "pMuted"));
                SetPVarInt(i, "pMuted", 0);
				SendClientMessage(i, COLOR_CREAM, "[S] �������� �������� ���� ������������� ���������� � ���������� ��������� �������.");
			}
		}
	}
	if(TOTALTREE == 37)
	{
	    for(new i; i < sizeof(Wood); i++)
		{
	    	DestroyObject(gWood[i]);
	    	gWood[i] = CreateObject(616,Wood[i][0],Wood[i][1],Wood[i][2],0.0000000,0.0000000,0.0000000);
		}
		TOTALTREE = 0;
	}
	if(Timer == 10)
	{
		for(new Vehicleid; Vehicleid < MAX_VEHICLES; ++Vehicleid)
 		{
		  	if(GetGVarInt("Engine", Vehicleid) && !GetGVarFloat("Fuel", Vehicleid))
			{
				GetVehicleParamsEx(Vehicleid,Vehicle[0],Vehicle[1],Vehicle[2],Vehicle[3],Vehicle[4],Vehicle[5],Vehicle[6]);
				SetVehicleParamsEx(Vehicleid,VEHICLE_PARAMS_OFF,Vehicle[1],Vehicle[2],Vehicle[3],Vehicle[4],Vehicle[5],Vehicle[6]);
		 		DeleteGVar("Engine", Vehicleid);
			}
			else if(GetGVarInt("Engine", Vehicleid) && GetGVarFloat("Fuel", Vehicleid) > 0.0) SetGVarFloat("Fuel", GetGVarFloat("Fuel", Vehicleid)-0.5, Vehicleid);
	    }
		Timer = 0;
	}
	else ++Timer;
}

void OnPlayerLogin(playerid)
{
	TextDrawShowForPlayer(playerid, Text:LogoType);
	TextDrawShowForPlayer(playerid, Text:LogoType1);
	SendClientMessage(playerid, -1, "{0F8FCD}[W] ������������ ��� �� ������� "NameServer"!");
	SendClientMessage(playerid, COLOR_WHITE, "[*] - ������� ������� ������� ���, ��� �� ����������� �������� � ��� �����, ���������� � ������� ����������.");
	SetPlayerPos(playerid, 1955.6603,1626.5211,36.9891);
	SetPlayerCameraPos(playerid, 2061.7566,1677.0413,70.8934);
	SetPlayerCameraLookAt(playerid, 2036.4026,1664.2031,64.3515);

	new rows, fields;
	cache_get_data(rows, fields);
    if(rows)
	{
	    PlayAudioStreamForPlayer(playerid, "http://127.0.0.1/start.mp3", 0.0, 0.0, 0.0);
        format(string, 200, "{FFFFFF}����� ���������� �� ������ "NameServer"\n{FFFFFF}��� ��� ���������������\n\n�����:{6699FF} %s\n{FFFFFF}������� ������:",GetName(playerid));
		ShowPlayerDialog(playerid, D_LOG, d_Input, "{6699FF}�����������", string, "����","�����");
    }
    else
    {
        PlayAudioStreamForPlayer(playerid, "http://127.0.0.1/royal.mp3", 0.0, 0.0, 0.0);
        for(new i; i < 52; ++i) PlayerTextDrawShow(playerid, RegAuth[i]);
        SelectTextDraw(playerid, COLOR_PURPLE);
	}
	return true;
}

void BadLogin(playerid, pass[])
{
    new rows, fields;
	cache_get_data(rows, fields);
    if(!rows) return true;
    cache_get_row(0, 2, var);
    if(!strcmp(pass, var, true)) return LoadAccount(playerid);
    else
    {
  		if(!GetPVarInt(playerid, "wrongPass")) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �������� ���� ������ 3 ����, ��� ������ �� ���� �������: {FFFFFF}/q(uit)"), KickFromServer(playerid);
  		SetPVarInt(playerid, "wrongPass", GetPVarInt(playerid, "wrongPass")-1);
   		format(string, 170, "{FFFFFF}����� ���������� �� ������ "NameServer"\n{FFFFFF}��� ��� ���������������\n\n�����:{6699FF} %s\n{FF6347}�������� ������! �������� �������: %i",GetName(playerid), GetPVarInt(playerid, "wrongPass"));
		ShowPlayerDialog(playerid, D_LOG, d_Input, "{6699FF}�����������", string, "����","�����");
  	}
    return true;
}

void LoadAcc(playerid)
{
	new rows, fields;
    cache_get_data(rows, fields);
	if(!rows) return true;
	SetPVarInt(playerid, "pID", cache_get_row_int(0, 0));
	cache_get_row(0, 2, cDataInfo[playerid][pPassword], Mysql, 32);
	cache_get_row(0, 3, cDataInfo[playerid][IP], Mysql, 16);
	SetPVarInt(playerid, "Admin", cache_get_row_int(0, 4));
	cache_get_row(0, 5, cDataInfo[playerid][pAdmPassword], Mysql, 32);
	cache_get_row(0, 6, cDataInfo[playerid][pMail], Mysql, 64);
	SetPVarInt(playerid, "pLevel", cache_get_row_int(0, 7));
    SetPVarInt(playerid, "pCash", cache_get_row_int(0, 8));
	SetPVarInt(playerid, "Bank", cache_get_row_int(0, 9));
    SetPVarInt(playerid, "pExp", cache_get_row_int(0, 10));
	cache_get_row(0, 11, cDataInfo[playerid][pRegData], Mysql, 16);
	SetPVarInt(playerid, "pLeader", cache_get_row_int(0, 12));
	SetPVarInt(playerid, "pMember", cache_get_row_int(0, 13));
 	SetPVarInt(playerid, "pRank", cache_get_row_int(0, 14));
	SetPVarInt(playerid, "pWarn", cache_get_row_int(0, 15));
	SetPVarInt(playerid, "pSex", cache_get_row_int(0, 16));
	SetPVarInt(playerid, "pModel", cache_get_row_int(0, 17));
	SetPVarInt(playerid, "pChar", cache_get_row_int(0, 18));
	cache_get_row(0, 19, cDataInfo[playerid][pLics], Mysql, 16);
	cache_get_row(0, 20, cDataInfo[playerid][pGuns], Mysql, 40);
	cache_get_row(0, 21, cDataInfo[playerid][pAmmos], Mysql, 160);
	cache_get_row(0, 22, cDataInfo[playerid][pSkills], Mysql, 40);
	SetPVarInt(playerid, "pMuted", cache_get_row_int(0, 23));
	SetPVarInt(playerid, "pJail", cache_get_row_int(0, 24));
	SetPVarInt(playerid, "pWanted", cache_get_row_int(0, 25));
	SetPVarFloat(playerid, "pHeal", cache_get_row_float(0, 26));
	SetPVarInt(playerid, "pDrugs", cache_get_row_int(0, 27));
	SetPVarInt(playerid, "pMats", cache_get_row_int(0, 28));
	SetPVarInt(playerid, "pSpawns", cache_get_row_int(0, 29));
	SetPVarInt(playerid, "pTS1", cache_get_row_int(0, 30));
	SetPVarInt(playerid, "pTS2", cache_get_row_int(0, 31));
	SetPVarInt(playerid, "pTS3", cache_get_row_int(0, 32));
	SetPVarInt(playerid, "pTS4", cache_get_row_int(0, 33));
	SetPVarInt(playerid, "pTS5", cache_get_row_int(0, 34));
	SetPVarInt(playerid, "pJob", cache_get_row_int(0, 35));
	cache_get_row(0, 36, cDataInfo[playerid][pMarried], Mysql, MAX_PLAYER_NAME);
	SetPVarInt(playerid, "pAge", cache_get_row_int(0, 37));
	cache_get_row(0, 38, cDataInfo[playerid][pNation], Mysql, 38);
	SetPVarInt(playerid, "pAKey", cache_get_row_int(0, 39));
	SetPVarInt(playerid, "pPhone", cache_get_row_int(0, 40));
	SetPVarInt(playerid, "pExtra", cache_get_row_int(0, 41));
	SetPVarInt(playerid, "pTicket", cache_get_row_int(0, 42));
	SetSpawnInfo(playerid, 255, GetPVarInt(playerid, "pModel"), 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	SetPVarInt(playerid, "TimeLogged", -1);
	SetPVarInt(playerid, "Logged", 1);
	SpawnPlayer(playerid);
	return true;
}

void LoadOrg()
{
    new time = GetTickCount();
    new rows, fields;
    cache_get_data(rows, fields);
	for(new i; i < TOTALBIZZ; i++) strmid(BizzInfo[i][bOwner],"None",0,strlen("None"),32);
	if(!rows) return true;
	for(new idx; idx < rows; idx++)
	{
        BizzInfo[idx+1][id] = cache_get_field_content_int(idx, "id", Mysql);
        cache_get_field_content(idx, "owner", BizzInfo[idx+1][bOwner], Mysql, sizeof(var));
        BizzInfo[idx+1][bType] = cache_get_field_content_int(idx, "type", Mysql);
        BizzInfo[idx+1][bPrice] = cache_get_field_content_int(idx, "price", Mysql);
        BizzInfo[idx+1][bMoney] = cache_get_field_content_int(idx, "money", Mysql);
        BizzInfo[idx+1][bEntrx] = cache_get_field_content_float(idx, "x", Mysql);
        BizzInfo[idx+1][bEntry] = cache_get_field_content_float(idx, "y", Mysql);
        BizzInfo[idx+1][bEntrz] = cache_get_field_content_float(idx, "z", Mysql);
        BizzInfo[idx+1][bExitx] = cache_get_field_content_float(idx, "xt", Mysql);
        BizzInfo[idx+1][bExity] = cache_get_field_content_float(idx, "yt", Mysql);
        BizzInfo[idx+1][bExitz] = cache_get_field_content_float(idx, "zt", Mysql);
        BizzInfo[idx+1][bMenux] = cache_get_field_content_float(idx, "menux", Mysql);
        BizzInfo[idx+1][bMenuy] = cache_get_field_content_float(idx, "menuy", Mysql);
        BizzInfo[idx+1][bMenuz] = cache_get_field_content_float(idx, "menuz", Mysql);
        BizzInfo[idx+1][bInt] = cache_get_field_content_int(idx, "vint", Mysql);
        BizzInfo[idx+1][bVW] = cache_get_field_content_int(idx, "virt", Mysql);
        BizzInfo[idx+1][bMIcon] = cache_get_field_content_int(idx, "icon", Mysql);
        cache_get_field_content(idx, "name", BizzInfo[idx+1][bName], Mysql, sizeof(var));
        BizzInfo[idx+1][bEnter] = cache_get_field_content_int(idx, "penter", Mysql);
        BizzInfo[idx+1][bLock] = cache_get_field_content_int(idx, "block", Mysql);
        BizzInfo[idx+1][bProduct] = cache_get_field_content_int(idx, "product", Mysql);
        BizzInfo[idx+1][bTill] = cache_get_field_content_int(idx, "till", Mysql);
        BizzInfo[idx+1][bLockTime] = cache_get_field_content_int(idx, "locktime", Mysql);

		if(BizzInfo[idx+1][bType] < 22) BizzInfo[TOTALBIZZ][bIcon] = CreateDynamicMapIcon(BizzInfo[idx+1][bEntrx], BizzInfo[idx+1][bEntry], BizzInfo[idx+1][bEntrz], BizzInfo[idx+1][bMIcon], 0, -1, -1, -1,200.0);
		if(BizzInfo[idx+1][bType] < 22)
		{
  			BizzInfo[idx+1][bPickup] = CreatePickup(19135,1, BizzInfo[idx+1][bEntrx],BizzInfo[idx+1][bEntry],BizzInfo[idx+1][bEntrz]);
			BizzInfo[idx+1][bPickupExit] = CreatePickup(19135, 1, BizzInfo[idx+1][bExitx], BizzInfo[idx+1][bExity], BizzInfo[idx+1][bExitz], BizzInfo[idx+1][bVW]);
   			BizzInfo[idx+1][bMenu] = CreateDynamicCP(BizzInfo[idx+1][bMenux], BizzInfo[idx+1][bMenuy], BizzInfo[idx+1][bMenuz], 1.0, BizzInfo[idx+1][bVW], BizzInfo[idx+1][bInt]);
			if(!strcmp(BizzInfo[idx+1][bOwner],"None",true))
			{
				format(string, 128, "{6699FF}%s\n{FFFFFF}����������� ��������", BizzInfo[idx+1][bName]); LABELBIZZ[idx+1] = Create3DTextLabel(string,COLOR_GREEN,BizzInfo[idx+1][bEntrx], BizzInfo[idx+1][bEntry], BizzInfo[idx+1][bEntrz],20.0, 0, 1);
			}
			else
			{
				format(string, 128, "{FFFFFF}{6699FF}%s\n{FFFFFF}��������: %s", BizzInfo[idx+1][bName], BizzInfo[idx+1][bOwner]); LABELBIZZ[idx+1] = Create3DTextLabel(string,COLOR_GREEN,BizzInfo[idx+1][bEntrx], BizzInfo[idx+1][bEntry], BizzInfo[idx+1][bEntrz],20.0, 0, 1);
			}
		}
		else
		{
			if(!strcmp(BizzInfo[idx+1][bOwner], "None", true))
			{
				format(string, 128, "{6699FF}%s\n{FFFFFF}����������� ��������", BizzInfo[idx+1][bName], BizzInfo[idx+1][bTill] / 3); LABELBIZZ[idx+1] = Create3DTextLabel(string,COLOR_GREEN,BizzInfo[idx+1][bEntrx], BizzInfo[idx+1][bEntry], BizzInfo[idx+1][bEntrz],20.0, 0, 1);
			}
			else
			{
				format(string, 128, "{6699FF}%s\n{FFFFFF}��������: {6699FF}%s\n{FFFFFF}���� �� 10 ������: {6699FF}%i", BizzInfo[idx+1][bName], BizzInfo[idx+1][bOwner], BizzInfo[idx+1][bTill] / 3); LABELBIZZ[idx+1] = Create3DTextLabel(string, -1 ,BizzInfo[idx+1][bEntrx], BizzInfo[idx+1][bEntry], BizzInfo[idx+1][bEntrz],20.0, 0, 1);
			}
		}
		TOTALBIZZ++;
    }
    print("*---------------------------------------------------------*");
    return printf("MySQL: ��������� ��������    :\t%i �� \t%i �.�������", TOTALBIZZ, GetTickCount() - time);
}

void LoadHouse()
{
    new rows, fields, time = GetTickCount();
    cache_get_data(rows, fields);
	if(!rows) return true;
	for(new i; i <= rows; ++i) strmid(HouseInfo[i][hOwner], "None", 0, strlen("None"), 32);
	for(new idx, ids = 1; idx < rows; ++idx, ++ids)
	{
	    HouseInfo[ids][hID] = cache_get_row_int(idx, 0);
		HouseInfo[ids][hEntr][0] = cache_get_row_float(idx, 1);
		HouseInfo[ids][hEntr][1] = cache_get_row_float(idx, 2);
		HouseInfo[ids][hEntr][2] = cache_get_row_float(idx, 3);
		HouseInfo[ids][hExit][0] = cache_get_row_float(idx, 4);
		HouseInfo[ids][hExit][1] = cache_get_row_float(idx, 5);
		HouseInfo[ids][hExit][2] = cache_get_row_float(idx, 6);
		HouseInfo[ids][hCar][0] = cache_get_row_float(idx, 7);
		HouseInfo[ids][hCar][1] = cache_get_row_float(idx, 8);
		HouseInfo[ids][hCar][2] = cache_get_row_float(idx, 9);
		HouseInfo[ids][hCar][3] = cache_get_row_float(idx, 10);
		cache_get_row(idx, 11, HouseInfo[ids][hOwner], Mysql, 32);
		cache_get_row(idx, 12, HouseInfo[ids][hDiscript], Mysql, 16);
		HouseInfo[ids][hPrice] = cache_get_row_int(idx, 13);
		HouseInfo[ids][hInt][0] = cache_get_row_int(idx, 14);
		HouseInfo[ids][hInt][1] = cache_get_row_int(idx, 15);
		HouseInfo[ids][hLock] = cache_get_row_int(idx, 16);
		HouseInfo[ids][hOplata] = cache_get_row_int(idx, 17);
        if(!strcmp(HouseInfo[ids][hOwner],"None",true))
        {
            new Float:natmx, Float:natmy, Float:natmz;
    		GetMiniMapCoord(HouseInfo[ids][hEntr][0], HouseInfo[ids][hEntr][1], natmx, natmy, natmz);
			CreateObject(31, natmx, natmy, natmz, 90.00, 0, 0.0);
        	HouseInfo[ids][hMIcon] = CreateDynamicMapIcon(HouseInfo[ids][hEntr][0], HouseInfo[ids][hEntr][1], HouseInfo[ids][hEntr][2], 31, 0,-1,-1,-1,200.0);
       		HouseInfo[ids][hPickup][0] = CreatePickup(1273, 1, HouseInfo[ids][hEntr][0], HouseInfo[ids][hEntr][1], HouseInfo[ids][hEntr][2]);
       	}
       	else
       	{
       	    HouseInfo[ids][hMIcon] = CreateDynamicMapIcon(HouseInfo[ids][hEntr][0], HouseInfo[ids][hEntr][1], HouseInfo[ids][hEntr][2], 32, 0,-1,-1,-1,200.0);
      		HouseInfo[ids][hPickup][0] = CreatePickup(1272, 1, HouseInfo[ids][hEntr][0], HouseInfo[ids][hEntr][1], HouseInfo[ids][hEntr][2]);
       	}
       	++TOTALHOUSE;
  	}
	return printf("MySQL: ��������� �����     : \t%i �� \t%i �.�������", TOTALHOUSE, GetTickCount() - time);
}

void LoadEnters()
{
    new time = GetTickCount();
    new rows, fields;
    cache_get_data(rows, fields);
	if(!rows) return true;
	for(new idx; idx != rows; idx++)
	{
		EntersInfo[idx+1][id] = cache_get_field_content_int(idx, "ID", Mysql);
	    EntersInfo[idx+1][pX] = cache_get_field_content_float(idx, "X", Mysql);
	    EntersInfo[idx+1][pY] = cache_get_field_content_float(idx, "Y", Mysql);
	    EntersInfo[idx+1][pZ] = cache_get_field_content_float(idx, "Z", Mysql);
        EntersInfo[idx+1][pM] = cache_get_field_content_int(idx, "M", Mysql);
        EntersInfo[idx+1][pT] = cache_get_field_content_int(idx, "T", Mysql);
        EntersInfo[idx+1][pI] = cache_get_field_content_int(idx, "I", Mysql);
        EntersInfo[idx+1][pV] = cache_get_field_content_int(idx, "V", Mysql);
        EntersInfo[idx+1][ptX] = cache_get_field_content_float(idx, "TX", Mysql);
        EntersInfo[idx+1][ptY] = cache_get_field_content_float(idx, "TY", Mysql);
        EntersInfo[idx+1][ptZ] = cache_get_field_content_float(idx, "TZ", Mysql);
        EntersInfo[idx+1][ptFa] = cache_get_field_content_float(idx, "TFA", Mysql);
        EntersInfo[idx+1][ptI] = cache_get_field_content_int(idx, "TI", Mysql);
        EntersInfo[idx+1][ptV] = cache_get_field_content_int(idx, "TV", Mysql);
        cache_get_field_content(idx, "Name", EntersInfo[idx+1][Name], Mysql, sizeof(query));
    	EntersInfo[idx+1][pP] = CreatePickup(EntersInfo[idx+1][pM], 1, EntersInfo[idx+1][pX], EntersInfo[idx+1][pY], EntersInfo[idx+1][pZ],EntersInfo[idx+1][pV]);
        CreateDynamic3DTextLabel(EntersInfo[idx+1][Name], COLOR_GRELIN, EntersInfo[idx+1][pX], EntersInfo[idx+1][pY], EntersInfo[idx+1][pZ], 5.0, INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1, EntersInfo[idx+1][pV], EntersInfo[idx+1][pI]);
		TOTALENTERS++;
   	}
   	return printf("MySQL: ��������� ������    :\t%i �� \t%i �.�������", TOTALENTERS,GetTickCount() - time);
}

void LoadATM()
{
	new time = GetTickCount();
    new rows, fields;
    cache_get_data(rows, fields);
	if(!rows) return true;
	for(new idx; idx < rows; idx++)
	{
		cache_get_row(idx, 0, var), ATMInfo[idx+1][id] = strval(var);
 		cache_get_row(idx, 1, var), ATMInfo[idx+1][aX] = floatstr(var);
  		cache_get_row(idx, 2, var), ATMInfo[idx+1][aY] = floatstr(var);
   		cache_get_row(idx, 3, var), ATMInfo[idx+1][aZ] = floatstr(var);
    	cache_get_row(idx, 4, var), ATMInfo[idx+1][arZ] = floatstr(var);
    	TOTALATM++;
    	ATM[idx+1] = CreateObject(2754, ATMInfo[idx+1][aX], ATMInfo[idx+1][aY], ATMInfo[idx+1][aZ], 0.0, 0.0, ATMInfo[idx+1][arZ]);
    	LABELATM[idx+1] = CreateDynamic3DTextLabel("{6699FF}��������\n{C3C3C3}������� ALT",COLOR_GREEN, ATMInfo[idx+1][aX],ATMInfo[idx+1][aY],ATMInfo[idx+1][aZ],20.0);
		//new Float:natmx, Float:natmy, Float:natmz;
    	//GetMiniMapCoord(ATMInfo[idx+1][aX], ATMInfo[idx+1][aY], natmx, natmy, natmz);
    	//CreateObject(19177, natmx, natmy, natmz, 90.00, 0, 0.0);
 	}
 	return printf("MySQL: ��������� ����������:\t%i �� \t%i �.�������", TOTALATM,GetTickCount() - time);
}

void LoadGPS()
{
    new rows, fields, time = GetTickCount();
    cache_get_data(rows, fields);
	if(!rows) return true;
	for(new idx, ids = 1; idx < rows; ++idx, ++ids)
	{
	    GPSInfo[ids][gID] = cache_get_row_int(idx, 0);
	    cache_get_row(idx, 1, GPSInfo[ids][gName], Mysql, 64);
	    GPSInfo[ids][gLoc][0] = cache_get_row_float(idx, 2);
	    GPSInfo[ids][gLoc][1] = cache_get_row_float(idx, 3);
	    GPSInfo[ids][gLoc][2] = cache_get_row_float(idx, 4);
    	++TOTALGPS;
	}
	printf("MySQL: ��������� �������   : \t%i �� \t%i �.�������", TOTALGPS,GetTickCount() - time);
	return print("*---------------------------------------------------------*");
}

void Shop(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 4.0, 1764.6361, -1885.7416, 14.8846))
	{
		Mark[playerid] = 2, Delete3DTextLabel(Marks[1]);
		Market[playerid] = 1;
		format(string, 245, "{FFFFFF}�������� ������\n���������: {CC00CC}�������\n{FFFFFF}��������: {6699FF}%s", GetName(playerid));
		Update3DTextLabelText(A_Shop[0], 0xFFFFFF, string);
	}
	return true;
}

void SaveVehicles(vidS)
{
	new M_OWNER[24], M_PLATE[32];
	mysql_real_escape_string(VehicleInfo[vidS][vOwner], M_OWNER);
	mysql_real_escape_string(VehicleInfo[vidS][vPlate], M_PLATE);
	format(query, sizeof(query), "UPDATE `"TABLE_CARS"` SET `vModel` = %i, `vColor1` = %i, `vColor2` = %i, `vPrice` = %i, `vOwner` = '%s', `vPosX` = %f, `vPosY` = %f, `vPosZ` = %f, `vPosA` = %f, `vPlate` = '%s',\
	`Locked` = %i WHERE `vID` = %i LIMIT 1",
	VehicleInfo[vidS][vModel], VehicleInfo[vidS][vColor1], VehicleInfo[vidS][vColor2], VehicleInfo[vidS][vPrice],
	M_OWNER, VehicleInfo[vidS][vPosX], VehicleInfo[vidS][vPosY], VehicleInfo[vidS][vPosZ], VehicleInfo[vidS][vPosA],
	M_PLATE, VehicleInfo[vidS][vLocked], vidS);
	return mysql_function_query(Mysql, query, false, "", "");
}

void OnPlayerName(inputtext[], playerid)
{
	new rows, fields;
	cache_get_data(rows, fields);
    if(rows)
	{
		ShowPlayerDialog(playerid, D_ADMIN+2, d_Input, "{6699FF}��� ������", "{FFFFFF}������� �������� ��� ��� ������:", "�������", "�����");
		SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ ��� ��� ������������ �� �������.");
    }
    else
    {
		SetPlayerStr(GetName(playerid), "Name", inputtext);
		if(GetPlayerBizz(playerid))
		{
		    strmid(BizzInfo[GetPVarInt(playerid, "PlayerBizz")][bOwner], inputtext, 0, strlen(inputtext), MAX_PLAYER_NAME);
		    SetBizzStr(GetPVarInt(playerid, "PlayerBizz"), "Owner", inputtext);
		    UpdateBizz(GetPVarInt(playerid, "PlayerBizz"));
		}
		if(GetPlayerHouse(playerid))
		{
            strmid(HouseInfo[GetPVarInt(playerid, "PlayerHouse")][hOwner], inputtext, 0, strlen(inputtext), MAX_PLAYER_NAME);
			SetHouseStr(GetPVarInt(playerid, "PlayerHouse"), "Owner", inputtext);
		}
    }
    return true;
}

void CheckBank(playerid)
{
    query = "";
	format(query, sizeof(query), "SELECT * FROM bank WHERE fix = '1' AND playerid = '%d'", GetPVarInt(playerid, "pID"));
	mysql_function_query(Mysql, query, true, "CheckBankMoney", "d", playerid);
	return true;
}

void CheckBankMoney(playerid)
{
    new rows,fields;
	cache_get_data(rows, fields);
	if(rows < 1)
	{
		CheckNewBank[playerid] = 1;
		return true;
	}
	SetPVarInt(playerid, "pBank", cache_get_field_content_int(0, "money", Mysql));
	return true;
}

void InfoAccountBank(playerid)
{
    new rows, fields;
	cache_get_data(rows, fields);
	if(rows < 1) return true;
	string = "";
	new aid, amoney, name[24];
 	aid = cache_get_field_content_int(0, "id", Mysql);
 	amoney = cache_get_field_content_int(0, "money", Mysql);
 	cache_get_field_content(0, "name", name, Mysql, sizeof(query));
 	CheckBank(playerid);
 	string = "";
	format(string, sizeof(string), "{FFFFFF}����� �����:\t\t\t{81CB00}�%d{FFFFFF}\n����������:\t\t\t{81CB00}%s{FFFFFF}\n������:\t\t\t{61BC00}{81CB00}%d$", aid,name,amoney);
	ShowPlayerDialog(playerid, D_BANK+10, d_Box, "{6699FF}���������� � �����", string, "�����", "�����");
	return true;
}

void GetPinAccountBank(playerid)
{
    new rows, fields;
	cache_get_data(rows, fields);
	if(rows < 1) return ShowPlayerDialog(playerid,0, d_Box,"{6699FF}������", "{FFFFFF}�� ����� ������ PIN-��� �����.", "�������", "");
	CheckBank(playerid);
	ShowPlayerDialog(playerid, D_BANK+4, d_List,"{6699FF}���������� ��������", "1. ���������� � �����\n2. ������� ��������\n3. ����� ������\n4. �������� ������\n5. ��������� �� ������ ����\n6. �������� PIN-���", "�������", "�����");
	return true;
}

void LoadAccountBank(playerid)
{
    new rows,fields;
	cache_get_data(rows,fields);
	if(rows < 1) return ShowPlayerDialog(playerid, D_NULL, d_Box, "{6699FF}��� �����", "{FFFFFF}� ��� ��� �� ������� �������� ������.", "�����", "");
	string = "";
	new str[128], name[54], ida;
	for(new idx; idx != rows; idx++)
	{
	    cache_get_field_content(idx, "name", name, Mysql, sizeof(query));
	    ida = cache_get_field_content_int(idx, "id", Mysql);
		format(str, sizeof(str), "%s �%d\n", name, ida);
		strcat(string, str);
	}
	CheckBank(playerid);
	ShowPlayerDialog(playerid, D_BANK+1, d_List, "{6699FF}��� �����", string, "�������", "�����");
	return true;
}

void GetBankMoney(playerid, money)
{
    new rows, fields;
	cache_get_data(rows, fields);
	if(rows < 1) return true;
	string = "";
	new bmoney;
 	bmoney = cache_get_field_content_int(0, "money", Mysql);
    if(bmoney >= money)
	{
		query = "";
		format(query, 256, "UPDATE `bank` SET `money` = `money` - '%d' WHERE id = '%d'", money, GetPVarInt(playerid,"AccountBank"));
		mysql_function_query(Mysql, query, false, "", "");
        GiveMoney(playerid, money);
        CheckBank(playerid);
		string = "";
		format(string, sizeof(string), "{ffffff}����:\t\t\t\t{f26c00}�%d{ffffff}\n�� �����:\t\t\t{7eb900}%d$\n{ffffff}������ ������:\t\t{7eb900}%d$\n{ffffff}������� ������:\t\t{7eb900}%d$", GetPVarInt(playerid,"AccountBank"),money,bmoney,bmoney-money);
		ShowPlayerDialog(playerid, D_BANK+10, d_Box, "{6699FF}����� ������", string, "�����", "�����");
	}
	else
	{
		ShowPlayerDialog(playerid, D_BANK+10, d_Box, "{6699FF}����� ������", "{FF7D3D}�� ����� ����� ������������ �������.", "�����", "�����");
	}
	return true;
}

void PutBankMoney(playerid, money)
{
    new rows, fields;
	cache_get_data(rows, fields);
	if(rows < 1) return true;
	string = "";
	new bmoney;
 	bmoney = cache_get_field_content_int(0, "money", Mysql);
    if(GetMoney(playerid) >= money)
	{
		query = "";
		format(query, 256, "UPDATE `bank` SET `money` = `money` + '%d' WHERE id = '%d'", money, GetPVarInt(playerid,"AccountBank"));
		mysql_function_query(Mysql, query, false, "", "");
        GiveMoney(playerid, -money);
        CheckBank(playerid);
		string = "";
		format(string, sizeof(string), "{ffffff}����:\t\t\t\t{f26c00}�%d{ffffff}\n�� ��������:\t\t{7eb900}%d$\n{ffffff}������ ������:\t\t{7eb900}%d$\n{ffffff}������� ������:\t\t{7eb900}%d$", GetPVarInt(playerid,"AccountBank"),money,bmoney,bmoney+money);
		ShowPlayerDialog(playerid, D_BANK+10, d_Box, "{6699FF}�������� ������", string, "�����", "�����");
	}
	else
	{
		ShowPlayerDialog(playerid, D_BANK+10, d_Box, "{6699FF}�������� ������", "{FF7D3D}�� ����� ����� ������������ �������.", "�����", "�����");
	}
	return true;
}

void LogAccountBank(playerid)
{
    new rows,fields;
	cache_get_data(rows,fields);
	if(rows < 1) return ShowPlayerDialog(playerid, D_BANK+10, d_Box, "{6699FF}������� ���������", "{FFFFFF}������� ��������� �����.", "�����", "�����");
	string = "";
	CheckBank(playerid);
	new str[128],data[24],outid,bmoney;
	for(new idx; idx != rows; idx++)
	{
		outid = cache_get_field_content_int(idx, "outid", Mysql);
		bmoney = cache_get_field_content_int(idx, "money", Mysql);
		cache_get_field_content(idx, "data", data, Mysql, sizeof(query));
		format(str, sizeof(str), "{F26C00}%s{FFFFFF} | ������� {7eb900}%d${ffffff} �� ���� {f26c00}�%d\n", data,bmoney,outid);
		strcat(string, str);
	}
	ShowPlayerDialog(playerid, D_BANK+10, d_Box, "{6699FF}������� ��������", string, "�����", "�����");
	return true;
}

void OnPlayerExitCar(playerid)
{
	new t_str[128];
	if(PlayerExitCount[playerid] > 3 && PlayerExitCount[playerid] < 11)
	{
 		format(t_str, sizeof(t_str), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d", PlayerExitCount[playerid]);
   		GameTextForPlayer(playerid, t_str, 900, 3);
	}
	if(PlayerExitCount[playerid] > 0 && PlayerExitCount[playerid] < 4)
	{
 		format(t_str, sizeof(t_str), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~r~%d", PlayerExitCount[playerid]);
		GameTextForPlayer(playerid, t_str, 900, 3);
	}
	if(PlayerExitCount[playerid] == 0)
	{
		new vehicleid = GetPlayerRentTaxi[playerid];
		for(new d=0; d<MAX_PLAYERS; d++)
		{
			if(IsPlayerConnected(d) && IsTaxiCar(GetPlayerVehicleID(d))) RemovePlayerFromVehicle(d);
		}
	  	KillTimer(ExitCarTimer[playerid]);
		GetPlayerRentTaxi[playerid] = INVALID_VEHICLE_ID;
		TaxiJobStarted[playerid] = false;
		PlayerTaxiStarted[playerid] = false;
		SetVehicleToRespawn(vehicleid);
		for(new d=0; d<MAX_PLAYERS; d++)
		{
	    	if(IsPlayerConnected(d) && PlayerCalledTaxi[d]) RemovePlayerMapIcon(playerid, d);
	  	}
	}
 	else
 	{
		PlayerExitCount[playerid] -= 1;
 	}
 	return true;
}

void OnPlayerFinishedRace(playerid)
{
	TogglePlayerControllable(playerid, true);
	PlayerService[GetPlayerCarPass(playerid)] = playerid;
	RemovePlayerFromVehicle(GetPlayerCarPass(playerid));
	return true;
}

void OnPlayerShowTaxiDialog(playerid)
{
	if(PlayerRentTaxi[playerid])
	{
		new t_str[128];
		format(t_str, sizeof(t_str), "{FFFFFF}\
  		����� �������� ��������� ����������, ��� ���������� ��� ����������.\n\
		���� ������: {CECECE}%d$\
		", TAXI_PRICERENT);
		ShowPlayerDialog(playerid, D_TD, DIALOG_STYLE_MSGBOX, "{AFE01B}������ ����������", t_str, "��", "���");
 	}
 	else
 	{
		ShowPlayerDialog(playerid, 00000, 0, "", "", "", "");
		KillTimer(TaxiDialogTimer[playerid]);
 	}
 	return true;
}

stock IsTaxiCar(vehicleid)
{
	for(new i=0; i<MAX_TAXI; i++)
	{
	    if(vehicleid == TAXI_ID[i]) return 1;
	}
	return 0;
}

stock GetPriceTaxi(playerid)
{
	new Float:dist = floatsqroot(floatpower(floatabs(floatsub(LASTPOS[playerid][0],FIRSTPOS[playerid][0])),2)
	+floatpower(floatabs(floatsub(LASTPOS[playerid][1],FIRSTPOS[playerid][1])),2)
	+floatpower(floatabs(floatsub(LASTPOS[playerid][2],FIRSTPOS[playerid][2])),2));
	return floatround(dist*TAXI_PRICEROUT);
}

stock IsPlayerInWater(playerid)
{
	new anim = GetPlayerAnimationIndex(playerid);
	if (((anim >= 1538) && (anim <= 1542)) || (anim == 1544) || (anim == 1250)) return true;
	return false;
}

stock GetPriceTaxiEx(playerid)
{
	new Float:POS[3];
	GetPlayerPos(playerid, POS[0], POS[1], POS[2]);
    new Float:dist = floatsqroot(floatpower(floatabs(floatsub(POS[0],FIRSTPOS[playerid][0])),2)
	+floatpower(floatabs(floatsub(POS[1],FIRSTPOS[playerid][1])),2)
	+floatpower(floatabs(floatsub(POS[2],FIRSTPOS[playerid][2])),2));
	return floatround(dist*TAXI_PRICEROUT);
}

stock GetPlayerCarDriver(playerid)
{
   	for(new i=0; i<MAX_PLAYERS; i++)
	{
   		if(IsPlayerConnected(i) && GetPlayerVehicleSeat(i) == 0 && GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid) && TaxiJobStarted[i]) return i;
   	}
	return INVALID_PLAYER_ID;
}

stock GetPlayerPoint(playerid)
{
	new zone[32],bool:getzone;
    for(new i=0; i<sizeof(gZoneInfo); i++)
    {
       	if(LASTPOS[playerid][0] >= gZoneInfo[i][SAZONE_AREA][0]
		&& LASTPOS[playerid][0] <= gZoneInfo[i][SAZONE_AREA][3]
		&& LASTPOS[playerid][1] >= gZoneInfo[i][SAZONE_AREA][1]
		&& LASTPOS[playerid][1] <= gZoneInfo[i][SAZONE_AREA][4])
       	{
        	format(zone, sizeof(zone), gZoneInfo[i][SAZONE_NAME]);
        	getzone = true;
        	break;
       	}
    }
    if(!getzone) zone = "����������";
    return zone;
}

stock GetPlayerZone(playerid)
{
	new Float:POS[3], zone[32], bool:getzone;
	GetPlayerPos(playerid, POS[0], POS[1], POS[2]);
    for(new i = 0; i < sizeof(gZoneInfo); i++)
    {
       	if(POS[0] >= gZoneInfo[i][SAZONE_AREA][0]
	    && POS[0] <= gZoneInfo[i][SAZONE_AREA][3]
	    && POS[1] >= gZoneInfo[i][SAZONE_AREA][1]
		&& POS[1] <= gZoneInfo[i][SAZONE_AREA][4])
       	{
        	format(zone, sizeof(zone), gZoneInfo[i][SAZONE_NAME]);
        	getzone = true;
        	break;
       	}
    }
    if(!getzone) zone = "����������";
    return zone;
}

stock GetPlayerCarPass(playerid)
{
   	for(new i=0; i<MAX_PLAYERS; i++)
	{
   		if(IsPlayerConnected(i) && GetPlayerVehicleSeat(i) != 0 && GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid)) return i;
   	}
	return INVALID_PLAYER_ID;
}

stock Gps_Activate(playerid)
{
	if(cDataInfo[playerid][pGPS] <= 1) GangZoneHideForPlayer(playerid, GZ_ZONE);
	if(cDataInfo[playerid][pGPS] == 0) GZ_ZONE = GangZoneCreate(-2976.5625, -3421.875, 3609.375, 2953.125), GangZoneShowForPlayer(playerid, GZ_ZONE, 0x000000FF);
}

CreateSelectionMenu(playerid)
{
	gBackgroundTextDrawId[playerid] = CreatePlayerBackgroundTextDraw(playerid, DIALOG_BASE_X, DIALOG_BASE_Y + 20.0, DIALOG_WIDTH, DIALOG_HEIGHT);
	gHeaderTextDrawId[playerid] = CreatePlayerHeaderTextDraw(playerid, DIALOG_BASE_X, DIALOG_BASE_Y);
	ShowPlayerModelPreviews(playerid);
}

stock Tranquilizator(playerid)
{
	DestroySelectionMenu(playerid);
	SetPVarInt(playerid, "skinc_active", 1);
	CreateSelectionMenu(playerid);
	SelectTextDraw(playerid, 0xACCBF1FF);
	return true;
}

void GatWood(playerid)
{
    KillTimer(WoodTimer[playerid]);
	DestroyObject(gWood[GetPVarInt(playerid, "Wood")]);
	DisablePlayerCheckpoint(playerid);
	WoodP[GetPVarInt(playerid, "Wood")] = CreatePickup(1463, 3, Wood[GetPVarInt(playerid, "Wood")][0], Wood[GetPVarInt(playerid, "Wood")][1], Wood[GetPVarInt(playerid, "Wood")][2]+1.5,0);
    return false;
}

void Quit(playerid) return Kick(playerid);

void ClearText(playerid) return ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,0,0,0,0);

public OnPlayerCommandCall(playerid, cmdtext[])
{
	if(!IsPlayerConnected(playerid) || !GetPVarInt(playerid,"Logged")) return false;
	if(GetPVarInt(playerid,"AntiFlood") > gettime())
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, NoFlood);
		SetPVarInt(playerid, "Flood", GetPVarInt(playerid, "Flood") +5);
		return false;
	}
	printf("�����: '%s' ����������� ������� '%s'", GetName(playerid), cmdtext);
	return true;
}

public OnPlayerCommandFinish(playerid, cmdtext[], success)
{
    if(!success) SendClientMessage(playerid, COLOR_GREY, "[!] ������ ������� �� ���������� ������� '/setup' ��� ��������� ������!");
	SetPVarInt(playerid,"AntiFlood", gettime() +1);
	return true;
}

CMD:testgun(playerid, params[])
{
	if(GetPVarInt(playerid, "pMember") == 0) SetPVarInt(playerid, "pMember", 7);
	if(GetPVarInt(playerid, "pMember") == 7) SetPVarInt(playerid, "pMember", 0);
	GivePlayerWeapon(playerid, 24, 50);
	GivePlayerWeapon(playerid, 38, 50);
	return GivePlayerWeapon(playerid, 31, 50);
}

CMD:unrent(playerid, params[])
{
    if(!TaxiJobStarted[playerid]) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������������ ����������.");
	ShowPlayerDialog(playerid, D_TD+3, DIALOG_STYLE_MSGBOX, "{6699FF}������ ������", "{FFFFFF}\
	�� ������������� ������ �������� ������ ����������?", "��", "���");
	return true;
}

CMD:ambient(playerid, params[])
{
    PlayAudioStreamForPlayer(playerid, "http://127.0.0.1/ambient.mp3", 0.0, 0.0, 0.0);
 	return ShowPlayerDialog(playerid, D_AMBIENT, d_List, "{6699FF}�������� �������������", "1. Delicious\n2. Oblicious", "�������", "�����");
}

CMD:aug(playerid, params[]) return ShowPlayerDialog(playerid, D_AUG, d_List, "{6699FF}�����������", "1. ���������� ���������\n2. �������� ������� '��������'\n3. ��������\n4. ������� ����������\n5. ��������� �������\n6. ���������� �������\n7. ������������", "�������","�����");

CMD:rules(playerid, params[])
{
    format(ShowRulesDialog, sizeof(ShowRulesDialog), "%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
	RulesDialog[0], RulesDialog[1], RulesDialog[2], RulesDialog[3], RulesDialog[4], RulesDialog[5], RulesDialog[6], RulesDialog[7], RulesDialog[8], RulesDialog[9], RulesDialog[10], RulesDialog[11], RulesDialog[12], RulesDialog[13], RulesDialog[14], RulesDialog[15], RulesDialog[16], RulesDialog[17]);
	ShowPlayerDialog(playerid, D_NULL, d_Box, "{6699FF}������� �������", ShowRulesDialog, "�����", "");
	return true;
}

CMD:pmenu(playerid, params[]) return cmd::setup(playerid, params);
CMD:help(playerid, params[]) return cmd::setup(playerid, params);
CMD:setup(playerid, params[]) return ShowPlayerDialog(playerid, D_MENU, d_List, "{6699FF}���� ������", "1. ����������\n2. ������� �������\n3. ������� �������\n4. ������ �� �������\n5. ��������� ������������\n6. ���������\n7. ������ ���������\n8. ����� � ��������������\n9. �������������\n10. �������������", "�������","�����");

CMD:pass(playerid, params[])
{
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /pass [ID ������]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	return Passport(params[0]);
}

CMD:glass(playerid, params[])
{
	if(sscanf(params, "i", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[CMD] �����������: /glasses [0-1-3]");
	if(params[0] < 0 || params[0] > 3) return SendClientMessage(playerid, COLOR_GREEN, "ID �� 0 �� 3!");
	RemovePlayerAttachedObject(playerid, 2);
	switch(params[0])
	{
	    case 1: SetPlayerAttachedObject(playerid,2, 19006, 2, 0.1, 0.03, 0.0, 0.0, 90.0, 90.0);
	    case 2: SetPlayerAttachedObject(playerid,2, 19007, 2, 0.1, 0.03, 0.0, 0.0, 90.0, 90.0);
	    case 3: SetPlayerAttachedObject(playerid,2, 19008, 2, 0.1, 0.03, 0.0, 0.0, 90.0, 90.0);
	}
	return true;
}

CMD:fraction(playerid, params[])
{
    if(!GetPVarInt(playerid, "Logged")) return true;
    new full = 0;
	query = "", string = "";
    strcat(query, "����������� - ��������� - ��� - �������\n\n");
	foreach(new i: Player)
	{
	    if(!GetPVarInt(i, "Logged")) continue;
		if(GetPVarInt(i, "pLeader") > 0)
		{
			full++;
  			format(string, sizeof(string), "{FFFFFF}%s - %s - %s - %i\n", Fractions_Type(i), Ranks_Type(i), GetName(i), GetPVarInt(i, "pPhone"));
  			strcat(query, string);
  			if(full == 0) return format(string, sizeof(string), "{FFFFFF}������� � ���� �� ����������");
		}
		ShowPlayerDialog(playerid, D_NULL, d_Box, "{6699FF}������������ ������", query, "�������", "");
 	}
  	if(full == 0) SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������� � ���� �� ����������!");
	return true;
}

CMD:view(playerid, params[])
{
	if(!GetPVarInt(playerid, "Logged")) return true;
    if(GetPVarInt(playerid, "pMember") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
    new full = 0;
	query = "", string = "";
    strcat(query,"��� - ���� - ������� - ID\n\n");
	foreach(new i: Player)
	{
	    if(!GetPVarInt(i, "Logged")) continue;
		if(GetPVarInt(i, "pMember") == GetPVarInt(i, "pMember"))
		{
			full++;
  			format(string, sizeof(string),"{ffffff}%s - %s - %i - ID:%i\n", GetName(i), Ranks_Type(i), GetPVarInt(i, "pLevel"), i);
  			strcat(query, string);
  			if(full == 0) return format(string, sizeof(string), "{FFFFFF}������ ����������� � ���� �� ����������");
		}
		ShowPlayerDialog(playerid, D_NULL, d_Box,"{6699FF}����� ����������� � ����", query,"�������","");
 	}
	return true;
}

CMD:id(playerid, params[])
{
    if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "[C.M.D] ����������� /id [��� ������]");
	if(params[0] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� �� ����������� � ���� / ����������");
	SendMes(playerid, COLOR_WHITE, "[S] ID ������: %d - %s", params[0], GetName(params[0]));
	return true;
}

CMD:invite(playerid, params[])
{
    if(InvitePlayer(playerid) != 0)
    {
	   	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "[C.M.D] �����������: /invite [ID ������]");
		if(GetPVarInt(params[0], "pMember") > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� ������� � ������ �����������!");
		if(GetPVarInt(params[0], "pWarn") != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������ ���� �������� �������������� (Warn)");
		if(GetPVarInt(params[0], "pAdmin") != 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ ������� ��������������!");
		if(GetPVarInt(params[0], "pLevel") < 2) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������ ��� ������ ���� 2 � �����!");
		if(IsPlayerInAnyVehicle(params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� �� ������ ���������� � ����������!");
		if(!IsPlayerInRangeOfPlayer(15.0, playerid, params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� ������� ������!");
		SendMes(playerid, COLOR_BLUE, "[F]�� ���������� %s �������������� � ����� �����������", GetName(params[0]));
		string = "";
		SetPVarInt(params[0], "PlayerInvite", playerid);
		format(string,128,"{FFFFFF}%s ���������� ��� �������������� � \"%s\"\n\n�� ��������?", GetName(playerid));
		ShowPlayerDialog(params[0], D_FRACTION, d_Box, "{6699FF}�����������", string, "��", "���");
	}
	else SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	return true;
}

CMD:uninvite(playerid, params[])
{
    if(UnInvitePlayer(playerid) != 0)
	{
	   	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "[C.M.D] �����������: /uninvite [ID ������]");
		if(GetPVarInt(params[0], "pMember") == 0) return SendClientMessage(playerid, COLOR_GREY, "����� �� ���������� � �����������!");
		if(GetPVarInt(params[0], "pMember") != GetPVarInt(playerid, "pMember")) return SendClientMessage(playerid, COLOR_GREY, "����� ���������� � ������ �����������!");
        if(GetPVarInt(params[0], "pRank") >= GetPVarInt(playerid, "pRank")) return SendClientMessage(playerid, COLOR_GREY, "����� ������ �� �����/������ ��� ������");
		SendMes(playerid, COLOR_BLUE, "[F] �� ������� %s �� ����������� \"%s\"", GetName(params[0]));
		SendMes(params[0], COLOR_BLUE, "[F] %s ������ ��� �� ����������� \"%s\"", GetName(playerid));
		LeaveFractionPlayer(params[0]);
	}
	else SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	return true;
}

CMD:gps1(playerid, params[])
{
    GangZoneHideForPlayer(playerid, GZ_ZONE);
	cDataInfo[playerid][pGPS] = 1;
	return true;
}

CMD:gps(playerid, params[])
{
    if(!cDataInfo[playerid][pGPS]) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� ����������� �������!");
	if(GetPVarInt(playerid,"GPS"))
	{
	   	DeletePVar(playerid,"GPS");
   		DisablePlayerRaceCheckpoint(GPS_ACTIVE[playerid]);
   		RemovePlayerMapIcon(playerid, 99);
   		format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   	ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
	}
	else
	{
	    format(string, sizeof(string), "1. ������������ ����������\n2. �����������\n3. ������\n4. �������� �������\n5. �����\n6. ����������\n7. ��������������\n8. ���������\n{990000}������� ��������������: %s", GetPlayerZone(playerid));
	   	ShowPlayerDialog(playerid, D_GPS, d_List, "{6699FF}���������", string, "�������", "�����");
	}
	return true;
}

CMD:phone(playerid, params[])
{
    if(GetPVarInt(playerid, "pPhone") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� ��������.");
	ShowPlayerDialog(playerid, D_MOBILE, d_List, "{6699FF}������� �������", "1. ���������� ������\n2. ���������� �����\n3. �������� �������\n4. ���/���� �������", "�������", "�����");
	return true;
}

CMD:incar(playerid, params[])
{
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /incar [ID ������]");
	if(params[0] == playerid) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ ��������� ������ ������ ����.");
	if(PlayerCuffed[params[0]] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "����� ������ ���� ������� ��� ���������� � ����������.");
	if(!IsPlayerInRangeOfPlayer(8.0, playerid, params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� ��������� ������ �� ������� ��������.");
	new seat = GetFreeSeat(GetPlayerVehicleID(playerid));
	SetPlayerSpecialAction(params[0], SPECIAL_ACTION_CUFFED);
    TogglePlayerControllable(params[0], 0);
	PutPlayerInVehicle(params[0], GetPlayerVehicleID(playerid), seat);
	return true;
}

CMD:star(playerid, params[])
{
    if(IsACop(playerid))
	{
		if(sscanf(params, "us", params[0], params[1])) return SendClientMessage(playerid, COLOR_WHITE, "[C.M.D] �����������: /star [ID ������] [������� ������]");
		//if(cDataInfo[params[0]][pJail] > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ ����� ��������� � ������.");
		if(IsACop(params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ ����� ������� � ��������������� �������.");
		if(cDataInfo[params[0]][pWanted] >= 6) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ �������� ����� 6 ���� �� ������.");
		cDataInfo[params[0]][pWanted]++;
		if(cDataInfo[params[0]][pWanted] - 1 == 0) cDataInfo[params[0]][pWantedTime] = 1800 + random(300);
		SetPlayerWantedLevel(params[0], cDataInfo[params[0]][pWanted]);
		SetPlayerCriminal(params[0], GetName(playerid), params[1]);
	}
	else SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	return true;
}

CMD:jail(playerid, params[])
{
    if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /jail [ID ������]");
	if(params[0] == playerid) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ �������� ��������� �� ����.");
	if(!IsPlayerInRangeOfPlayer(8.0, playerid, params[0])) return SendClientMessage(playerid, COLOR_GREY, "[!] ����� ��������� ������ �� ������� ��������.");
    if(IsACop(params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ ����� ������� � ��������������� �������.");
    if(PlayerCuffed[params[0]] == true) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ������ ��� ������ ���������.");
    SendMes(playerid, 0x6495EDFF, "[P] �� ������ ��������� �� %s", GetName(params[0]));
    SendMes(params[0], 0x6495EDFF, "[ME] %s ����� �� ��� ���������", GetName(playerid));
	SetPlayerAttachedObject(params[0], 5, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
 	SetPlayerSpecialAction(params[0], SPECIAL_ACTION_CUFFED);
    TogglePlayerControllable(params[0], 0);
    PlayerCuffed[params[0]] = true;
	return true;
}

CMD:wanted(playerid, params[])
{
	if(IsACop(playerid))
	{
	    new full, str[90];
	    foreach(new i: Player)
	    {
	        if(cDataInfo[i][pWanted] > 0)
	        {
	            string = "";
		   		format(str, sizeof(str),"{FFFFFF}%s - ������� �������: %i\n", GetName(i), cDataInfo[i][pWanted]);
		    	strcat(string, str);
		    	full++;
	        }
	    }
	    if(full == 0) { string = "", strcat(string, "{FFFFFF}���������� �� �������"); }
	    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"{6699FF}� �������", string,"�������","");
	}
	else SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	return true;
}

CMD:delete(playerid, params[])
{
    if(IsACop(playerid))
	{
	    if(sscanf(params, "i", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "�������: /clear [id ������]");
  		if(params[0] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� �� ��������� � ���� SA-MP.");
		if(params[0] == playerid) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ ����� ������ ���� ������.");
		SendMes(playerid, 0x6495EDFF, "[P] �� ����� ������ ������� � %s'�", GetName(params[0]));
		SendMes(params[0], 0x6495EDFF, "[ME] ����������� %s ���� � ��� ������ �������", GetName(playerid));
		string = "";
		format(string, 128, "[F] ����������� %s �����(��) � ���� ������ �������", GetName(playerid));
		ProxDetector(playerid, 30.0, COLOR_ORANGE, string);
		cDataInfo[params[0]][pWanted] =0;
		SetPlayerWantedLevel(params[0], 0);
	}
	else SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	return true;
}

CMD:superinvite(playerid, params[])
{
	if(!IsAV(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /superinvite [ID ������]");
	if(params[0] == playerid) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ ������ ������������� � ������ � ����� ������ ����!");
    if(!IsPlayerInRangeOfPlayer(8.0, playerid, params[0])) return SendClientMessage(playerid, COLOR_GREY, "[!] ����� ��������� ������ �� ������� �������� �������������.");
    if(IsACop(params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ ����� ������� � ��������������� �������.");
    if(PlayerCuffed[params[0]] == true) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������ ��� ���� ������������� � ������ � �����!");
    SendMes(playerid, 0x6495EDFF, "[P] �� ������ ������������� � ������ � ����� %s", GetName(params[0]));
    SendMes(params[0], 0x6495EDFF, "[ME] %s �������� ��� �������������� � ������ � �����", GetName(playerid));
    SetPVarInt(params[0], "pTicket", true);
    SetPlayerInt(GetName(playerid), "Ticket", GetPVarInt(playerid, "pTicket"));
    return true;
}

CMD:unjail(playerid, params[])
{
    if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /unjail [ID ������]");
	if(params[0] == playerid) return SendClientMessage(playerid, COLOR_GREY, "[!] �� �� ������ ������� ��������� �� ����.");
	if(!IsPlayerInRangeOfPlayer(8.0, playerid, params[0])) return SendClientMessage(playerid, COLOR_GREY, "[!] ����� ��������� ������ �� ������� ��������.");
    if(IsACop(params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ ����� ������� � ��������������� �������.");
    if(PlayerCuffed[params[0]] == false) return SendClientMessage(playerid, COLOR_GREY, "[!] � ������ ��� ����� ���������!");
    SendMes(playerid, 0x6495EDFF, "[P] �� ����� ��������� � %s", GetName(params[0]));
    SendMes(params[0], 0x6495EDFF, "[ME] %s ���� � ��� ���������", GetName(playerid));
    RemovePlayerAttachedObject(params[0], 5);
 	SetPlayerSpecialAction(params[0], SPECIAL_ACTION_NONE);
    TogglePlayerControllable(params[0], 1);
    PlayerCuffed[params[0]] = false;
	return true;
}

CMD:taxi(playerid, params[])
{
	new m_string[128];
	new name[24];GetPlayerName(playerid, name, 24);
	if(TaxiJobStarted[playerid]) return SendClientMessage(playerid, -1, "{27C400}[W] ��� ��������� �������� ����������.");
	if(!PlayerCalledTaxi[playerid])
	{
		PlayerCalledTaxi[playerid] = true;
		SendClientMessage(playerid, -1, "{B5E01B}[M] �� ������� ������� ����������. �������� ��� �� ���� �����.");
		SendClientMessage(playerid, -1, "{B5E01B}[M] �������: /ctaxi �������� ����� �������� ����� ����������.");
		format(m_string, sizeof(m_string), "{B5E01B}[W] ����� %s ������ ����������. �����: %s", name, GetPlayerZone(playerid));
		for(new i=0; i<MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && TaxiJobStarted[i]) SendClientMessage(i, -1, m_string);
		}
	}
  	else
	{
		PlayerCalledTaxi[playerid] = false;
		SendClientMessage(playerid, -1, "{B5E01B}[M] �� �������� ����� ����������.");
  		format(m_string, sizeof(m_string), "{B5E01B}[M] ����� %s ������� ����� ����������.", name);
		for(new i=0; i<MAX_PLAYERS; i++)
		{
	   		if(IsPlayerConnected(i) && TaxiJobStarted[i])
			{
				SendClientMessage(i, -1, m_string);
				RemovePlayerMapIcon(i, playerid);
			}
 		}
	}
	return true;
}

CMD:seller(playerid, params[])
{
	if(Markets(playerid)) Shop(playerid);
	return true;
}

CMD:shop(playerid, params[])
{
	if(sscanf(params, "dd", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /shop [ID ������] [��������� ��������]");
	if(params[1] < 20 || params[1] > 500) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ��������� �������� �� 20 �� 500$!");
	new objectives[128];
	Offer[params[0]] = playerid, Opt[params[0]] = params[1], SetPVarInt(params[0], "Sell", 1);
	format(objectives, sizeof(objectives), "{1E90FF}[I] �� ���������� ������ {6699FF}%s {1E90FF}������ �������� ������ �� {6699FF}%d$", GetName(params[0]), params[1]);
	SendClientMessage(playerid, 0x1e90ffff, objectives);
	format(objectives, sizeof(objectives), "{1E90FF}[I] �������� {6699FF}%s {1E90FF}��������� ��� ������ �������� ������ �� {6699FF}%d$", GetName(playerid), params[1]);
	SendClientMessage(params[0], 0x1e90ffff, objectives);
	SendClientMessage(params[0], 0x6495EDFF, "{1E90FF}[I] ������� {03C03C}Y {1E90FF}����� ���������� ��� ��� {FF7518}N {1E90FF}��� ������");
	return true;
}

CMD:hp(playerid, params[])
{
    if(GetPVarInt(playerid, "pMember") != 15) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
    if(GetPVarInt(playerid, "pMember") != 16) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
    if(GetPVarInt(playerid, "pMember") != 17) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /heal [ID ������]");
	if(params[0] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� �� ��������� � ���� SA-MP.");
	if(playerid == params[0]) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ �������� ������ ����!");
	new Float:shealth;
	GetPlayerHealth(params[0], shealth);
	if(shealth >= 100.0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ���� ����� �� ��������� � �������.");
	SendMes(playerid, 0x6495EDFF, "[P] �� ���������� �������� %s", GetName(params[0]));
	SendMes(params[0], 0xffffffFF, "{1E90FF}[ME] %s: ��������� ��� ����������. ����� ����������� ������� \"{03C03C}Y{1E90FF}\" ��� \"{FF7518}N{1E90FF} ��� ������\"", GetName(playerid));
	SetPVarInt(params[0], "PlayerHeal", playerid);
	SetPVarInt(params[0], "KeyHeal", 1);
	return true;
}

CMD:givelicense(playerid, params[])
{
	if(GetPVarInt(playerid, "pMember") != 2) return true;
	if(GetPVarInt(playerid, "pMember") != 3) return true;
	if(GetPVarInt(playerid, "pRank") < 6) return true;
    if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "[C.M.D] �����������: /givelicense [ID ������]");
    if(!IsPlayerInRangeOfPlayer(8.0, playerid, params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� ��������� ������ �� ���.");
    SetPVarInt(playerid,"PlayerLic", params[0]);
	ShowPlayerDialog(playerid, D_RULER, d_List, GetName(params[0]), "1. ������������ �����\n2. �������� �� ������\n3. �������� �� ������\n4. �������� �� ������", "�������", "�����");
	return true;
}

CMD:inject(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "�� �� ����!");
  	if(GetPlayerVehicleID(playerid) >= PDcar[0] && GetPlayerVehicleID(playerid) <= PDcar[56])
	{
		if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /inject [ID ������]");
   	 	if(!IsPlayerInRangeOfPlayer(8.0, playerid, params[0])) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� ��������� ������� ������!");
    	if(PlayerCuffed[params[0]] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ������ �� ������ ���������!");
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 523 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 541) PutPlayerInVehicleEx(params[0],GetPlayerVehicleID(playerid),1);
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) >= 596 && GetVehicleModel(GetPlayerVehicleID(playerid)) <= 598) PutPlayerInVehicleEx(params[0],GetPlayerVehicleID(playerid),3+random(1));
		SendMes(playerid,COLOR_BLUE,"[P] �� �������� %s � ������", GetName(params[0]));
		SendMes(params[0], COLOR_BLUE,"[F] ����������� %s ������� ��� � ������", GetName(playerid));
		SetPlayerSpecialAction(params[0], SPECIAL_ACTION_NONE);
 		RemovePlayerAttachedObject(params[0],5);
	}
	return true;
}

CMD:r(playerid, params[])
{
	if(GetPVarInt(playerid, "pMember") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� � �����������!");
	if(sscanf(params, "s[64]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /r [�����]");
	format(string, 128, "[R] %s %s[%d]: %s", Ranks_Type(playerid), GetName(playerid), playerid, params[0]);
	SendRMes(GetPVarInt(playerid, "pMember"), COLOR_GREEN, string);
	return true;
}

CMD:gov(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(GetPVarInt(playerid, "pMember") == 1 || GetPVarInt(playerid, "pMember") == 2 || GetPVarInt(playerid, "pMember") == 3 || GetPVarInt(playerid, "pMember") == 4 || GetPVarInt(playerid, "pMember") == 5)
	{
		if(GetPVarInt(playerid, "pRank") < 9) return SendClientMessage(playerid, COLOR_GREY, "[!] ������� �������� � 9 �����!");
	 	if(sscanf(params, "s[100]", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "[C.M.D] �����������: /gov [�����]");
		string = "";
		format(string, 128, "���.�������: %s %s[%d]: %s", Ranks_Type(playerid), GetName(playerid), playerid, params[0]);
		SendClientMessageToAll(0x4261bcAA, string);
	}
    else SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� �� ������������� ������ �������.");
    return true;
}

CMD:f(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	if(sscanf(params, "s[64]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /f [�����]");
	format(string, 128, "[F] %s %s[%d]: %s", Ranks_Type(playerid), GetName(playerid), playerid, params[0]);
	SendFMes(COLOR_BLUE, string);
	return true;
}

CMD:n(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	if(sscanf(params, "s[64]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /n [�����]");
	format(string, 145, "(( %s: %s ))", GetName(playerid), params[0]);
	ProxDetector(playerid, 20.0, COLOR_CREAM, string);
	SetPlayerChatBubble(playerid, params[0], COLOR_GREY, 20.0, 7000);
	return true;
}

CMD:s(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
 	if(sscanf(params, "s[128]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /s [�����]");
 	if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid,"ON_LOOKERS","shout_01",1000.0,0,0,0,0,0,1);
	format(string, 128, "[...] %s �������: %s", GetName(playerid), params[0]);
	SetPlayerChatBubble(playerid, params[0], COLOR_WHITE, 70.0, 10000);
	return ProxDetector(playerid, 70.0, COLOR_WHITE, string);
}

CMD:w(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
 	if(sscanf(params, "s[128]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /w [�����]");
	format(string, 128, "[...] %s ������: %s", GetName(playerid), params[0]);
	return ProxDetector(playerid, 5.0, COLOR_GREY, string);
}

CMD:me(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(sscanf(params, "s[128]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /me [��������]");
    SetPlayerChatBubble(playerid, params[0], COLOR_PURPLE, 30.0, 5000);
	format(string, 128, "[ME] %s %s", GetName(playerid), params[0]);
    return ProxDetector(playerid, 30.0, COLOR_PURPLE, string);
}

CMD:do(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(sscanf(params, "s[128]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /do [��������]");
    SetPlayerChatBubble(playerid, params[0], COLOR_PURPLE, 30.0, 5000);
	format(string, 64, "[DO] %s (( %s ))", params[0], GetName(playerid));
	return ProxDetector(playerid, 30.0,COLOR_PURPLE, string);
}

CMD:try(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(sscanf(params, "s[100]", params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /try [��������]");
	params[0] = random(2);
	if(!params[0]) format(string, 128, "[TRY] %s %s {FA0909}| ��������",GetName(playerid), params[1]);
	else format(string, 128, "[TRY] %s %s {09FA29}| ������", GetName(playerid), params[1]);
	SetPlayerChatBubble(playerid, params[1], COLOR_PURPLE, 30.0, 5000);
	return ProxDetector(playerid, 30.0, COLOR_PURPLE, string);
}

CMD:pay(playerid, params[])
{
    if(sscanf(params, "ui", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /pass [ID] [�����]");
    if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
    if(GetMoney(playerid) < params[1]) return true;
    if(GetPVarInt(playerid, "pExp") > 14) return SendClientMessage(playerid, COLOR_WHITE, "[!] ���������� ������ ����� ������ ��� ���������� � 14 ���� � �����");
    if(playerid == params[0]) return true;
    GiveMoney(playerid, -params[1]);
    GiveMoney(params[0], params[1]);
	return true;
}

CMD:atm(playerid, params[])
{
	for(new i = 1; i <= TOTALATM; i++)
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 3.0, ATMInfo[i][aX],ATMInfo[i][aY],ATMInfo[i][aZ])) continue;
	    params[1]++;
	    BankList(playerid);
	    break;
	}
	return true;
}

CMD:time(playerid, params[])
{
    new hour, minuite, second;
    gettime(hour, minuite, second);
	if(minuite < 10) format(string, 100, "~w~%d:0%d~g~", hour, minuite);
	else format(string, 100, "~w~%d:%d~g~", hour, minuite);
	GameTextForPlayer(playerid, string, 5000, 1);
	if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid,"COP_AMBIENT","Coplook_watch",4.1,0,0,0,0,0,1);
	return true;
}

CMD:edit(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(GetPVarInt(playerid, "pMember") == 12) AdvertList(playerid);
    if(GetPVarInt(playerid, "pMember") == 13) AdvertList(playerid);
    if(GetPVarInt(playerid, "pMember") == 14) AdvertList(playerid);
	else return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���� �� ������������� ���� �������.");
	return true;
}

CMD:action(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	return ShowPlayerDialog(playerid, D_ACTION, d_List, "{6699FF}���� ��������", "{FFFFFF}1. ��������\n2. �������\n3. ��������� ��������\n4. ������������\n5. �������", "�������", "�����");
}

CMD:dinfo(playerid, params[]) return Drive(playerid);

CMD:p(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	if(Mobile[playerid] != -1) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ��� �������������� �� ��������.");
	foreach(new i: Player)
	{
		if(Mobile[i] == playerid)
		{
		    if(Ether[playerid] == true) EtherCalled[i] = true;
			Mobile[playerid] = i;
			SendMes(i, COLOR_PURPLE, "[M] %s ������� �� ������", GetName(playerid));
			string = "";
			format(string, 65, "[M] %s ������� �� ������", GetName(playerid));
			ProxDetector(playerid, 30.0, COLOR_PURPLE, string);
			if(!IsPlayerInAnyVehicle(playerid)) SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			return true;
		}
	}
	return true;
}

CMD:h(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(Mobile[playerid] == -1) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ��� �� �������������� �� ��������.");
    new caller = Mobile[playerid];
	SendClientMessage(caller, COLOR_LIGHTRED, "[!] ������� ������ �������.");
	SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
	CellTime[caller] = -1;
	CellTime[playerid] = -1;
	Mobile[caller] = -1;
	if(EtherCalled[playerid] == true) EtherCalled[playerid] = false;
	if(EtherCalled[caller] == true) EtherCalled[caller] = false;
	SendClientMessage(playerid,  COLOR_LIGHTRED, "[!] �� ������� ������.");
	Mobile[playerid] = -1;
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
	DeletePVar(playerid, "CallTime");
	DeletePVar(caller, "CallTime");
	return true;
}

CMD:sms(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(GetPVarInt(playerid, "Phone") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� �������� �������.");
    if(GetPVarInt(playerid, "pPhone") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� ��������.");
    if(sscanf(params, "is[60]", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /sms [�����] [�����]");
    if(params[0] < 1000 || params[0] > 9999999) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �������� ����� ��������!");
	new full;
	foreach(new i: Player)
	{
		if(params[0] == GetPVarInt(i, "pPhone"))
		{
		    if(Phone[i] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ����������� ���� �������� �������� �������.");
		    full++;
			PlayerPlaySound(i, 1052, 0.0, 0.0, 0.0);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

			SendMes(i, 0xFFFF00AA, "[M] [���������] %s[%i]: %s", GetName(playerid), GetPVarInt(playerid, "pPhone"), params[1]);
			SendMes(playerid, 0xFFFF00AA, "[M] [���������] %s[%i]: %s", GetName(i), GetPVarInt(playerid, "pPhone"), params[1]);
			SendClientMessage(playerid, COLOR_GREEN, "[M] ���� ��� ��������� ���� ������� ���������� ����������");
			string = "";
			format(string, 90, "[ME] %s ������� ��������� �������", GetName(playerid));
			ProxDetector(playerid, 30.0, COLOR_PURPLE, string);
   			break;
		}
	}
	if(full == 0) SendClientMessage(playerid, COLOR_GREY, "[!] ����� � ������ ������� �� ������!");
	return true;
}

CMD:c(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	if(sscanf(params, "i", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /c [�����]");
    if(GetPVarInt(playerid, "Phone") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� �������� �������.");
	if(Mobile[playerid] != -1) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ��� �������������� �� ��������!");
    if(GetPVarInt(playerid, "pPhone") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ���������� ��������.");
    if(sscanf(params, "i", params[0]))
	{
	    if(!IsPlayerInAnyVehicle(playerid)) SetPlayerSpecialAction(playerid, 11);
		ShowPlayerDialog(playerid, D_MOBILE+10, d_List, "{6699FF}������", "- ������� ����������\n- ������� ��������������\n- ������� �������", "�����", "�����");
		return true;
	}
	if(params[0] == GetPVarInt(playerid, "pPhone")) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� ������ ����������� �� ���� ����� ��������.");
	if(params[0] < 1 || params[0] > 999999) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ��������� ���� ����� �� ���������.");
	new full;
	foreach(new i: Player)
	{
		if(params[0] == GetPVarInt(i, "pPhone"))
		{
		    full++;
			if(Phone[i] == false) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ����������� ���� �������� �������� �������.");
		    if(Mobile[i] != -1) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ����������� ���� �������� ������!");
		    if(Ether[i] == true) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ �������� ����������.");
			Mobile[playerid] = i;
	      	SendMes(i, -1, "[M] ��� ������: %s (�����: %i). ����� ��������, �������: /p", GetName(playerid), GetPVarInt(playerid, "pPhone"));
	      	string = "";
			format(string, 90, "[ME] %s ������ �������", GetName(i));
			ProxDetector(i, 30.0, COLOR_PURPLE, string);
            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_WHITE, "[M] ����� �������� ������, �������: /h");
			if(!IsPlayerInAnyVehicle(playerid)) SetPlayerSpecialAction(playerid, 11);
			CellTime[playerid] = 0;
			break;
		}
	}
	if(full == 0) SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ��������� ���� ����� �� ���������.");
	return true;
}

CMD:admin(playerid, params[])
{
    if(GetPVarInt(playerid,"Admin") < 1 || GetPVarInt(playerid,"AdmLogged") == 1) return true;
    return ShowPlayerDialog(playerid, D_ADMIN, d_Input, "{6699FF}�����������", "{FFFFFF}������� ����������������� ����:", "����", "�����");
}

CMD:setstats(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /setstats [ID ������]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	SetPVarInt(playerid, "Stats", params[0]);
	return ShowPlayerDialog(playerid, D_ADMIN+1, DIALOG_STYLE_LIST, "{6699FF}����������", "1. �������� ��� ������\n2. �������� ���� ������\n3. �������� ������� ������\n4. �������� ������ ������\n5. �������� ������� ��������������\n6. �������� ������� ���������", "�������", "�����");
}

CMD:fixveh(playerid, params[])
{
    if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(!IsPlayerInAnyVehicle(playerid)) return true;
    RepairVehicle(GetPlayerVehicleID(playerid));
 	return SendClientMessage(playerid, COLOR_ORANGE, "[V] ������ ��������.");
}

CMD:setfuel(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, PlayerIsNotInCar);
	if(sscanf(params, "i", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /setfuel [���-��]");
	if(params[0] > 100 || params[0] < 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����������� �� 0 �� 100!");
	SetGVarFloat("Fuel", params[0], GetPlayerVehicleID(playerid));
	return SendMes(playerid, COLOR_LIGHTRED, "[V] �� ���������� ������� � ������: %d",params[0]);
}

CMD:setskin(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "ui", params[0],params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /setskin [ID] [Skin � ]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	if(params[1] > 312 || params[1] < 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����������� �� 0 �� 312!");
	SetPlayerSkin(params[0], params[1]);
	return SendMes(playerid, COLOR_LIGHTRED, "[A] �� ���������� ��������� ������ ������: %s", GetName(params[0]));
}

CMD:sethp(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "ui", params[0],params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /sethp [ID] [���-��]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	if(params[1] > 100 || params[1] < 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����������� �� 0 �� 100!");
	SetHealth(params[0], params[1]);
	return SendMes(playerid, COLOR_LIGHTRED, "[A] �� ���������� ������ ������: %s", GetName(params[0]));
}

CMD:tpcor(playerid, params[])
{
    if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	new Float:pos[3];
 	if(sscanf(params,"fff",pos[0],pos[1],pos[2])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /tpcor [X] [Y] [Z]");
 	SetPlayerPos(playerid, pos[0],pos[1],pos[2]);
 	return SendClientMessage(playerid, COLOR_LIGHTRED, "[A] �� ���� ����������������!");
}

/*

 ^BTS


*/

CMD:ao(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "s[140]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /ao [�����]");
	format(string, sizeof string, "[A] %s: %s", GetName(playerid), params[0]);
	return SendClientMessageToAll(COLOR_ORANGE, string);
}

CMD:ad(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
    if(GetPVarInt(playerid, "pPhone") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ��� ��������, ������ ����� � 24-7.");
    if(TOTALADVERT >= 30) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ���������� ������������ ���� ��� ������ ����������!");
    if(GetPVarInt(playerid,"ATime") > gettime()) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �������� ���������� ����� ��� � 15 ������!");
    if(GetMoney(playerid) < strlen(params[0])*3) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ������������ �������!");
	if(sscanf(params, "s[60]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /ad [�����]");
	TOTALADVERT++;
	strmid(AI[TOTALADVERT][aText],params[0],0,strlen(params[0]),128);
	strmid(AI[TOTALADVERT][aName],GetName(playerid),0,strlen(GetName(playerid)),MAX_PLAYER_NAME);
	AI[TOTALADVERT][aPhone] = GetPVarInt(playerid, "pPhone");
	SendClientMessage(playerid, COLOR_LIGHTRED, "[S] ���� ���������� ���� ���������� � ��� ��� �����������.");
	SetPVarInt(playerid,"ATime",gettime() + 15);
	return true;
}

CMD:add(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	return ShowPlayerDialog(playerid, D_ADD, d_List,"{6699FF}���� ����������","{FFFFFF}1. �������� ���\n2. �������� GPS\n3. �������� ���� / �����\n4. �������� ��������\n5. �������� ������","�������","�����");
}

CMD:veh(playerid, params[])
{
	new idveh, c1, c2;
	if(sscanf(params, "ddd", idveh, c1, c2)) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /car1 [ID ����������] [����] [1 ����] [2 ����]");
	if(idveh > 611 || idveh < 400) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] ����������� /veh [ID ����������] [1 ����] [2 ����]");
	if(c1 > 100 || c1 < 0) return SendClientMessage(playerid, COLOR_RED, "[!] ID ����� ���������� �� 0 �� 100.");
	if(c2 > 100 || c2 < 0) return SendClientMessage(playerid, COLOR_RED, "[!] ID ����� ���������� �� 0 �� 100.");
	new Float:X, Float:Y, FLoat:Z;
	GetPlayerPos(playerid, Float:X, Float:Y, Float:Z);
	new carid = CreateVehicle(idveh, Float:X, Float:Y, Float:Z, 0.0, c1, c2, 60000);
	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(carid, 0,0, alarm, doors, bonnet, boot, objective);
	SetGVarFloat("Fuel", 100.0, carid);
	SetVehicleNumberPlate(carid, "Edit");
	return true;
}

CMD:car1(playerid, params[])
{
	new Float:Pos[4], ivModel, ivPrice, ivColors[2];
	if(sscanf(params, "iiii", ivModel, ivPrice, ivColors[0], ivColors[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /car1 [ID ����������] [����] [1 ����] [2 ����]");
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	GetPlayerFacingAngle(playerid, Pos[3]);
	++ TOTAL_VEHS;
	VehicleInfo[TOTAL_VEHS][vModel] = ivModel;
	VehicleInfo[TOTAL_VEHS][vColor1] = ivColors[0];
	VehicleInfo[TOTAL_VEHS][vColor2] = ivColors[1];
	VehicleInfo[TOTAL_VEHS][vPrice] = ivPrice;
	VehicleInfo[TOTAL_VEHS][vPosX] = Pos[0];
	VehicleInfo[TOTAL_VEHS][vPosY] = Pos[1];
	VehicleInfo[TOTAL_VEHS][vPosZ] = Pos[2];
	VehicleInfo[TOTAL_VEHS][vPosA] = Pos[3];
	strmid(VehicleInfo[TOTAL_VEHS][vOwner], "None", 0, 20, 20);
	strmid(VehicleInfo[TOTAL_VEHS][vPlate], "Edit", 0, 32, 32);
	VehicleInfo[TOTAL_VEHS][vLocked] = 1;
	format(query, sizeof(query), "INSERT INTO `"TABLE_CARS"` (`vID`, `vModel`, `vColor1`, `vColor2`, `vPrice`, `vOwner`, `vPosX`, `vPosY`, `vPosZ`, `vPosA`, `vPlate`) VALUES (%d, %d, %d, %d, %d, 'None', %f, %f, %f, %f, 'Edit')",
	TOTAL_VEHS, ivModel, ivColors[0], ivColors[1], ivPrice, Pos[0], Pos[1], Pos[2], Pos[3]);
	mysql_function_query(Mysql, query, false, "", "");
	new cCar = CreateVehicle(ivModel, Pos[0], Pos[1], Pos[2], Pos[3], ivColors[0], ivColors[1], 500000);
	SetGVarFloat("Fuel", 100.0, cCar);
	SetVehicleNumberPlate(cCar, "Edit");
	OwnedVeh(cCar) = TOTAL_VEHS;
	SaveVehicles(TOTAL_VEHS);
	format(Car, 128, "[A] ��������� %i (ID: %i) ��� ������. ����: %i$", ivModel, TOTAL_VEHS, ivPrice);
	SendClientMessage(playerid, COLOR_LIGHTRED, Car);
	return true;
}

CMD:ppc(playerid, params[])
{
	if(GetPVarInt(playerid,"Logged") == 0) return true;
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
   	if(GetPVarInt(playerid,"PPC") == 1)
   	{
   	    TOTALENTERS++;
   	    new Float:Cord[4];
   	    GetPlayerPos(playerid, Cord[0], Cord[1], Cord[2]);
   	    GetPlayerFacingAngle(playerid, Cord[3]);
     	sscanf(coordc,"p<,>fffdddds[32]",
		EntersInfo[TOTALENTERS][pX], EntersInfo[TOTALENTERS][pY],EntersInfo[TOTALENTERS][pZ], EntersInfo[TOTALENTERS][pM]
		,EntersInfo[TOTALENTERS][pT],EntersInfo[TOTALENTERS][pI], EntersInfo[TOTALENTERS][pV], EntersInfo[TOTALENTERS][Name]);
		format(query, sizeof(query), "INSERT INTO "TABLE_ENTERS" (id, x, y, z, m, t, i, v, tx, ty, tz, tfa, ti, tv, name) VALUES (%d, '%f', '%f', '%f', %d, %d, %d, %d, '%f', '%f', '%f', '%f', %d, %d, '%s')",
		TOTALENTERS,EntersInfo[TOTALENTERS][pX], EntersInfo[TOTALENTERS][pY],EntersInfo[TOTALENTERS][pZ],EntersInfo[TOTALENTERS][pT], EntersInfo[TOTALENTERS][pM]
		,EntersInfo[TOTALENTERS][pI], EntersInfo[TOTALENTERS][pV],Cord[0],Cord[1],Cord[2],Cord[3],GetPlayerInterior(playerid),GetPlayerVirtualWorld(playerid),
		EntersInfo[TOTALENTERS][Name]);
		mysql_function_query(Mysql, query, false, "", "");
   	    SetPVarInt(playerid,"PPC", 0);
   	    SendMes(playerid, COLOR_LIGHTRED, "[A] ���� ����� %d ������",TOTALENTERS);
   	}
   	return true;
}

CMD:givemoney(playerid, params[])
{
   	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
    if(sscanf(params,"ui",params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /givemoney [ID] [Money]");
    if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
    return GiveMoney(params[0], params[1]);
}

CMD:payday(playerid, params[])
{
    if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
    return PayDay();
}

CMD:setint(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "ui", params[0], params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /setint [ID] [��������]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	return SetPlayerInterior(params[0], params[1]);
}

CMD:settime(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "i", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /settime [�����]");
	if(params[0] < 0 || params[0] > 23) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� �� 0 �� 23!");
	SetWorldTime(params[0]);
	return SendMes(playerid, COLOR_GREY, "[A] ����� ������������: %i", params[0]);
}

CMD:mute(playerid, params[])
{
	if(sscanf(params, "uis[64]", params[0], params[1], params[2])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /mute [ID ������] [�������� �����] [�������]");
	if(GetPVarInt(playerid, "pMuted") > 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ � ��� ������ �������� �������� ����!!!");
	SetPVarInt(params[0], "pMuted", params[1]*60);
	SetPlayerInt(GetName(playerid), "Mute", GetPVarInt(playerid, "pMuted"));
	string = "";
	format(string, 128, "[A] %s ��������� �������� %s �� %i �����. �������: %s", GetName(playerid), GetName(params[0]), params[1], params[2]);
	SendClientMessageToAll(COLOR_LIGHTRED, string);
	SendMes(params[0], COLOR_LIGHTRED,"[!] �� �������� �������� �������� ���� �� %i �����.", params[1]);
	return true;
}

CMD:unmute(playerid, params[])
{
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /unmute [ID ������]");
	if(GetPVarInt(playerid, "pMuted") == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� �� ������� �������� �������� ����!!!");
	SetPVarInt(params[0], "pMuted", 0);
	SetPlayerInt(GetName(playerid), "Mute", GetPVarInt(playerid, "pMuted"));
	string = "";
	format(string, 128, "[A] %s �������� �������� � %s",GetName(playerid), GetName(params[0]), params[1], params[2]);
	SendClientMessageToAll(COLOR_LIGHTRED, string);
	SendMes(params[0], COLOR_LIGHTRED,"[!] %s �������� � ��� �������� �������� ����.", GetName(playerid));
	return true;
}

CMD:kick(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "us", params[0],params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /kick [ID] [�������]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	format(string, 512, "[A] %s ������ %s. �������: %s", GetName(playerid), GetName(params[0]), params[1]);
	SendClientMessageToAll(COLOR_CREAM, string);
	return Kick(params[0]);
}

CMD:rr(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "us[128]", params[0],params[1])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /rr [ID] [�����]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	SendMes(params[0], COLOR_CREAM, "[A] %s: %s", GetName(playerid), params[1]);
	SendMes(playerid, COLOR_LIGHTRED, "[A] �� �������� %s: %s", GetName(params[0]), params[1]);
	return SendAdmin(COLOR_LIGHTRED, "[A] %s ������� �� ������ %s",GetName(playerid), GetName(params[0]));
}

CMD:a(playerid, params[])
{
    if(GetPVarInt(playerid, "pMuted") > 0) { SendMes(playerid, COLOR_LIGHTRED, "[!] � ��� �������� ���. ��������� ���������: %i ������.", GetPVarInt(playerid, "pMuted")); return false; }
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
    if(sscanf(params, "s[128]", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /a [�����]");
    return SendAdmin(COLOR_ORANGE, "[A] %s: %s", GetName(playerid), params[0]);
}

CMD:business(playerid, params[])
{
	if(GetPlayerBizz(playerid) == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� ��������!");
	return ShowPlayerDialog(playerid, D_BUSINESS+7, 2, "{6699FF}���� �����������", "1. ���������� � �������\n2. ������� ������\n3. ���������� ���� �� �����\n4. ���������� ���� �� ����\n5. �������� ��������\n6. ������� ������", "�������", "�����");
}

CMD:gethere(playerid, params[])
{
	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /gethere [ID]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	new Float:Ploc[3];
	GetPlayerPos(playerid, Ploc[0], Ploc[1], Ploc[2]);
	if(GetPlayerState(params[0]) == 2) SetVehiclePos(GetPlayerVehicleID(params[0]), Ploc[0], Ploc[1]+4, Ploc[2]);
	else
	{
		SetPlayerPos(params[0], Ploc[0], Ploc[1]+2, Ploc[2]);
		SetPlayerInterior(params[0], GetPlayerInterior(playerid));
		SetPlayerVirtualWorld(params[0], GetPlayerVirtualWorld(playerid));
	}
	SendMes(params[0], COLOR_CREAM, "[A] �� ���� ���������������� ���������������: %s",cDataInfo[playerid][Name]);
	return SendMes(playerid, COLOR_GREY, "[A] �� ��������������� ������: %s",cDataInfo[params[0]][Name]);
}

CMD:buybizz(playerid, params[])
{
    if(GetPlayerBizz(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ��� �������� ��������!");
    if(params[1] == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ������ ��������� ����� � ��������!");
	if(params[2] == 0) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ ��� ����� ���������!");
	for(new idx = 1; idx <= TOTALBIZZ; idx++)
    {
  		if(IsPlayerInRangeOfPoint(playerid, 5.0, BizzInfo[idx][bEntrx], BizzInfo[idx][bEntry], BizzInfo[idx][bEntrz]))
  		{
	    	params[1]++;
			if(!strcmp(BizzInfo[idx][bOwner], "None", true))
			{
	  			params[2]++;
				if(GetPVarInt(playerid, "Bank") < BizzInfo[idx][bPrice]) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] � ��� ������������ �����!");
				else
				{
				    SetPVarInt(playerid, "Bank", GetPVarInt(playerid, "Bank") - BizzInfo[idx][bPrice]);
				    SetPlayerInt(GetName(playerid), "Bank", GetPVarInt(playerid, "Bank"));
					SendClientMessage(playerid, COLOR_BLUE, "[B] �����������! �� ��������� ������");
					strmid(BizzInfo[idx][bOwner], GetName(playerid), 0, strlen(GetName(playerid)), MAX_PLAYER_NAME);
					format(query, sizeof(query), "UPDATE "TABLE_BIZZ" SET owner = '%s' WHERE id = '%d' LIMIT 1", BizzInfo[idx][bOwner], idx);
					mysql_function_query(Mysql, query, false, "", "");
					UpdateBizz(idx);
					break;
				}
			}
		}
		else params[2]++;
	}
	return true;
}

CMD:tp(playerid, params[])
{
   	if(GetPVarInt(playerid,"Admin") < 1 || !GetPVarInt(playerid,"AdmLogged")) return true;
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /tp [ID]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	new Float:Ploc[3];
	GetPlayerPos(params[0], Ploc[0], Ploc[1], Ploc[2]);
	if(GetPlayerState(playerid) == 2) SetVehiclePos(GetPlayerVehicleID(playerid), Ploc[0], Ploc[1]+4, Ploc[2]);
	else
	{
		SetPlayerPos(playerid, Ploc[0], Ploc[1]+2, Ploc[2]);
		SetPlayerInterior(playerid, GetPlayerInterior(params[0]));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(params[0]));
	}
	return SendClientMessage(playerid, COLOR_LIGHTRED, "[A] �� ���� ����������������!");
}

CMD:binfo(playerid, params[])
{
    for(new i = 1; i <= TOTALBIZZ; i++)
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 20.0, BizzInfo[i][bEntrx],BizzInfo[i][bEntry],BizzInfo[i][bEntrz])) continue;
   		if(!strcmp(BizzInfo[i][bOwner],"None",true)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ������ �� ����� ���������!");
		BizzStats(playerid, i);
		params[1]++;
		break;
	}
	if(params[1] == 0) SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ������ ���������� ����� � ��������!");
	return true;
}

CMD:en(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;
	if(!GetGVarFloat("Fuel", GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_LIGHTRED, CarHasNoFuel);
	if(!GetGVarInt("Engine", GetPlayerVehicleID(playerid)))
	{
		GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3],Vehicle[4], Vehicle[5], Vehicle[6]);
		SetVehicleParamsEx(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_ON, Vehicle[1],Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
		SetGVarInt("Engine", 1, GetPlayerVehicleID(playerid));
	}
	else
	{
		GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
		SetVehicleParamsEx(GetPlayerVehicleID(playerid), VEHICLE_PARAMS_OFF, Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	    DeleteGVar("Engine", GetPlayerVehicleID(playerid));
	}
    return true;
}

CMD:car(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_WHITE, "[!] �� �� ���������� � ������������ ��������");
	new strin[256], s[64];
	if(strmatch(VehicleInfo[OwnedVeh(GetPlayerVehicleID(playerid))][vOwner], GetName(playerid)))
	{
	    if(VehicleInfo[OwnedVeh(GetPlayerVehicleID(playerid))][vLocked] == 1) format(s, sizeof(s), "{FFFFFF}1. ������� ���������");
	    else format(s, sizeof(s), "{FFFFFF}1. ������� ���������");
	    format(strin, sizeof(Car), "%s\n{FFFFFF}2. ������� ���������\n3. ��������\n4. �������� �����", s, VehicleInfo[OwnedVeh(GetPlayerVehicleID(playerid))][vPlate]);
	    return ShowPlayerDialog(playerid, D_AUTO+1, d_List, "{6699FF}���� ����������", strin, "�������", "�����");
 	}
	else return SendClientMessage(playerid, COLOR_WHITE, "[!] ������ ��� ���������� �� ����������� ���.");
}

CMD:li(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;
	if(!GetGVarInt("Lights", GetPlayerVehicleID(playerid)))
	{
		GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	    SetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], VEHICLE_PARAMS_ON, Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
     	SetGVarInt("Lights", 1, GetPlayerVehicleID(playerid));
	}
	else
    {
   		GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	    SetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], VEHICLE_PARAMS_OFF, Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	 	DeleteGVar("Lights", GetPlayerVehicleID(playerid));
	}
    return true;
}

CMD:bonnet(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;
	if(!GetGVarInt("Bonnet", GetPlayerVehicleID(playerid)))
	{
    	GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	    SetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], VEHICLE_PARAMS_ON, Vehicle[5], Vehicle[6]);
   		SetGVarInt("Bonnet", 1, GetPlayerVehicleID(playerid));
   		SetGVarInt("Bonet", 1, GetPlayerVehicleID(playerid));
    }
   	else
	{
   		GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	    SetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], VEHICLE_PARAMS_OFF, Vehicle[5], Vehicle[6]);
 		DeleteGVar("Bonnet", GetPlayerVehicleID(playerid));
 		DeleteGVar("Bonet", GetPlayerVehicleID(playerid));
	}
    return true;
}

CMD:boot(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return true;
	if(!GetGVarInt("Boot", GetPlayerVehicleID(playerid)))
	{
    	GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	    SetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], VEHICLE_PARAMS_ON, Vehicle[6]);
	    SetGVarInt("Bonet", 1, GetPlayerVehicleID(playerid));
   		SetGVarInt("Boot", 1, GetPlayerVehicleID(playerid));
    }
   	else
	{
   		GetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], Vehicle[5], Vehicle[6]);
	    SetVehicleParamsEx(GetPlayerVehicleID(playerid), Vehicle[0], Vehicle[1], Vehicle[2], Vehicle[3], Vehicle[4], VEHICLE_PARAMS_OFF, Vehicle[6]);
	    DeleteGVar("Bonet", GetPlayerVehicleID(playerid));
 		DeleteGVar("Boot", GetPlayerVehicleID(playerid));
	}
    return true;
}

CMD:eject(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, PlayerIsNotInCar);
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� ������ ��������� �� ���� ����������!");
	if(sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_GREY, "[C.M.D] �����������: /eject [ID]");
	if(!IsPlayerConnected(params[0]) || !GetPVarInt(params[0],"Logged")) return true;
	if(playerid == params[0]) return true;
	if(!IsPlayerInVehicle(params[0],  GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] ����� ������ ��������� � ����� ����������!");
	SendMes(playerid, COLOR_CREAM, "[V] �� �������� �� ���������� %s", GetName(params[0]));
	SendMes(params[0], COLOR_CREAM, "[V] %s ������� ��� �� ����������", GetName(playerid));
    return RemovePlayerFromVehicle(params[0]);
}

CMD:home(playerid, params[])
{
	if(!GetPlayerHouse(playerid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "[!] �� �� �������� �����!");
	params[0] = GetPVarInt(playerid, "PlayerHouse");
 	if(!strcmp(GetName(playerid), HouseInfo[params[0]][hOwner],true))
 	{
 	    format(string, 128, "1. ������� ��� ������� ���\n2. ������ ����\n3. ���������\n4. ������� ���");
		return ShowPlayerDialog(playerid, D_HOUSE+2, d_List, "{6699FF}���� ������������", string, "�������", "�����");
	}
	return SendClientMessage(playerid, COLOR_LIGHTRED, PlayerIsNotInHome);
}

CMD:returnmoney(playerid, params[])
{
	ShowPlayerDialog(playerid, D_MONEYBACK, d_List, "{6699FF}������� �����", "1. ������� ������ �� ������\n2. ������� ������ �� �����������\n3. ������� ������ �� ���\n4. ������� ������ �� ���������", "�������", "�����");
	return true;
}

CMD:tele(playerid, params[])
{
	ShowPlayerDialog(playerid, D_WORK+4, d_List, "{6699FF}������ ����������", "1. ���������\n2. ���������\n3. ��������\n4. �����\n5. SFPD\n6. LVPD\n7. Grove\n8. Ballas\n9. Vagos\n10. Aztecas\n11. Rifa\n12. ���\n13. �����", "�����", "������");
	return true;
}

CMD:setspawn(playerid, params[]) return ShowPlayerDialog(playerid, D_STATS+7, d_List, "{6699FF}��������� ����� ��������� � ����", "{FFFFFF}1. �� ������ ��� �����������\n2. ���\n3. ��������\n4. ����������� �����\n5. ���� �����������", "�������", "�����");

CMD:exit(playerid, params[])
{
	for(new i = 1; i <= TOTALHOUSE; ++i)
	{
		if(!IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][hExit][0], HouseInfo[i][hExit][1], HouseInfo[i][hExit][2])) continue;
  		if(HouseInfo[i][hInt][1] != GetPlayerVirtualWorld(playerid) || HouseInfo[i][hInt][0] != GetPlayerInterior(playerid)) continue;
		SetPlayerPos(playerid,HouseInfo[i][hEntr][0],HouseInfo[i][hEntr][1],HouseInfo[i][hEntr][2]);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		params[1]++;
		break;
	}
	if(!params[1]) return SendClientMessage(playerid, COLOR_LIGHTRED, PlayerIsNotInHome);
	return true;
}
