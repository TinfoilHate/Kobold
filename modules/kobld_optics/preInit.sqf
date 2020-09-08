["Optics", "Admin parameter for weapon optics.", "TinfoilHate"] call FNC_RegisterModule;

	private ["_param","_hour","_lite","_dark","_newHour","_newMin","_newDate"];

	private _param = ["kobld_optics", 0] call BIS_fnc_getParamValue;
	kobld_optics_selection = "";

	switch _param do {
		case 1: {
			kobld_optics_BLUFOR_ACOG = "rhsusf_acc_su230";
			kobld_optics_BLUFOR_MGO = "";

			kobld_optics_REDFOR_ACOG = "";
			kobld_optics_REDFOR_MGO = "";
		};

		default {
			kobld_optics_BLUFOR_ACOG = "";
			kobld_optics_BLUFOR_MGO = "";

			kobld_optics_REDFOR_ACOG = "";
			kobld_optics_REDFOR_MGO = "";
		};
	};

	private _vehParam = ["kobld_optics_vehThermal", 0] call BIS_fnc_getParamValue;
	kobld_optics_vehicleThermals = "";

	// This is inverse due to the disableTIEquipment command syntax
	switch _vehParam do {
		case 1: {
			kobld_optics_vehicleThermals = false;
		};

		default {
			kobld_optics_vehicleThermals = true;
		};
	};
