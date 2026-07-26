;Mapped from route notes
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheAlkaliPanOutpostPath[2][2] = [ _
	[-3935, 12288], _
	[-3447, 11751] _
]

Func GoOutTheAlkaliPan()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $TheAlkaliPan_Map Then Return
	If $l_i_Map = $TheAlkaliPan_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> The Alkali Pan (portal)")
		_Vanquisher_RunAggroPortalPath($aTheAlkaliPanOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQTheAlkaliPan()
	If GetMapID() <> $TheAlkaliPan_Map And GetMapID() <> $TheAlkaliPan_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for The Alkali Pan.")
		TravelTo($TheAlkaliPan_Outpost)
	EndIf

	If GetMapID() = $TheAlkaliPan_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheAlkaliPan()
		If GetMapID() <> $TheAlkaliPan_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need The Alkali Pan (" & $TheAlkaliPan_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TheAlkaliPan_Map Then
		CurrentAction("The Alkali Pan route waiting - on map " & GetMapID() & ", need " & $TheAlkaliPan_Map & ".")
		Return
	EndIf

	CurrentAction("Starting The Alkali Pan vanquish route.")
	Local $aWaypoints[405][4] = [ _
		[-2060, 7080, "shrine", $vqrange], _
		[-2269, 6098, " ", $vqrange], _
		[-1679, 5291, " ", $vqrange], _
		[-846, 4629, " ", $vqrange], _
		[18, 4853, " ", $vqrange], _
		[1037, 5593, " ", $vqrange], _
		[2377, 6179, " ", $vqrange], _
		[2073, 6894, " ", $vqrange], _
		[1192, 7633, " ", $vqrange], _
		[1185, 9150, " ", $vqrange], _
		[2810, 9292, " ", $vqrange], _
		[417, 8849, " ", $vqrange], _
		[-640, 8091, " ", $vqrange], _
		[20, 6572, " ", $vqrange], _
		[-634, 5334, " ", $vqrange], _
		[-2339, 5700, " ", $vqrange], _
		[-3514, 5362, " ", $vqrange], _
		[-4448, 5071, " ", $vqrange], _
		[-5048, 5122, " ", $vqrange], _
		[-6458, 5920, " ", $vqrange], _
		[-6431, 6901, " ", $vqrange], _
		[-4788, 7852, " ", $vqrange], _
		[-5423, 8546, " ", $vqrange], _
		[-6231, 9059, " ", $vqrange], _
		[-7362, 9366, " ", $vqrange], _
		[-7755, 9723, " ", $vqrange], _
		[-8198, 9925, " ", $vqrange], _
		[-9022, 10418, " ", $vqrange], _
		[-9773, 11055, " ", $vqrange], _
		[-11162, 12195, " ", $vqrange], _
		[-11747, 11757, " ", $vqrange], _
		[-11654, 10480, " ", $vqrange], _
		[-10886, 10138, " ", $vqrange], _
		[-9711, 10895, " ", $vqrange], _
		[-9018, 10448, " ", $vqrange], _
		[-8000, 9763, " ", $vqrange], _
		[-8061, 8422, " ", $vqrange], _
		[-7556, 6680, " ", $vqrange], _
		[-6373, 5059, " ", $vqrange], _
		[-7189, 4618, " ", $vqrange], _
		[-9240, 3980, " ", $vqrange], _
		[-10107, 3451, " ", $vqrange], _
		[-10822, 2981, " ", $vqrange], _
		[-11167, 2200, " ", $vqrange], _
		[-11434, 754, " ", $vqrange], _
		[-10997, -728, " ", $vqrange], _
		[-10418, -1264, " ", $vqrange], _
		[-9919, -1967, " ", $vqrange], _
		[-9532, -3131, " ", $vqrange], _
		[-9596, -4121, " ", $vqrange], _
		[-10076, -5760, " ", $vqrange], _
		[-8618, -6616, " ", $vqrange], _
		[-7996, -6048, " ", $vqrange], _
		[-10863, -6138, " ", $vqrange], _
		[-11938, -5562, " ", $vqrange], _
		[-12569, -4613, " ", $vqrange], _
		[-12989, -3399, " ", $vqrange], _
		[-13312, -2925, " ", $vqrange], _
		[-13921, -3697, " ", $vqrange], _
		[-14050, -4460, " ", $vqrange], _
		[-13674, -4981, " ", $vqrange], _
		[-13761, -5403, " ", $vqrange], _
		[-14499, -5825, " ", $vqrange], _
		[-15006, -5285, " ", $vqrange], _
		[-16725, -3818, " ", $vqrange], _
		[-16518, -2837, " ", $vqrange], _
		[-16133, -2002, " ", $vqrange], _
		[-15515, -1191, " ", $vqrange], _
		[-16299, -863, " ", $vqrange], _
		[-17925, -162, " ", $vqrange], _
		[-18808, -897, " ", $vqrange], _
		[-18982, -1798, " ", $vqrange], _
		[-16938, -674, "UseWormSpoor", $vqrange], _
		[-17456, 49, " ", $vqrange], _
		[-18317, 1371, " ", $vqrange], _
		[-17978, 2201, " ", $vqrange], _
		[-16772, 1995, " ", $vqrange], _
		[-16153, 2993, " ", $vqrange], _
		[-16557, 3493, " ", $vqrange], _
		[-17492, 4596, " ", $vqrange], _
		[-17751, 5153, " ", $vqrange], _
		[-17120, 5731, " ", $vqrange], _
		[-15362, 6037, " ", $vqrange], _
		[-14474, 6192, " ", $vqrange], _
		[-14103, 6702, " ", $vqrange], _
		[-14344, 7713, " ", $vqrange], _
		[-15066, 7942, " ", $vqrange], _
		[-16278, 8284, " ", $vqrange], _
		[-14978, 9762, " ", $vqrange], _
		[-15555, 10458, " ", $vqrange], _
		[-16153, 11516, " ", $vqrange], _
		[-16841, 12379, " ", $vqrange], _
		[-17594, 13366, " ", $vqrange], _
		[-17988, 14148, " ", $vqrange], _
		[-18279, 15049, " ", $vqrange], _
		[-17499, 15602, " ", $vqrange], _
		[-16690, 15620, " ", $vqrange], _
		[-16144, 15711, " ", $vqrange], _
		[-15235, 15661, " ", $vqrange], _
		[-13492, 15601, " ", $vqrange], _
		[-13418, 14844, " ", $vqrange], _
		[-13128, 13933, " ", $vqrange], _
		[-13484, 13074, " ", $vqrange], _
		[-14694, 10584, " ", $vqrange], _
		[-15889, 10033, " ", $vqrange], _
		[-14588, 9266, " ", $vqrange], _
		[-12900, 8889, " ", $vqrange], _
		[-11385, 8504, " ", $vqrange], _
		[-11685, 9147, " ", $vqrange], _
		[-11885, 7818, " ", $vqrange], _
		[-11965, 6656, " ", $vqrange], _
		[-12224, 5756, " ", $vqrange], _
		[-12860, 4603, " ", $vqrange], _
		[-13789, 3404, " ", $vqrange], _
		[-13734, 1767, " ", $vqrange], _
		[-14064, 1162, " ", $vqrange], _
		[-14812, 255, " ", $vqrange], _
		[-15362, -531, " ", $vqrange], _
		[-16613, -1980, " ", $vqrange], _
		[-17627, -3078, " ", $vqrange], _
		[-16822, -3741, " ", $vqrange], _
		[-14898, -5363, " ", $vqrange], _
		[-14525, -5666, " ", $vqrange], _
		[-14101, -7134, " ", $vqrange], _
		[-13287, -7168, " ", $vqrange], _
		[-12200, -7433, " ", $vqrange], _
		[-11538, -7600, " ", $vqrange], _
		[-10868, -8551, " ", $vqrange], _
		[-10909, -9465, " ", $vqrange], _
		[-10400, -10282, " ", $vqrange], _
		[-9678, -11469, " ", $vqrange], _
		[-9309, -12097, " ", $vqrange], _
		[-8545, -14294, " ", $vqrange], _
		[-8107, -15195, " ", $vqrange], _
		[-7567, -15918, " ", $vqrange], _
		[-7259, -16426, " ", $vqrange], _
		[-6782, -16995, " ", $vqrange], _
		[-6117, -17912, " ", $vqrange], _
		[-5366, -18134, " ", $vqrange], _
		[-4401, -17895, " ", $vqrange], _
		[-4738, -17082, " ", $vqrange], _
		[-5597, -17205, " ", $vqrange], _
		[-5446, -15288, " ", $vqrange], _
		[-5776, -14468, " ", $vqrange], _
		[-5992, -13400, " ", $vqrange], _
		[-5984, -12749, " ", $vqrange], _
		[-5908, -11565, " ", $vqrange], _
		[-5897, -10354, " ", $vqrange], _
		[-5967, -9593, " ", $vqrange], _
		[-6066, -8840, " ", $vqrange], _
		[-6795, -8480, " ", $vqrange], _
		[-7509, -8182, " ", $vqrange], _
		[-8393, -7758, " ", $vqrange], _
		[-9025, -8213, " ", $vqrange], _
		[-8575, -9874, " ", $vqrange], _
		[-8101, -11030, " ", $vqrange], _
		[-7763, -11852, " ", $vqrange], _
		[-7341, -12889, " ", $vqrange], _
		[-6871, -14026, " ", $vqrange], _
		[-6353, -15289, " ", $vqrange], _
		[-5402, -15846, " ", $vqrange], _
		[-2783, -15446, " ", $vqrange], _
		[-2561, -14830, " ", $vqrange], _
		[-2254, -14027, " ", $vqrange], _
		[-1531, -13869, " ", $vqrange], _
		[-524, -13285, " ", $vqrange], _
		[463, -12441, " ", $vqrange], _
		[917, -11644, " ", $vqrange], _
		[1127, -10943, " ", $vqrange], _
		[1519, -9098, " ", $vqrange], _
		[2308, -7791, " ", $vqrange], _
		[3174, -7654, " ", $vqrange], _
		[3620, -8237, " ", $vqrange], _
		[4376, -9169, " ", $vqrange], _
		[4298, -9820, " ", $vqrange], _
		[4096, -10591, " ", $vqrange], _
		[3853, -11173, " ", $vqrange], _
		[3675, -11953, " ", $vqrange], _
		[3056, -12630, " ", $vqrange], _
		[1593, -13806, " ", $vqrange], _
		[79, -15877, " ", $vqrange], _
		[-995, -17601, " ", $vqrange], _
		[517, -19235, " ", $vqrange], _
		[1473, -19579, " ", $vqrange], _
		[2376, -19277, " ", $vqrange], _
		[2974, -18616, " ", $vqrange], _
		[3349, -17743, " ", $vqrange], _
		[4004, -17655, " ", $vqrange], _
		[5658, -17586, " ", $vqrange], _
		[5597, -17392, " ", $vqrange], _
		[4569, -16950, " ", $vqrange], _
		[4429, -15849, " ", $vqrange], _
		[4130, -14935, " ", $vqrange], _
		[4032, -13871, " ", $vqrange], _
		[3727, -11868, " ", $vqrange], _
		[555, -13387, " ", $vqrange], _
		[2389, -13767, " ", $vqrange], _
		[4787, -14491, " ", $vqrange], _
		[6470, -16134, " ", $vqrange], _
		[7670, -17606, " ", $vqrange], _
		[6796, -17734, " ", $vqrange], _
		[7361, -16678, " ", $vqrange], _
		[8578, -13908, " ", $vqrange], _
		[9214, -14461, " ", $vqrange], _
		[10056, -14919, " ", $vqrange], _
		[12396, -15126, " ", $vqrange], _
		[13090, -15169, " ", $vqrange], _
		[14012, -16817, " ", $vqrange], _
		[14715, -17420, " ", $vqrange], _
		[15673, -17317, " ", $vqrange], _
		[16444, -16549, " ", $vqrange], _
		[17407, -15647, " ", $vqrange], _
		[18034, -14674, " ", $vqrange], _
		[17602, -14206, " ", $vqrange], _
		[15789, -13731, " ", $vqrange], _
		[14703, -12629, " ", $vqrange], _
		[13775, -11682, " ", $vqrange], _
		[14203, -10750, " ", $vqrange], _
		[14183, -9794, " ", $vqrange], _
		[15707, -9693, " ", $vqrange], _
		[17074, -9568, " ", $vqrange], _
		[17918, -8956, " ", $vqrange], _
		[18725, -8719, " ", $vqrange], _
		[19396, -8086, " ", $vqrange], _
		[19722, -7164, " ", $vqrange], _
		[19746, -6622, " ", $vqrange], _
		[19638, -5792, " ", $vqrange], _
		[19613, -4648, " ", $vqrange], _
		[19107, -4433, " ", $vqrange], _
		[18419, -4024, " ", $vqrange], _
		[17691, -3183, " ", $vqrange], _
		[16926, -2303, " ", $vqrange], _
		[17149, -1219, " ", $vqrange], _
		[15918, -419, " ", $vqrange], _
		[14165, 105, " ", $vqrange], _
		[12132, 1282, " ", $vqrange], _
		[11067, 1435, " ", $vqrange], _
		[10274, 2526, " ", $vqrange], _
		[9975, 2904, " ", $vqrange], _
		[10150, 5040, " ", $vqrange], _
		[10451, 7471, " ", $vqrange], _
		[9945, 2949, " ", $vqrange], _
		[10180, 1171, " ", $vqrange], _
		[9914, 805, " ", $vqrange], _
		[7978, 336, " ", $vqrange], _
		[6801, -70, " ", $vqrange], _
		[5501, 454, " ", $vqrange], _
		[4176, -208, " ", $vqrange], _
		[4795, -1776, " ", $vqrange], _
		[6133, -1481, " ", $vqrange], _
		[6624, -1257, " ", $vqrange], _
		[7201, -324, " ", $vqrange], _
		[7939, 223, " ", $vqrange], _
		[10470, 623, " ", $vqrange], _
		[12277, 1122, " ", $vqrange], _
		[15365, -428, " ", $vqrange], _
		[17982, -4036, " ", $vqrange], _
		[15119, -5117, " ", $vqrange], _
		[14862, -6154, " ", $vqrange], _
		[14131, -7156, " ", $vqrange], _
		[13011, -7577, " ", $vqrange], _
		[12290, -7017, " ", $vqrange], _
		[11766, -6184, " ", $vqrange], _
		[11611, -5165, " ", $vqrange], _
		[11529, -4228, " ", $vqrange], _
		[11748, -3111, " ", $vqrange], _
		[12248, -1949, " ", $vqrange], _
		[13026, -901, " ", $vqrange], _
		[12946, 1309, " ", $vqrange], _
		[12235, 2825, " ", $vqrange], _
		[13205, 1057, " ", $vqrange], _
		[12233, -23, " ", $vqrange], _
		[11038, -747, " ", $vqrange], _
		[9707, -1383, " ", $vqrange], _
		[9344, -2384, " ", $vqrange], _
		[8046, -3291, " ", $vqrange], _
		[6913, -3307, " ", $vqrange], _
		[5761, -3102, " ", $vqrange], _
		[4563, -2729, " ", $vqrange], _
		[3350, -2435, " ", $vqrange], _
		[2513, -1535, " ", $vqrange], _
		[2037, -376, " ", $vqrange], _
		[3030, 486, " ", $vqrange], _
		[4145, 1101, " ", $vqrange], _
		[5487, 2157, " ", $vqrange], _
		[6098, 3209, " ", $vqrange], _
		[7059, 3388, " ", $vqrange], _
		[8287, 2693, " ", $vqrange], _
		[8907, 2741, " ", $vqrange], _
		[9219, 4966, " ", $vqrange], _
		[8377, 6109, " ", $vqrange], _
		[8660, 7039, " ", $vqrange], _
		[9114, 8085, " ", $vqrange], _
		[10581, 8281, " ", $vqrange], _
		[11560, 8690, " ", $vqrange], _
		[10729, 9891, " ", $vqrange], _
		[9956, 10272, " ", $vqrange], _
		[9252, 10320, " ", $vqrange], _
		[7777, 10939, " ", $vqrange], _
		[8434, 11832, " ", $vqrange], _
		[9462, 12884, " ", $vqrange], _
		[10490, 13715, " ", $vqrange], _
		[10968, 14583, " ", $vqrange], _
		[9939, 15014, " ", $vqrange], _
		[8930, 15373, " ", $vqrange], _
		[8057, 15751, " ", $vqrange], _
		[7149, 16181, " ", $vqrange], _
		[6297, 15929, " ", $vqrange], _
		[5676, 15303, " ", $vqrange], _
		[5968, 15154, " ", $vqrange], _
		[5230, 14399, " ", $vqrange], _
		[5676, 13615, " ", $vqrange], _
		[7871, 14167, " ", $vqrange], _
		[7839, 14120, " ", $vqrange], _
		[6854, 11843, " ", $vqrange], _
		[5843, 11222, " ", $vqrange], _
		[4910, 11887, " ", $vqrange], _
		[4339, 12507, " ", $vqrange], _
		[3650, 12123, " ", $vqrange], _
		[3933, 11230, " ", $vqrange], _
		[4412, 10212, " ", $vqrange], _
		[3770, 9587, " ", $vqrange], _
		[4151, 8490, " ", $vqrange], _
		[4306, 7195, " ", $vqrange], _
		[4000, 6124, " ", $vqrange], _
		[3989, 5064, " ", $vqrange], _
		[3321, 3912, " ", $vqrange], _
		[2243, 3241, " ", $vqrange], _
		[1605, 2532, " ", $vqrange], _
		[64, 1090, " ", $vqrange], _
		[-1027, 1055, " ", $vqrange], _
		[-1831, 740, " ", $vqrange], _
		[-2685, 402, " ", $vqrange], _
		[-4572, 531, " ", $vqrange], _
		[-4763, -156, " ", $vqrange], _
		[-4609, -841, " ", $vqrange], _
		[-3340, -500, " ", $vqrange], _
		[-2427, -277, " ", $vqrange], _
		[-1207, -305, " ", $vqrange], _
		[-643, -832, " ", $vqrange], _
		[123, -1857, " ", $vqrange], _
		[715, -2372, " ", $vqrange], _
		[1561, -2960, " ", $vqrange], _
		[2366, -3664, " ", $vqrange], _
		[3134, -4070, " ", $vqrange], _
		[3943, -4513, " ", $vqrange], _
		[5245, -5710, " ", $vqrange], _
		[5692, -6979, " ", $vqrange], _
		[5795, -8141, " ", $vqrange], _
		[5901, -9965, " ", $vqrange], _
		[6016, -11454, " ", $vqrange], _
		[6167, -12436, " ", $vqrange], _
		[8616, -12549, " ", $vqrange], _
		[8996, -11809, " ", $vqrange], _
		[9603, -9679, " ", $vqrange], _
		[9629, -7753, " ", $vqrange], _
		[8507, -6393, " ", $vqrange], _
		[7798, -5302, " ", $vqrange], _
		[7497, -4839, " ", $vqrange], _
		[9071, -4751, " ", $vqrange], _
		[11841, -9530, " ", $vqrange], _
		[12492, -11468, " ", $vqrange], _
		[11871, -13011, " ", $vqrange], _
		[11037, -12364, " ", $vqrange], _
		[11874, -10015, " ", $vqrange], _
		[14397, -8711, " ", $vqrange], _
		[17314, -7000, " ", $vqrange], _
		[16558, -4669, " ", $vqrange], _
		[16115, -2972, " ", $vqrange], _
		[15395, -1750, " ", $vqrange], _
		[14392, -1285, " ", $vqrange], _
		[13292, -323, " ", $vqrange], _
		[12791, 679, " ", $vqrange], _
		[12819, 1584, " ", $vqrange], _
		[12358, 2398, " ", $vqrange], _
		[10882, 3554, " ", $vqrange], _
		[8669, 4831, " ", $vqrange], _
		[8031, 5679, " ", $vqrange], _
		[7327, 7022, " ", $vqrange], _
		[6768, 8497, " ", $vqrange], _
		[7209, 9556, " ", $vqrange], _
		[7782, 10975, " ", $vqrange], _
		[8552, 12224, " ", $vqrange], _
		[9695, 13733, " ", $vqrange], _
		[10123, 14385, " ", $vqrange], _
		[10146, 14905, " ", $vqrange], _
		[12019, 16912, " ", $vqrange], _
		[13498, 17971, " ", $vqrange], _
		[14238, 18583, " ", $vqrange], _
		[14978, 18864, " ", $vqrange], _
		[16182, 18496, " ", $vqrange], _
		[18105, 17952, " ", $vqrange], _
		[19322, 18017, " ", $vqrange], _
		[19487, 17389, " ", $vqrange], _
		[19670, 15879, " ", $vqrange], _
		[19490, 14719, " ", $vqrange], _
		[17594, 14992, " ", $vqrange], _
		[16133, 15768, " ", $vqrange], _
		[16786, 14051, " ", $vqrange], _
		[15492, 11340, " ", $vqrange], _
		[15073, 9641, " ", $vqrange], _
		[14998, 8094, " ", $vqrange], _
		[14305, 6685, " ", $vqrange], _
		[13726, 5515, " ", $vqrange], _
		[12750, 6562, " ", $vqrange]]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
