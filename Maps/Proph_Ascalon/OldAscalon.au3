#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aOldAscalonTransitPath[18][2] = [ _
	[-3795, -8404], _
	[-3055, -5189], _
	[-1349, -3234], _
	[-130, -2838], _
	[-536, -2936], _
	[161, -4817], _
	[2143, -4662], _
	[2296, -6624], _
	[4733, -6605], _
	[3784, -7841], _
	[624, -7904], _
	[573, -9021], _
	[1888, -9057], _
	[1920, -9640], _
	[1907, -9975], _
	[1908, -10212], _
	[1894, -10424], _
	[1878, -10649] _
]

Func GoOutOldAscalon()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $OldAscalon_Map Then Return

	If $l_i_Map = $OldAscalon_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("TheBreach -> OldAscalon")
		_Vanquisher_RunAggroPortalPath($aOldAscalonTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQOldAscalon()
	If GetMapID() <> $OldAscalon_Map And GetMapID() <> $OldAscalon_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("OldAscalon route waiting - on map " & GetMapID() & ", need " & $OldAscalon_Map & " via The Breach.")
		Return
	EndIf

	If GetMapID() = $OldAscalon_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutOldAscalon()
		If GetMapID() <> $OldAscalon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need OldAscalon (" & $OldAscalon_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $OldAscalon_Map Then
		CurrentAction("OldAscalon route waiting - on map " & GetMapID() & ", need " & $OldAscalon_Map & ".")
		Return
	EndIf

	CurrentAction("Starting OldAscalon vanquish route.")

	Local $aWaypoints[330][4] = [ _
		[-18057, 19104, " ", $vqrange], _
		[-18168, 18517, " ", $vqrange], _
		[-19583, 19133, " ", $vqrange], _
		[-18472, 18573, " ", $vqrange], _
		[-16643, 17192, " ", $vqrange], _
		[-15554, 16362, " ", $vqrange], _
		[-14394, 15548, " ", $vqrange], _
		[-13188, 15385, " ", $vqrange], _
		[-12674, 15473, " ", $vqrange], _
		[-11510, 15970, " ", $vqrange], _
		[-10691, 16929, " ", $vqrange], _
		[-9175, 16208, " ", $vqrange], _
		[-7264, 16220, " ", $vqrange], _
		[-6565, 14888, " ", $vqrange], _
		[-5620, 14316, " ", $vqrange], _
		[-5215, 14840, " ", $vqrange], _
		[-4417, 13821, " ", $vqrange], _
		[-3912, 13766, " ", $vqrange], _
		[-3391, 12758, " ", $vqrange], _
		[-3575, 11996, " ", $vqrange], _
		[-2992, 11711, " ", $vqrange], _
		[-2531, 11528, " ", $vqrange], _
		[-1988, 11441, " ", $vqrange], _
		[-1317, 11429, " ", $vqrange], _
		[-237, 12026, " ", $vqrange], _
		[462, 12592, " ", $vqrange], _
		[991, 13432, " ", $vqrange], _
		[1611, 14176, " ", $vqrange], _
		[2192, 14790, " ", $vqrange], _
		[3936, 13826, " ", $vqrange], _
		[4441, 13607, " ", $vqrange], _
		[5822, 13118, " ", $vqrange], _
		[7242, 12801, " ", $vqrange], _
		[8160, 12925, " ", $vqrange], _
		[8501, 12288, " ", $vqrange], _
		[8900, 13145, " ", $vqrange], _
		[9308, 14349, " ", $vqrange], _
		[9524, 15581, " ", $vqrange], _
		[9500, 16684, " ", $vqrange], _
		[8444, 18061, " ", $vqrange], _
		[9064, 18172, " ", $vqrange], _
		[6006, 18599, " ", $vqrange], _
		[4266, 18728, " ", $vqrange], _
		[3689, 17829, " ", $vqrange], _
		[7074, 18298, " ", $vqrange], _
		[9601, 17004, " ", $vqrange], _
		[10245, 16224, " ", $vqrange], _
		[11000, 15424, " ", $vqrange], _
		[12228, 14975, " ", $vqrange], _
		[13472, 16054, " ", $vqrange], _
		[14339, 16515, " ", $vqrange], _
		[14867, 16615, " ", $vqrange], _
		[14943, 15521, " ", $vqrange], _
		[15398, 13365, " ", $vqrange], _
		[14536, 12933, " ", $vqrange], _
		[15991, 12749, " ", $vqrange], _
		[17040, 12231, " ", $vqrange], _
		[14499, 12720, " ", $vqrange], _
		[15760, 10656, " ", $vqrange], _
		[16327, 9530, " ", $vqrange], _
		[17598, 9212, " ", $vqrange], _
		[17381, 7918, " ", $vqrange], _
		[16285, 5980, " ", $vqrange], _
		[15438, 4417, " ", $vqrange], _
		[16285, 6317, " ", $vqrange], _
		[17316, 8012, " ", $vqrange], _
		[14695, 9634, " ", $vqrange], _
		[13645, 9360, " ", $vqrange], _
		[13404, 8622, " ", $vqrange], _
		[15188, 7440, " ", $vqrange], _
		[15606, 7431, " ", $vqrange], _
		[16660, 7085, " ", $vqrange], _
		[17664, 6581, " ", $vqrange], _
		[18680, 6343, " ", $vqrange], _
		[19245, 5347, " ", $vqrange], _
		[19521, 3662, " ", $vqrange], _
		[19225, 2777, " ", $vqrange], _
		[18313, 2345, " ", $vqrange], _
		[16914, 2334, " ", $vqrange], _
		[15115, 1658, " ", $vqrange], _
		[14144, 2114, " ", $vqrange], _
		[13713, 1291, " ", $vqrange], _
		[13720, 558, " ", $vqrange], _
		[12048, -160, " ", $vqrange], _
		[11210, -369, " ", $vqrange], _
		[10621, -382, " ", $vqrange], _
		[11515, 363, " ", $vqrange], _
		[10358, -335, " ", $vqrange], _
		[8347, -720, " ", $vqrange], _
		[7918, -740, " ", $vqrange], _
		[6612, -1065, " ", $vqrange], _
		[5967, -207, " ", $vqrange], _
		[4396, -416, " ", $vqrange], _
		[3097, -746, " ", $vqrange], _
		[1717, -1051, " ", $vqrange], _
		[948, -1254, " ", $vqrange], _
		[330, -2656, " ", $vqrange], _
		[493, -3850, " ", $vqrange], _
		[-144, -7264, " ", $vqrange], _
		[-3415, -7545, " ", $vqrange], _
		[-4062, -9058, " ", $vqrange], _
		[-4671, -10219, " ", $vqrange], _
		[-5575, -10454, " ", $vqrange], _
		[-6335, -9813, " ", $vqrange], _
		[-6872, -9189, " ", $vqrange], _
		[-6558, -7801, " ", $vqrange], _
		[-5934, -6474, " ", $vqrange], _
		[-5572, -4820, " ", $vqrange], _
		[-5489, -4158, " ", $vqrange], _
		[-5338, -3143, " ", $vqrange], _
		[-5130, -1925, " ", $vqrange], _
		[-4430, -147, " ", $vqrange], _
		[-3693, 1125, " ", $vqrange], _
		[-1834, 2809, " ", $vqrange], _
		[11, 4699, " ", $vqrange], _
		[1659, 5849, " ", $vqrange], _
		[2231, 5729, " ", $vqrange], _
		[3820, 4866, " ", $vqrange], _
		[4326, 5375, " ", $vqrange], _
		[5113, 6988, " ", $vqrange], _
		[6613, 8046, " ", $vqrange], _
		[8873, 5816, " ", $vqrange], _
		[8990, 5375, " ", $vqrange], _
		[10422, 7687, " ", $vqrange], _
		[8834, 10225, " ", $vqrange], _
		[8263, 10336, " ", $vqrange], _
		[5839, 10408, " ", $vqrange], _
		[5100, 10265, " ", $vqrange], _
		[3274, 10422, " ", $vqrange], _
		[1885, 16656, " ", $vqrange], _
		[281, 17514, " ", $vqrange], _
		[-544, 17610, " ", $vqrange], _
		[-2006, 17302, " ", $vqrange], _
		[-2171, 16964, " ", $vqrange], _
		[-3233, 11973, " ", $vqrange], _
		[-2001, 9470, " ", $vqrange], _
		[-2656, 7369, " ", $vqrange], _
		[-4188, 5446, " ", $vqrange], _
		[-5073, 4732, " ", $vqrange], _
		[-7073, 5038, " ", $vqrange], _
		[-8095, 4777, " ", $vqrange], _
		[-8981, 4659, " ", $vqrange], _
		[-9572, 4513, " ", $vqrange], _
		[-11011, 4209, " ", $vqrange], _
		[-12102, 3756, " ", $vqrange], _
		[-13476, 3302, " ", $vqrange], _
		[-14551, 3076, " ", $vqrange], _
		[-14939, 2681, " ", $vqrange], _
		[-16655, 159, " ", $vqrange], _
		[-17924, -460, " ", $vqrange], _
		[-18959, -563, " ", $vqrange], _
		[-19333, 996, " ", $vqrange], _
		[-19424, 447, " ", $vqrange], _
		[-19499, -1152, " ", $vqrange], _
		[-20178, -2790, " ", $vqrange], _
		[-19404, -3608, " ", $vqrange], _
		[-20073, -3532, " ", $vqrange], _
		[-21290, -3672, " ", $vqrange], _
		[-21915, -5063, " ", $vqrange], _
		[-21848, -5788, " ", $vqrange], _
		[-21857, -6962, " ", $vqrange], _
		[-21615, -7747, " ", $vqrange], _
		[-21377, -8434, " ", $vqrange], _
		[-20774, -9346, " ", $vqrange], _
		[-19881, -10264, " ", $vqrange], _
		[-18028, -10383, " ", $vqrange], _
		[-17578, -11190, " ", $vqrange], _
		[-15992, -10745, " ", $vqrange], _
		[-14877, -10874, " ", $vqrange], _
		[-13627, -11579, " ", $vqrange], _
		[-12429, -13053, " ", $vqrange], _
		[-12586, -14215, " ", $vqrange], _
		[-12955, -14834, " ", $vqrange], _
		[-11638, -13929, " ", $vqrange], _
		[-10225, -14437, " ", $vqrange], _
		[-9055, -14398, " ", $vqrange], _
		[-9055, -14398, " ", $vqrange], _
		[-8484, -14400, " ", $vqrange], _
		[-5124, -13082, " ", $vqrange], _
		[-5559, -12475, " ", $vqrange], _
		[-8982, -14303, " ", $vqrange], _
		[-10698, -14387, " ", $vqrange], _
		[-14577, -14654, " ", $vqrange], _
		[-17271, -14660, " ", $vqrange], _
		[-20361, -10809, " ", $vqrange], _
		[-21481, -10203, " ", $vqrange], _
		[-21867, -8274, " ", $vqrange], _
		[-20268, -674, " ", $vqrange], _
		[-19334, 1762, " ", $vqrange], _
		[-20131, 6340, " ", $vqrange], _
		[-19456, 8096, " ", $vqrange], _
		[-19290, 8649, " ", $vqrange], _
		[-18368, 9268, " ", $vqrange], _
		[-16592, 9063, " ", $vqrange], _
		[-15826, 8740, " ", $vqrange], _
		[-14294, 7858, " ", $vqrange], _
		[-15001, 9041, " ", $vqrange], _
		[-14454, 13261, " ", $vqrange], _
		[-18045, 7344, " ", $vqrange], _
		[-19383, 6029, " ", $vqrange], _
		[-20103, 6515, " ", $vqrange], _
		[-20614, 3912, " ", $vqrange], _
		[-14761, -290, " ", $vqrange], _
		[-13149, 2150, " ", $vqrange], _
		[-9038, 4532, " ", $vqrange], _
		[-6645, 5069, " ", $vqrange], _
		[-3880, 2119, " ", $vqrange], _
		[-4407, -37, " ", $vqrange], _
		[-4627, -493, " ", $vqrange], _
		[-4809, -1028, " ", $vqrange], _
		[-4939, -1790, " ", $vqrange], _
		[-5502, -3208, " ", $vqrange], _
		[-5163, -4934, " ", $vqrange], _
		[-3879, -5886, " ", $vqrange], _
		[-3233, -6385, " ", $vqrange], _
		[-1206, -6105, " ", $vqrange], _
		[-1376, -7622, " ", $vqrange], _
		[-331, -8345, " ", $vqrange], _
		[1542, -9140, " ", $vqrange], _
		[2707, -9025, " ", $vqrange], _
		[1822, -7678, " ", $vqrange], _
		[2258, -6591, " ", $vqrange], _
		[3061, -5852, " ", $vqrange], _
		[5338, -8384, " ", $vqrange], _
		[6746, -9888, " ", $vqrange], _
		[6236, -9110, " ", $vqrange], _
		[4159, -6155, " ", $vqrange], _
		[4394, -3745, " ", $vqrange], _
		[5616, -2200, " ", $vqrange], _
		[7544, -810, " ", $vqrange], _
		[8370, -1, " ", $vqrange], _
		[8899, 934, " ", $vqrange], _
		[10219, 3978, " ", $vqrange], _
		[10841, 6260, " ", $vqrange], _
		[12423, 10047, " ", $vqrange], _
		[13390, 12873, " ", $vqrange], _
		[12108, 15181, " ", $vqrange], _
		[9709, 16597, " ", $vqrange], _
		[7756, 18073, " ", $vqrange], _
		[5082, 17696, " ", $vqrange], _
		[1088, 17505, " ", $vqrange], _
		[-1397, 17647, " ", $vqrange], _
		[-6220, 14680, " ", $vqrange], _
		[-8325, 16152, " ", $vqrange], _
		[-11533, 15977, " ", $vqrange], _
		[-14067, 13858, " ", $vqrange], _
		[-16826, 9984, " ", $vqrange], _
		[-17271, 8950, " ", $vqrange], _
		[-17689, 7887, " ", $vqrange], _
		[-18207, 6910, " ", $vqrange], _
		[-19169, 5766, " ", $vqrange], _
		[-19539, 5491, " ", $vqrange], _
		[-20140, 6505, " ", $vqrange], _
		[-20452, 4854, " ", $vqrange], _
		[-19446, 3064, " ", $vqrange], _
		[-19182, 1510, " ", $vqrange], _
		[-19453, -280, " ", $vqrange], _
		[-20504, -2749, " ", $vqrange], _
		[-21631, -4783, " ", $vqrange], _
		[-21796, -7234, " ", $vqrange], _
		[-21592, -7861, " ", $vqrange], _
		[-19205, -10071, " ", $vqrange], _
		[-16174, -10771, " ", $vqrange], _
		[-11955, -12953, " ", $vqrange], _
		[-9999, -14747, " ", $vqrange], _
		[-5773, -12432, " ", $vqrange], _
		[-4477, -9745, " ", $vqrange], _
		[-2704, -6620, " ", $vqrange], _
		[-658, -3805, " ", $vqrange], _
		[248, -1582, " ", $vqrange], _
		[-2171, 834, " ", $vqrange], _
		[-2416, 3411, " ", $vqrange], _
		[-4833, 4399, " ", $vqrange], _
		[-5908, 6624, " ", $vqrange], _
		[-6329, 8407, " ", $vqrange], _
		[-4318, 11149, " ", $vqrange], _
		[-3221, 13067, " ", $vqrange], _
		[-2919, 14985, " ", $vqrange], _
		[-2751, 16799, " ", $vqrange], _
		[-721, 17756, " ", $vqrange], _
		[2065, 17455, " ", $vqrange], _
		[3752, 15850, " ", $vqrange], _
		[2588, 14219, " ", $vqrange], _
		[670, 12672, " ", $vqrange], _
		[-239, 12088, " ", $vqrange], _
		[-1224, 11456, " ", $vqrange], _
		[-1861, 10299, " ", $vqrange], _
		[-1967, 9062, " ", $vqrange], _
		[-2050, 8094, " ", $vqrange], _
		[-2301, 7076, " ", $vqrange], _
		[-2474, 5933, " ", $vqrange], _
		[-3204, 5141, " ", $vqrange], _
		[-3624, 3695, " ", $vqrange], _
		[-3017, 1665, " ", $vqrange], _
		[-4064, -188, " ", $vqrange], _
		[-4695, -1198, " ", $vqrange], _
		[-5192, -2424, " ", $vqrange], _
		[-5215, -3829, " ", $vqrange], _
		[-5118, -4585, " ", $vqrange], _
		[-3466, -6557, " ", $vqrange], _
		[-4222, -9270, " ", $vqrange], _
		[-5598, -13685, " ", $vqrange], _
		[-7782, -14113, " ", $vqrange], _
		[-12881, -14627, " ", $vqrange], _
		[-14813, -14791, " ", $vqrange], _
		[-19508, -12007, " ", $vqrange], _
		[-21386, -10429, " ", $vqrange], _
		[-21654, -4398, " ", $vqrange], _
		[-20123, -2256, " ", $vqrange], _
		[-16815, -907, " ", $vqrange], _
		[-13177, 2437, " ", $vqrange], _
		[-10702, 4231, " ", $vqrange], _
		[-7854, 4812, " ", $vqrange], _
		[-4008, 5591, " ", $vqrange], _
		[-2357, 8111, " ", $vqrange], _
		[-1809, 9427, " ", $vqrange], _
		[1163, 13325, " ", $vqrange], _
		[5437, 13421, " ", $vqrange], _
		[8507, 11803, " ", $vqrange], _
		[12871, 3102, " ", $vqrange], _
		[18123, 1210, " ", $vqrange], _
		[19131, -1462, " ", $vqrange], _
		[18179, -2891, " ", $vqrange], _
		[17387, -3495, " ", $vqrange], _
		[16361, -4389, " ", $vqrange], _
		[15802, -5369, " ", $vqrange], _
		[15469, -6323, " ", $vqrange], _
		[15137, -7039, " ", $vqrange], _
		[14549, -7462, " ", $vqrange], _
		[13848, -8185, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
