/*
 * Author: TinfoilHate
 *  Rotate the camera around a point
 *
 * Arguments:
 *  Nil
 *
 * Return Value:
 *  Nil
 *
 * Example:
 * call kobld_safeStart_fnc_camRotate;
 *
 * Public: No
*/

#include "..\script_component.hpp"

params ["_pos", ["_alt", 500], ["_rad", 200], ["_ang", random 360], ["_dir", round random 1]];

[_pos, _alt, _rad, _ang, _dir] spawn {
	params ["_pos", "_alt", "_rad", "_ang", "_dir"];

	while {!(kobld_safeStart_confirm)} do {
		private _coords = [_pos, _rad, _ang] call BIS_fnc_relPos;
		_coords set [2, _alt];

		kobld_safeStart_camera camPreparePos _coords;
		kobld_safeStart_camera camCommitPrepared 0.5;

		waitUntil {camCommitted kobld_safeStart_camera};

		kobld_safeStart_camera camPreparePos _coords;
		kobld_safeStart_camera camCommitPrepared 0;

		_ang = if (_dir == 0) then {_ang - 0.5} else {_ang + 0.5};
	};
};