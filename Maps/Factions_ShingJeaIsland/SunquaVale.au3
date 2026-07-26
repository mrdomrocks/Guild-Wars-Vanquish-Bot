#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSunquaVale()
	MoveTo(-11086, 10149)
	MoveTo(-13860, 10410)
	Move(-15200, 11510)
	WaitForLoad()
EndFunc

Func VQSunquaVale()
    If GetMapID() <> $SunquaVale_Map And GetMapID() <> $SunquaVale_Outpost  Then TravelTo($SunquaVale_Outpost)   
    If GetMapID() = $SunquaVale_Outpost then
        GoOut() 

    EndIf

	If GetMapID() = $SunquaVale_Map Then    

		Local $aWaypoints[90][4] = [ [17277, -8881, " ", $vqrange] _		
		, [15100, -8128, " ", $vqrange] _
		, [13488, -8588, " ", $vqrange] _
		, [13720, -11647, " ", $vqrange] _
		, [15347, -12880, " ", $vqrange] _
		, [13523, -14826, " ", $vqrange] _
		, [10862, -11814, " ", $vqrange] _
		, [7706, -10645, " ", $vqrange] _
		, [7247, -8929, " ", $vqrange] _
		, [2303, -11665, " ", $vqrange] _
		, [665, -9486, " ", $vqrange] _
		, [-508, -9093, " ", $vqrange] _
		, [-1116, -11595, " ", $vqrange] _
		, [-1886, -8428, " ", $vqrange] _
		, [-5325, -6882, " ", $vqrange] _
		, [-6943, -4287, " ", $vqrange] _
		, [-6479, -8522, " ", $vqrange] _
		, [-10724, -5305, " ", $vqrange] _
		, [-12889, -5532, " ", $vqrange] _
		, [-14695, -4587, " ", $vqrange] _
		, [-15376, -2593, " ", $vqrange] _
		, [-17211, -1424, " ", $vqrange] _
		, [-12549, 174, " ", $vqrange] _
		, [-9232, -916, " ", $vqrange] _
		, [-8257, 433, " ", $vqrange] _
		, [-7543, -2474, " ", $vqrange] _
		, [-4737, 266, " ", $vqrange] _
		, [-4085, 2499, " ", $vqrange] _
		, [698, 3202, " ", $vqrange] _
		, [2821, 1637, " ", $vqrange] _
		, [3205, 238, " ", $vqrange] _
		, [5368, 654, " ", $vqrange] _
		, [80, -834, " ", $vqrange] _
		, [-1003, 2958, " ", $vqrange] _
		, [3287, 5539, " ", $vqrange] _
		, [-3623, 5574, " ", $vqrange] _
		, [-7886, 5272, " ", $vqrange] _
		, [-11901, 4639, " ", $vqrange] _
		, [-14259, 8069, " ", $vqrange] _
		, [-17017, 8580, " ", $vqrange] _
		, [-17293, 10064, " ", $vqrange] _
		, [-14766, 12603, " ", $vqrange] _
		, [-10745, 10457, " ", $vqrange] _
		, [-8207, 10340, " ", $vqrange] _
		, [-5339, 10361, " ", $vqrange] _
		, [-4369, 9825, " ", $vqrange] _
		, [-3283, 6028, " ", $vqrange] _
		, [-2240, 10076, " ", $vqrange] _
		, [3746, 10046, " ", $vqrange] _
		, [9067, 9004, " ", $vqrange] _
		, [11311, 7516, " ", $vqrange] _
		, [11492, 11732, " ", $vqrange] _
		, [14521, 13813, " ", $vqrange] _
		, [16402, 14982, " ", $vqrange] _
		, [17969, 15490, " ", $vqrange] _
		, [19555, 14343, " ", $vqrange] _
		, [21668, 15498, " ", $vqrange] _
		, [20115, 13752, " ", $vqrange] _
		, [22741, 10502, " ", $vqrange] _
		, [20715, 8554, " ", $vqrange] _
		, [19305, 7588, " ", $vqrange] _
		, [17815, 10842, " ", $vqrange] _
		, [17590, 12540, " ", $vqrange] _
		, [19769, 11951, " ", $vqrange] _
		, [21617, 12105, " ", $vqrange] _
		, [22273, 9273, " ", $vqrange] _
		, [18860, 6983, " ", $vqrange] _
		, [16443, 3039, " ", $vqrange] _
		, [14419, 2715, " ", $vqrange] _
		, [12932, 1578, " ", $vqrange] _
		, [11086, -112, " ", $vqrange] _
		, [10572, -569, " ", $vqrange] _
		, [7128, -1857, " ", $vqrange] _
		, [8428, -5481, " ", $vqrange] _
		, [11758, -5922, " ", $vqrange] _
		, [11938, -3332, " ", $vqrange] _
		, [12248, -970, " ", $vqrange] _
		, [12815, 3220, " ", $vqrange] _
		, [9942, 4709, " ", $vqrange] _
		, [15195, 1358, " ", $vqrange] _
		, [16330, -2605, " ", $vqrange] _
		, [18757, -1886, " ", $vqrange] _
		, [18513, -4818, " ", $vqrange] _
		, [16769, -5285, " ", $vqrange] _
		, [12537, -6083, " ", $vqrange] _
		, [7053, -7068, " ", $vqrange] _
		, [7053, -7068, " ", $vqrange] _
		, [3171, -8449, " ", $vqrange] _
		, [5523, -7143, " ", $vqrange] _
		, [3067, -4529, " ", $vqrange] ]
		
		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc

