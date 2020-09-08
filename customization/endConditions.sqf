_westCasualty = "US ARMY" call FNC_CasualtyPercentage;

//Loss Conditions
if (_westCasualty >= 80) then {REDFOR_obj1Flag = true};
if (CBA_missionTime > kobld_timeLimit) then {kobld_timeOut = true; REDFOR_obj1Flag = true;};

if ( ((BLUFOR_obj1Flag && BLUFOR_obj2Flag) || REDFOR_obj1Flag || kobld_timeOut) && kobld_endingAllowed) exitWith {
	[{
		_bluFinalCount = (west countSide allUnits);
		_bluObjValue1 = _bluFinalCount;

		if (BLUFOR_onObjective) then {
			_bluObjValue1 = (_bluFinalCount + 10);
		};

		_bluCasCount = "US ARMY" call FNC_casualtyCount;
		_bluVehTotal = "US ARMY" call FNC_getDamagedAssets;
		_bluVehCount = (count (_bluVehTotal select 0)) + (count (_bluVehTotal select 1));

		_bluCasMod = -1;
		_bluVehCasMod = -5.0;
		_bluLoss  = _bluFinalCount * 0.375;
		_bluMinor = _bluFinalCount * 0.5;
		_bluMajor = _bluFinalCount * 0.75;
		_bluTotal = _bluFinalCount * 0.9;

		_bluScore = ((1 * _bluObjValue1)) + ((_bluCasCount * _bluCasMod) + (_bluVehCount * _bluVehCasMod));
		_bluWinMsg = "BLUFOR ";

		switch (true) do {
			case (_bluScore <= _bluLoss): { _bluWinMsg = _bluWinMsg + "Defeat"; };
			case ((_bluScore > _bluLoss) && (_bluScore < _bluMinor)): { _mag = "Slight"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
			case ((_bluScore >= _bluMinor) && (_bluScore < _bluMajor)): { _mag = "Minor"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
			case ((_bluScore >= _bluMajor) && (_bluScore < _bluTotal)): { _mag = "Major"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
			case (_bluScore >= _bluTotal): { _mag = "Total"; _bluWinMsg = _bluWinMsg + _mag + " Victory"; };
		};

		if (kobld_timeOut) then {
			("TIME LIMIT REACHED<br/>" + _bluWinMsg) call FNC_EndMission;
		} else {
			("" + _bluWinMsg) call FNC_EndMission;
		};
	},[],15] call CBA_fnc_waitAndExecute;
};

sleep (10);