#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutJahaiBluffs()
	MoveTo(-2596, 2279)
	MoveTo(-4807, 4228)
	Move(-4950, 4400)
	WaitForLoad()
EndFunc

Func VQJahaiBluffs()
    If GetMapID() <> $JahaiBluffs_Map And GetMapID() <> $JahaiBluffs_Outpost  Then TravelTo($JahaiBluffs_Outpost)   
    If GetMapID() = $JahaiBluffs_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $JahaiBluffs_Map Then    
		
		Local $aWaypointsA[10][4] = [ [14885, -13335, " ", $vqrange] _
		, [15066, -15097, " ", $vqrange] _
		, [13515, -9860, " ", $vqrange] _
		, [15526, -8430, " ", $vqrange] _
		, [17166, -6808, " ", $vqrange] _
		, [21188, -6640, " ", $vqrange] _
		, [15701, -6635, " ", $vqrange] _
		, [13276, -4883, " ", $vqrange] _
		, [14273, -2428, " ", $vqrange] _
		, [16293, 393, " ", $vqrange] ]

		Local $aWaypointsB[22][4] = [ [17585, 4955, " ", $vqrange] _
		, [14320, 3437, " ", $vqrange] _
		, [14077, 1405, " ", $vqrange] _
		, [9171, 1190, " ", $vqrange] _
		, [5193, 2705, " ", $vqrange] _
		, [2711, 4356, " ", $vqrange] _
		, [3441, 8138, " ", $vqrange] _
		, [3176, 12279, " ", $vqrange] _
		, [4271, 8687, " ", $vqrange] _
		, [5178, 6549, " ", $vqrange] _
		, [7424, 5226, " ", $vqrange] _
		, [6901, 8484, " ", $vqrange] _
		, [8912, 9460, " ", $vqrange] _
		, [11720, 7385, " ", $vqrange] _
		, [13265, 7120, " ", $vqrange] _
		, [13107, 9352, " ", $vqrange] _
		, [12785, 11580, " ", $vqrange] _
		, [12159, 8670, " ", $vqrange] _
		, [11135, 10770, " ", $vqrange] _
		, [12532, 10774, " ", $vqrange] _
		, [10384, 12487, " ", $vqrange] _
		, [9084, 11900, " ", $vqrange] ]

		Local $aWaypointsC[43][4] = [ [10431, 14649, " ", $vqrange] _
		, [10462, 15781, " ", $vqrange] _
		, [13498, 14659, " ", $vqrange] _
		, [13998, 13750, " ", $vqrange] _
		, [14730, 13127, " ", $vqrange] _
		, [13230, 14703, " ", $vqrange] _
		, [10113, 12827, " ", $vqrange] _
		, [12775, 10764, " ", $vqrange] _
		, [12770, 6438, " ", $vqrange] _
		, [10836, 3491, " ", $vqrange] _
		, [8771, -645, " ", $vqrange] _
		, [9449, -5380, " ", $vqrange] _
		, [9846, -7116, " ", $vqrange] _
		, [7175, -6843, " ", $vqrange] _
		, [3936, -10653, " ", $vqrange] _
		, [4980, -13493, " ", $vqrange] _
		, [4949, -15524, " ", $vqrange] _
		, [2267, -10005, " ", $vqrange] _
		, [-708, -6592, " ", $vqrange] _
		, [-4091, -8536, " ", $vqrange] _
		, [-6880, -9898, " ", $vqrange] _
		, [-4579, -10957, " ", $vqrange] _
		, [-1076, -12490, " ", $vqrange] _
		, [-2123, -14352, " ", $vqrange] _
		, [-2238, -16441, " ", $vqrange] _
		, [-3591, -13922, " ", $vqrange] _
		, [-5149, -10326, " ", $vqrange] _
		, [-4903, -6262, " ", $vqrange] _
		, [-6176, -5267, " ", $vqrange] _
		, [-6676, -4299, " ", $vqrange] _
		, [-8252, -4960, " ", $vqrange] _
		, [-9211, -7730, " ", $vqrange] _
		, [-9909, -5093, " ", $vqrange] _
		, [-10025, -3840, " ", $vqrange] _
		, [-9015, -1828, " ", $vqrange] _
		, [-7718, -750, " ", $vqrange] _
		, [-7826, 699, " ", $vqrange] _
		, [-5120, -432, " ", $vqrange] _
		, [-6511, -1853, " ", $vqrange] _
		, [-5504, -3160, " ", $vqrange] _
		, [-4953, -1719, " ", $vqrange] _
		, [-7497, 782, " ", $vqrange] _
		, [-12811, -2258, " ", $vqrange] ]

		Local $aWaypointsD[39][4] = [ [-13368, -4555, " ", $vqrange] _
		, [-16094, -5416, " ", $vqrange] _
		, [-17786, -7633, " ", $vqrange] _
		, [-18198, -10054, " ", $vqrange] _
		, [-19599, -9496, " ", $vqrange] _
		, [-19942, -7021, " ", $vqrange] _
		, [-20903, -4246, " ", $vqrange] _
		, [-21830, -3328, " ", $vqrange] _
		, [-21119, 372, " ", $vqrange] _
		, [-16775, -1717, " ", $vqrange] _
		, [-19287, 1883, " ", $vqrange] _
		, [-22091, 3395, " ", $vqrange] _
		, [-19562, 3992, " ", $vqrange] _
		, [-20077, 7220, " ", $vqrange] _
		, [-21781, 9059, " ", $vqrange] _
		, [-17557, 8000, " ", $vqrange] _
		, [-15943, 5927, " ", $vqrange] _
		, [-14381, 6409, " ", $vqrange] _
		, [-13444, 6479, " ", $vqrange] _
		, [-13657, 9318, " ", $vqrange] _
		, [-14409, 10654, " ", $vqrange] _
		, [-19066, 11840, " ", $vqrange] _
		, [-22584, 13161, " ", $vqrange] _
		, [-22396, 16068, " ", $vqrange] _
		, [-20392, 15779, " ", $vqrange] _
		, [-19267, 12226, " ", $vqrange] _
		, [-15244, 12049, " ", $vqrange] _
		, [-12341, 15769, " ", $vqrange] _
		, [-12007, 12065, " ", $vqrange] _
		, [-9436, 11763, " ", $vqrange] _
		, [-6087, 9943, " ", $vqrange] _
		, [-4507, 15478, " ", $vqrange] _
		, [-3666, 15099, " ", $vqrange] _
		, [-252, 6564, " ", $vqrange] _
		, [-3019, 4531, " ", $vqrange] _
		, [-1788, -446, " ", $vqrange] _
		, [2414, 299, " ", $vqrange] _
		, [2348, -4477, " ", $vqrange] _
		, [-2005, -3687, " ", $vqrange] ]

		
		Local $aWaypoints[114][4] = [ [14885, -13335, " ", $vqrange] _
		, [15066, -15097, " ", $vqrange] _
		, [13515, -9860, " ", $vqrange] _
		, [15526, -8430, " ", $vqrange] _
		, [17166, -6808, " ", $vqrange] _
		, [21188, -6640, " ", $vqrange] _
		, [15701, -6635, " ", $vqrange] _
		, [13276, -4883, " ", $vqrange] _
		, [14273, -2428, " ", $vqrange] _
		, [16293, 393, " ", $vqrange] _ 
		, [17585, 4955, " ", $vqrange] _
		, [14320, 3437, " ", $vqrange] _
		, [14077, 1405, " ", $vqrange] _
		, [9171, 1190, " ", $vqrange] _
		, [5193, 2705, " ", $vqrange] _
		, [2711, 4356, " ", $vqrange] _
		, [3441, 8138, " ", $vqrange] _
		, [3176, 12279, " ", $vqrange] _
		, [4271, 8687, " ", $vqrange] _
		, [5178, 6549, " ", $vqrange] _
		, [7424, 5226, " ", $vqrange] _
		, [6901, 8484, " ", $vqrange] _
		, [8912, 9460, " ", $vqrange] _
		, [11720, 7385, " ", $vqrange] _
		, [13265, 7120, " ", $vqrange] _
		, [13107, 9352, " ", $vqrange] _
		, [12785, 11580, " ", $vqrange] _
		, [12159, 8670, " ", $vqrange] _
		, [11135, 10770, " ", $vqrange] _
		, [12532, 10774, " ", $vqrange] _
		, [10384, 12487, " ", $vqrange] _
		, [9084, 11900, " ", $vqrange] _
		, [10431, 14649, " ", $vqrange] _
		, [10462, 15781, " ", $vqrange] _
		, [13498, 14659, " ", $vqrange] _
		, [13998, 13750, " ", $vqrange] _
		, [14730, 13127, " ", $vqrange] _
		, [13230, 14703, " ", $vqrange] _
		, [10113, 12827, " ", $vqrange] _
		, [12775, 10764, " ", $vqrange] _
		, [12770, 6438, " ", $vqrange] _
		, [10836, 3491, " ", $vqrange] _
		, [8771, -645, " ", $vqrange] _
		, [9449, -5380, " ", $vqrange] _
		, [9846, -7116, " ", $vqrange] _
		, [7175, -6843, " ", $vqrange] _
		, [3936, -10653, " ", $vqrange] _
		, [4980, -13493, " ", $vqrange] _
		, [4949, -15524, " ", $vqrange] _
		, [2267, -10005, " ", $vqrange] _
		, [-708, -6592, " ", $vqrange] _
		, [-4091, -8536, " ", $vqrange] _
		, [-6880, -9898, " ", $vqrange] _
		, [-4579, -10957, " ", $vqrange] _
		, [-1076, -12490, " ", $vqrange] _
		, [-2123, -14352, " ", $vqrange] _
		, [-2238, -16441, " ", $vqrange] _
		, [-3591, -13922, " ", $vqrange] _
		, [-5149, -10326, " ", $vqrange] _
		, [-4903, -6262, " ", $vqrange] _
		, [-6176, -5267, " ", $vqrange] _
		, [-6676, -4299, " ", $vqrange] _
		, [-8252, -4960, " ", $vqrange] _
		, [-9211, -7730, " ", $vqrange] _
		, [-9909, -5093, " ", $vqrange] _
		, [-10025, -3840, " ", $vqrange] _
		, [-9015, -1828, " ", $vqrange] _
		, [-7718, -750, " ", $vqrange] _
		, [-7826, 699, " ", $vqrange] _
		, [-5120, -432, " ", $vqrange] _
		, [-6511, -1853, " ", $vqrange] _
		, [-5504, -3160, " ", $vqrange] _
		, [-4953, -1719, " ", $vqrange] _
		, [-7497, 782, " ", $vqrange] _
		, [-12811, -2258, " ", $vqrange] _
		, [-13368, -4555, " ", $vqrange] _
		, [-16094, -5416, " ", $vqrange] _
		, [-17786, -7633, " ", $vqrange] _
		, [-18198, -10054, " ", $vqrange] _
		, [-19599, -9496, " ", $vqrange] _
		, [-19942, -7021, " ", $vqrange] _
		, [-20903, -4246, " ", $vqrange] _
		, [-21830, -3328, " ", $vqrange] _
		, [-21119, 372, " ", $vqrange] _
		, [-16775, -1717, " ", $vqrange] _
		, [-19287, 1883, " ", $vqrange] _
		, [-22091, 3395, " ", $vqrange] _
		, [-19562, 3992, " ", $vqrange] _
		, [-20077, 7220, " ", $vqrange] _
		, [-21781, 9059, " ", $vqrange] _
		, [-17557, 8000, " ", $vqrange] _
		, [-15943, 5927, " ", $vqrange] _
		, [-14381, 6409, " ", $vqrange] _
		, [-13444, 6479, " ", $vqrange] _
		, [-13657, 9318, " ", $vqrange] _
		, [-14409, 10654, " ", $vqrange] _
		, [-19066, 11840, " ", $vqrange] _
		, [-22584, 13161, " ", $vqrange] _
		, [-22396, 16068, " ", $vqrange] _
		, [-20392, 15779, " ", $vqrange] _
		, [-19267, 12226, " ", $vqrange] _
		, [-15244, 12049, " ", $vqrange] _
		, [-12341, 15769, " ", $vqrange] _
		, [-12007, 12065, " ", $vqrange] _
		, [-9436, 11763, " ", $vqrange] _
		, [-6087, 9943, " ", $vqrange] _
		, [-4507, 15478, " ", $vqrange] _
		, [-3666, 15099, " ", $vqrange] _
		, [-252, 6564, " ", $vqrange] _
		, [-3019, 4531, " ", $vqrange] _
		, [-1788, -446, " ", $vqrange] _
		, [2414, 299, " ", $vqrange] _
		, [2348, -4477, " ", $vqrange] _
		, [-2005, -3687, " ", $vqrange] ]		
		
		GoNearestNPCToCoords(19865, -13361)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(17035, 2879)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(8593, 11728)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-15087, -2003)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc