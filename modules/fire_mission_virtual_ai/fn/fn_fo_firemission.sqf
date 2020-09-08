/*
 * Author: TinfoilHate
 * AI Forward Observer script with spawned firemissions
 * Original script by Whollysteve (c.2010), from Nou's FO Script and Blakeace's AI Artillery Framework
 *
 * We usin' the wayback machine, boys
 *
 * Arguments:
 * 0: FO <OBJECT>
 * 1: Firemission Template <STRING>
 * 2: Minutes Between Firemissions <NUMBER>
 * 3: Side to Attack <SIDE>
 * 4: Search Range from FO <NUMBER>
 * 5: Adjustment Rounds <NUMBER>
 * 6: FO Skill (Low 1 > 10 High) <NUMBER>
 *
 * Return Value:
 * Nil
 *
 * Example:
 * [_firemission,_target,_fo,_forceMultiplier,_adjustRounds,_skill] spawn tin_fnc_fo_firemission
 *
 * Public: No
*/

params ["_firemission","_target","_fo","_forceMultiplier","_adjustRounds","_skill"];

private _debugMessages = false;

private _selectedGuns = 0;
private _selectedRnds = 0;
private _selectedAmmo = "";
private _disp = 0;
private _reloadTime = 0;
private _delayTime = 0;
private _prep = false;

private _mrk0 = "";
private _mrk1 = "";
private _mrk2 = "";

//Pull firemission information from array
{
	_x params ["_selectedName"];

	if (toLower(_firemission) isEqualTo toLower(_selectedName)) then {
		_selectedGuns 	= _x # 1;
		_selectedRnds 	= _x # 2;
		_selectedAmmo 	= _x # 3;
		_disp 			= _x # 4;
		_reloadTime 	= _x # 5;
		_delayTime 		= _x # 6;
		_prep			= _x # 7;
	};
} forEach tin_var_artyMissionsAI;

if (_prep) then {
	private _targetPos = getPosATL _target;

	private _adjmax = 300;
	private _adjmin = -300;
	private _error = (10 - _skill) * 10;
	private _adjmult = 10;

	private _Yadj = speed (_target) * cos (direction (_target)) * _adjmult;

	if (_Yadj > _adjmax) then {_Yadj = _adjmax};
	if (_Yadj < _adjmin) then {_Yadj = _adjmin};

	private _Xadj = speed (_target) * sin (direction (_target)) * _adjmult;

	if (_Xadj > _adjmax) then {_Xadj = _adjmax};
	if (_Xadj < _adjmin) then {_Xadj = _adjmin};

	private _impact = [(getPosATL (_target) # 0) + _Xadj + (random _error - _error / 2), (getpos (_target) select 1) + _Yadj+(random _error - _error/2), getpos (_target) select 2];

	private _splashTime = (((10 - _skill) * 2) + 30);
	private _adjustedRnds = _forceMultiplier * _selectedRnds;

	if (_debugMessages) then {
		_mrk0 = createMarker [str(random 100000),_impact];
		_mrk0 setMarkerColor "ColorRed";
		_mrk0 setMarkerShape "ICON";
		_mrk0 setMarkerType "mil_objective";

		systemChat format["%1 firing for effect. %2 guns, %3 rounds per.", _firemission, _selectedGuns, _adjustedRnds];
	};	

	[{ _this spawn tin_fnc_ai_doFires; }, [_selectedGuns,_adjustedRnds,_selectedAmmo,_impact,_disp,_reloadTime,_delayTime], _splashTime] call CBA_fnc_waitAndExecute;

	[{
		params ["_fo","_mrk0","_mrk1","_mrk2"];

		_fo setVariable ["tin_var_ai_fo_ready", true, true];

		deleteMarker _mrk0;
	}, [_fo,_mrk0,_mrk1,_mrk2], _splashTime + 10] call CBA_fnc_waitAndExecute;
} else {
	//Adjust missions
	if (_debugMessages) then { systemChat format["Firing %1 adjustment rounds", _adjustRounds]; };

	while {_adjustRounds > 0} do {

		private _adjustX = ((round (random 50)) + (_adjustRounds * 75));
		private _adjustY = ((round (random 50)) + (_adjustRounds * 75));

		if (round (random 1) isEqualTo 0) then {
			_adjustY = _adjustY * -1;
		};

		if (round (random 1) isEqualTo 0) then {
			_adjustX = _adjustX * -1;
		};

		private _targetPos = getPosASL _target;

		_adjustPoint = [((_targetPos # 0) + _adjustX), ((_targetPos # 1) + _adjustY), _targetPos # 2];

		if (_debugMessages) then {
			_mrk1 = createMarker [str(random 100000),_adjustPoint];
			_mrk1 setMarkerColor "ColorYellow";
			_mrk1 setMarkerShape "ICON";
			_mrk1 setMarkerType "mil_objective";

			systemChat format["Firing adjustment at: %1", _adjustPoint];
		};

		_splashTime = (((10 - _skill) * 2) + 30);
		[{ _this spawn tin_fnc_ai_doFires; }, [1,1,_selectedAmmo,_adjustPoint,_disp,_reloadTime,_delayTime], _splashTime] call CBA_fnc_waitAndExecute;

		_adjustRounds = _adjustRounds - 1;

		sleep _splashTime;
	};

	private _adjmax = 300;
	private _adjmin = -300;
	private _error = (10 - _skill) * 10;
	private _adjmult = 10;

	private _Yadj = speed (_target) * cos (direction (_target)) * _adjmult;

	if (_Yadj > _adjmax) then {_Yadj = _adjmax};
	if (_Yadj < _adjmin) then {_Yadj = _adjmin};

	private _Xadj = speed (_target) * sin (direction (_target)) * _adjmult;

	if (_Xadj > _adjmax) then {_Xadj = _adjmax};
	if (_Xadj < _adjmin) then {_Xadj = _adjmin};

	private _impact = [(getPosATL (_target) # 0) + _Xadj + (random _error - _error / 2), (getpos (_target) select 1) + _Yadj+(random _error - _error/2), getpos (_target) select 2];

	private _splashTime = (((10 - _skill) * 2) + 30);
	private _adjustedRnds = _forceMultiplier * _selectedRnds;

	if (_debugMessages) then {
		_mrk2 = createMarker [str(random 100000),_impact];
		_mrk2 setMarkerColor "ColorRed";
		_mrk2 setMarkerShape "ICON";
		_mrk2 setMarkerType "mil_objective";
		
		systemChat format["Adjustment complete! %1 firing for effect. %2 guns, %3 rounds per.", _firemission, _selectedGuns, _adjustedRnds];
	};	

	[{ _this spawn tin_fnc_ai_doFires; }, [_selectedGuns,_adjustedRnds,_selectedAmmo,_impact,_disp,_reloadTime,_delayTime], _splashTime] call CBA_fnc_waitAndExecute;

	[{
		params ["_fo","_mrk0","_mrk1","_mrk2"];

		_fo setVariable ["tin_var_ai_fo_ready", true, true];

		deleteMarker _mrk1;
		deleteMarker _mrk2;
	}, [_fo,_mrk0,_mrk1,_mrk2], _splashTime + 10] call CBA_fnc_waitAndExecute;
};