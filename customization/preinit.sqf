////////////////////////////////////////////////////////////////////
// MISSION-SPECIFIC CUSTOM PREINIT /////////////////////////////////
////////////////////////////////////////////////////////////////////
FW_RespawnTicketsWest = 0;
FW_RespawnTicketsEast = 0;
FW_RespawnTicketsInd = 0;
FW_RespawnTicketsCiv = 0;

FW_WaveSizeWest = 0;
FW_WaveSizeEast = 0;
FW_WaveSizeInd = 0;
FW_WaveSizeCiv = 0;

[{!isNil "FW_RespawnTickets"}, {FW_RespawnTickets = 0}] call CBA_fnc_waitUntilAndExecute;
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

if (is3den) then {

};

kobld_fnc_setFace = {
	params ["_unit"];

	private _faceEast = ["WhiteHead_01","WhiteHead_02","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","LivonianHead_5","WhiteHead_25","LivonianHead_2","LivonianHead_7","WhiteHead_27","WhiteHead_28","LivonianHead_3","RussianHead_3","LivonianHead_1","LivonianHead_10","WhiteHead_32","LivonianHead_4","WhiteHead_23"];

	private _faceWest = ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08","AfricanHead_01","AfricanHead_02","AfricanHead_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"];

	switch (side _unit) do {
		case east: {
			private _face = selectRandom _faceEast;

			[_unit, _face] remoteExec ["setFace", 0, _unit];
		};

		default {
			private _face = selectRandom (_faceEast + _faceWest);

			[_unit, _face] remoteExec ["setFace", 0, _unit];
		};
	};
};