class PZAI {
	tag = "PZAI";

	class Combat {
		file = "modules\headless_ai\cfgFunctions\Combat";
		class ArmEmptyStatic {};
		class CombatAttack {};
		class CombatDefend {};
		class CombatMode {};
		class CombatMoveTo {};
		class CombatResponse {};
		class DefaultGroupPatrol {};
		class DestroyBuilding {};
		class FindCoverPos {};
		class FlankManeuver {};
		class FocusedAccuracy {};
		class ForceHeal {};
		class FormationChange {};
		class FragmentMove {};
		class Garrison {};
		class GarrisonClear {};
		class GarrisonClearPatrol {};
		class GroupLoiter {};
		class GroupPatrol {};
		class LightGarrison {};
		class LoiterAction {};
		class MoveInCombat {};
		class MoveToCover {};
		class PlaceMine {};
		class RadioCommsEnemy {};
		class RearmGo {};
		class RearmSelf {};
		class ReinforcementResponse {};
		class ReGroup {};
		class SightAid {};
		class FireWeapon {};
		class SuppressingShots {};
		class ThrowGrenade {};
		class WatchEnemy {};
		class SearchBuilding {};
	};

	class Commander {
		file = "modules\headless_ai\cfgFunctions\Commander";
		class assignToArea {};
		class CommanderHandler {};
	};
	
	class StateMachine {
		file = "modules\headless_ai\cfgFunctions\statemachine";
		class addEventTransition {};
		class addState {};
		class addTransition {};
		class clockwork {};
		class create {};
		class createFromConfig {};
		class delete {};
		class getCurrentState {};
		class manualTransition {};
		class toString {};
		class updateList {};
		class dumpPerformanceCounters {};
	};
	
	class CommanderSM {
		file = "modules\headless_ai\cfgFunctions\CommanderSM";
		class CM_OnStateInitial {};
	};
    
    class GroupHandlerSM {
		file = "modules\headless_ai\cfgFunctions\GroupHandlerSM";
		class GH_OnStateInitial {};
		class GH_OnStateGroupCheck {};
	};
	
	class SightAidSM {
		file = "modules\headless_ai\cfgFunctions\SightAidSM";
		class SA_OnSECheckNearbyEnemies {};
		class SA_OnSECombatMode {};
		class SA_onSEEnemyInRange {};
		class SA_OnSERemoveCantSeeEnemy {};
	};
	
	class UnitStanceSM {
		file = "modules\headless_ai\cfgFunctions\UnitStanceSM";
		class US_onSEInitial {};
		class US_onSEResetStance {};
		class US_onSEStanceCheck {};
		class US_onSEUnitChecks {};
	};
	
	//class UnitCombatSM {
	//	file = "modules\headless_ai\cfgFunctions\UnitCombatSM";
	//	class UC_onSECheckNearbyEnemies {};
	//	class UC_onSEUnitChecks {};
	//};
    
    class CachingSM {
		file = "modules\headless_ai\cfgFunctions\CachingSM";
		class CH_onSEDistanceCheck {};
		class CH_transCacheGroup {};
		class CH_transUnCacheGroup {};
	};

	class Main {
		file = "modules\headless_ai\cfgFunctions\Main";
		class ActiveHandler {};
		class GroupHandler {};
		class initMain {};
		class MapMarkers {};
		class QueueHandle {};
	};

	class Misc {
		file = "modules\headless_ai\cfgFunctions\Misc";
		class checkifHC {};
		class playerInit {};
		class setunitskill {};
		class UnitInit {};
		class SetInit {};
		class deleteVehicles {};
		class searchNestedArray {};
	};
	
	class BunkerSM {
		file = "modules\headless_ai\cfgFunctions\BunkerSM";
		class OnSEInitial {};
		class OnSECheckNearbyEnemies {};
		class OnSERemoveCantSeeEnemy {};
		class OnSEEnemyInRange {};
		class OnSECombatMode {};
		class OnSETarget {};
		class OnSEFire {};
		class OnSEAimed {};
		class OnSETimeOutReset {};
		class OnSEBurstReset {};
		class CondBurstCount {};
	};
	
	//class GroupHandlerSM {
	//	file = "modules\headless_ai\cfgFunctions\GroupHandlerSM";
	//	class GH_OnStateInitial {};
	//};

	class Eventhandlers {
		file = "modules\headless_ai\cfgFunctions\Eventhandlers";
		class onAIHit {};
		class onPlayerInit {};
		class onInit {};
		class onInitPost {};
	};

	class create {
		file = "modules\headless_ai\cfgFunctions\create";
	    class createFunctions {};
	    class createGroup {};
	    class createOccupyGroup {};
	    class createUnit {};
	    class createVehicle {};
	    class createEmptyVehicle {};
	    class createObject {};
	    class createWaypoint {};
	    class createWaypointModified {};
	    class createWaypoints {};
	    class createZone {};
	    class setupZone {};
	    class spawnArray {};
	};

