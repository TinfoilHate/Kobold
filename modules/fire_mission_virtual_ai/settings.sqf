//Arrays used for preset firemissions, or with the forward observer functions.
//Example: ["BLUFOR",getPos FM1] call tin_fnc_ai_callFires;
//Example: [AI_FO,"REDFOR",5,30,west,500,2,7] spawn tin_fnc_fo_monitor;

//Define AI firemissions below:
tin_var_artyMissionsAI = [	//[name,guns,rounds,magClass,dispersion,reloadTime,delayTime,noAdjustRounds]
	["REDFOR",3,5,"rhs_mag_3vo18_10",400,5,[0.1,0.25],false],
	["BLUFOR",2,10,"rhs_mag_155mm_m795_28",180,8,[0.1,0.25],false]
];