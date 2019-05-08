if !is3DEN exitWith {};

params [["_type","groups"],["_selectType",1]];

private ["_code","_br"];

_code = "";
_br = toString [13,10];

_type2 = format ["%1",(toLower _type)];

switch (_type2) do {
	case "objects": {
		
		if ((isNil "HC_3DEN_TextObjectsOnMap" && _selectType isEqualTo 2) || (isNil "HC_3DEN_TextSelectedObjects" && _selectType isEqualTo 1)) then { ["object",_selectType] call HC_fnc_ExportInText; };
		
		_textObjects = switch _selectType do {
			case 1: {HC_3DEN_TextSelectedObjects};
			case 2: {HC_3DEN_TextObjectsOnMap};
		};
		_code = _textObjects + _br + "];";
		
	};
	case "markers": {
		
		if ((isNil "HC_3DEN_TextMarkersOnMap" && _selectType isEqualTo 2) || (isNil "HC_3DEN_TextSelectedMarkers" && _selectType isEqualTo 1)) then { ["marker",_selectType] call HC_fnc_ExportInText; };
		
		_textMarkers = switch _selectType do {
			case 1: {HC_3DEN_TextSelectedMarkers};
			case 2: {HC_3DEN_TextMarkersOnMap};
		};
		_code = _textMarkers + _br + "];";
	};
	case "vehicles": {
		
		if ((isNil "HC_3DEN_TextVehiclesOnMap" && _selectType isEqualTo 2) || (isNil "HC_3DEN_TextSelectedVehicles" && _selectType isEqualTo 1)) then { ["vehicle",_selectType] call HC_fnc_ExportInText; };
		
		_textVehicles = switch _selectType do {
			case 1: {HC_3DEN_TextSelectedVehicles};
			case 2: {HC_3DEN_TextVehiclesOnMap};
		};
		_code = _textVehicles + _br + "];";
	};
	case "groups": {

		if ((isNil "HC_3DEN_TextGroupsOnMap" && _selectType isEqualTo 2) || (isNil "HC_3DEN_TextSelectedGroups" && _selectType isEqualTo 1)) then { ["groups",_selectType] call HC_fnc_ExportInText; };
		
		_textGroups = switch _selectType do {
			case 1: {HC_3DEN_TextSelectedGroups};
			case 2: {HC_3DEN_TextGroupsOnMap};
		};
		_code = "RENAMETHIS = [" + _textGroups + _br + "];";
	};
};

_code = _code + _br;

copytoclipboard _code;
