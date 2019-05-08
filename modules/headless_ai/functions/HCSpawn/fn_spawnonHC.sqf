//function to remoteexec given composition on the HC machine if available

params ["_composition"];

if (!isMultiplayer) exitwith {
	diag_log "SINGLEPLAYER TEST, SPAWNING HC AI ON CLIENT";
	if (time <= 0) then {
		[_composition] call HC_fnc_spawnFromArray;
	} else {
		[_composition] spawn HC_fnc_liveSpawnFromArray;
	};
};

if (isNil "HC_ID") exitwith {diag_log "NO HC ID DEFINED!"};

if (time <= 0) then {
	[_composition, {if (!FW_var_isHC) exitWith {}; [_this] call HC_fnc_spawnFromArray;}] remoteExec ["call", HC_ID];
} else {
	[_composition, {if (!FW_var_isHC) exitWith {}; [_this] spawn HC_fnc_liveSpawnFromArray;}] remoteExec ["call", HC_ID];
};