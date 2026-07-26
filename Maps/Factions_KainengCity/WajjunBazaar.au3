#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1
Func GoOutWajjunBazaar()
	MoveTo(12772, 16449)
	MoveTo(11677, 15441)
	MoveTo(11626, 15390)
	Move(11526, 15290)
	WaitForLoad()
EndFunc

Func VQWajjunBazaar()
    If GetMapID() <> $WajjunBazaar_Map And GetMapID() <> $WajjunBazaar_Outpost  Then TravelTo($WajjunBazaar_Outpost)   
    If GetMapID() = $WajjunBazaar_Outpost then
       GoOut() 

    EndIf

	If GetMapID() = $WajjunBazaar_Map Then    

		Local $aWaypoints[92][4] = [ [8354, 14196, " ", $vqrange] _
		, [7286, 14564, " ", $vqrange] _
		, [4151, 13003, " ", $vqrange] _
		, [4230, 11347, " ", $vqrange] _
		, [4380, 9475, " ", $vqrange] _
		, [3681, 12635, " ", $vqrange] _
		, [-100, 12456, " ", $vqrange] _
		, [1249, 11122, " ", $vqrange] _
		, [-3956, 12526, " ", $vqrange] _
		, [-3335, 11151, " ", $vqrange] _
		, [-3309, 14824, " ", $vqrange] _
		, [-4597, 17744, " ", $vqrange] _
		, [-7218, 17836, " ", $vqrange] _
		, [-8541, 21542, " ", $vqrange] _
		, [-8022, 22218, " ", $vqrange] _
		, [-5304, 22163, " ", $vqrange] _
		, [-947, 22427, " ", $vqrange] _
		, [-817, 19498, " ", $vqrange] _
		, [-1272, 17489, " ", $vqrange] _
		, [1043, 16803, " ", $vqrange] _
		, [1922, 15989, " ", $vqrange] _
		, [-3362, 16599, " ", $vqrange] _
		, [-7308, 15633, " ", $vqrange] _
		, [-9077, 15192, " ", $vqrange] _
		, [-10754, 17067, " ", $vqrange] _
		, [-9139, 15256, " ", $vqrange] _
		, [-10273, 18299, " ", $vqrange] _
		, [-14164, 21939, " ", $vqrange] _
		, [-15415, 21582, " ", $vqrange] _
		, [-12248, 19196, " ", $vqrange] _
		, [-8851, 17131, " ", $vqrange] _
		, [-7647, 14543, " ", $vqrange] _
		, [-7917, 15987, " ", $vqrange] _
		, [-7637, 12742, " ", $vqrange] _
		, [-6223, 12164, " ", $vqrange] _
		, [-7408, 8226, " ", $vqrange] _
		, [-7319, 7500, " ", $vqrange] _
		, [-9779, 6159, " ", $vqrange] _
		, [-9045, 3526, " ", $vqrange] _
		, [-8997, -634, " ", $vqrange] _
		, [-11360, -2518, " ", $vqrange] _
		, [-13709, -4282, " ", $vqrange] _
		, [-9463, -5265, " ", $vqrange] _
		, [-7407, -5878, " ", $vqrange] _
		, [-2430, -6919, " ", $vqrange] _
		, [-53, -8389, " ", $vqrange] _
		, [-848, -8761, " ", $vqrange] _
		, [-896, -10342, " ", $vqrange] _
		, [-733, -12624, " ", $vqrange] _
		, [-943, -13861, " ", $vqrange] _
		, [-1726, -16531, " ", $vqrange] _
		, [1065, -16733, " ", $vqrange] _
		, [3926, -18635, " ", $vqrange] _
		, [2448, -14176, " ", $vqrange] _
		, [6318, -14515, " ", $vqrange] _
		, [6316, -9449, " ", $vqrange] _
		, [8103, -8248, " ", $vqrange] _
		, [6316, -9449, " ", $vqrange] _
		, [6318, -14515, " ", $vqrange] _
		, [9494, -14721, " ", $vqrange] _
		, [10105, -11854, " ", $vqrange] _
		, [11794, -14419, " ", $vqrange] _
		, [16045, -15012, " ", $vqrange] _
		, [14626, -11520, " ", $vqrange] _
		, [14223, -7132, " ", $vqrange] _
		, [12864, -4928, " ", $vqrange] _
		, [14381, -1771, " ", $vqrange] _
		, [15492, 1056, " ", $vqrange] _
		, [14986, 3735, " ", $vqrange] _
		, [15025, 4115, " ", $vqrange] _
		, [14996, 6873, " ", $vqrange] _
		, [15206, 8810, " ", $vqrange] _
		, [15563, 9301, " ", $vqrange] _
		, [14017, 11597, " ", $vqrange] _
		, [11905, 10953, " ", $vqrange] _
		, [10679, 11164, " ", $vqrange] _
		, [8266, 11925, " ", $vqrange] _
		, [8044, 7853, " ", $vqrange] _
		, [5035, 7498, " ", $vqrange] _
		, [5023, 2568, " ", $vqrange] _
		, [5042, 101, " ", $vqrange] _
		, [2757, -2183, " ", $vqrange] _
		, [-222, -2349, " ", $vqrange] _
		, [-3196, -2367, " ", $vqrange] _
		, [-2662, 2586, " ", $vqrange] _
		, [390, 2601, " ", $vqrange] _
		, [953, 1344, " ", $vqrange] _
		, [2712, 1646, " ", $vqrange] _
		, [6754, 2549, " ", $vqrange] _
		, [7500, 2598, " ", $vqrange] _
		, [9067, -740, " ", $vqrange] _
		, [11398, 322, " ", $vqrange]]

		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

	EndIf
EndFunc

