params ["_Unit"];
_Group = (group _unit);

//Add necessary eventhandlers.
//_Unit addEventHandler ["Killed",{_this spawn PZAI_fnc_ClosestAllyWarn;}];
//_Unit addEventHandler ["FiredMan",{[_this] call PZAI_fnc_SuppressingShots; [_this] call PZAI_fnc_HearingAids;}];
//_Unit addEventHandler ["Hit",{_this call PZAI_fnc_AIHit;}];

//Should the AI run to support friendlies?
if (PZAI_REINFORCE) then {
	_Group setvariable ["PZAI_REINFORCE",true];
} else {
	_Group setvariable ["PZAI_REINFORCE",false];
};