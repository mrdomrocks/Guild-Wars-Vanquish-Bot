;Mapped from route notes
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheRupturedHeartOutpostPath[3][2] = [ _
	[-99, -3548], _
	[1681, -1854], _
	[2284, -1554] _
]

Func GoOutTheRupturedHeart()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $TheRupturedHeart_Map Then Return
	If $l_i_Map = $TheRupturedHeart_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> The Ruptured Heart (portal)")
		_Vanquisher_RunAggroPortalPath($aTheRupturedHeartOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQTheRupturedHeart()
	If GetMapID() <> $TheRupturedHeart_Map And GetMapID() <> $TheRupturedHeart_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for The Ruptured Heart.")
		TravelTo($TheRupturedHeart_Outpost)
	EndIf

	If GetMapID() = $TheRupturedHeart_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheRupturedHeart()
		If GetMapID() <> $TheRupturedHeart_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need The Ruptured Heart (" & $TheRupturedHeart_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TheRupturedHeart_Map Then
		CurrentAction("The Ruptured Heart route waiting - on map " & GetMapID() & ", need " & $TheRupturedHeart_Map & ".")
		Return
	EndIf

	CurrentAction("Starting The Ruptured Heart vanquish route.")
	Local $aWaypoints[309][4] = [ _
		[2266, -719, "shrine", $vqrange], _
		[1472, -500, " ", $vqrange], _
		[288, 319, " ", $vqrange], _
		[545, 1468, " ", $vqrange], _
		[705, 1764, " ", $vqrange], _
		[1065, 2548, " ", $vqrange], _
		[2049, 3458, " ", $vqrange], _
		[3392, 2104, " ", $vqrange], _
		[4612, 784, " ", $vqrange], _
		[5458, 165, " ", $vqrange], _
		[6259, -1294, " ", $vqrange], _
		[6670, -2295, " ", $vqrange], _
		[7329, -2784, " ", $vqrange], _
		[8811, -3479, " ", $vqrange], _
		[8849, -3771, " ", $vqrange], _
		[8449, -4127, " ", $vqrange], _
		[7342, -4642, " ", $vqrange], _
		[4999, -5066, " ", $vqrange], _
		[5278, -5710, " ", $vqrange], _
		[6886, -6527, " ", $vqrange], _
		[8237, -9054, " ", $vqrange], _
		[9394, -8962, " ", $vqrange], _
		[11137, -8348, " ", $vqrange], _
		[12122, -7339, " ", $vqrange], _
		[13356, -7303, " ", $vqrange], _
		[14065, -6534, " ", $vqrange], _
		[13317, -5642, " ", $vqrange], _
		[13909, -4783, " ", $vqrange], _
		[14919, -4843, " ", $vqrange], _
		[16369, -5244, " ", $vqrange], _
		[17067, -6126, " ", $vqrange], _
		[17666, -6906, " ", $vqrange], _
		[18242, -5871, " ", $vqrange], _
		[18337, -4932, " ", $vqrange], _
		[18907, -4343, " ", $vqrange], _
		[19505, -3630, " ", $vqrange], _
		[19595, -2494, " ", $vqrange], _
		[19776, -272, " ", $vqrange], _
		[19477, 710, " ", $vqrange], _
		[19235, 1631, " ", $vqrange], _
		[19150, 3116, " ", $vqrange], _
		[19336, 4162, " ", $vqrange], _
		[19241, 4793, " ", $vqrange], _
		[19261, 5960, " ", $vqrange], _
		[19346, 7101, " ", $vqrange], _
		[18314, 6961, " ", $vqrange], _
		[17630, 6128, " ", $vqrange], _
		[16739, 4789, " ", $vqrange], _
		[16631, 3710, " ", $vqrange], _
		[16653, 2714, " ", $vqrange], _
		[16413, 669, " ", $vqrange], _
		[16173, -290, " ", $vqrange], _
		[15538, -1789, " ", $vqrange], _
		[13634, -2503, " ", $vqrange], _
		[12165, -2508, " ", $vqrange], _
		[12011, -1604, " ", $vqrange], _
		[12104, -500, " ", $vqrange], _
		[12473, 908, " ", $vqrange], _
		[12681, 1733, " ", $vqrange], _
		[12511, 2468, " ", $vqrange], _
		[12443, 4449, " ", $vqrange], _
		[13411, 5094, " ", $vqrange], _
		[14891, 6355, " ", $vqrange], _
		[15805, 7329, " ", $vqrange], _
		[16877, 8349, " ", $vqrange], _
		[18785, 9068, " ", $vqrange], _
		[19024, 9958, " ", $vqrange], _
		[19265, 11465, " ", $vqrange], _
		[18859, 12200, " ", $vqrange], _
		[18179, 13298, " ", $vqrange], _
		[18831, 13988, " ", $vqrange], _
		[19968, 14500, " ", $vqrange], _
		[20220, 15337, " ", $vqrange], _
		[19839, 18240, " ", $vqrange], _
		[20067, 15115, " ", $vqrange], _
		[18441, 13835, " ", $vqrange], _
		[16794, 14120, " ", $vqrange], _
		[15848, 14272, " ", $vqrange], _
		[15743, 12691, " ", $vqrange], _
		[15267, 13506, " ", $vqrange], _
		[14946, 14659, " ", $vqrange], _
		[14168, 15404, " ", $vqrange], _
		[13708, 15749, " ", $vqrange], _
		[13731, 14249, " ", $vqrange], _
		[13740, 12826, " ", $vqrange], _
		[14658, 10749, " ", $vqrange], _
		[13718, 10442, " ", $vqrange], _
		[12086, 10539, " ", $vqrange], _
		[9962, 12135, " ", $vqrange], _
		[8522, 13243, " ", $vqrange], _
		[6745, 13320, " ", $vqrange], _
		[8197, 12931, " ", $vqrange], _
		[5063, 13246, " ", $vqrange], _
		[3398, 12787, " ", $vqrange], _
		[2291, 13071, " ", $vqrange], _
		[1258, 13480, " ", $vqrange], _
		[422, 14051, " ", $vqrange], _
		[11, 15366, " ", $vqrange], _
		[41, 16305, " ", $vqrange], _
		[135, 16829, " ", $vqrange], _
		[376, 17771, " ", $vqrange], _
		[463, 19124, " ", $vqrange], _
		[-372, 18451, " ", $vqrange], _
		[-846, 17645, " ", $vqrange], _
		[-1064, 16269, " ", $vqrange], _
		[-850, 15269, " ", $vqrange], _
		[-1181, 14087, " ", $vqrange], _
		[-3910, 12721, " ", $vqrange], _
		[-4231, 13334, " ", $vqrange], _
		[-4126, 15397, " ", $vqrange], _
		[-3689, 16798, " ", $vqrange], _
		[-2679, 19260, " ", $vqrange], _
		[-3345, 19018, " ", $vqrange], _
		[-4360, 18578, " ", $vqrange], _
		[-5338, 18370, " ", $vqrange], _
		[-6504, 17906, " ", $vqrange], _
		[-7063, 16964, " ", $vqrange], _
		[-7488, 15937, " ", $vqrange], _
		[-8053, 15113, " ", $vqrange], _
		[-8813, 14742, " ", $vqrange], _
		[-9497, 14290, " ", $vqrange], _
		[-9995, 13688, " ", $vqrange], _
		[-10630, 12937, " ", $vqrange], _
		[-10845, 11962, " ", $vqrange], _
		[-10973, 11006, " ", $vqrange], _
		[-10909, 9984, " ", $vqrange], _
		[-10292, 10139, " ", $vqrange], _
		[-8908, 10169, " ", $vqrange], _
		[-7680, 10098, " ", $vqrange], _
		[-6818, 10505, " ", $vqrange], _
		[-5721, 10932, " ", $vqrange], _
		[-6226, 11692, " ", $vqrange], _
		[-8180, 13892, " ", $vqrange], _
		[-7471, 12571, " ", $vqrange], _
		[-7910, 11638, " ", $vqrange], _
		[-7060, 9327, " ", $vqrange], _
		[-6551, 8470, " ", $vqrange], _
		[-6318, 7125, " ", $vqrange], _
		[-6248, 5699, " ", $vqrange], _
		[-6391, 4942, " ", $vqrange], _
		[-6486, 6938, " ", $vqrange], _
		[-6549, 8392, " ", $vqrange], _
		[-5489, 11899, " ", $vqrange], _
		[-5064, 11493, " ", $vqrange], _
		[-4232, 10030, " ", $vqrange], _
		[-3870, 9257, " ", $vqrange], _
		[-3149, 7515, " ", $vqrange], _
		[-2591, 6673, " ", $vqrange], _
		[-1838, 6300, " ", $vqrange], _
		[189, 6421, " ", $vqrange], _
		[-501, 5564, " ", $vqrange], _
		[-1422, 4713, " ", $vqrange], _
		[-2282, 4444, " ", $vqrange], _
		[-1803, 2793, " ", $vqrange], _
		[-2710, 2990, " ", $vqrange], _
		[-4162, 2786, " ", $vqrange], _
		[-5381, 2392, " ", $vqrange], _
		[-6907, 1891, " ", $vqrange], _
		[-7785, 1833, " ", $vqrange], _
		[-8837, 496, " ", $vqrange], _
		[-7770, -580, " ", $vqrange], _
		[-5731, -2468, " ", $vqrange], _
		[-6002, -2895, " ", $vqrange], _
		[-7009, -3522, " ", $vqrange], _
		[-7824, -4305, " ", $vqrange], _
		[-7538, -5438, " ", $vqrange], _
		[-6208, -7843, " ", $vqrange], _
		[-6590, -6464, " ", $vqrange], _
		[-7484, -5353, " ", $vqrange], _
		[-9464, -1865, " ", $vqrange], _
		[-9792, -2359, " ", $vqrange], _
		[-11173, -3652, " ", $vqrange], _
		[-12144, -2102, " ", $vqrange], _
		[-12588, -884, " ", $vqrange], _
		[-13419, -313, " ", $vqrange], _
		[-13938, 682, " ", $vqrange], _
		[-14372, 1618, " ", $vqrange], _
		[-12909, 3478, " ", $vqrange], _
		[-12569, 4134, " ", $vqrange], _
		[-12701, 4946, " ", $vqrange], _
		[-13219, 5625, " ", $vqrange], _
		[-14601, 6510, " ", $vqrange], _
		[-14061, 7667, " ", $vqrange], _
		[-13442, 9784, " ", $vqrange], _
		[-13902, 9931, " ", $vqrange], _
		[-14889, 10635, " ", $vqrange], _
		[-14913, 11193, " ", $vqrange], _
		[-15542, 11153, " ", $vqrange], _
		[-16536, 10977, " ", $vqrange], _
		[-17847, 10775, " ", $vqrange], _
		[-18974, 10219, " ", $vqrange], _
		[-18366, 10169, " ", $vqrange], _
		[-16573, 10505, " ", $vqrange], _
		[-16907, 8937, " ", $vqrange], _
		[-17280, 7487, " ", $vqrange], _
		[-18826, 7041, " ", $vqrange], _
		[-18602, 6165, " ", $vqrange], _
		[-17861, 5043, " ", $vqrange], _
		[-17004, 4521, " ", $vqrange], _
		[-15807, 5290, " ", $vqrange], _
		[-16389, 3342, " ", $vqrange], _
		[-17390, 1831, " ", $vqrange], _
		[-18284, 1227, " ", $vqrange], _
		[-17356, 1709, " ", $vqrange], _
		[-15911, 103, " ", $vqrange], _
		[-16439, -375, " ", $vqrange], _
		[-17177, -448, " ", $vqrange], _
		[-19940, -568, " ", $vqrange], _
		[-20272, -2683, " ", $vqrange], _
		[-19937, -3535, " ", $vqrange], _
		[-19902, -4237, " ", $vqrange], _
		[-19867, -5333, " ", $vqrange], _
		[-20310, -6528, " ", $vqrange], _
		[-19128, -6234, " ", $vqrange], _
		[-16750, -5429, " ", $vqrange], _
		[-16314, -2601, " ", $vqrange], _
		[-18546, -5316, " ", $vqrange], _
		[-18800, -7142, " ", $vqrange], _
		[-18907, -8808, " ", $vqrange], _
		[-18910, -9825, " ", $vqrange], _
		[-19068, -11010, " ", $vqrange], _
		[-19026, -11724, " ", $vqrange], _
		[-18689, -12582, " ", $vqrange], _
		[-17722, -13319, " ", $vqrange], _
		[-17447, -13876, " ", $vqrange], _
		[-17551, -14959, " ", $vqrange], _
		[-17453, -16254, " ", $vqrange], _
		[-17667, -17016, " ", $vqrange], _
		[-17517, -18760, " ", $vqrange], _
		[-16897, -18265, " ", $vqrange], _
		[-16311, -17557, " ", $vqrange], _
		[-16193, -16168, " ", $vqrange], _
		[-16996, -15363, " ", $vqrange], _
		[-17248, -14427, " ", $vqrange], _
		[-16470, -13634, " ", $vqrange], _
		[-15976, -12276, " ", $vqrange], _
		[-15436, -10963, " ", $vqrange], _
		[-16037, -9637, " ", $vqrange], _
		[-16552, -8588, " ", $vqrange], _
		[-16303, -7259, " ", $vqrange], _
		[-15157, -8134, " ", $vqrange], _
		[-13220, -10289, " ", $vqrange], _
		[-13802, -8276, " ", $vqrange], _
		[-13335, -7594, " ", $vqrange], _
		[-12926, -6599, " ", $vqrange], _
		[-12893, -5372, " ", $vqrange], _
		[-13010, -4489, " ", $vqrange], _
		[-13264, -3086, " ", $vqrange], _
		[-12124, -2736, " ", $vqrange], _
		[-9312, -2545, " ", $vqrange], _
		[-8621, -1269, " ", $vqrange], _
		[-8827, 339, " ", $vqrange], _
		[-8318, 1201, " ", $vqrange], _
		[-7153, 2505, " ", $vqrange], _
		[-7087, 1572, " ", $vqrange], _
		[-5590, 1707, " ", $vqrange], _
		[-4392, 2001, " ", $vqrange], _
		[-2549, 2544, " ", $vqrange], _
		[-1207, 1468, " ", $vqrange], _
		[364, 281, " ", $vqrange], _
		[1962, -742, " ", $vqrange], _
		[3242, 249, " ", $vqrange], _
		[5105, 503, " ", $vqrange], _
		[6651, -2350, " ", $vqrange], _
		[4470, -3554, " ", $vqrange], _
		[5133, -3793, " ", $vqrange], _
		[7228, -2882, " ", $vqrange], _
		[9236, -3665, " ", $vqrange], _
		[7379, -4677, " ", $vqrange], _
		[5834, -5855, " ", $vqrange], _
		[6921, -6608, " ", $vqrange], _
		[7825, -7763, " ", $vqrange], _
		[8575, -8581, " ", $vqrange], _
		[9871, -8908, " ", $vqrange], _
		[11090, -8411, " ", $vqrange], _
		[12100, -7300, " ", $vqrange], _
		[12883, -6287, " ", $vqrange], _
		[13648, -2425, " ", $vqrange], _
		[14329, 789, "UseWormSpoor", $vqrange], _
		[17345, 3860, " ", $vqrange], _
		[15994, 5258, " ", $vqrange], _
		[14636, 6625, " ", $vqrange], _
		[13261, 7215, " ", $vqrange], _
		[11874, 7460, " ", $vqrange], _
		[10578, 7200, " ", $vqrange], _
		[9067, 6329, " ", $vqrange], _
		[8051, 6505, " ", $vqrange], _
		[6958, 7211, " ", $vqrange], _
		[6187, 7803, " ", $vqrange], _
		[4970, 8673, " ", $vqrange], _
		[5112, 10277, " ", $vqrange], _
		[5860, 11583, " ", $vqrange], _
		[6778, 12716, " ", $vqrange], _
		[7834, 13666, " ", $vqrange], _
		[8131, 15057, " ", $vqrange], _
		[8025, 16538, " ", $vqrange], _
		[7463, 17380, " ", $vqrange], _
		[6177, 17968, " ", $vqrange], _
		[5015, 17720, " ", $vqrange], _
		[4314, 16784, " ", $vqrange], _
		[3157, 16282, " ", $vqrange], _
		[3409, 17641, " ", $vqrange], _
		[3794, 20654, " ", $vqrange], _
		[5190, 18883, " ", $vqrange], _
		[4007, 18467, " ", $vqrange], _
		[3194, 17056, " ", $vqrange], _
		[3605, 16075, " ", $vqrange], _
		[4607, 15650, " ", $vqrange], _
		[6671, 15219, " ", $vqrange]]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
