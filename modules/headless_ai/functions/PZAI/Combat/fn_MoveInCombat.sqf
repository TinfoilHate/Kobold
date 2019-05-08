private ["_Unit", "_index", "_wPos", "_NearestEnemy", "_unit","_GuessLocation","_PZAI_MovedRecently","_PZAI_MovedRecentlyCover","_PZAI_InCover","_ReturnVariable"];
_Unit = _this select 0;
//systemchat format ["%1",((group _Unit) call PZAI_fnc_Waypointcheck)];
//if ((count ((group _Unit) call PZAI_fnc_Waypointcheck)) > 0) exitwith {};
if (PZAI_CurrentlyMoving < PZAI_CurrentlyMovingLimit) then
{
	_PZAI_GARRISONED = _this select 1;
	_PZAI_MovedRecently = _this select 2;
	_PZAI_MovedRecentlyCover = _this select 3;
	_PZAI_InCover = _this select 4;
	_PZAI_VisuallyCanSee = _this select 5;
	_PZAI_ActivelyClearing = _this select 6;
	_PZAI_StartedInside = _this select 7;
	_FiredRecently = _unit getVariable ["PZAI_FiredTime",diag_ticktime];
	
	//systemchat "EXECUTED COMBAT MOVEMENT!";
	//systemchat format ["%1",(diag_tickTime - _FiredRecently)];
	
	if (_PZAI_MovedRecentlyCover || {(diag_tickTime - _FiredRecently) < 3} || {_PZAI_VisuallyCanSee} || {_PZAI_ActivelyClearing} || {_PZAI_StartedInside} || {_PZAI_GARRISONED} || {_PZAI_MovedRecently}) exitWith {_ReturnVariable = [false,false,false];PZAI_CurrentlyMoving = PZAI_CurrentlyMoving - 1;_ReturnVariable};
	_Squadlead = leader _Unit;
	
	if (_Squadlead distance _Unit > 60) then
	{
		//_Unit domove (getposATL _Squadlead);
			_Unit forcespeed -1;
	}
	else
	{
		_Group = (group _Unit);
		//Pull the waypoint information
		_index = currentWaypoint _Group;
		
		_WPPosition = getWPPos [_Group,_index];
		//systemchat format ["_WPPosition: %1",_WPPosition];
		if !(_WPPosition isEqualTo [0,0,0]) then
		{
			if (_Unit isEqualTo (leader _Unit)) then
			{
				_GroupDudes = units (group _Unit);
				_NearestEnemy = _Unit call PZAI_fnc_ClosestEnemy;
				if (isNil "_NearestEnemy" || _NearestEnemy isEqualTo [0,0,0]) then {_NearestEnemy = _WPPosition;};
				//systemchat format ["_NearestEnemy: %1",_NearestEnemy];	
				_PZAI_MovedRecentlyRETURN = true;
				_PZAI_MovedRecentlyCoverRETURN = true;
				_PZAI_InCoverRETURN = true;		
				_ReturnVariable = [_PZAI_MovedRecentlyRETURN,_PZAI_MovedRecentlyCoverRETURN,_PZAI_InCoverRETURN];			
				{
					[_x,_WPPosition,_PZAI_GARRISONED,_PZAI_MovedRecentlyCover,_PZAI_ActivelyClearing,_PZAI_StartedInside,_NearestEnemy] spawn 
					{
						_Unit = _this select 0;					
						if !((vehicle _Unit) isEqualTo _Unit) exitWith {};
						waitUntil {PZAI_CurrentlyMoving < PZAI_CurrentlyMovingLimit};
						PZAI_CurrentlyMoving = PZAI_CurrentlyMoving + 1;
						sleep (random 10);
						_Pos = _this select 1;
						_PZAI_GARRISONED = _this select 2;
						_PZAI_MovedRecentlyCover = _this select 3;
						_PZAI_ActivelyClearing = _this select 4;
						_PZAI_StartedInside = _this select 5;
						_NearestEnemy = _this select 6;
						
						
						_MoveToPos = [_Unit,_Pos,_NearestEnemy] call PZAI_fnc_FragmentMove;
						//systemchat format ["_MoveToPos: %1",_MoveToPos];	
						if !((vehicle _Unit) isEqualTo _Unit) exitWith
						{
							_Unit forceSpeed -1;
							_Unit doMove _Pos;
						};			
						_CoverPos = [_Unit,_MoveToPos,_PZAI_GARRISONED,_PZAI_MovedRecentlyCover,_PZAI_ActivelyClearing,_PZAI_StartedInside,_NearestEnemy] call PZAI_fnc_FindCoverPos;
						//systemchat format ["_CoverPos: %1",_CoverPos];	
				
						if !(isNil "_CoverPos") then
						{
						if (PZAI_AIDEBUG isEqualTo 1) then
						{
							_arrow = "Sign_Sphere200cm_F" createVehicle [0,0,0];
							_arrow setpos _CoverPos;
							_arrow spawn 
							{
								_Counter = 0;
								_Position = getpos _this;
								_NewPos2 = _Position select 2;						
								while {_Counter < 60} do
								{
									_NewPos2 = _NewPos2 + 0.1;
									_this setpos [_Position select 0,_Position select 1,_NewPos2];
									_Counter = _Counter + 1;
									sleep 0.5;
								};
								deletevehicle _this;
							};
						};
						
							_Unit doWatch ObjNull;
							_Unit disableAI "TARGET";
							_Unit disableAI "AUTOTARGET";																									
							_Unit disableAI "SUPPRESSION";				
							_Unit disableAI "AUTOCOMBAT";								
							_WaitTime = diag_ticktime + 35;
							While {alive _Unit && diag_ticktime < _WaitTime && (_Unit distance _CoverPos) > 3} do 
							{
										_Unit forcespeed -1;							
										_Unit domove _CoverPos;
								//	};
								sleep 4;		
							};
							//systemchat format ["MADE IT: %1",_Unit];
							_Unit forcespeed 0;
						}
						else
						{
							_Unit forcespeed -1;
							_Unit doMove _MoveToPos;
						};
						_Unit enableAI "AUTOTARGET";
						_Unit enableAI "TARGET";				
						_Unit enableAI "SUPPRESSION";				
						_Unit enableAI "AUTOCOMBAT";	
						_Unit doWatch _NearestEnemy;
					};
				} foreach _GroupDudes;
			};
			_PZAI_MovedRecentlyRETURN = true;
			_PZAI_MovedRecentlyCoverRETURN = true;
			_PZAI_InCoverRETURN = true;		
			_ReturnVariable = [_PZAI_MovedRecentlyRETURN,_PZAI_MovedRecentlyCoverRETURN,_PZAI_InCoverRETURN];			
			//_Unit setVariable ["PZAI_InCover",true,false];
		}
		else
		{
			_PZAI_MovedRecentlyRETURN = false;
			_PZAI_MovedRecentlyCoverRETURN = false;
			_PZAI_InCoverRETURN = false;		
			_ReturnVariable = [_PZAI_MovedRecentlyRETURN,_PZAI_MovedRecentlyCoverRETURN,_PZAI_InCoverRETURN];	
			
		};
		PZAI_CurrentlyMoving = PZAI_CurrentlyMoving - 1;
	};
};
if (isNil "_ReturnVariable") then {_ReturnVariable = [false,false,false];};
_ReturnVariable