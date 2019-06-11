//[this, "CAD_PLT_1IC"] call FNC_GearScript;

#define package "CAD_"

SET_GROUP(uniform)
	["deth_can_uni_green"] call FNC_AddItem;
	["deth_can_helmet_green"] call FNC_AddItem;	//ADD CLOSED EH FOR RADIO HATS
END_GROUP;

SET_GROUP(IFAK)
	["ACE_fieldDressing", 2, "uniform"] call FNC_AddItem;
	["ACE_elasticBandage", 2, "uniform"] call FNC_AddItem;
	["ACE_quikclot", 2, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 2, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 2, "uniform"] call FNC_AddItem;
END_GROUP;

SET_GROUP(items)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
END_GROUP;

SET_GROUP(medic)
	["B_Kitbag_cbr"] call FNC_AddItem;
	["ACE_surgicalKit",1,"backpack"] call FNC_AddItem;
	["ACE_atropine",2,"backpack"] call FNC_AddItem;
	["ACE_fieldDressing",10,"backpack"] call FNC_AddItem;
	["ACE_elasticBandage",10,"backpack"] call FNC_AddItem;
	["ACE_tourniquet",20,"backpack"] call FNC_AddItem;
	["ACE_quikclot", 20, "backpack"] call FNC_AddItem;
	["ACE_packingBandage",10,"backpack"] call FNC_AddItem;
	["ACE_morphine",10,"backpack"] call FNC_AddItem;
	["ACE_epinephrine",10,"backpack"] call FNC_AddItem;
	["ACE_adenosine",2,"backpack"] call FNC_AddItem;
	["ACE_salineIV_250",6,"backpack"] call FNC_AddItem;
	["ACE_salineIV_500",4,"backpack"] call FNC_AddItem;
END_GROUP;

SET_GROUP(radio)
	["B_Kitbag_cbr"] call FNC_AddItem;
	["ACRE_PRC117F",1,"backpack"] call FNC_AddItem;
END_GROUP;

SET_GROUP(ruck)
	["B_AssaultPack_cbr"] call FNC_AddItem;
END_GROUP;

SET_GROUP(ruckL)
	["B_Kitbag_cbr"] call FNC_AddItem;
END_GROUP;

SET_GROUP(ruckItems)
	["skn_m04_gas_mask_blk",1,"backpack"] call FNC_AddItem;

	_hour = date # 3;	//[year,month,day,hour,minute]
	_lite = (date call BIS_fnc_sunriseSunsetTime) # 0;
	_dark = (date call BIS_fnc_sunriseSunsetTime) # 1;

	if (_hour < (_lite) || (_hour + 1) > _dark) then {
		["rhsusf_ANPVS_14"] call FNC_AddItem;
	} else {
		["rhsusf_ANPVS_14",1,"backpack"] call FNC_AddItem;
	};

	["ACE_CableTie",2,"backpack"] call FNC_AddItem;
	["FlareWhite_F",2,"backpack"] call FNC_AddItem;
END_GROUP;


