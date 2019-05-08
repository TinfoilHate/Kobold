//PZAI_fnc_CombatMoveTo

params ["_Group","_currenttarget","_enemydir"];

_position = getposASL _currenttarget;
_radius = 100;

if ((random 2) > 1) then {_group setformation "LINE";} else {_group setformation "WEDGE";};
_group setformdir _enemydir;

[_Group] call CBA_fnc_clearWaypoints;
_Group setvariable ["PZAI_Mission","ATTACK"];
[_group, _position, _radius, "SAD", "AWARE", "RED"] call CBA_fnc_addWaypoint;

//_NoFlanking = _Group getVariable ["PZAI_REINFORCE",false];
//if (_NoFlanking) then {
//	[_Group] call CBA_fnc_clearWaypoints;
//	_Group setvariable ["PZAI_Mission","ATTACK"];
//	[_group, _position, _radius, "SAD", "COMBAT", "RED"] call CBA_fnc_addWaypoint;
//} else {
//	_Group setvariable ["PZAI_Mission","FLANK"];
//	[_Group,false] spawn PZAI_fnc_FlankManeuver;
//};

