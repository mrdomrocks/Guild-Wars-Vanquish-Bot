#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutPlainsofJarin()
	MoveTo(-9259, 16725)
	Move(-9300, 17000)
	WaitForLoad()
EndFunc

Func VQPlainsofJarin()
    If GetMapID() <> $PlainsofJarin_Map And GetMapID() <> $PlainsofJarin_Outpost  Then TravelTo($PlainsofJarin_Outpost)   
    If GetMapID() = $PlainsofJarin_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $PlainsofJarin_Map Then    	

		Local $aWaypointsA[14][4] = [ [15474, 855, " ", $vqrange] _		
		, [12657, -3190, " ", $vqrange] _
		, [10998, -3788, " ", $vqrange] _
		, [9517, -9223, " ", $vqrange] _
		, [9225, -12080, " ", $vqrange] _
		, [7371, -13130, " ", $vqrange] _
		, [4658, -11377, " ", $vqrange] _
		, [4348, -9673, " ", $vqrange] _
		, [967, -8290, " ", $vqrange] _
		, [-376, -10837, " ", $vqrange] _
		, [1284, -4833, " ", $vqrange] _
		, [2185, -3214, " ", $vqrange] _
		, [2798, -1086, " ", $vqrange] _
		, [658, -132, " ", $vqrange] ]


		Local $aWaypointsB[33][4] = [ [-1167, -2506, " ", $vqrange] _		
		, [56, -3581, " ", $vqrange] _
		, [1205, -4359, " ", $vqrange] _
		, [-2476, -4365, " ", $vqrange] _
		, [-4331, -4247, " ", $vqrange] _
		, [-4441, -4299, " ", $vqrange] _
		, [-6103, -7388, " ", $vqrange] _
		, [-6831, -5191, " ", $vqrange] _
		, [-7944, -9190, " ", $vqrange] _
		, [-7865, -10152, " ", $vqrange] _
		, [-8603, -11971, " ", $vqrange] _
		, [-9227, -10116, " ", $vqrange] _
		, [-10365, -11258, " ", $vqrange] _
		, [-11918, -8958, " ", $vqrange] _
		, [-8778, -12778, " ", $vqrange] _
		, [-11027, -12618, " ", $vqrange] _
		, [-14433, -12129, " ", $vqrange] _
		, [-15663, -13366, " ", $vqrange] _
		, [-16660, -10345, " ", $vqrange] _
		, [-19810, -8547, " ", $vqrange] _
		, [-18724, -4342, " ", $vqrange] _
		, [-15496, -6159, " ", $vqrange] _
		, [-10988, -6357, " ", $vqrange] _
		, [-7066, -5661, " ", $vqrange] _
		, [-6697, -1569, " ", $vqrange] _
		, [-7505, -67, " ", $vqrange] _
		, [-10239, -83, " ", $vqrange] _
		, [-12738, -2447, " ", $vqrange] _
		, [-12854, 2247, " ", $vqrange] _
		, [-12825, 2951, " ", $vqrange] _
		, [-10480, 1934, " ", $vqrange] _
		, [-15741, -202, " ", $vqrange] _
		, [-16660, -2566, " ", $vqrange] ]

		Local $aWaypointsC[57][4] = [ [-19832, 4057, " ", $vqrange] _	
		, [-19542, 6489, " ", $vqrange] _
		, [-19290, 8248, " ", $vqrange] _
		, [-17723, 11309, " ", $vqrange] _
		, [-15560, 14412, " ", $vqrange] _
		, [-14549, 13487, " ", $vqrange] _
		, [-14523, 11676, " ", $vqrange] _
		, [-15615, 8992, " ", $vqrange] _
		, [-13320, 8133, " ", $vqrange] _
		, [-11479, 6381, " ", $vqrange] _
		, [-11044, 10663, " ", $vqrange] _
		, [-12638, 13346, " ", $vqrange] _
		, [-14239, 17574, " ", $vqrange] _
		, [-13482, 19292, " ", $vqrange] _
		, [-8697, 18044, " ", $vqrange] _
		, [-8216, 14896, " ", $vqrange] _
		, [-6892, 15546, " ", $vqrange] _
		, [-8086, 11741, " ", $vqrange] _
		, [-6242, 14401, " ", $vqrange] _
		, [-5444, 16782, " ", $vqrange] _
		, [-4527, 19163, " ", $vqrange] _
		, [-2393, 19037, " ", $vqrange] _
		, [-2972, 15434, " ", $vqrange] _
		, [1916, 14760, " ", $vqrange] _
		, [3927, 15444, " ", $vqrange] _
		, [5118, 14719, " ", $vqrange] _
		, [8896, 17446, " ", $vqrange] _
		, [10262, 15670, " ", $vqrange] _
		, [7740, 11712, " ", $vqrange] _
		, [8373, 10442, " ", $vqrange] _
		, [10215, 11152, " ", $vqrange] _
		, [12568, 11719, " ", $vqrange] _
		, [13922, 12790, " ", $vqrange] _
		, [14639, 9192, " ", $vqrange] _
		, [15556, 7067, " ", $vqrange] _
		, [14312, 6369, " ", $vqrange] _
		, [12906, 7376, " ", $vqrange] _
		, [14193, 3453, " ", $vqrange] _
		, [12609, 2514, " ", $vqrange] _
		, [10721, 1758, " ", $vqrange] _
		, [8698, 651, " ", $vqrange] _
		, [7792, -120, " ", $vqrange] _
		, [6414, -3313, " ", $vqrange] _
		, [6170, -5356, " ", $vqrange] _
		, [6781, -8526, " ", $vqrange] _
		, [5002, -3392, " ", $vqrange] _
		, [3593, -512, " ", $vqrange] _
		, [4701, 1264, " ", $vqrange] _
		, [6879, 2184, " ", $vqrange] _
		, [6365, 6035, " ", $vqrange] _
		, [5966, 8714, " ", $vqrange] _
		, [2655, 8684, " ", $vqrange] _
		, [1486, 3095, " ", $vqrange] _
		, [-4, 1649, " ", $vqrange] _
		, [-6132, 1686, " ", $vqrange] _
		, [-8150, 4112, " ", $vqrange] _
		, [-8243, 8285, " ", $vqrange] ]
		
		Local $aWaypoints[104][4] = [ [15474, 855, " ", $vqrange] _		
		, [12657, -3190, " ", $vqrange] _
		, [10998, -3788, " ", $vqrange] _
		, [9517, -9223, " ", $vqrange] _
		, [9225, -12080, " ", $vqrange] _
		, [7371, -13130, " ", $vqrange] _
		, [4658, -11377, " ", $vqrange] _
		, [4348, -9673, " ", $vqrange] _
		, [967, -8290, " ", $vqrange] _
		, [-376, -10837, " ", $vqrange] _
		, [1284, -4833, " ", $vqrange] _
		, [2185, -3214, " ", $vqrange] _
		, [2798, -1086, " ", $vqrange] _
		, [658, -132, " ", $vqrange] _
		, [-1167, -2506, " ", $vqrange] _		
		, [56, -3581, " ", $vqrange] _
		, [1205, -4359, " ", $vqrange] _
		, [-2476, -4365, " ", $vqrange] _
		, [-4331, -4247, " ", $vqrange] _
		, [-4441, -4299, " ", $vqrange] _
		, [-6103, -7388, " ", $vqrange] _
		, [-6831, -5191, " ", $vqrange] _
		, [-7944, -9190, " ", $vqrange] _
		, [-7865, -10152, " ", $vqrange] _
		, [-8603, -11971, " ", $vqrange] _
		, [-9227, -10116, " ", $vqrange] _
		, [-10365, -11258, " ", $vqrange] _
		, [-11918, -8958, " ", $vqrange] _
		, [-8778, -12778, " ", $vqrange] _
		, [-11027, -12618, " ", $vqrange] _
		, [-14433, -12129, " ", $vqrange] _
		, [-15663, -13366, " ", $vqrange] _
		, [-16660, -10345, " ", $vqrange] _
		, [-19810, -8547, " ", $vqrange] _
		, [-18724, -4342, " ", $vqrange] _
		, [-15496, -6159, " ", $vqrange] _
		, [-10988, -6357, " ", $vqrange] _
		, [-7066, -5661, " ", $vqrange] _
		, [-6697, -1569, " ", $vqrange] _
		, [-7505, -67, " ", $vqrange] _
		, [-10239, -83, " ", $vqrange] _
		, [-12738, -2447, " ", $vqrange] _
		, [-12854, 2247, " ", $vqrange] _
		, [-12825, 2951, " ", $vqrange] _
		, [-10480, 1934, " ", $vqrange] _
		, [-15741, -202, " ", $vqrange] _
		, [-16660, -2566, " ", $vqrange] _
		, [-19832, 4057, " ", $vqrange] _	
		, [-19542, 6489, " ", $vqrange] _
		, [-19290, 8248, " ", $vqrange] _
		, [-17723, 11309, " ", $vqrange] _
		, [-15560, 14412, " ", $vqrange] _
		, [-14549, 13487, " ", $vqrange] _
		, [-14523, 11676, " ", $vqrange] _
		, [-15615, 8992, " ", $vqrange] _
		, [-13320, 8133, " ", $vqrange] _
		, [-11479, 6381, " ", $vqrange] _
		, [-11044, 10663, " ", $vqrange] _
		, [-12638, 13346, " ", $vqrange] _
		, [-14239, 17574, " ", $vqrange] _
		, [-13482, 19292, " ", $vqrange] _
		, [-8697, 18044, " ", $vqrange] _
		, [-8216, 14896, " ", $vqrange] _
		, [-6892, 15546, " ", $vqrange] _
		, [-8086, 11741, " ", $vqrange] _
		, [-6242, 14401, " ", $vqrange] _
		, [-5444, 16782, " ", $vqrange] _
		, [-4527, 19163, " ", $vqrange] _
		, [-2393, 19037, " ", $vqrange] _
		, [-2972, 15434, " ", $vqrange] _
		, [1916, 14760, " ", $vqrange] _
		, [3927, 15444, " ", $vqrange] _
		, [5118, 14719, " ", $vqrange] _
		, [8896, 17446, " ", $vqrange] _
		, [10262, 15670, " ", $vqrange] _
		, [7740, 11712, " ", $vqrange] _
		, [8373, 10442, " ", $vqrange] _
		, [10215, 11152, " ", $vqrange] _
		, [12568, 11719, " ", $vqrange] _
		, [13922, 12790, " ", $vqrange] _
		, [14639, 9192, " ", $vqrange] _
		, [15556, 7067, " ", $vqrange] _
		, [14312, 6369, " ", $vqrange] _
		, [12906, 7376, " ", $vqrange] _
		, [14193, 3453, " ", $vqrange] _
		, [12609, 2514, " ", $vqrange] _
		, [10721, 1758, " ", $vqrange] _
		, [8698, 651, " ", $vqrange] _
		, [7792, -120, " ", $vqrange] _
		, [6414, -3313, " ", $vqrange] _
		, [6170, -5356, " ", $vqrange] _
		, [6781, -8526, " ", $vqrange] _
		, [5002, -3392, " ", $vqrange] _
		, [3593, -512, " ", $vqrange] _
		, [4701, 1264, " ", $vqrange] _
		, [6879, 2184, " ", $vqrange] _
		, [6365, 6035, " ", $vqrange] _
		, [5966, 8714, " ", $vqrange] _
		, [2655, 8684, " ", $vqrange] _
		, [1486, 3095, " ", $vqrange] _
		, [-4, 1649, " ", $vqrange] _
		, [-6132, 1686, " ", $vqrange] _
		, [-8150, 4112, " ", $vqrange] _
		, [-8243, 8285, " ", $vqrange] ]
	
		
		GoNearestNPCToCoords(18460, 1001)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-1261, 3162)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-17677, 3306)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsC)
		
		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc
