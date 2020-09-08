#include "core\vehGearCore.sqf" //DO NOT REMOVE

// Call this with [this, "LOADOUT"] call FNC_VehicleGearScript; in the Init field of the vehile
// Example:
// [this, "EMPTY"] call FNC_VehicleGearScript;

_vehicle allowCrewInImmobile true;
_vehicle disableTIEquipment kobld_optics_vehicleThermals;

_nightGear = false;

_hour = date # 3;	//[year,month,day,hour,minute]
_lite = (date call BIS_fnc_sunriseSunsetTime) # 0;
_dark = (date call BIS_fnc_sunriseSunsetTime) # 1;

if (_hour < (_lite) || (_hour + 1) > _dark) then {
	_nightGear = true;
};

switch (_type) do {
	case "M113": {
		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_mag_20Rnd_556x45_M193_Stanag", 20] call FNC_AddItemVehicle;
		["rhs_mag_30Rnd_556x45_M193_Stanag", 30] call FNC_AddItemVehicle;
		["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red", 5] call FNC_AddItemVehicle;

		["rhsusf_100Rnd_762x51", 8] call FNC_AddItemVehicle;

		["rhs_mag_M433_HEDP", 20] call FNC_AddItemVehicle;
		["rhs_mag_m713_Red", 4] call FNC_AddItemVehicle;
		["rhs_mag_m714_White", 4] call FNC_AddItemVehicle;
		["rhs_mag_m715_Green", 4] call FNC_AddItemVehicle;

		["ace_dragon_super", 1] call FNC_AddItemVehicle;
		["rhs_weap_m72a7", 5] call FNC_AddItemVehicle;

		["ToolKit", 1] call FNC_AddItemVehicle;

		if (_nightGear) then {
			["FlareWhite_F",12] call FNC_AddItemVehicle;
		};
	};

	case "STATIC": {
		_vehicle enableWeaponDisassembly false;

		_vehicle setVariable ["ace_dragging_canDrag", false,true];
		_vehicle setVariable ["ace_dragging_canCarry", false,true];

		[_vehicle, -1] call ace_cargo_fnc_setSize;
	};

	case "EMPTY": {
		_vehicle call FNC_RemoveAllVehicleGear;
	};
};