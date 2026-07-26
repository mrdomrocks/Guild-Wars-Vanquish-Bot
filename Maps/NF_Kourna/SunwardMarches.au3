#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSunwardMarches()
	MoveTo(23271, 14344)
	Move(23000, 14100)
	WaitForLoad()
EndFunc

Func VQSunwardMarches()
    If GetMapID() <> $SunwardMarches_Map And GetMapID() <> $SunwardMarches_Outpost  Then TravelTo($SunwardMarches_Outpost)   
    If GetMapID() = $SunwardMarches_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $SunwardMarches_Map Then    
		
		Local $aWaypointsA[12][4] = [ [20586, 11658, " ", $vqrange] _
		, [21972, 9027, " ", $vqrange] _
		, [24731, 7517, " ", $vqrange] _
		, [18615, 5451, " ", $vqrange] _
		, [16100, 7430, " ", $vqrange] _
		, [13409, 6724, " ", $vqrange] _
		, [14646, 12057, " ", $vqrange] _
		, [17875, 11790, " ", $vqrange] _
		, [13001, 15393, " ", $vqrange] _
		, [8233, 12265, " ", $vqrange] _
		, [5860, 10730, " ", $vqrange] _
		, [4630, 7358, " ", $vqrange] ]

		Local $aWaypointsB[18][4] = [ [8606, 5750, " ", $vqrange] _
		, [12983, 4007, " ", $vqrange] _
		, [15805, -136, " ", $vqrange] _
		, [19543, -39, " ", $vqrange] _
		, [20858, 1164, " ", $vqrange] _
		, [21850, 2132, " ", $vqrange] _
		, [18646, 2631, " ", $vqrange] _
		, [18089, -3496, " ", $vqrange] _
		, [14434, -7074, " ", $vqrange] _
		, [12153, -8056, " ", $vqrange] _
		, [16940, -12015, " ", $vqrange] _
		, [15766, -12539, " ", $vqrange] _
		, [11888, -10457, " ", $vqrange] _
		, [9832, -10398, " ", $vqrange] _
		, [4577, -10240, " ", $vqrange] _
		, [2908, -12434, " ", $vqrange] _
		, [-3903, -12118, " ", $vqrange] _
		, [-1793, -9735, " ", $vqrange] ]

		Local $aWaypointsC[9][4] = [ [-5843, -4057, " ", $vqrange] _
		, [-7023, -5108, " ", $vqrange] _
		, [-8676, -6764, " ", $vqrange] _
		, [-11676, -10334, " ", $vqrange] _
		, [-13035, -12568, " ", $vqrange] _
		, [-15378, -8988, " ", $vqrange] _
		, [-12949, -7815, " ", $vqrange] _
		, [-16397, -5107, " ", $vqrange] _
		, [-17490, -9998, " ", $vqrange] ]


		Local $aWaypointsD[12][4] = [ [-21092, -11896, " ", $vqrange] _
		, [-20871, -8630, " ", $vqrange] _
		, [-19530, -10058, " ", $vqrange] _
		, [-23002, -8397, " ", $vqrange] _
		, [-24854, -11078, " ", $vqrange] _
		, [-22904, -8256, " ", $vqrange] _
		, [-24852, -4892, " ", $vqrange] _
		, [-23132, -2958, " ", $vqrange] _
		, [-20645, -883, " ", $vqrange] _
		, [-23817, -1361, " ", $vqrange] _
		, [-26009, 2175, " ", $vqrange] _
		, [-23360, 3770, " ", $vqrange] ]
		
		Local $aWaypointsE[51][4] = [ [-20629, 1955, " ", $vqrange] _
		, [-18727, 1348, " ", $vqrange] _
		, [-17142, -2138, " ", $vqrange] _
		, [-19449, 3918, " ", $vqrange] _
		, [-20728, 6948, " ", $vqrange] _
		, [-23203, 8733, " ", $vqrange] _
		, [-20504, 7587, " ", $vqrange] _
		, [-25134, 10682, " ", $vqrange] _
		, [-22217, 12979, " ", $vqrange] _
		, [-20011, 13841, " ", $vqrange] _
		, [-17823, 14045, " ", $vqrange] _
		, [-18445, 10169, " ", $vqrange] _
		, [-16172, 9081, " ", $vqrange] _
		, [-15053, 7826, " ", $vqrange] _
		, [-12401, 8845, " ", $vqrange] _
		, [-10098, 8807, " ", $vqrange] _
		, [-9616, 7126, " ", $vqrange] _
		, [-6818, 8526, " ", $vqrange] _
		, [-8331, 13137, " ", $vqrange] _
		, [-5888, 12237, " ", $vqrange] _
		, [-3486, 12880, " ", $vqrange] _
		, [-1030, 12135, " ", $vqrange] _
		, [1086, 14607, " ", $vqrange] _
		, [4128, 13632, " ", $vqrange] _
		, [3333, 10282, " ", $vqrange] _
		, [-759, 9440, " ", $vqrange] _
		, [105, 9518, " ", $vqrange] _
		, [1914, 5367, " ", $vqrange] _
		, [5274, 2457, " ", $vqrange] _
		, [6727, 90, " ", $vqrange] _
		, [9106, -3765, " ", $vqrange] _
		, [12317, -1222, " ", $vqrange] _
		, [9427, -5029, " ", $vqrange] _
		, [4979, -5624, " ", $vqrange] _
		, [2515, -5241, " ", $vqrange] _
		, [3061, -960, " ", $vqrange] _
		, [1463, -351, " ", $vqrange] _
		, [111, 186, " ", $vqrange] _
		, [-905, 1654, " ", $vqrange] _
		, [-1681, -336, " ", $vqrange] _
		, [-1346, -1727, " ", $vqrange] _
		, [-2118, -1397, " ", $vqrange] _
		, [-5497, -1991, " ", $vqrange] _
		, [-10103, 1476, " ", $vqrange] _
		, [-12687, -3294, " ", $vqrange] _
		, [-10725, -5189, " ", $vqrange] _
		, [-7438, -5222, " ", $vqrange] _
		, [-6186, 175, " ", $vqrange] _
		, [-5034, 4374, " ", $vqrange] _
		, [-3156, 6219, " ", $vqrange] _
		, [-2498, 7232, " ", $vqrange] ]

		Local $aWaypoints[102][4] = [ [20586, 11658, " ", $vqrange] _
		, [21972, 9027, " ", $vqrange] _
		, [24731, 7517, " ", $vqrange] _
		, [18615, 5451, " ", $vqrange] _
		, [16100, 7430, " ", $vqrange] _
		, [13409, 6724, " ", $vqrange] _
		, [14646, 12057, " ", $vqrange] _
		, [17875, 11790, " ", $vqrange] _
		, [13001, 15393, " ", $vqrange] _
		, [8233, 12265, " ", $vqrange] _
		, [5860, 10730, " ", $vqrange] _
		, [4630, 7358, " ", $vqrange] _
		, [8606, 5750, " ", $vqrange] _
		, [12983, 4007, " ", $vqrange] _
		, [15805, -136, " ", $vqrange] _
		, [19543, -39, " ", $vqrange] _
		, [20858, 1164, " ", $vqrange] _
		, [21850, 2132, " ", $vqrange] _
		, [18646, 2631, " ", $vqrange] _
		, [18089, -3496, " ", $vqrange] _
		, [14434, -7074, " ", $vqrange] _
		, [12153, -8056, " ", $vqrange] _
		, [16940, -12015, " ", $vqrange] _
		, [15766, -12539, " ", $vqrange] _
		, [11888, -10457, " ", $vqrange] _
		, [9832, -10398, " ", $vqrange] _
		, [4577, -10240, " ", $vqrange] _
		, [2908, -12434, " ", $vqrange] _
		, [-3903, -12118, " ", $vqrange] _
		, [-1793, -9735, " ", $vqrange] _
		, [-5843, -4057, " ", $vqrange] _
		, [-7023, -5108, " ", $vqrange] _
		, [-8676, -6764, " ", $vqrange] _
		, [-11676, -10334, " ", $vqrange] _
		, [-13035, -12568, " ", $vqrange] _
		, [-15378, -8988, " ", $vqrange] _
		, [-12949, -7815, " ", $vqrange] _
		, [-16397, -5107, " ", $vqrange] _
		, [-17490, -9998, " ", $vqrange] _
		, [-21092, -11896, " ", $vqrange] _
		, [-20871, -8630, " ", $vqrange] _
		, [-19530, -10058, " ", $vqrange] _
		, [-23002, -8397, " ", $vqrange] _
		, [-24854, -11078, " ", $vqrange] _
		, [-22904, -8256, " ", $vqrange] _
		, [-24852, -4892, " ", $vqrange] _
		, [-23132, -2958, " ", $vqrange] _
		, [-20645, -883, " ", $vqrange] _
		, [-23817, -1361, " ", $vqrange] _
		, [-26009, 2175, " ", $vqrange] _
		, [-23360, 3770, " ", $vqrange] _
		, [-20629, 1955, " ", $vqrange] _
		, [-18727, 1348, " ", $vqrange] _
		, [-17142, -2138, " ", $vqrange] _
		, [-19449, 3918, " ", $vqrange] _
		, [-20728, 6948, " ", $vqrange] _
		, [-23203, 8733, " ", $vqrange] _
		, [-20504, 7587, " ", $vqrange] _
		, [-25134, 10682, " ", $vqrange] _
		, [-22217, 12979, " ", $vqrange] _
		, [-20011, 13841, " ", $vqrange] _
		, [-17823, 14045, " ", $vqrange] _
		, [-18445, 10169, " ", $vqrange] _
		, [-16172, 9081, " ", $vqrange] _
		, [-15053, 7826, " ", $vqrange] _
		, [-12401, 8845, " ", $vqrange] _
		, [-10098, 8807, " ", $vqrange] _
		, [-9616, 7126, " ", $vqrange] _
		, [-6818, 8526, " ", $vqrange] _
		, [-8331, 13137, " ", $vqrange] _
		, [-5888, 12237, " ", $vqrange] _
		, [-3486, 12880, " ", $vqrange] _
		, [-1030, 12135, " ", $vqrange] _
		, [1086, 14607, " ", $vqrange] _
		, [4128, 13632, " ", $vqrange] _
		, [3333, 10282, " ", $vqrange] _
		, [-759, 9440, " ", $vqrange] _
		, [105, 9518, " ", $vqrange] _
		, [1914, 5367, " ", $vqrange] _
		, [5274, 2457, " ", $vqrange] _
		, [6727, 90, " ", $vqrange] _
		, [9106, -3765, " ", $vqrange] _
		, [12317, -1222, " ", $vqrange] _
		, [9427, -5029, " ", $vqrange] _
		, [4979, -5624, " ", $vqrange] _
		, [2515, -5241, " ", $vqrange] _
		, [3061, -960, " ", $vqrange] _
		, [1463, -351, " ", $vqrange] _
		, [111, 186, " ", $vqrange] _
		, [-905, 1654, " ", $vqrange] _
		, [-1681, -336, " ", $vqrange] _
		, [-1346, -1727, " ", $vqrange] _
		, [-2118, -1397, " ", $vqrange] _
		, [-5497, -1991, " ", $vqrange] _
		, [-10103, 1476, " ", $vqrange] _
		, [-12687, -3294, " ", $vqrange] _
		, [-10725, -5189, " ", $vqrange] _
		, [-7438, -5222, " ", $vqrange] _
		, [-6186, 175, " ", $vqrange] _
		, [-5034, 4374, " ", $vqrange] _
		, [-3156, 6219, " ", $vqrange] _
		, [-2498, 7232, " ", $vqrange] ]	
				
		GoNearestNPCToCoords(22169, 14426)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(6997, 6962)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-3712, -7064)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-17964, -12200)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		GoNearestNPCToCoords(-22600, 5634)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsE)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc