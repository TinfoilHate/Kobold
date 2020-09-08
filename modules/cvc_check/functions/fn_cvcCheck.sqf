/*
 * Author: TinfoilHate
 * Dynamically adds a specified CVC to a unit in vehicle crew positions.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: CVC Class <CLASS>
 *
 * Return Value:
 * Nil
 *
 * Example:
 * [player, "rhs_tsh4"] call kobld_cvc_check_fnc_cvcCheck
 *
 * Public: No
*/

	params ["_unit","_cvcType"];

	private _veh = vehicle _unit;

	_unit setVariable ["FW_CVCTYPE", _cvcType];
	_unit setVariable ["FW_HATTYPE", headgear _unit];

	if ([_unit,_veh] call kobld_cvc_check_fnc_vehCheck) then {
		if (headgear _unit != _cvcType) then {
			_unit setVariable ["FW_HATTYPE", headgear _unit];
			_unit addHeadgear _cvcType;
		};
	};

	_unit addEventHandler ["GetInMan",{
		private _unit = _this # 0;
		private _pos = assignedVehicleRole _unit;
		private _veh = _this # 2;
		private _cvcType = _unit getVariable "FW_CVCTYPE";
		private _hatType = _unit setVariable ["FW_HATTYPE", headgear _unit];

		if ([_unit,_veh] call kobld_cvc_check_fnc_vehCheck) then {
			if (headgear _unit != _cvcType) then {
				_unit setVariable ["FW_HATTYPE", headgear _unit];
				_unit addHeadgear _cvcType;
			};
		} else {
			if (_hatType == "") then {removeHeadgear _unit} else {_unit addHeadgear _hatType};
		};
	}];

	_unit addEventHandler ["GetOutMan",{
		private _unit = _this # 0;
		private _pos = assignedVehicleRole _unit;
		private _veh = _this # 2;
		private _cvcType = _unit getVariable "FW_CVCTYPE";
		private _hatType = _unit getVariable "FW_HATTYPE";

		if ([_unit,_veh] call kobld_cvc_check_fnc_vehCheck) then {
			if (_hatType == "") then {removeHeadgear _unit} else {_unit addHeadgear _hatType};
		};
	}];

	_unit addEventHandler ["SeatSwitchedMan",{
		private _unit = _this # 0;
		private _pos = assignedVehicleRole _unit;
		private _veh = _this # 2;
		private _cvcType = _unit getVariable "FW_CVCTYPE";
		private _hatType = _unit getVariable "FW_HATTYPE";

		if ([_unit,_veh] call kobld_cvc_check_fnc_vehCheck) then {
			if (headgear _unit != _cvcType) then {
				_unit setVariable ["FW_HATTYPE", headgear _unit];
				_unit addHeadgear _cvcType;
			};
		} else {
			if (_hatType == "") then {removeHeadgear _unit} else {_unit addHeadgear _hatType};
		};
	}];