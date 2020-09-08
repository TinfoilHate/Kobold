//Do not forget to set the MISSION NAME in modules\kobld_onLoad
//Do not forget to set the MISSION TITLE in modules\start_text

if (isServer) then {
	setViewDistance 2000;

	FW_TimeLimit = ["TimeLimit",0] call BIS_fnc_getParamValue;
	FW_TimeLimitMessage = "TIME LIMIT REACHED!";

	kobld_timeLimit = 3600;
	kobld_timeOut = false;
	kobld_endingAllowed = true;

	[west, "US ARMY", "player"] call FNC_AddTeam;
	[east, "SOVIET ARMY", "ai"] call FNC_AddTeam;

	{
		if (!isMultiplayer) then {
			if (side _x == west) then {
				doStop _x;
			};

			if (side _x == east) then {

			};
		};
	} forEach allUnits;

	//NATO Markers and BFT
	[{vk_mods_markers_postInit}, {
		//OPFOR
		private _o1 = [getMarkerPos "redMarker_1",east,["armor","recon","wheeled"],3,1,[west]] call vk_fnc_addMarker;

		//BLUFOR
		private _b1 = [getMarkerPos "bluMarker_1",west,["inf","armor"],3,1.2,[west]] call vk_fnc_addMarker;
	}] call CBA_fnc_waitUntilAndExecute;

	BLUFOR_obj1Flag = false;
	BLUFOR_obj2Flag = false;

	REDFOR_obj1Flag = false;

	[{	//Complete fucking hackjob - This resets the side count due to issue caused by older headless_ai module
		(FW_Teams # 1) params ["", "_side", "_type", "_total", "_current"];

		if (_total > 0) then {
			(FW_Teams # 1) set [3, east countSide allunits];
			(FW_Teams # 1) set [4, east countSide allunits];
		};
	},[],5] call CBA_fnc_waitAndExecute;
};

if ((!hasInterface && !isDedicated) || !isMultiplayer) then {
	//HEADLESS
};

[{[true] call acre_api_fnc_ignoreAntennaDirection},[],1] call CBA_fnc_waitAndExecute;

if (!isDedicated && hasInterface) then {
	if (!isMultiplayer) then {	//Debug Messages
		FW_debugMessagesEnabled = true;
		KOBLD_loadArray = [];	//Unit Gear Weights
		{
			if (side _x == west) then {
				KOBLD_loadArray pushBack [_x,typeOf _x,(loadAbs _x) / 10];
			};
		} forEach allUnits;
	} else {
		FW_debugMessagesEnabled = false;
	};
	BIS_EGSpectator_drawProjectilesPath = true;	//Draw projectile paths in spectator

	setViewDistance 2000;

	switch (side player) do {	//Regular Player Stuff
		case west: {

		};

		case east: {

		};
	};

	[{!isNull player}, {	//Regular Player Stuff, player initialized
		switch (side player) do {
			case west: {

			};

			case east: {

			};

			default {

			};
		};
	}, []] call CBA_fnc_waitUntilAndExecute;

	[{!isNull acre_player}, {	//ACRE Stuff

	}, []] call CBA_fnc_waitUntilAndExecute;

	if (didJIP) then {	//JIP ONLY Stuff
		[{!isNull player}, {
			switch (side player) do {
				case west: {

				};

				case east: {

				};
			};
		}, []] call CBA_fnc_waitUntilAndExecute;
	};
};