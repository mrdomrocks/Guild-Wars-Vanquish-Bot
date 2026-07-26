#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutWildernessOfBahdza()
	MoveTo(4537, 1365)
	MoveTo(4783, 1220)
	Move(4983, 1220)
	WaitForLoad()
EndFunc

Func VQWildernessOfBahdza()
    If GetMapID() <> $WildernessOfBahdza_Map And GetMapID() <> $WildernessOfBahdza_Outpost  Then TravelTo($WildernessOfBahdza_Outpost)   
    If GetMapID() = $WildernessOfBahdza_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $WildernessOfBahdza_Map Then    
		
		Local $aWaypointsA[5][4] = [ [-16584, 293, " ", $vqrange] _
		, [-13593, 281, " ", $vqrange] _
		, [-13539, -1646, " ", $vqrange] _
		, [-12130, -3759, " ", $vqrange] _
		, [-9474, -3800, " ", $vqrange] ]

		Local $aWaypointsB[6][4] = [ [-13429, -3636, " ", $vqrange] _
		, [-15145, -6588, " ", $vqrange] _
		, [-18020, -7578, " ", $vqrange] _
		, [-19340, -7477, " ", $vqrange] _
		, [-17766, -10716, " ", $vqrange] _
		, [-15681, -11067, " ", $vqrange] ]

		Local $aWaypointsC[49][4] = [ [-11251, -11194, " ", $vqrange] _
		, [-11027, -16307, " ", $vqrange] _
		, [-10557, -18805, " ", $vqrange] _
		, [-12895, -18559, " ", $vqrange] _
		, [-12330, -16749, " ", $vqrange] _
		, [-15366, -15338, " ", $vqrange] _
		, [-19324, -14739, " ", $vqrange] _
		, [-17576, -12893, " ", $vqrange] _
		, [-14502, -15753, " ", $vqrange] _
		, [-10291, -17060, " ", $vqrange] _
		, [-7237, -17329, " ", $vqrange] _
		, [-4786, -16862, " ", $vqrange] _
		, [-6874, -12793, " ", $vqrange] _
		, [-5954, -9706, " ", $vqrange] _
		, [-6214, -8665, " ", $vqrange] _
		, [-8433, -9098, " ", $vqrange] _
		, [-6156, -6196, " ", $vqrange] _
		, [-3155, -5047, " ", $vqrange] _
		, [206, -6139, " ", $vqrange] _
		, [-517, -10646, " ", $vqrange] _
		, [-1178, -12683, " ", $vqrange] _
		, [1486, -14459, " ", $vqrange] _
		, [2852, -17660, " ", $vqrange] _
		, [4699, -19238, " ", $vqrange] _
		, [7296, -14211, " ", $vqrange] _
		, [8581, -10416, " ", $vqrange] _
		, [11805, -8369, " ", $vqrange] _
		, [12485, -10233, " ", $vqrange] _
		, [13392, -11986, " ", $vqrange] _
		, [13649, -13427, " ", $vqrange] _
		, [13291, -15842, " ", $vqrange] _
		, [12195, -17601, " ", $vqrange] _
		, [10961, -18824, " ", $vqrange] _
		, [7758, -19218, " ", $vqrange] _
		, [10961, -18824, " ", $vqrange] _
		, [15407, -18198, " ", $vqrange] _
		, [17332, -17059, " ", $vqrange] _
		, [18611, -18606, " ", $vqrange] _
		, [18802, -15847, " ", $vqrange] _
		, [16570, -12552, " ", $vqrange] _
		, [14091, -12832, " ", $vqrange] _
		, [16335, -12182, " ", $vqrange] _
		, [17443, -9506, " ", $vqrange] _
		, [18981, -9441, " ", $vqrange] _
		, [17609, -7004, " ", $vqrange] _
		, [16258, -5410, " ", $vqrange] _
		, [17619, -2703, " ", $vqrange] _
		, [15063, -930, " ", $vqrange] _
		, [13361, -2756, " ", $vqrange] ]

		Local $aWaypointsD[25][4] = [ [11703, -7209, " ", $vqrange] _
		, [9122, -4374, " ", $vqrange] _
		, [6911, -3183, " ", $vqrange] _
		, [3993, -6640, " ", $vqrange] _
		, [99, -6048, " ", $vqrange] _
		, [3993, -6640, " ", $vqrange] _
		, [6197, -3584, " ", $vqrange] _
		, [8230, 1201, " ", $vqrange] _
		, [10432, 2631, " ", $vqrange] _
		, [9544, 5331, " ", $vqrange] _
		, [9183, 7415, " ", $vqrange] _
		, [10570, 10515, " ", $vqrange] _
		, [9525, 13646, " ", $vqrange] _
		, [8607, 14829, " ", $vqrange] _
		, [7335, 19133, " ", $vqrange] _
		, [5770, 19229, " ", $vqrange] _
		, [6539, 16534, " ", $vqrange] _
		, [2423, 16080, " ", $vqrange] _
		, [-504, 16036, " ", $vqrange] _
		, [-2662, 16400, " ", $vqrange] _
		, [-3268, 15574, " ", $vqrange] _
		, [-1790, 16263, " ", $vqrange] _
		, [-809, 12785, " ", $vqrange] _
		, [2821, 11473, " ", $vqrange] _
		, [3007, 8016, " ", $vqrange] ]
		
		Local $aWaypointsE[9][4] = [ [-26, 8229, " ", $vqrange] _
		, [2260, 7246, " ", $vqrange] _
		, [2074, 4361, " ", $vqrange] _
		, [391, 3050, " ", $vqrange] _
		, [6170, 2925, " ", $vqrange] _
		, [505, 608, " ", $vqrange] _
		, [-5831, -1347, " ", $vqrange] _
		, [-5486, 3207, " ", $vqrange] _
		, [-9553, -752, " ", $vqrange] ]
		
		Local $aWaypoints[94][4] = [ [-16584, 293, " ", $vqrange] _
		, [-13593, 281, " ", $vqrange] _
		, [-13539, -1646, " ", $vqrange] _
		, [-12130, -3759, " ", $vqrange] _
		, [-9474, -3800, " ", $vqrange] _
		, [-13429, -3636, " ", $vqrange] _
		, [-15145, -6588, " ", $vqrange] _
		, [-18020, -7578, " ", $vqrange] _
		, [-19340, -7477, " ", $vqrange] _
		, [-17766, -10716, " ", $vqrange] _
		, [-15681, -11067, " ", $vqrange] _
		, [-11251, -11194, " ", $vqrange] _
		, [-11027, -16307, " ", $vqrange] _
		, [-10557, -18805, " ", $vqrange] _
		, [-12895, -18559, " ", $vqrange] _
		, [-12330, -16749, " ", $vqrange] _
		, [-15366, -15338, " ", $vqrange] _
		, [-19324, -14739, " ", $vqrange] _
		, [-17576, -12893, " ", $vqrange] _
		, [-14502, -15753, " ", $vqrange] _
		, [-10291, -17060, " ", $vqrange] _
		, [-7237, -17329, " ", $vqrange] _
		, [-4786, -16862, " ", $vqrange] _
		, [-6874, -12793, " ", $vqrange] _
		, [-5954, -9706, " ", $vqrange] _
		, [-6214, -8665, " ", $vqrange] _
		, [-8433, -9098, " ", $vqrange] _
		, [-6156, -6196, " ", $vqrange] _
		, [-3155, -5047, " ", $vqrange] _
		, [206, -6139, " ", $vqrange] _
		, [-517, -10646, " ", $vqrange] _
		, [-1178, -12683, " ", $vqrange] _
		, [1486, -14459, " ", $vqrange] _
		, [2852, -17660, " ", $vqrange] _
		, [4699, -19238, " ", $vqrange] _
		, [7296, -14211, " ", $vqrange] _
		, [8581, -10416, " ", $vqrange] _
		, [11805, -8369, " ", $vqrange] _
		, [12485, -10233, " ", $vqrange] _
		, [13392, -11986, " ", $vqrange] _
		, [13649, -13427, " ", $vqrange] _
		, [13291, -15842, " ", $vqrange] _
		, [12195, -17601, " ", $vqrange] _
		, [10961, -18824, " ", $vqrange] _
		, [7758, -19218, " ", $vqrange] _
		, [10961, -18824, " ", $vqrange] _
		, [15407, -18198, " ", $vqrange] _
		, [17332, -17059, " ", $vqrange] _
		, [18611, -18606, " ", $vqrange] _
		, [18802, -15847, " ", $vqrange] _
		, [16570, -12552, " ", $vqrange] _
		, [14091, -12832, " ", $vqrange] _
		, [16335, -12182, " ", $vqrange] _
		, [17443, -9506, " ", $vqrange] _
		, [18981, -9441, " ", $vqrange] _
		, [17609, -7004, " ", $vqrange] _
		, [16258, -5410, " ", $vqrange] _
		, [17619, -2703, " ", $vqrange] _
		, [15063, -930, " ", $vqrange] _
		, [13361, -2756, " ", $vqrange] _
		, [11703, -7209, " ", $vqrange] _
		, [9122, -4374, " ", $vqrange] _
		, [6911, -3183, " ", $vqrange] _
		, [3993, -6640, " ", $vqrange] _
		, [99, -6048, " ", $vqrange] _
		, [3993, -6640, " ", $vqrange] _
		, [6197, -3584, " ", $vqrange] _
		, [8230, 1201, " ", $vqrange] _
		, [10432, 2631, " ", $vqrange] _
		, [9544, 5331, " ", $vqrange] _
		, [9183, 7415, " ", $vqrange] _
		, [10570, 10515, " ", $vqrange] _
		, [9525, 13646, " ", $vqrange] _
		, [8607, 14829, " ", $vqrange] _
		, [7335, 19133, " ", $vqrange] _
		, [5770, 19229, " ", $vqrange] _
		, [6539, 16534, " ", $vqrange] _
		, [2423, 16080, " ", $vqrange] _
		, [-504, 16036, " ", $vqrange] _
		, [-2662, 16400, " ", $vqrange] _
		, [-3268, 15574, " ", $vqrange] _
		, [-1790, 16263, " ", $vqrange] _
		, [-809, 12785, " ", $vqrange] _
		, [2821, 11473, " ", $vqrange] _
		, [3007, 8016, " ", $vqrange] _
		, [-26, 8229, " ", $vqrange] _
		, [2260, 7246, " ", $vqrange] _
		, [2074, 4361, " ", $vqrange] _
		, [391, 3050, " ", $vqrange] _
		, [6170, 2925, " ", $vqrange] _
		, [505, 608, " ", $vqrange] _
		, [-5831, -1347, " ", $vqrange] _
		, [-5486, 3207, " ", $vqrange] _
		, [-9553, -752, " ", $vqrange] ]
		
		GoNearestNPCToCoords(-19332, 454)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-7801, -2353)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-13847, -9505)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(10599, -4168)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		GoNearestNPCToCoords(3456, 6603)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsE)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc