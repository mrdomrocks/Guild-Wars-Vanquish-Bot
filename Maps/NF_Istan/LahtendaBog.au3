#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutLahtendaBog()
	MoveTo(1873, -460)
	MoveTo(227, -3402)
	MoveTo(298, -4114)
	Move(298, -4500)
	WaitForLoad()
EndFunc

Func VQLahtendaBog()
    If GetMapID() <> $LahtendaBog_Map And GetMapID() <> $LahtendaBog_Outpost  Then TravelTo($LahtendaBog_Outpost)   
    If GetMapID() = $LahtendaBog_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $LahtendaBog_Map Then    
		
		Local $aWaypointsA[14][4] = [ [4978, 17330, " ", $vqrange] _
		, [3321, 15208, " ", $vqrange] _
		, [1892, 11866, " ", $vqrange] _
		, [-379, 13494, " ", $vqrange] _
		, [-417, 15700, " ", $vqrange] _
		, [-444, 18193, " ", $vqrange] _
		, [-397, 15281, " ", $vqrange] _
		, [-2513, 15412, " ", $vqrange] _
		, [-2483, 12416, " ", $vqrange] _
		, [-2835, 10251, " ", $vqrange] _
		, [-5643, 13670, " ", $vqrange] _
		, [-7423, 15361, " ", $vqrange] _
		, [-7597, 16227, " ", $vqrange] _
		, [-8959, 11261, " ", $vqrange] ]


		Local $aWaypointsB[26][4] = [ [-12228, 7579, " ", $vqrange] _
		, [-14101, 8205, " ", $vqrange] _
		, [-15387, 10300, " ", $vqrange] _
		, [-17004, 9751, " ", $vqrange] _
		, [-15020, 7754, " ", $vqrange] _
		, [-14856, 4965, " ", $vqrange] _
		, [-13769, 4162, " ", $vqrange] _
		, [-11289, 3536, " ", $vqrange] _
		, [-8446, 2903, " ", $vqrange] _
		, [-6745, 2789, " ", $vqrange] _
		, [-3609, 4325, " ", $vqrange] _
		, [-5732, 6734, " ", $vqrange] _
		, [-9500, 7217, " ", $vqrange] _
		, [-14583, 5745, " ", $vqrange] _
		, [-14928, 2032, " ", $vqrange] _
		, [-12846, 757, " ", $vqrange] _
		, [-13609, -811, " ", $vqrange] _
		, [-13075, -2871, " ", $vqrange] _
		, [-11040, -2884, " ", $vqrange] _
		, [-8695, -2715, " ", $vqrange] _
		, [-5839, -2998, " ", $vqrange] _
		, [-6254, -652, " ", $vqrange] _
		, [-6820, 1920, " ", $vqrange] _
		, [-11280, 3420, " ", $vqrange] _
		, [-15048, 272, " ", $vqrange] _
		, [-16169, -2284, " ", $vqrange] ]

		Local $aWaypointsC[78][4] = [ [-15572, -9019, " ", $vqrange] _
		, [-13755, -9337, " ", $vqrange] _
		, [-14562, -12148, " ", $vqrange] _
		, [-14314, -13563, " ", $vqrange] _
		, [-13927, -14140, " ", $vqrange] _
		, [-11741, -14108, " ", $vqrange] _
		, [-11050, -16957, " ", $vqrange] _
		, [-10800, -11636, " ", $vqrange] _
		, [-6417, -12213, " ", $vqrange] _
		, [-3685, -12145, " ", $vqrange] _
		, [-1040, -9208, " ", $vqrange] _
		, [-1462, -5835, " ", $vqrange] _
		, [-4658, -3740, " ", $vqrange] _
		, [-1394, -5803, " ", $vqrange] _
		, [1631, -5421, " ", $vqrange] _
		, [3838, -8437, " ", $vqrange] _
		, [6669, -8660, " ", $vqrange] _
		, [2821, -11832, " ", $vqrange] _
		, [-208, -9751, " ", $vqrange] _
		, [-169, -13788, " ", $vqrange] _
		, [-3464, -16464, " ", $vqrange] _
		, [-3553, -12640, " ", $vqrange] _
		, [-3182, -17151, " ", $vqrange] _
		, [3495, -16802, " ", $vqrange] _
		, [4307, -18165, " ", $vqrange] _
		, [5113, -18413, " ", $vqrange] _
		, [8150, -17086, " ", $vqrange] _
		, [10155, -16587, " ", $vqrange] _
		, [10851, -13488, " ", $vqrange] _
		, [7844, -11756, " ", $vqrange] _
		, [10961, -8999, " ", $vqrange] _
		, [12182, -8547, " ", $vqrange] _
		, [14202, -9741, " ", $vqrange] _
		, [10107, -6172, " ", $vqrange] _
		, [12922, -6049, " ", $vqrange] _
		, [14581, -6380, " ", $vqrange] _
		, [13512, -3570, " ", $vqrange] _
		, [15070, -933, " ", $vqrange] _
		, [16321, -1626, " ", $vqrange] _
		, [15721, 276, " ", $vqrange] _
		, [16679, 1394, " ", $vqrange] _
		, [13267, 2690, " ", $vqrange] _
		, [14987, 4483, " ", $vqrange] _
		, [13366, 7799, " ", $vqrange] _
		, [12683, 8783, " ", $vqrange] _
		, [16886, 8486, " ", $vqrange] _
		, [12560, 9565, " ", $vqrange] _
		, [14461, 11286, " ", $vqrange] _
		, [15812, 11831, " ", $vqrange] _
		, [11141, 9549, " ", $vqrange] _
		, [11500, 12451, " ", $vqrange] _
		, [12411, 15366, " ", $vqrange] _
		, [11005, 14484, " ", $vqrange] _
		, [7654, 13025, " ", $vqrange] _
		, [7871, 10941, " ", $vqrange] _
		, [7282, 9500, " ", $vqrange] _
		, [6703, 6789, " ", $vqrange] _
		, [8835, 6570, " ", $vqrange] _
		, [11210, 3897, " ", $vqrange] _
		, [13211, 2628, " ", $vqrange] _
		, [8820, 3714, " ", $vqrange] _
		, [8187, 1129, " ", $vqrange] _
		, [6459, 834, " ", $vqrange] _
		, [9085, -1146, " ", $vqrange] _
		, [8470, -4403, " ", $vqrange] _
		, [5899, -3722, " ", $vqrange] _
		, [2173, -4109, " ", $vqrange] _
		, [6423, -4024, " ", $vqrange] _
		, [7944, -1336, " ", $vqrange] _
		, [4615, 602, " ", $vqrange] _
		, [2445, 596, " ", $vqrange] _
		, [-845, 974, " ", $vqrange] _
		, [756, 3044, " ", $vqrange] _
		, [1148, 6312, " ", $vqrange] _
		, [-2550, 9613, " ", $vqrange] _
		, [163, 9360, " ", $vqrange] _
		, [3502, 7059, " ", $vqrange] _
		, [4913, 3139, " ", $vqrange] ]


		
		Local $aWaypoints[118][4] = [ [4978, 17330, " ", $vqrange] _
		, [3321, 15208, " ", $vqrange] _
		, [1892, 11866, " ", $vqrange] _
		, [-379, 13494, " ", $vqrange] _
		, [-417, 15700, " ", $vqrange] _
		, [-444, 18193, " ", $vqrange] _
		, [-397, 15281, " ", $vqrange] _
		, [-2513, 15412, " ", $vqrange] _
		, [-2483, 12416, " ", $vqrange] _
		, [-2835, 10251, " ", $vqrange] _
		, [-5643, 13670, " ", $vqrange] _
		, [-7423, 15361, " ", $vqrange] _
		, [-7597, 16227, " ", $vqrange] _
		, [-8959, 11261, " ", $vqrange] _
		, [-12228, 7579, " ", $vqrange] _
		, [-14101, 8205, " ", $vqrange] _
		, [-15387, 10300, " ", $vqrange] _
		, [-17004, 9751, " ", $vqrange] _
		, [-15020, 7754, " ", $vqrange] _
		, [-14856, 4965, " ", $vqrange] _
		, [-13769, 4162, " ", $vqrange] _
		, [-11289, 3536, " ", $vqrange] _
		, [-8446, 2903, " ", $vqrange] _
		, [-6745, 2789, " ", $vqrange] _
		, [-3609, 4325, " ", $vqrange] _
		, [-5732, 6734, " ", $vqrange] _
		, [-9500, 7217, " ", $vqrange] _
		, [-14583, 5745, " ", $vqrange] _
		, [-14928, 2032, " ", $vqrange] _
		, [-12846, 757, " ", $vqrange] _
		, [-13609, -811, " ", $vqrange] _
		, [-13075, -2871, " ", $vqrange] _
		, [-11040, -2884, " ", $vqrange] _
		, [-8695, -2715, " ", $vqrange] _
		, [-5839, -2998, " ", $vqrange] _
		, [-6254, -652, " ", $vqrange] _
		, [-6820, 1920, " ", $vqrange] _
		, [-11280, 3420, " ", $vqrange] _
		, [-15048, 272, " ", $vqrange] _
		, [-16169, -2284, " ", $vqrange] _
		, [-15572, -9019, " ", $vqrange] _
		, [-13755, -9337, " ", $vqrange] _
		, [-14562, -12148, " ", $vqrange] _
		, [-14314, -13563, " ", $vqrange] _
		, [-13927, -14140, " ", $vqrange] _
		, [-11741, -14108, " ", $vqrange] _
		, [-11050, -16957, " ", $vqrange] _
		, [-10800, -11636, " ", $vqrange] _
		, [-6417, -12213, " ", $vqrange] _
		, [-3685, -12145, " ", $vqrange] _
		, [-1040, -9208, " ", $vqrange] _
		, [-1462, -5835, " ", $vqrange] _
		, [-4658, -3740, " ", $vqrange] _
		, [-1394, -5803, " ", $vqrange] _
		, [1631, -5421, " ", $vqrange] _
		, [3838, -8437, " ", $vqrange] _
		, [6669, -8660, " ", $vqrange] _
		, [2821, -11832, " ", $vqrange] _
		, [-208, -9751, " ", $vqrange] _
		, [-169, -13788, " ", $vqrange] _
		, [-3464, -16464, " ", $vqrange] _
		, [-3553, -12640, " ", $vqrange] _
		, [-3182, -17151, " ", $vqrange] _
		, [3495, -16802, " ", $vqrange] _
		, [4307, -18165, " ", $vqrange] _
		, [5113, -18413, " ", $vqrange] _
		, [8150, -17086, " ", $vqrange] _
		, [10155, -16587, " ", $vqrange] _
		, [10851, -13488, " ", $vqrange] _
		, [7844, -11756, " ", $vqrange] _
		, [10961, -8999, " ", $vqrange] _
		, [12182, -8547, " ", $vqrange] _
		, [14202, -9741, " ", $vqrange] _
		, [10107, -6172, " ", $vqrange] _
		, [12922, -6049, " ", $vqrange] _
		, [14581, -6380, " ", $vqrange] _
		, [13512, -3570, " ", $vqrange] _
		, [15070, -933, " ", $vqrange] _
		, [16321, -1626, " ", $vqrange] _
		, [15721, 276, " ", $vqrange] _
		, [16679, 1394, " ", $vqrange] _
		, [13267, 2690, " ", $vqrange] _
		, [14987, 4483, " ", $vqrange] _
		, [13366, 7799, " ", $vqrange] _
		, [12683, 8783, " ", $vqrange] _
		, [16886, 8486, " ", $vqrange] _
		, [12560, 9565, " ", $vqrange] _
		, [14461, 11286, " ", $vqrange] _
		, [15812, 11831, " ", $vqrange] _
		, [11141, 9549, " ", $vqrange] _
		, [11500, 12451, " ", $vqrange] _
		, [12411, 15366, " ", $vqrange] _
		, [11005, 14484, " ", $vqrange] _
		, [7654, 13025, " ", $vqrange] _
		, [7871, 10941, " ", $vqrange] _
		, [7282, 9500, " ", $vqrange] _
		, [6703, 6789, " ", $vqrange] _
		, [8835, 6570, " ", $vqrange] _
		, [11210, 3897, " ", $vqrange] _
		, [13211, 2628, " ", $vqrange] _
		, [8820, 3714, " ", $vqrange] _
		, [8187, 1129, " ", $vqrange] _
		, [6459, 834, " ", $vqrange] _
		, [9085, -1146, " ", $vqrange] _
		, [8470, -4403, " ", $vqrange] _
		, [5899, -3722, " ", $vqrange] _
		, [2173, -4109, " ", $vqrange] _
		, [6423, -4024, " ", $vqrange] _
		, [7944, -1336, " ", $vqrange] _
		, [4615, 602, " ", $vqrange] _
		, [2445, 596, " ", $vqrange] _
		, [-845, 974, " ", $vqrange] _
		, [756, 3044, " ", $vqrange] _
		, [1148, 6312, " ", $vqrange] _
		, [-2550, 9613, " ", $vqrange] _
		, [163, 9360, " ", $vqrange] _
		, [3502, 7059, " ", $vqrange] _
		, [4913, 3139, " ", $vqrange] ]

		GoNearestNPCToCoords(7067, 18385)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-10459, 8716)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-16808, -5438)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc