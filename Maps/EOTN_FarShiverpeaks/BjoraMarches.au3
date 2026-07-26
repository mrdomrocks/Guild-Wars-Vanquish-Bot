;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutBjoraMarches()
	; Outpost exit not yet mapped - placeholder coords
	MoveTo(1683, -1594)
	Move(4600, -27863)
	WaitForLoad()
EndFunc

Func VQBjoraMarches()
	If GetMapID() <> $BjoraMarches_Map And GetMapID() <> $BjoraMarches_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Bjora Marches.")
		TravelTo($BjoraMarches_Outpost)
	EndIf

	If GetMapID() = $BjoraMarches_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $BjoraMarches_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Bjora Marches (" & $BjoraMarches_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $BjoraMarches_Map Then
		CurrentAction("Bjora Marches route waiting - on map " & GetMapID() & ", need " & $BjoraMarches_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Bjora Marches vanquish route.")

	Local $aWaypoints[190][4] = [ _
		[17810, -17649, " ", $vqrange], _
		[17879, -18364, "shrine", $vqrange], _
		[19015, -16099, " ", $vqrange], _
		[18859, -14352, " ", $vqrange], _
		[17184, -12445, " ", $vqrange], _
		[15648, -10453, " ", $vqrange], _
		[14253, -8347, " ", $vqrange], _
		[16842, -7971, " ", $vqrange], _
		[17420, -7558, " ", $vqrange], _
		[14851, -7431, " ", $vqrange], _
		[13668, -5112, " ", $vqrange], _
		[11523, -3667, " ", $vqrange], _
		[9009, -3705, " ", $vqrange], _
		[7157, -5593, " ", $vqrange], _
		[4587, -5811, " ", $vqrange], _
		[3921, -8230, " ", $vqrange], _
		[3987, -10834, " ", $vqrange], _
		[3636, -13355, " ", $vqrange], _
		[6107, -13771, " ", $vqrange], _
		[8459, -12824, " ", $vqrange], _
		[10260, -14679, " ", $vqrange], _
		[12817, -15292, " ", $vqrange], _
		[15065, -16661, " ", $vqrange], _
		[15817, -14263, " ", $vqrange], _
		[13263, -14558, " ", $vqrange], _
		[11787, -12510, " ", $vqrange], _
		[10171, -10492, " ", $vqrange], _
		[11901, -8672, " ", $vqrange], _
		[9384, -8186, " ", $vqrange], _
		[10047, -5686, " ", $vqrange], _
		[11236, -3436, " ", $vqrange], _
		[13044, -3456, " ", $vqrange], _
		[12251, -942, " ", $vqrange], _
		[13462, 1257, " ", $vqrange], _
		[14306, 2098, "shrine", $vqrange], _
		[12598, 4069, " ", $vqrange], _
		[13790, 1727, " ", $vqrange], _
		[15094, -481, " ", $vqrange], _
		[16855, -2365, " ", $vqrange], _
		[17843, -10, " ", $vqrange], _
		[17965, 2575, " ", $vqrange], _
		[17465, 5066, " ", $vqrange], _
		[16261, 3323, " ", $vqrange], _
		[14073, 4633, " ", $vqrange], _
		[15997, 6351, " ", $vqrange], _
		[18060, 7960, " ", $vqrange], _
		[18288, 10450, " ", $vqrange], _
		[15826, 9892, " ", $vqrange], _
		[13735, 8471, " ", $vqrange], _
		[11791, 6892, " ", $vqrange], _
		[9925, 5017, " ", $vqrange], _
		[7425, 4979, " ", $vqrange], _
		[4888, 4455, " ", $vqrange], _
		[3872, 6745, " ", $vqrange], _
		[3840, 9300, " ", $vqrange], _
		[4542, 11742, " ", $vqrange], _
		[4721, 14265, " ", $vqrange], _
		[6699, 12702, " ", $vqrange], _
		[8696, 14286, " ", $vqrange], _
		[10134, 16353, " ", $vqrange], _
		[8167, 18071, " ", $vqrange], _
		[5739, 18773, " ", $vqrange], _
		[3224, 18876, " ", $vqrange], _
		[4026, 18124, "shrine", $vqrange], _
		[1526, 18759, " ", $vqrange], _
		[-1060, 18928, " ", $vqrange], _
		[-2880, 17145, " ", $vqrange], _
		[-449, 16100, " ", $vqrange], _
		[1695, 14732, " ", $vqrange], _
		[1958, 12123, " ", $vqrange], _
		[114, 10322, " ", $vqrange], _
		[-472, 9759, "shrine", $vqrange], _
		[1657, 8267, " ", $vqrange], _
		[2361, 5835, " ", $vqrange], _
		[3506, 3552, " ", $vqrange], _
		[2518, 1245, " ", $vqrange], _
		[3329, -1216, " ", $vqrange], _
		[3757, -3788, " ", $vqrange], _
		[2746, -6198, " ", $vqrange], _
		[2687, -8717, " ", $vqrange], _
		[4036, -10976, " ", $vqrange], _
		[3820, -13493, " ", $vqrange], _
		[1896, -15130, " ", $vqrange], _
		[-680, -14842, " ", $vqrange], _
		[-3178, -15561, " ", $vqrange], _
		[-3760, -17418, " ", $vqrange], _
		[-1236, -17828, " ", $vqrange], _
		[1329, -18307, " ", $vqrange], _
		[3868, -18549, " ", $vqrange], _
		[1377, -18300, " ", $vqrange], _
		[-1119, -17790, " ", $vqrange], _
		[-3638, -17568, " ", $vqrange], _
		[-6018, -16549, " ", $vqrange], _
		[-8572, -16426, " ", $vqrange], _
		[-11079, -16847, " ", $vqrange], _
		[-13013, -18589, " ", $vqrange], _
		[-14110, -18859, "shrine", $vqrange], _
		[-16295, -17516, " ", $vqrange], _
		[-18260, -19144, " ", $vqrange], _
		[-16156, -17581, " ", $vqrange], _
		[-14427, -15763, " ", $vqrange], _
		[-16126, -13803, " ", $vqrange], _
		[-17746, -11827, " ", $vqrange], _
		[-15764, -10117, " ", $vqrange], _
		[-15613, -7524, " ", $vqrange], _
		[-13692, -5810, " ", $vqrange], _
		[-11529, -7303, " ", $vqrange], _
		[-9198, -8513, " ", $vqrange], _
		[-8188, -10808, " ", $vqrange], _
		[-6166, -12307, " ", $vqrange], _
		[-8559, -13245, " ", $vqrange], _
		[-6601, -11612, " ", $vqrange], _
		[-4376, -10407, " ", $vqrange], _
		[-2625, -8547, " ", $vqrange], _
		[-1940, -7281, "shrine", $vqrange], _
		[-119, -5523, " ", $vqrange], _
		[373, -3069, " ", $vqrange], _
		[-1847, -1893, " ", $vqrange], _
		[-4406, -1958, " ", $vqrange], _
		[-6909, -2484, " ", $vqrange], _
		[-9521, -2362, " ", $vqrange], _
		[-12174, -2323, " ", $vqrange], _
		[-14479, -1176, " ", $vqrange], _
		[-13606, -3601, " ", $vqrange], _
		[-12597, -5907, " ", $vqrange], _
		[-12382, -3319, " ", $vqrange], _
		[-13742, -1089, " ", $vqrange], _
		[-16212, -257, " ", $vqrange], _
		[-18754, -178, " ", $vqrange], _
		[-18669, 2361, " ", $vqrange], _
		[-17157, 4405, "shrine", $vqrange], _
		[-18145, 6836, " ", $vqrange], _
		[-17102, 9234, " ", $vqrange], _
		[-15860, 6981, " ", $vqrange], _
		[-13267, 7333, " ", $vqrange], _
		[-11211, 5722, " ", $vqrange], _
		[-11892, 3292, " ", $vqrange], _
		[-12611, 759, " ", $vqrange], _
		[-11002, -1233, " ", $vqrange], _
		[-11641, 1285, " ", $vqrange], _
		[-12744, 3590, " ", $vqrange], _
		[-13796, 6029, " ", $vqrange], _
		[-14716, 8450, " ", $vqrange], _
		[-14488, 11031, " ", $vqrange], _
		[-13803, 13448, " ", $vqrange], _
		[-12411, 15650, " ", $vqrange], _
		[-10869, 17704, " ", $vqrange], _
		[-8362, 18030, " ", $vqrange], _
		[-8931, 16272, "shrine", $vqrange], _
		[-9769, 16467, " ", $vqrange], _
		[-7936, 14760, " ", $vqrange], _
		[-5593, 15755, " ", $vqrange], _
		[-3107, 16279, " ", $vqrange], _
		[-5144, 14780, " ", $vqrange], _
		[-6896, 12916, " ", $vqrange], _
		[-8850, 11276, " ", $vqrange], _
		[-11326, 12111, " ", $vqrange], _
		[-12343, 9752, " ", $vqrange], _
		[-14044, 7814, " ", $vqrange], _
		[-12246, 6010, " ", $vqrange], _
		[-9940, 4967, " ", $vqrange], _
		[-7619, 5896, " ", $vqrange], _
		[-5945, 7833, " ", $vqrange], _
		[-4200, 9710, " ", $vqrange], _
		[-3438, 7198, " ", $vqrange], _
		[-3922, 9741, " ", $vqrange], _
		[-2104, 11546, " ", $vqrange], _
		[340, 12202, " ", $vqrange], _
		[543, 9572, " ", $vqrange], _
		[1254, 7049, " ", $vqrange], _
		[-930, 5725, " ", $vqrange], _
		[-2800, 3924, " ", $vqrange], _
		[-4797, 2324, " ", $vqrange], _
		[-6614, 4095, " ", $vqrange], _
		[-4951, 2057, " ", $vqrange], _
		[-3106, 270, " ", $vqrange], _
		[-1181, -1441, " ", $vqrange], _
		[1207, -519, " ", $vqrange], _
		[3733, -530, " ", $vqrange], _
		[5918, 703, " ", $vqrange], _
		[6292, 3175, " ", $vqrange], _
		[6125, 5711, " ", $vqrange], _
		[5374, 8198, " ", $vqrange], _
		[5534, 10758, " ", $vqrange], _
		[7818, 11953, " ", $vqrange], _
		[10358, 11804, " ", $vqrange], _
		[12268, 10177, " ", $vqrange], _
		[12496, 7597, " ", $vqrange], _
		[12184, 5074, " ", $vqrange], _
		[13609, 3001, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
