
_westCasualty = "WEST SIDE" call FNC_CasualtyPercentage;
_eastCasualty = "EAST SIDE" call FNC_CasualtyPercentage;

//Loss Conditions
if (_westCasualty >= 80) then {REDFOR_obj1Flag = true};
if (_eastCasualty >= 80) then {BLUFOR_obj1Flag = true};

if (time > 3600) then {BLUFOR_obj1Flag = true};

if ( BLUFOR_obj1Flag ) exitWith {
	[{
		_bluObjValue1 = 20;
		_redObjValue1 = 20;

		if (BLUFOR_obj1Flag) then {_bluObjValue1 = 10};
		if (REDFOR_obj1Flag) then {_redObjValue1 = 10};

		_bluCasCount = "WEST SIDE" call FNC_casualtyCount;
		_bluVehTotal = "WEST SIDE" call FNC_getDamagedAssets;
		_bluVehCount = (count (_bluVehTotal select 0)) + (count (_bluVehTotal select 1));

		_bluCasMod = -1;
		_bluVehCasMod = -2.0;
		_bluLoss  = 10;
		_bluMinor = 13;
		_bluMajor = 17;
		_bluTotal = 20;

		_bluScore = ((1 * _bluObjValue1)) + ((_bluCasCount * _bluCasMod) + (_bluVehCount * _bluVehCasMod));
		_bluWinMsg = "BLUFOR ";

		switch (true) do {
			case (_bluScore <= _bluLoss): { _bluWinMsg = _bluWinMsg + "Defeat"; };
			case ((_bluScore > _bluLoss) && (_bluScore < _bluMinor)): { _mag = "Slight"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
			case ((_bluScore >= _bluMinor) && (_bluScore < _bluMajor)): { _mag = "Minor"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
			case ((_bluScore >= _bluMajor) && (_bluScore < _bluTotal)): { _mag = "Major"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
			case (_bluScore >= _bluTotal): { _mag = "Total"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
		};

		_redCasCount = "EAST SIDE" call FNC_casualtyCount;
		_redVehTotal = "EAST SIDE" call FNC_getDamagedAssets;
		_redVehCount = (count (_redVehTotal select 0)) + (count (_redVehTotal select 1));

		_redCasMod = -1;
		_redVehCasMod = -0.0;
		_redLoss  = 6;
		_redMinor = 8;
		_redMajor = 10;
		_redTotal = 12;

		_redScore = ((1 * _redObjValue1)) + ((_redCasCount * _redCasMod) + (_redVehCount * _redVehCasMod));
		_redWinMsg = "REDFOR ";

		switch (true) do {
			case (_redScore <= _redLoss): { _redWinMsg = _redWinMsg + "Defeat"; };
			case ((_redScore > _redLoss) && (_redScore < _redMinor)): { _mag = "Slight"; _redWinMsg = _redWinMsg + _mag + " Victory"; };
			case ((_redScore >= _redMinor) && (_redScore < _redMajor)): { _mag = "Minor"; _redWinMsg = _redWinMsg + _mag + " Victory"; };
			case ((_redScore >= _redMajor) && (_redScore < _redTotal)): { _mag = "Major"; _redWinMsg = _redWinMsg + _mag + " Victory"; };
			case (_redScore >= _redTotal): { _mag = "Total"; _redWinMsg = _redWinMsg + _mag + " Victory"; };
		};

		("" + _bluWinMsg + "<br />" + _redWinMsg) call FNC_EndMission;
	},[],10] call CBA_fnc_waitAndExecute;
};

sleep (10);