	class Diag {
		file = "modules\headless_ai\cfgFunctions\Diag";
		class AttachPosition {};
		class BuildingCheck {};
		class BuildingSpawnCheck {};
		class checkView {};
		class Classvehicle {};
		class ClosestEnemy {};
		class ClosestObject {};
		class DriverCheck {};
		class EnemyArray {};
		class getStance {};
		class HasMine {};
		class HasRadioGroup {};
		class IRCheck {};
		class isAimed {};
		class isFacing {};
		class LOSCheck {};
		class StanceModifier {};
		class UnitCheck {};
		class VehicleHandle {};
		class Waypointcheck {};
		class WepSupCheck {};
	};

	class DangerCauses {
		file = "modules\headless_ai\cfgFunctions\DangerCauses";
		class CombatMovement {};
		class CurrentStance {};
		class DeadBodyDetection {};
		class ExplosionDetection {};
		class MoveToCoverGroup {};
		class RecentEnemyDetected {};
		class SetCombatStance {};
		class stopToShoot {};
		class VehicleHandleDanger {};
	};

	class get {
		file = "modules\headless_ai\cfgFunctions\get";
	    class getBuildingList {};
	    class getBuildings {};
	    class getGroupVariables {};
	    class getNearestBuilding {};
	    class getNearestBuildings {};
	    class getNearestGroupBuildings {};
	    class getNewPos {};
	    class getRandomBuilding {};
	    class getRandomBuildings {};
	    class getRandomGroupBuildings {};
	    class getRandomPositionCircle {};
	    class getSide {};
	    class getStartBuilding {};
	    class getTasks {};
	    class getTaskParams {};
	    class getTurrets {};
	    class getWaypointDetails {};
	    class getVehicleRoles {};
	};

	class GetInfo {
		file = "modules\headless_ai\cfgFunctions\GetInfo";
	    class getDetails {};
	    class getDetailsArray {};
	    class getDetailsGroup {};
	    class getDetailsThing {};
	    class getDetailsVehicle {};
	    class getDetailsVehicleEmpty {};
	    class getDetailsUnit {};
	    class getSynced {};
	    class getSyncedGroups {};
	    class getSyncedObjects {};
	};

	//class GroupHandler {
	//	file = "modules\headless_ai\cfgFunctions\GroupHandler";
	//    class onInitEntered {};
	//};

	class set {
		file = "modules\headless_ai\cfgFunctions\set";
	    class setAssignedVehicle {};
	    class setBuildingPos {};
	    class setCompletedTasks {};
	    class setFlashlights {};
	    class setGroupBehaviour {};
	    class setGroupVariables {};
	    class setMarkerPos {};
	    class setMultiOccupy {};
	    class setPersistent {};
	    class setRadial {};
	    class setRespawn {};
	    class setStance {};
	    class setSurrender {};
	    class setTracker {};
	    class setVehicle {};
	    class setZone {};
	};

	class Settings {
		file = "modules\headless_ai\cfgFunctions\Settings";
	};

	class task {
		file = "modules\headless_ai\cfgFunctions\task";
	    class taskActivate {};
	    class taskAssign {};
	    class taskCheck {};
	    class taskComplete {};
	    class taskForceFire {};
	    class taskGroup {};
	    class taskLoiter {};
	    class taskHoldUntil {};
	    class taskInit {};
	    class taskForceSpeed {};
	    class taskBuildingPatrol {};
	    class taskBuildingDefend {};
	    class taskMonitor {};
	    class taskMoveBuilding {};
	    class taskMoveBuildings {};
	    class taskMoveGroupBuildingsDefend {};
	    class taskMoveGroupBuildingsPatrol {};
	    class taskMoveMultipleBuildingsDefend {};
	    class taskMoveMultipleBuildingsPatrol {};
	    class taskMoveNearestBuildingDefend {};
	    class taskMoveNearestBuildingPatrol {};
	    class taskMoveRandomBuildingDefend {};
	    class taskMoveRandomBuildingPatrol {};
	    class taskMoveRandomGroupBuildingsDefend {};
	    class taskMoveRandomGroupBuildingsPatrol {};
	    class taskMoveRandomMultipleBuildingsDefend {};
	    class taskMoveRandomMultipleBuildingsPatrol {};
	    class taskRegister {};
	    class taskRemoveZoneActivated {};
	    class taskSearchNearby {};
	    class taskSet {};
	    class taskSetBunker {};
	    class taskSentry {};
	    class taskPlacement {};
	    class taskPatrol {};
	    class taskPatrolPerimeter {};
	};
};
