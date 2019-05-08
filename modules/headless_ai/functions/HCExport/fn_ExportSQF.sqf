if !is3DEN exitWith {};

params [["_type","groups"],["_selectType",1]];

HC_3DEN_TextObjectsOnMap = nil;
HC_3DEN_TextMarkersOnMap = nil;
HC_3DEN_TextVehiclesOnMap = nil;
HC_3DEN_TextGroupsOnMap = nil;
HC_3DEN_TextSelectedObjects = nil;
HC_3DEN_TextSelectedMarkers = nil;
HC_3DEN_TextSelectedVehicles = nil;
HC_3DEN_TextSelectedGroups = nil;

[_type,_selectType] call HC_fnc_SelTypeExport;
