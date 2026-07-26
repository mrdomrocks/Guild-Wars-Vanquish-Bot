#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTheFloodplainOfMahnkelon()
	MoveTo(2369, 3332)
	MoveTo(4406, 4058)
	Move(4800, 4600)
	WaitForLoad()
EndFunc

Func VQTheFloodplainOfMahnkelon()
    If GetMapID() <> $TheFloodplainOfMahnkelon_Map And GetMapID() <> $TheFloodplainOfMahnkelon_Outpost  Then TravelTo($TheFloodplainOfMahnkelon_Outpost)   
    If GetMapID() = $TheFloodplainOfMahnkelon_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TheFloodplainOfMahnkelon_Map Then    
		
		Local $aWaypointsA[7][4] = [ [-15002, -14809, " ", $vqrange] _
		, [-13711, -13165, " ", $vqrange] _
		, [-13385, -12015, " ", $vqrange] _
		, [-13173, -8565, " ", $vqrange] _
		, [-9704, -9111, " ", $vqrange] _
		, [-11439, -12825, " ", $vqrange] _
		, [-8739, -10848, " ", $vqrange] ]

		Local $aWaypointsB[25][4] = [ [-4454, -9503, " ", $vqrange] _
		, [-2484, -8955, " ", $vqrange] _
		, [-1935, -7149, " ", $vqrange] _
		, [-2595, -10695, " ", $vqrange] _
		, [-2331, -13007, " ", $vqrange] _
		, [-511, -12793, " ", $vqrange] _
		, [353, -11430, " ", $vqrange] _
		, [3430, -12920, " ", $vqrange] _
		, [5147, -13075, " ", $vqrange] _
		, [7074, -14268, " ", $vqrange] _
		, [8594, -13808, " ", $vqrange] _
		, [8743, -10970, " ", $vqrange] _
		, [11714, -10487, " ", $vqrange] _
		, [13180, -9292, " ", $vqrange] _
		, [13926, -10058, " ", $vqrange] _
		, [12216, -12517, " ", $vqrange] _
		, [15616, -13087, " ", $vqrange] _
		, [15351, -11217, " ", $vqrange] _
		, [17381, -8652, " ", $vqrange] _
		, [18898, -7978, " ", $vqrange] _
		, [19081, -5370, " ", $vqrange] _
		, [17185, -2602, " ", $vqrange] _
		, [16911, -1560, " ", $vqrange] _
		, [17211, 307, " ", $vqrange] _
		, [18625, -524, " ", $vqrange] ]

		Local $aWaypointsC[9][4] = [ [15402, 4672, " ", $vqrange] _
		, [15109, 7002, " ", $vqrange] _
		, [12692, 10020, " ", $vqrange] _
		, [9017, 12587, " ", $vqrange] _
		, [10553, 15520, " ", $vqrange] _
		, [6654, 15143, " ", $vqrange] _
		, [5156, 14175, " ", $vqrange] _
		, [3270, 15741, " ", $vqrange] _
		, [1748, 14823, " ", $vqrange] ]

		Local $aWaypointsD[41][4] = [ [-2909, 9103, " ", $vqrange] _
		, [-802, 12067, " ", $vqrange] _
		, [-3218, 15914, " ", $vqrange] _
		, [-6169, 13747, " ", $vqrange] _
		, [-7971, 12263, " ", $vqrange] _
		, [-11514, 10236, " ", $vqrange] _
		, [-14537, 7999, " ", $vqrange] _
		, [-16396, 5848, " ", $vqrange] _
		, [-18000, 3885, " ", $vqrange] _
		, [-19002, 3657, " ", $vqrange] _
		, [-16316, 1894, " ", $vqrange] _
		, [-14257, -1695, " ", $vqrange] _
		, [-14333, -5207, " ", $vqrange] _
		, [-18549, -5887, " ", $vqrange] _
		, [-21613, -5643, " ", $vqrange] _
		, [-16874, -6362, " ", $vqrange] _
		, [-12440, -7346, " ", $vqrange] _
		, [-9350, -5174, " ", $vqrange] _
		, [-8485, -3520, " ", $vqrange] _
		, [-8690, -1186, " ", $vqrange] _
		, [-7487, 3425, " ", $vqrange] _
		, [-3607, -35, " ", $vqrange] _
		, [-1068, -3052, " ", $vqrange] _
		, [2196, -5259, " ", $vqrange] _
		, [-2269, -646, " ", $vqrange] _
		, [39, 1585, " ", $vqrange] _
		, [1881, 711, " ", $vqrange] _
		, [5916, -1120, " ", $vqrange] _
		, [2242, 2087, " ", $vqrange] _
		, [-1650, 7398, " ", $vqrange] _
		, [1698, 3370, " ", $vqrange] _
		, [3288, 4817, " ", $vqrange] _
		, [4603, 3700, " ", $vqrange] _
		, [1952, 5949, " ", $vqrange] _
		, [2948, 8823, " ", $vqrange] _
		, [4547, 9903, " ", $vqrange] _
		, [5346, 9063, " ", $vqrange] _
		, [7785, 8337, " ", $vqrange] _
		, [6663, 6444, " ", $vqrange] _
		, [6791, 4867, " ", $vqrange] _
		, [4495, 3693, " ", $vqrange] ]
		
		Local $aWaypoints[82][4] = [ [-15002, -14809, " ", $vqrange] _
		, [-13711, -13165, " ", $vqrange] _
		, [-13385, -12015, " ", $vqrange] _
		, [-13173, -8565, " ", $vqrange] _
		, [-9704, -9111, " ", $vqrange] _
		, [-11439, -12825, " ", $vqrange] _
		, [-8739, -10848, " ", $vqrange] _ 
		, [-4454, -9503, " ", $vqrange] _
		, [-2484, -8955, " ", $vqrange] _
		, [-1935, -7149, " ", $vqrange] _
		, [-2595, -10695, " ", $vqrange] _
		, [-2331, -13007, " ", $vqrange] _
		, [-511, -12793, " ", $vqrange] _
		, [353, -11430, " ", $vqrange] _
		, [3430, -12920, " ", $vqrange] _
		, [5147, -13075, " ", $vqrange] _
		, [7074, -14268, " ", $vqrange] _
		, [8594, -13808, " ", $vqrange] _
		, [8743, -10970, " ", $vqrange] _
		, [11714, -10487, " ", $vqrange] _
		, [13180, -9292, " ", $vqrange] _
		, [13926, -10058, " ", $vqrange] _
		, [12216, -12517, " ", $vqrange] _
		, [15616, -13087, " ", $vqrange] _
		, [15351, -11217, " ", $vqrange] _
		, [17381, -8652, " ", $vqrange] _
		, [18898, -7978, " ", $vqrange] _
		, [19081, -5370, " ", $vqrange] _
		, [17185, -2602, " ", $vqrange] _
		, [16911, -1560, " ", $vqrange] _
		, [17211, 307, " ", $vqrange] _
		, [18625, -524, " ", $vqrange] _ 
		, [15402, 4672, " ", $vqrange] _
		, [15109, 7002, " ", $vqrange] _
		, [12692, 10020, " ", $vqrange] _
		, [9017, 12587, " ", $vqrange] _
		, [10553, 15520, " ", $vqrange] _
		, [6654, 15143, " ", $vqrange] _
		, [5156, 14175, " ", $vqrange] _
		, [3270, 15741, " ", $vqrange] _
		, [1748, 14823, " ", $vqrange] _ 
		, [-2909, 9103, " ", $vqrange] _
		, [-802, 12067, " ", $vqrange] _
		, [-3218, 15914, " ", $vqrange] _
		, [-6169, 13747, " ", $vqrange] _
		, [-7971, 12263, " ", $vqrange] _
		, [-11514, 10236, " ", $vqrange] _
		, [-14537, 7999, " ", $vqrange] _
		, [-16396, 5848, " ", $vqrange] _
		, [-18000, 3885, " ", $vqrange] _
		, [-19002, 3657, " ", $vqrange] _
		, [-16316, 1894, " ", $vqrange] _
		, [-14257, -1695, " ", $vqrange] _
		, [-14333, -5207, " ", $vqrange] _
		, [-18549, -5887, " ", $vqrange] _
		, [-21613, -5643, " ", $vqrange] _
		, [-16874, -6362, " ", $vqrange] _
		, [-12440, -7346, " ", $vqrange] _
		, [-9350, -5174, " ", $vqrange] _
		, [-8485, -3520, " ", $vqrange] _
		, [-8690, -1186, " ", $vqrange] _
		, [-7487, 3425, " ", $vqrange] _
		, [-3607, -35, " ", $vqrange] _
		, [-1068, -3052, " ", $vqrange] _
		, [2196, -5259, " ", $vqrange] _
		, [-2269, -646, " ", $vqrange] _
		, [39, 1585, " ", $vqrange] _
		, [1881, 711, " ", $vqrange] _
		, [5916, -1120, " ", $vqrange] _
		, [2242, 2087, " ", $vqrange] _
		, [-1650, 7398, " ", $vqrange] _
		, [1698, 3370, " ", $vqrange] _
		, [3288, 4817, " ", $vqrange] _
		, [4603, 3700, " ", $vqrange] _
		, [1952, 5949, " ", $vqrange] _
		, [2948, 8823, " ", $vqrange] _
		, [4547, 9903, " ", $vqrange] _
		, [5346, 9063, " ", $vqrange] _
		, [7785, 8337, " ", $vqrange] _
		, [6663, 6444, " ", $vqrange] _
		, [6791, 4867, " ", $vqrange] _
		, [4495, 3693, " ", $vqrange] ]
						
		GoNearestNPCToCoords(-19184, -13485)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-5912, -11262)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(13534, 1442)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-701, 11798)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc