#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMorostavTrail()
	MoveTo(-9715, -3376)
	MoveTo(-11645, -5155)
	MoveTo(-12065, -7488)
	MoveTo(-13751.78, -7651.70)
	Move(-14045.97, -7854.88)
	WaitMapLoading()
EndFunc

Func VQMorostavTrail()
    If GetMapID() <> $MorostavTrail_Map And GetMapID() <> $MorostavTrail_Outpost  Then TravelTo($MorostavTrail_Outpost)   
    If GetMapID() = $MorostavTrail_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $MorostavTrail_Map Then    

		Local $aWaypoints[68][4] = [ [20315, 12173, " ", $vqrange] _
		, [20845, 8770, " ", $vqrange] _
		, [18020, 8454, " ", $vqrange] _
		, [16171, 7232, " ", $vqrange] _
		, [16657, 10270, " ", $vqrange] _
		, [14393, 11062, " ", $vqrange] _
		, [13093, 9324, " ", $vqrange] _
		, [10674, 8080, " ", $vqrange] _
		, [9279, 7069, " ", $vqrange] _
		, [10246, 9098, " ", $vqrange] _
		, [8478, 11608, " ", $vqrange] _
		, [5118, 10962, " ", $vqrange] _
		, [4721, 8571, " ", $vqrange] _
		, [3828, 6704, " ", $vqrange] _
		, [2871, 7379, " ", $vqrange] _
		, [2796, 9911, " ", $vqrange] _
		, [-335, 7249, " ", $vqrange] _
		, [-2853, 5660, " ", $vqrange] _
		, [-5214, 3032, " ", $vqrange] _
		, [-8534, 1707, " ", $vqrange] _
		, [-10165, 3027, " ", $vqrange] _
		, [-13202, 2487, " ", $vqrange] _
		, [-14079, 5232, " ", $vqrange] _
		, [-15797, 6641, " ", $vqrange] _
		, [-17320, 8183, " ", $vqrange] _
		, [-18647, 9941, " ", $vqrange] _
		, [-20777, 8615, " ", $vqrange] _
		, [-19937, 5234, " ", $vqrange] _
		, [-17715, 4292, " ", $vqrange] _
		, [-14630, 4648, " ", $vqrange] _
		, [-13717, 1908, " ", $vqrange] _
		, [-14975, 571, " ", $vqrange] _
		, [-11396, 1701, " ", $vqrange] _
		, [-10756, -118, " ", $vqrange] _
		, [-9015, -780, " ", $vqrange] _
		, [-8938, -3425, " ", $vqrange] _
		, [-9442, -5649, " ", $vqrange] _
		, [-12163, -6337, " ", $vqrange] _
		, [-8893, -6419, " ", $vqrange] _
		, [-6219, -7280, " ", $vqrange] _
		, [-5081, -4879, " ", $vqrange] _
		, [-3960, -2012, " ", $vqrange] _
		, [-3004, -4411, " ", $vqrange] _
		, [-1366, -5099, " ", $vqrange] _
		, [52, -4588, " ", $vqrange] _
		, [595, -6057, " ", $vqrange] _
		, [3177, -5099, " ", $vqrange] _
		, [6484, -3921, " ", $vqrange] _
		, [4859, -5518, " ", $vqrange] _
		, [6522, -6806, " ", $vqrange] _
		, [9084, -6473, " ", $vqrange] _
		, [11177, -4406, " ", $vqrange] _
		, [11137, -2343, " ", $vqrange] _
		, [12388, -220, " ", $vqrange] _
		, [14611, 213, " ", $vqrange] _
		, [16270, -622, " ", $vqrange] _
		, [15411, -2703, " ", $vqrange] _
		, [13694, -2761, " ", $vqrange] _
		, [12211, -2783, " ", $vqrange] _
		, [8271, -2762, " ", $vqrange] _
		, [9537, -847, " ", $vqrange] _
		, [8453, 2862, " ", $vqrange] _
		, [6476, 3066, " ", $vqrange] _
		, [3942, 4122, " ", $vqrange] _
		, [2423, 2335, " ", $vqrange] _
		, [1005, 1426, " ", $vqrange] _
		, [1838, -78, " ", $vqrange] _
		, [4075, 601, " ", $vqrange] ]

		GoNearestNPCToCoords(22109, 12076)
	If GetKurzickFaction() > GetLuxonFaction() Then
                Dialog(0x81)
                Sleep(1000)
                Dialog(0x2)
                Sleep(1000)
                Dialog(0x84)
	        Sleep(1000)
	        Dialog(0x86)
	        Sleep(1000)
        Else
                Dialog(0x85)
                Sleep(1000)
                Dialog(0x86)
                Sleep(1000)
        EndIf

		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc