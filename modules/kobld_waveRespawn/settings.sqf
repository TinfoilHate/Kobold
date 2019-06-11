
KOBLD_waveSpawn_sectionSize = 8;	//Size of your respawn sections

KOBLD_waveSpawn_sectionRoles = {	//Type / Rank array for your respawn sections. Note that only the first two are selected for rank, any later higher rank will be random, so put SL/TL first
	case 0:{
		_type = "MALI_SL";
		_rank = "SERGEANT";
	};
	case 1:{
		_type = "MALI_TL";
		_rank = "CORPORAL";
	};
	case 2:{
		_type = "MALI_AR";
		_rank = "PRIVATE";
	};
	case 3:{
		_type = "MALI_GL";
		_rank = "PRIVATE";
	};
	case 5:{
		_type = "MALI_TL";
		_rank = "CORPORAL";
	};
	case 6:{
		_type = "MALI_AR";
		_rank = "PRIVATE";
	};
	case 7:{
		_type = "MALI_GL";
		_rank = "PRIVATE";
	};
	default {	// DO NOT REMOVE THE DEFAULT JUST CHANGE IT TO A RIFLEMAN OR SOMETHING
		_type = "MALI_RF";
		_rank = "PRIVATE";
	};
};

KOBLD_waveSpawn_sectionTitles = {	//Role names for informing the player of their new role post-respawn
	case "MALI_SL": {_msg = "a Section Commander"};
	case "MALI_TL": {_msg = "a Team Leader"};
	case "MALI_AR": {_msg = "an Automatic Rifleman."};
	case "MALI_GL": {_msg = "a Grenadier."};
	default {_msg = "a Rifleman."};	// DO NOT REMOVE THE DEFAULT JUST CHANGE IT TO A RIFLEMAN OR SOMETHING
};