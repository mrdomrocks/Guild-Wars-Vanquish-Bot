#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutGardenOfSeborhin()
	MoveTo(-1896, 14429)
	MoveTo(-2029, 14479)
	Move(-2100, 14479)
	WaitForLoad()
EndFunc

Func VQGardenOfSeborhin()
    If GetMapID() <> $GardenOfSeborhin_Map And GetMapID() <> $GardenOfSeborhin_Outpost  Then TravelTo($GardenOfSeborhin_Outpost)   
    If GetMapID() = $GardenOfSeborhin_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ForumHighlands_Map Then 

		Local $aWaypointsA[28][4] = [ [1130, -13809, " ", $vqrange] _
		, [-535, -10938, " ", $vqrange] _
		, [826, -10329, " ", $vqrange] _
		, [2178, -8931, " ", $vqrange] _
		, [4412, -10098, " ", $vqrange] _
		, [5364, -11695, " ", $vqrange] _
		, [2867, -11621, " ", $vqrange] _
		, [7753, -10981, " ", $vqrange] _
		, [8110, -11020, " ", $vqrange] _
		, [10131, -12316, " ", $vqrange] _
		, [11006, -11537, " ", $vqrange] _
		, [10796, -9049, " ", $vqrange] _
		, [13569, -6381, " ", $vqrange] _
		, [17519, -6098, " ", $vqrange] _
		, [18860, -7694, " ", $vqrange] _
		, [17861, -9585, " ", $vqrange] _
		, [14162, -10113, " ", $vqrange] _
		, [12063, -9542, " ", $vqrange] _
		, [12680, -6621, " ", $vqrange] _
		, [17173, -6323, " ", $vqrange] _
		, [20068, -7068, " ", $vqrange] _
		, [21497, -7704, " ", $vqrange] _
		, [21175, -5092, " ", $vqrange] _
		, [20981, -1982, " ", $vqrange] _
		, [17568, -1841, " ", $vqrange] _
		, [14878, -1820, " ", $vqrange] _
		, [11847, -909, " ", $vqrange] _
		, [9404, -1424, " ", $vqrange] ]

		Local $aWaypointsB[7][4] = [ [ 7828, 858, " ", $vqrange] _
		, [3117, 1011, " ", $vqrange] _
		, [-2252, 987, " ", $vqrange] _
		, [-2620, 2125, " ", $vqrange] _
		, [2047, 2054, " ", $vqrange] _
		, [6273, 2179, " ", $vqrange] _
		, [7826, 2244, " ", $vqrange] ]

		Local $aWaypointsC[57][4] = [ [ 10904, 4469, " ", $vqrange] _
		, [11142, 1598, " ", $vqrange] _
		, [13513, 4871, " ", $vqrange] _
		, [17588, 4939, " ", $vqrange] _
		, [20539, 4954, " ", $vqrange] _
		, [22693, 5599, " ", $vqrange] _
		, [20990, 5573, " ", $vqrange] _
		, [20973, 8541, " ", $vqrange] _
		, [21102, 10472, " ", $vqrange] _
		, [18862, 11690, " ", $vqrange] _
		, [18821, 13777, " ", $vqrange] _
		, [16239, 11317, " ", $vqrange] _
		, [13301, 13604, " ", $vqrange] _
		, [10721, 11314, " ", $vqrange] _
		, [7369, 12695, " ", $vqrange] _
		, [5231, 13519, " ", $vqrange] _
		, [5086, 10781, " ", $vqrange] _
		, [4259, 15595, " ", $vqrange] _
		, [3152, 13363, " ", $vqrange] _
		, [465, 13185, " ", $vqrange] _
		, [-1904, 14306, " ", $vqrange] _
		, [-3178, 14736, " ", $vqrange] _
		, [-3741, 15712, " ", $vqrange] _
		, [-6065, 15627, " ", $vqrange] _
		, [-7731, 14767, " ", $vqrange] _
		, [-11709, 13260, " ", $vqrange] _
		, [-14313, 14494, " ", $vqrange] _
		, [-17641, 12471, " ", $vqrange] _
		, [-18841, 12933, " ", $vqrange] _
		, [-19484, 10912, " ", $vqrange] _
		, [-18250, 8528, " ", $vqrange] _
		, [-19309, 7240, " ", $vqrange] _
		, [-20076, 8868, " ", $vqrange] _
		, [-21691, 9589, " ", $vqrange] _
		, [-23107, 4397, " ", $vqrange] _
		, [-20708, 2421, " ", $vqrange] _
		, [-22086, 1370, " ", $vqrange] _
		, [-19962, 103, " ", $vqrange] _
		, [-20925, -1800, " ", $vqrange] _
		, [-21626, -2936, " ", $vqrange] _
		, [-18851, -3715, " ", $vqrange] _
		, [-16235, -6104, " ", $vqrange] _
		, [-19391, -7348, " ", $vqrange] _
		, [-20734, -8398, " ", $vqrange] _
		, [-20201, -9695, " ", $vqrange] _
		, [-17290, -16039, " ", $vqrange] _
		, [-15429, -15186, " ", $vqrange] _
		, [-14809, -14941, " ", $vqrange] _
		, [-13495, -14294, " ", $vqrange] _
		, [-12568, -13602, " ", $vqrange] _
		, [-12043, -12534, " ", $vqrange] _
		, [-12003, -10337, " ", $vqrange] _
		, [-9590, -12780, " ", $vqrange] _
		, [-9374, -12856, " ", $vqrange] _
		, [-7414, -13980, " ", $vqrange] _
		, [-3208, -13306, " ", $vqrange] _
		, [45, -12888, " ", $vqrange] ]
		
		Local $aWaypoints[92][4] = [ [1130, -13809, " ", $vqrange] _
		, [-535, -10938, " ", $vqrange] _
		, [826, -10329, " ", $vqrange] _
		, [2178, -8931, " ", $vqrange] _
		, [4412, -10098, " ", $vqrange] _
		, [5364, -11695, " ", $vqrange] _
		, [2867, -11621, " ", $vqrange] _
		, [7753, -10981, " ", $vqrange] _
		, [8110, -11020, " ", $vqrange] _
		, [10131, -12316, " ", $vqrange] _
		, [11006, -11537, " ", $vqrange] _
		, [10796, -9049, " ", $vqrange] _
		, [13569, -6381, " ", $vqrange] _
		, [17519, -6098, " ", $vqrange] _
		, [18860, -7694, " ", $vqrange] _
		, [17861, -9585, " ", $vqrange] _
		, [14162, -10113, " ", $vqrange] _
		, [12063, -9542, " ", $vqrange] _
		, [12680, -6621, " ", $vqrange] _
		, [17173, -6323, " ", $vqrange] _
		, [20068, -7068, " ", $vqrange] _
		, [21497, -7704, " ", $vqrange] _
		, [21175, -5092, " ", $vqrange] _
		, [20981, -1982, " ", $vqrange] _
		, [17568, -1841, " ", $vqrange] _
		, [14878, -1820, " ", $vqrange] _
		, [11847, -909, " ", $vqrange] _
		, [9404, -1424, " ", $vqrange] _
		, [7828, 858, " ", $vqrange] _
		, [3117, 1011, " ", $vqrange] _
		, [-2252, 987, " ", $vqrange] _
		, [-2620, 2125, " ", $vqrange] _
		, [2047, 2054, " ", $vqrange] _
		, [6273, 2179, " ", $vqrange] _
		, [7826, 2244, " ", $vqrange] _
		, [10904, 4469, " ", $vqrange] _
		, [11142, 1598, " ", $vqrange] _
		, [13513, 4871, " ", $vqrange] _
		, [17588, 4939, " ", $vqrange] _
		, [20539, 4954, " ", $vqrange] _
		, [22693, 5599, " ", $vqrange] _
		, [20990, 5573, " ", $vqrange] _
		, [20973, 8541, " ", $vqrange] _
		, [21102, 10472, " ", $vqrange] _
		, [18862, 11690, " ", $vqrange] _
		, [18821, 13777, " ", $vqrange] _
		, [16239, 11317, " ", $vqrange] _
		, [13301, 13604, " ", $vqrange] _
		, [10721, 11314, " ", $vqrange] _
		, [7369, 12695, " ", $vqrange] _
		, [5231, 13519, " ", $vqrange] _
		, [5086, 10781, " ", $vqrange] _
		, [4259, 15595, " ", $vqrange] _
		, [3152, 13363, " ", $vqrange] _
		, [465, 13185, " ", $vqrange] _
		, [-1904, 14306, " ", $vqrange] _
		, [-3178, 14736, " ", $vqrange] _
		, [-3741, 15712, " ", $vqrange] _
		, [-6065, 15627, " ", $vqrange] _
		, [-7731, 14767, " ", $vqrange] _
		, [-11709, 13260, " ", $vqrange] _
		, [-14313, 14494, " ", $vqrange] _
		, [-17641, 12471, " ", $vqrange] _
		, [-18841, 12933, " ", $vqrange] _
		, [-19484, 10912, " ", $vqrange] _
		, [-18250, 8528, " ", $vqrange] _
		, [-19309, 7240, " ", $vqrange] _
		, [-20076, 8868, " ", $vqrange] _
		, [-21691, 9589, " ", $vqrange] _
		, [-23107, 4397, " ", $vqrange] _
		, [-20708, 2421, " ", $vqrange] _
		, [-22086, 1370, " ", $vqrange] _
		, [-19962, 103, " ", $vqrange] _
		, [-20925, -1800, " ", $vqrange] _
		, [-21626, -2936, " ", $vqrange] _
		, [-18851, -3715, " ", $vqrange] _
		, [-16235, -6104, " ", $vqrange] _
		, [-19391, -7348, " ", $vqrange] _
		, [-20734, -8398, " ", $vqrange] _
		, [-20201, -9695, " ", $vqrange] _
		, [-17290, -16039, " ", $vqrange] _
		, [-15429, -15186, " ", $vqrange] _
		, [-14809, -14941, " ", $vqrange] _
		, [-13495, -14294, " ", $vqrange] _
		, [-12568, -13602, " ", $vqrange] _
		, [-12043, -12534, " ", $vqrange] _
		, [-12003, -10337, " ", $vqrange] _
		, [-9590, -12780, " ", $vqrange] _
		, [-9374, -12856, " ", $vqrange] _
		, [-7414, -13980, " ", $vqrange] _
		, [-3208, -13306, " ", $vqrange] _
		, [45, -12888, " ", $vqrange] ]
	
		GoNearestNPCToCoords(-4495, 15817)
		Sleep(1000)
		Dialog(0x00000081)
		Dialog(0x00000084)
		Sleep(5000)		
		WaitForLoad()		
		
		GoNearestNPCToCoords(3960, -14652)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(8315, -949)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(8291, 4364)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc