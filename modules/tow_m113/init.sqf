//Author:		TinfoilHate

["TOW M113", "Attaches a TOW launcher to an M113, and adds some EH action for seating.", "TinfoilHate"] call FNC_RegisterModule;

#include "settings.sqf"

FW_TOW_CURRENTVEH = [];

FN_TOW_GETLAUNCHER = {
	params ["_unit"];

	_ret = _unit getVariable "FW_TOW_LAUNCHER";

	_ret
};

FN_TOW_MOVETOLAUNCHER = {
	params ["_unit","_veh"];

	_unit moveInAny ([_veh] call FN_TOW_GETLAUNCHER);

	_class = "B_Soldier_F";
	if (side _placeholder == EAST) then {
		_class = "O_Soldier_F";
	};
	if (side _placeholder == INDEPENDENT) then {
		_class = "I_Soldier_F";
	};

	_placeholder = FN_TOW_PLACEHOLDER_GROUP createUnit [_class,[0,0,0], [], 0, "CAN_COLLIDE"];
	[_placeholder,true] remoteExec ["hideObject", 0, true];

	removeAllWeapons _placeholder;
	removeUniform _placeholder;
	removeVest _placeholder;
	removeHeadgear _placeholder;
	removeGoggles _placeholder;

	_placeholder moveInGunner _veh;

	doStop _placeholder;

	_unit addAction ["Move to Cargo", {
		params ["_target", "_caller", "_actionId", "_args"];
		_args params ["_veh","_placeholder"];

		deleteVehicle _placeholder;
		_caller setPosATL [0,0,0];
		[{
			params ["_target", "_caller", "_actionId", "_args"];
			_args params ["_veh","_placeholder"];

			_caller moveInCargo _veh;
			_caller removeAction _actionID;

		}, _this, 0] call CBA_fnc_waitAndExecute;
	},[_veh,_placeholder]];
};

if (isServer) then {
	{
		_newLauncher = "RHS_TOW_TriPod_WD" createVehicle [0,0,0];

		_x setVariable ["FW_TOW_LAUNCHER",_newLauncher,true];

		_newLauncher attachTo [_x,[0.7,0.6,-0.2]];
		_newLauncher enableWeaponDisassembly false;
		[_newLauncher, -1] call ace_cargo_fnc_setSize;

		_x addMPEventHandler ["MPKilled", {
			if (isServer) then {
				params ["_veh"];

				([_veh] call FN_TOW_GETLAUNCHER) setDamage 1;
			};
		}];

		_x removeWeaponTurret ["rhs_weap_smokegen",[-1]];
		_x addMagazineTurret ["rhsusf_mag_L8A3_8",[-1]];
		_x addMagazineTurret ["rhsusf_mag_L8A3_8",[-1]];
		_x addMagazineTurret ["rhsusf_mag_L8A3_8",[-1]];
		_x addWeaponTurret ["rhsusf_weap_M259",[-1]];

		{_newLauncher removeMagazine _x} forEach (magazines _newLauncher);
		{_newLauncher addMagazine [_x,1]} forEach FW_TOW_AMMO;

		[_newLauncher,2] remoteExec ["lock"];
		[_newLauncher,false] remoteExec ["enableWeaponDisassembly"];
		[_newLauncher,FW_TOW_DISABLE_THERMALS] remoteExec ["disableTIEquipment"];
		[_newLauncher, -1] call ace_cargo_fnc_setSize;
	} forEach FW_TOW_M113;

	FN_TOW_PLACEHOLDER_GROUP = createGroup [civilian,false];
};

player addEventHandler ["GetInMan",{
	params ["_unit","_role","_veh"];

	if (_veh in FW_TOW_M113) then {
		if (_role == "gunner") then {
			[_unit,_veh] call FN_TOW_MOVETOLAUNCHER;
		};
	};
}];

player addEventHandler ["SeatSwitchedMan",{
	params ["_unit","_role","_veh"];
	_pos = assignedVehicleRole _unit;

	if (_veh in FW_TOW_M113) then {
		if (_pos # 0 == "Turret") then {
			[_unit,_veh] call FN_TOW_MOVETOLAUNCHER;
		};
	};
}];