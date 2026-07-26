#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutHaijuLagoon()
	MoveTo(18839, 13668)
	Move(19100, 14100)
	WaitForLoad()
EndFunc

Func VQHaijuLagoon()
    If GetMapID() <> $HaijuLagoon_Map And GetMapID() <> $HaijuLagoon_Outpost  Then TravelTo($HaijuLagoon_Outpost)   
    If GetMapID() = $HaijuLagoon_Outpost then
        GoOut() 
	
    EndIf

	If GetMapID() = $HaijuLagoon_Map Then    

		Local $aWaypoints[59][4] = [ [14484, -18600, " ", $vqrange] _
		, [16232, -14877, " ", $vqrange] _
		, [12196, -12428, " ", $vqrange] _
		, [9797, -9325, " ", $vqrange] _
		, [8216, -10852, " ", $vqrange] _
		, [11023, -16725, " ", $vqrange] _
		, [13585, -18592, " ", $vqrange] _
		, [9518, -16544, " ", $vqrange] _
		, [7691.43, -14407.90, " ", $vqrange] _
		, [8254.43, -16616.64, " ", $vqrange] _
		, [7070, -16496, " ", $vqrange] _
		, [3789, -16104, " ", $vqrange] _
		, [220, -16995, " ", $vqrange] _
		, [-3108, -15764, " ", $vqrange] _
		, [-4705, -14943, " ", $vqrange] _
		, [-2049, -12629, " ", $vqrange] _
		, [-4902, -10370, " ", $vqrange] _
		, [-6438, -11053, " ", $vqrange] _
		, [-5661, -8264, " ", $vqrange] _
		, [-2484, -7537, " ", $vqrange] _
		, [-7200, -6323, " ", $vqrange] _
		, [-8089, -2895, " ", $vqrange] _
		, [-4835, -1557, " ", $vqrange] _
		, [-8037, 410, " ", $vqrange] _
		, [-6001, 3725, " ", $vqrange] _
		, [-8814, 5841, " ", $vqrange] _
		, [-12673, 4476, " ", $vqrange] _
		, [-11633, 9202, " ", $vqrange] _
		, [-14089, 5559, " ", $vqrange] _
		, [-10015, 12739, " ", $vqrange] _
		, [-6771, 14656, " ", $vqrange] _
		, [-3680, 15999, " ", $vqrange] _
		, [-3471, 17914, " ", $vqrange] _
		, [-263, 18188, " ", $vqrange] _
		, [-656, 15241, " ", $vqrange] _
		, [2677, 13524, " ", $vqrange] _
		, [4281, 12442, " ", $vqrange] _
		, [5443, 8008, " ", $vqrange] _
		, [5855, 6578, " ", $vqrange] _
		, [7043, 5650, " ", $vqrange] _
		, [9733, 7192, " ", $vqrange] _
		, [8379, 8670, " ", $vqrange] _
		, [12676, 2298, " ", $vqrange] _
		, [8652, -334, " ", $vqrange] _
		, [14582, -1830, " ", $vqrange] _
		, [16191, -1183, " ", $vqrange] _
		, [10098, -632, " ", $vqrange] _
		, [6760, 1297, " ", $vqrange] _
		, [6007, -3343, " ", $vqrange] _
		, [4801, -5800, " ", $vqrange] _
		, [3838, -2593, " ", $vqrange] _
		, [2373.65, 2269.77, " ", $vqrange] _
		, [892.32, 1170.95, " ", $vqrange] _
		, [-1336, 1925, " ", $vqrange] _
		, [-3879, 3130, " ", $vqrange] _
		, [-2051, 7005, " ", $vqrange] _
		, [-5427, 9048, " ", $vqrange] _
		, [-68, 9818, " ", $vqrange] _
		, [3736, 7831, " ", $vqrange] ]			
		MoveandAggroVQFullRoute($aWaypoints)
    EndIf
EndFunc