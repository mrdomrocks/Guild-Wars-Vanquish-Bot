#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutFahranurTheFirstCity()
	MoveTo(-3232, 3400)
	MoveTo(-4316, 4419)
	MoveTo(-4380, 4557)
	MoveTo(-4405, 4603)
	Move(-4505, 4803)
	WaitForLoad()
EndFunc

Func VQFahranurTheFirstCity()
    If GetMapID() <> $FahranurTheFirstCity_Map And GetMapID() <> $FahranurTheFirstCity_Outpost  Then TravelTo($FahranurTheFirstCity_Outpost)   
    If GetMapID() = $FahranurTheFirstCity_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $FahranurTheFirstCity_Map Then    	

		Local $aWaypointsA[15][4] = [ [17114, -15098, " ", $vqrange] _
		, [14233, -16398, " ", $vqrange] _
		, [12906, -12544, " ", $vqrange] _
		, [9792, -12646, " ", $vqrange] _
		, [9817, -15802, " ", $vqrange] _
		, [13605, -17553, " ", $vqrange] _
		, [11655, -18668, " ", $vqrange] _
		, [8060, -19004, " ", $vqrange] _
		, [5980, -16542, " ", $vqrange] _
		, [5569, -12964, " ", $vqrange] _
		, [8089, -10822, " ", $vqrange] _
		, [10374, -8814, " ", $vqrange] _
		, [13405, -6799, " ", $vqrange] _
		, [14633, -7028, " ", $vqrange] _
		, [11603, -4415, " ", $vqrange] ]

		Local $aWaypointsB[9][4] = [ [10571, -1557, " ", $vqrange] _
		, [13390, -1988, " ", $vqrange] _
		, [14698, -480, " ", $vqrange] _
		, [15744, 3744, " ", $vqrange] _
		, [15001, 5979, " ", $vqrange] _
		, [12727, 6161, " ", $vqrange] _
		, [10534, 8302, " ", $vqrange] _
		, [12732, 13091, " ", $vqrange] _
		, [15049, 13401, " ", $vqrange] ]

		Local $aWaypointsC[25][4] = [ [14578, 6185, " ", $vqrange] _
		, [11730, 6483, " ", $vqrange] _
		, [11133, 12517, " ", $vqrange] _
		, [10695, 17490, " ", $vqrange] _
		, [10289, 18893, " ", $vqrange] _
		, [8771, 19435, " ", $vqrange] _
		, [5751, 16928, " ", $vqrange] _
		, [5893, 12953, " ", $vqrange] _
		, [4138, 10335, " ", $vqrange] _
		, [4273, 5920, " ", $vqrange] _
		, [7772, 3416, " ", $vqrange] _
		, [9683, 1475, " ", $vqrange] _
		, [4486, 5766, " ", $vqrange] _
		, [1244, 12645, " ", $vqrange] _
		, [1658, 13933, " ", $vqrange] _
		, [918, 14232, " ", $vqrange] _
		, [1028, 16107, " ", $vqrange] _
		, [918, 14232, " ", $vqrange] _
		, [-3127, 14539, " ", $vqrange] _
		, [-4124, 13477, " ", $vqrange] _
		, [-5760, 13280, " ", $vqrange] _
		, [-4228, 13048, " ", $vqrange] _
		, [-4262, 11313, " ", $vqrange] _
		, [-5707, 10476, " ", $vqrange] _
		, [-5112, 5805, " ", $vqrange] ]
		
		Local $aWaypointsD[6][4] = [ [-740, 6319, " ", $vqrange] _
		, [-660, 4043, " ", $vqrange] _
		, [2479, 191, " ", $vqrange] _
		, [2369, -3786, " ", $vqrange] _
		, [490, -5990, " ", $vqrange] _
		, [-499, -7172, " ", $vqrange] ]

		
		Local $aWaypointsE[52][4] = [ [-933, -11364, " ", $vqrange] _
		, [-6333, -11165, " ", $vqrange] _
		, [-4865, -12986, " ", $vqrange] _
		, [-5611, -14035, " ", $vqrange] _
		, [-6055, -11324, " ", $vqrange] _
		, [-5257, -10728, " ", $vqrange] _
		, [-5675, -7929, " ", $vqrange] _
		, [-10426, -7808, " ", $vqrange] _
		, [-10507, -1656, " ", $vqrange] _
		, [-7130, -1460, " ", $vqrange] _
		, [-6679, -3949, " ", $vqrange] _
		, [-5748, -1581, " ", $vqrange] _
		, [-2991, -1710, " ", $vqrange] _
		, [-6321, -1498, " ", $vqrange] _
		, [-6687, 876, " ", $vqrange] _
		, [-7474, -1453, " ", $vqrange] _
		, [-12176, -2446, " ", $vqrange] _
		, [-14200, -2347, " ", $vqrange] _
		, [-10260, 1732, " ", $vqrange] _
		, [-8998, 4135, " ", $vqrange] _
		, [-11722, 3865, " ", $vqrange] _
		, [-11742, 6862, " ", $vqrange] _
		, [-9828, 6991, " ", $vqrange] _
		, [-9475, 11556, " ", $vqrange] _
		, [-9560, 14717, " ", $vqrange] _
		, [-12355, 14761, " ", $vqrange] _
		, [-13544, 13840, " ", $vqrange] _
		, [-13290, 10141, " ", $vqrange] _
		, [-11652, 6890, " ", $vqrange] _
		, [-11751, 3715, " ", $vqrange] _
		, [-10498, 1017, " ", $vqrange] _
		, [-14783, -2243, " ", $vqrange] _
		, [-14797, -3835, " ", $vqrange] _
		, [-10423, -2163, " ", $vqrange] _
		, [-10415, -7500, " ", $vqrange] _
		, [-14200, -9102, " ", $vqrange] _
		, [-16526, -9239, " ", $vqrange] _
		, [-16832, -8831, " ", $vqrange] _
		, [-14340, -11842, " ", $vqrange] _
		, [-13279, -13851, " ", $vqrange] _
		, [-14907, -14180, " ", $vqrange] _
		, [-16061, -14525, " ", $vqrange] _
		, [-17992, -15646, " ", $vqrange] _
		, [-14549, -13999, " ", $vqrange] _
		, [-11057, -19277, " ", $vqrange] _
		, [-7115, -18474, " ", $vqrange] _
		, [-3790, -17232, " ", $vqrange] _
		, [889, -16954, " ", $vqrange] _
		, [5566, -15988, " ", $vqrange] _
		, [7954, -14109, " ", $vqrange] _
		, [8155, -10840, " ", $vqrange] _
		, [13368, -6845, " ", $vqrange] ]	
		
		Local $aWaypoints[107][4] = [ [17114, -15098, " ", $vqrange] _
		, [14233, -16398, " ", $vqrange] _
		, [12906, -12544, " ", $vqrange] _
		, [9792, -12646, " ", $vqrange] _
		, [9817, -15802, " ", $vqrange] _
		, [13605, -17553, " ", $vqrange] _
		, [11655, -18668, " ", $vqrange] _
		, [8060, -19004, " ", $vqrange] _
		, [5980, -16542, " ", $vqrange] _
		, [5569, -12964, " ", $vqrange] _
		, [8089, -10822, " ", $vqrange] _
		, [10374, -8814, " ", $vqrange] _
		, [13405, -6799, " ", $vqrange] _
		, [14633, -7028, " ", $vqrange] _
		, [11603, -4415, " ", $vqrange] _
		, [10571, -1557, " ", $vqrange] _
		, [13390, -1988, " ", $vqrange] _
		, [14698, -480, " ", $vqrange] _
		, [15744, 3744, " ", $vqrange] _
		, [15001, 5979, " ", $vqrange] _
		, [12727, 6161, " ", $vqrange] _
		, [10534, 8302, " ", $vqrange] _
		, [12732, 13091, " ", $vqrange] _
		, [15049, 13401, " ", $vqrange] _
		, [14578, 6185, " ", $vqrange] _
		, [11730, 6483, " ", $vqrange] _
		, [11133, 12517, " ", $vqrange] _
		, [10695, 17490, " ", $vqrange] _
		, [10289, 18893, " ", $vqrange] _
		, [8771, 19435, " ", $vqrange] _
		, [5751, 16928, " ", $vqrange] _
		, [5893, 12953, " ", $vqrange] _
		, [4138, 10335, " ", $vqrange] _
		, [4273, 5920, " ", $vqrange] _
		, [7772, 3416, " ", $vqrange] _
		, [9683, 1475, " ", $vqrange] _
		, [4486, 5766, " ", $vqrange] _
		, [1244, 12645, " ", $vqrange] _
		, [1658, 13933, " ", $vqrange] _
		, [918, 14232, " ", $vqrange] _
		, [1028, 16107, " ", $vqrange] _
		, [918, 14232, " ", $vqrange] _
		, [-3127, 14539, " ", $vqrange] _
		, [-4124, 13477, " ", $vqrange] _
		, [-5760, 13280, " ", $vqrange] _
		, [-4228, 13048, " ", $vqrange] _
		, [-4262, 11313, " ", $vqrange] _
		, [-5707, 10476, " ", $vqrange] _
		, [-5112, 5805, " ", $vqrange] _
		, [-740, 6319, " ", $vqrange] _
		, [-660, 4043, " ", $vqrange] _
		, [2479, 191, " ", $vqrange] _
		, [2369, -3786, " ", $vqrange] _
		, [490, -5990, " ", $vqrange] _
		, [-499, -7172, " ", $vqrange] _
		, [-933, -11364, " ", $vqrange] _
		, [-6333, -11165, " ", $vqrange] _
		, [-4865, -12986, " ", $vqrange] _
		, [-5611, -14035, " ", $vqrange] _
		, [-6055, -11324, " ", $vqrange] _
		, [-5257, -10728, " ", $vqrange] _
		, [-5675, -7929, " ", $vqrange] _
		, [-10426, -7808, " ", $vqrange] _
		, [-10507, -1656, " ", $vqrange] _
		, [-7130, -1460, " ", $vqrange] _
		, [-6679, -3949, " ", $vqrange] _
		, [-5748, -1581, " ", $vqrange] _
		, [-2991, -1710, " ", $vqrange] _
		, [-6321, -1498, " ", $vqrange] _
		, [-6687, 876, " ", $vqrange] _
		, [-7474, -1453, " ", $vqrange] _
		, [-12176, -2446, " ", $vqrange] _
		, [-14200, -2347, " ", $vqrange] _
		, [-10260, 1732, " ", $vqrange] _
		, [-8998, 4135, " ", $vqrange] _
		, [-11722, 3865, " ", $vqrange] _
		, [-11742, 6862, " ", $vqrange] _
		, [-9828, 6991, " ", $vqrange] _
		, [-9475, 11556, " ", $vqrange] _
		, [-9560, 14717, " ", $vqrange] _
		, [-12355, 14761, " ", $vqrange] _
		, [-13544, 13840, " ", $vqrange] _
		, [-13290, 10141, " ", $vqrange] _
		, [-11652, 6890, " ", $vqrange] _
		, [-11751, 3715, " ", $vqrange] _
		, [-10498, 1017, " ", $vqrange] _
		, [-14783, -2243, " ", $vqrange] _
		, [-14797, -3835, " ", $vqrange] _
		, [-10423, -2163, " ", $vqrange] _
		, [-10415, -7500, " ", $vqrange] _
		, [-14200, -9102, " ", $vqrange] _
		, [-16526, -9239, " ", $vqrange] _
		, [-16832, -8831, " ", $vqrange] _
		, [-14340, -11842, " ", $vqrange] _
		, [-13279, -13851, " ", $vqrange] _
		, [-14907, -14180, " ", $vqrange] _
		, [-16061, -14525, " ", $vqrange] _
		, [-17992, -15646, " ", $vqrange] _
		, [-14549, -13999, " ", $vqrange] _
		, [-11057, -19277, " ", $vqrange] _
		, [-7115, -18474, " ", $vqrange] _
		, [-3790, -17232, " ", $vqrange] _
		, [889, -16954, " ", $vqrange] _
		, [5566, -15988, " ", $vqrange] _
		, [7954, -14109, " ", $vqrange] _
		, [8155, -10840, " ", $vqrange] _
		, [13368, -6845, " ", $vqrange] ]
		
		
		
		GoNearestNPCToCoords(19580, -18261)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(11197, -2793)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(19635, 12267)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-2049, 7944)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		GoNearestNPCToCoords(271, -8397)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsE)
		
		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc
