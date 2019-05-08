//PZAI_fnc_CombatMode

params ["_unit","_PZAI_LastCStance"];

_NearestEnemy = _Unit call PZAI_fnc_ClosestEnemy;
if (isNil "_NearestEnemy") exitwith {};

_TimeShot = _Unit getVariable ["PZAI_FiredTime",0];

if ((diag_tickTime - _TimeShot) > 120 && {((_NearestEnemy distance _Unit) > 1000)}) then 
{
	_Unit setBehaviour (_PZAI_LastCStance);
};