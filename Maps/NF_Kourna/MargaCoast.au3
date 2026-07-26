#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMargaCoast()
	MoveTo(-3144, 4512)
	MoveTo(-4829, 4923)
	MoveTo(-4911, 4913)
	Move(-4950, 4913)
	WaitForLoad()
EndFunc

Func VQMargaCoast()
    If GetMapID() <> $MargaCoast_Map And GetMapID() <> $MargaCoast_Outpost  Then TravelTo($MargaCoast_Outpost)   
    If GetMapID() = $MargaCoast_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $MargaCoast_Map Then    
		
		Local $aWaypointsA[14][4] = [ [20256, -8736, " ", $vqrange] _
		, [16572, -11979, " ", $vqrange] _
		, [16945, -14747, " ", $vqrange] _
		, [17051, -15419, " ", $vqrange] _
		, [12632, -14605, " ", $vqrange] _
		, [11537, -14848, " ", $vqrange] _
		, [11385, -16610, " ", $vqrange] _
		, [8876, -16741, " ", $vqrange] _
		, [7150, -14019, " ", $vqrange] _
		, [8862, -11602, " ", $vqrange] _
		, [6339, -13872, " ", $vqrange] _
		, [5094, -11137, " ", $vqrange] _
		, [6811, -6363, " ", $vqrange] _
		, [3379, -4040, " ", $vqrange] ]

		Local $aWaypointsB[18][4] = [ [1583, -6992, " ", $vqrange] _
		, [-2056, -6894, " ", $vqrange] _
		, [-1891, -5044, " ", $vqrange] _
		, [-3284, -5180, " ", $vqrange] _
		, [-5163, -5877, " ", $vqrange] _
		, [-5027, -7133, " ", $vqrange] _
		, [-4198, -9232, " ", $vqrange] _
		, [-3169, -8173, " ", $vqrange] _
		, [-2304, -7520, " ", $vqrange] _
		, [-4789, -11889, " ", $vqrange] _
		, [-6003, -15513, " ", $vqrange] _
		, [-7569, -15562, " ", $vqrange] _
		, [-8039, -13240, " ", $vqrange] _
		, [-8126, -10244, " ", $vqrange] _
		, [-11165, -10282, " ", $vqrange] _
		, [-9515, -8620, " ", $vqrange] _
		, [-8499, -4949, " ", $vqrange] _
		, [-13177, -1519, " ", $vqrange] ]

		Local $aWaypointsC[25][4] = [ [-19015, -1859, " ", $vqrange] _
		, [-22150, 32, " ", $vqrange] _
		, [-21433, 3809, " ", $vqrange] _
		, [-18620, 3879, " ", $vqrange] _
		, [-18491, 6239, " ", $vqrange] _
		, [-22259, 7832, " ", $vqrange] _
		, [-21666, 14359, " ", $vqrange] _
		, [-19295, 15839, " ", $vqrange] _
		, [-14375, 15515, " ", $vqrange] _
		, [-11893, 11350, " ", $vqrange] _
		, [-14897, 9842, " ", $vqrange] _
		, [-16036, 7023, " ", $vqrange] _
		, [-13981, 4006, " ", $vqrange] _
		, [-12444, 5343, " ", $vqrange] _
		, [-11558, 7146, " ", $vqrange] _
		, [-8662, 10722, " ", $vqrange] _
		, [-2697, 8447, " ", $vqrange] _
		, [-2569, 11214, " ", $vqrange] _
		, [-495, 14159, " ", $vqrange] _
		, [-4211, 15369, " ", $vqrange] _
		, [-2593, 16131, " ", $vqrange] _
		, [1319, 14235, " ", $vqrange] _
		, [3502, 14721, " ", $vqrange] _
		, [5472, 16320, " ", $vqrange] _
		, [6535, 10692, " ", $vqrange] ]

		Local $aWaypointsD[35][4] = [ [7883, 3006, " ", $vqrange] _
		, [5829, 1256, " ", $vqrange] _
		, [12247, 3565, " ", $vqrange] _
		, [14520, -953, " ", $vqrange] _
		, [13432, -4346, " ", $vqrange] _
		, [15140, -4374, " ", $vqrange] _
		, [17457, -4475, " ", $vqrange] _
		, [18619, -933, " ", $vqrange] _
		, [19838, 3576, " ", $vqrange] _
		, [21570, -1228, " ", $vqrange] _
		, [21572, -5581, " ", $vqrange] _
		, [19698, -6535, " ", $vqrange] _
		, [16588, -8555, " ", $vqrange] _
		, [15311, -12127, " ", $vqrange] _
		, [14846, -6086, " ", $vqrange] _
		, [11099, -10334, " ", $vqrange] _
		, [11432, -5472, " ", $vqrange] _
		, [8172, -4127, " ", $vqrange] _
		, [2357, -642, " ", $vqrange] _
		, [5665, 2983, " ", $vqrange] _
		, [2853, 7863, " ", $vqrange] _
		, [4496, 9533, " ", $vqrange] _
		, [-174, 7502, " ", $vqrange] _
		, [-4331, 7225, " ", $vqrange] _
		, [-5914, 2975, " ", $vqrange] _
		, [-9583, 1147, " ", $vqrange] _
		, [-9244, -1587, " ", $vqrange] _
		, [-3787, 1223, " ", $vqrange] _
		, [-2074, 1943, " ", $vqrange] _
		, [-1914, 836, " ", $vqrange] _
		, [-2312, -621, " ", $vqrange] _
		, [-2395, 1168, " ", $vqrange] _
		, [-4381, 863, " ", $vqrange] _
		, [-1627, -2612, " ", $vqrange] _
		, [-8307, -4237, " ", $vqrange] ]

		Local $aWaypoints[92][4] = [ [20256, -8736, " ", $vqrange] _
		, [16572, -11979, " ", $vqrange] _
		, [16945, -14747, " ", $vqrange] _
		, [17051, -15419, " ", $vqrange] _
		, [12632, -14605, " ", $vqrange] _
		, [11537, -14848, " ", $vqrange] _
		, [11385, -16610, " ", $vqrange] _
		, [8876, -16741, " ", $vqrange] _
		, [7150, -14019, " ", $vqrange] _
		, [8862, -11602, " ", $vqrange] _
		, [6339, -13872, " ", $vqrange] _
		, [5094, -11137, " ", $vqrange] _
		, [6811, -6363, " ", $vqrange] _
		, [3379, -4040, " ", $vqrange] _
		, [1583, -6992, " ", $vqrange] _
		, [-2056, -6894, " ", $vqrange] _
		, [-1891, -5044, " ", $vqrange] _
		, [-3284, -5180, " ", $vqrange] _
		, [-5163, -5877, " ", $vqrange] _
		, [-5027, -7133, " ", $vqrange] _
		, [-4198, -9232, " ", $vqrange] _
		, [-3169, -8173, " ", $vqrange] _
		, [-2304, -7520, " ", $vqrange] _
		, [-4789, -11889, " ", $vqrange] _
		, [-6003, -15513, " ", $vqrange] _
		, [-7569, -15562, " ", $vqrange] _
		, [-8039, -13240, " ", $vqrange] _
		, [-8126, -10244, " ", $vqrange] _
		, [-11165, -10282, " ", $vqrange] _
		, [-9515, -8620, " ", $vqrange] _
		, [-8499, -4949, " ", $vqrange] _
		, [-13177, -1519, " ", $vqrange] _
		, [-19015, -1859, " ", $vqrange] _
		, [-22150, 32, " ", $vqrange] _
		, [-21433, 3809, " ", $vqrange] _
		, [-18620, 3879, " ", $vqrange] _
		, [-18491, 6239, " ", $vqrange] _
		, [-22259, 7832, " ", $vqrange] _
		, [-21666, 14359, " ", $vqrange] _
		, [-19295, 15839, " ", $vqrange] _
		, [-14375, 15515, " ", $vqrange] _
		, [-11893, 11350, " ", $vqrange] _
		, [-14897, 9842, " ", $vqrange] _
		, [-16036, 7023, " ", $vqrange] _
		, [-13981, 4006, " ", $vqrange] _
		, [-12444, 5343, " ", $vqrange] _
		, [-11558, 7146, " ", $vqrange] _
		, [-8662, 10722, " ", $vqrange] _
		, [-2697, 8447, " ", $vqrange] _
		, [-2569, 11214, " ", $vqrange] _
		, [-495, 14159, " ", $vqrange] _
		, [-4211, 15369, " ", $vqrange] _
		, [-2593, 16131, " ", $vqrange] _
		, [1319, 14235, " ", $vqrange] _
		, [3502, 14721, " ", $vqrange] _
		, [5472, 16320, " ", $vqrange] _
		, [6535, 10692, " ", $vqrange] _
		, [7883, 3006, " ", $vqrange] _
		, [5829, 1256, " ", $vqrange] _
		, [12247, 3565, " ", $vqrange] _
		, [14520, -953, " ", $vqrange] _
		, [13432, -4346, " ", $vqrange] _
		, [15140, -4374, " ", $vqrange] _
		, [17457, -4475, " ", $vqrange] _
		, [18619, -933, " ", $vqrange] _
		, [19838, 3576, " ", $vqrange] _
		, [21570, -1228, " ", $vqrange] _
		, [21572, -5581, " ", $vqrange] _
		, [19698, -6535, " ", $vqrange] _
		, [16588, -8555, " ", $vqrange] _
		, [15311, -12127, " ", $vqrange] _
		, [14846, -6086, " ", $vqrange] _
		, [11099, -10334, " ", $vqrange] _
		, [11432, -5472, " ", $vqrange] _
		, [8172, -4127, " ", $vqrange] _
		, [2357, -642, " ", $vqrange] _
		, [5665, 2983, " ", $vqrange] _
		, [2853, 7863, " ", $vqrange] _
		, [4496, 9533, " ", $vqrange] _
		, [-174, 7502, " ", $vqrange] _
		, [-4331, 7225, " ", $vqrange] _
		, [-5914, 2975, " ", $vqrange] _
		, [-9583, 1147, " ", $vqrange] _
		, [-9244, -1587, " ", $vqrange] _
		, [-3787, 1223, " ", $vqrange] _
		, [-2074, 1943, " ", $vqrange] _
		, [-1914, 836, " ", $vqrange] _
		, [-2312, -621, " ", $vqrange] _
		, [-2395, 1168, " ", $vqrange] _
		, [-4381, 863, " ", $vqrange] _
		, [-1627, -2612, " ", $vqrange] _
		, [-8307, -4237, " ", $vqrange] ]	
		
		GoNearestNPCToCoords(19917, -16160)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(2324, -4866)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-16695, -2723)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(10417, 9560)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc
