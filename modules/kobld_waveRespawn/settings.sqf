
KOBLD_waveSpawn_sectionSize = 8;	//Size of your respawn sections

KOBLD_waveSpawn_sectionRoles = {	//Type / Rank array for your respawn sections. Note that only 0 and 1 are selected for higher rank, any later higher rank will be random, so put SL/TL first
	case 0:{
		_type = "CAD_SEC_1IC";
		_rank = "SERGEANT";
	};
	case 1:{
		_type = "CAD_SEC_2IC";
		_rank = "CORPORAL";
	};
	case 2:{
		_type = "CAD_SEC_LMG";
		_rank = "PRIVATE";
	};
	case 3:{
		_type = "CAD_SEC_LMG";
		_rank = "PRIVATE";
	};
	case 4:{
		_type = "CAD_SEC_GL";
		_rank = "PRIVATE";
	};
	case 5:{
		_type = "CAD_SEC_GL";
		_rank = "PRIVATE";
	};
	default {	// DO NOT REMOVE THE DEFAULT JUST CHANGE IT TO A RIFLEMAN OR SOMETHING
		_type = "CAD_SEC_R";
		_rank = "PRIVATE";
	};
};

KOBLD_waveSpawn_sectionTitles = {	//Role names for informing the player of their new role post-respawn
	case "CAD_SEC_1IC": {_msg = "a Section Commander"};
	case "CAD_SEC_2IC": {_msg = "a Section 2IC"};
	case "CAD_SEC_LMG": {_msg = "an Automatic Rifleman."};
	case "CAD_SEC_GL": {_msg = "a Grenadier."};
	
	default {_msg = "a Rifleman."};	// DO NOT REMOVE THE DEFAULT JUST CHANGE IT TO A RIFLEMAN OR SOMETHING
};