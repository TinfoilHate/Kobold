class HC {
	class HCspawn
	{
		file = "modules\headless_ai\functions\HCSpawn";
		class spawnonHC {};
		class spawnFromArray {};
		class liveSpawnFromArray {};
		class setunitskill {};
		class checkifHC {preInit = 1;};
	};
	class Export
	{
		file = "modules\headless_ai\functions\HCExport";
		class ExportSQF {};
		class ExportInText {};
		class ReplaceText {};
		class SelTypeExport {};
	};
	class Inits
	{
		file = "modules\headless_ai\functions\HCInits";
		class initHC {};
	};
};

class PZAI {
	class Main
	{
		file = "modules\headless_ai\functions\PZAI\Main";
		class ActiveHandler {};
		class GroupHandler {};
		class initMain {};
		class MainLoop {};
		class QueueHandle {};
		class UnitInit {};
	};
	class Misc
	{
		file = "modules\headless_ai\functions\PZAI";
		class playerInit {};
	};
	class Diag
	{
		file = "modules\headless_ai\functions\PZAI\Diag";
		class AIHit {};
		class AttachPosition {};
		class BuildingCheck {};
		class BuildingSpawnCheck {};
		class CheckStatic {};
		class Classvehicle {};
		class ClosestEnemy {};
		class ClosestObject {};
		class DriverCheck {};
		class EnemyArray {};
		class HasMine {};
		class HasRadioGroup {};
		class IRCheck {};
		class LOSCheck {};
		class MapMarkers {};
		class NearEnemies {};
		class searchNestedArray {};
		class StanceModifier {};
		class SuppressedEffect {};
		class UnitCheck {};
		class VehicleHandle {};
		class Waypointcheck {};
		class WepSupCheck {};		
	};
	class Danger
	{
		file = "modules\headless_ai\functions\PZAI\dangercauses";
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
	class Combat
	{
		file = "modules\headless_ai\functions\PZAI\combat";
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
		class ReGroup {};
		class SightAid {};
		class SuppressingShots {};
		class ThrowGrenade {};
		class WatchEnemy {};
	};
};
