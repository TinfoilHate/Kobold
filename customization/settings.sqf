if (isNil "BLUFOR_obj1Flag") then {BLUFOR_obj1Flag = false};
if (isNil "REDFOR_obj1Flag") then {REDFOR_obj1Flag = false};

if (isServer) then {
	setViewDistance 2000;

	FW_TimeLimit = ["TimeLimit",0] call BIS_fnc_getParamValue;
	FW_TimeLimitMessage = "TIME LIMIT REACHED!";

	[west, "WEST SIDE", "player"] call FNC_AddTeam;
	[east, "EAST SIDE", "player"] call FNC_AddTeam;

	{
		if (!isMultiplayer) then {
			if (side _x == west) then {
				doStop _x;
			};
		};
	} forEach allUnits;

	//NATO Markers and BFT
	[{vk_mods_markers_postInit}, {
		//_blu1 = [getMarkerPos "bluMarker_1",west,["infantry","armor"],3,1,[west]] call vk_fnc_addMarker;
		//_red1 = [getMarkerPos "redMarker_2",west,["infantry","armor","ifv"],3,1,[east]] call vk_fnc_addMarker;
	}] call CBA_fnc_waitUntilAndExecute;
};

if ((!hasInterface && !isDedicated) || !isMultiplayer) then {
	//HEADLESS
};

[{[true] call acre_api_fnc_ignoreAntennaDirection},[],1] call CBA_fnc_waitAndExecute;

if (!isDedicated && hasInterface) then {
	if (!isMultiplayer) then {FW_debugMessagesEnabled = true} else {FW_debugMessagesEnabled = false};	//Debug Messages
	BIS_EGSpectator_drawProjectilesPath = true;	//Draw projectile paths in spectator

	setViewDistance 2000;

	switch (side player) do {
		case west: {

		};

		case east: {

		};
	};

	[{!isNull player}, {	//Regular Player Stuff
		ace_nightvision_noisescaling = 0.4;
		ace_nightvision_fogscaling = 0.0;
		ace_nightvision_aimdownsightsblur = 1.5;
		ace_nightvision_effectscaling = 1;

		switch (side player) do {
			case west: {
				
			};

			case east: {
				
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