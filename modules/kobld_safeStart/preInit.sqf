["Safe Start", "Initialize camera, start on safe.", "TinfoilHate"] call FNC_RegisterModule;

#include "script_component.hpp"
#include "settings.sqf"

[{!isNull player}, {
	[] call kobld_safeStart_fnc_safeStart;
}] call CBA_fnc_waitUntilAndExecute;