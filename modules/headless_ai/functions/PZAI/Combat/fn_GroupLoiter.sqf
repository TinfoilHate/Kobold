//This script will dictate how the loiter WP works for the AI
params ["_Unit", "_Group","_thisFSM"];

private _Unitleader = leader _Group;
_Group setvariable ["PZAI_Mission","LOITERING"];
_Group setvariable ["InitialWPSet",true];

//We need a list of actions that the AI can do for loitering.
private _UnitArray = units _Group;
{
	if (_x isEqualTo (vehicle _x)) then
	{
		//Each AI will need to join their own group. The plan is to make them re-form when combat starts.
		[_x] joinsilent grpnull;
		(group _x) setvariable ["PZAI_Mission","LOITERING"];
		(group _x) setvariable ["InitialWPSet",true];
		_x setVariable ["PZAI_LOITERINGACT",0];
		[_x,_UnitArray] spawn PZAI_fnc_LoiterAction;
	};
} foreach _UnitArray;

[_Unitleader,_UnitArray,_group] spawn {
	params ["_Unitleader","_UnitArray","_group"];
	waituntil {({if ((behaviour _x) in ["COMBAT","STEALTH","AWARE"]) then {if (true) exitwith {true}} else {if (true) exitwith {false}}} foreach _UnitArray) || !((_group getvariable ["PZAI_CurrentTarget",objnull]) isEqualto objnull)};
	[_UnitArray,_group] call PZAI_fnc_ReGroup;
	[_Group] call PZAI_fnc_CombatResponse;
};



