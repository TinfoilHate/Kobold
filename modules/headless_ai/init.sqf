["Headless AI", "Spawns AI locally on the HC through arrays and executes AI scripts", "PIZZADOX"] call FNC_RegisterModule;

//check if HC
if (FW_var_isHC) then {
	//Includes AI Array data and settings
	#include "AIArrays.sqf"
	#include "settings.sqf"
	
	//Spawns initial HC arrays
	if (!isNil "_InitialSpawn") then {
		{
			[_x] call HC_fnc_spawnOnHC;
		} foreach _InitialSpawn;
	};
	
	//Headless Client specific init
	if (!hasinterface && !isDedicated) then {
		[] call HC_fnc_initHC;
	};
	
	//VCOM AI init
	if (PZAI_Enabled) then {
		[] call PZAI_fnc_initMain;
	};
};