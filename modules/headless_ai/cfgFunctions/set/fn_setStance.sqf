#include "..\..\script_macros.hpp"

params [["_unit", objNull, [objNull]], ["_groupStance", "AUTO", [""]], ["_unitStance", "AUTO", [""]]];

if (_groupStance isEqualTo "AUTO") then {
    _unit setUnitPos _unitStance;
} else {
    if !(_groupStance isEqualTo _unitStance) then {
        _unit setUnitPos _unitStance;
    } else {
        _unit setUnitPos _groupStance;
    };
};

