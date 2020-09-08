/*
 * Author: TinfoilHate
 *  Initializes overhead camera, press space to advance, then safe and lower weapons.
 *
 * Arguments:
 *  Nil
 *
 * Return Value:
 *  Nil
 *
 * Example:
 * call kobld_safeStart_fnc_safeStart;
 *
 * Public: Yes
*/

#include "..\script_component.hpp"

kobld_safeStart_confirm = false;

diwako_dui_main_inFeatureCamera = true;

private _unitPos = getPosATL player;
private _unitDir = getDir player;

private _camDir = (_unitDir + 180) mod 360;
private _camPosStart = [player, 25, _camDir] call BIS_fnc_relPos;
private _camPosEnd = [player, 2, _camDir] call BIS_fnc_relPos;

kobld_safeStart_camera = "camera" camCreate [_camPosStart select 0, _camPosStart select 1, 50];

kobld_safeStart_camera camSetTarget player;
kobld_safeStart_camera cameraEffect ["internal", "back"];
kobld_safeStart_camera camSetFov 0.70;

camUseNVG GVAR(nightMode);

kobld_safeStart_camera camCommit 0;

titleCut ["", "BLACK IN", 1];
playSound "RscDisplayCurator_visionMode";

15225 cutRsc ["RscStatic", "PLAIN"];
15226 cutRsc ["RscEstablishingShot", "PLAIN"];
15227 cutRsc ["RscInterlacing", "PLAIN"];

[getPosATL player, 50, 25, _camDir] call kobld_safeStart_fnc_camRotate;

[{
	titleText ["<t font='RobotoCondensedBold' color='#FFFFFF' size='1.5'>PRESS SPACE TO CONTINUE</t>", "PLAIN DOWN", 3, true, true];
}, [], 1] call CBA_fnc_waitAndExecute;

[{
	if (currentWeapon player != "") then {
		switch (animationState player) do {
			case "amovpercmstpsraswpstdnon": {
				player playMove "amovpercmstpslowwpstdnon";
			};

			case "amovpercmstpsraswrfldnon": {
				player playMove "amovpercmstpslowwrfldnon";
			};
		};
	};

	showCinemaBorder false;
}, [], 0] call CBA_fnc_waitAndExecute;

[{!isNull findDisplay 46}, {
	kobld_safeStart_EH = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		params ["_event","_code"];

		if (_code isEqualTo 57) then {
			kobld_safeStart_confirm = true;

			(findDisplay 46) displayRemoveEventHandler ["keyDown",kobld_safeStart_EH];
		};
	}];
}, []] call CBA_fnc_waitUntilAndExecute;

[{kobld_safeStart_confirm}, {
	params ["_camPosEnd"];

	kobld_safeStart_camera camSetPos [_camPosEnd select 0, _camPosEnd select 1, 2.4];

	kobld_safeStart_camera camCommit 5;

	titleText ["", "PLAIN", 1, true, true];

	[{
		cutText ["","BLACK OUT",1];
	}, [], 3.8] call CBA_fnc_waitAndExecute;

	[{
		kobld_safeStart_camera cameraEffect ["terminate","back"];
		camDestroy kobld_safeStart_camera;

		cutText ["","BLACK IN",1];

		{_x cutText ["", "PLAIN", 1]} forEach [15225,15226,15227];

		diwako_dui_main_inFeatureCamera = false;

		if (currentWeapon player != "") then {
			[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
		};
	}, [], 5] call CBA_fnc_waitAndExecute;

}, [_camPosEnd]] call CBA_fnc_waitUntilAndExecute;