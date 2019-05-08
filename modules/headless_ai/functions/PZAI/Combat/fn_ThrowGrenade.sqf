private ["_Unit", "_RandomChance", "_myNearestEnemy", "_PZAI_GRENADETHROWN", "_CheckDistance", "_DirectionSet", "_Directionset"];

_Unit = _this select 0;
_PZAI_GRENADETHROWN = _this select 1;

_RandomChance = (round (random 100));

if (_RandomChance < PZAI_GRENADECHANCE) then 
{

if (isNil "_Unit" || {isNull _Unit}) exitWith {};

		//systemchat format ["K %1",_Array1];	
_myNearestEnemy = _Unit call PZAI_fnc_ClosestEnemy;
if (isNil "_myNearestEnemy") exitWith {};
if (typeName _myNearestEnemy isEqualTo "ARRAY") exitWith {};

if !(_PZAI_GRENADETHROWN) then
{

_CheckDistance = (_Unit distance _myNearestEnemy);
_cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _myNearestEnemy];

if (_cansee > 0.5) then 
{
	
	
	
	if (_CheckDistance < 60 && {_CheckDistance > 6}) then 
	{
	
		_DirectionSet = [_Unit,_myNearestEnemy] call BIS_fnc_dirTo;
		_Unit setDir _Directionset;

		_Unit forceWeaponFire ["HandGrenadeMuzzle","HandGrenadeMuzzle"];
		_Unit forceWeaponFire ["MiniGrenadeMuzzle","MiniGrenadeMuzzle"];

	};
};


if (_CheckDistance < 5000) then 
{
		if (PZAI_USESMOKE) then 
		{
		
	
			_DirectionSet = [_Unit, _myNearestEnemy] call BIS_fnc_dirTo;
		
			_Unit setDir _Directionset;
		
			_Unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
		};

};

};

};