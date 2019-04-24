#include "core\vehGearCore.sqf" //DO NOT REMOVE

// Call this with [this, "LOADOUT"] call FNC_VehicleGearScript; in the Init field of the vehile
// Example:
// [this, "HUMMVEE"] call FNC_VehicleGearScript;

switch (_type) do {

	case "M113_HQ": {

		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_weap_m72a7", 5] call FNC_AddItemVehicle;
		["rhs_mag_30Rnd_556x45_M855A1_Stanag", 28] call FNC_AddItemVehicle;
		["rhsusf_100Rnd_762x51", 6] call FNC_AddItemVehicle;
		["rhs_200rnd_556x45_M_SAW", 8] call FNC_AddItemVehicle;

		["rhs_mag_M433_HEDP", 24] call FNC_AddItemVehicle;
		["rhs_mag_m714_White", 8] call FNC_AddItemVehicle;
		["rhs_mag_m713_Red", 2] call FNC_AddItemVehicle;
		["rhs_mag_m715_Green", 2] call FNC_AddItemVehicle;
		
		["ACE_M47_Dragon", 2] call FNC_AddItemVehicle;

		[_vehicle,"usm_pack_m5_medic",1] call FNC_assignMedicBagCargo;
	};

	case "M113_TOW": {

		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_weap_m72a7", 2] call FNC_AddItemVehicle;
		["rhs_mag_30Rnd_556x45_M855A1_Stanag", 16] call FNC_AddItemVehicle;

		[_vehicle,"usm_pack_m5_medic",1] call FNC_assignMedicBagCargo;
	};
	
	case "M113": {

		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_weap_m72a7", 5] call FNC_AddItemVehicle;
		["rhs_mag_30Rnd_556x45_M855A1_Stanag", 28] call FNC_AddItemVehicle;
		["rhsusf_100Rnd_762x51", 6] call FNC_AddItemVehicle;
		["rhs_200rnd_556x45_M_SAW", 8] call FNC_AddItemVehicle;

		["rhs_mag_M433_HEDP", 24] call FNC_AddItemVehicle;
		["rhs_mag_m714_White", 8] call FNC_AddItemVehicle;
		["rhs_mag_m713_Red", 2] call FNC_AddItemVehicle;
		["rhs_mag_m715_Green", 2] call FNC_AddItemVehicle;

		["ACE_M47_Dragon", 2] call FNC_AddItemVehicle;

		[_vehicle,"usm_pack_m5_medic",1] call FNC_assignMedicBagCargo;

/*		[{
			(_this select 0) addBackpackCargoGlobal [(_this select 1),(_this select 2)];
			{
				if (typeOf _x == (_this select 1)) then {
					clearBackpackCargoGlobal _x;
					clearItemCargoGlobal _x;
					clearMagazineCargoGlobal _x;
					clearWeaponCargoGlobal _x;

					_x addItemCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",6];
					_x addItemCargoGlobal ["rhs_200rnd_556x45_M_SAW",2];
				};
			} forEach everyBackpack (_this select 0);
		}, [_vehicle,"usm_pack_alice",6], 1] call CBA_fnc_waitAndExecute;
*/
	};

	case "M1": {

		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer", 8] call FNC_AddItemVehicle;
		["gst_m16a2_2"] call FNC_AddItemVehicle;

		[{
			(_this select 0) addBackpackCargoGlobal [(_this select 1),(_this select 2)];
			{
				if (typeOf _x == (_this select 1)) then {
					clearBackpackCargoGlobal _x;
					clearItemCargoGlobal _x;
					clearMagazineCargoGlobal _x;
					clearWeaponCargoGlobal _x;

					_x addItemCargoGlobal ["ToolKit",1];
				};
			} forEach everyBackpack (_this select 0);
		}, [_vehicle,"usm_pack_alice",1], 1] call CBA_fnc_waitAndExecute;

	};

	case "BMP": {

		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_weap_rpg26", 2] call FNC_AddItemVehicle;
		["rhs_30Rnd_545x39_AK_no_tracers", 28] call FNC_AddItemVehicle;
		["rhs_45Rnd_545X39_7N6_AK", 12] call FNC_AddItemVehicle;

		["rhs_VOG25", 16] call FNC_AddItemVehicle;
		["rhs_GRD40_White", 8] call FNC_AddItemVehicle;
		["rhs_GRD40_Green", 4] call FNC_AddItemVehicle;
		["rhs_GRD40_Red", 4] call FNC_AddItemVehicle;

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

		[_vehicle,"rhs_medic_bag",1] call FNC_assignMedicBagCargo;
	};

	case "BRDM": {

		_vehicle call FNC_RemoveAllVehicleGear;

		["rhs_weap_rpg26", 2] call FNC_AddItemVehicle;
		["rhs_30Rnd_545x39_AK_no_tracers", 12] call FNC_AddItemVehicle;

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

		[_vehicle,"rhs_medic_bag",1] call FNC_assignMedicBagCargo;
	};

	case "EMPTY": {

		_vehicle call FNC_RemoveAllVehicleGear;
	};
};