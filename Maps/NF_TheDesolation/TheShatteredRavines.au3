;Mapped from route notes
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheShatteredRavinesOutpostPath[4][2] = [ _
	[787, 56], _
	[857, -1974], _
	[-1058, -3540], _
	[-1928, -4385] _
]

Func GoOutTheShatteredRavines()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $TheShatteredRavines_Map Then Return
	If $l_i_Map = $TheShatteredRavines_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> The Shattered Ravines (portal)")
		_Vanquisher_RunAggroPortalPath($aTheShatteredRavinesOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQTheShatteredRavines()
	If GetMapID() <> $TheShatteredRavines_Map And GetMapID() <> $TheShatteredRavines_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for The Shattered Ravines.")
		TravelTo($TheShatteredRavines_Outpost)
	EndIf

	If GetMapID() = $TheShatteredRavines_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheShatteredRavines()
		If GetMapID() <> $TheShatteredRavines_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need The Shattered Ravines (" & $TheShatteredRavines_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TheShatteredRavines_Map Then
		CurrentAction("The Shattered Ravines route waiting - on map " & GetMapID() & ", need " & $TheShatteredRavines_Map & ".")
		Return
	EndIf

	CurrentAction("Starting The Shattered Ravines vanquish route.")
	Local $aWaypoints[363][4] = [ _
		[416, 9518, "shrine", $vqrange], _
		[1025, 9078, " ", $vqrange], _
		[1179, 7813, " ", $vqrange], _
		[252, 7323, " ", $vqrange], _
		[-816, 7332, " ", $vqrange], _
		[-1633, 7550, " ", $vqrange], _
		[-3270, 7793, " ", $vqrange], _
		[-4048, 8490, " ", $vqrange], _
		[-5644, 8968, " ", $vqrange], _
		[-6345, 8754, " ", $vqrange], _
		[-6865, 7935, " ", $vqrange], _
		[-5770, 7238, " ", $vqrange], _
		[-4888, 7095, " ", $vqrange], _
		[-5314, 6244, " ", $vqrange], _
		[-6464, 6133, " ", $vqrange], _
		[-7119, 6679, " ", $vqrange], _
		[-8060, 7047, " ", $vqrange], _
		[-8484, 6428, " ", $vqrange], _
		[-7710, 5541, " ", $vqrange], _
		[-6791, 4882, " ", $vqrange], _
		[-5553, 4868, " ", $vqrange], _
		[-3763, 4896, " ", $vqrange], _
		[-2668, 4628, " ", $vqrange], _
		[-1182, 4288, " ", $vqrange], _
		[796, 5217, " ", $vqrange], _
		[1481, 6345, " ", $vqrange], _
		[4635, 9021, " ", $vqrange], _
		[4413, 8000, " ", $vqrange], _
		[4045, 6916, " ", $vqrange], _
		[3844, 5716, " ", $vqrange], _
		[3548, 3656, " ", $vqrange], _
		[2526, 3180, " ", $vqrange], _
		[1646, 2868, " ", $vqrange], _
		[708, 3067, " ", $vqrange], _
		[2749, 2849, " ", $vqrange], _
		[3887, 2445, " ", $vqrange], _
		[4456, 2707, " ", $vqrange], _
		[5248, 3319, " ", $vqrange], _
		[6967, 3998, " ", $vqrange], _
		[8244, 4000, " ", $vqrange], _
		[10040, 3283, " ", $vqrange], _
		[11085, 4312, " ", $vqrange], _
		[12271, 5566, " ", $vqrange], _
		[10263, 3877, " ", $vqrange], _
		[10471, 2426, " ", $vqrange], _
		[12671, 775, " ", $vqrange], _
		[14320, 1127, " ", $vqrange], _
		[14558, 3137, " ", $vqrange], _
		[15137, 3754, " ", $vqrange], _
		[16627, 5093, " ", $vqrange], _
		[17219, 4484, " ", $vqrange], _
		[18081, 3291, " ", $vqrange], _
		[19090, 2300, " ", $vqrange], _
		[20423, 1059, " ", $vqrange], _
		[21707, -639, " ", $vqrange], _
		[22680, -2283, " ", $vqrange], _
		[23027, -4146, " ", $vqrange], _
		[22618, -5325, " ", $vqrange], _
		[22755, -6588, " ", $vqrange], _
		[22795, -7641, " ", $vqrange], _
		[22000, -7716, " ", $vqrange], _
		[20945, -6794, " ", $vqrange], _
		[19943, -6537, " ", $vqrange], _
		[18335, -6367, " ", $vqrange], _
		[17725, -5575, " ", $vqrange], _
		[17618, -3436, " ", $vqrange], _
		[17679, -1711, " ", $vqrange], _
		[18521, -1605, " ", $vqrange], _
		[18871, -2247, " ", $vqrange], _
		[19782, -4022, " ", $vqrange], _
		[18692, -4499, " ", $vqrange], _
		[17761, -4799, " ", $vqrange], _
		[17965, -6296, " ", $vqrange], _
		[19369, -6852, " ", $vqrange], _
		[20398, -6741, " ", $vqrange], _
		[21579, -7318, " ", $vqrange], _
		[20932, -8127, " ", $vqrange], _
		[19879, -8467, " ", $vqrange], _
		[18745, -8594, " ", $vqrange], _
		[16141, -7554, " ", $vqrange], _
		[15476, -6591, " ", $vqrange], _
		[14686, -5325, " ", $vqrange], _
		[14522, -4334, " ", $vqrange], _
		[14482, -3628, " ", $vqrange], _
		[14459, -1972, " ", $vqrange], _
		[14670, -461, " ", $vqrange], _
		[12360, -322, " ", $vqrange], _
		[10105, -474, " ", $vqrange], _
		[7978, -657, " ", $vqrange], _
		[7091, -924, " ", $vqrange], _
		[8433, -741, " ", $vqrange], _
		[10842, -921, " ", $vqrange], _
		[14507, -1645, " ", $vqrange], _
		[14469, -2506, " ", $vqrange], _
		[13921, -4316, " ", $vqrange], _
		[13284, -5899, " ", $vqrange], _
		[14447, -8862, " ", $vqrange], _
		[11793, -7790, " ", $vqrange], _
		[12792, -6115, " ", $vqrange], _
		[11921, -5528, " ", $vqrange], _
		[10283, -5778, " ", $vqrange], _
		[8561, -5490, " ", $vqrange], _
		[7513, -4293, " ", $vqrange], _
		[5011, -3222, " ", $vqrange], _
		[3643, -3916, " ", $vqrange], _
		[3259, -4785, " ", $vqrange], _
		[3588, -5429, " ", $vqrange], _
		[4615, -7967, " ", $vqrange], _
		[2874, -7587, " ", $vqrange], _
		[1285, -7136, " ", $vqrange], _
		[504, -6299, " ", $vqrange], _
		[-2101, -6630, " ", $vqrange], _
		[-3108, -7379, " ", $vqrange], _
		[-3831, -9486, " ", $vqrange], _
		[-5227, -8767, " ", $vqrange], _
		[-6845, -9313, " ", $vqrange], _
		[-10083, -10733, " ", $vqrange], _
		[-10047, -9745, " ", $vqrange], _
		[-10185, -8961, " ", $vqrange], _
		[-10854, -7438, " ", $vqrange], _
		[-11974, -6677, " ", $vqrange], _
		[-13040, -6230, " ", $vqrange], _
		[-13187, -6163, " ", $vqrange], _
		[-13823, -5347, " ", $vqrange], _
		[-13326, -4917, " ", $vqrange], _
		[-12523, -4174, " ", $vqrange], _
		[-12167, -1474, " ", $vqrange], _
		[-12232, -1326, " ", $vqrange], _
		[-13449, -1664, " ", $vqrange], _
		[-15050, -2024, " ", $vqrange], _
		[-16407, -2330, " ", $vqrange], _
		[-17769, -3370, " ", $vqrange], _
		[-17619, -4199, " ", $vqrange], _
		[-18478, -5400, " ", $vqrange], _
		[-20332, -5481, " ", $vqrange], _
		[-21523, -8866, " ", $vqrange], _
		[-22583, -8123, " ", $vqrange], _
		[-23478, -7591, " ", $vqrange], _
		[-25118, -7077, " ", $vqrange], _
		[-26471, -7113, " ", $vqrange], _
		[-25061, -8878, " ", $vqrange], _
		[-23898, -9097, " ", $vqrange], _
		[-23045, -11803, " ", $vqrange], _
		[-22584, -11142, " ", $vqrange], _
		[-21399, -10223, " ", $vqrange], _
		[-21356, -8965, " ", $vqrange], _
		[-20479, -5684, " ", $vqrange], _
		[-21667, -4642, " ", $vqrange], _
		[-23157, -3582, " ", $vqrange], _
		[-24058, -2271, " ", $vqrange], _
		[-24711, -1482, " ", $vqrange], _
		[-25817, -1145, " ", $vqrange], _
		[-26462, -345, " ", $vqrange], _
		[-25716, -63, " ", $vqrange], _
		[-24915, 913, " ", $vqrange], _
		[-25455, 1819, " ", $vqrange], _
		[-25929, 2404, " ", $vqrange], _
		[-25402, 3103, " ", $vqrange], _
		[-25624, 4747, " ", $vqrange], _
		[-26030, 6224, " ", $vqrange], _
		[-26055, 6934, " ", $vqrange], _
		[-25210, 8109, " ", $vqrange], _
		[-24841, 9479, " ", $vqrange], _
		[-23939, 9196, " ", $vqrange], _
		[-23020, 9181, " ", $vqrange], _
		[-21319, 9496, " ", $vqrange], _
		[-20045, 9626, " ", $vqrange], _
		[-19316, 9390, " ", $vqrange], _
		[-19315, 8648, " ", $vqrange], _
		[-18583, 8028, " ", $vqrange], _
		[-17806, 7784, " ", $vqrange], _
		[-17387, 7526, " ", $vqrange], _
		[-16603, 8325, " ", $vqrange], _
		[-15469, 8823, " ", $vqrange], _
		[-14334, 8958, " ", $vqrange], _
		[-13303, 9272, " ", $vqrange], _
		[-12366, 9262, " ", $vqrange], _
		[-10257, 9293, " ", $vqrange], _
		[-11262, 8893, " ", $vqrange], _
		[-12052, 8189, " ", $vqrange], _
		[-13440, 7761, " ", $vqrange], _
		[-14107, 7155, " ", $vqrange], _
		[-15112, 6206, " ", $vqrange], _
		[-15922, 5693, " ", $vqrange], _
		[-16544, 5414, " ", $vqrange], _
		[-17412, 5056, " ", $vqrange], _
		[-18206, 4692, " ", $vqrange], _
		[-19163, 3925, " ", $vqrange], _
		[-19443, 4635, " ", $vqrange], _
		[-18900, 6427, " ", $vqrange], _
		[-19547, 6938, " ", $vqrange], _
		[-21178, 7139, " ", $vqrange], _
		[-22044, 6149, " ", $vqrange], _
		[-22870, 4633, " ", $vqrange], _
		[-23385, 3265, " ", $vqrange], _
		[-23870, 1976, " ", $vqrange], _
		[-24329, 757, " ", $vqrange], _
		[-25185, -949, " ", $vqrange], _
		[-23149, -3545, " ", $vqrange], _
		[-20992, -2885, " ", $vqrange], _
		[-19607, -1398, " ", $vqrange], _
		[-18347, -589, " ", $vqrange], _
		[-16766, -435, " ", $vqrange], _
		[-15437, 677, " ", $vqrange], _
		[-14149, 1199, " ", $vqrange], _
		[-12121, 2591, " ", $vqrange], _
		[-11138, 2816, " ", $vqrange], _
		[-10358, 2725, " ", $vqrange], _
		[-8866, 2375, " ", $vqrange], _
		[-9415, 1656, " ", $vqrange], _
		[-9746, 591, " ", $vqrange], _
		[-9860, -643, " ", $vqrange], _
		[-8989, -1656, " ", $vqrange], _
		[-9323, -3057, " ", $vqrange], _
		[-9177, -4587, " ", $vqrange], _
		[-8904, -5919, " ", $vqrange], _
		[-8009, -10599, " ", $vqrange], _
		[-7042, -8987, " ", $vqrange], _
		[-6497, -7351, " ", $vqrange], _
		[-6431, -6099, " ", $vqrange], _
		[-6961, -2691, " ", $vqrange], _
		[-5950, -1950, " ", $vqrange], _
		[-4674, -1551, " ", $vqrange], _
		[-3523, -1048, " ", $vqrange], _
		[-2792, -1814, " ", $vqrange], _
		[-3379, -2847, " ", $vqrange], _
		[-4362, -3367, " ", $vqrange], _
		[-5703, -4919, " ", $vqrange], _
		[-5149, -7103, " ", $vqrange], _
		[-5158, -5904, " ", $vqrange], _
		[-6501, -4131, " ", $vqrange], _
		[-8141, -2359, " ", $vqrange], _
		[-9553, -1390, " ", $vqrange], _
		[-10467, -1538, " ", $vqrange], _
		[-14269, -782, " ", $vqrange], _
		[-16033, -216, "UseWormSpoor", $vqrange], _
		[-11465, -1625, " ", $vqrange], _
		[-11906, -3571, " ", $vqrange], _
		[-14666, -4285, " ", $vqrange], _
		[-15769, -5816, " ", $vqrange], _
		[-15848, -6577, " ", $vqrange], _
		[-14229, -7084, " ", $vqrange], _
		[-12861, -7600, " ", $vqrange], _
		[-11959, -8138, " ", $vqrange], _
		[-11669, -9370, " ", $vqrange], _
		[-12181, -7912, " ", $vqrange], _
		[-15658, -6749, " ", $vqrange], _
		[-16800, -7317, " ", $vqrange], _
		[-16013, -7983, " ", $vqrange], _
		[-13410, -9696, " ", $vqrange], _
		[-13059, -10624, " ", $vqrange], _
		[-14637, -10849, " ", $vqrange], _
		[-15376, -10122, " ", $vqrange], _
		[-16373, -10090, " ", $vqrange], _
		[-17719, -10807, " ", $vqrange], _
		[-19181, -10933, " ", $vqrange], _
		[-21026, -9606, " ", $vqrange], _
		[-18329, -9400, " ", $vqrange], _
		[-16427, -9394, " ", $vqrange], _
		[-13975, -8771, " ", $vqrange], _
		[-16443, -7601, " ", $vqrange], _
		[-18289, -6976, " ", $vqrange], _
		[-20005, -7024, " ", $vqrange], _
		[-21772, -6647, " ", $vqrange], _
		[-23071, -6282, " ", $vqrange], _
		[-25192, -5068, " ", $vqrange], _
		[-26567, -5204, " ", $vqrange], _
		[-24922, -4271, " ", $vqrange], _
		[-23459, -2262, " ", $vqrange], _
		[-21802, -491, " ", $vqrange], _
		[-20221, 1197, " ", $vqrange], _
		[-20712, 2517, " ", $vqrange], _
		[-20877, 3367, " ", $vqrange], _
		[-20364, 7019, " ", $vqrange], _
		[-20957, 4309, " ", $vqrange], _
		[-20498, 1365, " ", $vqrange], _
		[-18146, 2498, " ", $vqrange], _
		[-15494, 3659, " ", $vqrange], _
		[-14240, 4428, " ", $vqrange], _
		[-12016, 5474, " ", $vqrange], _
		[-10653, 6048, " ", $vqrange], _
		[-10052, 7329, " ", $vqrange], _
		[-8388, 8970, " ", $vqrange], _
		[-6653, 10245, " ", $vqrange], _
		[-5370, 10524, " ", $vqrange], _
		[-3963, 10417, " ", $vqrange], _
		[-3109, 8772, " ", $vqrange], _
		[-2857, 8286, " ", $vqrange], _
		[-3785, 10280, " ", $vqrange], _
		[-4805, 10987, " ", $vqrange], _
		[-5941, 10816, " ", $vqrange], _
		[-6665, 10323, " ", $vqrange], _
		[-7418, 9715, " ", $vqrange], _
		[-8561, 8777, " ", $vqrange], _
		[-9784, 7432, " ", $vqrange], _
		[-10446, 6531, " ", $vqrange], _
		[-9763, 5142, " ", $vqrange], _
		[-8721, 4459, " ", $vqrange], _
		[-6881, 3293, " ", $vqrange], _
		[-5805, 2309, " ", $vqrange], _
		[-7224, -205, " ", $vqrange], _
		[-5735, 2380, " ", $vqrange], _
		[-4597, 2055, " ", $vqrange], _
		[-3124, 1326, " ", $vqrange], _
		[-1510, 223, " ", $vqrange], _
		[-1448, -678, " ", $vqrange], _
		[-1812, -2708, " ", $vqrange], _
		[144, -4181, " ", $vqrange], _
		[2471, -6078, " ", $vqrange], _
		[558, -4577, " ", $vqrange], _
		[-76, -3752, " ", $vqrange], _
		[-2389, -3193, " ", $vqrange], _
		[-4803, -5652, " ", $vqrange], _
		[-4414, -5105, " ", $vqrange], _
		[-3269, -4214, " ", $vqrange], _
		[-2008, -2693, " ", $vqrange], _
		[-1371, -1171, " ", $vqrange], _
		[-588, -37, " ", $vqrange], _
		[203, -443, " ", $vqrange], _
		[2579, -1205, " ", $vqrange], _
		[3596, -1471, " ", $vqrange], _
		[5171, -1372, " ", $vqrange], _
		[6746, -2044, " ", $vqrange], _
		[7957, -2352, " ", $vqrange], _
		[9003, -2324, " ", $vqrange], _
		[10652, -2209, " ", $vqrange], _
		[12073, -2802, " ", $vqrange], _
		[13383, -3406, " ", $vqrange], _
		[12170, -2781, " ", $vqrange], _
		[10413, -2392, " ", $vqrange], _
		[9402, -2419, " ", $vqrange], _
		[8637, -2420, " ", $vqrange], _
		[7342, -2323, " ", $vqrange], _
		[6078, -1813, " ", $vqrange], _
		[5587, -988, " ", $vqrange], _
		[5830, -292, " ", $vqrange], _
		[6840, 259, " ", $vqrange], _
		[7594, 969, " ", $vqrange], _
		[8692, 1653, " ", $vqrange], _
		[10288, 2368, " ", $vqrange], _
		[11302, 2264, " ", $vqrange], _
		[11664, 2766, " ", $vqrange], _
		[12490, 3972, " ", $vqrange], _
		[13137, 4592, " ", $vqrange], _
		[14218, 5731, " ", $vqrange], _
		[15438, 6429, " ", $vqrange], _
		[18299, 5291, " ", $vqrange], _
		[19615, 3564, " ", $vqrange], _
		[18791, 4798, " ", $vqrange], _
		[18148, 5326, " ", $vqrange], _
		[17034, 6854, " ", $vqrange], _
		[18073, 7638, " ", $vqrange], _
		[18936, 8594, " ", $vqrange], _
		[19527, 9429, " ", $vqrange], _
		[19327, 8677, " ", $vqrange], _
		[19041, 8015, " ", $vqrange], _
		[19644, 7899, " ", $vqrange], _
		[20767, 7911, " ", $vqrange], _
		[21723, 8268, " ", $vqrange], _
		[22806, 8678, " ", $vqrange], _
		[24139, 9243, " ", $vqrange], _
		[25051, 8651, " ", $vqrange], _
		[24793, 9901, " ", $vqrange]]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
