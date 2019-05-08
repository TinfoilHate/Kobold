#include "core\vehGearCore.sqf" //DO NOT REMOVE

// Call this with [this, "LOADOUT"] call FNC_VehicleGearScript; in the Init field of the vehile
// Example:
// [this, "EMPTY"] call FNC_VehicleGearScript;

_vehicle allowCrewInImmobile true;

switch (_type) do {

	case "233014": {
		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_weap_rpg26", 4] call FNC_AddItemVehicle;

		["rhsgref_30rnd_556x45_m21", 50] call FNC_AddItemVehicle;
		["rhs_100Rnd_762x54mmR", 8] call FNC_AddItemVehicle;
		["rhsgref_10Rnd_792x57_m76", 10] call FNC_AddItemVehicle;

		[_vehicle,"rhs_medic_bag",1] call FNC_assignMedicBagCargo;
	};

	case "233011": {
		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_weap_rpg26", 4] call FNC_AddItemVehicle;

		["rhsgref_30rnd_556x45_m21", 50] call FNC_AddItemVehicle;
		["rhs_100Rnd_762x54mmR", 8] call FNC_AddItemVehicle;
		["rhsgref_10Rnd_792x57_m76", 10] call FNC_AddItemVehicle;

		["rhs_VOG25", 24] call FNC_AddItemVehicle;
		["rhs_VG40OP_white", 8] call FNC_AddItemVehicle;
		["rhs_VG40OP_green", 2] call FNC_AddItemVehicle;
		["rhs_VG40OP_red", 2] call FNC_AddItemVehicle;
		["rhs_GDM40", 2] call FNC_AddItemVehicle;

		[_vehicle,"rhs_medic_bag",1] call FNC_assignMedicBagCargo;

		[{
			(_this select 0) addBackpackCargoGlobal [(_this select 1),(_this select 2)];
			{
				if (typeOf _x == (_this select 1)) then {
					clearBackpackCargoGlobal _x;
					clearItemCargoGlobal _x;
					clearMagazineCargoGlobal _x;
					clearWeaponCargoGlobal _x;

					_x addItemCargoGlobal ["rhs_rpg7_PG7VL_mag",3];
				};
			} forEach everyBackpack (_this select 0);
		}, [_vehicle,"rhs_rpg_empty",1], 1] call CBA_fnc_waitAndExecute;
	};

	case "EMPTY": {
		_vehicle call FNC_RemoveAllVehicleGear;
	};

	case "EMPTY_MED": {
		_vehicle call FNC_RemoveAllVehicleGear;

		[_vehicle,"rhs_medic_bag",1] call FNC_assignMedicBagCargo;
	};
};