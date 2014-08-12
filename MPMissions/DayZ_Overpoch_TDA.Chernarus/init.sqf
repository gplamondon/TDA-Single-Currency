/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
diag_log text "Init.sqf starting";

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
DZE_R3F_WEIGHT = false;
DZEdebug = FALSE;
DZE_buildinglimit = 500;
DZE_StripAmmo = ["BAF_Jackal2_L2A1_D","HMMWV_MK19","HMMWV_Armored","HMMWV_M2","BRDM2_HQ_Gue","BTR40_MG_TK_INS_EP1","AAV","BMP2_TK_EP1"];

DZE_ConfigTrader = true;
DZE_AsReMix_PLAYER_HUD = true; //Open Custom 	AsReMix Player HUD

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
//enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500

MaxVehicleLimit = 700; // Default = 50
MaxDynamicDebris = 100; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 5; // Default = 30 
dayz_maxGlobalZombiesInit = 10;
dayz_maxGlobalZombiesIncrease = 5;
dayz_maxZeds = 250;
dayz_zedsAttackVehicles = false;
DZE_HumanityTargetDistance = 25;
DZE_BaseGodmode = true;

DZE_DeathMsgSide = true;

MaxAmmoBoxes = 5;
MaxMineVeins = 50;

dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 35;
dayz_sellDistance_boat = 35;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 8; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False

//Default Loadout 
DefaultMagazines = ["ItemBandage","ItemBandage","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","ItemMorphine","ItemPainkiller","ItemWaterbottleBoiled","FoodSteakCooked"];
DefaultWeapons = ["M9","ItemFlashlight","ItemHatchet_DZE","ItemMap"];
DefaultBackpack = "DZ_ALICE_Pack_EP1";
DefaultBackpackWeapon = "";

EpochEvents = [["any","any","any","any",30,"abandonedvault"],["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

diag_log text "Init.sqf Start call compiles.";

//Load in compiled functions
call compile preprocessFileLineNumbers "init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "custom\JAEM\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "init\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "Recover_Skin\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

diag_log text "Init.sqf Start call compiles.";

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {

	diag_log text "Init.sqf Is Server start.";

	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	
	diag_log text "APlotForLife";
	//_serverMonitor = 	[] execVM "custom\APlotForLifev2.2.1\server_monitor.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	diag_log format["[_serverMonitor: %1]",_serverMonitor];
	
	diag_log text "Init.sqf Is Server End.";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_nil = [] execVM "custom\remote_messages.sqf";
	execVM "custom\service_point\service_point.sqf";
	_nil = [] execVM "custom\JAEM\EvacChopper_init.sqf";
	execVM "custom\player_tradermarkers.sqf";
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	 
	execVM "dzgm\init.sqf";
	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	_nil = [] execVM "custom\remote_messages.sqf";
	
};
// Zupa - SC
execVM "gold\init.sqf";
execVM "gold\addbankmarkers.sqf";
// END Zupa - SC
[] execVM "scripts\safezone.sqf";
_logistic = execVM "=BTC=_Logistic\=BTC=_Logistic_Init.sqf";
//Start Dynamic Weather
//execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
execVM "custom\DynamicWeatherEffects.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//Spawn Select
if (!isDedicated) then {
   waitUntil {!isNil ("PVDZE_plr_LoginRecord")}; 
	if (dayzPlayerLogin2 select 2) then {
		[] execVM "custom\spawn_select\Spawn.sqf";
	};
};
// Map Marker Script
execVM "MapMarkings\MapMarkerTitling.sqf";
if (!isDedicated) then {
	if (DZE_AsReMix_PLAYER_HUD) then {
		execVM "addons\playerhud\playerHud.sqf"//AsReMix Player HUD
	};
};