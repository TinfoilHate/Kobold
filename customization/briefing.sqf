#include "core\briefingCore.sqf" //DO NOT REMOVE

if !("ItemMap" in assignedItems player) then {player linkItem "ItemMap"};

switch (side player) do { //Checks what team the player is on

case west: { //If player is west he receives this briefing

NEWTAB("SITUATION")
	<br/>Nil
ENDTAB;

NEWTAB("MISSION")
	<br/>Nil
ENDTAB;

NEWTAB("EXECUTION")
	<br/>Nil
ENDTAB;

NEWTAB("SERVICE SUPPORT")
	<br/>Nil
ENDTAB;

NEWTAB("COMMAND AND SIGNAL")
	<br/>Nil
ENDTAB;

}; //End of west case

case east: {

NEWTAB("ENEMY")
	<br/>Nil
ENDTAB;

NEWTAB("MISSION")
	<br/>Nil
ENDTAB;

NEWTAB("ORDER")
	<br/>Nil
ENDTAB;

};
}; //End of switch

NEWTAB("MISSION NOTES") //This is shown for everyone
	<br/>Nil
	<br/>
	<br/>Other stuff:
	<br/> ----	Mission maker: Nil
	<br/> ----	Respawn: None
	<br/> ----	JIP: Teleport
	<br/> ----	Flight Model: N/A
	<br/> ----	Medical: Server Controlled
	<br/> ----  End Conditions: Nil
	<br/> ----	Time Limit: __ minutes
	<br/> ----  Auto Fail Condition: Various
ENDTAB;

NEWTAB("GAME MASTERING") //This is shown for everyone
	This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.
ENDTAB;

DISPLAYBRIEFING();