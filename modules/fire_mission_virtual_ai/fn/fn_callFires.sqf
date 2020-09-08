//Find and call mission
//by TinfoilHate

if (isServer) then {
	params ["_name","_centerPos"];

	diag_log format["Firemission: %1 at %2",_name,_centerPos];

	{
		_x params ["_selectedName","_selectedGuns","_selectedRnds","_selectedAmmo","_disp","_reloadTime","_delayTime"];
		
		if (toLower(_name) isEqualTo toLower(_selectedName)) then {
			[_selectedGuns,_selectedRnds,_selectedAmmo,_centerPos,_disp,_reloadTime,_delayTime] spawn tin_fnc_ai_doFires;
		};
	} forEach tin_var_artyMissionsAI;
};