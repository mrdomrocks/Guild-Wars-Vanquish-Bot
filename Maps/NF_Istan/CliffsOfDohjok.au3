#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutCliffsOfDohjok()
	MoveTo(2572, 1621)
	MoveTo(4300, 4564)
	Move(4400, 4590)
	WaitForLoad()
EndFunc

Func VQCliffsOfDohjok()
    If GetMapID() <> $CliffsOfDohjok_Map And GetMapID() <> $CliffsOfDohjok_Outpost  Then TravelTo($CliffsOfDohjok_Outpost)   
    If GetMapID() = $CliffsOfDohjok_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $CliffsOfDohjok_Map Then    	

		Local $aWaypointsA[13][4] = [ [-25755, -6529, " ", $vqrange] _
		, [-24124, -5753, " ", $vqrange] _
		, [-21084, -7115, " ", $vqrange] _
		, [-19788, -10289, " ", $vqrange] _
		, [-20274, -4536, " ", $vqrange] _
		, [-23328, 673, " ", $vqrange] _
		, [-25688, 547, " ", $vqrange] _
		, [-23947, -1029, " ", $vqrange] _
		, [-24789, -4156, " ", $vqrange] _
		, [-18748, -3056, " ", $vqrange] _
		, [-14797, -5997, " ", $vqrange] _
		, [-14993, -3079, " ", $vqrange] _
		, [-13661, -2347, " ", $vqrange] ]

		Local $aWaypointsB[12][4] = [ [-10014, 145, " ", $vqrange] _
		, [-9031, -4292, " ", $vqrange] _
		, [-6139, -6385, " ", $vqrange] _
		, [-2841, -5738, " ", $vqrange] _
		, [-2949, -7346, " ", $vqrange] _
		, [-2822, -5925, " ", $vqrange] _
		, [1053, -6505, " ", $vqrange] _
		, [4510, -6182, " ", $vqrange] _
		, [6425, -3035, " ", $vqrange] _
		, [8758, -5358, " ", $vqrange] _
		, [9702, -7516, " ", $vqrange] _
		, [11702, -9216, " ", $vqrange] ]

		Local $aWaypointsC[18][4] = [ [14531, -6114, " ", $vqrange] _
		, [10438, -4186, " ", $vqrange] _
		, [10317, -3958, " ", $vqrange] _
		, [10742, -322, " ", $vqrange] _
		, [12909, -2355, " ", $vqrange] _
		, [14344, 513, " ", $vqrange] _
		, [16348, -427, " ", $vqrange] _
		, [17154, 4575, " ", $vqrange] _
		, [19763, 894, " ", $vqrange] _
		, [21710, 529, " ", $vqrange] _
		, [19999, 5056, " ", $vqrange] _
		, [16566, 7976, " ", $vqrange] _
		, [13921, 10158, " ", $vqrange] _
		, [13211, 7041, " ", $vqrange] _
		, [11459, 5175, " ", $vqrange] _
		, [8427, 9919, " ", $vqrange] _
		, [9465, 12401, " ", $vqrange] _
		, [4368, 12205, " ", $vqrange] ]
		
		Local $aWaypointsD[38][4] = [ [1893, 8700, " ", $vqrange] _
		, [-476, 7017, " ", $vqrange] _
		, [-3206, 3948, " ", $vqrange] _
		, [-3544, 2620, " ", $vqrange] _
		, [-201, 1828, " ", $vqrange] _
		, [917, 3305, " ", $vqrange] _
		, [-686, 6995, " ", $vqrange] _
		, [1838, 8752, " ", $vqrange] _
		, [2872, 5394, " ", $vqrange] _
		, [6691, 7826, " ", $vqrange] _
		, [6635, 7787, " ", $vqrange] _
		, [3392, 4267, " ", $vqrange] _
		, [9450, 5372, " ", $vqrange] _
		, [8506, 8859, " ", $vqrange] _
		, [3507, 3957, " ", $vqrange] _
		, [-912, -2246, " ", $vqrange] _
		, [-3846, -1644, " ", $vqrange] _
		, [-8527, 1392, " ", $vqrange] _
		, [-11530, 1786, " ", $vqrange] _
		, [-10733, 5372, " ", $vqrange] _
		, [-11641, 4920, " ", $vqrange] _
		, [-13975, 4929, " ", $vqrange] _
		, [-11300, 9929, " ", $vqrange] _
		, [-9526, 14097, " ", $vqrange] _
		, [-5322, 10825, " ", $vqrange] _
		, [-6486, 7596, " ", $vqrange] _
		, [-2789, 8864, " ", $vqrange] _
		, [-5442, 12036, " ", $vqrange] _
		, [-12760, 10198, " ", $vqrange] _
		, [-20181, 11258, " ", $vqrange] _
		, [-20920, 9293, " ", $vqrange] _
		, [-21474, 6122, " ", $vqrange] _
		, [-17008, 4062, " ", $vqrange] _
		, [-12626, 9086, " ", $vqrange] _
		, [-17557, 3384, " ", $vqrange] _
		, [-20972, -868, " ", $vqrange] _
		, [-21064, 4469, " ", $vqrange] _
		, [-21180, 6472, " ", $vqrange] ]
		
		Local $aWaypoints[81][4] = [ [-25755, -6529, " ", $vqrange] _
		, [-24124, -5753, " ", $vqrange] _
		, [-21084, -7115, " ", $vqrange] _
		, [-19788, -10289, " ", $vqrange] _
		, [-20274, -4536, " ", $vqrange] _
		, [-23328, 673, " ", $vqrange] _
		, [-25688, 547, " ", $vqrange] _
		, [-23947, -1029, " ", $vqrange] _
		, [-24789, -4156, " ", $vqrange] _
		, [-18748, -3056, " ", $vqrange] _
		, [-14797, -5997, " ", $vqrange] _
		, [-14993, -3079, " ", $vqrange] _
		, [-13661, -2347, " ", $vqrange] _
		, [-10014, 145, " ", $vqrange] _
		, [-9031, -4292, " ", $vqrange] _
		, [-6139, -6385, " ", $vqrange] _
		, [-2841, -5738, " ", $vqrange] _
		, [-2949, -7346, " ", $vqrange] _
		, [-2822, -5925, " ", $vqrange] _
		, [1053, -6505, " ", $vqrange] _
		, [4510, -6182, " ", $vqrange] _
		, [6425, -3035, " ", $vqrange] _
		, [8758, -5358, " ", $vqrange] _
		, [9702, -7516, " ", $vqrange] _
		, [11702, -9216, " ", $vqrange] _
		, [14531, -6114, " ", $vqrange] _
		, [10438, -4186, " ", $vqrange] _
		, [10317, -3958, " ", $vqrange] _
		, [10742, -322, " ", $vqrange] _
		, [12909, -2355, " ", $vqrange] _
		, [14344, 513, " ", $vqrange] _
		, [16348, -427, " ", $vqrange] _
		, [17154, 4575, " ", $vqrange] _
		, [19763, 894, " ", $vqrange] _
		, [21710, 529, " ", $vqrange] _
		, [19999, 5056, " ", $vqrange] _
		, [16566, 7976, " ", $vqrange] _
		, [13921, 10158, " ", $vqrange] _
		, [13211, 7041, " ", $vqrange] _
		, [11459, 5175, " ", $vqrange] _
		, [8427, 9919, " ", $vqrange] _
		, [9465, 12401, " ", $vqrange] _
		, [4368, 12205, " ", $vqrange] _
		, [1893, 8700, " ", $vqrange] _
		, [-476, 7017, " ", $vqrange] _
		, [-3206, 3948, " ", $vqrange] _
		, [-3544, 2620, " ", $vqrange] _
		, [-201, 1828, " ", $vqrange] _
		, [917, 3305, " ", $vqrange] _
		, [-686, 6995, " ", $vqrange] _
		, [1838, 8752, " ", $vqrange] _
		, [2872, 5394, " ", $vqrange] _
		, [6691, 7826, " ", $vqrange] _
		, [6635, 7787, " ", $vqrange] _
		, [3392, 4267, " ", $vqrange] _
		, [9450, 5372, " ", $vqrange] _
		, [8506, 8859, " ", $vqrange] _
		, [3507, 3957, " ", $vqrange] _
		, [-912, -2246, " ", $vqrange] _
		, [-3846, -1644, " ", $vqrange] _
		, [-8527, 1392, " ", $vqrange] _
		, [-11530, 1786, " ", $vqrange] _
		, [-10733, 5372, " ", $vqrange] _
		, [-11641, 4920, " ", $vqrange] _
		, [-13975, 4929, " ", $vqrange] _
		, [-11300, 9929, " ", $vqrange] _
		, [-9526, 14097, " ", $vqrange] _
		, [-5322, 10825, " ", $vqrange] _
		, [-6486, 7596, " ", $vqrange] _
		, [-2789, 8864, " ", $vqrange] _
		, [-5442, 12036, " ", $vqrange] _
		, [-12760, 10198, " ", $vqrange] _
		, [-20181, 11258, " ", $vqrange] _
		, [-20920, 9293, " ", $vqrange] _
		, [-21474, 6122, " ", $vqrange] _
		, [-17008, 4062, " ", $vqrange] _
		, [-12626, 9086, " ", $vqrange] _
		, [-17557, 3384, " ", $vqrange] _
		, [-20972, -868, " ", $vqrange] _
		, [-21064, 4469, " ", $vqrange] _
		, [-21180, 6472, " ", $vqrange] ]		
		
		GoNearestNPCToCoords(-25984, -9240)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-14045, -1982)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(12640, -6353)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(1548, 13289)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc
