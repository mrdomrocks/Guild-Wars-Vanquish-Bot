#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutResplendentMakuun()
	MoveTo(-16849, 15501)
	MoveTo(-18803, 14777)
	MoveTo(-18745, 13593)
	Move(-18700, 13593)
	WaitForLoad()
EndFunc

Func VQResplendentMakuun()
    If GetMapID() <> $ResplendentMakuun_Map And GetMapID() <> $ResplendentMakuun_Outpost  Then TravelTo($ResplendentMakuun_Outpost)   
    If GetMapID() = $ResplendentMakuun_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ResplendentMakuun_Map Then    
		
		Local $aWaypointsA[16][4] = [ [-17701, 8109, " ", $vqrange] _
		, [-15885, 7665, " ", $vqrange] _
		, [-16419, 4477, " ", $vqrange] _
		, [-16402, 2272, " ", $vqrange] _
		, [-19262, 200, " ", $vqrange] _
		, [-18716, -4185, " ", $vqrange] _
		, [-17994, -3970, " ", $vqrange] _
		, [-12598, -4863, " ", $vqrange] _
		, [-13611, -4848, " ", $vqrange] _
		, [-14056, -9746, " ", $vqrange] _
		, [-11013, -9635, " ", $vqrange] _
		, [-14957, -10793, " ", $vqrange] _
		, [-18340, -9773, " ", $vqrange] _
		, [-14715, -13232, " ", $vqrange] _
		, [-18685, -13650, " ", $vqrange] _
		, [-15944, -15648, " ", $vqrange] ]

		Local $aWaypointsB[77][4] = [ [-19002, -20048, " ", $vqrange] _
		, [-15343, -16486, " ", $vqrange] _
		, [-13811, -17871, " ", $vqrange] _
		, [-11973, -19446, " ", $vqrange] _
		, [-12619, -14359, " ", $vqrange] _
		, [-10322, -16019, " ", $vqrange] _
		, [-8872, -18276, " ", $vqrange] _
		, [-5363, -19927, " ", $vqrange] _
		, [-3864, -17956, " ", $vqrange] _
		, [-2838, -15312, " ", $vqrange] _
		, [-2898, -15010, " ", $vqrange] _
		, [-3132, -8979, " ", $vqrange] _
		, [-5143, -8950, " ", $vqrange] _
		, [-6916, -10421, " ", $vqrange] _
		, [-7858, -8475, " ", $vqrange] _
		, [-9005, -5492, " ", $vqrange] _
		, [-4034, -8252, " ", $vqrange] _
		, [585, -8447, " ", $vqrange] _
		, [4681, -7104, " ", $vqrange] _
		, [6744, -8005, " ", $vqrange] _
		, [6389, -13360, " ", $vqrange] _
		, [3261, -15583, " ", $vqrange] _
		, [-1478, -15323, " ", $vqrange] _
		, [3195, -16209, " ", $vqrange] _
		, [4925, -17911, " ", $vqrange] _
		, [8460, -17171, " ", $vqrange] _
		, [12934, -17199, " ", $vqrange] _
		, [12360, -18790, " ", $vqrange] _
		, [13760, -17896, " ", $vqrange] _
		, [15635, -18949, " ", $vqrange] _
		, [16144, -16148, " ", $vqrange] _
		, [18543, -13761, " ", $vqrange] _
		, [13110, -16319, " ", $vqrange] _
		, [18543, -13761, " ", $vqrange] _
		, [16304, -10588, " ", $vqrange] _
		, [12954, -8502, " ", $vqrange] _
		, [9789, -11516, " ", $vqrange] _
		, [12851, -7858, " ", $vqrange] _
		, [13978, -4769, " ", $vqrange] _
		, [11054, -1060, " ", $vqrange] _
		, [10597, 1199, " ", $vqrange] _
		, [9032, -382, " ", $vqrange] _
		, [7541, -2923, " ", $vqrange] _
		, [6567, -5532, " ", $vqrange] _
		, [9132, -507, " ", $vqrange] _
		, [9947, 1198, " ", $vqrange] _
		, [8090, 3722, " ", $vqrange] _
		, [4931, 5563, " ", $vqrange] _
		, [2441, 6670, " ", $vqrange] _
		, [1154, 8242, " ", $vqrange] _
		, [-758, 10763, " ", $vqrange] _
		, [-3731, 11135, " ", $vqrange] _
		, [-6254, 10195, " ", $vqrange] _
		, [-9290, 7534, " ", $vqrange] _
		, [-13431, 6944, " ", $vqrange] _
		, [-14798, 11127, " ", $vqrange] _
		, [-13064, 12584, " ", $vqrange] _
		, [-10201, 15420, " ", $vqrange] _
		, [-7791, 17036, " ", $vqrange] _
		, [-2872, 15522, " ", $vqrange] _
		, [-5246, 16091, " ", $vqrange] _
		, [-4478, 13725, " ", $vqrange] _
		, [-5686, 12010, " ", $vqrange] _
		, [-1814, 14204, " ", $vqrange] _
		, [1605, 14890, " ", $vqrange] _
		, [1891, 16396, " ", $vqrange] _
		, [1779, 14753, " ", $vqrange] _
		, [5341, 14758, " ", $vqrange] _
		, [7829, 12209, " ", $vqrange] _
		, [11402, 13324, " ", $vqrange] _
		, [12983, 14869, " ", $vqrange] _
		, [11262, 15564, " ", $vqrange] _
		, [9258, 10753, " ", $vqrange] _
		, [12061, 8423, " ", $vqrange] _
		, [12442, 7296, " ", $vqrange] _
		, [12225, 4691, " ", $vqrange] _
		, [10973, 1482, " ", $vqrange] ]
		
		Local $aWaypoints[93][4] = [ [-17701, 8109, " ", $vqrange] _
		, [-15885, 7665, " ", $vqrange] _
		, [-16419, 4477, " ", $vqrange] _
		, [-16402, 2272, " ", $vqrange] _
		, [-19262, 200, " ", $vqrange] _
		, [-18716, -4185, " ", $vqrange] _
		, [-17994, -3970, " ", $vqrange] _
		, [-12598, -4863, " ", $vqrange] _
		, [-13611, -4848, " ", $vqrange] _
		, [-14056, -9746, " ", $vqrange] _
		, [-11013, -9635, " ", $vqrange] _
		, [-14957, -10793, " ", $vqrange] _
		, [-18340, -9773, " ", $vqrange] _
		, [-14715, -13232, " ", $vqrange] _
		, [-18685, -13650, " ", $vqrange] _
		, [-15944, -15648, " ", $vqrange] _
		, [-19002, -20048, " ", $vqrange] _
		, [-15343, -16486, " ", $vqrange] _
		, [-13811, -17871, " ", $vqrange] _
		, [-11973, -19446, " ", $vqrange] _
		, [-12619, -14359, " ", $vqrange] _
		, [-10322, -16019, " ", $vqrange] _
		, [-8872, -18276, " ", $vqrange] _
		, [-5363, -19927, " ", $vqrange] _
		, [-3864, -17956, " ", $vqrange] _
		, [-2838, -15312, " ", $vqrange] _
		, [-2898, -15010, " ", $vqrange] _
		, [-3132, -8979, " ", $vqrange] _
		, [-5143, -8950, " ", $vqrange] _
		, [-6916, -10421, " ", $vqrange] _
		, [-7858, -8475, " ", $vqrange] _
		, [-9005, -5492, " ", $vqrange] _
		, [-4034, -8252, " ", $vqrange] _
		, [585, -8447, " ", $vqrange] _
		, [4681, -7104, " ", $vqrange] _
		, [6744, -8005, " ", $vqrange] _
		, [6389, -13360, " ", $vqrange] _
		, [3261, -15583, " ", $vqrange] _
		, [-1478, -15323, " ", $vqrange] _
		, [3195, -16209, " ", $vqrange] _
		, [4925, -17911, " ", $vqrange] _
		, [8460, -17171, " ", $vqrange] _
		, [12934, -17199, " ", $vqrange] _
		, [12360, -18790, " ", $vqrange] _
		, [13760, -17896, " ", $vqrange] _
		, [15635, -18949, " ", $vqrange] _
		, [16144, -16148, " ", $vqrange] _
		, [18543, -13761, " ", $vqrange] _
		, [13110, -16319, " ", $vqrange] _
		, [18543, -13761, " ", $vqrange] _
		, [16304, -10588, " ", $vqrange] _
		, [12954, -8502, " ", $vqrange] _
		, [9789, -11516, " ", $vqrange] _
		, [12851, -7858, " ", $vqrange] _
		, [13978, -4769, " ", $vqrange] _
		, [11054, -1060, " ", $vqrange] _
		, [10597, 1199, " ", $vqrange] _
		, [9032, -382, " ", $vqrange] _
		, [7541, -2923, " ", $vqrange] _
		, [6567, -5532, " ", $vqrange] _
		, [9132, -507, " ", $vqrange] _
		, [9947, 1198, " ", $vqrange] _
		, [8090, 3722, " ", $vqrange] _
		, [4931, 5563, " ", $vqrange] _
		, [2441, 6670, " ", $vqrange] _
		, [1154, 8242, " ", $vqrange] _
		, [-758, 10763, " ", $vqrange] _
		, [-3731, 11135, " ", $vqrange] _
		, [-6254, 10195, " ", $vqrange] _
		, [-9290, 7534, " ", $vqrange] _
		, [-13431, 6944, " ", $vqrange] _
		, [-14798, 11127, " ", $vqrange] _
		, [-13064, 12584, " ", $vqrange] _
		, [-10201, 15420, " ", $vqrange] _
		, [-7791, 17036, " ", $vqrange] _
		, [-2872, 15522, " ", $vqrange] _
		, [-5246, 16091, " ", $vqrange] _
		, [-4478, 13725, " ", $vqrange] _
		, [-5686, 12010, " ", $vqrange] _
		, [-1814, 14204, " ", $vqrange] _
		, [1605, 14890, " ", $vqrange] _
		, [1891, 16396, " ", $vqrange] _
		, [1779, 14753, " ", $vqrange] _
		, [5341, 14758, " ", $vqrange] _
		, [7829, 12209, " ", $vqrange] _
		, [11402, 13324, " ", $vqrange] _
		, [12983, 14869, " ", $vqrange] _
		, [11262, 15564, " ", $vqrange] _
		, [9258, 10753, " ", $vqrange] _
		, [12061, 8423, " ", $vqrange] _
		, [12442, 7296, " ", $vqrange] _
		, [12225, 4691, " ", $vqrange] _
		, [10973, 1482, " ", $vqrange] ]
		
		GoNearestNPCToCoords(-16952, 10390)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-18640, -16601)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc