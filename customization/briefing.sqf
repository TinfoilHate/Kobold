#include "core\briefingCore.sqf" //DO NOT REMOVE

if !("ItemMap" in assignedItems player) then {player linkItem "ItemMap"};

private _lite = ((date call BIS_fnc_sunriseSunsetTime) # 0) - 1.31666667;
private _dark = ((date call BIS_fnc_sunriseSunsetTime) # 1) + 1.31666667;

private _liteM = floor ((_lite mod 1) * 60);
private _liteH = floor _lite;

private _darkM = floor ((_dark mod 1) * 60);
private _darkH = floor _dark;

if (_liteH < 10) then {
	_liteH = "0" + str(_liteH);
} else {
	_liteH = str(_liteH);
};
private _liteT = "" + _liteH + str(_liteM) + "";

if (_darkH < 10) then {
	_darkH = "0" + str(_darkH);
} else {
	_darkH = str(_darkH);
};
private _darkT = "" + _darkH + str(_darkM) + "";

switch (side player) do {
	default {
		NEWTAB("OPORD")
			<br/><font size='15' face='RobotoCondensedBold' color='#FFA500'>SITUATION</font>
			<br/><font size='14'>A. ENEMY FORCES</font>
			<br/><font size='13'>THE ENEMY FORCES CONSISTS OF ELEMENTS OF A SOVIET MOTOR RIFLE BATTALION THAT HAS ESTABLISHED DEFENSIVE POSITIONS ALONG THE REGIMENTAL AXIS OF ADVANCE TO THE SOUTH.</font>
			<br/>
			<br/><font size='13'>ENEMY IS EQUIPPED WITH BMP AND T-72 VEHICLES, SMALL ARMS, RPGS, AND HAS MORTAR SUPPORT. ENEMY SIZE IS APPROXIMATELY A PLATOON+ WITH ATTACHED RECCE ELEMENTS.</font>
			<br/>
			<br/>
			<br/><font size='14'>B. FRIENDLY FORCES</font>
			<br/><font size='13'>FRIENDLY FORCE CONSISTS OF ONE PLATOON MECHANIZED INFANTRY, WITH ATTACHED ARMOR SUPPORT.</font>
			<br/>
			<br/>
			<br/><font size='14'>C. TERRAIN AND WEATHER</font>
			<br/><font size='13'>WEATHER IS OVERCAST, MODERATE VISIBILITY.</font>
			<br/><font size='13'>FIRST LIGHT IS " + toUpperANSI(_liteT) + ", LAST LIGHT IS " + toUpperANSI(_darkT) + ".</font>
			<br/>
			<br/>
			<br/>
			<br/><font size='15' face='RobotoCondensedBold' color='#FFA500'>MISSION</font>
			<br/><font size='14'>1 PLATOON IS TO SEIZE KEY TERRAIN FROM SOVIET FORCES AT OBJ A AND OBJ B.</font>
			<br/>
			<br/>
			<br/>
			<br/><font size='15' face='RobotoCondensedBold' color='#FFA500'>EXECUTION</font>
			<br/><font size='14'>A. CONCEPT OF OPERATION</font>
			<br/><font size='13'>PHASE 1: INITIAL MOVEMENT TO OBJECTIVE AREA.</font>
			<br/><font size='13'>PHASE 2: ATTACK AND SEIZE OBJ A AND OBJ B.</font>
			<br/><font size='13'>PHASE 3: CONSOLIDATE THE PLATOON AT OBJ B.</font>
			<br/>
			<br/><font size='14'>B. MANEUVER</font>
			<br/><font size='13'>COMMANDER DISCRETION</font>
			<br/>
			<br/><font size='14'>C. TIMING</font>
			<br/><font size='13'>ATTACK SHOULD BE COMPLETED AND THE PLATOON CONSOLIDATED NLT 0845.</font>
			<br/>
			<br/>
			<br/>
			<br/><font size='15' face='RobotoCondensedBold' color='#FFA500'>SERVICE SUPPORT</font>
			<br/><font size='14'>A. SUPPORT</font>
			<br/><font size='13'>NIL.</font>
			<br/>
			<br/><font size='14'>B. SERVICE</font>
			<br/><font size='13'>AMMUNTION AND MEDICAL SUPPLIES IN PC CARGO.</font>
			<br/>
			<br/>
			<br/>
			<br/><font size='15' face='RobotoCondensedBold' color='#FFA500'>COMMAND AND SIGNAL</font>
			<br/><font size='14'>A. FREQUENCIES</font>
			<br/><font size='13'>PRC148 - PRESETS</font>
			<br/><font size='13'>PRE.4 - ALPHA COMPANY</font>
			<br/><font size='13'>PRE.1 - 1 PLATOON</font>
			<br/><font size='13'>PRE.2 - 2 PLATOON</font>
			<br/><font size='13'>PRE.3 - 3 PLATOON</font>
			<br/>
			<br/>
			<br/><font size='13'>PRC343 - PRESETS</font>
			<br/><font size='13'>PRE.1 - 1SEC</font>
			<br/><font size='13'>PRE.2 - 2SEC</font>
			<br/><font size='13'>PRE.3 - 3SEC</font>
			<br/><font size='13'>PRE.4 - HQ</font>
			<br/>
			<br/>
			<br/><font size='14'>B. CALLSIGNS</font>
			<br/><font size='13'>ATTACK 6 - A COY HQ</font>
			<br/><font size='13'>ATTACK 16 - 1 PLT</font>
			<br/><font size='13'>ATTACK 11 - 1SEC</font>
			<br/><font size='13'>ATTACK 12 - 2SEC</font>
			<br/><font size='13'>ATTACK 13 - 3SEC</font>
			<br/>
			<br/><font size='13'>ATTACK 41 - M60A3</font>
		ENDTAB;
	};
};

NEWTAB("MISSION NOTES")
	<br/>Mission ends when objectives have been completed.
	<br/>
	<br/> ----	Mission Maker: N/A
	<br/> ----	Respawn: None
	<br/> ----	JIP: Teleport
	<br/> ----	Flight Model: N/A
	<br/> ----  End Conditions: 80% casualties or time elapsed
	<br/> ----	Time Limit: 60 minutes
ENDTAB;

NEWTAB("CHANGELOG")
	<br/>-v1.0 - Release!
ENDTAB;


DISPLAYBRIEFING();