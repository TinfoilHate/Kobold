#include "core\gearCore.sqf" //DO NOT REMOVE

// Call this with [this, "LOADOUT", (optional) "GROUPNAME"] call FNC_GearScript; in the Init field of the unit
// Example:
// [this, "CAD_PLT_1IC", "PLT HQ"] call FNC_GearScript;
//
// more info: https://github.com/dklollol/Olsen-Framework-Arma-3/wiki/gear.sqf

//when set to false, facewear types that are whitelisted will not be removed
FW_force_remove_facewear = true;

//forces adding an item to inventory. Works only if container is specified!
FW_enableOverfill = true;

_unit call FNC_RemoveAllGear;

switch (_type) do {
	#include "loadouts\OPFOR.sqf"
	#include "loadouts\USARMY_1979_OD.sqf"

	default {
		(format ["(FNC_GEARSCRIPT) [ERR]: UNIT: %1 USING TYPE: %2 IS USING AN INVALID GEAR TYPE!",_unit,_type]) call FNC_DebugMessage;
	};
};

[_unit,_type] call kobld_ai_tasks_fnc_disposableAmmoAdd;
[_unit] call kobld_fnc_setFace;