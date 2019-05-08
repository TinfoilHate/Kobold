//PZAI_fnc_CombatResponse

params ["_Group",["_RadioEnemy",objnull],["_reinforcement",false]];

_leader = leader _group;
_currentmission = _group getVariable ["PZAI_Mission","NONE"];
if (behaviour _leader isEqualto "SAFE") then {
	_group setbehaviour "AWARE";
};
_currenttarget = _group getvariable ["PZAI_CurrentTarget",objnull];
if (!(_RadioEnemy isEqualto objnull) && (_currenttarget isEqualto objnull)) then {
	_currenttarget = _RadioEnemy;
	_group setvariable ["PZAI_CurrentTarget",_RadioEnemy];
};
_enemydir = _leader getdir _currenttarget;
_enemydist = _leader distance _currenttarget;

switch (_currentmission) do {
	case "GARRISON": {};
	case "STATIONARY": {};
	case "BUNKER": {};
	case "DEFAULT PATROLLING": {
			if (_enemydist < 150) then {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			} else {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			};
		};
	case "PATROLLING": {
			if (_enemydist < 150) then {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			} else {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			};
		};
	case "LOITERING": {
			(_group) setSpeedMode "FULL";
			{_x setUnitPos "AUTO";} foreach (units _group);
			if (((random 2) > 1) || _reinforcement) then {
				[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatAttack;
			} else {
				[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
			};
		}; //regroups unit via a different function
	case "IDLE": {
			if (_enemydist < 150) then {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			} else {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			};
		};
	case "NONE": {
			if (_enemydist < 150) then {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			} else {
				if (((random 2) > 1) || _reinforcement) then {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
				};
			};
		};
	default {
		if (_enemydist < 150) then {
			if (((random 2) > 1) || _reinforcement) then {
				[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatAttack;
			} else {
				[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
			};
		} else {
			if (((random 2) > 1) || _reinforcement) then {
				[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatMoveTo;
			} else {
				[_Group,_currenttarget,_enemydir] call PZAI_fnc_CombatDefend;
			};
		};
	};
};
