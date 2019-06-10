//This module works by filtering allMissionObjects via the kobld_mapDisplay_whiteList classes, which it then creates and adjusts a building marker for. Do note it will overlay editor-placed markers, so anything placed in the editor will appear underneath the building markers where they overlap.
//
//The variable kobld_mapDisplay_exceptions will adjust marker sizes by building class, based on provided X/Y adjustments, mainly to correct buildings with huge bounding boxes. The defaults work for most structures, but testing may be required to look correct.
//
//Once completed, the script will set a few other variables, specifically:
//	kobld_mapDisplay_names - All marker names assigned by the script
//	kobld_mapDisplay_positions - All marker positions assigned by the script
//These two should correspond via index number locally, as all marker generation is local and the order may vary.

kobld_mapDisplay_whiteList = ["Land_d_House_Big_02_V1_F","Land_Offices_01_V1_F"];	//Format: 0[classname1,classname2]
kobld_mapDisplay_exceptions = [	//Format: [[classname1,xAdjust,yAdjust],[classname2,xAdjust,yAdjust]];
	["Land_Barn_01_brown_F",-2,-3],
	["Land_Barn_01_grey_F",-2,-3]
];