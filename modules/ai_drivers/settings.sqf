//array containing vehicles that will have option to spawn AI driver in them
//#define VEHS []

//use line below to enable the module for all tracked vehicles in the mission
#define VEHS call {_vehs = []; {if (typeOf _x isKindOf 'rhsusf_m113_usarmy_M2_90' || typeOf _x isKindOf 'CUP_B_M60A3_USMC') then {_vehs pushBack _x};} foreach vehicles; _vehs;}
