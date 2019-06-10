
	params ["_unit"];

	if (local _unit) then {
		[{
			params ["_unit","_veh"];

			_unit moveInCommander _veh;
		}, _this, 5] call CBA_fnc_waitAndExecute;
	};