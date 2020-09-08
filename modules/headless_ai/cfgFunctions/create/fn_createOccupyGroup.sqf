#include "..\..\script_macros.hpp"


params ["_args",["_initmode",false,[false]]];
_args params [
    "",
    "_groupSet",
    "_groupMem",
    ["_blds",[],[[]]],
    ["_bldPos",[],[[]]],
    ["_uBld",objNull,[objNull]]
];
_groupSet params [
    "_side",
    "_gpos",
    "_behaviour",
    "_combat",
    "_speed",
    "_formation",
    "",
    "",
    "",
    "_taskRadius",
    "_wait",
    "_startBld",
    "_task",
    "_taskTimer",
    "",
    "_occupyOption",
    "",
    "",
    "",
    "_tasks",
    ""
];
private _spos = _gpos;
_blds = [_spos,_taskRadius,_occupyOption,(count _groupMem)] call FUNC(getBuildingList);
_blds params [["_bld",[],[[]]],["_bldPos",[],[[]]]];
private _ngrp = createGroup _side;
{
    if !(_bld isEqualTo []) then {
        private _setBldPos = [_occupyOption,_foreachIndex,_bld,_bldPos] call FUNC(setBuildingPos);
        _setBldPos params [["_hpos",[],[[]]]];
        _spos = _hpos;
    };
    private _u = [true,_ngrp,_spos,_startBld,_foreachIndex,_x,_taskRadius] call FUNC(createUnit);
    if ((count (units _ngrp)) isEqualTo 1) then { _gpos = _spos; };
    _u enableAI "Path";
    if (_task isEqualTo 2 || _task isEqualTo 4 || _task isEqualTo 5) then {
        _u setvariable[QGVAR(Occupy),true];
        [_u,_uBld,_bldPos,_wait,[_behaviour,_combat,_speed,_formation]] spawn FUNC(taskBuildingPatrol);
    };
} foreach _groupMem;
//if !(_storedVars isEqualTo []) then {
//    LOG_1("Setting vars: %1",_storedVars);
//    {
//        _x params ["_varName",
//"_varValue"];
//        _ngrp setvariable [_varName,_varValue];
//        LOG_2("Setting _varName: %1 with: %2",_varName,_varValue);
//    } forEach _storedVars;
//};
[_ngrp,_gpos,_groupSet] call FUNC(setGroupVariables);
if !(_tasks isEqualTo []) then {
    [_ngrp,_tasks] call FUNC(taskRegister);
    _tasks = _tasks call FUNC(taskRemoveZoneActivated);
};
if !(_tasks isEqualTo []) then {GVAR(taskedGroups) pushBack [_ngrp];};
if (!(_tasks isEqualTo []) && {_taskTimer isEqualTo 0}) then {
    [_ngrp,_tasks] call FUNC(taskInit);
} else {
    if (_task isEqualTo 0 || _task isEqualTo 1 || _task isEqualTo 3) then {
        {_x setvariable[QGVAR(Occupy),true]} forEach (units _ngrp);
        _ngrp setVariable[QGVAR(CurrentTaskEndTime),(CBA_MissionTime + _taskTimer)];
        private _passarray = [_task,_ngrp,_spos,_taskRadius,_wait,_behaviour,_combat,_speed,_formation];
        [{!((count waypoints (_this select 1)) isEqualTo 0)},{
            _this call FUNC(taskAssign);
        },_passarray] call CBA_fnc_waitUntilAndExecute;
    };
};
if (_blds isEqualTo []) then {
    LOG_2("Group %1 was unable to detect an enterable buildings. The group is located at %2. Increase Task Radius or move group closer to more buildings.",_ngrp,_spos);
};
true
