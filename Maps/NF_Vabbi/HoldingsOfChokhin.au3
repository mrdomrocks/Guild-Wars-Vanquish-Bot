#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutHoldingsOfChokhin()
	MoveTo(4, 2715)
	MoveTo(-386, 4527)
	Move(-450, 4530)
	WaitForLoad()
EndFunc

Func VQHoldingsOfChokhin()
    If GetMapID() <> $HoldingsOfChokhin_Map And GetMapID() <> $HoldingsOfChokhin_Outpost  Then TravelTo($HoldingsOfChokhin_Outpost)   
    If GetMapID() = $HoldingsOfChokhin_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $HoldingsOfChokhin_Map Then    
		
		Local $aWaypointsA[71][4] = [ [16657, -12876, " ", $vqrange] _
		, [10846, -11145, " ", $vqrange] _
		, [9155, -10185, " ", $vqrange] _
		, [10307, -7894, " ", $vqrange] _
		, [10247, -4927, " ", $vqrange] _
		, [12725, -6428, " ", $vqrange] _
		, [14463, -6727, " ", $vqrange] _
		, [16500, -5567, " ", $vqrange] _
		, [15761, -7544, " ", $vqrange] _
		, [15602, -2642, " ", $vqrange] _
		, [13593, -3139, " ", $vqrange] _
		, [12782, 263, " ", $vqrange] _
		, [9465, 3460, " ", $vqrange] _
		, [8370, 4187, " ", $vqrange] _
		, [6727, 3242, " ", $vqrange] _
		, [4608, 5678, " ", $vqrange] _
		, [4615, 7640, " ", $vqrange] _
		, [2927, 9492, " ", $vqrange] _
		, [839, 7287, " ", $vqrange] _
		, [-1548, 8541, " ", $vqrange] _
		, [1919, 11702, " ", $vqrange] _
		, [3145, 12785, " ", $vqrange] _
		, [5952, 15911, " ", $vqrange] _
		, [7157, 16827, " ", $vqrange] _
		, [6834, 16534, " ", $vqrange] _
		, [7175, 15465, " ", $vqrange] _
		, [9942, 14431, " ", $vqrange] _
		, [6094, 12258, " ", $vqrange] _
		, [7925, 10698, " ", $vqrange] _
		, [10272, 11027, " ", $vqrange] _
		, [12754, 9044, " ", $vqrange] _
		, [12673, 9519, " ", $vqrange] _
		, [11264, 6455, " ", $vqrange] _
		, [13662, 3599, " ", $vqrange] _
		, [12983, -246, " ", $vqrange] _
		, [12635, -4041, " ", $vqrange] _
		, [9784, -3536, " ", $vqrange] _
		, [6137, -1844, " ", $vqrange] _
		, [2396, -6167, " ", $vqrange] _
		, [1490, -4765, " ", $vqrange] _
		, [133, -3856, " ", $vqrange] _
		, [-1672, -4546, " ", $vqrange] _
		, [-378, -7066, " ", $vqrange] _
		, [-127, -7611, " ", $vqrange] _
		, [22, -8981, " ", $vqrange] _
		, [1363, -10371, " ", $vqrange] _
		, [3342, -11921, " ", $vqrange] _
		, [2379, -7947, " ", $vqrange] _
		, [-508, -4747, " ", $vqrange] _
		, [-3263, -2273, " ", $vqrange] _
		, [-4328, 1341, " ", $vqrange] _
		, [-5481, 2916, " ", $vqrange] _
		, [-7769, 2046, " ", $vqrange] _
		, [-3898, 4553, " ", $vqrange] _
		, [-3533, 5476, " ", $vqrange] _
		, [-3787, 8890, " ", $vqrange] _
		, [-5589, 11023, " ", $vqrange] _
		, [-7609, 11344, " ", $vqrange] _
		, [-9638, 11432, " ", $vqrange] _
		, [-10756, 14080, " ", $vqrange] _
		, [-10330, 15474, " ", $vqrange] _
		, [-6610, 14028, " ", $vqrange] _
		, [-8861, 9954, " ", $vqrange] _
		, [-7452, 8624, " ", $vqrange] _
		, [-10207, 6732, " ", $vqrange] _
		, [-13814, 8342, " ", $vqrange] _
		, [-14813, 10274, " ", $vqrange] _
		, [-14403, 12857, " ", $vqrange] _
		, [-15009, 10395, " ", $vqrange] _
		, [-15700, 9659, " ", $vqrange] _
		, [-14267, 7495, " ", $vqrange] ]

		Local $aWaypointsB[21][4] = [ [-17416, 5274, " ", $vqrange] _
		, [-16549, 2521, " ", $vqrange] _
		, [-13914, 2093, " ", $vqrange] _
		, [-13939, 962, " ", $vqrange] _
		, [-14927, 3448, " ", $vqrange] _
		, [-17335, 254, " ", $vqrange] _
		, [-18069, -2385, " ", $vqrange] _
		, [-18371, -4236, " ", $vqrange] _
		, [-20948, -2382, " ", $vqrange] _
		, [-21794, -1946, " ", $vqrange] _
		, [-18666, -37, " ", $vqrange] _
		, [-19131, 379, " ", $vqrange] _
		, [-19830, -2688, " ", $vqrange] _
		, [-18085, -6392, " ", $vqrange] _
		, [-17697, -8965, " ", $vqrange] _
		, [-16838, -10902, " ", $vqrange] _
		, [-16619, -13305, " ", $vqrange] _
		, [-16684, -15626, " ", $vqrange] _
		, [-15641, -14058, " ", $vqrange] _
		, [-10036, 5369, " ", $vqrange] _
		, [-15641, -14058, " ", $vqrange] ]

		Local $aWaypointsC[11][4] = [ [-14259, -12932, " ", $vqrange] _
		, [-13468, -9040, " ", $vqrange] _
		, [-14802, -6722, " ", $vqrange] _
		, [-14513, -3373, " ", $vqrange] _
		, [-14008, -439, " ", $vqrange] _
		, [-14260, -3150, " ", $vqrange] _
		, [-11484, -1957, " ", $vqrange] _
		, [-10471, -3067, " ", $vqrange] _
		, [-8792, -1604, " ", $vqrange] _
		, [-7908, 1591, " ", $vqrange] _
		, [-8546, -1995, " ", $vqrange] ]

		Local $aWaypointsD[14][4] = [ [-5244, -8209, " ", $vqrange] _
		, [-3302, -5919, " ", $vqrange] _
		, [-6553, -8761, " ", $vqrange] _
		, [-8114, -7836, " ", $vqrange] _
		, [-9773, -6124, " ", $vqrange] _
		, [-6925, -8934, " ", $vqrange] _
		, [-7021, -12918, " ", $vqrange] _
		, [-4839, -14869, " ", $vqrange] _
		, [-4303, -13038, " ", $vqrange] _
		, [-2185, -10216, " ", $vqrange] _
		, [1052, -10418, " ", $vqrange] _
		, [5320, -13577, " ", $vqrange] _
		, [6583, -15485, " ", $vqrange] _
		, [10050, -15706, " ", $vqrange] ]
		
		Local $aWaypoints[117][4] = [ [16657, -12876, " ", $vqrange] _
		, [10846, -11145, " ", $vqrange] _
		, [9155, -10185, " ", $vqrange] _
		, [10307, -7894, " ", $vqrange] _
		, [10247, -4927, " ", $vqrange] _
		, [12725, -6428, " ", $vqrange] _
		, [14463, -6727, " ", $vqrange] _
		, [16500, -5567, " ", $vqrange] _
		, [15761, -7544, " ", $vqrange] _
		, [15602, -2642, " ", $vqrange] _
		, [13593, -3139, " ", $vqrange] _
		, [12782, 263, " ", $vqrange] _
		, [9465, 3460, " ", $vqrange] _
		, [8370, 4187, " ", $vqrange] _
		, [6727, 3242, " ", $vqrange] _
		, [4608, 5678, " ", $vqrange] _
		, [4615, 7640, " ", $vqrange] _
		, [2927, 9492, " ", $vqrange] _
		, [839, 7287, " ", $vqrange] _
		, [-1548, 8541, " ", $vqrange] _
		, [1919, 11702, " ", $vqrange] _
		, [3145, 12785, " ", $vqrange] _
		, [5952, 15911, " ", $vqrange] _
		, [7157, 16827, " ", $vqrange] _
		, [6834, 16534, " ", $vqrange] _
		, [7175, 15465, " ", $vqrange] _
		, [9942, 14431, " ", $vqrange] _
		, [6094, 12258, " ", $vqrange] _
		, [7925, 10698, " ", $vqrange] _
		, [10272, 11027, " ", $vqrange] _
		, [12754, 9044, " ", $vqrange] _
		, [12673, 9519, " ", $vqrange] _
		, [11264, 6455, " ", $vqrange] _
		, [13662, 3599, " ", $vqrange] _
		, [12983, -246, " ", $vqrange] _
		, [12635, -4041, " ", $vqrange] _
		, [9784, -3536, " ", $vqrange] _
		, [6137, -1844, " ", $vqrange] _
		, [2396, -6167, " ", $vqrange] _
		, [1490, -4765, " ", $vqrange] _
		, [133, -3856, " ", $vqrange] _
		, [-1672, -4546, " ", $vqrange] _
		, [-378, -7066, " ", $vqrange] _
		, [-127, -7611, " ", $vqrange] _
		, [22, -8981, " ", $vqrange] _
		, [1363, -10371, " ", $vqrange] _
		, [3342, -11921, " ", $vqrange] _
		, [2379, -7947, " ", $vqrange] _
		, [-508, -4747, " ", $vqrange] _
		, [-3263, -2273, " ", $vqrange] _
		, [-4328, 1341, " ", $vqrange] _
		, [-5481, 2916, " ", $vqrange] _
		, [-7769, 2046, " ", $vqrange] _
		, [-3898, 4553, " ", $vqrange] _
		, [-3533, 5476, " ", $vqrange] _
		, [-3787, 8890, " ", $vqrange] _
		, [-5589, 11023, " ", $vqrange] _
		, [-7609, 11344, " ", $vqrange] _
		, [-9638, 11432, " ", $vqrange] _
		, [-10756, 14080, " ", $vqrange] _
		, [-10330, 15474, " ", $vqrange] _
		, [-6610, 14028, " ", $vqrange] _
		, [-8861, 9954, " ", $vqrange] _
		, [-7452, 8624, " ", $vqrange] _
		, [-10207, 6732, " ", $vqrange] _
		, [-13814, 8342, " ", $vqrange] _
		, [-14813, 10274, " ", $vqrange] _
		, [-14403, 12857, " ", $vqrange] _
		, [-15009, 10395, " ", $vqrange] _
		, [-15700, 9659, " ", $vqrange] _
		, [-14267, 7495, " ", $vqrange] _
		, [-17416, 5274, " ", $vqrange] _
		, [-16549, 2521, " ", $vqrange] _
		, [-13914, 2093, " ", $vqrange] _
		, [-13939, 962, " ", $vqrange] _
		, [-14927, 3448, " ", $vqrange] _
		, [-17335, 254, " ", $vqrange] _
		, [-18069, -2385, " ", $vqrange] _
		, [-18371, -4236, " ", $vqrange] _
		, [-20948, -2382, " ", $vqrange] _
		, [-21794, -1946, " ", $vqrange] _
		, [-18666, -37, " ", $vqrange] _
		, [-19131, 379, " ", $vqrange] _
		, [-19830, -2688, " ", $vqrange] _
		, [-18085, -6392, " ", $vqrange] _
		, [-17697, -8965, " ", $vqrange] _
		, [-16838, -10902, " ", $vqrange] _
		, [-16619, -13305, " ", $vqrange] _
		, [-16684, -15626, " ", $vqrange] _
		, [-15641, -14058, " ", $vqrange] _
		, [-10036, 5369, " ", $vqrange] _
		, [-15641, -14058, " ", $vqrange] _
		, [-14259, -12932, " ", $vqrange] _
		, [-13468, -9040, " ", $vqrange] _
		, [-14802, -6722, " ", $vqrange] _
		, [-14513, -3373, " ", $vqrange] _
		, [-14008, -439, " ", $vqrange] _
		, [-14260, -3150, " ", $vqrange] _
		, [-11484, -1957, " ", $vqrange] _
		, [-10471, -3067, " ", $vqrange] _
		, [-8792, -1604, " ", $vqrange] _
		, [-7908, 1591, " ", $vqrange] _
		, [-8546, -1995, " ", $vqrange] _
		, [-5244, -8209, " ", $vqrange] _
		, [-3302, -5919, " ", $vqrange] _
		, [-6553, -8761, " ", $vqrange] _
		, [-8114, -7836, " ", $vqrange] _
		, [-9773, -6124, " ", $vqrange] _
		, [-6925, -8934, " ", $vqrange] _
		, [-7021, -12918, " ", $vqrange] _
		, [-4839, -14869, " ", $vqrange] _
		, [-4303, -13038, " ", $vqrange] _
		, [-2185, -10216, " ", $vqrange] _
		, [1052, -10418, " ", $vqrange] _
		, [5320, -13577, " ", $vqrange] _
		, [6583, -15485, " ", $vqrange] _
		, [10050, -15706, " ", $vqrange] ]		
		
		GoNearestNPCToCoords(15810, -15238)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-14951, 5922)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-14563, -14857)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-6527, -3880)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc