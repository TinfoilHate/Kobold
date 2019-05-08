//This module enables live spawning of arrays including AI on the HC machine locally.
//designed to spawn HC locally in order to improve performance, as well as enabling the 
//option of having randomized enemy composition, size, etc, or to allow for live spawning 
//of reinforcements or subsequent AOs.

//Initial spawns are spawned upon init, at the start of the mission.
//_InitialSpawn = ["NAMEOFARRAY"];

//Custom viewdistance for the AI
HC_viewdistance = 1200;

//Forces Time on the HC to simulate better AI [HOUR,MINUTE]
//Comment out to disable
HC_ForceTime = [12,00];

//Custom AI Skill settings for all spawned AI
HC_customskill = true;
HC_aimingspeed = 1;
HC_spotdistance = 1;
HC_aimingaccuracy = 0.65;
HC_aimingshake = 0.8;
HC_spottime = 1;
HC_reloadspeed = 1;
HC_commanding = 1;
HC_endurance = 1;
HC_general = 1;
HC_courage = 1;

//PZAI settings
PZAI_Enabled = true;
//The distance a unit needs to be away for PZAI scripts to temporary disable itself upon the unit? The AI unit will also need to be out of combat.
PZAI_DisableDistance = 3000;
//Aid to the AI spotting distance and time
PZAI_SightAid = true;
//Distance at which the AI will start seeings enemies in LOS of them
PZAI_SightAid_Distance = 800;
//Minimum reveal value per increase +n reveal value per check every 5 seconds of targets in LOS of enemies.
PZAI_SightAid_MinIncrease = 2;
//Distance at which the AI will force engage the enemies
PZAI_SightAid_EngageDistance = 400;
//How far can the AI hear gunshots from?
PZAI_HearingDistance = 1400;
//How revealed an enemy is from a gunshot report
PZAI_HearingMinIncrease = 1;
//Distance a bunker enemy can see/engage the enemy
PZAI_Bunker_Distance = 900;
//Whether Bunker AI get released and act normally/free to move if enemies get too close
PZAI_Bunker_Release = true;
//Sensitivity/Sightlevel needed for Bunker AI to engage - lower is more sensitive.
PZAI_Bunker_Sightlevel = 0.25;
//Distance at which AI are released from bunker
PZAI_Bunker_Release_Dist = 25;
//Distance AI will respond to call of help from each other
PZAI_Radio_Distance = 1200;
//Whether or not AI need ACRE radios to broadcast info to other groups
PZAI_Radio_NeedRadio = false;
//Distance the AI will patrol to by default when set to "GUARD" waypoint
PZAI_PatrolDistance = 200;
//Whether the AI will patrol between garrison positions. Pretty buggy, but nice for 'mersion
PZAI_GarrisonPatrol = true;

//More obscure settings are found in:
#include "functions\PZAI\AdditionalSettings.sqf"





