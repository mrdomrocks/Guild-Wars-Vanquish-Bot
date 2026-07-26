#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aSilverwoodOutpostPath[2][2] = [ _
	[1550.63, -2982.15], _
	[2013, -2216] _
]

Func GoOutSilverwood()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $Silverwood_Map Then Return

	If $l_i_Map = $Silverwood_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> Silverwood (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSilverwoodOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQSilverwood()
	If GetMapID() <> $Silverwood_Map And GetMapID() <> $Silverwood_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Silverwood.")
		TravelTo($Silverwood_Outpost)
	EndIf

	If GetMapID() = $Silverwood_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutSilverwood()
		If GetMapID() <> $Silverwood_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Silverwood (" & $Silverwood_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $Silverwood_Map Then
		CurrentAction("Silverwood route waiting - on map " & GetMapID() & ", need " & $Silverwood_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Silverwood vanquish route.")

	Local $aWaypoints[148][4] = [ _
		[-2757, 501, " ", $vqrange], _
		[-2903, -3617, " ", $vqrange], _
		[-4795, -6935, " ", $vqrange], _
		[-7371, -10702, " ", $vqrange], _
		[-5747, -12264, " ", $vqrange], _
		[-6208, -15226, " ", $vqrange], _
		[-6164, -11047, " ", $vqrange], _
		[-8483, -10903, " ", $vqrange], _
		[-9636, -12743, " ", $vqrange], _
		[-11891, -13144, " ", $vqrange], _
		[-14613, -12089, " ", $vqrange], _
		[-13544, -13411, " ", $vqrange], _
		[-14362, -15210, " ", $vqrange], _
		[-15789, -18051, " ", $vqrange], _
		[-11465, -18768, " ", $vqrange], _
		[-17011, -16322, " ", $vqrange], _
		[-16831, -12940, " ", $vqrange], _
		[-15204, -11188, " ", $vqrange], _
		[-18034, -11150, " ", $vqrange], _
		[-19028, -7227, " ", $vqrange], _
		[-17516, -2759, " ", $vqrange], _
		[-19317, -3047, " ", $vqrange], _
		[-18164, -1486, " ", $vqrange], _
		[-16436, -363, " ", $vqrange], _
		[-15428, -914, " ", $vqrange], _
		[-17689, 731, " ", $vqrange], _
		[-18196, -479, " ", $vqrange], _
		[-19182, 2602, " ", $vqrange], _
		[-19174, 4802, " ", $vqrange], _
		[-18912, 6912, " ", $vqrange], _
		[-14687, 6308, " ", $vqrange], _
		[-11971, 5525, " ", $vqrange], _
		[-10953, 4435, " ", $vqrange], _
		[-12700, 3210, " ", $vqrange], _
		[-13150, 4201, " ", $vqrange], _
		[-12862, 2634, " ", $vqrange], _
		[-10935, 3427, " ", $vqrange], _
		[-9405, 2166, " ", $vqrange], _
		[-9945, 3967, " ", $vqrange], _
		[-8056, 4519, " ", $vqrange], _
		[-11043, 6217, " ", $vqrange], _
		[-8073, 6456, " ", $vqrange], _
		[-4796, 3881, " ", $vqrange], _
		[-5859, 2243, " ", $vqrange], _
		[-4544, 3575, " ", $vqrange], _
		[-7406, 8115, " ", $vqrange], _
		[-7407, 11873, " ", $vqrange], _
		[-7687, 14077, " ", $vqrange], _
		[-9170, 17147, " ", $vqrange], _
		[-10993, 17773, " ", $vqrange], _
		[-9032, 18060, " ", $vqrange], _
		[-7991, 19017, " ", $vqrange], _
		[-6210, 18656, " ", $vqrange], _
		[-2933, 16431, " ", $vqrange], _
		[-1921, 16278, " ", $vqrange], _
		[-981, 15568, " ", $vqrange], _
		[-1983, 11990, " ", $vqrange], _
		[42, 13077, " ", $vqrange], _
		[887, 9194, " ", $vqrange], _
		[-1149, 8467, " ", $vqrange], _
		[-3101, 8985, " ", $vqrange], _
		[987, 7107, " ", $vqrange], _
		[320, 8260, " ", $vqrange], _
		[1845, 8632, " ", $vqrange], _
		[798, 5839, " ", $vqrange], _
		[194, 3758, " ", $vqrange], _
		[-604, 4290, " ", $vqrange], _
		[-167, 6659, " ", $vqrange], _
		[-1520, 3507, " ", $vqrange], _
		[-5984, 231, " ", $vqrange], _
		[-6754, -3149, " ", $vqrange], _
		[-8462, -3748, " ", $vqrange], _
		[-9741, -2158, " ", $vqrange], _
		[-9349, -4002, " ", $vqrange], _
		[-10389, -4210, " ", $vqrange], _
		[-10700, -6334, " ", $vqrange], _
		[-12656, -7219, " ", $vqrange], _
		[-12620, -4968, " ", $vqrange], _
		[-13268, -5598, " ", $vqrange], _
		[-13645, -4216, " ", $vqrange], _
		[-17013, -1439, " ", $vqrange], _
		[-13664, -4158, " ", $vqrange], _
		[-13863, -6913, " ", $vqrange], _
		[-12944, -7759, " ", $vqrange], _
		[-13881, -7885, " ", $vqrange], _
		[-14751, -5176, " ", $vqrange], _
		[-11238, -4407, " ", $vqrange], _
		[-7076, -3100, " ", $vqrange], _
		[-3541, 1887, " ", $vqrange], _
		[-236, 3252, " ", $vqrange], _
		[-102, 1540, " ", $vqrange], _
		[-1115, 415, " ", $vqrange], _
		[1220, 528, " ", $vqrange], _
		[4279, -2154, " ", $vqrange], _
		[5478, -7439, " ", $vqrange], _
		[6450, -4745, " ", $vqrange], _
		[7977, -3132, " ", $vqrange], _
		[9543, -5518, " ", $vqrange], _
		[9660, -10107, " ", $vqrange], _
		[15118, -11598, " ", $vqrange], _
		[10391, -10641, " ", $vqrange], _
		[6523, -12806, " ", $vqrange], _
		[5181, -12174, " ", $vqrange], _
		[4057, -12880, " ", $vqrange], _
		[4336, -14643, " ", $vqrange], _
		[1693, -13790, " ", $vqrange], _
		[-2145, -15914, " ", $vqrange], _
		[-5836, -16844, " ", $vqrange], _
		[-3738, -12534, " ", $vqrange], _
		[45, -9619, " ", $vqrange], _
		[5286, -11719, " ", $vqrange], _
		[5243, -9486, " ", $vqrange], _
		[5286, -11719, " ", $vqrange], _
		[10356, -11229, " ", $vqrange], _
		[11329, -13375, " ", $vqrange], _
		[11842, -15102, " ", $vqrange], _
		[9118, -15192, " ", $vqrange], _
		[8826, -14404, " ", $vqrange], _
		[6193, -14742, " ", $vqrange], _
		[8736, -16047, " ", $vqrange], _
		[12810, -14854, " ", $vqrange], _
		[13874, -13985, " ", $vqrange], _
		[16884, -10989, " ", $vqrange], _
		[16284, -7218, " ", $vqrange], _
		[18406, -8076, " ", $vqrange], _
		[14762, -6435, " ", $vqrange], _
		[14135, -3782, " ", $vqrange], _
		[18692, -2488, " ", $vqrange], _
		[13966, -2460, " ", $vqrange], _
		[13826, -1555, " ", $vqrange], _
		[17089, -1419, " ", $vqrange], _
		[19015, 829, " ", $vqrange], _
		[14203, -1391, " ", $vqrange], _
		[11414, 1392, " ", $vqrange], _
		[9499, 565, " ", $vqrange], _
		[6453, 2553, " ", $vqrange], _
		[3358, 612, " ", $vqrange], _
		[5890, 2806, " ", $vqrange], _
		[7977, 7223, " ", $vqrange], _
		[6501, 11175, " ", $vqrange], _
		[6385, 12915, " ", $vqrange], _
		[6375, 15198, " ", $vqrange], _
		[10848, 15630, " ", $vqrange], _
		[13107, 16784, " ", $vqrange], _
		[8819, 15381, " ", $vqrange], _
		[4509, 17446, " ", $vqrange], _
		[3072, 16588, " ", $vqrange], _
		[162, 18220, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

