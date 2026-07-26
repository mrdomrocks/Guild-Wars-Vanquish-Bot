#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheScarOutpostPath[2][2] = [ _
	[12727, 12865], _
	[12985, 13488] _
]

Func GoOutTheScar()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TheScar_Map Then Return

	If $l_i_Map = $TheScar_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TheScar (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTheScarOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTheScar()
	If GetMapID() <> $TheScar_Map And GetMapID() <> $TheScar_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TheScar.")
		TravelTo($TheScar_Outpost)
	EndIf

	If GetMapID() = $TheScar_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheScar()
		If GetMapID() <> $TheScar_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheScar (" & $TheScar_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TheScar_Map Then
		CurrentAction("TheScar route waiting - on map " & GetMapID() & ", need " & $TheScar_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheScar vanquish route.")

	Local $aWaypoints[179][4] = [ _
		[16467, -22599, " ", $vqrange], _
		[14152, -20263, " ", $vqrange], _
		[13145, -21555, " ", $vqrange], _
		[11231, -20232, " ", $vqrange], _
		[12512, -18848, " ", $vqrange], _
		[11612, -15182, " ", $vqrange], _
		[8990, -16148, " ", $vqrange], _
		[6747, -19964, " ", $vqrange], _
		[4034, -19101, " ", $vqrange], _
		[4218, -15945, " ", $vqrange], _
		[4694, -12973, " ", $vqrange], _
		[1197, -10979, " ", $vqrange], _
		[-922, -8911, " ", $vqrange], _
		[-1728, -6611, " ", $vqrange], _
		[-497, -1580, " ", $vqrange], _
		[-687, 2454, " ", $vqrange], _
		[324, 4629, " ", $vqrange], _
		[-699, 2799, " ", $vqrange], _
		[-862, 6666, " ", $vqrange], _
		[-3420, 8107, " ", $vqrange], _
		[-5809, 7900, " ", $vqrange], _
		[-8213, 10075, " ", $vqrange], _
		[-6873, 10373, " ", $vqrange], _
		[-4323, 11008, " ", $vqrange], _
		[-3375, 8055, " ", $vqrange], _
		[-687, 8500, " ", $vqrange], _
		[1715, 8737, " ", $vqrange], _
		[2700, 11987, " ", $vqrange], _
		[3533, 14576, " ", $vqrange], _
		[2847, 12282, " ", $vqrange], _
		[2769, 12062, " ", $vqrange], _
		[2701, 11867, " ", $vqrange], _
		[1818, 11040, " ", $vqrange], _
		[1930, 8807, " ", $vqrange], _
		[-417, 8577, " ", $vqrange], _
		[-2467, 6467, " ", $vqrange], _
		[-2400, 4081, " ", $vqrange], _
		[-7121, 2145, " ", $vqrange], _
		[-8300, -722, " ", $vqrange], _
		[-5149, -1900, " ", $vqrange], _
		[-7331, -2633, " ", $vqrange], _
		[-7879, -1770, " ", $vqrange], _
		[-7173, 2071, " ", $vqrange], _
		[-4065, 2164, " ", $vqrange], _
		[-2442, 4108, " ", $vqrange], _
		[-2452, 6372, " ", $vqrange], _
		[-1646, 7496, " ", $vqrange], _
		[607, 5285, " ", $vqrange], _
		[709, 4958, " ", $vqrange], _
		[4350, 2714, " ", $vqrange], _
		[1157, 1113, " ", $vqrange], _
		[4405, -3943, " ", $vqrange], _
		[3037, -1661, " ", $vqrange], _
		[4250, 2367, " ", $vqrange], _
		[2786, 4450, " ", $vqrange], _
		[3301, 5166, " ", $vqrange], _
		[5253, 3560, " ", $vqrange], _
		[6242, 1658, " ", $vqrange], _
		[8863, 2247, " ", $vqrange], _
		[10088, -371, " ", $vqrange], _
		[8307, -446, " ", $vqrange], _
		[6616, -1110, " ", $vqrange], _
		[5704, -159, " ", $vqrange], _
		[8885, -2713, " ", $vqrange], _
		[4176, -6681, " ", $vqrange], _
		[2888, -6951, " ", $vqrange], _
		[-94, -6427, " ", $vqrange], _
		[-1830, -6887, " ", $vqrange], _
		[-964, -8041, " ", $vqrange], _
		[932, -10830, " ", $vqrange], _
		[4620, -12917, " ", $vqrange], _
		[4039, -18829, " ", $vqrange], _
		[6099, -20119, " ", $vqrange], _
		[7650, -18672, " ", $vqrange], _
		[11857, -15339, " ", $vqrange], _
		[15097, -14795, " ", $vqrange], _
		[15926, -13534, " ", $vqrange], _
		[10515, -14639, " ", $vqrange], _
		[8863, -14144, " ", $vqrange], _
		[5817, -16874, " ", $vqrange], _
		[7489, -13794, " ", $vqrange], _
		[5589, -12165, " ", $vqrange], _
		[7533, -9457, " ", $vqrange], _
		[10035, -12827, " ", $vqrange], _
		[13958, -12658, " ", $vqrange], _
		[14821, -9793, " ", $vqrange], _
		[12957, -10922, " ", $vqrange], _
		[13939, -8500, " ", $vqrange], _
		[10641, -10695, " ", $vqrange], _
		[12466, -7550, " ", $vqrange], _
		[11388, -2988, " ", $vqrange], _
		[12993, -1045, " ", $vqrange], _
		[14197, -984, " ", $vqrange], _
		[11643, -2277, " ", $vqrange], _
		[10011, -4653, " ", $vqrange], _
		[8375, -5828, " ", $vqrange], _
		[6403, -6835, " ", $vqrange], _
		[2172, -9157, " ", $vqrange], _
		[442, -8219, " ", $vqrange], _
		[278, -8246, " ", $vqrange], _
		[-2299, -8756, " ", $vqrange], _
		[-4380, -7083, " ", $vqrange], _
		[-2597, -4719, " ", $vqrange], _
		[-4401, -7237, " ", $vqrange], _
		[-4321, -10261, " ", $vqrange], _
		[-6089, -14631, " ", $vqrange], _
		[-7054, -13463, " ", $vqrange], _
		[-9279, -13971, " ", $vqrange], _
		[-6851, -13849, " ", $vqrange], _
		[-6196, -14848, " ", $vqrange], _
		[-7564, -16981, " ", $vqrange], _
		[-11085, -17855, " ", $vqrange], _
		[-12529, -16285, " ", $vqrange], _
		[-12722, -15394, " ", $vqrange], _
		[-15384, -11529, " ", $vqrange], _
		[-16681, -12006, " ", $vqrange], _
		[-15465, -11309, " ", $vqrange], _
		[-13573, -12173, " ", $vqrange], _
		[-12755, -11086, " ", $vqrange], _
		[-13867, -8160, " ", $vqrange], _
		[-14812, -6726, " ", $vqrange], _
		[-13611, -4196, " ", $vqrange], _
		[-11760, -3764, " ", $vqrange], _
		[-16793, -4595, " ", $vqrange], _
		[-18076, -2238, " ", $vqrange], _
		[-14976, -863, " ", $vqrange], _
		[-12261, 2444, " ", $vqrange], _
		[-8517, 6176, " ", $vqrange], _
		[-13429, 7899, " ", $vqrange], _
		[-15780, 7750, " ", $vqrange], _
		[-12768, 11001, " ", $vqrange], _
		[-15269, 14283, " ", $vqrange], _
		[-14020, 14778, " ", $vqrange], _
		[-13067, 13888, " ", $vqrange], _
		[-10222, 15115, " ", $vqrange], _
		[-12322, 17257, " ", $vqrange], _
		[-10924, 20844, " ", $vqrange], _
		[-9735, 22439, " ", $vqrange], _
		[-8630, 22841, " ", $vqrange], _
		[-8258, 20113, " ", $vqrange], _
		[-4006, 20250, " ", $vqrange], _
		[-5730, 17479, " ", $vqrange], _
		[-2982, 16442, " ", $vqrange], _
		[-3051, 19900, " ", $vqrange], _
		[-2338, 16226, " ", $vqrange], _
		[-1189, 15201, " ", $vqrange], _
		[1005, 13180, " ", $vqrange], _
		[-1486, 18228, " ", $vqrange], _
		[-1508, 20140, " ", $vqrange], _
		[970, 21124, " ", $vqrange], _
		[4052, 20006, " ", $vqrange], _
		[6025, 20551, " ", $vqrange], _
		[11346, 15651, " ", $vqrange], _
		[7443, 12714, " ", $vqrange], _
		[10784, 10544, " ", $vqrange], _
		[10033, 9116, " ", $vqrange], _
		[5685, 6359, " ", $vqrange], _
		[11011, 10214, " ", $vqrange], _
		[11917, 11947, " ", $vqrange], _
		[13172, 15557, " ", $vqrange], _
		[13129, 11962, " ", $vqrange], _
		[13703, 8602, " ", $vqrange], _
		[12536, 6560, " ", $vqrange], _
		[10479, 6910, " ", $vqrange], _
		[9783, 4256, " ", $vqrange], _
		[11017, 2497, " ", $vqrange], _
		[13126, 834, " ", $vqrange], _
		[15449, 45, " ", $vqrange], _
		[15806, -1812, " ", $vqrange], _
		[14581, -3012, " ", $vqrange], _
		[15198, -6494, " ", $vqrange], _
		[14730, -2886, " ", $vqrange], _
		[16119, -1457, " ", $vqrange], _
		[15476, 268, " ", $vqrange], _
		[12509, 1358, " ", $vqrange], _
		[12639, 2432, " ", $vqrange], _
		[14256, 5243, " ", $vqrange], _
		[17624, -952, " ", $vqrange], _
		[16338, -2840, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

