//Fire that mission
//by TinfoilHate

params ["_selectedGuns","_selectedRnds","_selectedAmmo","_target","_disp","_reloadTime","_delayTime"];

private _ammoClass = getText (configFile >> "CfgMagazines" >> _selectedAmmo >> "ammo");	//Pulls ammo from magazine type
private _rounds = 0;

while {_rounds < _selectedRnds} do {
	for "_i" from 1 to _selectedGuns do {
		private _fireTarget = [_target, _disp] call CBA_fnc_randPos;

		private _random = random 1;
		if (_random >= 0.2 && _random < 0.5) then {
			_fireTarget = [_target, (_disp * .5)] call CBA_fnc_randPos;
		};
		if (_random >= 0.5 && _random < 0.75) then {
			_fireTarget = [_target, (_disp * .25)] call CBA_fnc_randPos;
		};
		if (_random >= 0.75) then {
			_fireTarget = [_target, (_disp * .125)] call CBA_fnc_randPos;
		};

		private _newDelayTime = 0;
		if (_delayTime isEqualType []) then {
			_newDelayTime = (_delayTime # 0 + (random ((_delayTime # 1) - (_delayTime # 0)) ));
		};
		sleep _newDelayTime;

		private _mortarStrike = _ammoClass createVehicle [_fireTarget # 0,_fireTarget # 1,450];
		_mortarStrike setVelocity [0, 0, -225];
	};

	_rounds = _rounds + 1;

	sleep _reloadTime;
};