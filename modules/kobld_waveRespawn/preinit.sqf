["Wave Respawn", "Functions for supporting the practical use of wave respawn.", "TinfoilHate"] call FNC_RegisterModule;

#include "settings.sqf"

#define UNITARRAY (if (isMultiplayer) then {playableUnits} else {allUnits})

KOBLD_waveSpawn_monitor = {
	if (!isServer) exitWith {};

	waitUntil {
		KOBLD_wave_spawnQueue = [];
		{
			if (_x getVariable "FW_Dead") then {KOBLD_wave_spawnQueue pushBack _x};
		} forEach UNITARRAY;
		
		hint format["%1",UNITARRAY];

		if (count KOBLD_wave_spawnQueue >= KOBLD_waveSpawn_sectionSize || count KOBLD_wave_spawnQueue >= FW_respawnTickets) then {
			_groupArray = [];
			_hasSL = false;
			_hasTL = false;
			_rankList = ["SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"];
			{
				if ((rank _x) in _rankList && count _groupArray < KOBLD_waveSpawn_sectionSize && !_hasSL) then {
					_groupArray pushBack _x;
					_groupArray = _groupArray - [_x];

					_hasSL = true;
				};
			} forEach KOBLD_wave_spawnQueue;

			_rankList = ["CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"];
			{
				if ((rank _x) in _rankList && count _groupArray < KOBLD_waveSpawn_sectionSize && !_hasTL) then {
					_groupArray pushBack _x;
					_groupArray = _groupArray - [_x];

					_hasTL = true;
				};
			} forEach KOBLD_wave_spawnQueue;
			{
				if (count _groupArray < KOBLD_waveSpawn_sectionSize) then {
					_groupArray pushBack _x;
				};
			} forEach KOBLD_wave_spawnQueue;

			_group = createGroup west;
			_tickets = FW_RespawnTickets;

			for "_i" from 0 to ((count _groupArray) - 1) do {
				_currentUnit = _groupArray # _i;

				_type = "";
				_rank = "";

				switch _i do {
					KOBLD_waveSpawn_sectionRoles
				};

				[_currentUnit] joinSilent _group;

				_tickets = _tickets - 1;

				["KOBLD_waveSpawn_evt_respawnUnit", [_currentUnit,_type,_rank], _currentUnit] call CBA_fnc_targetEvent;
			};

			["FW_RespawnTickets", _tickets] call CBA_fnc_publicVariable;
		};

		sleep 30;

		false
	};
};

KOBLD_waveSpawn_respawnUnit = {
	params ["_unit","_type","_rank"];

	if (local _unit) then {
		[_unit, _type] call FNC_GearScript;
		_unit setUnitRank _rank;

		_msg = "";
		switch (_type) do {
			KOBLD_waveSpawn_sectionTitles
		};

		[_unit, "ACRE_PRC343", 8] call FNC_SetRadio;

		hintSilent format["You are respawning as %1 in a reinforcement squad.",_msg];

		_unit setVariable ["FW_Dead", false, true];

		[_unit,false] remoteExecCall ["hideObject", 0];
		[_unit,false] remoteExecCall ["hideObjectGlobal", 2];

		_unit setCaptive false;
		_unit allowdamage true;

		[_unit, false] remoteExec ["setCaptive", 2];
		[_unit, true] remoteExec ["allowdamage", 2];

		_newPos = [[[position fw_west_respawn,4]],[]] call BIS_fnc_randomPos;
		_unit setPosATL _newPos;

		["Terminate"] call BIS_fnc_EGSpectator;
		[false] call acre_api_fnc_setSpectator;

		_unit setVariable ["FW_Spectating", false, true];
	};
};
["KOBLD_waveSpawn_evt_respawnUnit", KOBLD_waveSpawn_respawnUnit] call CBA_fnc_addEventHandler;

FW_spectatePrep = {
 /*
 * Author: Olsen / Perfk / TinfoilHate
 *
 * Checks and handles if the player should respawn or begin spectating.
 * Merged in the EG Spectator Module because everyone uses it anyhow.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

	private ["_respawnName", "_respawnPoint", "_text", "_loadout", "_pos", "_dir", "_cam", "_body", "_temp", "_temp1", "_killcam_msg"];

	player setVariable ["FW_Dead", true, true]; //Tells the framework the player is dead

	player remoteExecCall ["hideObject", 0];
	player remoteExecCall ["hideObjectGlobal", 2];

	player setCaptive true;
	player allowDamage false;
	[player, true] remoteExec ["setCaptive", 2];
	[player, false] remoteExec ["allowDamage", 2];

	player call FNC_RemoveAllGear;
	player addWeapon "itemMap";

	player setPos [0, 0, 0];
	[player] join grpNull;

	if (!(player getVariable ["FW_Spectating", false])) then {
		player setVariable ["FW_Spectating", true, true];
		[true] call acre_api_fnc_setSpectator;

		//we set default pos in case all methods fail and we and up with 0,0,0
		_pos = [2000, 2000, 100];
		_dir = 0;

		//our function is called from Respawned EH, so select 1 is player's body
		_body = (_this select 1);
		if (getMarkerColor FW_spectateMarker == "") then {
			if (!isNull _body) then {
				//set camera pos on player body
				_pos = [(getpos _body) select 0, (getpos _body) select 1, ((getposATL _body) select 2)+1.2];
				_dir = getDir _body;
			};
		} else {
			_pos = getmarkerpos FW_spectateMarker;
		};

		if (abs(_pos select 0) < 2 && abs(_pos select 1) < 2) then {
			_pos = [2000, 2000, 100];
		};

		if (FW_RespawnTickets <= 0) then {
			["Initialize",
				[
					player,
					[BLUFOR],
					true,
					true,
					true,
					false,
					true,
					true,
					true,
					true
				]
			] call BIS_fnc_EGSpectator;
		} else {
			["Initialize",
				[
					player,
					[BLUFOR],
					true,
					true,
					true,
					false,
					true,
					true,
					true,
					true
				]
			] call BIS_fnc_EGSpectator;
		};

		_cam = missionNamespace getVariable ["BIS_EGSpectatorCamera_camera", objNull];

		if (_cam != objNull) then {

			[{!isNull (findDisplay 60492)}, {

					eg_keyHandle = (findDisplay 60492) displayAddEventHandler ["keyDown", {call eg_keyHandler;}];
					eg_keyHandle = (findDisplay 46) displayAddEventHandler ["keyDown", {call eg_keyHandler2}];
			}, []] call CBA_fnc_waitUntilAndExecute;


			if (!FW_killCamActive) then {
				//we move 2 meters back so player's body is visible
				_pos = ([_pos, -2, _dir] call BIS_fnc_relPos);
				_cam setposATL _pos;
				_cam setDir _dir;
			}
			else {
				missionNamespace setVariable ["killcam_toggle", false];

				//this cool piece of code adds key handler to spectator display
				//it takes some time for display to create, so we have to delay it.
				[{!isNull (findDisplay 60492)}, {

					killcam_keyHandle = (findDisplay 60492) displayAddEventHandler ["keyDown", {call FW_killCam_toggle;}];
				}, []] call CBA_fnc_waitUntilAndExecute;

				if (!isNull killcam_killer) then {

					_pos = ([_pos, -1.8, ([(_this select 1), killcam_killer] call BIS_fnc_dirTo)] call BIS_fnc_relPos);
					_cam setposATL _pos;

					//vector magic
					_temp1 = ([getposASL _cam, getposASL killcam_killer] call BIS_fnc_vectorFromXToY);
					_temp = (_temp1 call CBA_fnc_vect2Polar);

					//we check if camera is not pointing up, just in case
					if (abs(_temp select 2) > 89) then {_temp set [2, 0]};
					[_cam, [_temp select 1, _temp select 2]] call BIS_fnc_setObjectRotation;
				}
				else {

					_cam setposATL _pos;
					_cam setDir _dir;
				};

				killcam_texture = "a3\ui_f\data\gui\cfg\debriefing\enddeath_ca.paa";

				killcam_drawHandle = addMissionEventHandler ["Draw3D", {
					//we don't draw hud unless we toggle it by keypress
					if (missionNamespace getVariable ["killcam_toggle", false]) then {

						if ((killcam_killer_pos select 0) != 0) then {

							_u = killcam_unit_pos;
							_k = killcam_killer_pos;
							if ((_u distance _k) < 2000) then {
								//TODO do it better
								drawLine3D [[(_u select 0)+0.01, (_u select 1)+0.01, (_u select 2)+0.01], [(_k select 0)+0.01, (_k select 1)+0.01, (_k select 2)+0.01], [1,0,0,1]];
								drawLine3D [[(_u select 0)-0.01, (_u select 1)-0.01, (_u select 2)-0.01], [(_k select 0)-0.01, (_k select 1)-0.01, (_k select 2)-0.01], [1,0,0,1]];
								drawLine3D [[(_u select 0)-0.01, (_u select 1)+0.01, (_u select 2)-0.01], [(_k select 0)-0.01, (_k select 1)+0.01, (_k select 2)-0.01], [1,0,0,1]];
								drawLine3D [[(_u select 0)+0.01, (_u select 1)-0.01, (_u select 2)+0.01], [(_k select 0)+0.01, (_k select 1)-0.01, (_k select 2)+0.01], [1,0,0,1]];
							};
							if (!isNull killcam_killer) then {
								drawIcon3D [killcam_texture, [1,0,0,1], [eyePos killcam_killer select 0, eyePos killcam_killer select 1, (ASLtoAGL eyePos killcam_killer select 2) + 0.4], 0.7, 0.7, 0, "killer", 1, 0.04, "PuristaMedium"];
							};
						}
						else {
							cutText ["killer info unavailable", "PLAIN DOWN"];
							missionNamespace setVariable ["killcam_toggle", false];
						};
					};
				}];//draw EH
			};//killcam (not) active
		};//checking camera

		_killcam_msg = "";
		if (FW_killCamActive) then {
			_killcam_msg = "Press <t color='#FFA500'>K</t> to toggle indicator showing location where you were killed from.<br/>";
		};
		_text = format ["<t size='0.5' color='#ffffff'>%1
		Close spectator HUD by pressing <t color='#FFA500'>CTRL+H</t>.<br/>
		Press <t color='#FFA500'>SHIFT</t>, <t color='#FFA500'>ALT</t> or <t color='#FFA500'>SHIFT+ALT</t> to modify camera speed. Open map by pressing <t color='#FFA500'>M</t> and click anywhere to move camera to that postion.<br/>
		Spectator controls can be customized in game <t color='#FFA500'>options->controls->'Camera'</t> tab.</t>", _killcam_msg];

		[_text, 0.55, 0.8, 20, 1] spawn BIS_fnc_dynamicText;

		[] spawn {
			while {(player getVariable ["FW_Spectating", false])} do {
				player setOxygenRemaining 1;
				sleep 0.25;
			};
		};
	} //not already spectator check
	else {
		call BIS_fnc_VRFadeIn;
	};
};