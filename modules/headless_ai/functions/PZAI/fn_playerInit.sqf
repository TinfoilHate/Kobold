if (isDedicated || !hasinterface) exitwith {};
_unit = player;
if (!local _unit) exitwith {};
if ((_unit getvariable ["HC_unitFiredManHandlerSet",false])) exitwith {};

_ID = _unit addEventHandler ["FiredMan",{

	params ["_firer","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

	//check for lockout
	if (time < _firer getVariable ["HC_unitHandler_revealLockout",-1]) exitWith {
		if (PZAI_UseMarkers) then {
			diag_log "Locked out!";
		}; 
	};
	_firer setVariable ["HC_unitHandler_revealLockout", time + 5,true];//makes the reveal be available in 5s from now

	_debugText = ""; //always good to have

	allUnits select {(_x distance2d _firer <= PZAI_HEARINGDISTANCE) && (!isplayer _x)} apply {

		_distance = _x distance _firer;
		_travelTime = _distance / 343;//not using distance2d since that would be odd
		_revealValue = linearConversion [200,PZAI_HEARINGDISTANCE,_distance,4,PZAI_HEARINGMININCREASE];
		_debugText = _debugText + format ["%1 got revealed to %2\n%3m, %4 seconds, %5 reveal value.\n\n",_firer,_x,_distance,_travelTime,_revealValue];

		_delayedReveal = [_firer,_x,_distance,_travelTime,_revealValue] spawn {
			params ["_firer","_AIunit","_travelTime","_revealValue"];
			sleep _travelTime;
			_AIunit reveal [_firer,_revealValue];
			true
		};

	};
	if (PZAI_UseMarkers) then {
		diag_log str _debugText;
	}; 
}];

_unit setVariable ["HC_unitHandler_firedRevealID",_ID];//store the EH ID on the object to keep things tidy
_unit setVariable ["HC_unitFiredManHandlerSet",true];
