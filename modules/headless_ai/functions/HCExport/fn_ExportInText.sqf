if !is3DEN exitWith {};

private["_br","_entities"];
params ["_type","_selectType"];

_br = toString [13,10];
_entities = all3DENEntities;

_type2 = format ["%1",(toLower _type)];

switch (_type2) do {
	case "object": {
		private["_objects","_init"];
		_objects = switch _selectType do {
			case 1: { get3DENSelected "object" };
			case 2: { _entities select 0 };
		};
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedObjects = ""; };
			case 2: { HC_3DEN_TextObjectsOnMap = ""; };
		};
		
		_TextObjects = "";
		{
			_isUnit = _x isKindOf "Man";
			_isVehicle = _x isKindOf "LandVehicle" || _x isKindOf "Ship" || _x isKindOf "Air";
			if (!_isUnit && !_isVehicle) then {
				if (_TextObjects isEqualTo "") then {
					_TextObjects = _TextObjects + _br + "	 ";
				}else{
					_TextObjects = _TextObjects + _br + "	,";
				};			
				
				_init = ["this", "_this", ((_x get3DENAttribute "Init") select 0)] call HC_fnc_ReplaceText;
				
				_TextObjects = _TextObjects + format["[%1, [%2, %3], [%4, [%5, %6], %7], [%8, %9], [%10, %11, %12, %13], [%14, %15], [%16]]", str(typeOf _x), str((_x get3DENAttribute "Name") select 0), str(_init), getPosWorld _x, vectorDir _x, vectorUp _x, ((_x get3DENAttribute "placementRadius") select 0), 1 - ((_x get3DENAttribute "Health") select 0), ((_x get3DENAttribute "Ammo") select 0), ((_x get3DENAttribute "DynamicSimulation") select 0), ((_x get3DENAttribute "enableSimulation") select 0), ((_x get3DENAttribute "HideObject") select 0), ((_x get3DENAttribute "AllowDamage") select 0), ((_x get3DENAttribute "presence") select 0), str((_x get3DENAttribute "presenceCondition") select 0)];
			};
		} forEach _objects;
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedObjects = _TextObjects; };
			case 2: { HC_3DEN_TextObjectsOnMap = _TextObjects; };
		};
		//[classname,[vehVarName,init],[pos,[verticaldir,verticalUp],randomPos],[damage,ammo],[dinamicSimulation,simulation,hideobj,allowDam],[presence,condition]]
	};
	case "vehicle": {
		private["_vehicles","_init","_crew"];
		_vehicles = switch _selectType do {
			case 1: { get3DENSelected "object" };
			case 2: { _entities select 0 };
		};
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedVehicles = ""; };
			case 2: { HC_3DEN_TextVehiclesOnMap = ""; };
		};
		
		_textVehicles = "";
		{
			if (_x isKindOf "LandVehicle" || _x isKindOf "Ship" || _x isKindOf "Air") then {
				_crew = crew _x;
				
				if (_crew isEqualTo []) then {
					if (_textVehicles isEqualTo "") then {
						_textVehicles = _textVehicles + _br + "	 ";
					}else{
						_textVehicles = _textVehicles + _br + "	,";
					};			
				
					_init = ["this", "_this", ((_x get3DENAttribute "Init") select 0)] call HC_fnc_ReplaceText;
				
					_textVehicles = _textVehicles + format["[%1, [%2, %3], [%4,[%5,%6], %7], [%8, %9, %10, %11], [%12, %13, %14, %15, %16], [%17, %18], %19, [%20, %21, %22, %23]]", str(typeOf _x), str((_x get3DENAttribute "Name") select 0), str(_init), getPosWorld _x, vectorDir _x, vectorUp _x, ((_x get3DENAttribute "placementRadius") select 0), ((_x get3DENAttribute "Lock") select 0), 1 - ((_x get3DENAttribute "Health") select 0), ((_x get3DENAttribute "Fuel") select 0), ((_x get3DENAttribute "Ammo") select 0), ((_x get3DENAttribute "DynamicSimulation") select 0), ((_x get3DENAttribute "enableSimulation") select 0), ((_x get3DENAttribute "objectIsSimple") select 0), ((_x get3DENAttribute "HideObject") select 0), ((_x get3DENAttribute "AllowDamage") select 0), ((_x get3DENAttribute "presence") select 0), str((_x get3DENAttribute "presenceCondition") select 0), ((_x get3DENAttribute "ammoBox") select 0), ((_x get3DENAttribute "ReportRemoteTargets") select 0), ((_x get3DENAttribute "ReceiveRemoteTargets") select 0), ((_x get3DENAttribute "ReportOwnPosition") select 0), ((_x get3DENAttribute "RadarUsageAI") select 0)];
				};
			};
		} forEach _vehicles;
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedVehicles = _textVehicles; };
			case 2: { HC_3DEN_TextVehiclesOnMap = _textVehicles; };
		};
		//[classname,[vehVarName,init],[pos,[verticaldir,verticalUp],randomPos],[lock,damage,fuel,ammo],[dinamicSimulation,simulation,simpleObj,hideobj,allowDam],[presence,condition],paramsGear,[ReportRemoteTargets,ReceiveRemoteTargets,ReportOwnPosition,RadarUsageAI]]
	};
	case "marker": {
		private["_markers","_shape","_marker"];
		_markers = switch _selectType do {
			case 1: { get3DENSelected "marker" };
			case 2: { _entities select 5 };
		};
		
		_allMarkerType = ["ICON","RECTANGLE","ELLIPSE"];
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedMarkers = ""; };
			case 2: { HC_3DEN_TextMarkersOnMap = ""; };
		};
		
		_textMarkers = "";
		{
			if (_textMarkers isEqualTo "") then {
				_textMarkers = _textMarkers + _br + "	 ";
			}else{
				_textMarkers = _textMarkers + _br + "	,";
			};
			
			_marker = _x;
			
			_shape = _allMarkerType select (((_marker get3DENAttribute "markerType") select 0) + 1);
			
			_textMarkers = _textMarkers + format ["[%1, [%2, %3], [%4, %5, %6], %7, [%8, %9, %10]]", str(_marker), str(_shape), str((_marker get3DENAttribute "itemClass") select 0), str((_marker get3DENAttribute "position") select 0), str((_marker get3DENAttribute "size2") select 0), str((_marker get3DENAttribute "rotation") select 0), str((_marker get3DENAttribute "text") select 0), str((_marker get3DENAttribute "brush") select 0), str((_marker get3DENAttribute "baseColor") select 0), str((_marker get3DENAttribute "alpha") select 0)];
			
		} forEach _markers;
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedMarkers = _textMarkers; };
			case 2: { HC_3DEN_TextMarkersOnMap = _textMarkers; };
		};
		//[name(var),[shape, type], [pos, size, rotation], text, [brush(texture), color, alpha]]
	};
	case "groups": {
		private["_groups","_init","_allFormations","_allSpeedModes","_formation","_speedMode","_textGr","_textGrUs"];
		_groups = switch _selectType do {
			case 1: { 
				private _gs = get3DENSelected "group";
				{
					if (_x isKindOf "Man") then {
						_gs pushBackUnique (group _x);
					}else{
						if (_x isKindOf "LandVehicle" || _x isKindOf "Ship" || _x isKindOf "Air") then {
							{
								_gs pushBackUnique (group _x);
							} forEach (crew _x);
						};
					};
				} forEach get3DENSelected "object";
				_gs
			};
			case 2: { _entities select 1 };
		};
		_waypoints = switch _selectType do {
			case 1: { get3DENSelected "waypoint" };
			case 2: { _entities select 4 };
		};
		_allFormations = ["NO CHANGE","WEDGE","VEE","LINE","COLUMN","FILE","STAG COLUMN","ECH LEFT","ECH RIGHT","DIAMOND"];
		_allSpeedModes = ["UNCHANGED","LIMITED","NORMAL","FULL"];
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedGroups = ""; };
			case 2: { HC_3DEN_TextGroupsOnMap = ""; };
		};
		
		_textVehicles= "";
		_textGroupUnits= "";
		
		if !(_groups isEqualTo []) then {
			_vehicles = [];
			
			_addedGroups = [];
			_addedUnits = [];
			
			_waitUnits = [];
			_vehWaitUnits = [];
		
			{
				_group = _x;
				if !(_group in _addedGroups) then {
					_units = units _group;
					
					_textGrUs = "";
					{
						if !(_x in _addedUnits) then {
							
							_veh = vehicle _x;
							_inNoVeh = _veh isEqualTo _x;
							
							if (_inNoVeh) then {
								if (_textGrUs isEqualTo "") then {
									_textGrUs = _textGrUs + _br + "			 ";
								}else{
									_textGrUs = _textGrUs + _br + "			,";
								};
								
								_init = ["this", "_this", ((_x get3DENAttribute "Init") select 0)] call HC_fnc_ReplaceText;
								_textGrUs = _textGrUs + format["[%1, [%2, %3], [%4, [%5, %6], %7], [%8, %9, %10, %11, %12], [%13, %14, %15, %16, %17, %18], [%19, %20, %21, %22, %23, %24], [%25, %26], [%27], []]", str(typeOf _x), str((_x get3DENAttribute "Name") select 0), str(_init), getPosWorld _x, vectorDir _x, vectorUp _x, ((_x get3DENAttribute "placementRadius") select 0), ((_x get3DENAttribute "Skill") select 0), 1 - ((_x get3DENAttribute "Health") select 0), ((_x get3DENAttribute "Ammo") select 0), str((_x get3DENAttribute "Rank") select 0), str(unitPos _x), ((_x get3DENAttribute "DynamicSimulation") select 0), ((_x get3DENAttribute "enableSimulation") select 0), ((_x get3DENAttribute "HideObject") select 0), ((_x get3DENAttribute "AllowDamage") select 0), ((_x get3DENAttribute "enableStamina") select 0), ((_x get3DENAttribute "EnableRevive") select 0), str(name _x), str(face _x), str(nameSound _x), str(speaker _x), pitch _x , str((_x get3DENAttribute "UnitInsignia") select 0), ((_x get3DENAttribute "presence") select 0), str((_x get3DENAttribute "presenceCondition") select 0), (getUnitLoadout _x)];
								_addedUnits pushBack _x;
								
							} else {
								_crew = crew _veh;
								_numVeh = -1;
								
								{
									if !(_x in _addedUnits) then {
										if (_x in _units) then {
											
											if (_textGrUs isEqualTo "") then {
												_textGrUs = _textGrUs + _br + "			 ";
											}else{
												_textGrUs = _textGrUs + _br + "			,";
											};
											
											_init = ["this", "_this", ((_x get3DENAttribute "Init") select 0)] call HC_fnc_ReplaceText;
											_role = assignedVehicleRole _x;
											if (_role isEqualTo []) then { _role = ["cargo"]; };
											
											_selNveh = if (_x in _waitUnits) then { _vehWaitUnits select (_waitUnits find _x) }else{
												if (_numVeh isEqualTo -1) then {
													_numVeh = _vehicles pushBack _veh;
												};
												_numVeh
											};
											
											_textGrUs = _textGrUs + format["[%1, [%2, %3], [%4, [%5, %6], %7], [%8, %9, %10, %11, %12], [%13, %14, %15, %16, %17, %18], [%19, %20, %21, %22, %23, %24], [%25, %26], [%29], [%27, %28]]", str(typeOf _x), str((_x get3DENAttribute "Name") select 0), str(_init), getPosWorld _x, vectorDir _x, vectorUp _x, ((_x get3DENAttribute "placementRadius") select 0), ((_x get3DENAttribute "Skill") select 0), 1 - ((_x get3DENAttribute "Health") select 0), ((_x get3DENAttribute "Ammo") select 0), str((_x get3DENAttribute "Rank") select 0), str(unitPos _x), ((_x get3DENAttribute "DynamicSimulation") select 0), ((_x get3DENAttribute "enableSimulation") select 0), ((_x get3DENAttribute "HideObject") select 0), ((_x get3DENAttribute "AllowDamage") select 0), ((_x get3DENAttribute "enableStamina") select 0), ((_x get3DENAttribute "EnableRevive") select 0), str(name _x), str(face _x), str(nameSound _x), str(speaker _x), pitch _x , str((_x get3DENAttribute "UnitInsignia") select 0), ((_x get3DENAttribute "presence") select 0), str((_x get3DENAttribute "presenceCondition") select 0), _selNveh, _role, (getUnitLoadout _x)];
											_addedUnits pushBack _x;
										}else{
											if !(_x in _waitUnits) then {
												if (_numVeh isEqualTo -1) then {
													_numVeh = _vehicles pushBack _veh;
												};
												
												_i = _waitUnits pushBack _x;
												_vehWaitUnits set [_i, _numVeh];
											};
										};
									};
								} forEach _crew;
							};
						};
					} forEach _units;
					
					
					
					if !(_textGrUs isEqualTo "") then {
						
						_textGr = "";
						if (_textGroupUnits isEqualTo "") then {
							_textGr = _textGr + _br + "		";
						}else{
							_textGr = _textGr + _br + "		,";
						};
					
						_side = side (_units select 0);
						if (_side isEqualTo Civilian) then { _side = "CIVILIAN"; };
						if (_side isEqualTo independent) then { _side = "INDEPENDENT"; };
						
						_init = ["this", "_this", ((_group get3DENAttribute "Init") select 0)] call HC_fnc_ReplaceText;
						_formation = _allFormations select (((_group get3DENAttribute "Formation") select 0) + 1);
						_speedMode = _allSpeedModes select (((_group get3DENAttribute "speedMode") select 0) + 1);
						
						_textGr = _textGr + format["[%1, [%2, %3%, %4, %5], [%6, %7, %8, %9, %10, %11], [", _side, str((_group get3DENAttribute "Name") select 0), str(_init), str(groupId _group), ((_group get3DENAttribute "placementRadius") select 0), str((_group get3DENAttribute "CombatMode") select 0), str((_group get3DENAttribute "Behaviour") select 0), str _formation, str _speedMode, ((_group get3DENAttribute "DynamicSimulation") select 0), ((_group get3DENAttribute "garbageCollectGroup") select 0)];
						
						_textGrWp = "";
						{
							_grWt = _x select 0;
							if (_grWt isEqualTo _group) then {
								if (_textGrWp isEqualTo "") then {
									_textGrWp = _textGrWp + _br + "			 ";
								}else{
									_textGrWp = _textGrWp + _br + "			,";
								};
								
								_addonW = "";
								_typeW = (_x get3DENAttribute "itemClass") select 0;
								
								if (_typeW == "Demine") then {
									_addonW = format[",%1",((_x get3DENAttribute "ClearUnknown") select 0)]; 
								}else{ if (_typeW == "LOITER") then {
									private _direction = if ((_x get3DENAttribute "LoiterDirection") select 0) then {"CIRCLE"}else{"CIRCLE_L"};
									_addonW = format[",[%1,%2,%3]",str(_direction),((_x get3DENAttribute "LoiterRadius") select 0),((_x get3DENAttribute "LoiterAltitude") select 0)]; 
								};};
								
								if !(isClass(configFile >> "CfgWaypoints" >> "Default" >> _typeW)) then { _typeW = "Scripted"; };
								
								_formationWt = _allFormations select ((_x get3DENAttribute "Formation") select 0);
								_speedModeWt = _allSpeedModes select ((_x get3DENAttribute "speedMode") select 0);
								
								_textGrWp = _textGrWp + format["[%1, [%2, %3], [%4, %5, %6], [%7, %8, %9, %10], [%11, %12, %13], [%14, %15], %16, [%17, %18, %19, %20, %21, %22]", str(_typeW), str((_x get3DENAttribute "description") select 0), str((_x get3DENAttribute "name") select 0), ((_x get3DENAttribute "position") select 0), ((_x get3DENAttribute "placementRadius") select 0), ((_x get3DENAttribute "completionRadius") select 0), str((_x get3DENAttribute "combatMode") select 0), str((_x get3DENAttribute "behaviour") select 0), str _formationWt, str _speedModeWt, str((_x get3DENAttribute "condition") select 0), str((_x get3DENAttribute "onActivation") select 0), str((_x get3DENAttribute "script") select 0), ((_x get3DENAttribute "show2D") select 0), ((_x get3DENAttribute "show3D") select 0), ((_x get3DENAttribute "timeout") select 0), str((_x get3DENAttribute "effectCondition") select 0), str((_x get3DENAttribute "sound") select 0), str((_x get3DENAttribute "voice") select 0), str((_x get3DENAttribute "soundEnvironment") select 0), str((_x get3DENAttribute "music") select 0), str((_x get3DENAttribute "title") select 0)];
								_textGrWp = _textGrWp + _addonW;
								_textGrWp = _textGrWp + "]";
							};
						} forEach _waypoints;
					
						_textGr = _textGr + _textGrUs + _br + "		],[" + _textGrWp + _br + "		]]";
						
						_textGroupUnits = _textGroupUnits + _textGr;
						
						_addedGroups pushBack _group;
					};
				};
			} forEach _groups;
			
			if (_vehicles isEqualTo []) then {
				_textVehicles = "[]";
			}else{
				{
					if (_textVehicles isEqualTo "") then {
						_textVehicles = _textVehicles + _br + "		 ";
					}else{
						_textVehicles = _textVehicles + _br + "		,";
					};			
					
					_init = ["this", "_this", ((_x get3DENAttribute "Init") select 0)] call HC_fnc_ReplaceText;
					_textVehicles = _textVehicles + format["[%1, [%2, %3], [%4,[%5,%6], %7], [%8, %9, %10, %11], [%12, %13, %14, %15, %16], [%17, %18], %19, [%20, %21, %22, %23]]", str(typeOf _x), str((_x get3DENAttribute "Name") select 0), str(_init), getPosWorld _x, vectorDir _x, vectorUp _x, ((_x get3DENAttribute "placementRadius") select 0), ((_x get3DENAttribute "Lock") select 0), 1 - ((_x get3DENAttribute "Health") select 0), ((_x get3DENAttribute "Fuel") select 0), ((_x get3DENAttribute "Ammo") select 0), ((_x get3DENAttribute "DynamicSimulation") select 0), ((_x get3DENAttribute "enableSimulation") select 0), ((_x get3DENAttribute "objectIsSimple") select 0), ((_x get3DENAttribute "HideObject") select 0), ((_x get3DENAttribute "AllowDamage") select 0), ((_x get3DENAttribute "presence") select 0), str((_x get3DENAttribute "presenceCondition") select 0), ((_x get3DENAttribute "ammoBox") select 0), ((_x get3DENAttribute "ReportRemoteTargets") select 0), ((_x get3DENAttribute "ReceiveRemoteTargets") select 0), ((_x get3DENAttribute "ReportOwnPosition") select 0), ((_x get3DENAttribute "RadarUsageAI") select 0)];
				} forEach _vehicles;
				
				_textVehicles = _br + " 	[" + _textVehicles + _br + "	]";
			};
			_textGroupUnits = ",[" + _textGroupUnits + _br + "	]";
		};
		
		switch _selectType do {
			case 1: { HC_3DEN_TextSelectedGroups =  _textVehicles + _textGroupUnits; };
			case 2: { HC_3DEN_TextGroupsOnMap =  _textVehicles + _textGroupUnits; };
		};
		
		//[vehicles:[vehicle,vehicle...],groups:[group,group...]]
		//group: [side, [vehVarName?,init,groipId,randomPos?],[CombatMode,Behaviour,Formation,SpeedMode,DynamicSimulation,DeleteWhenEmpty],units:[unit,unit...],waypoints:[waypoint,waypoint...]]
		//vehicle: [classname,[vehVarName,init],[pos,[verticaldir,verticalUp],randomPos],[lock,damage,fuel,ammo],[dinamicSimulation,simulation,simpleObj,hideobj,allowDam],[presence,condition],paramsGear,[ReportRemoteTargets,ReceiveRemoteTargets,ReportOwnPosition,RadarUsageAI]]
		//unit: [classname,[vehVarName,init],[pos,[verticaldir,verticalUp],randomPos],[skill,damage,ammo,rank,stance],[dinamicSimulation,simulation,hideobj,allowDam,enableStamina,EnableRevive],[name,face,nameSound,voice,voicePitch,insignia],[presence,condition]]
		//waypoint: [type,[description,name],[pos,randomPos,CompletionRadius],[CombatMode,Behaviour,Formation,SpeedMode],[condition,OnActivation,script],[show,visible],timer,Effect:[condition,sound,voice,environment,music,overlay],clearMines or [LoiterDir,LoiterRadius,LoiterAltitude]]
	};
};
