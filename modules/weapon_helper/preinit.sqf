["weapon_helper", "Assists with gear randomization.", "TinfoilHate"] call FNC_RegisterModule;

#include "settings.sqf"

FNC_wephelper = {
	params ["_unit","_type","_inputArray",["_location", ""],"_max"];

	private _accList = [];
	private _weaponList = [];
	private _magazineList = [];

	// Sort the jumbled mass of organizational failure that is the _inputArray
	{
		if ("ItemCore" in ([(configFile >> "CfgWeapons" >> _x),true] call BIS_fnc_returnParents)) then {
			_accList pushBack toLower(_x);
		};

		if (isClass (configFile >> "CfgWeapons" >> _x) && !(_x in _accList)) then {
			_weaponList pushBack toLower(_x);
		};

		if (isClass (configFile >> "CfgMagazines" >> _x)) then {
			_magazineList pushBack toLower(_x);
		};
	} forEach _inputArray;

	_newWeapon = selectRandom _weaponList;
	_newMagList = [];
	{
		//I hate this, a lot
		_tempMagArray = [];
		{	
			_tempMagArray pushBack toLower(_x);
		} foreach (getArray (configFile >> "CfgWeapons" >> _newWeapon >> "magazines"));

		if (_x in _tempMagArray) then {
			_newMaglist pushBack _x;
		};
	} forEach _magazineList;

	_newAccListOptic = [];
	_newAccListMuzzle = [];
	_newAccListPointer = [];
	_newAccListBipod = [];
	{
		switch true do {
			case (_x in ([_newWeapon, "optic"] call CBA_fnc_compatibleItems) && (random 1 < fw_weaponhelper_opticChance)): {_newAccListOptic pushBack _x};
			case (_x in ([_newWeapon, "muzzle"] call CBA_fnc_compatibleItems) && (random 1 < fw_weaponhelper_muzzleChance)): {_newAccListMuzzle pushBack _x};
			case (_x in ([_newWeapon, "pointer"] call CBA_fnc_compatibleItems) && (random 1 < fw_weaponhelper_pointerChance)): {_newAccListPointer pushBack _x};
			case (_x in ([_newWeapon, "bipod"] call CBA_fnc_compatibleItems) && (random 1 < fw_weaponhelper_bipodChance)): {_newAccListBipod pushBack _x};
		};
	} forEach _accList;

	[_newWeapon] call FNC_AddItem;
	if (count _newAccListOptic > 0) then {[(selectRandom _newAccListOptic)] call FNC_AddItem;};
	if (count _newAccListMuzzle > 0) then {[(selectRandom _newAccListMuzzle)] call FNC_AddItem;};
	if (count _newAccListPointer > 0) then {[(selectRandom _newAccListPointer)] call FNC_AddItem;};
	if (count _newAccListBipod > 0) then {[(selectRandom _newAccListBipod)] call FNC_AddItem;};

	if (count _newMagList > 0) then {
		[_unit,_type,_newMagList,_location,_max] call FNC_maghelper;
	} else {
		[_unit,_type,_newWeapon,_location,_max] call FNC_maghelper;
	};
};

FNC_maghelper = {
	params ["_unit","_type","_magazine","_location","_max"];

	private _uniform = uniform _unit;
	private _vest = vest _unit;
	private _backpack = backpack _unit;
	private _newMag = "";

	if (typeName _magazine == "STRING") then {
		_magazine = [_magazine];
	};

	if (isClass (configFile >> "CfgWeapons" >> (_magazine # 0))) then {
		_magazine = getArray (configFile >> "CfgWeapons" >> (_magazine # 0) >> "magazines");
	};

	if (_uniform != "") then {
		if (_location == "uniform" || _location == "") then {
			_u = 0;
			while {_newMag = selectRandom _magazine; _unit canAddItemToUniform _newMag} do {
				if (_u >= _max) exitWith {};

				[_newMag,1,"uniform"] call FNC_AddItem;

				_u = _u + 1;
			};
		};
	};

	if (_vest != "") then {
		if (_location == "vest" || _location == "") then {
			_v = 0;
			while {_newMag = selectRandom _magazine; _unit canAddItemToVest _newMag} do {
				if (_v >= _max) exitWith {};

				[_newMag,1,"vest"] call FNC_AddItem;

				_v = _v + 1;
			};
		};
	};

	if (_backpack != "") then {
		if (_location == "backpack" || _location == "") then {
			_b = 0;
			while {_newMag = selectRandom _magazine; _unit canAddItemToBackpack _newMag} do {
				if (_b >= _max) exitWith {};

				[_newMag,1,"backpack"] call FNC_AddItem;

				_b = _b + 1;
			};
		};
	};

	_unit addPrimaryWeaponItem (selectRandom _magazine);
	_unit addHandgunItem (selectRandom _magazine);
};