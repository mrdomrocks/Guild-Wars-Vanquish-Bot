#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDiessaLowlandsTransitPath[6][2] = [ _
	[3455, -3911], _
	[6006, -4719], _
	[7851, -4522], _
	[7590, -5676], _
	[7448, -6704], _
	[7439, -6923] _
]

Func GoOutDiessaLowlands()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DiessaLowlands_Map Then Return

	If $l_i_Map = $DiessaLowlands_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("AscalonFoothills -> DiessaLowlands")
		_Vanquisher_RunAggroPortalPath($aDiessaLowlandsTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDiessaLowlands()
	If GetMapID() <> $DiessaLowlands_Map And GetMapID() <> $DiessaLowlands_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("DiessaLowlands route waiting - on map " & GetMapID() & ", need " & $DiessaLowlands_Map & " via Ascalon Foothills.")
		Return
	EndIf

	If GetMapID() = $DiessaLowlands_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutDiessaLowlands()
		If GetMapID() <> $DiessaLowlands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DiessaLowlands (" & $DiessaLowlands_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $DiessaLowlands_Map Then
		CurrentAction("DiessaLowlands route waiting - on map " & GetMapID() & ", need " & $DiessaLowlands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DiessaLowlands vanquish route.")

	Local $aWaypoints[163][4] = [ _
		[-20296, 14688, " ", $vqrange], _
		[-18526, 14753, " ", $vqrange], _
		[-17165, 11540, " ", $vqrange], _
		[-14121, 12424, " ", $vqrange], _
		[-13290, 7335, " ", $vqrange], _
		[-14121, 12424, " ", $vqrange], _
		[-9471, 14739, " ", $vqrange], _
		[-4119, 12964, " ", $vqrange], _
		[-7815, 11751, " ", $vqrange], _
		[-12062, 10422, " ", $vqrange], _
		[-11884, 8833, " ", $vqrange], _
		[-6721, 6493, " ", $vqrange], _
		[-9849, 5349, " ", $vqrange], _
		[-11770, 6007, " ", $vqrange], _
		[-9595, 5400, " ", $vqrange], _
		[-6721, 6493, " ", $vqrange], _
		[-6598, 10696, " ", $vqrange], _
		[-6721, 6493, " ", $vqrange], _
		[-7421, 3355, " ", $vqrange], _
		[-4637, 4171, " ", $vqrange], _
		[381, 7729, " ", $vqrange], _
		[2415, 9770, " ", $vqrange], _
		[5274, 8243, " ", $vqrange], _
		[6863, 10426, " ", $vqrange], _
		[8984, 15766, " ", $vqrange], _
		[3726, 14488, " ", $vqrange], _
		[8984, 15766, " ", $vqrange], _
		[10742, 15445, " ", $vqrange], _
		[10516, 14744, " ", $vqrange], _
		[11202, 15342, " ", $vqrange], _
		[14308, 15521, " ", $vqrange], _
		[14449, 12654, " ", $vqrange], _
		[9936, 11541, " ", $vqrange], _
		[7526, 9111, " ", $vqrange], _
		[7091, 7527, " ", $vqrange], _
		[7797, 4755, " ", $vqrange], _
		[9449, 3227, " ", $vqrange], _
		[10073, 2947, " ", $vqrange], _
		[9947, 773, " ", $vqrange], _
		[13410, -952, " ", $vqrange], _
		[12992, -3384, " ", $vqrange], _
		[13996, 1324, " ", $vqrange], _
		[14673, 5243, " ", $vqrange], _
		[19299, 5940, " ", $vqrange], _
		[22857, 4443, " ", $vqrange], _
		[17976, 6597, " ", $vqrange], _
		[15184, 7566, " ", $vqrange], _
		[8717, 7327, " ", $vqrange], _
		[5504, 9646, " ", $vqrange], _
		[723, 8076, " ", $vqrange], _
		[-1718, 3774, " ", $vqrange], _
		[-5510, 1030, " ", $vqrange], _
		[-3467, -2224, " ", $vqrange], _
		[-4030, -3247, " ", $vqrange], _
		[-649, -2185, " ", $vqrange], _
		[-5835, -5877, " ", $vqrange], _
		[-649, -2185, " ", $vqrange], _
		[-1386, 589, " ", $vqrange], _
		[2316, 2150, " ", $vqrange], _
		[2853, 867, " ", $vqrange], _
		[6514, 1048, " ", $vqrange], _
		[8840, -4058, " ", $vqrange], _
		[9238, -7447, " ", $vqrange], _
		[9690, -7831, " ", $vqrange], _
		[10828, -10741, " ", $vqrange], _
		[11546, -10190, " ", $vqrange], _
		[10177, -8109, " ", $vqrange], _
		[14517, -6115, " ", $vqrange], _
		[18276, -6046, " ", $vqrange], _
		[22121, -7474, " ", $vqrange], _
		[22721, -7921, " ", $vqrange], _
		[21979, -8612, " ", $vqrange], _
		[21982, -11599, " ", $vqrange], _
		[19543, -12982, " ", $vqrange], _
		[16172, -10242, " ", $vqrange], _
		[13003, -11708, " ", $vqrange], _
		[14384, -12971, " ", $vqrange], _
		[12117, -13427, " ", $vqrange], _
		[11657, -14108, " ", $vqrange], _
		[10415, -14069, " ", $vqrange], _
		[9686, -14026, " ", $vqrange], _
		[10392, -15363, " ", $vqrange], _
		[9215, -11545, " ", $vqrange], _
		[6960, -13619, " ", $vqrange], _
		[7632, -15429, " ", $vqrange], _
		[3012, -13708, " ", $vqrange], _
		[1205, -11994, " ", $vqrange], _
		[1977, -9505, " ", $vqrange], _
		[1660, -11367, " ", $vqrange], _
		[375, -9513, " ", $vqrange], _
		[-874, -9269, " ", $vqrange], _
		[-969, -10403, " ", $vqrange], _
		[-907, -9256, " ", $vqrange], _
		[372, -9381, " ", $vqrange], _
		[562, -6169, " ", $vqrange], _
		[-1218, -5715, " ", $vqrange], _
		[4, -6623, " ", $vqrange], _
		[-946, -7541, " ", $vqrange], _
		[-1545, -8141, " ", $vqrange], _
		[-3883, -10860, " ", $vqrange], _
		[-3743, -12348, " ", $vqrange], _
		[-5564, -10602, " ", $vqrange], _
		[-4465, -11283, " ", $vqrange], _
		[-5140, -11862, " ", $vqrange], _
		[-5518, -12196, " ", $vqrange], _
		[-5168, -11824, " ", $vqrange], _
		[-4608, -11235, " ", $vqrange], _
		[-4080, -10665, " ", $vqrange], _
		[-1554, -8099, " ", $vqrange], _
		[-926, -7547, " ", $vqrange], _
		[49, -6636, " ", $vqrange], _
		[-3086, -5833, " ", $vqrange], _
		[-4748, -6263, " ", $vqrange], _
		[-5078, -8220, " ", $vqrange], _
		[-7387, -9441, " ", $vqrange], _
		[-10436, -7893, " ", $vqrange], _
		[-10952, -2549, " ", $vqrange], _
		[-11594, -5076, " ", $vqrange], _
		[-10704, -654, " ", $vqrange], _
		[-8724, 1194, " ", $vqrange], _
		[-12003, 2853, " ", $vqrange], _
		[-15387, 5000, " ", $vqrange], _
		[-16970, 7484, " ", $vqrange], _
		[-20811, 6247, " ", $vqrange], _
		[-21623, 7860, " ", $vqrange], _
		[-20785, 4566, " ", $vqrange], _
		[-20839, 6443, " ", $vqrange], _
		[-16351, 3466, " ", $vqrange], _
		[-16654, 3056, " ", $vqrange], _
		[-17255, 1909, " ", $vqrange], _
		[-14099, 126, " ", $vqrange], _
		[-15058, -3831, " ", $vqrange], _
		[-13613, -6649, " ", $vqrange], _
		[-11822, -11488, " ", $vqrange], _
		[-11355, -13208, " ", $vqrange], _
		[-12101, -14362, " ", $vqrange], _
		[-15051, -12087, " ", $vqrange], _
		[-16718, -13141, " ", $vqrange], _
		[-21415, -15163, " ", $vqrange], _
		[-16851, -13219, " ", $vqrange], _
		[-15683, -9290, " ", $vqrange], _
		[-15618, -7314, " ", $vqrange], _
		[-16636, -10085, " ", $vqrange], _
		[-17011, -12736, " ", $vqrange], _
		[-18893, -10169, " ", $vqrange], _
		[-19030, -9687, " ", $vqrange], _
		[-19030, -8796, " ", $vqrange], _
		[-19264, -8224, " ", $vqrange], _
		[-22397, -7208, " ", $vqrange], _
		[-19584, -6681, " ", $vqrange], _
		[-19614, -5775, " ", $vqrange], _
		[-19577, -5056, " ", $vqrange], _
		[-19905, -4869, " ", $vqrange], _
		[-21049, -4735, " ", $vqrange], _
		[-20808, -4163, " ", $vqrange], _
		[-19923, -4221, " ", $vqrange], _
		[-20710, -3629, " ", $vqrange], _
		[-20710, -2709, " ", $vqrange], _
		[-17794, -3038, " ", $vqrange], _
		[-19195, -738, " ", $vqrange], _
		[-19961, 1863, " ", $vqrange], _
		[-16989, 1528, " ", $vqrange], _
		[-16992, -553, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