case (package + "PLT_1IC"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["ACRE_PRC152"] call FNC_AddItem;
	["ACRE_PRC343"] call FNC_AddItem;

	["rhsusf_bino_m24_ARD"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_an_m8hc",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_red",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_green",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_yellow",1,"vest"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",2,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",2,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiBlue",2,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiYellow",2,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "PLT_2IC"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["ACRE_PRC152"] call FNC_AddItem;
	["ACRE_PRC343"] call FNC_AddItem;

	["rhsusf_bino_m24_ARD"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_an_m8hc",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_red",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_green",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_yellow",1,"vest"] call FNC_AddItem;

	["rhs_mag_maaws_HEDP",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",1,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "PLT_MEDIC"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(medic);
	ADD_GROUP(ruckItems);

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;

	[{CBA_missionTime > 1}, {_this setVariable ["ace_medical_medicClass",2,true]}, _unit] call CBA_fnc_waitUntilAndExecute;
};

case (package + "PLT_SIG"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(radio);
	ADD_GROUP(ruckItems);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "SEC_1IC"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["ACRE_PRC152"] call FNC_AddItem;
	["ACRE_PRC343"] call FNC_AddItem;

	["rhsusf_bino_m24_ARD"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_an_m8hc",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_red",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_green",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_yellow",1,"vest"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",1,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "SEC_2IC"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["ACRE_PRC343"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_an_m8hc",1,"vest"] call FNC_AddItem;

	["rhsusf_200rnd_556x45_M855_mixed_box",1,"backpack"] call FNC_AddItem;
	["rhsusf_100Rnd_762x51",1,"backpack"] call FNC_AddItem;
	["ACE_Wirecutter",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",1,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "SEC_GL"): {
	["rhsusf_mbav_grenadier"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_M433_HEDP",6,"vest"] call FNC_AddItem;

	["rhs_mag_M433_HEDP",18,"backpack"] call FNC_AddItem;
	["rhs_mag_m713_Red",4,"backpack"] call FNC_AddItem;

	["ACE_40mm_Flare_white",2,"backpack"] call FNC_AddItem;
	["ACE_40mm_Flare_green",1,"backpack"] call FNC_AddItem;
	["ACE_40mm_Flare_red",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_c7_m203","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "SEC_LMG"): {
	["rhsusf_mbav_mg"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	[_unit,_type,["rhs_weap_m249","rhsusf_200rnd_556x45_M855_mixed_box"],"vest",2] call FNC_wephelper;
	[_unit,_type,["rhsusf_200rnd_556x45_M855_mixed_box"],"backpack",2] call FNC_maghelper;
};

case (package + "SEC_R"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhsusf_200rnd_556x45_M855_mixed_box",1,"backpack"] call FNC_AddItem;
	["rhs_mag_maaws_HEAT",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "WEP_1IC"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["ACRE_PRC152"] call FNC_AddItem;
	["ACRE_PRC343"] call FNC_AddItem;

	["rhsusf_bino_m24_ARD"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_an_m8hc",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_red",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_green",1,"vest"] call FNC_AddItem;
	["rhs_mag_m18_yellow",1,"vest"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",1,"backpack"] call FNC_AddItem;
	["rhs_mag_maaws_HEDP",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",1,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "WEP_2IC"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["ACRE_PRC343"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_an_m8hc",1,"vest"] call FNC_AddItem;

	["rhs_mag_maaws_HEAT",1,"backpack"] call FNC_AddItem;
	["rhsusf_100Rnd_762x51",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",1,"backpack"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "WEP_MMG"): {
	["rhsusf_mbav_mg"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	[_unit,_type,["rhs_weap_m240G","rhsusf_100Rnd_762x51"],"vest",2] call FNC_wephelper;
};

case (package + "WEP_MMG_AG"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);
	ADD_GROUP(ruckItems);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",4,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "WEP_MAT"): {
	["rhsusf_mbav_rifleman"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruckL);
	ADD_GROUP(ruckItems);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_weap_maaws"] call FNC_AddItem;
	["rhs_mag_maaws_HEAT",1,"backpack"] call FNC_AddItem;
	["rhs_mag_maaws_HEDP",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_m16a2","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};

case (package + "WEP_MAT_AG"): {
	["rhsusf_mbav_grenadier"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruckL);
	ADD_GROUP(ruckItems);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_mag_M433_HEDP",4,"vest"] call FNC_AddItem;
	["rhs_mag_m713_Red",2,"vest"] call FNC_AddItem;

	["rhs_mag_maaws_HEAT",1,"backpack"] call FNC_AddItem;
	["rhs_mag_maaws_HEDP",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["tin_weap_c7_m203","rhs_mag_30Rnd_556x45_M855_Stanag"],"vest",8] call FNC_wephelper;
};