while {true} do {
	{
		if (local _x && {simulationEnabled _x}) then {
				if (!(_x in PZAI_ActiveList) && {!(_x in PZAI_UnitQueue)}) then {
					_x forcespeed 0;
					PZAI_UnitQueue pushback _x;
				};
		};
	} forEach allUnits;
	sleep (random (10) + 10);
};

