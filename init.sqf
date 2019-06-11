#define framework

#include "core\script_macros.hpp"
#include "core\init.sqf" //DO NOT REMOVE
#include "customization\settings.sqf" //DO NOT REMOVE
#include "core\dia\debug\dia_debug.sqf" //DO NOT REMOVE

if (isServer) then {

	"" call FNC_StartingCount; //DO NOT REMOVE

	[] spawn { //Spawns code running in parallel

		while {!FW_MissionEnded} do { //Loops while the mission is not ended
			if (!isNil "FW_Disable_Endconditions") exitWith {};

			FW_TimeLimitReached = false;
			if (isNil "FW_TimeLimit") then {FW_TimeLimit = 0};

			#include "customization\endConditions.sqf" //DO NOT REMOVE
		};
	};
};

#include "modules\modules.sqf" //DO NOT REMOVE
#include "core\postChecks.sqf" //DO NOT REMOVE