//unit 1, unit 2
params ["_unit","_target"];

_canseeReturn = false;

_getpos1 = getposASL _unit;
_getposTarget = getposASL _target;
_unitdirtotarget = _unit getdir _target;
_aheadUnit = _unit getpos [10,_unitdirtotarget];
_eyeP1 = [_aheadUnit select 0, _aheadUnit select 1, (_getpos1 select 2) + 1.5];
_eyeP2 = [_getposTarget select 0, _getposTarget select 1,(_getposTarget select 2) + 1];

_cansee = [_unit, "VIEW", objNull] checkVisibility [eyepos _unit, _eyeP2];
if (_cansee > 0.10) then {_canseeReturn = true;};

_canseeReturn