//[this, "USARMY_PLT_1IC"] call FNC_GearScript;

#define package "USARMY_"

SET_GROUP(uniform)
	["U_Simc_TCU_mk3_poplijn"] call FNC_AddItem;
	["H_Simc_M1_erdl_op","H_Simc_M1_erdl_up"] call FNC_AddItemRandom;
END_GROUP;

SET_GROUP(uniformAir)
	["U_Simc_TCU_mk3_poplijn"] call FNC_AddItem;
	["UK3CB_BAF_H_Earphone"] call FNC_AddItem;
END_GROUP;

SET_GROUP(IFAK)
	["ACE_fieldDressing", 2, "uniform"] call FNC_AddItem;
	["ACE_elasticBandage", 6, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 2, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 2, "uniform"] call FNC_AddItem;
	["ACE_splint", 1, "uniform"] call FNC_AddItem;
END_GROUP;

SET_GROUP(items)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;

	_hour = date # 3;	//[year,month,day,hour,minute]
	_lite = (date call BIS_fnc_sunriseSunsetTime) # 0;
	_dark = (date call BIS_fnc_sunriseSunsetTime) # 1;

	if (_hour < (_lite) || (_hour + 1) > _dark) then {
		["ACE_Flashlight_MX991"] call FNC_AddItem;
		["FlareWhite_F",2] call FNC_AddItem;
	} else {
		//BLANK
	};
END_GROUP;

SET_GROUP(medic)
	["usm_pack_m5_medic"] call FNC_AddItem;
	["ACE_surgicalKit",1,"backpack"] call FNC_AddItem;
	["ACE_atropine",2,"vest"] call FNC_AddItem;
	["ACE_fieldDressing",10,"backpack"] call FNC_AddItem;
	["ACE_elasticBandage",30,"backpack"] call FNC_AddItem;
	["ACE_tourniquet",8,"backpack"] call FNC_AddItem;
	["ACE_splint", 10, "backpack"] call FNC_AddItem;
	["ACE_packingBandage",10,"backpack"] call FNC_AddItem;
	["ACE_morphine",10,"backpack"] call FNC_AddItem;
	["ACE_epinephrine",2,"vest"] call FNC_AddItem;
	["ACE_adenosine",10,"backpack"] call FNC_AddItem;
	["ACE_salineIV_250",6,"backpack"] call FNC_AddItem;
	["ACE_salineIV_500",4,"backpack"] call FNC_AddItem;
END_GROUP;

SET_GROUP(radio)
	["B_simc_rajio_flak_M43_2"] call FNC_AddItem;
	["ACRE_PRC117F",1,"backpack"] call FNC_AddItem;
END_GROUP;

SET_GROUP(ruck)
	["B_simc_pack_frem_flak_1_alt","B_simc_pack_frem_flak_2","B_simc_pack_frem_flak_3","B_simc_pack_frem_flak_3_b","B_simc_pack_frem_flak_3_a"] call FNC_AddItemRandom;
END_GROUP;

//////////////////////////////////////
///// PLATOON ////////////////////////
//////////////////////////////////////

case (package + "PLT_1IC"): {
	["V_Simc_flak_M69_alt"] call FNC_AddItem;
	["B_simc_pack_frem_flak_1_alt"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ACRE_PRC148"] call FNC_AddItem;

	["Binocular"] call FNC_AddItem;

	["ACE_MapTools"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["SmokeShell",2,"vest"] call FNC_AddItem;
	["SmokeShellGreen",1,"vest"] call FNC_AddItem;
	["SmokeShellRed",1,"vest"] call FNC_AddItem;

	["SmokeShellBlue",1,"backpack"] call FNC_AddItem;
	["SmokeShellOrange",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",2,"vest"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",2,"vest"] call FNC_AddItem;
	["ACE_Chemlight_HiBlue",2,"backpack"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],4,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "PLT_2IC"): {
	["V_Simc_flak_M69_belt"] call FNC_AddItem;
	["B_simc_pack_frem_flak_3"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ACRE_PRC148"] call FNC_AddItem;

	["Binocular"] call FNC_AddItem;

	["ACE_MapTools"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["SmokeShell",2,"vest"] call FNC_AddItem;
	["SmokeShellGreen",1,"vest"] call FNC_AddItem;
	["SmokeShellRed",1,"vest"] call FNC_AddItem;

	["SmokeShellBlue",1,"backpack"] call FNC_AddItem;
	["SmokeShellOrange",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",2,"vest"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",2,"vest"] call FNC_AddItem;
	["ACE_Chemlight_HiBlue",2,"backpack"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],4,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "PLT_RATELO"): {
	["V_Simc_flak_M69_bandoleer"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(radio);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["SmokeShell",1,"vest"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],7,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};

case (package + "PLT_MEDIC"): {
	["V_Simc_flak_M69"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(medic);

	["ACRE_PRC148"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["SmokeShell",4,"vest"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],4,"vest"] call kobld_weaponHelper_fnc_addWeapon;

	[{CBA_missionTime > 1}, {_this setVariable ["ace_medical_medicClass",2,true]}, _unit] call CBA_fnc_waitUntilAndExecute;
};

//////////////////////////////////////
///// SQUAD //////////////////////////
//////////////////////////////////////

case (package + "SQD_1IC"): {
	["V_Simc_flak_M69_bandoleer_belt"] call FNC_AddItem;
	["B_simc_pack_frem_flak_1_alt"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ACRE_PRC148"] call FNC_AddItem;

	["Binocular"] call FNC_AddItem;

	["ACE_MapTools"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["SmokeShell",2,"vest"] call FNC_AddItem;
	["SmokeShellGreen",1,"vest"] call FNC_AddItem;
	["SmokeShellRed",1,"vest"] call FNC_AddItem;

	["SmokeShell",1,"backpack"] call FNC_AddItem;
	["rhs_mag_m67",1,"backpack"] call FNC_AddItem;

	["ACE_Chemlight_HiRed",2,"vest"] call FNC_AddItem;
	["ACE_Chemlight_HiGreen",2,"vest"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],7,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "SQD_2IC"): {
	["V_Simc_flak_M69_belt"] call FNC_AddItem;
	["B_simc_pack_frem_flak_2"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ACE_MapTools"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["SmokeShell",2,"vest"] call FNC_AddItem;
	["SmokeShellGreen",1,"vest"] call FNC_AddItem;
	["SmokeShellRed",1,"vest"] call FNC_AddItem;

	["SmokeShell",1,"backpack"] call FNC_AddItem;
	["rhs_mag_m67",1,"backpack"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",2,"backpack"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],7,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "SQD_MG"): {
	["V_Simc_flak_M69"] call FNC_AddItem;
	["B_simc_pack_frem_flak_4"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	[_unit,_type,["CUP_lmg_M60","rhsusf_100Rnd_762x51"],2,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	["rhsusf_100Rnd_762x51",4,"backpack"] call FNC_AddItem;
};

case (package + "SQD_MGA"): {
	["V_Simc_flak_M69_bandoleer_belt"] call FNC_AddItem;
	["B_simc_US_Bandoleer_60"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;
	["rhs_mag_m67",2,"backpack"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",4,"backpack"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],10,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],2,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "SQD_GL"): {
	["V_Simc_flak_M69_bandoleer_belt"] call FNC_AddItem;
	["B_simc_pack_frem_flak_4"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_M433_HEDP",8,"vest"] call FNC_AddItem;
	["rhs_mag_M433_HEDP",12,"backpack"] call FNC_AddItem;

	["rhs_mag_m713_Red",1,"backpack"] call FNC_AddItem;
	["rhs_mag_m714_White",2,"backpack"] call FNC_AddItem;
	["rhs_mag_m715_Green",1,"backpack"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",1,"backpack"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1GL","rhs_mag_20Rnd_556x45_M193_Stanag"],7,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],2,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "SQD_AT"): {
	["V_Simc_flak_M69_belt"] call FNC_AddItem;
	["B_simc_US_Bandoleer_556_fore"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ace_dragon_super"] call FNC_AddItem;
	["ace_dragon_sight"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],7,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "SQD_ATA"): {
	["V_Simc_flak_M69_belt"] call FNC_AddItem;
	["B_simc_US_Bandoleer_556_fore"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ace_dragon_super"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],7,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "SQD_RF"): {
	["V_Simc_flak_M69_bandoleer_belt"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(ruck);

	["rhs_weap_m72a7"] call FNC_AddItem;

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;
	["rhs_mag_m67",2,"backpack"] call FNC_AddItem;

	["rhsusf_100Rnd_762x51",2,"backpack"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],10,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M193_Stanag"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit,_type,["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red"],1,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "SQD_IFVCREW"): {
	["V_Simc_flak_M69_bandoleer"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["rhs_mag_m67",2,"vest"] call FNC_AddItem;

	[_unit,_type,["CUP_arifle_M16A1","rhs_mag_20Rnd_556x45_M193_Stanag"],7,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};

//////////////////////////////////////
///// ARMOR //////////////////////////
//////////////////////////////////////

case (package + "TANK_COM"): {
	["V_Simc_56_45_ligt_zusp"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ACRE_PRC148"] call FNC_AddItem;

	["Binocular"] call FNC_AddItem;

	[_unit,_type,["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG"],3,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"],2,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};

case (package + "TANK_CREW"): {
	["V_Simc_56_ligt_2"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	[_unit,_type,["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG"],3,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};

//////////////////////////////////////
///// AIR ////////////////////////////
//////////////////////////////////////

case (package + "AIR_HELI"): {
	["V_Simc_56_45_ligt_zusp"] call FNC_AddItem;

	ADD_GROUP(uniformAir);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ACRE_PRC148"] call FNC_AddItem;

	[_unit,_type,["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG"],3,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit,_type,["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"],2,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};