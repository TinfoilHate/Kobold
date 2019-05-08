//Handles Group States, communications between friendly groups, and command structure

sleep 5;

while {true} do {
	{
		_group = _x;
		private _leader = leader _x;
		//if ( || !(alive _leader)) exitwith {};
		if (!(isPlayer _leader) && !(_leader getvariable ["PZAI_NOAI",false]) && ((side _leader in PZAI_SideBasedExecution) || (((INDEPENDENT in PZAI_SideBasedExecution) || (RESISTANCE in PZAI_SideBasedExecution)) && (str(side _leader) isEqualto "GUER")))) then {
		//if (!(_leader getvariable ["PZAI_NOAI",false])) then {
			private _behaviourtasking = (_Group getVariable ["PZAI_Mission","NONE"]);
			private _side = side _group;
			private _groupcount = (count units _group);
			private _behaviour = behaviour _leader;
			private _target = _group getvariable ["PZAI_CurrentTarget",objnull];
			private _position = getposASL _leader;
			private _hasradio = _group getvariable ["PZAI_HasRadio",false];
			private _index = [PZAI_GroupArray, _group, 1] call PZAI_fnc_searchNestedArray;
			
			if (!(_index isEqualto -1)) then {
				//PZAI_GroupArray deleteAt _index;
				PZAI_GroupArray set [_index,[_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio]];
			} else {
				PZAI_GroupArray pushback [_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio];
			};
		};
	} forEach allGroups;
	sleep (random (2) + 2);
};
