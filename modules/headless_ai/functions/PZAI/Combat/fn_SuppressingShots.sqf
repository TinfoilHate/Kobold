private ["_unit", "_bullet", "_TimeShot","_FrameRateCheck", "_Unit", "_Array2", "_Point", "_ArrayCheck", "_UnitGroup", "_CheckVariable1", "_CheckDistance"];
//An extra layer of suppression that will hopefully make AI go for cover better...
//If framerate is below 20 - exit this script.
_FrameRateCheck = diag_fps;
if (_FrameRateCheck <= PZAI_FPSFreeze) exitWith {};

_unit = (_this select 0) select 0;

if (PZAI_CurrentlySuppressing < PZAI_CurrentlySuppressingLimit) then
{
	PZAI_CurrentlySuppressing = PZAI_CurrentlySuppressing + 1;
	_TimeShot = _unit getVariable "PZAI_FiredTime";
	if ((diag_tickTime - _TimeShot) > 25) then 
	{
		

	
		
		_unit setVariable ["PZAI_FiredTime",diag_tickTime,true];
		
		_pos = cursorTarget;
		if (isNull _pos) then 
		{
			if (isPlayer _Unit) then 
			{
				//Remember, screenToWorld is using UI coordinates! 
				_pos = screenToWorld [0.5,0.5];
			}
			else
			{
				_pos = assignedTarget _Unit;
				if (isNull _pos) then {_pos = getPosATL _Unit};
			};
		}
		else
		{
			_pos = getPosATL _pos;
		};
		
		_Point = _Unit call PZAI_fnc_ClosestEnemy;
		if (_Point isEqualTo [] || {isNil "_Point"}) exitWith {};
		
		_ArrayCheck = typeName _Point;
		if (_ArrayCheck isEqualTo "ARRAY") exitWith {};
	
		_UnitGroup = group _Point;
		
		
		{
				_CheckDistance = (_pos distance _x);
				_Kn = _unit knowsAbout _x;
				if (_CheckDistance < 4 && (_Kn > 3.5)) then 
				{
					if (PZAI_Suppression) then
					{
						if (isPlayer _x) then {remoteExec ["PSup",_x];}
						else
						{
							_x setCustomAimCoef PZAI_SuppressionVar;
							_x spawn {sleep 8; _this setCustomAimCoef 1;};
						};
					};
					if (PZAI_Adrenaline) then
					{
						_x setAnimSpeedCoef PZAI_AdrenalineVar;
						_x spawn {sleep 8; _this setAnimSpeedCoef 1;};
					};
					if (PZAI_AIDEBUG isEqualTo 1) then
					{
						[_x,"I am suppressed!",30,20000] remoteExec ["3DText",0];
					};		
					
				};		
		} forEach units _UnitGroup;
		
	
		
	};
	PZAI_CurrentlySuppressing = PZAI_CurrentlySuppressing - 1;
};