["Drive", "Functions for supporting the practical use of setDriveOnPath.", "TinfoilHate"] call FNC_RegisterModule;

kobld_drive_colorShift_i = 0;
kobld_drive_colorShift_r = 1;
kobld_drive_colorShift_g = 0;
kobld_drive_colorShift_b = 0;

kobld_drive_pathCapture = {		//Make sure this is activated via spawn (e.g. [VEH1,true,5] spawn kobld_drive_pathCapture
	params ["_veh","_activate",["_distance",5]];

	if (!local _veh) exitWith {};

	kobld_drive_pathCaptureArray = [getPosATL _veh];		// [[vehicle1,pathArray1],[vehicle2,pathArray2]]
	kobld_drive_pathCaptureActive = _activate;

	if (kobld_drive_pathCaptureActive) then {
		hint format ["Path Capture Activated for: %1",_veh];
	} else {
		hint format ["Path Capture Deactivated for: %1",_veh];
	};

	while {kobld_drive_pathCaptureActive} do {
		_newPos 	= getPosATL _veh;
		_lastPos	= kobld_drive_pathCaptureArray # (count kobld_drive_pathCaptureArray - 1);

		if ((_newPos distance _lastPos) > _distance) then {
			kobld_drive_pathCaptureArray pushBack _newPos;

			if (!isMultiplayer && kobld_drive_debug) then {
				_globe = "Sign_Sphere100cm_F" createVehicle _newPos;
				_globe setPosATL _newPos;
				_globe setObjectTexture [0,'#(argb,8,8,3)color(1,1,1,1)'];
			};
		};
	};
};

kobld_drive_pathReplay = {		//[TANK] call kobld_drive_pathReplay;
	[{
		params ["_veh",["_delay",1]];
		private _path = [];

		if (!local _veh) exitWith {};

		if (_delay < 1) then {_delay = 1};

		{
			_x params ["_arVeh"];

			if (_veh == _arVeh && count _path < 1) then {
				_path = _x # 1;
			};
		} forEach kobld_drive_pathArray;

		_veh setBehaviourStrong "COMBAT";

		[{
			(_this # 0) setDriveOnPath (_this # 1);
		},[_veh,_path],_delay] call CBA_fnc_waitAndExecute;

		if (!isMultiplayer && kobld_drive_debug) then {
			{
				_globe = "Sign_Sphere100cm_F" createVehicle _x;
				_globe setPosATL _x;
				_globe setObjectTexture [0,'#(argb,8,8,3)color(' + str(kobld_drive_colorShift_r) + ',' + str(kobld_drive_colorShift_g) + ',' + str(kobld_drive_colorShift_b) + ',1)'];
			} forEach _path;

			if (kobld_drive_colorShift_i < 6) then {
				kobld_drive_colorShift_i = kobld_drive_colorShift_i + 1;
			} else {
				kobld_drive_colorShift_i = 0;
			};

			[] call kobld_drive_rainbow;
		};
	},_this,0.1] call CBA_fnc_waitAndExecute;
};

kobld_drive_rainbow = {
	switch (kobld_drive_colorShift_i) do {
		case 0: {
			kobld_drive_colorShift_r = 1;
			kobld_drive_colorShift_g = 0;
			kobld_drive_colorShift_b = 0;
		};

		case 1: {
			kobld_drive_colorShift_r = 1;
			kobld_drive_colorShift_g = 0.4980392156862745;
			kobld_drive_colorShift_b = 0;
		};

		case 2: {
			kobld_drive_colorShift_r = 1;
			kobld_drive_colorShift_g = 1;
			kobld_drive_colorShift_b = 0;
		};

		case 3: {
			kobld_drive_colorShift_r = 0;
			kobld_drive_colorShift_g = 1;
			kobld_drive_colorShift_b = 0;
		};

		case 4: {
			kobld_drive_colorShift_r = 0;
			kobld_drive_colorShift_g = 0;
			kobld_drive_colorShift_b = 1;
		};

		case 5: {
			kobld_drive_colorShift_r = 0.1529411764705882;
			kobld_drive_colorShift_g = 0;
			kobld_drive_colorShift_b = 0.2;
		};

		case 6: {
			kobld_drive_colorShift_r = 0.5450980392156863;
			kobld_drive_colorShift_g = 0;
			kobld_drive_colorShift_b = 1;
		};

		default {	//UO  B R O W N
			kobld_drive_colorShift_r = 0.6941176470588235;
			kobld_drive_colorShift_g = 0.6196078431372549;
			kobld_drive_colorShift_b = 0.4431372549019608;
		};
	};
};