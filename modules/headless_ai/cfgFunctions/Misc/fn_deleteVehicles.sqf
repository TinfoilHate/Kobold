#include "..\..\script_macros.hpp"


params ["_arr"];

{
    private _vehicle = _x;
    if (!(_vehicle isKindOf "Logic") && {!isNull _vehicle}) then {
		_vehicle remoteExec ["FNC_untrackUnit", 2];

        {
            private _object = _x;
            detach _object;
            deleteVehicle _object;
        } foreach attachedObjects _vehicle;
        deleteVehicle _vehicle;
        deleteGroup (group _vehicle);
    };
} forEach _arr;
