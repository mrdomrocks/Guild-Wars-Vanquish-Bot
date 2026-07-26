#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTheMirrorOfLyss()
	MoveTo(-3336, 1102)
	MoveTo(-891, 4438)
	MoveTo(-884, 4509)
	Move(-883.08, 4698.31)
	WaitForLoad()
EndFunc

Func VQTheMirrorOfLyss()
    If GetMapID() <> $TheMirrorOfLyss_Map And GetMapID() <> $TheMirrorOfLyss_Outpost  Then TravelTo($TheMirrorOfLyss_Outpost)   
    If GetMapID() = $TheMirrorOfLyss_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TheMirrorOfLyss_Map Then    
		
		Local $aWaypointsA[8][4] = [ [ -22192, -12551, " ", $vqrange] _
		, [-22606, -7806, " ", $vqrange] _
		, [-21990, -4574, " ", $vqrange] _
		, [-20726, -2981, " ", $vqrange] _
		, [-21481, 201, " ", $vqrange] _
		, [-22147, 1533, " ", $vqrange] _
		, [-18989, 3270, " ", $vqrange] _
		, [-17629, 236, " ", $vqrange] ]

		Local $aWaypointsB[28][4] = [ [ -16401, 6466, " ", $vqrange] _
		, [-20395, 8001, " ", $vqrange] _
		, [-16944, 10069, " ", $vqrange] _
		, [-17913, 11223, " ", $vqrange] _
		, [-21413, 11385, " ", $vqrange] _
		, [-22531, 14672, " ", $vqrange] _
		, [-20402, 17209, " ", $vqrange] _
		, [-17560, 15253, " ", $vqrange] _
		, [-15733, 15192, " ", $vqrange] _
		, [-15040, 13069, " ", $vqrange] _
		, [-11766, 15187, " ", $vqrange] _
		, [-9221, 14276, " ", $vqrange] _
		, [-6691, 15315, " ", $vqrange] _
		, [-6076, 13517, " ", $vqrange] _
		, [-4635, 10090, " ", $vqrange] _
		, [-5502, 5293, " ", $vqrange] _
		, [-9718, 3771, " ", $vqrange] _
		, [-9144, 1737, " ", $vqrange] _
		, [-13412, 668, " ", $vqrange] _
		, [-14782, -3468, " ", $vqrange] _
		, [-12416, -5369, " ", $vqrange] _
		, [-16716, -4002, " ", $vqrange] _
		, [-18234, -4817, " ", $vqrange] _
		, [-17462, -8324, " ", $vqrange] _
		, [-21376, -8769, " ", $vqrange] _
		, [-21093, -4286, " ", $vqrange] _
		, [-15892, -3760, " ", $vqrange] _
		, [-10620, -7764, " ", $vqrange] ]

		Local $aWaypointsC[34][4] = [ [ -7842, -1507, " ", $vqrange] _
		, [-3435, -3017, " ", $vqrange] _
		, [586, -1338, " ", $vqrange] _
		, [4814, -1310, " ", $vqrange] _
		, [5901, 1081, " ", $vqrange] _
		, [9608, -170, " ", $vqrange] _
		, [11957, 1319, " ", $vqrange] _
		, [13211, 3866, " ", $vqrange] _
		, [13174, 6363, " ", $vqrange] _
		, [12115, 8621, " ", $vqrange] _
		, [13645, 10491, " ", $vqrange] _
		, [17024, 10167, " ", $vqrange] _
		, [19596, 9457, " ", $vqrange] _
		, [20340, 6990, " ", $vqrange] _
		, [21072, 5909, " ", $vqrange] _
		, [19375, 4454, " ", $vqrange] _
		, [21358, 2390, " ", $vqrange] _
		, [19332, 143, " ", $vqrange] _
		, [16982, -1183, " ", $vqrange] _
		, [14655, -2047, " ", $vqrange] _
		, [19320, -1630, " ", $vqrange] _
		, [22096, -1289, " ", $vqrange] _
		, [20546, -4409, " ", $vqrange] _
		, [18288, -6515, " ", $vqrange] _
		, [17291, -6526, " ", $vqrange] _
		, [14910, -3556, " ", $vqrange] _
		, [16774, -6875, " ", $vqrange] _
		, [16243, -10090, " ", $vqrange] _
		, [19893, -12745, " ", $vqrange] _
		, [18469, -14645, " ", $vqrange] _
		, [18323, -16226, " ", $vqrange] _
		, [16600, -12630, " ", $vqrange] _
		, [13962, -11793, " ", $vqrange] _
		, [15777, -11000, " ", $vqrange] ]

		Local $aWaypointsD[17][4] = [ [ 7232, -11797, " ", $vqrange] _
		, [9099, -15348, " ", $vqrange] _
		, [5530, -12405, " ", $vqrange] _
		, [1616, -14346, " ", $vqrange] _
		, [-1110, -14101, " ", $vqrange] _
		, [-2091, -15979, " ", $vqrange] _
		, [-6296, -15014, " ", $vqrange] _
		, [-7514, -16319, " ", $vqrange] _
		, [-8611, -11528, " ", $vqrange] _
		, [-11901, -11567, " ", $vqrange] _
		, [-16892, -11674, " ", $vqrange] _
		, [-11983, -11307, " ", $vqrange] _
		, [-8358, -11338, " ", $vqrange] _
		, [-4932, -10437, " ", $vqrange] _
		, [-1284, -10528, " ", $vqrange] _
		, [1828, -7453, " ", $vqrange] _
		, [2714, -5016, " ", $vqrange] ]
		
		Local $aWaypoints[87][4] = [ [ -22192, -12551, " ", $vqrange] _
		, [-22606, -7806, " ", $vqrange] _
		, [-21990, -4574, " ", $vqrange] _
		, [-20726, -2981, " ", $vqrange] _
		, [-21481, 201, " ", $vqrange] _
		, [-22147, 1533, " ", $vqrange] _
		, [-18989, 3270, " ", $vqrange] _
		, [-17629, 236, " ", $vqrange] _
		, [-16401, 6466, " ", $vqrange] _
		, [-20395, 8001, " ", $vqrange] _
		, [-16944, 10069, " ", $vqrange] _
		, [-17913, 11223, " ", $vqrange] _
		, [-21413, 11385, " ", $vqrange] _
		, [-22531, 14672, " ", $vqrange] _
		, [-20402, 17209, " ", $vqrange] _
		, [-17560, 15253, " ", $vqrange] _
		, [-15733, 15192, " ", $vqrange] _
		, [-15040, 13069, " ", $vqrange] _
		, [-11766, 15187, " ", $vqrange] _
		, [-9221, 14276, " ", $vqrange] _
		, [-6691, 15315, " ", $vqrange] _
		, [-6076, 13517, " ", $vqrange] _
		, [-4635, 10090, " ", $vqrange] _
		, [-5502, 5293, " ", $vqrange] _
		, [-9718, 3771, " ", $vqrange] _
		, [-9144, 1737, " ", $vqrange] _
		, [-13412, 668, " ", $vqrange] _
		, [-14782, -3468, " ", $vqrange] _
		, [-12416, -5369, " ", $vqrange] _
		, [-16716, -4002, " ", $vqrange] _
		, [-18234, -4817, " ", $vqrange] _
		, [-17462, -8324, " ", $vqrange] _
		, [-21376, -8769, " ", $vqrange] _
		, [-21093, -4286, " ", $vqrange] _
		, [-15892, -3760, " ", $vqrange] _
		, [-10620, -7764, " ", $vqrange] _
		, [-7842, -1507, " ", $vqrange] _
		, [-3435, -3017, " ", $vqrange] _
		, [586, -1338, " ", $vqrange] _
		, [4814, -1310, " ", $vqrange] _
		, [5901, 1081, " ", $vqrange] _
		, [9608, -170, " ", $vqrange] _
		, [11957, 1319, " ", $vqrange] _
		, [13211, 3866, " ", $vqrange] _
		, [13174, 6363, " ", $vqrange] _
		, [12115, 8621, " ", $vqrange] _
		, [13645, 10491, " ", $vqrange] _
		, [17024, 10167, " ", $vqrange] _
		, [19596, 9457, " ", $vqrange] _
		, [20340, 6990, " ", $vqrange] _
		, [21072, 5909, " ", $vqrange] _
		, [19375, 4454, " ", $vqrange] _
		, [21358, 2390, " ", $vqrange] _
		, [19332, 143, " ", $vqrange] _
		, [16982, -1183, " ", $vqrange] _
		, [14655, -2047, " ", $vqrange] _
		, [19320, -1630, " ", $vqrange] _
		, [22096, -1289, " ", $vqrange] _
		, [20546, -4409, " ", $vqrange] _
		, [18288, -6515, " ", $vqrange] _
		, [17291, -6526, " ", $vqrange] _
		, [14910, -3556, " ", $vqrange] _
		, [16774, -6875, " ", $vqrange] _
		, [16243, -10090, " ", $vqrange] _
		, [19893, -12745, " ", $vqrange] _
		, [18469, -14645, " ", $vqrange] _
		, [18323, -16226, " ", $vqrange] _
		, [16600, -12630, " ", $vqrange] _
		, [13962, -11793, " ", $vqrange] _
		, [15777, -11000, " ", $vqrange] _
		, [7232, -11797, " ", $vqrange] _
		, [9099, -15348, " ", $vqrange] _
		, [5530, -12405, " ", $vqrange] _
		, [1616, -14346, " ", $vqrange] _
		, [-1110, -14101, " ", $vqrange] _
		, [-2091, -15979, " ", $vqrange] _
		, [-6296, -15014, " ", $vqrange] _
		, [-7514, -16319, " ", $vqrange] _
		, [-8611, -11528, " ", $vqrange] _
		, [-11901, -11567, " ", $vqrange] _
		, [-16892, -11674, " ", $vqrange] _
		, [-11983, -11307, " ", $vqrange] _
		, [-8358, -11338, " ", $vqrange] _
		, [-4932, -10437, " ", $vqrange] _
		, [-1284, -10528, " ", $vqrange] _
		, [1828, -7453, " ", $vqrange] _
		, [2714, -5016, " ", $vqrange] ]
		
		GoNearestNPCToCoords(-20964, -13053)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-15165, 3285)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-6438, -6872)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(10814, -8738)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc