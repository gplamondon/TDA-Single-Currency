if (player != leader group player) exitWith {systemChat "You are not the leader and can't invite people.";};

disableSerialization;

private ["_center","_dialog","_playerListBox","_plist","_target","_index","_playerData","_check","_hasInvite"];

_dialog = findDisplay 55510;
_playerListBox = _dialog displayCtrl 55511;
_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_hasInvite = false;
_check = 0;

_center = getMarkerPos "center";
_plist = _center nearEntities ["AllVehicles",10000];
{
	if ((!isNull _x) && (getPlayerUID _x != "")) then {
		if (str(_x) == _playerData) then {_target = _x;_check = 1;};
	};
} count _plist;

if (_check == 0) exitWith {systemChat "You must select someone to invite first.";};
if (_target == player) exitWith {systemChat "You can't invite yourself.";};
if (count units group _target > 1) exitWith {systemChat "This player is already in a group.";};

{if (_x select 1 == getPlayerUID _target) then {_hasInvite = true;};} forEach currentInvites;
if (_hasInvite) exitWith {systemChat "This player already has a pending invite.";};
currentInvites set [count currentInvites,[getPlayerUID player,getPlayerUID _target]];
publicVariableServer "currentInvites"; 

[nil,_target,"loc", rTITLETEXT, format["You have received a group invite. Press right ctrl to view."], "PLAIN", 0] call RE;

systemChat format["You have invited %1 to join the group",name _target];