#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutIssnurIsles()
	MoveTo(-16011, 11304)
	Move(-15700, 11304)
	WaitForLoad()
EndFunc

Func VQIssnurIsles()
    If GetMapID() <> $IssnurIsles_Map And GetMapID() <> $IssnurIsles_Outpost  Then TravelTo($IssnurIsles_Outpost)   
    If GetMapID() = $IssnurIsles_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $IssnurIsles_Map Then    
		
		Local $aWaypointsA[11][4] = [ [-12890, 6722, " ", $vqrange] _
		, [-14645, 3908, " ", $vqrange] _
		, [-16354, 3022, " ", $vqrange] _
		, [-17843, 3575, " ", $vqrange] _
		, [-20217, 5799, " ", $vqrange] _
		, [-18375, 1443, " ", $vqrange] _
		, [-17526, 770, " ", $vqrange] _
		, [-13103, 1322, " ", $vqrange] _
		, [-13983, -1819, " ", $vqrange] _
		, [-15639, -951, " ", $vqrange] _
		, [-12112, -2878, " ", $vqrange] ]

		Local $aWaypointsB[29][4] = [ [-15023, -4004, " ", $vqrange] _
		, [-17097, -3336, " ", $vqrange] _
		, [-16181, -5683, " ", $vqrange] _
		, [-16460, -8390, " ", $vqrange] _
		, [-15322, -9976, " ", $vqrange] _
		, [-12783, -9194, " ", $vqrange] _
		, [-14259, -4570, " ", $vqrange] _
		, [-9268, -1190, " ", $vqrange] _
		, [-8287, -4225, " ", $vqrange] _
		, [-8709, -5720, " ", $vqrange] _
		, [-9083, -6954, " ", $vqrange] _
		, [-8273, -7967, " ", $vqrange] _
		, [-10319, -9743, " ", $vqrange] _
		, [-7489, -9638, " ", $vqrange] _
		, [-5078, -6680, " ", $vqrange] _
		, [-5167, -4036, " ", $vqrange] _
		, [-5782, -2288, " ", $vqrange] _
		, [-3919, -6644, " ", $vqrange] _
		, [-114, -7496, " ", $vqrange] _
		, [-145, -9520, " ", $vqrange] _
		, [576, -10675, " ", $vqrange] _
		, [-763, -11508, " ", $vqrange] _
		, [-3611, -12600, " ", $vqrange] _
		, [731, -13148, " ", $vqrange] _
		, [2128, -12165, " ", $vqrange] _
		, [3303, -9040, " ", $vqrange] _
		, [6756, -10241, " ", $vqrange] _
		, [4691, -6035, " ", $vqrange] _
		, [6346, -4165, " ", $vqrange] ]

		Local $aWaypointsC[60][4] = [ [9568, -5791, " ", $vqrange] _
		, [11666, -7077, " ", $vqrange] _
		, [13394, -5986, " ", $vqrange] _
		, [13273, -4172, " ", $vqrange] _
		, [15755, -5565, " ", $vqrange] _
		, [17166, -2673, " ", $vqrange] _
		, [16154, -708, " ", $vqrange] _
		, [14029, -1785, " ", $vqrange] _
		, [12055, -1427, " ", $vqrange] _
		, [14801, -2659, " ", $vqrange] _
		, [19789, -2909, " ", $vqrange] _
		, [22637, -2631, " ", $vqrange] _
		, [20823, -3911, " ", $vqrange] _
		, [23273, -5634, " ", $vqrange] _
		, [25357, -6101, " ", $vqrange] _
		, [27262, -4294, " ", $vqrange] _
		, [27597, -6016, " ", $vqrange] _
		, [27881, -6094, " ", $vqrange] _
		, [27567, -5794, " ", $vqrange] _
		, [26680, -1929, " ", $vqrange] _
		, [25897, -482, " ", $vqrange] _
		, [23768, -1501, " ", $vqrange] _
		, [23004, 2630, " ", $vqrange] _
		, [26778, 6409, " ", $vqrange] _
		, [23039, 9617, " ", $vqrange] _
		, [23328, 13056, " ", $vqrange] _
		, [20797, 13187, " ", $vqrange] _
		, [17029, 13007, " ", $vqrange] _
		, [14853, 11398, " ", $vqrange] _
		, [14375, 13154, " ", $vqrange] _
		, [13046, 10141, " ", $vqrange] _
		, [16783, 8915, " ", $vqrange] _
		, [13303, 7416, " ", $vqrange] _
		, [11457, 5676, " ", $vqrange] _
		, [13528, 4372, " ", $vqrange] _
		, [10995, 2971, " ", $vqrange] _
		, [9368, 4325, " ", $vqrange] _
		, [7290, 4348, " ", $vqrange] _
		, [5162, 2163, " ", $vqrange] _
		, [4616, 5058, " ", $vqrange] _
		, [6016, 6219, " ", $vqrange] _
		, [7367, 8626, " ", $vqrange] _
		, [8639, 7688, " ", $vqrange] _
		, [10980, 9273, " ", $vqrange] _
		, [8621, 10689, " ", $vqrange] _
		, [8204, 7296, " ", $vqrange] _
		, [4100, 4437, " ", $vqrange] _
		, [2231, 8063, " ", $vqrange] _
		, [-685, 10956, " ", $vqrange] _
		, [-3039, 8534, " ", $vqrange] _
		, [-3660, 10810, " ", $vqrange] _
		, [-5664, 11203, " ", $vqrange] _
		, [-6965, 12150, " ", $vqrange] _
		, [-9566, 13244, " ", $vqrange] _
		, [-9179, 10433, " ", $vqrange] _
		, [-8789, 8541, " ", $vqrange] _
		, [-9715, 5138, " ", $vqrange] _
		, [-12328, 3637, " ", $vqrange] _
		, [-9369, 1922, " ", $vqrange] _
		, [-7469, 6646, " ", $vqrange] ]
		
		Local $aWaypointsD[15][4] = [ [-1110, 6412, " ", $vqrange] _
		, [-4820, 5146, " ", $vqrange] _
		, [-5739, 2380, " ", $vqrange] _
		, [-6618, 944, " ", $vqrange] _
		, [-4937, -494, " ", $vqrange] _
		, [-2700, -1269, " ", $vqrange] _
		, [1566, 401, " ", $vqrange] _
		, [1227, 2639, " ", $vqrange] _
		, [44, 2685, " ", $vqrange] _
		, [-1262, 2866, " ", $vqrange] _
		, [3589, 4324, " ", $vqrange] _
		, [5000, 1908, " ", $vqrange] _
		, [5013, -1760, " ", $vqrange] _
		, [1582, -4757, " ", $vqrange] _
		, [-2128, -2698, " ", $vqrange] ]
		
		Local $aWaypoints[115][4] = [ [-12890, 6722, " ", $vqrange] _
		, [-14645, 3908, " ", $vqrange] _
		, [-16354, 3022, " ", $vqrange] _
		, [-17843, 3575, " ", $vqrange] _
		, [-20217, 5799, " ", $vqrange] _
		, [-18375, 1443, " ", $vqrange] _
		, [-17526, 770, " ", $vqrange] _
		, [-13103, 1322, " ", $vqrange] _
		, [-13983, -1819, " ", $vqrange] _
		, [-15639, -951, " ", $vqrange] _
		, [-12112, -2878, " ", $vqrange] _
		, [-15023, -4004, " ", $vqrange] _
		, [-17097, -3336, " ", $vqrange] _
		, [-16181, -5683, " ", $vqrange] _
		, [-16460, -8390, " ", $vqrange] _
		, [-15322, -9976, " ", $vqrange] _
		, [-12783, -9194, " ", $vqrange] _
		, [-14259, -4570, " ", $vqrange] _
		, [-9268, -1190, " ", $vqrange] _
		, [-8287, -4225, " ", $vqrange] _
		, [-8709, -5720, " ", $vqrange] _
		, [-9083, -6954, " ", $vqrange] _
		, [-8273, -7967, " ", $vqrange] _
		, [-10319, -9743, " ", $vqrange] _
		, [-7489, -9638, " ", $vqrange] _
		, [-5078, -6680, " ", $vqrange] _
		, [-5167, -4036, " ", $vqrange] _
		, [-5782, -2288, " ", $vqrange] _
		, [-3919, -6644, " ", $vqrange] _
		, [-114, -7496, " ", $vqrange] _
		, [-145, -9520, " ", $vqrange] _
		, [576, -10675, " ", $vqrange] _
		, [-763, -11508, " ", $vqrange] _
		, [-3611, -12600, " ", $vqrange] _
		, [731, -13148, " ", $vqrange] _
		, [2128, -12165, " ", $vqrange] _
		, [3303, -9040, " ", $vqrange] _
		, [6756, -10241, " ", $vqrange] _
		, [4691, -6035, " ", $vqrange] _
		, [6346, -4165, " ", $vqrange] _
		, [9568, -5791, " ", $vqrange] _
		, [11666, -7077, " ", $vqrange] _
		, [13394, -5986, " ", $vqrange] _
		, [13273, -4172, " ", $vqrange] _
		, [15755, -5565, " ", $vqrange] _
		, [17166, -2673, " ", $vqrange] _
		, [16154, -708, " ", $vqrange] _
		, [14029, -1785, " ", $vqrange] _
		, [12055, -1427, " ", $vqrange] _
		, [14801, -2659, " ", $vqrange] _
		, [19789, -2909, " ", $vqrange] _
		, [22637, -2631, " ", $vqrange] _
		, [20823, -3911, " ", $vqrange] _
		, [23273, -5634, " ", $vqrange] _
		, [25357, -6101, " ", $vqrange] _
		, [27262, -4294, " ", $vqrange] _
		, [27597, -6016, " ", $vqrange] _
		, [27881, -6094, " ", $vqrange] _
		, [27567, -5794, " ", $vqrange] _
		, [26680, -1929, " ", $vqrange] _
		, [25897, -482, " ", $vqrange] _
		, [23768, -1501, " ", $vqrange] _
		, [23004, 2630, " ", $vqrange] _
		, [26778, 6409, " ", $vqrange] _
		, [23039, 9617, " ", $vqrange] _
		, [23328, 13056, " ", $vqrange] _
		, [20797, 13187, " ", $vqrange] _
		, [17029, 13007, " ", $vqrange] _
		, [14853, 11398, " ", $vqrange] _
		, [14375, 13154, " ", $vqrange] _
		, [13046, 10141, " ", $vqrange] _
		, [16783, 8915, " ", $vqrange] _
		, [13303, 7416, " ", $vqrange] _
		, [11457, 5676, " ", $vqrange] _
		, [13528, 4372, " ", $vqrange] _
		, [10995, 2971, " ", $vqrange] _
		, [9368, 4325, " ", $vqrange] _
		, [7290, 4348, " ", $vqrange] _
		, [5162, 2163, " ", $vqrange] _
		, [4616, 5058, " ", $vqrange] _
		, [6016, 6219, " ", $vqrange] _
		, [7367, 8626, " ", $vqrange] _
		, [8639, 7688, " ", $vqrange] _
		, [10980, 9273, " ", $vqrange] _
		, [8621, 10689, " ", $vqrange] _
		, [8204, 7296, " ", $vqrange] _
		, [4100, 4437, " ", $vqrange] _
		, [2231, 8063, " ", $vqrange] _
		, [-685, 10956, " ", $vqrange] _
		, [-3039, 8534, " ", $vqrange] _
		, [-3660, 10810, " ", $vqrange] _
		, [-5664, 11203, " ", $vqrange] _
		, [-6965, 12150, " ", $vqrange] _
		, [-9566, 13244, " ", $vqrange] _
		, [-9179, 10433, " ", $vqrange] _
		, [-8789, 8541, " ", $vqrange] _
		, [-9715, 5138, " ", $vqrange] _
		, [-12328, 3637, " ", $vqrange] _
		, [-9369, 1922, " ", $vqrange] _
		, [-7469, 6646, " ", $vqrange] _
		, [-1110, 6412, " ", $vqrange] _
		, [-4820, 5146, " ", $vqrange] _
		, [-5739, 2380, " ", $vqrange] _
		, [-6618, 944, " ", $vqrange] _
		, [-4937, -494, " ", $vqrange] _
		, [-2700, -1269, " ", $vqrange] _
		, [1566, 401, " ", $vqrange] _
		, [1227, 2639, " ", $vqrange] _
		, [44, 2685, " ", $vqrange] _
		, [-1262, 2866, " ", $vqrange] _
		, [3589, 4324, " ", $vqrange] _
		, [5000, 1908, " ", $vqrange] _
		, [5013, -1760, " ", $vqrange] _
		, [1582, -4757, " ", $vqrange] _
		, [-2128, -2698, " ", $vqrange] ]

		GoNearestNPCToCoords(-15435, 10793)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-10625, -4355)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(7807, -4604)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-828, 7911)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
          	MoveAndAggroVQReverse($aWaypoints)

    EndIf
EndFunc