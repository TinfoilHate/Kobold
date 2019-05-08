//Spawns AI Groups and their waypoints/vehicles from passed _groupArray array made from export functions
if (!FW_var_isHC) exitWith {};

params ["_groupArraystr"];

_groupArray = missionNamespace getVariable _groupArraystr;
if (isNil "_groupArray") exitwith {diag_log "_grouparray not found from string variable!"};

private _spawnedVehicles = [];
_inits = [];

{
	private _obj = objNull;
	private _paramsPresenceV = _x select 5;

	if ((random(1) < (_paramsPresenceV select 0)) && call compileFinal(_paramsPresenceV select 1)) then {
		private _paramsPosV = _x select 2;

		private _posV = _paramsPosV select 0;
		private _randPosV = _paramsPosV select 2;

		_obj = (_x select 0) createVehicle _posV;

		_obj setPosWorld _posV;

		if !(_randPosV isEqualTo 0) then {
			private _randPosVX2 = _randPosV * 2;
			_posV = getPos _obj;
			_posV set [0, (_posV select 0) + ((random _randPosVX2) - _randPosV)];
			_posV set [1, (_posV select 1) + ((random _randPosVX2) - _randPosV)];
			_obj setPos _posV;
		};

		_obj setVectorDirAndUp (_paramsPosV select 1);

	};

		_spawnedVehicles set [_forEachIndex, _obj];

} forEach (_groupArray select 0);

{
	private _side = _x select 0;
	private _group = grpNull;
	private _paramsInitGr = _x select 1;
	private _paramsStatesGr = _x select 2;
	private _units = _x select 3;
	private _waypoints = _x select 4;

	{
		private _paramsPresence = _x select 6;
		private _paramsInventory = (_x select 7);
		private _paramsVeh = _x select 8;

		private _isAllowVeh = false;
		if (_paramsVeh isEqualTo []) then {
			_isAllowVeh = true;
		}else{
			private _numVeh = _paramsVeh select 0;
			private _veh = _spawnedVehicles select _numVeh;
			if (!isNull _veh) then {
				_isAllowVeh = true;
			};
		};

		if (_isAllowVeh && (random(1) < (_paramsPresence select 0)) && call compileFinal(_paramsPresence select 1)) then {

			if (isNull _group) then {
				_group = createGroup [_side, _paramsStatesGr select 5];

				_group setGroupIdGlobal [(_paramsInitGr select 2)];
				_group setCombatMode (_paramsStatesGr select 0);
				_group setBehaviour (_paramsStatesGr select 1);
				_group setFormation (_paramsStatesGr select 2);
				_group setSpeedMode (_paramsStatesGr select 3);
				_group enableDynamicSimulation (_paramsStatesGr select 4);
				
				//Sets VAR name for group
				if !((_paramsInitGr select 0) isEqualTo "") then {
					call compile format ["%1 = _group;",(_paramsInitGr select 0)];
				};

				if !((_paramsInitGr select 1) isEqualTo "") then {
					[_group, (compileFinal (_paramsInitGr select 1))] remoteExec ['bis_fnc_call', 0, _group];
				};

			};

			private _paramsInit = _x select 1;
			private _paramsPos = _x select 2;
			private _paramsStates = _x select 3;
			private _paramsSpecStates = _x select 4;
			private _paramsIdentity = _x select 5;

			private _pos = _paramsPos select 0;
			private _randPos = _paramsPos select 2;

			private _unit = _group createUnit [(_x select 0), (_paramsPos select 0), [], 0, 'CAN_COLLIDE'];

			_unit setPosWorld _pos;

			if !(_randPos isEqualTo 0) then {
				private _randPosX2 = _randPos * 2;
				_pos = getPos _unit;
				_pos set [0, (_pos select 0) + ((random _randPosX2) - _randPos)];
				_pos set [1, (_pos select 1) + ((random _randPosX2) - _randPos)];
				_unit setPos _pos;
			};
			
			//Sets VAR name for unit
			if (!((_paramsInit select 0) isEqualTo "")) then {
				_unit setVehicleVarName (_paramsInit select 0);
				call compile format ["%2 = _unit; publicvariable '%2'",_unit,(_paramsInit select 0)];
			};
			
			_unit setSkill (_paramsStates select 0);
			_unit setDamage [(_paramsStates select 1), false];
			_unit setVehicleAmmo (_paramsStates select 2);
			_unit setRank (_paramsStates select 3);
			
			if (!((_paramsStates select 4) isEqualto "Auto")) then {
				_unit setUnitPos (_paramsStates select 4);
				_unit setvariable ["PZAI_STATIONARY",true];
				_unit forcespeed 0;
				_unit disableAI "PATH";
			} else {
				_unit setUnitPos (_paramsStates select 4);
			};

			_unit setvariable ["vectordirandup",(_paramsPos select 1)];
			_unit enableDynamicSimulation (_paramsSpecStates select 0);
			_unit enableSimulationGlobal (_paramsSpecStates select 1);
			_unit hideObjectGlobal (_paramsSpecStates select 2);
			_unit allowDamage (_paramsSpecStates select 3);
			_unit enableStamina (_paramsSpecStates select 4);
			if (!(_paramsInventory isEqualTo [])) then {
				_unit setUnitLoadout _paramsInventory;
			};
			if (getMissionConfigValue ['ReviveMode',0] == 2) then {_unit setVariable ['#rev_enabled', (_paramsSpecStates select 5), true]};

			[_unit,(_paramsIdentity select 5)] call BIS_fnc_setUnitInsignia;

			_init =  "" 
					+"_this setName " + str(_paramsIdentity select 0) + "; "
					+"_this setFace " + str(_paramsIdentity select 1) + "; "
					+"_this setNameSound " + str(_paramsIdentity select 2) + "; "
					+"_this setSpeaker " + str(_paramsIdentity select 3) + "; "
					+"_this setPitch " + str(_paramsIdentity select 4) + "; "
					+ (_paramsInit select 1);
			
			//add units init to _inits array
			_nul = _inits pushBack [_unit, _init];
			
			//add to framework
			if(!isNil "aCount_addEH") then { ["aCount_event_addEH", _unit] call CBA_fnc_serverEvent};
			[_unit, {_this call FNC_trackUnit;}] remoteExec ["bis_fnc_call", 2];
			
			[_unit] spawn HC_fnc_setunitskill;
			
			_unit setVectorDirAndUp (_paramsPos select 1);

			if !(_paramsVeh isEqualTo []) then {
				private _numVeh = _paramsVeh select 0;
				private _veh = _spawnedVehicles select _numVeh;
				private _role = _paramsVeh select 1;

				if (!isNull _veh) then {
					switch (_role select 0) do {
						case "driver": {
							_unit moveInDriver _veh;
						};
						case "Turret": {
							if (count _role > 1) then {
								_unit moveInTurret  [_veh, (_role select 1)];
							}else{
								_unit moveInTurret  _veh;
							};
						};
						case "cargo": {
							if (count _role > 1) then {
								_unit moveInCargo  [_veh, (_role select 1) select 0];
							}else{
								_unit moveInCargo  _veh;
							};
						};
					};
				};
			};

		};
	} forEach _units;

	{
		_typeW = _x select 0;
		_paramsInitW = _x select 1;
		_paramsPosW = _x select 2;
		_paramsStateW = _x select 3;
		_paramsExpresionW = _x select 4;
		_paramsVisibleW = _x select 5;
		_timer = _x select 6;
		_paramsEffectW = _x select 7;

		_wp = _group addWaypoint [(_paramsPosW select 0), (_paramsPosW select 1)];
		_wp setWaypointCompletionRadius (_paramsPosW select 2);

		//for seek and destroy waypoints we need to rename them to SAD
		if (_typeW isEqualTo "SeekAndDestroy") then {
			_typeW = "SAD";
		};
		
		_wp setWaypointType _typeW;

		_wp setWaypointDescription (_paramsInitW select 0);
		_wp setWaypointName (_paramsInitW select 1);

		_wp setWaypointCombatMode (_paramsStateW select 0);
		_wp setWaypointBehaviour (_paramsStateW select 1);
		_wp setWaypointFormation (_paramsStateW select 2);
		_wp setWaypointSpeed (_paramsStateW select 3);

		_wp setWaypointStatements [(_paramsExpresionW select 0),(_paramsExpresionW select 1)];
		if (_typeW == "Demine") then {
			_wp setWaypointScript ((_paramsExpresionW select 2) + " " + str(_x select 8));
		}else{
			_wp setWaypointScript (_paramsExpresionW select 2);
		};

		_showW = if (_paramsVisibleW select 0) then {"ALWAYS"}else{"NEVER"};
		_wp showWaypoint _showW;
		_wp setWaypointVisible (_paramsVisibleW select 1);

		_wp setWaypointTimeout _timer;

		_wp setEffectCondition (_paramsEffectW select 0);
		_wp setSoundEffect [(_paramsEffectW select 1),(_paramsEffectW select 2),(_paramsEffectW select 3),""];
		_wp setMusicEffect (_paramsEffectW select 4);
		_wp setTitleEffect ["TEXT", "PLAIN DOWN", (_paramsEffectW select 5)];

		if (_typeW == "LOITER") then {
			_paramsLoiter = _x select 8;
			_wp setWaypointLoiterType (_paramsLoiter select 0);
			_wp setWaypointLoiterRadius (_paramsLoiter select 1);
		};

	} forEach _waypoints;

	_group = grpNull;
} forEach (_groupArray select 1);

{
		private _paramsInitV = _x select 1;
		private _paramsStatesV = _x select 3;
		private _paramsSpecStatesV = _x select 4;
		private _paramsGear = _x select 6;
		private _paramsElectr = _x select 7;

		_obj = _spawnedVehicles select _forEachIndex;
	
		//set VAR name for vehicle
		if (!((_paramsInitV select 0) isEqualTo "")) then {
			_obj setVehicleVarName (_paramsInitV select 0);
			call compile format ["%2 = _obj; publicvariable '%2'",_obj,(_paramsInitV select 0)];
		};
	
		_obj lock (_paramsStatesV select 0);
		_obj setDamage [(_paramsStatesV select 1), false];
		_obj setFuel (_paramsStatesV select 2);
		_obj setVehicleAmmo (_paramsStatesV select 3);

		_obj enableDynamicSimulation (_paramsSpecStatesV select 0);
		_obj enableSimulationGlobal (_paramsSpecStatesV select 1);
		_obj hideObjectGlobal (_paramsSpecStatesV select 3);
		_obj allowDamage (_paramsSpecStatesV select 4);

		[_obj, _paramsGear] call BIS_fnc_initAmmoBox;

		_obj setVehicleReportRemoteTargets (_paramsElectr select 0);
		_obj setVehicleReceiveRemoteTargets (_paramsElectr select 1);
		_obj setVehicleReportOwnPosition (_paramsElectr select 2);
		_obj setVehicleRadar (_paramsElectr select 3);

		//add veh init to _inits array
		if !((_paramsInitV select 1) isEqualTo "") then {
			_nul = _inits pushBack [_obj, (_paramsInitV select 1)];
		};

} forEach (_groupArray select 0);

{
	_x params [ "_obj", "_code" ];
	_obj call compile _code;
}forEach _inits;
