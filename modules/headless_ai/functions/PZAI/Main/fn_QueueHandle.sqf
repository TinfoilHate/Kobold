while {true} do {
	sleep 0.25;
	//systemchat format ["PZAI_UnitQueue: %1",PZAI_UnitQueue];
	if !(PZAI_UnitQueue isEqualTo []) then
	{
		private _ConsideringUnit = PZAI_UnitQueue select 0;
		private _Disabled = _ConsideringUnit getVariable ["PZAI_NOAI",false];
		if ((vehicle _ConsideringUnit) isKindOf "Plane") then {_Disabled = true;_ConsideringUnit setvariable ["PZAI_NOAI",true];};
		if (!(isNull _ConsideringUnit) && !(_Disabled)) then {
			if (side _ConsideringUnit in PZAI_SideBasedExecution) then {
				[_ConsideringUnit] execFSM "modules\headless_ai\functions\PZAI\FSM\AIBEHAVIORTEST.fsm";
			} else {
				_ConsideringUnit forcespeed -1;
			};
				PZAI_ActiveList pushback _ConsideringUnit;
				PZAI_UnitQueue deleteAt 0;
		} else {
				PZAI_UnitQueue deleteAt 0;
				_ConsideringUnit forcespeed -1;
		};
		
		{
			if (isNull _x) then {PZAI_ActiveList = PZAI_ActiveList - [_x];};
		} foreach PZAI_ActiveList;		
	};
};