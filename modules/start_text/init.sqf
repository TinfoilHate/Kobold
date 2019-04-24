["Start Text", "Displays animated text on mission start.", "Olsen &amp; Starfox64"] call FNC_RegisterModule;

private ["_month", "_hour", "_min", "_startTextArray", "_line", "_unparsedText"];

#include "settings.sqf"

switch (date # 1) do {
	case 1: {_month = "January"};
	case 2: {_month = "February"};
	case 3: {_month = "March"};
	case 4: {_month = "April"};
	case 5: {_month = "May"};
	case 6: {_month = "June"};
	case 7: {_month = "July"};
	case 8: {_month = "August"};
	case 9: {_month = "September"};
	case 10: {_month = "October"};
	case 11: {_month = "November"};
	case 12: {_month = "December"};
};

_day = format ["%1th", date # 2];

if (date # 2 < 4 || date # 2 > 20) then {

	switch ((date # 2) mod 10) do {

		case 1: {_day = format ["%1st", date # 2]};
		case 2: {_day = format ["%1nd", date # 2]};
		case 3: {_day = format ["%1rd", date # 2]};

	};
};

if (date # 3 < 10) then {

	_hour = "0" + format ["%1", date # 3];

} else {

	_hour = format ["%1", date # 3];

};

if (date # 4 < 10) then {

	_min = "0" + format ["%1H", date # 4];

} else {

	_min = format ["%1H", date # 4];

};

_year = date # 0;

_unparsedText = "<t align='right' size='1.2'>";

for "_i" from 0 to count _startTextArray -1 do {
	_line = _startTextArray # _i;

	switch (_line # 0) do {

		case "TITLEQUOTE": {
			_unparsedText = _unparsedText + format ["<t font='PuristaBold' size='1.6'>""%1""</t>", _line # 1];
		};

		case "TITLE": {
			_unparsedText = _unparsedText + format ["<t font='PuristaBold' size='1.6'>%1</t>", _line # 1];
		};

		case "TEXT": {
			_unparsedText = _unparsedText + format ["%1", _line # 1];
		};

		case "DATE": {
			_unparsedText = _unparsedText + format ["%2 %3", _day, _month];
		};

		case "TIME": {
			_unparsedText = _unparsedText + format ["%1", (_hour + _min)];
		};

		case "DATETIME": {
			_unparsedText = _unparsedText + format ["%1, %2 %3", (_hour + _min), _day, _month];
		};

		case "DATETIMEYEAR": {
			_unparsedText = _unparsedText + format ["%1, %2 %3 %4", (_hour + _min), _day, _month, _year];
		};

		case "DTG": {

			switch (date # 1) do {
				case 1: {_month = "JAN"};
				case 2: {_month = "FEB"};
				case 3: {_month = "MAR"};
				case 4: {_month = "APR"};
				case 5: {_month = "MAY"};
				case 6: {_month = "JUN"};
				case 7: {_month = "JUL"};
				case 8: {_month = "AUG"};
				case 9: {_month = "SEP"};
				case 10: {_month = "OCT"};
				case 11: {_month = "NOV"};
				case 12: {_month = "DEC"};
			};

			if (date # 2 < 10) then {
				_day = "0" + format ["%1", date # 2];
			} else {
				_day = format ["%1", date # 2];
			};

			if (date # 3 < 10) then {
				_hour = "0" + format ["%1", date # 3];
			} else {
				_hour = format ["%1", date # 3];
			};

			if (date # 4 < 10) then {
				_min = "0" + format ["%1", date # 4];
			} else {
				_min = format ["%1", date # 4];
			};

			if (date # 0 <= 1999) then {
				_year = _year/* - 1900*/;
			} else {
				_year = _year/* - 2000*/;
			};
			_tz = _line # 1;

			_unparsedText = _unparsedText + format ["%1 %2%3%4 %5 %6",_day,_hour,_min,_tz,_month,_year];	//DDHHMM(Z)MONYY
		};
		
		case "DTGY": {

			switch (date # 1) do {
				case 1: {_month = "JAN"};
				case 2: {_month = "FEB"};
				case 3: {_month = "MAR"};
				case 4: {_month = "APR"};
				case 5: {_month = "MAY"};
				case 6: {_month = "JUN"};
				case 7: {_month = "JUL"};
				case 8: {_month = "AUG"};
				case 9: {_month = "SEP"};
				case 10: {_month = "OCT"};
				case 11: {_month = "NOV"};
				case 12: {_month = "DEC"};
			};

			if (date # 2 < 10) then {
				_day = "0" + format ["%1", date # 2];
			} else {
				_day = format ["%1", date # 2];
			};

			if (date # 3 < 10) then {
				_hour = "0" + format ["%1", date # 3];
			} else {
				_hour = format ["%1", date # 3];
			};

			if (date # 4 < 10) then {
				_min = "0" + format ["%1", date # 4];
			} else {
				_min = format ["%1", date # 4];
			};

			_year = _line # 2;
			_tz = _line # 1;

			_unparsedText = _unparsedText + format ["%1 %2%3%4 %5 %6",_day,_hour,_min,_tz,_month,_year];	//DDHHMM(Z)MONYYYY
		};		
	};

	if (_i < count _startTextArray -1) then {
		_unparsedText = _unparsedText + "<br/>";
	}
};

_unparsedText = _unparsedText + "</t>";

[parsetext _unparsedText, true, nil, 10, 0.7, 0] spawn {

	sleep 10;
	_this call BIS_fnc_textTiles;

};