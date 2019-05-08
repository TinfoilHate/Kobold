waitUntil {!isNil "BIS_fnc_init"};
if (!(FW_var_isHC)) exitWith {};
waitUntil {!isNil "PZAI_Enabled"};
if (!(PZAI_Enabled)) exitWith {};
waitUntil {!(isNil "PZAI_SideBasedExecution")};

MarkerArray = [];
PZAI_UnitQueue = [];
PZAI_ActiveList = [];
PZAI_TrackedUnits = [];
PZAI_MarkerArray = [];
PZAI_GroupArray = [];
PZAI_BasicCheckCurrent = 0;
PZAI_LeaderExecuteCurrent = 0;

//Lets gets the queue handler going
[] spawn PZAI_fnc_QueueHandle;
[] spawn PZAI_fnc_ActiveHandler;
[] spawn PZAI_fnc_GroupHandler;

//leader/group behavior handling loop
//[] spawn PZAI_fnc_MainLoop;

//marker function
if (PZAI_UseMarkers) then {
	[] spawn PZAI_fnc_MapMarkers;
};