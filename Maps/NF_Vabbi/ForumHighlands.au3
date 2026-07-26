#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutForumHighlands()
	MoveTo(4572, -4533)
	Move(4772, -4533)
	WaitForLoad()
EndFunc

Func VQForumHighlands()
    If GetMapID() <> $ForumHighlands_Map And GetMapID() <> $ForumHighlands_Outpost  Then TravelTo($ForumHighlands_Outpost)   
    If GetMapID() = $ForumHighlands_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ForumHighlands_Map Then    
		
		Local $aWaypointsA[9][4] = [ [-22919, 12238, " ", $vqrange] _
		, [-18473, 9902, " ", $vqrange] _
		, [-16006, 12724, " ", $vqrange] _
		, [-12803, 14578, " ", $vqrange] _
		, [-11163, 14215, " ", $vqrange] _
		, [-10841, 11888, " ", $vqrange] _
		, [-10147, 16371, " ", $vqrange] _
		, [-8773, 14362, " ", $vqrange] _
		, [-5404, 5939, " ", $vqrange] ]

		Local $aWaypointsB[39][4] = [ [-3510, 11532, " ", $vqrange] _
		, [2278, 9411, " ", $vqrange] _
		, [5572, 13102, " ", $vqrange] _
		, [7932, 9937, " ", $vqrange] _
		, [11130, 6676, " ", $vqrange] _
		, [13153, 4817, " ", $vqrange] _
		, [11013, 2446, " ", $vqrange] _
		, [8133, 3728, " ", $vqrange] _
		, [5426, 2423, " ", $vqrange] _
		, [5397, 2420, " ", $vqrange] _
		, [3176, 6059, " ", $vqrange] _
		, [1796, 9388, " ", $vqrange] _
		, [-3304, 8993, " ", $vqrange] _
		, [-7675, 10144, " ", $vqrange] _
		, [-8541, 7031, " ", $vqrange] _
		, [-10177, 9540, " ", $vqrange] _
		, [-10676, 9875, " ", $vqrange] _
		, [-13598, 10479, " ", $vqrange] _
		, [-13616, 8953, " ", $vqrange] _
		, [-15604, 6840, " ", $vqrange] _
		, [-14986, 4764, " ", $vqrange] _
		, [-13210, 4586, " ", $vqrange] _
		, [-11257, 6728, " ", $vqrange] _
		, [-15128, 7500, " ", $vqrange] _
		, [-19106, 5884, " ", $vqrange] _
		, [-21645, 5204, " ", $vqrange] _
		, [-21061, 2474, " ", $vqrange] _
		, [-19693, -140, " ", $vqrange] _
		, [-16177, 632, " ", $vqrange] _
		, [-12900, 1867, " ", $vqrange] _
		, [-10167, 1608, " ", $vqrange] _
		, [-8629, 244, " ", $vqrange] _
		, [-7255, 3876, " ", $vqrange] _
		, [-8780, -2065, " ", $vqrange] _
		, [-6550, -4753, " ", $vqrange] _
		, [-9429, -6743, " ", $vqrange] _
		, [-9270, -9220, " ", $vqrange] _
		, [-5454, -10006, " ", $vqrange] _
		, [-2456, -9862, " ", $vqrange] ]

		Local $aWaypointsC[52][4] = [ [-563, -10798, " ", $vqrange] _
		, [1125, -12448, " ", $vqrange] _
		, [3360, -8872, " ", $vqrange] _
		, [1692, -7594, " ", $vqrange] _
		, [1408, -6309, " ", $vqrange] _
		, [-695, -5970, " ", $vqrange] _
		, [1113, -8055, " ", $vqrange] _
		, [0, -12591, " ", $vqrange] _
		, [4132, -12717, " ", $vqrange] _
		, [4957, -13808, " ", $vqrange] _
		, [6679, -9842, " ", $vqrange] _
		, [9658, -8986, " ", $vqrange] _
		, [12489, -7108, " ", $vqrange] _
		, [13666, -9160, " ", $vqrange] _
		, [14956, -10233, " ", $vqrange] _
		, [17111, -12115, " ", $vqrange] _
		, [15729, -12871, " ", $vqrange] _
		, [18425, -13867, " ", $vqrange] _
		, [21371, -11993, " ", $vqrange] _
		, [21662, -10233, " ", $vqrange] _
		, [17843, -8134, " ", $vqrange] _
		, [14770, -5785, " ", $vqrange] _
		, [18998, -5263, " ", $vqrange] _
		, [18366, -1579, " ", $vqrange] _
		, [18555, 132, " ", $vqrange] _
		, [22239, -565, " ", $vqrange] _
		, [20937, 2125, " ", $vqrange] _
		, [21362, 5528, " ", $vqrange] _
		, [20221, 7167, " ", $vqrange] _
		, [22453, 8721, " ", $vqrange] _
		, [19751, 6451, " ", $vqrange] _
		, [19703, 4479, " ", $vqrange] _
		, [18143, 4398, " ", $vqrange] _
		, [16496, 3489, " ", $vqrange] _
		, [16732, 1355, " ", $vqrange] _
		, [13222, 495, " ", $vqrange] _
		, [10843, -1084, " ", $vqrange] _
		, [9592, -3368, " ", $vqrange] _
		, [5903, -3865, " ", $vqrange] _
		, [6210, -8238, " ", $vqrange] _
		, [5365, -3259, " ", $vqrange] _
		, [1927, -801, " ", $vqrange] _
		, [-1833, 1014, " ", $vqrange] _
		, [-1490, 2256, " ", $vqrange] _
		, [556, 2564, " ", $vqrange] _
		, [1681, -925, " ", $vqrange] _
		, [-1203, -1344, " ", $vqrange] _
		, [-4860, 2654, " ", $vqrange] _
		, [-6033, 6341, " ", $vqrange] _
		, [-6720, 4265, " ", $vqrange] _
		, [-9070, -1104, " ", $vqrange] _
		, [-14034, -2308, " ", $vqrange] ]
		
		Local $aWaypoints[100][4] = [ [-22919, 12238, " ", $vqrange] _
		, [-18473, 9902, " ", $vqrange] _
		, [-16006, 12724, " ", $vqrange] _
		, [-12803, 14578, " ", $vqrange] _
		, [-11163, 14215, " ", $vqrange] _
		, [-10841, 11888, " ", $vqrange] _
		, [-10147, 16371, " ", $vqrange] _
		, [-8773, 14362, " ", $vqrange] _
		, [-4220, 15788, " ", $vqrange] _
		, [-3510, 11532, " ", $vqrange] _
		, [2278, 9411, " ", $vqrange] _
		, [5572, 13102, " ", $vqrange] _
		, [7932, 9937, " ", $vqrange] _
		, [11130, 6676, " ", $vqrange] _
		, [13153, 4817, " ", $vqrange] _
		, [11013, 2446, " ", $vqrange] _
		, [8133, 3728, " ", $vqrange] _
		, [5426, 2423, " ", $vqrange] _
		, [5397, 2420, " ", $vqrange] _
		, [3176, 6059, " ", $vqrange] _
		, [1796, 9388, " ", $vqrange] _
		, [-3304, 8993, " ", $vqrange] _
		, [-7675, 10144, " ", $vqrange] _
		, [-8541, 7031, " ", $vqrange] _
		, [-10177, 9540, " ", $vqrange] _
		, [-10676, 9875, " ", $vqrange] _
		, [-13598, 10479, " ", $vqrange] _
		, [-13616, 8953, " ", $vqrange] _
		, [-15604, 6840, " ", $vqrange] _
		, [-14986, 4764, " ", $vqrange] _
		, [-13210, 4586, " ", $vqrange] _
		, [-11257, 6728, " ", $vqrange] _
		, [-15128, 7500, " ", $vqrange] _
		, [-19106, 5884, " ", $vqrange] _
		, [-21645, 5204, " ", $vqrange] _
		, [-21061, 2474, " ", $vqrange] _
		, [-19693, -140, " ", $vqrange] _
		, [-16177, 632, " ", $vqrange] _
		, [-12900, 1867, " ", $vqrange] _
		, [-10167, 1608, " ", $vqrange] _
		, [-8629, 244, " ", $vqrange] _
		, [-7255, 3876, " ", $vqrange] _
		, [-8780, -2065, " ", $vqrange] _
		, [-6550, -4753, " ", $vqrange] _
		, [-9429, -6743, " ", $vqrange] _
		, [-9270, -9220, " ", $vqrange] _
		, [-5454, -10006, " ", $vqrange] _
		, [-2456, -9862, " ", $vqrange] _
		, [-563, -10798, " ", $vqrange] _
		, [1125, -12448, " ", $vqrange] _
		, [3360, -8872, " ", $vqrange] _
		, [1692, -7594, " ", $vqrange] _
		, [1408, -6309, " ", $vqrange] _
		, [-695, -5970, " ", $vqrange] _
		, [1113, -8055, " ", $vqrange] _
		, [0, -12591, " ", $vqrange] _
		, [4132, -12717, " ", $vqrange] _
		, [4957, -13808, " ", $vqrange] _
		, [6679, -9842, " ", $vqrange] _
		, [9658, -8986, " ", $vqrange] _
		, [12489, -7108, " ", $vqrange] _
		, [13666, -9160, " ", $vqrange] _
		, [14956, -10233, " ", $vqrange] _
		, [17111, -12115, " ", $vqrange] _
		, [15729, -12871, " ", $vqrange] _
		, [18425, -13867, " ", $vqrange] _
		, [21371, -11993, " ", $vqrange] _
		, [21662, -10233, " ", $vqrange] _
		, [17843, -8134, " ", $vqrange] _
		, [14770, -5785, " ", $vqrange] _
		, [18998, -5263, " ", $vqrange] _
		, [18366, -1579, " ", $vqrange] _
		, [18555, 132, " ", $vqrange] _
		, [22239, -565, " ", $vqrange] _
		, [20937, 2125, " ", $vqrange] _
		, [21362, 5528, " ", $vqrange] _
		, [20221, 7167, " ", $vqrange] _
		, [22453, 8721, " ", $vqrange] _
		, [19751, 6451, " ", $vqrange] _
		, [19703, 4479, " ", $vqrange] _
		, [18143, 4398, " ", $vqrange] _
		, [16496, 3489, " ", $vqrange] _
		, [16732, 1355, " ", $vqrange] _
		, [13222, 495, " ", $vqrange] _
		, [10843, -1084, " ", $vqrange] _
		, [9592, -3368, " ", $vqrange] _
		, [5903, -3865, " ", $vqrange] _
		, [6210, -8238, " ", $vqrange] _
		, [5365, -3259, " ", $vqrange] _
		, [1927, -801, " ", $vqrange] _
		, [-1833, 1014, " ", $vqrange] _
		, [-1490, 2256, " ", $vqrange] _
		, [556, 2564, " ", $vqrange] _
		, [1681, -925, " ", $vqrange] _
		, [-1203, -1344, " ", $vqrange] _
		, [-4860, 2654, " ", $vqrange] _
		, [-6033, 6341, " ", $vqrange] _
		, [-6720, 4265, " ", $vqrange] _
		, [-9070, -1104, " ", $vqrange] _
		, [-14034, -2308, " ", $vqrange] ]
	
		GoNearestNPCToCoords(-21186, 16195)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-3139, 15071)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-2224, -8726)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
				
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc