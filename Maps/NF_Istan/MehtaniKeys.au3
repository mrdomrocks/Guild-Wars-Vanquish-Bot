#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMehtaniKeys()
	MoveTo(303, -1560)
	MoveTo(3926, -3966)
	MoveTo(4286, -3765)
	Move(4500, -3765)
	WaitForLoad()
EndFunc

Func VQMehtaniKeys()
    If GetMapID() <> $MehtaniKeys_Map And GetMapID() <> $MehtaniKeys_Outpost  Then TravelTo($MehtaniKeys_Outpost)   
    If GetMapID() = $MehtaniKeys_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $MehtaniKeys_Map Then    	

		Local $aWaypointsA[8][4] = [ [-18295, 9208, " ", $vqrange] _
		, [-18745, 5349, " ", $vqrange] _
		, [-16162, 3596, " ", $vqrange] _
		, [-15740, 1437, " ", $vqrange] _
		, [-13527, -649, " ", $vqrange] _
		, [-15207, -2338, " ", $vqrange] _
		, [-17135, -3041, " ", $vqrange] _
		, [-13905, -7812, " ", $vqrange] ]

		Local $aWaypointsB[14][4] = [ [-14751, -11438, " ", $vqrange] _
		, [-16303, -12243, " ", $vqrange] _
		, [-11418, -14069, " ", $vqrange] _
		, [-12837, -15869, " ", $vqrange] _
		, [-9532, -11870, " ", $vqrange] _
		, [-7764, -10698, " ", $vqrange] _
		, [-6791, -11808, " ", $vqrange] _
		, [-2987, -11382, " ", $vqrange] _
		, [-3531, -8943, " ", $vqrange] _
		, [-2984, -13488, " ", $vqrange] _
		, [-393, -12833, " ", $vqrange] _
		, [-87, -15914, " ", $vqrange] _
		, [-884, -18621, " ", $vqrange] _
		, [2433, -19901, " ", $vqrange] ]
		
		Local $aWaypointsC[13][4] = [ [3663, -14860, " ", $vqrange] _
		, [5903, -16218, " ", $vqrange] _
		, [7024, -17224, " ", $vqrange] _
		, [5267, -12562, " ", $vqrange] _
		, [6941, -12002, " ", $vqrange] _
		, [7898, -11062, " ", $vqrange] _
		, [9888, -13314, " ", $vqrange] _
		, [8323, -9221, " ", $vqrange] _
		, [5383, -7743, " ", $vqrange] _
		, [3907, -6725, " ", $vqrange] _
		, [1898, -8888, " ", $vqrange] _
		, [2956, -11617, " ", $vqrange] _
		, [3229, -6308, " ", $vqrange] ]
		
		Local $aWaypointsD[18][4] = [ [5312, -2084, " ", $vqrange] _
		, [8590, -4741, " ", $vqrange] _
		, [10364, -3954, " ", $vqrange] _
		, [9284, -1986, " ", $vqrange] _
		, [8249, 346, " ", $vqrange] _
		, [9336, 4163, " ", $vqrange] _
		, [8627, 5815, " ", $vqrange] _
		, [4999, 5178, " ", $vqrange] _
		, [2718, 6447, " ", $vqrange] _
		, [8492, 8999, " ", $vqrange] _
		, [10664, 6606, " ", $vqrange] _
		, [10240, 9194, " ", $vqrange] _
		, [9639, 10560, " ", $vqrange] _
		, [9255, 10094, " ", $vqrange] _
		, [4346, 12430, " ", $vqrange] _
		, [-717, 11305, " ", $vqrange] _
		, [-906, 13154, " ", $vqrange] _
		, [-826, 11153, " ", $vqrange] ]
		
		Local $aWaypointsE[29][4] = [ [-3321, 7011, " ", $vqrange] _
		, [-1507, 5717, " ", $vqrange] _
		, [698, 3600, " ", $vqrange] _
		, [-1507, 5717, " ", $vqrange] _
		, [-6250, 4554, " ", $vqrange] _
		, [-6954, 955, " ", $vqrange] _
		, [-14035, 291, " ", $vqrange] _
		, [-13495, 5886, " ", $vqrange] _
		, [-10378, 4388, " ", $vqrange] _
		, [-12645, 9337, " ", $vqrange] _
		, [-11670, 14013, " ", $vqrange] _
		, [-12993, 15758, " ", $vqrange] _
		, [-13483, 16904, " ", $vqrange] _
		, [-17024, 17310, " ", $vqrange] _
		, [-15774, 11226, " ", $vqrange] _
		, [-15525, 7189, " ", $vqrange] _
		, [-14053, 185, " ", $vqrange] _
		, [-10457, -3568, " ", $vqrange] _
		, [-6478, -6316, " ", $vqrange] _
		, [-226, -10403, " ", $vqrange] _
		, [3155, -6182, " ", $vqrange] _
		, [4040, -669, " ", $vqrange] _
		, [1974, 3174, " ", $vqrange] _
		, [-2810, 5604, " ", $vqrange] _
		, [-6276, 4450, " ", $vqrange] _
		, [-7926, 1876, " ", $vqrange] _
		, [-4409, -934, " ", $vqrange] _
		, [-2709, -1452, " ", $vqrange] _
		, [69, -2046, " ", $vqrange] ]
		
		Local $aWaypoints[82][4] = [ [-18295, 9208, " ", $vqrange] _
		, [-18745, 5349, " ", $vqrange] _
		, [-16162, 3596, " ", $vqrange] _
		, [-15740, 1437, " ", $vqrange] _
		, [-13527, -649, " ", $vqrange] _
		, [-15207, -2338, " ", $vqrange] _
		, [-17135, -3041, " ", $vqrange] _
		, [-13905, -7812, " ", $vqrange] _
		, [-14751, -11438, " ", $vqrange] _
		, [-16303, -12243, " ", $vqrange] _
		, [-11418, -14069, " ", $vqrange] _
		, [-12837, -15869, " ", $vqrange] _
		, [-9532, -11870, " ", $vqrange] _
		, [-7764, -10698, " ", $vqrange] _
		, [-6791, -11808, " ", $vqrange] _
		, [-2987, -11382, " ", $vqrange] _
		, [-3531, -8943, " ", $vqrange] _
		, [-2984, -13488, " ", $vqrange] _
		, [-393, -12833, " ", $vqrange] _
		, [-87, -15914, " ", $vqrange] _
		, [-884, -18621, " ", $vqrange] _
		, [2433, -19901, " ", $vqrange] _
		, [3663, -14860, " ", $vqrange] _
		, [5903, -16218, " ", $vqrange] _
		, [7024, -17224, " ", $vqrange] _
		, [5267, -12562, " ", $vqrange] _
		, [6941, -12002, " ", $vqrange] _
		, [7898, -11062, " ", $vqrange] _
		, [9888, -13314, " ", $vqrange] _
		, [8323, -9221, " ", $vqrange] _
		, [5383, -7743, " ", $vqrange] _
		, [3907, -6725, " ", $vqrange] _
		, [1898, -8888, " ", $vqrange] _
		, [2956, -11617, " ", $vqrange] _
		, [3229, -6308, " ", $vqrange] _
		, [5312, -2084, " ", $vqrange] _
		, [8590, -4741, " ", $vqrange] _
		, [10364, -3954, " ", $vqrange] _
		, [9284, -1986, " ", $vqrange] _
		, [8249, 346, " ", $vqrange] _
		, [9336, 4163, " ", $vqrange] _
		, [8627, 5815, " ", $vqrange] _
		, [4999, 5178, " ", $vqrange] _
		, [2718, 6447, " ", $vqrange] _
		, [8492, 8999, " ", $vqrange] _
		, [10664, 6606, " ", $vqrange] _
		, [10240, 9194, " ", $vqrange] _
		, [9639, 10560, " ", $vqrange] _
		, [9255, 10094, " ", $vqrange] _
		, [4346, 12430, " ", $vqrange] _
		, [-717, 11305, " ", $vqrange] _
		, [-906, 13154, " ", $vqrange] _
		, [-826, 11153, " ", $vqrange] _
		, [-3321, 7011, " ", $vqrange] _
		, [-1507, 5717, " ", $vqrange] _
		, [698, 3600, " ", $vqrange] _
		, [-1507, 5717, " ", $vqrange] _
		, [-6250, 4554, " ", $vqrange] _
		, [-6954, 955, " ", $vqrange] _
		, [-14035, 291, " ", $vqrange] _
		, [-13495, 5886, " ", $vqrange] _
		, [-10378, 4388, " ", $vqrange] _
		, [-12645, 9337, " ", $vqrange] _
		, [-11670, 14013, " ", $vqrange] _
		, [-12993, 15758, " ", $vqrange] _
		, [-13483, 16904, " ", $vqrange] _
		, [-17024, 17310, " ", $vqrange] _
		, [-15774, 11226, " ", $vqrange] _
		, [-15525, 7189, " ", $vqrange] _
		, [-14053, 185, " ", $vqrange] _
		, [-10457, -3568, " ", $vqrange] _
		, [-6478, -6316, " ", $vqrange] _
		, [-226, -10403, " ", $vqrange] _
		, [3155, -6182, " ", $vqrange] _
		, [4040, -669, " ", $vqrange] _
		, [1974, 3174, " ", $vqrange] _
		, [-2810, 5604, " ", $vqrange] _
		, [-6276, 4450, " ", $vqrange] _
		, [-7926, 1876, " ", $vqrange] _
		, [-4409, -934, " ", $vqrange] _
		, [-2709, -1452, " ", $vqrange] _
		, [69, -2046, " ", $vqrange] ]

		GoNearestNPCToCoords(-18985, 12968)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-11923, -7150)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(2343, -18959)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(4020, -4569)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsD)
		
		GoNearestNPCToCoords(-1387, 10455)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsE)
		
		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc