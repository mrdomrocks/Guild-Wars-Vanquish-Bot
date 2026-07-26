#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutBahdokCaverns()
	MoveTo(-13756, -11190)
	GoNearestNPCToCoords(-13647, -10442)
	Sleep(1000)
	Dialog(0x00000081)
	Dialog(0x00000084)
	WaitForLoad()
EndFunc

Func VQBahdokCaverns()
    If GetMapID() <> $BahdokCaverns_Map And GetMapID() <> $BahdokCaverns_Outpost  Then TravelTo($BahdokCaverns_Outpost)   
    If GetMapID() = $BahdokCaverns_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $BahdokCaverns_Map Then    
		
		Local $aWaypointsA[33][4] = [ [-7575, -6450, " ", $vqrange] _
		, [-7208, -4384, " ", $vqrange] _
		, [-8875, -1961, " ", $vqrange] _
		, [-7490, 963, " ", $vqrange] _
		, [-8020, 1346, " ", $vqrange] _
		, [-12071, -241, " ", $vqrange] _
		, [-12843, 2290, " ", $vqrange] _
		, [-11972, 4137, " ", $vqrange] _
		, [-15214, 3730, " ", $vqrange] _
		, [-16754, 2837, " ", $vqrange] _
		, [-16839, 1033, " ", $vqrange] _
		, [-15216, 3769, " ", $vqrange] _
		, [-9909, 4541, " ", $vqrange] _
		, [-3493, 6781, " ", $vqrange] _
		, [-7733, 6741, " ", $vqrange] _
		, [-9580, 6860, " ", $vqrange] _
		, [-9937, 10443, " ", $vqrange] _
		, [-11685, 10261, " ", $vqrange] _
		, [-10826, 13146, " ", $vqrange] _
		, [-12547, 14744, " ", $vqrange] _
		, [-14505, 16558, " ", $vqrange] _
		, [-16247, 18380, " ", $vqrange] _
		, [-12438, 17850, " ", $vqrange] _
		, [-11787, 15942, " ", $vqrange] _
		, [-13538, 13988, " ", $vqrange] _
		, [-12972, 17914, " ", $vqrange] _
		, [-16422, 18688, " ", $vqrange] _
		, [-12551, 14761, " ", $vqrange] _
		, [-11494, 10083, " ", $vqrange] _
		, [-7613, 13840, " ", $vqrange] _
		, [-5690, 10261, " ", $vqrange] _
		, [-4420, 6589, " ", $vqrange] _
		, [-822, 8017, " ", $vqrange] ]


		Local $aWaypointsB[8][4] = [ [-4487, 15111, " ", $vqrange] _
		, [-6730, 16106, " ", $vqrange] _
		, [-1834, 12888, " ", $vqrange] _
		, [649, 14008, " ", $vqrange] _
		, [3312, 12004, " ", $vqrange] _
		, [5078, 14005, " ", $vqrange] _
		, [6034, 13685, " ", $vqrange] _
		, [5759, 18317, " ", $vqrange] ]


		Local $aWaypointsC[9][4] = [ [12860, 18295, " ", $vqrange] _
		, [15978, 17684, " ", $vqrange] _
		, [17179, 14549, " ", $vqrange] _
		, [15168, 14361, " ", $vqrange] _
		, [14783, 12382, " ", $vqrange] _
		, [13927, 11182, " ", $vqrange] _
		, [11175, 8530, " ", $vqrange] _
		, [9568, 5247, " ", $vqrange] _
		, [11880, 3924, " ", $vqrange] ]


		Local $aWaypointsD[57][4] = [ [11969, 1423, " ", $vqrange] _
		, [14133, 262, " ", $vqrange] _
		, [14602, -154, " ", $vqrange] _
		, [15059, -2799, " ", $vqrange] _
		, [13124, -2557, " ", $vqrange] _
		, [13503, -1718, " ", $vqrange] _
		, [10288, -1774, " ", $vqrange] _
		, [7144, -1454, " ", $vqrange] _
		, [7009, 497, " ", $vqrange] _
		, [3065, 390, " ", $vqrange] _
		, [2527, -217, " ", $vqrange] _
		, [2913, -2164, " ", $vqrange] _
		, [1970, -5017, " ", $vqrange] _
		, [3342, -7603, " ", $vqrange] _
		, [4805, -2577, " ", $vqrange] _
		, [4988, -5139, " ", $vqrange] _
		, [5989, -5416, " ", $vqrange] _
		, [5643, -7347, " ", $vqrange] _
		, [8140, -4626, " ", $vqrange] _
		, [12466, -4482, " ", $vqrange] _
		, [11692, -5943, " ", $vqrange] _
		, [13662, -9410, " ", $vqrange] _
		, [15798, -9484, " ", $vqrange] _
		, [16755, -7594, " ", $vqrange] _
		, [17963, -3291, " ", $vqrange] _
		, [15887, -9120, " ", $vqrange] _
		, [11925, -12381, " ", $vqrange] _
		, [10155, -15445, " ", $vqrange] _
		, [8183, -16725, " ", $vqrange] _
		, [6081, -14169, " ", $vqrange] _
		, [7948, -17845, " ", $vqrange] _
		, [5946, -18540, " ", $vqrange] _
		, [8344, -17468, " ", $vqrange] _
		, [7858, -12781, " ", $vqrange] _
		, [11188, -9263, " ", $vqrange] _
		, [12588, -8858, " ", $vqrange] _
		, [11565, -6091, " ", $vqrange] _
		, [7893, -7841, " ", $vqrange] _
		, [6266, -10627, " ", $vqrange] _
		, [7279, -7252, " ", $vqrange] _
		, [6562, -5096, " ", $vqrange] _
		, [3875, -6288, " ", $vqrange] _
		, [4127, -10086, " ", $vqrange] _
		, [3107, -11566, " ", $vqrange] _
		, [-986, -11477, " ", $vqrange] _
		, [-1952, -8563, " ", $vqrange] _
		, [-3666, -7966, " ", $vqrange] _
		, [-3742, -6208, " ", $vqrange] _
		, [-2310, -4931, " ", $vqrange] _
		, [-3551, -3506, " ", $vqrange] _
		, [-5728, -4515, " ", $vqrange] _
		, [-2578, -2408, " ", $vqrange] _
		, [-4707, 8, " ", $vqrange] _
		, [-2153, 1205, " ", $vqrange] _
		, [-3010, 3677, " ", $vqrange] _
		, [-1054, 3651, " ", $vqrange] _
		, [-987, 7377, " ", $vqrange] ]

		
		Local $aWaypoints[107][4] = [ [-7575, -6450, " ", $vqrange] _
		, [-7208, -4384, " ", $vqrange] _
		, [-8875, -1961, " ", $vqrange] _
		, [-7490, 963, " ", $vqrange] _
		, [-8020, 1346, " ", $vqrange] _
		, [-12071, -241, " ", $vqrange] _
		, [-12843, 2290, " ", $vqrange] _
		, [-11972, 4137, " ", $vqrange] _
		, [-15214, 3730, " ", $vqrange] _
		, [-16754, 2837, " ", $vqrange] _
		, [-16839, 1033, " ", $vqrange] _
		, [-15216, 3769, " ", $vqrange] _
		, [-9909, 4541, " ", $vqrange] _
		, [-3493, 6781, " ", $vqrange] _
		, [-7733, 6741, " ", $vqrange] _
		, [-9580, 6860, " ", $vqrange] _
		, [-9937, 10443, " ", $vqrange] _
		, [-11685, 10261, " ", $vqrange] _
		, [-10826, 13146, " ", $vqrange] _
		, [-12547, 14744, " ", $vqrange] _
		, [-14505, 16558, " ", $vqrange] _
		, [-16247, 18380, " ", $vqrange] _
		, [-12438, 17850, " ", $vqrange] _
		, [-11787, 15942, " ", $vqrange] _
		, [-13538, 13988, " ", $vqrange] _
		, [-12972, 17914, " ", $vqrange] _
		, [-16422, 18688, " ", $vqrange] _
		, [-12551, 14761, " ", $vqrange] _
		, [-11494, 10083, " ", $vqrange] _
		, [-7613, 13840, " ", $vqrange] _
		, [-5690, 10261, " ", $vqrange] _
		, [-4420, 6589, " ", $vqrange] _
		, [-822, 8017, " ", $vqrange] _
		, [-4487, 15111, " ", $vqrange] _
		, [-6730, 16106, " ", $vqrange] _
		, [-1834, 12888, " ", $vqrange] _
		, [649, 14008, " ", $vqrange] _
		, [3312, 12004, " ", $vqrange] _
		, [5078, 14005, " ", $vqrange] _
		, [6034, 13685, " ", $vqrange] _
		, [5759, 18317, " ", $vqrange] _
		, [12860, 18295, " ", $vqrange] _
		, [15978, 17684, " ", $vqrange] _
		, [17179, 14549, " ", $vqrange] _
		, [15168, 14361, " ", $vqrange] _
		, [14783, 12382, " ", $vqrange] _
		, [13927, 11182, " ", $vqrange] _
		, [11175, 8530, " ", $vqrange] _
		, [9568, 5247, " ", $vqrange] _
		, [11880, 3924, " ", $vqrange] _
		, [11969, 1423, " ", $vqrange] _
		, [14133, 262, " ", $vqrange] _
		, [14602, -154, " ", $vqrange] _
		, [15059, -2799, " ", $vqrange] _
		, [13124, -2557, " ", $vqrange] _
		, [13503, -1718, " ", $vqrange] _
		, [10288, -1774, " ", $vqrange] _
		, [7144, -1454, " ", $vqrange] _
		, [7009, 497, " ", $vqrange] _
		, [3065, 390, " ", $vqrange] _
		, [2527, -217, " ", $vqrange] _
		, [2913, -2164, " ", $vqrange] _
		, [1970, -5017, " ", $vqrange] _
		, [3342, -7603, " ", $vqrange] _
		, [4805, -2577, " ", $vqrange] _
		, [4988, -5139, " ", $vqrange] _
		, [5989, -5416, " ", $vqrange] _
		, [5643, -7347, " ", $vqrange] _
		, [8140, -4626, " ", $vqrange] _
		, [12466, -4482, " ", $vqrange] _
		, [11692, -5943, " ", $vqrange] _
		, [13662, -9410, " ", $vqrange] _
		, [15798, -9484, " ", $vqrange] _
		, [16755, -7594, " ", $vqrange] _
		, [17963, -3291, " ", $vqrange] _
		, [15887, -9120, " ", $vqrange] _
		, [11925, -12381, " ", $vqrange] _
		, [10155, -15445, " ", $vqrange] _
		, [8183, -16725, " ", $vqrange] _
		, [6081, -14169, " ", $vqrange] _
		, [7948, -17845, " ", $vqrange] _
		, [5946, -18540, " ", $vqrange] _
		, [8344, -17468, " ", $vqrange] _
		, [7858, -12781, " ", $vqrange] _
		, [11188, -9263, " ", $vqrange] _
		, [12588, -8858, " ", $vqrange] _
		, [11565, -6091, " ", $vqrange] _
		, [7893, -7841, " ", $vqrange] _
		, [6266, -10627, " ", $vqrange] _
		, [7279, -7252, " ", $vqrange] _
		, [6562, -5096, " ", $vqrange] _
		, [3875, -6288, " ", $vqrange] _
		, [4127, -10086, " ", $vqrange] _
		, [3107, -11566, " ", $vqrange] _
		, [-986, -11477, " ", $vqrange] _
		, [-1952, -8563, " ", $vqrange] _
		, [-3666, -7966, " ", $vqrange] _
		, [-3742, -6208, " ", $vqrange] _
		, [-2310, -4931, " ", $vqrange] _
		, [-3551, -3506, " ", $vqrange] _
		, [-5728, -4515, " ", $vqrange] _
		, [-2578, -2408, " ", $vqrange] _
		, [-4707, 8, " ", $vqrange] _
		, [-2153, 1205, " ", $vqrange] _
		, [-3010, 3677, " ", $vqrange] _
		, [-1054, 3651, " ", $vqrange] _
		, [-987, 7377, " ", $vqrange] ]		
		
		GoNearestNPCToCoords(-9443, -7763)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-2601, 12695)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(9180, 18324)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(9053, 2959)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc
