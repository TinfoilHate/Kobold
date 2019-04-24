//This module removes maps and compasses from units on spawn, except from the whitelisted gear script names below.
//All names retaining maps will also keep compasses, so you do NOT need to duplicate names into both arrays.
//Ex: "USMCRiflePlatoon_SL" for the default USMC squad leader gear
//
//	_keepMapClasses 		= ["USMCRiflePlatoon_SL"];
//	_keepCompassClasses 	= ["USMCRiflePlatoon_TL"];

	_keepMapClasses 		= ["US_NCO","US_CREW","US_CREWCOM","MSV_NCO","MSV_CREW"];
	_keepCompassClasses 	= ["US_TL","MSV_TL"];