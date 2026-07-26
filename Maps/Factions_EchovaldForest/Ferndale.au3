#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutFerndale()
	MoveTo(7810, -726)
	MoveTo(10042, -1173)
	Move(10446, -1147)
	WaitForLoad()
EndFunc

Func VQFerndale()
    If GetMapID() <> $Ferndale_Map And GetMapID() <> $Ferndale_Outpost  Then TravelTo($Ferndale_Outpost)   
    If GetMapID() = $Ferndale_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $Ferndale_Map Then    

		Local $aWaypoints[165][4] = [ [-10166, 9355, " ", $vqrange] _
		, [-8861, 10761, " ", $vqrange] _
		, [-9327, 14264, " ", $vqrange] _
		, [-10560, 17028, " ", $vqrange] _
		, [-12126, 19243, " ", $vqrange] _
		, [-11499, 20293, " ", $vqrange] _
		, [-9356, 19472, " ", $vqrange] _
		, [-8532, 19509, " ", $vqrange] _
		, [-6647, 19811, " ", $vqrange] _
		, [-5644, 18769, " ", $vqrange] _
		, [-5164, 15703, " ", $vqrange] _
		, [-5532, 18292, " ", $vqrange] _
		, [-3431, 19554, " ", $vqrange] _
		, [-1635, 19823, " ", $vqrange] _
		, [821, 15267, " ", $vqrange] _
		, [2905, 15017, " ", $vqrange] _
		, [7394, 16019, " ", $vqrange] _
		, [9580, 16248, " ", $vqrange] _
		, [11417, 18904, " ", $vqrange] _
		, [9543, 15348, " ", $vqrange] _
		, [9398, 13417, " ", $vqrange] _
		, [11589, 13283, " ", $vqrange] _
		, [11794, 10356, " ", $vqrange] _
		, [11648, 10179, " ", $vqrange] _
		, [9972, 9346, " ", $vqrange] _
		, [7458, 8882, " ", $vqrange] _
		, [3776, 6845, " ", $vqrange] _
		, [3752, 6242, " ", $vqrange] _
		, [5189, 4619, " ", $vqrange] _
		, [6394, 4092, " ", $vqrange] _
		, [8922, 3668, " ", $vqrange] _
		, [9569, 2893, " ", $vqrange] _
		, [12229, 3743, " ", $vqrange] _
		, [13981, 1566, " ", $vqrange] _
		, [14962, 1329, " ", $vqrange] _
		, [12806, 3177, " ", $vqrange] _
		, [12694, 5036, " ", $vqrange] _
		, [13053, 6566, " ", $vqrange] _
		, [13008, 8202, " ", $vqrange] _
		, [11466, 9395, " ", $vqrange] _
		, [11858, 12920, " ", $vqrange] _
		, [8775, 13824, " ", $vqrange] _
		, [8961, 15157, " ", $vqrange] _
		, [7380, 15079, " ", $vqrange] _
		, [6047, 15121, " ", $vqrange] _
		, [4148, 15018, " ", $vqrange] _
		, [3519, 14529, " ", $vqrange] _
		, [2246, 12958, " ", $vqrange] _
		, [1157, 12277, " ", $vqrange] _
		, [-252, 11399, " ", $vqrange] _
		, [236, 9655, " ", $vqrange] _
		, [1299, 10049, " ", $vqrange] _
		, [1930, 9030, " ", $vqrange] _
		, [2550, 8265, " ", $vqrange] _
		, [3559, 6563, " ", $vqrange] _
		, [4860, 7711, " ", $vqrange] _
		, [5894, 8624, " ", $vqrange] _
		, [8140, 11040, " ", $vqrange] _
		, [8810, 12012, " ", $vqrange] _
		, [9050, 12876, " ", $vqrange] _
		, [704, 12645, " ", $vqrange] _
		, [-4761, 15572, " ", $vqrange] _
		, [-2201, 14383, " ", $vqrange] _
		, [-1760, 13705, " ", $vqrange] _
		, [-2528, 12058, " ", $vqrange] _
		, [-4742, 10742, " ", $vqrange] _
		, [-5173, 8726, " ", $vqrange] _
		, [-5324, 8397, " ", $vqrange] _
		, [-3936, 6274, " ", $vqrange] _
		, [-1311, 8367, " ", $vqrange] _
		, [-3765, 6173, " ", $vqrange] _
		, [-4474, 3839, " ", $vqrange] _
		, [-4132, 6355, " ", $vqrange] _
		, [-6112, 8309, " ", $vqrange] _
		, [-9147, 8828, " ", $vqrange] _
		, [-9929, 8857, " ", $vqrange] _
		, [-12276, 7118, " ", $vqrange] _
		, [-10972, 6380, " ", $vqrange] _
		, [-11062, 2938, " ", $vqrange] _
		, [-10703, 1038, " ", $vqrange] _
		, [-7880, 2550, " ", $vqrange] _
		, [-6168, 2954, " ", $vqrange] _
		, [-5233, 2459, " ", $vqrange] _
		, [-4465, 910, " ", $vqrange] _
		, [-4746, 19, " ", $vqrange] _
		, [-2865, -153, " ", $vqrange] _
		, [-1270, 1063, " ", $vqrange] _
		, [703, 2572, " ", $vqrange] _
		, [1813, 3627, " ", $vqrange] _
		, [2178, 4085, " ", $vqrange] _
		, [-3071, -377, " ", $vqrange] _
		, [-6735, -1447, " ", $vqrange] _
		, [-8566, -3474, " ", $vqrange] _
		, [-8398, -6178, " ", $vqrange] _
		, [-8380, -7556, " ", $vqrange] _
		, [-9558, -8679, " ", $vqrange] _
		, [-8461, -7796, " ", $vqrange] _
		, [-6293, -7455, " ", $vqrange] _
		, [-7092, -4184, " ", $vqrange] _
		, [-5788, -3299, " ", $vqrange] _
		, [-3791, -1121, " ", $vqrange] _
		, [-1972, -2206, " ", $vqrange] _
		, [-23, -2434, " ", $vqrange] _
		, [355, -2379, " ", $vqrange] _
		, [1149, -2522, " ", $vqrange] _
		, [-1642, -2598, " ", $vqrange] _
		, [-3099, -4228, " ", $vqrange] _
		, [-4741, -5315, " ", $vqrange] _
		, [-2723, -7449, " ", $vqrange] _
		, [-1146, -9239, " ", $vqrange] _
		, [-833, -10064, " ", $vqrange] _
		, [-612, -11067, " ", $vqrange] _
		, [821, -10173, " ", $vqrange] _
		, [3390, -12037, " ", $vqrange] _
		, [4463, -11023, " ", $vqrange] _
		, [4807, -9845, " ", $vqrange] _
		, [5129, -8744, " ", $vqrange] _
		, [5618, -7067, " ", $vqrange] _
		, [5716, -6254, " ", $vqrange] _
		, [5252, -5325, " ", $vqrange] _
		, [4691, -3853, " ", $vqrange] _
		, [5299, -2241, " ", $vqrange] _
		, [4869, -2143, " ", $vqrange] _
		, [2730, -3075, " ", $vqrange] _
		, [5561, -1964, " ", $vqrange] _
		, [8398, -2521, " ", $vqrange] _
		, [9970, -3052, " ", $vqrange] _
		, [10800, -2639, " ", $vqrange] _
		, [10832, -1580, " ", $vqrange] _
		, [10121, -1074, " ", $vqrange] _
		, [9855, 247, " ", $vqrange] _
		, [9453, 2002, " ", $vqrange] _
		, [9791, 3194, " ", $vqrange] _
		, [7856, 87, " ", $vqrange] _
		, [7508, -1235, " ", $vqrange] _
		, [5245, -2593, " ", $vqrange] _
		, [4777, -3761, " ", $vqrange] _
		, [5738, -6775, " ", $vqrange] _
		, [5223, -8348, " ", $vqrange] _
		, [4813, -9391, " ", $vqrange] _
		, [4951, -11169, " ", $vqrange] _
		, [6193, -11747, " ", $vqrange] _
		, [7659, -11088, " ", $vqrange] _
		, [8959, -11489, " ", $vqrange] _
		, [8511, -14698, " ", $vqrange] _
		, [8339, -15559, " ", $vqrange] _
		, [9471, -17038, " ", $vqrange] _
		, [10715, -17162, " ", $vqrange] _
		, [12262, -18031, " ", $vqrange] _
		, [12688, -18252, " ", $vqrange] _
		, [11570, -17722, " ", $vqrange] _
		, [9393, -17134, " ", $vqrange] _
		, [7898, -15955, " ", $vqrange] _
		, [7228, -15298, " ", $vqrange] _
		, [6941, -14395, " ", $vqrange] _
		, [5138, -13272, " ", $vqrange] _
		, [4258, -13911, " ", $vqrange] _
		, [3408, -14215, " ", $vqrange] _
		, [1913, -16522, " ", $vqrange] _
		, [327, -17969, " ", $vqrange] _
		, [-294, -18315, " ", $vqrange] _
		, [-2054, -18747, " ", $vqrange] _
		, [-3569, -19027, " ", $vqrange] _
		, [-5662, -17885, " ", $vqrange] _
		, [-6836, -18019, " ", $vqrange] ]

		GoNearestNPCToCoords(-12909, 15616)
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
