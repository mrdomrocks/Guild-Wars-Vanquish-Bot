#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheBlackCurtainOutpostPath[2][2] = [ _
	[-5057.52, 17188.52], _
	[-5205, 15562] _
]

Func GoOutTheBlackCurtain()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TheBlackCurtain_Map Then Return

	If $l_i_Map = $TheBlackCurtain_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TheBlackCurtain (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTheBlackCurtainOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTheBlackCurtain()
	If GetMapID() <> $TheBlackCurtain_Map And GetMapID() <> $TheBlackCurtain_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TheBlackCurtain.")
		TravelTo($TheBlackCurtain_Outpost)
	EndIf

	If GetMapID() = $TheBlackCurtain_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheBlackCurtain()
		If GetMapID() <> $TheBlackCurtain_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheBlackCurtain (" & $TheBlackCurtain_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TheBlackCurtain_Map Then
		CurrentAction("TheBlackCurtain route waiting - on map " & GetMapID() & ", need " & $TheBlackCurtain_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheBlackCurtain vanquish route.")

	Local $aWaypoints[252][4] = [ _
		[-5217, 14376, " ", $vqrange], _
		[-5412, 13551, " ", $vqrange], _
		[-7650, 13391, " ", $vqrange], _
		[-8515, 14177, " ", $vqrange], _
		[-9857, 15071, " ", $vqrange], _
		[-11243, 15764, " ", $vqrange], _
		[-12289, 15938, " ", $vqrange], _
		[-14008, 14018, " ", $vqrange], _
		[-12926, 16010, " ", $vqrange], _
		[-13283, 17070, " ", $vqrange], _
		[-12814, 19633, " ", $vqrange], _
		[-14421, 17836, " ", $vqrange], _
		[-15521, 15972, " ", $vqrange], _
		[-17477, 15125, " ", $vqrange], _
		[-18449, 14073, " ", $vqrange], _
		[-18765, 13765, " ", $vqrange], _
		[-17357, 14280, " ", $vqrange], _
		[-18017, 10960, " ", $vqrange], _
		[-18088, 10096, " ", $vqrange], _
		[-18432, 7354, " ", $vqrange], _
		[-19137, 5264, " ", $vqrange], _
		[-19646, 3215, " ", $vqrange], _
		[-16972, 9091, " ", $vqrange], _
		[-16483, 8449, " ", $vqrange], _
		[-15116, 5097, " ", $vqrange], _
		[-14958, 4325, " ", $vqrange], _
		[-12958, 2786, " ", $vqrange], _
		[-11952, 2152, " ", $vqrange], _
		[-11241, 854, " ", $vqrange], _
		[-11947, 530, " ", $vqrange], _
		[-13834, 485, " ", $vqrange], _
		[-13930, -949, " ", $vqrange], _
		[-13611, -2802, " ", $vqrange], _
		[-14134, -3714, " ", $vqrange], _
		[-13528, -4976, " ", $vqrange], _
		[-12215, -5615, " ", $vqrange], _
		[-10264, -4776, " ", $vqrange], _
		[-9275, -3351, " ", $vqrange], _
		[-7545, -2258, " ", $vqrange], _
		[-6298, -1562, " ", $vqrange], _
		[-5262, -1327, " ", $vqrange], _
		[-2550, -1076, " ", $vqrange], _
		[-1794, -1082, " ", $vqrange], _
		[-303, -934, " ", $vqrange], _
		[2511, 903, " ", $vqrange], _
		[3049, 1261, " ", $vqrange], _
		[3786, 1885, " ", $vqrange], _
		[3383, 1916, " ", $vqrange], _
		[1151, 2544, " ", $vqrange], _
		[744, 2690, " ", $vqrange], _
		[3714, 1209, " ", $vqrange], _
		[4093, 103, " ", $vqrange], _
		[4723, -1562, " ", $vqrange], _
		[4802, -1946, " ", $vqrange], _
		[5942, -3166, " ", $vqrange], _
		[7742, -4270, " ", $vqrange], _
		[7970, -3881, " ", $vqrange], _
		[8518, -4608, " ", $vqrange], _
		[9479, -5263, " ", $vqrange], _
		[9881, -5475, " ", $vqrange], _
		[10794, -6206, " ", $vqrange], _
		[11009, -6381, " ", $vqrange], _
		[13297, -6285, " ", $vqrange], _
		[13776, -3585, " ", $vqrange], _
		[13618, -1610, " ", $vqrange], _
		[13215, 117, " ", $vqrange], _
		[12697, 1127, " ", $vqrange], _
		[11827, 501, " ", $vqrange], _
		[11373, 534, " ", $vqrange], _
		[11321, 665, " ", $vqrange], _
		[10635, 1856, " ", $vqrange], _
		[10126, 2557, " ", $vqrange], _
		[9760, 4506, " ", $vqrange], _
		[10104, 7524, " ", $vqrange], _
		[10120, 8558, " ", $vqrange], _
		[10168, 8864, " ", $vqrange], _
		[9485, 9825, " ", $vqrange], _
		[9621, 11124, " ", $vqrange], _
		[9599, 11637, " ", $vqrange], _
		[10237, 13604, " ", $vqrange], _
		[14797, 15583, " ", $vqrange], _
		[16464, 15697, " ", $vqrange], _
		[14711, 17042, " ", $vqrange], _
		[13455, 19091, " ", $vqrange], _
		[12677, 19723, " ", $vqrange], _
		[11206, 19626, " ", $vqrange], _
		[9052, 18828, " ", $vqrange], _
		[8389, 18215, " ", $vqrange], _
		[7350, 19084, " ", $vqrange], _
		[2991, 19239, " ", $vqrange], _
		[1964, 18113, " ", $vqrange], _
		[-179, 16441, " ", $vqrange], _
		[273, 15582, " ", $vqrange], _
		[1297, 12562, " ", $vqrange], _
		[2665, 9916, " ", $vqrange], _
		[1296, 10063, " ", $vqrange], _
		[-591, 10407, " ", $vqrange], _
		[-2513, 10302, " ", $vqrange], _
		[-4389, 9772, " ", $vqrange], _
		[-6649, 9288, " ", $vqrange], _
		[-8745, 10159, " ", $vqrange], _
		[-11191, 10715, " ", $vqrange], _
		[-12742, 10691, " ", $vqrange], _
		[-14673, 10886, " ", $vqrange], _
		[-16227, 10535, " ", $vqrange], _
		[-16306, 8666, " ", $vqrange], _
		[-13154, 5616, " ", $vqrange], _
		[-11780, 5522, " ", $vqrange], _
		[-11110, 4717, " ", $vqrange], _
		[-12611, 1209, " ", $vqrange], _
		[-13158, 1100, " ", $vqrange], _
		[-14503, 423, " ", $vqrange], _
		[-15995, -1, " ", $vqrange], _
		[-17221, -831, " ", $vqrange], _
		[-18106, -2823, " ", $vqrange], _
		[-18183, -4264, " ", $vqrange], _
		[-16402, -5048, " ", $vqrange], _
		[-15786, -6036, " ", $vqrange], _
		[-15107, -7308, " ", $vqrange], _
		[-14780, -8378, " ", $vqrange], _
		[-14616, -8805, " ", $vqrange], _
		[-14347, -9773, " ", $vqrange], _
		[-13017, -10286, " ", $vqrange], _
		[-11402, -10436, " ", $vqrange], _
		[-10927, -10208, " ", $vqrange], _
		[-9977, -9481, " ", $vqrange], _
		[-9267, -8580, " ", $vqrange], _
		[-7633, -7712, " ", $vqrange], _
		[-5865, -6989, " ", $vqrange], _
		[-3523, -5802, " ", $vqrange], _
		[-2961, -5689, " ", $vqrange], _
		[-1601, -6769, " ", $vqrange], _
		[-264, -6691, " ", $vqrange], _
		[1150, -6074, " ", $vqrange], _
		[2542, -5372, " ", $vqrange], _
		[4648, -4638, " ", $vqrange], _
		[6414, -3595, " ", $vqrange], _
		[4370, -415, " ", $vqrange], _
		[3297, 1200, " ", $vqrange], _
		[945, 3179, " ", $vqrange], _
		[-1254, 6008, " ", $vqrange], _
		[-2632, 6013, " ", $vqrange], _
		[-3625, 5392, " ", $vqrange], _
		[-4711, 5321, " ", $vqrange], _
		[-5661, 6137, " ", $vqrange], _
		[-6677, 7522, " ", $vqrange], _
		[-6894, 9521, " ", $vqrange], _
		[-5329, 10511, " ", $vqrange], _
		[-3491, 12940, " ", $vqrange], _
		[-2674, 13965, " ", $vqrange], _
		[-644, 15038, " ", $vqrange], _
		[-14, 16389, " ", $vqrange], _
		[822, 17193, " ", $vqrange], _
		[2173, 17928, " ", $vqrange], _
		[3383, 19431, " ", $vqrange], _
		[4863, 19853, " ", $vqrange], _
		[6376, 19596, " ", $vqrange], _
		[7664, 18276, " ", $vqrange], _
		[7215, 18217, " ", $vqrange], _
		[5404, 17636, " ", $vqrange], _
		[3120, 17528, " ", $vqrange], _
		[666, 16412, " ", $vqrange], _
		[247, 15396, " ", $vqrange], _
		[1239, 13739, " ", $vqrange], _
		[2097, 13017, " ", $vqrange], _
		[3062, 11824, " ", $vqrange], _
		[1017, 10599, " ", $vqrange], _
		[98, 10284, " ", $vqrange], _
		[-2231, 10260, " ", $vqrange], _
		[-3656, 9656, " ", $vqrange], _
		[-5086, 8410, " ", $vqrange], _
		[-5500, 7349, " ", $vqrange], _
		[-4614, 5490, " ", $vqrange], _
		[-503, 5045, " ", $vqrange], _
		[1524, 4040, " ", $vqrange], _
		[3455, 3819, " ", $vqrange], _
		[5393, 3669, " ", $vqrange], _
		[8141, 4004, " ", $vqrange], _
		[9419, 6581, " ", $vqrange], _
		[10278, 6895, " ", $vqrange], _
		[11502, 9662, " ", $vqrange], _
		[13746, 8928, " ", $vqrange], _
		[14896, 8964, " ", $vqrange], _
		[15172, 8733, " ", $vqrange], _
		[14868, 7155, " ", $vqrange], _
		[15294, 6594, " ", $vqrange], _
		[17447, 6749, " ", $vqrange], _
		[16643, 7130, " ", $vqrange], _
		[14266, 7951, " ", $vqrange], _
		[12908, 11700, " ", $vqrange], _
		[14416, 14698, " ", $vqrange], _
		[15335, 15374, " ", $vqrange], _
		[16646, 15615, " ", $vqrange], _
		[15019, 16496, " ", $vqrange], _
		[12963, 17572, " ", $vqrange], _
		[11725, 16068, " ", $vqrange], _
		[10154, 14025, " ", $vqrange], _
		[8501, 13037, " ", $vqrange], _
		[7697, 11391, " ", $vqrange], _
		[7824, 9855, " ", $vqrange], _
		[7544, 8736, " ", $vqrange], _
		[7126, 7235, " ", $vqrange], _
		[6810, 6119, " ", $vqrange], _
		[4940, 4167, " ", $vqrange], _
		[3743, 2721, " ", $vqrange], _
		[3297, 199, " ", $vqrange], _
		[4298, -1705, " ", $vqrange], _
		[3388, -3548, " ", $vqrange], _
		[488, -5145, " ", $vqrange], _
		[-1387, -5622, " ", $vqrange], _
		[-2503, -5748, " ", $vqrange], _
		[-3844, -6379, " ", $vqrange], _
		[-5215, -8143, " ", $vqrange], _
		[-5174, -10935, " ", $vqrange], _
		[-3508, -11123, " ", $vqrange], _
		[-1832, -11668, " ", $vqrange], _
		[202, -11214, " ", $vqrange], _
		[2075, -10717, " ", $vqrange], _
		[3180, -10738, " ", $vqrange], _
		[3849, -10767, " ", $vqrange], _
		[5009, -10785, " ", $vqrange], _
		[7675, -13466, " ", $vqrange], _
		[8671, -12963, " ", $vqrange], _
		[10569, -13723, " ", $vqrange], _
		[11639, -14150, " ", $vqrange], _
		[13892, -14401, " ", $vqrange], _
		[15005, -17127, " ", $vqrange], _
		[15269, -19053, " ", $vqrange], _
		[14880, -20256, " ", $vqrange], _
		[13245, -14432, " ", $vqrange], _
		[10987, -13907, " ", $vqrange], _
		[8353, -12944, " ", $vqrange], _
		[2023, -12239, " ", $vqrange], _
		[-1526, -11596, " ", $vqrange], _
		[-5096, -11167, " ", $vqrange], _
		[-5640, -6518, " ", $vqrange], _
		[-3107, -4976, " ", $vqrange], _
		[100, -2966, " ", $vqrange], _
		[1011, -1463, " ", $vqrange], _
		[1553, 2, " ", $vqrange], _
		[1943, 2266, " ", $vqrange], _
		[4537, 3965, " ", $vqrange], _
		[6211, 5496, " ", $vqrange], _
		[7373, 7759, " ", $vqrange], _
		[8296, 10312, " ", $vqrange], _
		[9157, 12047, " ", $vqrange], _
		[11249, 13651, " ", $vqrange], _
		[13107, 14367, " ", $vqrange], _
		[14840, 15254, " ", $vqrange], _
		[16379, 15508, " ", $vqrange], _
		[18018, 16272, " ", $vqrange], _
		[18864, 17586, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

