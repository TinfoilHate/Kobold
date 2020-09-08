//_startTextArray Format:
//
//["LINE_TYPE", "LINE_TEXT"], <-- remember to put a comma unless this is the last line
//
//Line Types:
//
//TITLEQUOTE -> "MyTitle"
//TITLE -> MyTitle
//TEXT - > MyText
//TIME -> Displays time (no text required)
//DATE -> Displays date (no text required)
//DATETIME -> Displays date and time (no text required)
//DATETIMEYEAR -> Displays date, time, and year (no text required)
//DTG -> Date-Time Group (time zone letter required) Ex: ["DTG","B"]
//DTGY -> Date-Time Group, Custom Year (time zone letter and year required) Ex: ["DTG","B",1970]


switch (side player) do {

	case west: {
		_startTextArray = [
			["TITLE", "MISSION TITLE"],
			["DTG","A"]
		];
	}; //End of west case

	case east: {

		_startTextArray = [
			["TITLE", "MISSION TITLE"],
			["DTG","B"]
		];

	}; //End of east case

	case independent: {

		_startTextArray = [
			["TITLE", "MISSION TITLE"],
			["DTG","B"]
		];

	};

	default {
		_startTextArray = [
			["TITLE", "MISSION TITLE"],
			["DTG","B"]
		];
	};
};