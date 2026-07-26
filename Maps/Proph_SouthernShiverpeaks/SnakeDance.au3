#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSnakeDance()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $SnakeDance_Map Then Return

	If $l_i_Map = $SnakeDance_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> SnakeDance (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSnakeDanceOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQSnakeDance()
	If GetMapID() <> $SnakeDance_Map And GetMapID() <> $SnakeDance_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SnakeDance.")
		TravelTo($SnakeDance_Outpost)
	EndIf

	If GetMapID() = $SnakeDance_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutSnakeDance()
		If GetMapID() <> $SnakeDance_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SnakeDance (" & $SnakeDance_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $SnakeDance_Map Then
		CurrentAction("SnakeDance route waiting - on map " & GetMapID() & ", need " & $SnakeDance_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SnakeDance vanquish route.")

	Local $aWaypoints[213][4] = [ _
		[3510, -40363, " ", $vqrange], _
		[2748, -39571, " ", $vqrange], _
		[501, -40100, " ", $vqrange], _
		[474, -43113, " ", $vqrange], _
		[-498, -43818, " ", $vqrange], _
		[-1509, -44282, " ", $vqrange], _
		[-3812, -44047, " ", $vqrange], _
		[-5511, -43124, " ", $vqrange], _
		[-4762, -42770, " ", $vqrange], _
		[-3237, -40436, " ", $vqrange], _
		[-4228, -42312, " ", $vqrange], _
		[-4057, -42216, " ", $vqrange], _
		[-1563, -44097, " ", $vqrange], _
		[-92, -43371, " ", $vqrange], _
		[-377, -41449, " ", $vqrange], _
		[-1882, -39807, " ", $vqrange], _
		[-3349, -38949, " ", $vqrange], _
		[-4375, -37961, " ", $vqrange], _
		[-5750, -37666, " ", $vqrange], _
		[-6072, -35754, " ", $vqrange], _
		[-1640, -39702, " ", $vqrange], _
		[982, -39413, " ", $vqrange], _
		[2087, -39071, " ", $vqrange], _
		[3304, -37845, " ", $vqrange], _
		[3712, -36127, " ", $vqrange], _
		[4035, -34957, " ", $vqrange], _
		[6325, -33644, " ", $vqrange], _
		[6750, -33107, " ", $vqrange], _
		[6283, -30673, " ", $vqrange], _
		[6176, -30349, " ", $vqrange], _
		[4849, -29247, " ", $vqrange], _
		[483, -31622, " ", $vqrange], _
		[1531, -28619, " ", $vqrange], _
		[4201, -27522, " ", $vqrange], _
		[3033, -25869, " ", $vqrange], _
		[1938, -25487, " ", $vqrange], _
		[2938, -24591, " ", $vqrange], _
		[4576, -23025, " ", $vqrange], _
		[4871, -22569, " ", $vqrange], _
		[5938, -23804, " ", $vqrange], _
		[1638, -24519, " ", $vqrange], _
		[476, -24482, " ", $vqrange], _
		[-1029, -24007, " ", $vqrange], _
		[-460, -25953, " ", $vqrange], _
		[-617, -26214, " ", $vqrange], _
		[-3810, -28291, " ", $vqrange], _
		[-4925, -28233, " ", $vqrange], _
		[-4157, -29490, " ", $vqrange], _
		[-1497, -32659, " ", $vqrange], _
		[1, -33768, " ", $vqrange], _
		[1152, -33421, " ", $vqrange], _
		[672, -34272, " ", $vqrange], _
		[690, -34345, " ", $vqrange], _
		[960, -35152, " ", $vqrange], _
		[1052, -35451, " ", $vqrange], _
		[144, -35171, " ", $vqrange], _
		[-1051, -34301, " ", $vqrange], _
		[-2851, -33146, " ", $vqrange], _
		[-4932, -32833, " ", $vqrange], _
		[-3167, -30525, " ", $vqrange], _
		[-4775, -28344, " ", $vqrange], _
		[-5617, -26515, " ", $vqrange], _
		[-6157, -24435, " ", $vqrange], _
		[-6144, -23520, " ", $vqrange], _
		[-4311, -24550, " ", $vqrange], _
		[-1740, -21971, " ", $vqrange], _
		[902, -20854, " ", $vqrange], _
		[1229, -19667, " ", $vqrange], _
		[1610, -16904, " ", $vqrange], _
		[2666, -15369, " ", $vqrange], _
		[2755, -15122, " ", $vqrange], _
		[3363, -14233, " ", $vqrange], _
		[3761, -11924, " ", $vqrange], _
		[5463, -11508, " ", $vqrange], _
		[6306, -11851, " ", $vqrange], _
		[6684, -12533, " ", $vqrange], _
		[4742, -14036, " ", $vqrange], _
		[6238, -13370, " ", $vqrange], _
		[7527, -9971, " ", $vqrange], _
		[6638, -9347, " ", $vqrange], _
		[6061, -9592, " ", $vqrange], _
		[4372, -10285, " ", $vqrange], _
		[3823, -8878, " ", $vqrange], _
		[3514, -7220, " ", $vqrange], _
		[4843, -5556, " ", $vqrange], _
		[5952, -8228, " ", $vqrange], _
		[3875, -11764, " ", $vqrange], _
		[290, -12495, " ", $vqrange], _
		[-264, -12242, " ", $vqrange], _
		[-1172, -11550, " ", $vqrange], _
		[-1211, -10334, " ", $vqrange], _
		[-3017, -9860, " ", $vqrange], _
		[-1039, -9241, " ", $vqrange], _
		[-386, -7250, " ", $vqrange], _
		[174, -6236, " ", $vqrange], _
		[709, -5004, " ", $vqrange], _
		[1651, -3554, " ", $vqrange], _
		[2093, -2996, " ", $vqrange], _
		[3684, -2291, " ", $vqrange], _
		[3768, -2142, " ", $vqrange], _
		[3397, -1130, " ", $vqrange], _
		[2919, 228, " ", $vqrange], _
		[2489, 201, " ", $vqrange], _
		[2128, 78, " ", $vqrange], _
		[-957, -2093, " ", $vqrange], _
		[-1438, -3572, " ", $vqrange], _
		[-2118, -4958, " ", $vqrange], _
		[-3443, -6747, " ", $vqrange], _
		[-2977, -6583, " ", $vqrange], _
		[-4763, -7049, " ", $vqrange], _
		[-3919, -8295, " ", $vqrange], _
		[-4143, -7413, " ", $vqrange], _
		[-6040, -5388, " ", $vqrange], _
		[-6462, -4003, " ", $vqrange], _
		[-6705, -2196, " ", $vqrange], _
		[-5954, 3324, " ", $vqrange], _
		[-4697, 3495, " ", $vqrange], _
		[-4016, 3292, " ", $vqrange], _
		[-5142, 1008, " ", $vqrange], _
		[-4863, 595, " ", $vqrange], _
		[-4320, 95, " ", $vqrange], _
		[-2174, -587, " ", $vqrange], _
		[-1373, 38, " ", $vqrange], _
		[-1519, 2163, " ", $vqrange], _
		[152, 4186, " ", $vqrange], _
		[1066, 4913, " ", $vqrange], _
		[1189, 4985, " ", $vqrange], _
		[2582, 5703, " ", $vqrange], _
		[3765, 6204, " ", $vqrange], _
		[5022, 7058, " ", $vqrange], _
		[6009, 6184, " ", $vqrange], _
		[5278, 8058, " ", $vqrange], _
		[5339, 8439, " ", $vqrange], _
		[5505, 11821, " ", $vqrange], _
		[4471, 14249, " ", $vqrange], _
		[4435, 14409, " ", $vqrange], _
		[5572, 11634, " ", $vqrange], _
		[5425, 10091, " ", $vqrange], _
		[2670, 8794, " ", $vqrange], _
		[1394, 9548, " ", $vqrange], _
		[700, 10129, " ", $vqrange], _
		[2406, 11710, " ", $vqrange], _
		[2183, 12962, " ", $vqrange], _
		[1841, 13515, " ", $vqrange], _
		[2090, 16679, " ", $vqrange], _
		[-1424, 17584, " ", $vqrange], _
		[-609, 17147, " ", $vqrange], _
		[677, 15744, " ", $vqrange], _
		[1877, 13433, " ", $vqrange], _
		[2188, 12437, " ", $vqrange], _
		[2497, 10896, " ", $vqrange], _
		[-659, 9276, " ", $vqrange], _
		[-1446, 8769, " ", $vqrange], _
		[-1705, 10547, " ", $vqrange], _
		[-3657, 11085, " ", $vqrange], _
		[-5165, 10147, " ", $vqrange], _
		[-5664, 9888, " ", $vqrange], _
		[-5992, 9686, " ", $vqrange], _
		[-7151, 8921, " ", $vqrange], _
		[-7104, 10464, " ", $vqrange], _
		[-5716, 11029, " ", $vqrange], _
		[-5153, 12196, " ", $vqrange], _
		[-5239, 12888, " ", $vqrange], _
		[-4031, 12981, " ", $vqrange], _
		[-2557, 15121, " ", $vqrange], _
		[-5618, 16360, " ", $vqrange], _
		[-6318, 15618, " ", $vqrange], _
		[-5936, 16183, " ", $vqrange], _
		[-6121, 18702, " ", $vqrange], _
		[-4657, 20517, " ", $vqrange], _
		[-4657, 20517, " ", $vqrange], _
		[-4271, 21568, " ", $vqrange], _
		[-5970, 22028, " ", $vqrange], _
		[-1207, 23951, " ", $vqrange], _
		[-1908, 25578, " ", $vqrange], _
		[-2738, 26702, " ", $vqrange], _
		[613, 24008, " ", $vqrange], _
		[2429, 22821, " ", $vqrange], _
		[5856, 21861, " ", $vqrange], _
		[5169, 23875, " ", $vqrange], _
		[3296, 28986, " ", $vqrange], _
		[3070, 29574, " ", $vqrange], _
		[2671, 30157, " ", $vqrange], _
		[2378, 30237, " ", $vqrange], _
		[518, 30744, " ", $vqrange], _
		[-818, 31096, " ", $vqrange], _
		[-2968, 31600, " ", $vqrange], _
		[-3487, 30022, " ", $vqrange], _
		[-4825, 29403, " ", $vqrange], _
		[-3451, 31235, " ", $vqrange], _
		[-615, 31854, " ", $vqrange], _
		[2062, 31894, " ", $vqrange], _
		[2269, 33094, " ", $vqrange], _
		[3991, 33094, " ", $vqrange], _
		[5689, 33094, " ", $vqrange], _
		[7187, 33793, " ", $vqrange], _
		[6288, 34541, " ", $vqrange], _
		[5539, 35315, " ", $vqrange], _
		[6637, 36414, " ", $vqrange], _
		[5414, 37113, " ", $vqrange], _
		[4565, 37962, " ", $vqrange], _
		[4341, 39085, " ", $vqrange], _
		[3317, 39085, " ", $vqrange], _
		[2543, 39360, " ", $vqrange], _
		[2518, 38636, " ", $vqrange], _
		[1744, 38486, " ", $vqrange], _
		[247, 37912, " ", $vqrange], _
		[-777, 37712, " ", $vqrange], _
		[-1002, 38611, " ", $vqrange], _
		[-1601, 39360, " ", $vqrange], _
		[-1651, 40658, " ", $vqrange], _
		[-2574, 38536, " ", $vqrange], _
		[-3798, 37912, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

