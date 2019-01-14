
["tin_var_artyObservers",[	//[OBJECT,"STRING",side]
	//[OBS1,"BOCA",west]
]] call tin_fnc_publicVariable;

["tin_var_artyFreq_west",1] call tin_fnc_publicVariable;
["tin_var_artyFreq_east",1] call tin_fnc_publicVariable;
["tin_var_artyFreq_independent",1] call tin_fnc_publicVariable;
["tin_var_artyFreq_civilian",1] call tin_fnc_publicVariable;

["tin_var_artyBatteries", [	//[[name,ready,[ammoClass,quantity],guns,dispersion,reloadTime,calcTime,flightTime,delayTime,side] - delayTime and calcTime can be an array [min,max]
	["ARCHER",true,[
		["Redd_8Rnd_120mm_Mo_shells",96],
		["Redd_8Rnd_120mm_Mo_annz_shells",24],
		["Redd_8Rnd_120mm_Mo_Flare_white",24]
	],4,272,8,60,30,[0.1,1.0],west],	//138 @ 7200m
	["BRISTOL",true,[
		["RHS_mag_m1_he_12",144],
		["rhs_mag_m314_ilum_4",12],
		["rhs_mag_m60a2_smoke_4",24]
	],4,100,8,60,30,[0.1,1.0],west],	//50 @ MAX
	["CHIMAY",true,[
		["rhs_12Rnd_m821_HE",48]
	],4,100,8,60,30,[0.1,1.0],independent],
	["STEEL RAIN",true,[
		["rhs_12Rnd_m821_HE",48]
	],4,100,8,60,30,[0.1,1.0],east]
]] call tin_fnc_publicVariable;

["tin_var_fireMissions_west",[	//["NAME",fired,["_obs","_bat","_selectedAmmo","_selectedGrid","_selectedMils","_selectedDist","_selectedRnds","_guns","_disp","_reloadTime","_calcTime","_flightTime","_delayTime","_side"]]
	["AF0001",false,[OBS1,"ARCHER","rhs_12Rnd_m821_HE","000000",0,400,4,4,50,3,45,30,[0.1,0.8],WEST]],
	["AF0002",false,[OBS1,"BRISTOL","RHS_mag_m1_he_12","000000",0,500,4,8,75,8,45,30,[0.1,0.8],WEST]]
]] call tin_fnc_publicVariable;

["tin_var_fireMissions_east",[

]] call tin_fnc_publicVariable;

["tin_var_fireMissions_independent",[
	["AF0001",false,[OBS1,"CHIMAY","RHS_mag_m1_he_12","000000",0,500,4,8,75,8,45,30,[0.1,0.8],INDEPENDENT]]
]] call tin_fnc_publicVariable;

["tin_var_fireMissions_civilian",[

]] call tin_fnc_publicVariable;