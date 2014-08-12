private ["_position","_findSpot","_isNear","_isZero","_counter","_locArray","_ok","_seldLoc"];
_locArray = [[5058,12562,0], //Petrovka
		[8625,11968,0], //Gvozdno
		[3689,8847,0], //Vybor
		[9588,8908,0], //Gorka
		[12108,8974,0], //Berezino
		[6560,6150,0], //Vyshnoye
		[2650,5361,0], //Zelenogorsk
		[13467,6472,0], //Solnichny
		[3727,2334,0], //Komarovo
		[7235,2244,0], //Cherno
		[10687,2271,0], //Elektro
		[12297,3486,0], //Kamyshovo
		[13391,4124,0]]; //Krutov
		
cutText ["","BLACK OUT"];
_ok = createDialog "DRN_DIALOG";
spawnSelect = -1;
waitUntil {spawnSelect != -1};
if (spawnSelect == 13) then {spawnSelect = floor (random 13)};
_seldLoc = _locArray select spawnSelect;
_findSpot = true;
_counter = 0;
while {_findSpot and _counter < 20} do {
	_position = ([(_seldLoc),0,150,10,0,20,0] call BIS_fnc_findSafePos);
	_isNear = count (_position nearEntities ["Man",100]) == 0;
	_isZero = ((_position select 0) == 0) and ((_position select 1) == 0);
	_counter = _counter + 1;
	if (_isNear and !_isZero) then {_findSpot = false};
};

_position = [_position select 0,_position select 1,0];
//diag_log("DEBUG: spawning player at" + str(_position));
player setPosATL _position;
cutText ["","BLACK IN"];