params ["_unit"];
waituntil {!isNil "HC_customskill"};

if (_unit getvariable ["ManualSkill",false]) exitwith {};

//Set custom skills set in settings.sqf
if (HC_customskill) then {
	_unit setSkill ["aimingspeed", HC_aimingspeed];
	_unit setSkill ["spotdistance", HC_spotdistance];
	_unit setSkill ["aimingaccuracy", HC_aimingaccuracy];
	_unit setSkill ["aimingshake", HC_aimingshake];
	_unit setSkill ["spottime", HC_spottime];
	_unit setSkill ["reloadspeed", HC_reloadspeed];
	_unit setSkill ["endurance", HC_endurance];
	_unit setSkill ["commanding", HC_commanding];
	_unit setSkill ["general", HC_general];
	_unit setSkill ["courage", HC_courage];
};