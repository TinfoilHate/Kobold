/* HC_fnc_checkHC
Checks whether client is headless client or not

SETS
- HC_var_isHC (bool) to true where client is HC
- HC_var_HCs  (array) contains all present HCs

RETURNS
true/false for HC/not-HC
*/

_hc = false;
FW_var_isHC = false;
if (isNil "FW_var_HCs") then {
	FW_var_HCs = []; 
	publicVariable "FW_var_HCs";
};

if (!hasInterface && !isServer) then {
	_hc = true;
	FW_var_isHC = true;
	HC_ID = clientowner;
	publicvariable "HC_ID"; 
	if !(player in FW_var_HCs) then {
		FW_var_HCs pushback (player);
		publicVariable "FW_var_HCs";
	};
};

if (!isMultiplayer) then {
	_hc = true;
	FW_var_isHC = true;
	HC_ID = clientowner;
	publicvariable "HC_ID"; 
	if !(player in FW_var_HCs) then {
		FW_var_HCs pushback (player);
		publicVariable "FW_var_HCs";
	};
};

_hc