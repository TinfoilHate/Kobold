//[this, "OPFOR_RF"] call FNC_GearScript;

#define package "OPFOR_"

SET_GROUP(uniform)
	["UK3CB_CW_SOV_O_Early_U_CombatUniform_01_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_02_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_03_KHK"] call FNC_AddItemRandom;
	["UK3CB_TKA_I_H_SSh68_Oli"] call FNC_AddItem;
	["UK3CB_V_Belt_Rig_KHK"] call FNC_AddItem;
	["UK3CB_CW_SOV_O_EARLY_B_RIF"] call FNC_AddItem;
END_GROUP;

SET_GROUP(uniformGL)
	["UK3CB_CW_SOV_O_Early_U_CombatUniform_01_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_02_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_03_KHK"] call FNC_AddItemRandom;
	["UK3CB_TKA_I_H_SSh68_Oli"] call FNC_AddItem;
	["UK3CB_V_Belt_Rig_KHK"] call FNC_AddItem;
	["UK3CB_CW_SOV_O_EARLY_B_RIF"] call FNC_AddItem;
END_GROUP;

SET_GROUP(uniformAT)
	["UK3CB_CW_SOV_O_Early_U_CombatUniform_01_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_02_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_03_KHK"] call FNC_AddItemRandom;
	["UK3CB_TKA_I_H_SSh68_Oli"] call FNC_AddItem;
	["UK3CB_V_Belt_Rig_KHK"] call FNC_AddItem;
	["rhs_rpg_empty"] call FNC_AddItem;
END_GROUP;

SET_GROUP(uniformMG)
	["UK3CB_CW_SOV_O_Early_U_CombatUniform_01_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_02_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_03_KHK"] call FNC_AddItemRandom;
	["UK3CB_TKA_I_H_SSh68_Oli"] call FNC_AddItem;
	["UK3CB_V_Belt_Rig_KHK"] call FNC_AddItem;
	["UK3CB_CW_SOV_O_EARLY_B_RIF"] call FNC_AddItem;
END_GROUP;

SET_GROUP(uniformSL)
	["UK3CB_CW_SOV_O_Early_U_JNR_OFFICER_Uniform_01_KHK"] call FNC_AddItem;
	["UK3CB_TKA_I_H_SSh68_Oli"] call FNC_AddItem;
	["UK3CB_V_Belt_Rig_KHK"] call FNC_AddItem;
	["UK3CB_B_B_Radio_Backpack"] call FNC_AddItem;
END_GROUP;

SET_GROUP(uniformCrew)
	["UK3CB_CW_SOV_O_Early_U_CombatUniform_01_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_02_KHK","UK3CB_CW_SOV_O_Early_U_CombatUniform_03_KHK"] call FNC_AddItemRandom;
	["rhs_tsh4"] call FNC_AddItem;
	["UK3CB_V_Belt_KHK"] call FNC_AddItem;
END_GROUP;

SET_GROUP(uniformTank)
	["UK3CB_CW_SOV_O_Early_U_Crew_Uniform_01_KHK","UK3CB_CW_SOV_O_Early_U_Crew_Uniform_02_KHK","UK3CB_CW_SOV_O_Early_U_Crew_Uniform_03_KHK"] call FNC_AddItemRandom;
	["rhs_tsh4"] call FNC_AddItem;
	["UK3CB_V_Belt_KHK"] call FNC_AddItem;
END_GROUP;

SET_GROUP(items)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
END_GROUP;

SET_GROUP(IFAK)
	["ACE_fieldDressing", 2, "uniform"] call FNC_AddItem;
	["ACE_elasticBandage", 4, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 2, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 2, "uniform"] call FNC_AddItem;
	["ACE_splint", 1, "uniform"] call FNC_AddItem;
END_GROUP;

case (package + "TANK"): {
	ADD_GROUP(uniformTank);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	[_unit, _type, ["rhs_weap_aks74u", "rhs_30Rnd_545x39_7N6_AK"],3,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};

case (package + "CREW"): {
	ADD_GROUP(uniformCrew);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	[_unit, _type, ["rhs_weap_aks74", "rhs_30Rnd_545x39_7N6_AK"],3,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};

case (package + "SL"): {
	ADD_GROUP(uniformSL);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["rhs_mag_rgd5"] call FNC_AddItem;

	[_unit, _type, ["rhs_weap_ak74", "rhs_30Rnd_545x39_7N6_AK"],6,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit, _type,["rhs_30Rnd_545x39_7N6_AK"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "RF"): {
	ADD_GROUP(uniform);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["rhs_mag_rgd5"] call FNC_AddItem;

	[_unit, _type, ["rhs_weap_ak74", "rhs_30Rnd_545x39_7N6_AK"],6,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit, _type,["rhs_30Rnd_545x39_7N6_AK"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "MM"): {
	ADD_GROUP(uniform);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["rhs_mag_rgd5"] call FNC_AddItem;

	[_unit, _type, ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1", "rhs_acc_pso1m2"],6,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit, _type,["rhs_10Rnd_762x54mmR_7N1"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "RFAT"): {
	ADD_GROUP(uniform);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["CUP_launch_RPG18"] call FNC_AddItem;

	["rhs_mag_rgd5"] call FNC_AddItem;

	[_unit, _type, ["rhs_weap_ak74", "rhs_30Rnd_545x39_7N6_AK"],6,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit, _type,["rhs_30Rnd_545x39_7N6_AK"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "AT"): {
	ADD_GROUP(uniformAT);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["rhs_mag_rgd5"] call FNC_AddItem;

	["rhs_weap_rpg7"] call FNC_AddItem;
	["rhs_rpg7_PG7V_mag",3,"backpack"] call FNC_AddItem;

	[_unit, _type, ["rhs_weap_ak74", "rhs_30Rnd_545x39_7N6_AK"],6,"vest"] call kobld_weaponHelper_fnc_addWeapon;
};

case (package + "GL"): {
	ADD_GROUP(uniformGL);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["rhs_mag_rgd5"] call FNC_AddItem;

	[_unit, _type, ["rhs_weap_ak74_gp25", "rhs_30Rnd_545x39_7N6_AK"],6,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit, _type,["rhs_VOG25"],8,"vest"] call kobld_weaponHelper_fnc_addMagazine;
	[_unit, _type,["rhs_30Rnd_545x39_7N6_AK"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "AR"): {
	ADD_GROUP(uniformMG);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["rhs_mag_rgd5"] call FNC_AddItem;

	[_unit, _type, ["CUP_arifle_RPK74_45", "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"],4,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit, _type,["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"],8,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};

case (package + "MG"): {
	ADD_GROUP(uniformMG);
	ADD_GROUP(items);
	ADD_GROUP(IFAK);

	["rhs_mag_rgd5"] call FNC_AddItem;

	[_unit, _type, ["rhs_weap_pkm", "rhs_100Rnd_762x54mmR"],2,"vest"] call kobld_weaponHelper_fnc_addWeapon;
	[_unit, _type,["rhs_100Rnd_762x54mmR"],4,"backpack"] call kobld_weaponHelper_fnc_addMagazine;
};