#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutZehlonReach()
	MoveTo(3511, 1930)
	MoveTo(4225, 4510)
	MoveTo(4455, 4479)
	Move(4550, 4479)
	WaitForLoad()
EndFunc

Func VQZehlonReach()
    If GetMapID() <> $ZehlonReach_Map And GetMapID() <> $ZehlonReach_Outpost  Then TravelTo($ZehlonReach_Outpost)   
    If GetMapID() = $ZehlonReach_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ZehlonReach_Map Then    
		
		Local $aWaypointsA[8][4] = [ [-19207, -14374, " ", $vqrange] _
		, [-18194, -10506, " ", $vqrange] _
		, [-18454, -7118, " ", $vqrange] _
		, [-19040, -4312, " ", $vqrange] _
		, [-17693, 351, " ", $vqrange] _
		, [-17639, 4548, " ", $vqrange] _
		, [-19518, 5342, " ", $vqrange] _
		, [-19201, 7077, " ", $vqrange] ]

		Local $aWaypointsB[21][4] = [ [-18727, 14739, " ", $vqrange] _
		, [-19258, 16571, " ", $vqrange] _
		, [-15041, 14997, " ", $vqrange] _
		, [-14721, 14815, " ", $vqrange] _
		, [-11406, 12563, " ", $vqrange] _
		, [-13026, 10202, " ", $vqrange] _
		, [-11580, 7518, " ", $vqrange] _
		, [-8552, 11450, " ", $vqrange] _
		, [-6250, 11743, " ", $vqrange] _
		, [-1796, 11324, " ", $vqrange] _
		, [-759, 12977, " ", $vqrange] _
		, [1037, 13851, " ", $vqrange] _
		, [2050, 10857, " ", $vqrange] _
		, [1037, 13851, " ", $vqrange] _
		, [4116, 16101, " ", $vqrange] _
		, [6566, 14923, " ", $vqrange] _
		, [9114, 13985, " ", $vqrange] _
		, [10615, 14788, " ", $vqrange] _
		, [13711, 15175, " ", $vqrange] _
		, [14357, 13851, " ", $vqrange] _
		, [18316, 13479, " ", $vqrange] ]

		Local $aWaypointsC[31][4] = [ [18940, 13528, " ", $vqrange] _ 
		, [16825, 12640, " ", $vqrange] _
		, [13329, 8718, " ", $vqrange] _
		, [10984, 10887, " ", $vqrange] _
		, [7908, 9623, " ", $vqrange] _
		, [4904, 8548, " ", $vqrange] _
		, [3580, 6643, " ", $vqrange] _
		, [2715, 4556, " ", $vqrange] _
		, [5620, 4806, " ", $vqrange] _
		, [7832, 4671, " ", $vqrange] _
		, [9683, 6931, " ", $vqrange] _
		, [10885, 6593, " ", $vqrange] _
		, [10743, 3121, " ", $vqrange] _
		, [9581, 2495, " ", $vqrange] _
		, [9661, 116, " ", $vqrange] _
		, [9880, -2190, " ", $vqrange] _
		, [10628, -5168, " ", $vqrange] _
		, [12349, -2815, " ", $vqrange] _
		, [14094, -3064, " ", $vqrange] _
		, [18058, -5788, " ", $vqrange] _
		, [15578, -6722, " ", $vqrange] _
		, [16219, -8966, " ", $vqrange] _
		, [17227, -9798, " ", $vqrange] _
		, [18976, -11769, " ", $vqrange] _
		, [18241, -13206, " ", $vqrange] _
		, [17630, -15042, " ", $vqrange] _
		, [18575, -17801, " ", $vqrange] _
		, [14428, -15728, " ", $vqrange] _
		, [12436, -14541, " ", $vqrange] _
		, [11229, -17276, " ", $vqrange] _
		, [12740, -18585, " ", $vqrange] ]

		Local $aWaypointsD[49][4] = [ [8261, -17863, " ", $vqrange] _ 
		, [8391, -14920, " ", $vqrange] _
		, [6529, -12495, " ", $vqrange] _
		, [2828, -10430, " ", $vqrange] _
		, [1417, -9248, " ", $vqrange] _
		, [4616, -7731, " ", $vqrange] _
		, [5472, -5834, " ", $vqrange] _
		, [9081, -6388, " ", $vqrange] _
		, [11362, -9412, " ", $vqrange] _
		, [12359, -10791, " ", $vqrange] _
		, [13887, -13063, " ", $vqrange] _
		, [12359, -10791, " ", $vqrange] _
		, [8552, -5490, " ", $vqrange] _
		, [6332, -2272, " ", $vqrange] _
		, [5145, -244, " ", $vqrange] _
		, [2979, 1756, " ", $vqrange] _
		, [-457, 5362, " ", $vqrange] _
		, [-2920, 5909, " ", $vqrange] _
		, [-4420, 5149, " ", $vqrange] _
		, [-4024, 2860, " ", $vqrange] _
		, [-2636, -1899, " ", $vqrange] _
		, [-1202, -3766, " ", $vqrange] _
		, [206, -5441, " ", $vqrange] _
		, [1219, -9859, " ", $vqrange] _
		, [1012, -14866, " ", $vqrange] _
		, [3676, -18815, " ", $vqrange] _
		, [708, -14225, " ", $vqrange] _
		, [-2949, -13904, " ", $vqrange] _
		, [-4698, -16692, " ", $vqrange] _
		, [-7186, -17918, " ", $vqrange] _
		, [-9095, -13566, " ", $vqrange] _
		, [-9075, -17382, " ", $vqrange] _
		, [-9858, -18874, " ", $vqrange] _
		, [-12395, -17689, " ", $vqrange] _
		, [-15150, -13881, " ", $vqrange] _
		, [-16131, -12448, " ", $vqrange] _
		, [-14170, -9844, " ", $vqrange] _
		, [-11395, -10307, " ", $vqrange] _
		, [-10276, -11142, " ", $vqrange] _
		, [-6649, -10048, " ", $vqrange] _
		, [-6670, -8438, " ", $vqrange] _
		, [-5561, -7576, " ", $vqrange] _
		, [-5546, -4426, " ", $vqrange] _
		, [-10259, -4380, " ", $vqrange] _
		, [-13300, -3447, " ", $vqrange] _
		, [-13316, -5966, " ", $vqrange] _
		, [-13909, -6123, " ", $vqrange] _
		, [-12010, -438, " ", $vqrange] _
		, [-6329, 832, " ", $vqrange] ]
		
		Local $aWaypoints[109][4] = [ [-19207, -14374, " ", $vqrange] _
		, [-18194, -10506, " ", $vqrange] _
		, [-18454, -7118, " ", $vqrange] _
		, [-19040, -4312, " ", $vqrange] _
		, [-17693, 351, " ", $vqrange] _
		, [-17639, 4548, " ", $vqrange] _
		, [-19518, 5342, " ", $vqrange] _
		, [-19201, 7077, " ", $vqrange] _
		, [-18727, 14739, " ", $vqrange] _
		, [-19258, 16571, " ", $vqrange] _
		, [-15041, 14997, " ", $vqrange] _
		, [-14721, 14815, " ", $vqrange] _
		, [-11406, 12563, " ", $vqrange] _
		, [-13026, 10202, " ", $vqrange] _
		, [-11580, 7518, " ", $vqrange] _
		, [-8552, 11450, " ", $vqrange] _
		, [-6250, 11743, " ", $vqrange] _
		, [-1796, 11324, " ", $vqrange] _
		, [-759, 12977, " ", $vqrange] _
		, [1037, 13851, " ", $vqrange] _
		, [2050, 10857, " ", $vqrange] _
		, [1037, 13851, " ", $vqrange] _
		, [4116, 16101, " ", $vqrange] _
		, [6566, 14923, " ", $vqrange] _
		, [9114, 13985, " ", $vqrange] _
		, [10615, 14788, " ", $vqrange] _
		, [13711, 15175, " ", $vqrange] _
		, [14357, 13851, " ", $vqrange] _
		, [18316, 13479, " ", $vqrange] _
		, [18940, 13528, " ", $vqrange] _ 
		, [16825, 12640, " ", $vqrange] _
		, [13329, 8718, " ", $vqrange] _
		, [10984, 10887, " ", $vqrange] _
		, [7908, 9623, " ", $vqrange] _
		, [4904, 8548, " ", $vqrange] _
		, [3580, 6643, " ", $vqrange] _
		, [2715, 4556, " ", $vqrange] _
		, [5620, 4806, " ", $vqrange] _
		, [7832, 4671, " ", $vqrange] _
		, [9683, 6931, " ", $vqrange] _
		, [10885, 6593, " ", $vqrange] _
		, [10743, 3121, " ", $vqrange] _
		, [9581, 2495, " ", $vqrange] _
		, [9661, 116, " ", $vqrange] _
		, [9880, -2190, " ", $vqrange] _
		, [10628, -5168, " ", $vqrange] _
		, [12349, -2815, " ", $vqrange] _
		, [14094, -3064, " ", $vqrange] _
		, [18058, -5788, " ", $vqrange] _
		, [15578, -6722, " ", $vqrange] _
		, [16219, -8966, " ", $vqrange] _
		, [17227, -9798, " ", $vqrange] _
		, [18976, -11769, " ", $vqrange] _
		, [18241, -13206, " ", $vqrange] _
		, [17630, -15042, " ", $vqrange] _
		, [18575, -17801, " ", $vqrange] _
		, [14428, -15728, " ", $vqrange] _
		, [12436, -14541, " ", $vqrange] _
		, [11229, -17276, " ", $vqrange] _
		, [12740, -18585, " ", $vqrange] _
		, [8261, -17863, " ", $vqrange] _ 
		, [8391, -14920, " ", $vqrange] _
		, [6529, -12495, " ", $vqrange] _
		, [2828, -10430, " ", $vqrange] _
		, [1417, -9248, " ", $vqrange] _
		, [4616, -7731, " ", $vqrange] _
		, [5472, -5834, " ", $vqrange] _
		, [9081, -6388, " ", $vqrange] _
		, [11362, -9412, " ", $vqrange] _
		, [12359, -10791, " ", $vqrange] _
		, [13887, -13063, " ", $vqrange] _
		, [12359, -10791, " ", $vqrange] _
		, [8552, -5490, " ", $vqrange] _
		, [6332, -2272, " ", $vqrange] _
		, [5145, -244, " ", $vqrange] _
		, [2979, 1756, " ", $vqrange] _
		, [-457, 5362, " ", $vqrange] _
		, [-2920, 5909, " ", $vqrange] _
		, [-4420, 5149, " ", $vqrange] _
		, [-4024, 2860, " ", $vqrange] _
		, [-2636, -1899, " ", $vqrange] _
		, [-1202, -3766, " ", $vqrange] _
		, [206, -5441, " ", $vqrange] _
		, [1219, -9859, " ", $vqrange] _
		, [1012, -14866, " ", $vqrange] _
		, [3676, -18815, " ", $vqrange] _
		, [708, -14225, " ", $vqrange] _
		, [-2949, -13904, " ", $vqrange] _
		, [-4698, -16692, " ", $vqrange] _
		, [-7186, -17918, " ", $vqrange] _
		, [-9095, -13566, " ", $vqrange] _
		, [-9075, -17382, " ", $vqrange] _
		, [-9858, -18874, " ", $vqrange] _
		, [-12395, -17689, " ", $vqrange] _
		, [-15150, -13881, " ", $vqrange] _
		, [-16131, -12448, " ", $vqrange] _
		, [-14170, -9844, " ", $vqrange] _
		, [-11395, -10307, " ", $vqrange] _
		, [-10276, -11142, " ", $vqrange] _
		, [-6649, -10048, " ", $vqrange] _
		, [-6670, -8438, " ", $vqrange] _
		, [-5561, -7576, " ", $vqrange] _
		, [-5546, -4426, " ", $vqrange] _
		, [-10259, -4380, " ", $vqrange] _
		, [-13300, -3447, " ", $vqrange] _
		, [-13316, -5966, " ", $vqrange] _
		, [-13909, -6123, " ", $vqrange] _
		, [-12010, -438, " ", $vqrange] _
		, [-6329, 832, " ", $vqrange] ]
		
		GoNearestNPCToCoords(-18642, -18011)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-17092, 10583)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
	
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(9812, -18747)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsD)
		
          	MoveAndAggroVQReverse($aWaypoints)

    EndIf
EndFunc
