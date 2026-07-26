#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSunjiangDistrict()
	MoveTo(11102, -18577)
	MoveTo(11737, -19551)
	Move(11737, -20100)
	WaitForLoad()
EndFunc

Func VQSunjiangDistrict()
    If GetMapID() <> $SunjiangDistrict_Map And GetMapID() <> $SunjiangDistrict_Outpost  Then TravelTo($SunjiangDistrict_Outpost)   
    If GetMapID() = $SunjiangDistrict_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $SunjiangDistrict_Map Then    

		Local $aWaypoints[61][4] = [ [6836, 13075, " ", $vqrange] _
		, [7551, 10917, " ", $vqrange] _
		, [11442, 10230, " ", $vqrange] _
		, [12847, 8114, " ", $vqrange] _
		, [11775, 6266, " ", $vqrange] _
		, [13854, 8373, " ", $vqrange] _
		, [16220, 8210, " ", $vqrange] _
		, [16462, 5624, " ", $vqrange] _
		, [16218, 2185, " ", $vqrange] _
		, [16236, -472, " ", $vqrange] _
		, [16685, -3111, " ", $vqrange] _
		, [16843, -4398, " ", $vqrange] _
		, [16829, -7798, " ", $vqrange] _
		, [15342, -10747, " ", $vqrange] _
		, [16107, -12889, " ", $vqrange] _
		, [13277, -10755, " ", $vqrange] _
		, [11633, -10366, " ", $vqrange] _
		, [8252, -11911, " ", $vqrange] _
		, [8844, -8449, " ", $vqrange] _
		, [11304, -6252, " ", $vqrange] _
		, [12279, -2572, " ", $vqrange] _
		, [12015, 85, " ", $vqrange] _
		, [11799, 2795, " ", $vqrange] _
		, [12156, -1186, " ", $vqrange] _
		, [12002, -5635, " ", $vqrange] _
		, [7018, -7226, " ", $vqrange] _
		, [4677, -8318, " ", $vqrange] _
		, [4117, -12337, " ", $vqrange] _
		, [1410, -12372, " ", $vqrange] _
		, [-1231, -10634, " ", $vqrange] _
		, [-1577, -8710, " ", $vqrange] _
		, [-1573, -7382, " ", $vqrange] _
		, [-5, -6187, " ", $vqrange] _
		, [20, -5190, " ", $vqrange] _
		, [-237, -3334, " ", $vqrange] _
		, [2245, -1057, " ", $vqrange] _
		, [1007, -417, " ", $vqrange] _
		, [2584, 232, " ", $vqrange] _
		, [4035, 2381, " ", $vqrange] _
		, [5003, 1083, " ", $vqrange] _
		, [5285, 358, " ", $vqrange] _
		, [5665, 119, " ", $vqrange] _
		, [6986, 165, " ", $vqrange] _
		, [3410, 2285, " ", $vqrange] _
		, [2066, 2241, " ", $vqrange] _
		, [1043, 2219, " ", $vqrange] _
		, [78, 1410, " ", $vqrange] _
		, [2740, 2341, " ", $vqrange] _
		, [3891, 4081, " ", $vqrange] _
		, [4143, 4435, " ", $vqrange] _
		, [1673, 5932, " ", $vqrange] _
		, [3283, 8042, " ", $vqrange] _
		, [902, 6584, " ", $vqrange] _
		, [-2572, 6774, " ", $vqrange] _
		, [-3643, 5366, " ", $vqrange] _
		, [-4670, 5078, " ", $vqrange] _
		, [-5780, 4685, " ", $vqrange] _
		, [-3630, 2845, " ", $vqrange] _
		, [-3619, 2411, " ", $vqrange] _
		, [-4536, 792, " ", $vqrange] _
		, [-4413, -173, " ", $vqrange] ]

		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc