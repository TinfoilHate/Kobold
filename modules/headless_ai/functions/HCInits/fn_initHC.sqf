if (!(FW_var_isHC)) exitWith {};
setViewDistance HC_viewdistance;
setTerrainGrid 50;
if (!isNil "HC_ForceTime") then {
	[] spawn {
		waituntil {time > 1};
		_HC_date = date;
		_HC_forcedate = [_HC_date select 0, _HC_date select 1, _HC_date select 2, HC_ForceTime select 0, HC_ForceTime select 1];
		while {true} do {
			sleep 0.1;
			setdate _HC_forcedate;
		};
	};
};