params ["_GroupUnits","_Group"];

{
	[_x] joinSilent _group;
	_x setVariable ["PZAI_LOITERING",false];
	if (_x isEqualTo (leader _x)) then
	{
		_x setVariable ["PZAI_FLANKING",false,false];
	};
	_x setVariable ["PZAI_MovedRecently",false,false];	
} foreach _GroupUnits;

_Group setvariable ["PZAI_Mission","DEFEND"];