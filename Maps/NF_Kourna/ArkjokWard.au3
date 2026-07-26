#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutArkjokWard()
	MoveTo(-470, -3677)
	MoveTo(2061, -3136)
	MoveTo(2522, 440)
	MoveTo(4316, 811)
	Move(4400, 837)
	WaitForLoad()
EndFunc

Func VQArkjokWard()
    If GetMapID() <> $ArkjokWard_Map And GetMapID() <> $ArkjokWard_Outpost  Then TravelTo($ArkjokWard_Outpost)   
    If GetMapID() = $ArkjokWard_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ArkjokWard_Map Then    
		
		Local $aWaypointsA[17][4] = [ [-17286, -15368, " ", $vqrange] _		
		, [-16560, -17762, " ", $vqrange] _
		, [-14801, -17412, " ", $vqrange] _
		, [-12325, -17841, " ", $vqrange] _
		, [-11293, -16395, " ", $vqrange] _
		, [-11509, -18594, " ", $vqrange] _
		, [-10940, -14902, " ", $vqrange] _
		, [-9357, -14797, " ", $vqrange] _
		, [-7850, -15374, " ", $vqrange] _
		, [-5212, -13975, " ", $vqrange] _
		, [-2039, -12689, " ", $vqrange] _
		, [-1542, -15349, " ", $vqrange] _
		, [1552, -15360, " ", $vqrange] _
		, [2331, -12527, " ", $vqrange] _
		, [-1466, -9653, " ", $vqrange] _
		, [-3345, -10178, " ", $vqrange] _
		, [-5372, -10061, " ", $vqrange] ]

		Local $aWaypointsB[12][4] = [ [-1331, -7498, " ", $vqrange] _		
		, [444, -7480, " ", $vqrange] _
		, [2881, -6484, " ", $vqrange] _
		, [4581, -6855, " ", $vqrange] _
		, [6229, -6937, " ", $vqrange] _
		, [7503, -5142, " ", $vqrange] _
		, [6202, -9389, " ", $vqrange] _
		, [8280, -11103, " ", $vqrange] _
		, [11055, -11333, " ", $vqrange] _
		, [11933, -12685, " ", $vqrange] _
		, [12473, -13369, " ", $vqrange] _
		, [15418, -13423, " ", $vqrange] ]

		Local $aWaypointsC[35][4] = [ [15036, -13387, " ", $vqrange] _			
		, [11680, -12333, " ", $vqrange] _
		, [11862, -10506, " ", $vqrange] _
		, [10883, -8929, " ", $vqrange] _
		, [12504, -2916, " ", $vqrange] _
		, [13769, -1575, " ", $vqrange] _
		, [15966, 1203, " ", $vqrange] _
		, [18508, 3320, " ", $vqrange] _
		, [17790, 7541, " ", $vqrange] _
		, [14806, 9517, " ", $vqrange] _
		, [12449, 8840, " ", $vqrange] _
		, [11896, 7006, " ", $vqrange] _
		, [14606, 5702, " ", $vqrange] _
		, [10041, 9096, " ", $vqrange] _
		, [9426, 13637, " ", $vqrange] _
		, [13252, 13383, " ", $vqrange] _
		, [14411, 16038, " ", $vqrange] _
		, [18626, 14204, " ", $vqrange] _
		, [14014, 15828, " ", $vqrange] _
		, [10082, 18497, " ", $vqrange] _
		, [6546, 17977, " ", $vqrange] _
		, [5799, 18379, " ", $vqrange] _
		, [4178, 14274, " ", $vqrange] _
		, [3114, 8623, " ", $vqrange] _
		, [1525, 6527, " ", $vqrange] _
		, [-950, 3180, " ", $vqrange] _
		, [-3004, 6119, " ", $vqrange] _
		, [-4442, 7537, " ", $vqrange] _
		, [-4850, 7853, " ", $vqrange] _
		, [-3932, 9206, " ", $vqrange] _
		, [-954, 9168, " ", $vqrange] _
		, [-4639, 11802, " ", $vqrange] _
		, [-6291, 13139, " ", $vqrange] _
		, [-7325, 16782, " ", $vqrange] _
		, [-11486, 12193, " ", $vqrange] ]

		Local $aWaypointsD[27][4] = [ [-10168, 8073, " ", $vqrange] _		
		, [-7471, 7122, " ", $vqrange] _
		, [-5977, 6169, " ", $vqrange] _
		, [-7121, 3315, " ", $vqrange] _
		, [-6101, 2335, " ", $vqrange] _
		, [-5869, 631, " ", $vqrange] _
		, [-5695, 64, " ", $vqrange] _
		, [-4049, -220, " ", $vqrange] _
		, [-3675, -2968, " ", $vqrange] _
		, [-7668, -2932, " ", $vqrange] _
		, [-7090, -1569, " ", $vqrange] _
		, [-12117, 1914, " ", $vqrange] _
		, [-13091, 3945, " ", $vqrange] _
		, [-11463, 170, " ", $vqrange] _
		, [-8665, -3275, " ", $vqrange] _
		, [-9162, -5558, " ", $vqrange] _
		, [-14623, -3693, " ", $vqrange] _
		, [-17041, -4153, " ", $vqrange] _
		, [-13135, -10108, " ", $vqrange] _
		, [-18395, -11448, " ", $vqrange] _
		, [-16660, -8013, " ", $vqrange] _
		, [-10450, -9829, " ", $vqrange] _
		, [-10351, -11896, " ", $vqrange] _
		, [-6346, -8444, " ", $vqrange] _
		, [504, -7348, " ", $vqrange] _
		, [1574, -4029, " ", $vqrange] _
		, [6256, -1017, " ", $vqrange] ]
		
		Local $aWaypoints[91][4] = [ [-17286, -15368, " ", $vqrange] _		
		, [-16560, -17762, " ", $vqrange] _
		, [-14801, -17412, " ", $vqrange] _
		, [-12325, -17841, " ", $vqrange] _
		, [-11293, -16395, " ", $vqrange] _
		, [-11509, -18594, " ", $vqrange] _
		, [-10940, -14902, " ", $vqrange] _
		, [-9357, -14797, " ", $vqrange] _
		, [-7850, -15374, " ", $vqrange] _
		, [-5212, -13975, " ", $vqrange] _
		, [-2039, -12689, " ", $vqrange] _
		, [-1542, -15349, " ", $vqrange] _
		, [1552, -15360, " ", $vqrange] _
		, [2331, -12527, " ", $vqrange] _
		, [-1466, -9653, " ", $vqrange] _
		, [-3345, -10178, " ", $vqrange] _
		, [-5372, -10061, " ", $vqrange] _
		, [-1331, -7498, " ", $vqrange] _		
		, [444, -7480, " ", $vqrange] _
		, [2881, -6484, " ", $vqrange] _
		, [4581, -6855, " ", $vqrange] _
		, [6229, -6937, " ", $vqrange] _
		, [7503, -5142, " ", $vqrange] _
		, [6202, -9389, " ", $vqrange] _
		, [8280, -11103, " ", $vqrange] _
		, [11055, -11333, " ", $vqrange] _
		, [11933, -12685, " ", $vqrange] _
		, [12473, -13369, " ", $vqrange] _
		, [15418, -13423, " ", $vqrange] _
		, [15036, -13387, " ", $vqrange] _			
		, [11680, -12333, " ", $vqrange] _
		, [11862, -10506, " ", $vqrange] _
		, [10883, -8929, " ", $vqrange] _
		, [12504, -2916, " ", $vqrange] _
		, [13769, -1575, " ", $vqrange] _
		, [15966, 1203, " ", $vqrange] _
		, [18508, 3320, " ", $vqrange] _
		, [17790, 7541, " ", $vqrange] _
		, [14806, 9517, " ", $vqrange] _
		, [12449, 8840, " ", $vqrange] _
		, [11896, 7006, " ", $vqrange] _
		, [14606, 5702, " ", $vqrange] _
		, [10041, 9096, " ", $vqrange] _
		, [9426, 13637, " ", $vqrange] _
		, [13252, 13383, " ", $vqrange] _
		, [14411, 16038, " ", $vqrange] _
		, [18626, 14204, " ", $vqrange] _
		, [14014, 15828, " ", $vqrange] _
		, [10082, 18497, " ", $vqrange] _
		, [6546, 17977, " ", $vqrange] _
		, [5799, 18379, " ", $vqrange] _
		, [4178, 14274, " ", $vqrange] _
		, [3114, 8623, " ", $vqrange] _
		, [1525, 6527, " ", $vqrange] _
		, [-950, 3180, " ", $vqrange] _
		, [-3004, 6119, " ", $vqrange] _
		, [-4442, 7537, " ", $vqrange] _
		, [-4850, 7853, " ", $vqrange] _
		, [-3932, 9206, " ", $vqrange] _
		, [-954, 9168, " ", $vqrange] _
		, [-4639, 11802, " ", $vqrange] _
		, [-6291, 13139, " ", $vqrange] _
		, [-7325, 16782, " ", $vqrange] _
		, [-11486, 12193, " ", $vqrange] _
		, [-10168, 8073, " ", $vqrange] _		
		, [-7471, 7122, " ", $vqrange] _
		, [-5977, 6169, " ", $vqrange] _
		, [-7121, 3315, " ", $vqrange] _
		, [-6101, 2335, " ", $vqrange] _
		, [-5869, 631, " ", $vqrange] _
		, [-5695, 64, " ", $vqrange] _
		, [-4049, -220, " ", $vqrange] _
		, [-3675, -2968, " ", $vqrange] _
		, [-7668, -2932, " ", $vqrange] _
		, [-7090, -1569, " ", $vqrange] _
		, [-12117, 1914, " ", $vqrange] _
		, [-13091, 3945, " ", $vqrange] _
		, [-11463, 170, " ", $vqrange] _
		, [-8665, -3275, " ", $vqrange] _
		, [-9162, -5558, " ", $vqrange] _
		, [-14623, -3693, " ", $vqrange] _
		, [-17041, -4153, " ", $vqrange] _
		, [-13135, -10108, " ", $vqrange] _
		, [-18395, -11448, " ", $vqrange] _
		, [-16660, -8013, " ", $vqrange] _
		, [-10450, -9829, " ", $vqrange] _
		, [-10351, -11896, " ", $vqrange] _
		, [-6346, -8444, " ", $vqrange] _
		, [504, -7348, " ", $vqrange] _
		, [1574, -4029, " ", $vqrange] _
		, [6256, -1017, " ", $vqrange] ]
			
		GoNearestNPCToCoords(-17266, -12589)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-4249, -8328)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(16190, -16132)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-12883, 11741)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc
