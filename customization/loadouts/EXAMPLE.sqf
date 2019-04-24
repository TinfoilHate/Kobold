#define package "EX_"

SET_GROUP(uniform)
	["U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_4_F"] call FNC_AddItemRandom;
	["H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_cbr","H_Bandanna_khk","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Cap_blk","H_Cap_blu","H_Cap_grn","H_Cap_oli","H_Cap_red","H_Cap_surfer","H_Cap_tan","H_Hat_Safari_olive_F","H_Hat_Safari_sand_F","rhs_beanie_green","rhssaf_bandana_oakleaf"] call FNC_AddItemRandom;
END_GROUP;

SET_GROUP(IFAK)
	["ACE_fieldDressing", 2, "uniform"] call FNC_AddItem;
	["ACE_elasticBandage", 4, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 2, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 2, "uniform"] call FNC_AddItem;
	["ACE_morphine", 1, "uniform"] call FNC_AddItem;
END_GROUP;

SET_GROUP(items)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
END_GROUP;


case (package + "LEADER"): {
	["V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_TacVest_blk","V_TacVest_oli","V_TacChestrig_grn_F"] call FNC_AddItemRandom;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["ACRE_PRC343"] call FNC_AddItem;

	["rhs_mag_f1","rhs_mag_m67","rhs_mag_rgd5"] call FNC_AddItemRandom;

	[_unit,_type,["rhs_weap_pp2000_folded","rhs_mag_9x19mm_7n21_44"],"vest",2] call FNC_wephelper;
	
	[_unit,_type,["rhs_weap_akm","rhs_weap_akms","rhs_acc_dtkakm","rhs_30Rnd_762x39mm_bakelite","rhs_30Rnd_762x39mm","rhs_weap_m70b1","rhs_weap_m70b1","rhs_30Rnd_762x39mm_bakelite","rhs_30Rnd_762x39mm","rhs_weap_ak74","rhs_weap_ak74_2","rhs_acc_dtk1983","rhs_30Rnd_545x39_7N6M_AK","rhs_30Rnd_545x39_7N6M_plum_AK","rhs_weap_pp2000","rhs_mag_9x19mm_7n21_44","rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG","rhs_weap_kar98k","rhsgref_5Rnd_792x57_kar98k","rhs_weap_m1garand_sa43","rhsgref_8Rnd_762x63_M2B_M1rifle","rhs_weap_m38","rhsgref_5Rnd_762x54_m38","rhs_weap_MP44","rhsgref_30Rnd_792x33_SmE_StG","rhs_weap_savz58p","rhs_30Rnd_762x39mm_Savz58","rhs_weap_savz61","rhsgref_20rnd_765x17_vz61","rhs_acc_dtk1l","rhs_acc_2dpZenit","rhs_weap_akmn","rhs_acc_dtkakm","rhs_acc_1p29","hlc_20Rnd_762x51_B_M14","hlc_rifle_M14","hlc_20Rnd_762x51_B_fal","hlc_rifle_LAR","hlc_rifle_FAL5000","hlc_rifle_FAL5061","hlc_rifle_L1A1SLR","hlc_rifle_rpk762","hlc_75Rnd_762x39_m_rpk","hlc_45Rnd_762x39_m_rpk","hlc_rifle_rpk","rhs_weap_pm63","rhs_weap_Izh18","rhsgref_1Rnd_Slug","rhsgref_1Rnd_00Buck","rhs_weap_m92","JO_71rnd_762x25","jo_rf_ppsh","hlc_rifle_M1903A1","hlc_5rnd_3006_1903","hlc_rifle_SLRchopmod","hlc_rifle_g3a3","hlc_20rnd_762x51_b_G3","hlc_rifle_hk33a2","hlc_30rnd_556x45_b_HK33","hlc_rifle_hk53","hlc_rifle_g3a3v","rhs_weap_aks74","rhs_weap_aks74u"]] call FNC_wephelper;
};

case (package + "MEMBER"): {
	["V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_TacVest_blk","V_TacVest_oli","V_TacChestrig_grn_F"] call FNC_AddItemRandom;

	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["rhs_mag_f1","rhs_mag_m67","rhs_mag_rgd5"] call FNC_AddItemRandom;

	[_unit,_type,["rhs_weap_akm","rhs_weap_akms","rhs_acc_dtkakm","rhs_30Rnd_762x39mm_bakelite","rhs_30Rnd_762x39mm","rhs_weap_m70b1","rhs_weap_m70b1","rhs_30Rnd_762x39mm_bakelite","rhs_30Rnd_762x39mm","rhs_weap_ak74","rhs_weap_ak74_2","rhs_acc_dtk1983","rhs_30Rnd_545x39_7N6M_AK","rhs_30Rnd_545x39_7N6M_plum_AK","rhs_weap_pp2000","rhs_mag_9x19mm_7n21_44","rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG","rhs_weap_kar98k","rhsgref_5Rnd_792x57_kar98k","rhs_weap_m1garand_sa43","rhsgref_8Rnd_762x63_M2B_M1rifle","rhs_weap_m38","rhsgref_5Rnd_762x54_m38","rhs_weap_MP44","rhsgref_30Rnd_792x33_SmE_StG","rhs_weap_savz58p","rhs_30Rnd_762x39mm_Savz58","rhs_weap_savz61","rhsgref_20rnd_765x17_vz61","rhs_acc_dtk1l","rhs_acc_2dpZenit","rhs_weap_akmn","rhs_acc_dtkakm","rhs_acc_1p29","hlc_20Rnd_762x51_B_M14","hlc_rifle_M14","hlc_20Rnd_762x51_B_fal","hlc_rifle_LAR","hlc_rifle_FAL5000","hlc_rifle_FAL5061","hlc_rifle_L1A1SLR","hlc_rifle_rpk762","hlc_75Rnd_762x39_m_rpk","hlc_45Rnd_762x39_m_rpk","hlc_rifle_rpk","rhs_weap_pm63","rhs_weap_Izh18","rhsgref_1Rnd_Slug","rhsgref_1Rnd_00Buck","rhs_weap_m92","JO_71rnd_762x25","jo_rf_ppsh","hlc_rifle_M1903A1","hlc_5rnd_3006_1903","hlc_rifle_SLRchopmod","hlc_rifle_g3a3","hlc_20rnd_762x51_b_G3","hlc_rifle_hk33a2","hlc_30rnd_556x45_b_HK33","hlc_rifle_hk53","hlc_rifle_g3a3v","rhs_weap_aks74","rhs_weap_aks74u"]] call FNC_wephelper;
};
