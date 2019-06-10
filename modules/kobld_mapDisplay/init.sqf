["Map Display", "Shows placed structures on the map.", "TinfoilHate"] call FNC_RegisterModule;

#include "settings.sqf"

kobld_mapDisplay_positions = [];
kobld_mapDisplay_raw = [];
kobld_mapDisplay_names = [];

{
	{
		kobld_mapDisplay_raw pushBack _x
	} forEach allMissionObjects _x;
} forEach kobld_mapDisplay_whiteList;

{
	_type = typeOf _x;
	_xAdj = 1;
	_yAdj = 1;

	_mapDisplay_exception = [];
	{
		_x params ["_exType"];

		if (_type == _exType) then {
			_xAdj = _x # 1;
			_yAdj = _x # 2;
		};
	} forEach kobld_mapDisplay_exceptions;

	if (count _mapDisplay_exception > 0) then {
		_xAdj = _mapDisplay_exception # 0;
		_yAdj = _mapDisplay_exception # 1;
	};

	_sizeX = ((boundingBox _x) # 1 # 0) / 2 + _xAdj;
	_sizeY = ((boundingBox _x) # 1 # 1) / 2 + _yAdj;

	if (!isDedicated && hasInterface) then {
		_newMarkerName = "";
		_needName = true;

		while {_needName} do {
			_newMarkerName = "kobld_mapdisplay_" + str(floor random 10000);

			if (_newMarkerName in kobld_mapDisplay_names) then {
				_needName = true;
			} else {
				_needName = false;
			};

			kobld_mapDisplay_names pushBack _newMarkerName;
		};

		createMarkerLocal [_newMarkerName,position _x];
		_newMarkerName setMarkerShapeLocal "RECTANGLE";
		_newMarkerName setMarkerBrushLocal "SolidFull";
		_newMarkerName setMarkerColorLocal "ColorGrey";
		_newMarkerName setMarkerSizeLocal [_sizeX, _sizeY];
		_newMarkerName setMarkerDirLocal (getDir _x);
		_newMarkerName setMarkerAlphaLocal 1;
	};

	kobld_mapDisplay_positions pushBack (position _x);
} forEach kobld_mapDisplay_raw;