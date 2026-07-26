#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutBarbarousShore()
	MoveTo(-14174, 18358)
	Move(-13900, 18250)
	WaitForLoad()
EndFunc

Func VQBarbarousShore()
    If GetMapID() <> $BarbarousShore_Map And GetMapID() <> $BarbarousShore_Outpost  Then TravelTo($BarbarousShore_Outpost)   
    If GetMapID() = $BarbarousShore_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $BarbarousShore_Map Then    
		
		Local $aWaypointsA[6][4] = [ [-11151, 14892, " ", $vqrange] _
		, [-8457, 13802, " ", $vqrange] _
		, [-8809, 16884, " ", $vqrange] _
		, [-3326, 17036, " ", $vqrange] _
		, [-1553, 18796, " ", $vqrange] _
		, [770, 16144, " ", $vqrange] ]

		Local $aWaypointsB[22][4] = [ [3401, 18857, " ", $vqrange] _
		, [110, 13263, " ", $vqrange] _
		, [-81, 7907, " ", $vqrange] _
		, [-3771, 7386, " ", $vqrange] _
		, [-654, 11927, " ", $vqrange] _
		, [-2790, 13118, " ", $vqrange] _
		, [-7102, 14903, " ", $vqrange] _
		, [-11104, 13807, " ", $vqrange] _
		, [-13280, 13661, " ", $vqrange] _
		, [-13373, 11835, " ", $vqrange] _
		, [-12143, 11173, " ", $vqrange] _
		, [-13212, 9998, " ", $vqrange] _
		, [-15454, 8706, " ", $vqrange] _
		, [-14356, 5006, " ", $vqrange] _
		, [-16093, 2982, " ", $vqrange] _
		, [-16888, 1077, " ", $vqrange] _
		, [-13990, -124, " ", $vqrange] _
		, [-11700, 689, " ", $vqrange] _
		, [-10747, 2893, " ", $vqrange] _
		, [-13492, 4104, " ", $vqrange] _
		, [-8411, 5219, " ", $vqrange] _
		, [-7984, 7710, " ", $vqrange] ]

		Local $aWaypointsC[60][4] = [ [-4284, 2227, " ", $vqrange] _
		, [-4002, -642, " ", $vqrange] _
		, [-125, 644, " ", $vqrange] _
		, [2761, 956, " ", $vqrange] _
		, [2285, 4298, " ", $vqrange] _
		, [831, -1189, " ", $vqrange] _
		, [-3047, 537, " ", $vqrange] _
		, [-6124, -1550, " ", $vqrange] _
		, [-9591, -4642, " ", $vqrange] _
		, [-11577, -6627, " ", $vqrange] _
		, [-11712, -5055, " ", $vqrange] _
		, [-14393, -3068, " ", $vqrange] _
		, [-16681, -2974, " ", $vqrange] _
		, [-14909, -1100, " ", $vqrange] _
		, [-13117, -6759, " ", $vqrange] _
		, [-12526, -8895, " ", $vqrange] _
		, [-14336, -10666, " ", $vqrange] _
		, [-13502, -12115, " ", $vqrange] _
		, [-15075, -14179, " ", $vqrange] _
		, [-17015, -14681, " ", $vqrange] _
		, [-18882, -14190, " ", $vqrange] _
		, [-18400, -19287, " ", $vqrange] _
		, [-15656, -18153, " ", $vqrange] _
		, [-14277, -17670, " ", $vqrange] _
		, [-14016, -19412, " ", $vqrange] _
		, [-11142, -18277, " ", $vqrange] _
		, [-12989, -17122, " ", $vqrange] _
		, [-12800, -15562, " ", $vqrange] _
		, [-9602, -14067, " ", $vqrange] _
		, [-9395, -13974, " ", $vqrange] _
		, [-5521, -14336, " ", $vqrange] _
		, [-9292, -13998, " ", $vqrange] _
		, [-10094, -11372, " ", $vqrange] _
		, [-9506, -8644, " ", $vqrange] _
		, [-6888, -9920, " ", $vqrange] _
		, [-6347, -7537, " ", $vqrange] _
		, [-3699, -4676, " ", $vqrange] _
		, [-1327, -4701, " ", $vqrange] _
		, [1869, -3370, " ", $vqrange] _
		, [4454, -6756, " ", $vqrange] _
		, [6163, -8259, " ", $vqrange] _
		, [7846, -4842, " ", $vqrange] _
		, [11582, -8924, " ", $vqrange] _
		, [11820, -9677, " ", $vqrange] _
		, [15891, -7532, " ", $vqrange] _
		, [15717, -4927, " ", $vqrange] _
		, [16236, 438, " ", $vqrange] _
		, [16539, 5965, " ", $vqrange] _
		, [14486, 6982, " ", $vqrange] _
		, [13202, 7865, " ", $vqrange] _
		, [12411, 9549, " ", $vqrange] _
		, [10617, 10255, " ", $vqrange] _
		, [8183, 13006, " ", $vqrange] _
		, [11352, 8552, " ", $vqrange] _
		, [9414, 4419, " ", $vqrange] _
		, [11435, 528, " ", $vqrange] _
		, [13152, -4574, " ", $vqrange] _
		, [11042, -5684, " ", $vqrange] _
		, [12793, -8586, " ", $vqrange] _
		, [14351, -5172, " ", $vqrange] ]
		
		Local $aWaypoints[88][4] = [ [-11151, 14892, " ", $vqrange] _
		, [-8457, 13802, " ", $vqrange] _
		, [-8809, 16884, " ", $vqrange] _
		, [-3326, 17036, " ", $vqrange] _
		, [-1553, 18796, " ", $vqrange] _
		, [770, 16144, " ", $vqrange] _
		, [3401, 18857, " ", $vqrange] _
		, [110, 13263, " ", $vqrange] _
		, [-81, 7907, " ", $vqrange] _
		, [-3771, 7386, " ", $vqrange] _
		, [-654, 11927, " ", $vqrange] _
		, [-2790, 13118, " ", $vqrange] _
		, [-7102, 14903, " ", $vqrange] _
		, [-11104, 13807, " ", $vqrange] _
		, [-13280, 13661, " ", $vqrange] _
		, [-13373, 11835, " ", $vqrange] _
		, [-12143, 11173, " ", $vqrange] _
		, [-13212, 9998, " ", $vqrange] _
		, [-15454, 8706, " ", $vqrange] _
		, [-14356, 5006, " ", $vqrange] _
		, [-16093, 2982, " ", $vqrange] _
		, [-16888, 1077, " ", $vqrange] _
		, [-13990, -124, " ", $vqrange] _
		, [-11700, 689, " ", $vqrange] _
		, [-10747, 2893, " ", $vqrange] _
		, [-13492, 4104, " ", $vqrange] _
		, [-8411, 5219, " ", $vqrange] _
		, [-7984, 7710, " ", $vqrange] _
		, [-4284, 2227, " ", $vqrange] _
		, [-4002, -642, " ", $vqrange] _
		, [-125, 644, " ", $vqrange] _
		, [2761, 956, " ", $vqrange] _
		, [2285, 4298, " ", $vqrange] _
		, [831, -1189, " ", $vqrange] _
		, [-3047, 537, " ", $vqrange] _
		, [-6124, -1550, " ", $vqrange] _
		, [-9591, -4642, " ", $vqrange] _
		, [-11577, -6627, " ", $vqrange] _
		, [-11712, -5055, " ", $vqrange] _
		, [-14393, -3068, " ", $vqrange] _
		, [-16681, -2974, " ", $vqrange] _
		, [-14909, -1100, " ", $vqrange] _
		, [-13117, -6759, " ", $vqrange] _
		, [-12526, -8895, " ", $vqrange] _
		, [-14336, -10666, " ", $vqrange] _
		, [-13502, -12115, " ", $vqrange] _
		, [-15075, -14179, " ", $vqrange] _
		, [-17015, -14681, " ", $vqrange] _
		, [-18882, -14190, " ", $vqrange] _
		, [-18400, -19287, " ", $vqrange] _
		, [-15656, -18153, " ", $vqrange] _
		, [-14277, -17670, " ", $vqrange] _
		, [-14016, -19412, " ", $vqrange] _
		, [-11142, -18277, " ", $vqrange] _
		, [-12989, -17122, " ", $vqrange] _
		, [-12800, -15562, " ", $vqrange] _
		, [-9602, -14067, " ", $vqrange] _
		, [-9395, -13974, " ", $vqrange] _
		, [-5521, -14336, " ", $vqrange] _
		, [-9292, -13998, " ", $vqrange] _
		, [-10094, -11372, " ", $vqrange] _
		, [-9506, -8644, " ", $vqrange] _
		, [-6888, -9920, " ", $vqrange] _
		, [-6347, -7537, " ", $vqrange] _
		, [-3699, -4676, " ", $vqrange] _
		, [-1327, -4701, " ", $vqrange] _
		, [1869, -3370, " ", $vqrange] _
		, [4454, -6756, " ", $vqrange] _
		, [6163, -8259, " ", $vqrange] _
		, [7846, -4842, " ", $vqrange] _
		, [11582, -8924, " ", $vqrange] _
		, [11820, -9677, " ", $vqrange] _
		, [15891, -7532, " ", $vqrange] _
		, [15717, -4927, " ", $vqrange] _
		, [16236, 438, " ", $vqrange] _
		, [16539, 5965, " ", $vqrange] _
		, [14486, 6982, " ", $vqrange] _
		, [13202, 7865, " ", $vqrange] _
		, [12411, 9549, " ", $vqrange] _
		, [10617, 10255, " ", $vqrange] _
		, [8183, 13006, " ", $vqrange] _
		, [11352, 8552, " ", $vqrange] _
		, [9414, 4419, " ", $vqrange] _
		, [11435, 528, " ", $vqrange] _
		, [13152, -4574, " ", $vqrange] _
		, [11042, -5684, " ", $vqrange] _
		, [12793, -8586, " ", $vqrange] _
		, [14351, -5172, " ", $vqrange] ]
				
		GoNearestNPCToCoords(-11238, 17290)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(2678, 16611)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-5451, 5782)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
			
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc