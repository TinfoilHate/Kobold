//Turn this on to see certain debug messages. 1 is on
PZAI_AIDEBUG = 0;
//Turn on map markers that track AI movement
PZAI_UseMarkers = false;
//Will AI garrison static weapons nearby?
PZAI_STATICGARRISON = 1;
//Should we let AI use flanking manuevers? false means they can flank
PZAI_REINFORCE = false;
//Should AI use smoke grenades? Besides default A3 behavior?
PZAI_USESMOKE = true;
//Chance of AI using grenades
PZAI_GRENADECHANCE = 35;
//AI will automatically disembark from vehicles when in combat.
PZAI_AIDisembark = true;
//How low should an AI's mag count be for them to consider finding more ammo? This DOES NOT include the mag loaded in the gun already.
PZAI_AIMagLimit = 2;
//Should the rain impact accuracy of AI? DEFAULT = true;
PZAI_RainImpact = true;
//How much should rain impact the accuracy of AI? Default = 3. Default formula is -> _WeatherCheck = (rain)/3; "rain" is on a scale from 0 to 1. 1 Being very intense rain.
PZAI_RainPercent = 3;
//Should AI and players have an additional layer of suppression that decreases aiming when suppressed? Default = true;
PZAI_Suppression = false;
//How much should suppression impact both AI and player aiming? Default is 5. Normal ArmA is 1.
PZAI_SuppressionVar = 5;
//Should AI/players be impacted by adrenaline? This provides players and AI with a small speed boost to animations to assist with cover seeking and positioning for a short time. Default = true;
PZAI_Adrenaline = false;
//How much of a speed boost should players/AI recieve? Default = 1.35; (1 is ArmA's normal speed).
PZAI_AdrenalineVar = 1.35;
//How many AI UNITS can be calculating cover positions at once?
PZAI_CurrentlyMovingLimit = 24;
//How many AI UNITS can be suppressing others at once?
PZAI_CurrentlySuppressingLimit = 40;
//How many AI can be checking roles/equipment/additional commands at once? This will impact FPS of AI in and out of battle. The goal is to limit how many benign commands are being run at once and bogging down a server with over a couple HUNDRED AI.
PZAI_BasicCheckLimit = 40;
//How many squad leaders can be executing advanced code at once.
PZAI_LeaderExecuteLimit = 20;
//How low should the FPS be, before Vcom pauses simulation. This will not disable simulation on AI - they will run default Bohemia AI.
PZAI_FPSFreeze = 10;
//Should the AI notice IR lasers?
PZAI_IRLaser = true;
//The longer an AI's target stays in 1 location, the more accurate and aware of the target the AI becomes.DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
PZAI_IncreasingAccuracy = true;
//PZAI_SideBasedMovement- Remove sides from the array below to force that specific AI side to not execute any advance movement code. (I.E. Moving to reinforce allies, being alerted by distant gunshots and etc). AI with this will still react normally in combat. DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
PZAI_SideBasedMovement = [WEST,EAST,RESISTANCE,INDEPENDENT];
//PZAI_SideBasedExecution- Remove sides from the array below to remove that specific AI side from executing any of the VCOMAI scripts at all. DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
PZAI_SideBasedExecution = [WEST,EAST,RESISTANCE,INDEPENDENT];
//Whether the AI will set up campfires at night if they are set to "DISMISS" waypoint
PZAI_Campfires = true;
//Distance the AI will attempt to flank around the enemy. I.E. How far off a waypoint, or around the enemy squad, the AI are willing to go in combat.
PZAI_WaypointDistance = 300;
