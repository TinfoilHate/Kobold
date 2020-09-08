/*
 * Author: TinfoilHate
 *  Adding ambient fire to objects. Original script by MaddMatt for ARMA2.
 *
 * Arguments:
 *  0: UNIT <OBJECT> - Object the fire effect is attached to
 *  1: INTENSITY <INTEGER> - Intensity of fire effect (0.7 > 10)
 *  2: LIFECHECK <BOOLEAN> (OPTIONAL) - Only burn when UNIT is not alive
 *  3: FADE <BOOLEAN> (OPTIONAL) - Fade over time, adjusting for rain
 *  4: DAMAGE <INTEGER> (OPTIONAL) - Damage caused by flames
 *  5: TIME <INTEGER> (OPTIONAL) - Effect start time (typically default, aka 0)
 *
 * Return Value:
 *  Nil
 *
 * Examples:
 *  [OBJECT, 10] call kobld_ambient_fnc_burn; - Large, ever-burning fire
 *  [OBJECT, 5] call kobld_ambient_fnc_burn; - Medium, ever-burning fire
 *  [OBJECT, 10, false, true] call kobld_ambient_fnc_burn; - Large, fades over time
 *  [OBJECT, 5, true, true] call kobld_ambient_fnc_burn; - Medium, burns only when UNIT is not alive
 *  [OBJECT, 3, false, true] call kobld_ambient_fnc_burn; - Smoke only (3 or less INTENSITY)
 *
 * Public: Yes
*/

#include "..\script_component.hpp"

params ["_vehicle","_intensity",["_lifecheck",false],["_fade",false],["_damage",1],["_time",0]];

_timeDifference = CBA_missionTime - _time;

if (_fade) then {
	_intensity = _intensity - (_timeDifference * 0.02 / 3);
};

private ["_sound"];
private ["_flame","_smoke","_light"];

if (!isDedicated && hasInterface) then {
	_flame = "#particlesource" createVehicleLocal getPosATL _vehicle;
	_flame attachTo [_vehicle,[0,0,0],"destructionEffect2"];
	_flame setDropInterval 0.02;
	_flame setParticleFire [0.6 * _damage, 0.25 * _damage, 0.1];

	_smoke = "#particlesource" createVehicleLocal getPosATL _vehicle;
	_smoke attachTo [_vehicle,[0,0,0],"destructionEffect1"];

	_light = "#lightpoint" createVehicleLocal getPosATL _vehicle;
	_light setLightBrightness 1.0;
	_light setLightColor [1,0.5,0.4];
	_light setLightAmbient [0.8,0.6,2];
	_light setLightIntensity (50 + 400 * _intensity);
	_light setLightAttenuation [0,0,0,1];
	_light setLightDayLight false;

	_light lightAttachObject [_vehicle, [0,0,0]];

	_vehicle setVariable [QGVAR(intensity),_intensity, false];
};

private _sound = objNull;

if (isServer) then {
	_sound = createSoundSource ["Sound_Fire", getPosATL _vehicle, [], 0];
	_sound attachTo [_vehicle,[0,0,0],"destructionEffect1"];
};

[{
	params ["_args","_handle"];

	_args params ["_vehicle","_lifecheck","_fade","_sound","_sources"];
	_sources params ["_flame","_smoke","_light"];

	private _dropHandle = false;

	if (isNull _vehicle) then {
		_dropHandle = true;
	} else {
		if ((!isDedicated && hasInterface) && {!(alive _vehicle && _lifecheck)} && {getPos _vehicle select 2 > -2.5}) then {
			private _intensity = _vehicle getVariable [QGVAR(intensity),0];

			if (_intensity < 0.7) then {
				_dropHandle = true;
			};

			if (_intensity > 3) then {
				_flame setParticleParams [
					["\a3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32],
					"", "Billboard", 1, 0.3*_intensity,
					"destructionEffect2",[0, 0, 0.17*_intensity],
					0, 10, 7.9, 1, [0.3*_intensity, 0.05*_intensity],
					[[1,1,1,-0], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,-1], [1,1,1,0]],
					[0.5, 1], 1, 0, "", "", _vehicle
				];

				_flame setParticleRandom [0.04*_intensity, [0.1*_intensity, 0.1*_intensity, 0.1*_intensity], [0.05*_intensity, 0.05*_intensity, 0.05*_intensity], 0, 0.06*_intensity, [0, 0, 0, 0], 0, 0];


				private _cl = 0.8 / _intensity;

				_smoke setDropInterval (0.02 * _intensity);

				_smoke setParticleParams [
					["\a3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48],
					"",
					"Billboard",
					1,
					3 * _intensity, //Lifetime
					"destructionEffect1",
					[0, 0, 1.5 * _intensity],
					0,
					0.05,
					0.04,
					0.05,
					[0.5 + 0.5 * _intensity, 3 + 3 * _intensity],
					[
						[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],
						[_cl, _cl, _cl, 1],
						[0.05 + _cl, 0.05 + _cl, 0.05 + _cl, 0.9],
						[0.1 + _cl, 0.1 + _cl, 0.1+_cl, 0.6],
						[0.2 + _cl, 0.2 + _cl, 0.2+_cl, 0.3],
						[1,1,1, 0]
					],
					[0.8,0.3,0.25],
					1,
					0,
					"",
					"",
					_vehicle
				];

				_smoke setParticleRandom [0.7*_intensity, [1 - _intensity/10,1 - _intensity/10,1 - _intensity/10], [0.2*_intensity, 0.2*_intensity, 0.05*_intensity], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

				_light setLightBrightness (_intensity / 15);

				if (_fade) then {
					_intensity = (_intensity - 0.02) - (rain / 10);
				};
			};

			if (_intensity <= 3 && {!(isNull _flame)}) then {
				deleteVehicle _flame;
			};

			if (_intensity <= 3 && {_intensity >= 0.7}) then {
				private _cl = 0.8 / _intensity;

				_smoke setDropInterval (0.01 + 0.02*_intensity);
				_smoke setParticleParams [
					["\a3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48],
					"","Billboard",1, 3*_intensity,
					"destructionEffect1",[0, 0, 0.5*_intensity],
					0, 0.05, 0.04, 0.05, [0.5*_intensity, 3*_intensity],
					[[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 1],[_cl, _cl, _cl, 1],
					[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.9],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.6],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.3], [1,1,1, 0]],
					[0.8,0.3,0.25], 1, 0, "", "", _vehicle
				];

				_smoke setParticleRandom [0.7*_intensity, [1 - _intensity/10,1 - _intensity/10,1 - _intensity/10], [0.2*_intensity, 0.2*_intensity, 0.05*_intensity], 0, 0.3, [0.05, 0.05, 0.05, 0], 0, 0];

				_light setLightBrightness (_intensity/15);

				if (_fade) then {
					_intensity = _intensity - 0.02 - rain/10;
				};
			};

			_vehicle setVariable [QGVAR(intensity),_intensity, false];
		};
	};

	if (_dropHandle) then {
		if (isServer) then {
			deletevehicle _sound;
		};

		if (!isDedicated && hasInterface) then {
			deleteVehicle _smoke;
			deleteVehicle _light;

			if (!isNull _flame) then {
				deleteVehicle _flame;
			};
		};

		[_handle] call CBA_fnc_removePerFrameHandler;
	};
}, 3, [_vehicle, _lifecheck, _fade, _sound, [_flame, _smoke, _light]]] call CBA_fnc_addPerFrameHandler;