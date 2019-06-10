["Optics", "Admin parameter for weapon optics.", "TinfoilHate"] call FNC_RegisterModule;

	private ["_param","_hour","_lite","_dark","_newHour","_newMin","_newDate"];

	_param = ["kobld_optics", 0] call BIS_fnc_getParamValue;
	kobld_optics_selection = "";

	switch _param do {
		case 1: {kobld_optics_selection = "rhsusf_acc_su230a"};

		default {kobld_optics_selection = "rhsusf_acc_eotech_552"};
	};