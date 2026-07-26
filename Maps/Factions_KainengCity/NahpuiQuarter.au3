#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutNahpuiQuarter()
	MoveTo(7574, -16106)
	Move(7400, -17000)
	WaitForLoad()
EndFunc

Func VQNahpuiQuarter()
    If GetMapID() <> $NahpuiQuarter_Map And GetMapID() <> $NahpuiQuarter_Outpost  Then TravelTo($NahpuiQuarter_Outpost)   
    If GetMapID() = $NahpuiQuarter_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $NahpuiQuarter_Map Then    

		Local $aWaypoints[46][4] = [ [10479, 12811, " ", $vqrange] _
		, [10822, 11027, " ", $vqrange] _
		, [15752, 10208, " ", $vqrange] _
		, [19168, 6476, " ", $vqrange] _
		, [18820, 4312, " ", $vqrange] _
		, [15750, 2658, " ", $vqrange] _
		, [14424, 2980, " ", $vqrange] _
		, [14161, 5095, " ", $vqrange] _
		, [12705, 5053, " ", $vqrange] _
		, [12182, 2170, " ", $vqrange] _
		, [11191, 2208, " ", $vqrange] _
		, [11383, 6704, " ", $vqrange] _
		, [7828, 6949, " ", $vqrange] _
		, [6098, 7481, " ", $vqrange] _
		, [7255, 5866, " ", $vqrange] _
		, [7676, 3013, " ", $vqrange] _
		, [9120, 1898, " ", $vqrange] _
		, [8731, -953, " ", $vqrange] _
		, [7041, -2578, " ", $vqrange] _
		, [6766, -3769, " ", $vqrange] _
		, [5559, -3803, " ", $vqrange] _
		, [4281, -1961, " ", $vqrange] _
		, [4808, -165, " ", $vqrange] _
		, [4232, -1973, " ", $vqrange] _
		, [5464, -3772, " ", $vqrange] _
		, [6995, -3727, " ", $vqrange] _
		, [7107, -2365, " ", $vqrange] _
		, [10203, 850, " ", $vqrange] _
		, [12413, 2402, " ", $vqrange] _
		, [13003, 5214, " ", $vqrange] _
		, [14315, 4919, " ", $vqrange] _
		, [15544, -1093, " ", $vqrange] _
		, [16140, -3882, " ", $vqrange] _
		, [17113, 457, " ", $vqrange] _
		, [20091, 1796, " ", $vqrange] _
		, [20143, 227, " ", $vqrange] _
		, [16584, -577, " ", $vqrange] _
		, [16294, -5446, " ", $vqrange] _
		, [18386, -5813, " ", $vqrange] _
		, [20464, -8531, " ", $vqrange] _
		, [18762, -11101, " ", $vqrange] _
		, [14985, -11488, " ", $vqrange] _
		, [12752, -10501, " ", $vqrange] _
		, [13416, -6539, " ", $vqrange] _
		, [12413, -3364, " ", $vqrange] _
		, [13840, -2163, " ", $vqrange] ]

		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc