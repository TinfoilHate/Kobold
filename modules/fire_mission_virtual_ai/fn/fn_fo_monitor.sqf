/*
 * Author: TinfoilHate
 * AI Forward Observer script with spawned firemissions
 * Original script by Whollysteve (c.2010), from Nou's FO Script and Blakeace's AI Artillery Framework
 *
 * We usin' the wayback machine, boys
 *
 * Arguments:
 * 0: FO <OBJECT>
 * 1: Firemission Template <STRING>
 * 2: Minutes Between Firemission Search <NUMBER>
 * 3: Minutes After Firemission Execution <NUMBER>
 * 4: Side to Attack <SIDE>
 * 5: Search Radius from FO <NUMBER>
 * 6: Adjustment Rounds <NUMBER>
 * 7: FO Skill (Low 1 > 10 High) <NUMBER>
 *
 * Return Value:
 * Nil
 *
 * Example:
 * [TKA_FO,"TARGETED",2,10,west,1000,2,7] spawn tin_fnc_fo_monitor;
 *
 * Public: Yes
*/

if (isServer) then {
	waitUntil {!isNil "tin_var_artyMissionsAI"};

	params ["_fo","_firemission",["_wait",1],["_postWait",5],"_side",["_range",1000],["_adjustRounds",2],["_skill",5]];

	private _debugMessages = false;
	private _forceMultiplier = 1;
	private _lastMission = [-10000,-10000,0];

	if (_wait < 0.5) then {_wait = 0.5};

	if !(_fo getVariable ["tin_var_ai_fo",false]) then {
		_fo setVariable ["tin_var_ai_fo",true,true];

		while { alive _fo } do {
			if !(_fo getVariable "tin_var_ai_fo") exitWith {
				if (_debugMessages) then { systemChat format["%1 has been removed via variable and is no longer being handled", _fo]; };
			};

			private _mostCount = 0;
			private _target = [];

			private _units = nearestObjects [_fo, ["LandVehicle", "CAManBase"], _range];

			if (_debugMessages) then { systemChat format["%1 looking for targets...",_fo]; };

			{
				if (side _x isEqualTo _side && {alive _x}) then {
					if (_debugMessages) then { systemChat format["%1 found %2",_fo,_x]; };

					private _near = nearestObjects [_x, ["LandVehicle", "CAManBase"], 100];
					private _liveCount = 0;
					private _objects = [];

					{
						if (side _x isEqualTo _side && {alive _x} && {(damage _x) < 0.5}) then {
							_liveCount = _liveCount + 1;
							_objects pushBackUnique _x;
						};
					} forEach _near;

					if (_liveCount > _mostCount && {(_x distance _lastMission) > 120}) then {
						_forceMultiplier = 1;

						if (_debugMessages) then { systemChat format["Distance from last mission: %1", (_x distance _lastMission)]; };

						private _tanks = "Tank" countType _objects;
						_forceMultiplier = _forceMultiplier + (_tanks * 0.33);

						private _apcs = "Wheeled_APC_F" countType _objects;
						_forceMultiplier = _forceMultiplier + (_apcs * 0.25);

						_mostCount = _liveCount;
						_lastMission = getPos _x;

						if ((leader _x) != _x && {((leader _x) distance _x) <= 100}) then {
							_target = leader _x;
						} else {
							_target = _x;
						};
					};

					if (_debugMessages) then { systemChat format["Distance from last mission: %1", (_x distance _lastMission)]; };

					sleep 0.025;
				};
			} forEach _units;

			if (_target isEqualTo []) then {
				_lastMission = [-10000,-10000,0];

				if (_debugMessages) then { systemChat format["No targets found near %1", _fo]; };
			} else {
				if (_debugMessages) then { systemChat format["Target is: %1 counting for %2 units total.", _target, _mostCount]; };

				_fo setVariable ["tin_var_ai_fo_ready", false, true];

				if (_debugMessages) then { systemChat format["Sending %1", [_firemission,_target,_fo,_forceMultiplier,_adjustRounds,_skill]]; };

				[_firemission,_target,_fo,_forceMultiplier,_adjustRounds,_skill] spawn tin_fnc_fo_firemission;

				if (_debugMessages) then { systemChat format["Waiting for %1 to finish mission", _fo]; };

				waitUntil { _fo getVariable "tin_var_ai_fo_ready"; };

				private _postTime = (_postWait - _wait) * 60;

				if (_debugMessages) then { systemChat format["%1 has finished mission, waiting %2 additional minutes.", _fo,(_postTime / 60)]; };

				sleep _postTime;
			};

			if (_debugMessages) then { systemChat format["%1 is waiting %2 minutes for next search", _fo, _wait]; };

			sleep (round (_wait * 60));
		};

		if (_debugMessages) then { systemChat format["%1 has been killed and is no longer being handled", _fo]; };
	} else {
		if (_debugMessages) then { systemChat format["FO system already handling %1", _fo]; };
	};
};