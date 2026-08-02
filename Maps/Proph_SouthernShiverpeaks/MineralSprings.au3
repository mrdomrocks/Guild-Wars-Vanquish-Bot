Global $vqrange = 1450
Global $ActionCounter = 1

Global $aMineralSpringsOutpostPath[2][2] = [ _
	[-10030, 18833], _
	[-9797, 19027] _
]

Global $aMineralSpringsTransitPath[11][2] = [ _
	[-7118, 20976], _
	[-3362, 18610], _
	[-105, 17184], _
	[724, 18845], _
	[2189, 21211], _
	[5084, 21288], _
	[5798, 22956], _
	[4675, 25495], _
	[5365, 28339], _
	[7667, 29462], _
	[8091, 29696] _
]

Global $aProph_SouthernShiverpeaks_MineralSpringsRoute01[59][2] = [ _
        [-20810, -9703], _
        [-20491, -8464], _
        [-21304, -6247], _
        [-23562, -3417], _
        [-25001, -969], _
        [-22884, 2132], _
        [-20113, 3695], _
        [-20819, 7548], _
        [-19891, 9390], _
        [-18019, 9974], _
        [-13637, 7228], _
        [-9288, 8710], _
        [-7586, 9053], _
        [-6105, 9617], _
        [-6418, 8273], _
        [-5604, 6442], _
        [-3798, 6573], _
        [-2869, 6065], _
        [1025, 6810], _
        [2201, 8670], _
        [1276, 6274], _
        [2674, 3722], _
        [6881, 4780], _
        [13620, 8349], _
        [15268, 10083], _
        [21202, 8874], _
        [23496, 8276], _
        [24995, 6613], _
        [23905, 3561], _
        [20973, -111], _
        [21640, -1502], _
        [21614, 1213], _
        [23897, 3479], _
        [24284, 8839], _
        [19116, 9301], _
        [14524, 9843], _
        [16698, 3473], _
        [15028, -953], _
        [15773, -6569], _
        [14257, -9540], _
        [11862, -7931], _
        [8478, -7524], _
        [7039, -7508], _
        [7748, -5073], _
        [4231, -1503], _
        [117, -3343], _
        [507, -4867], _
        [-317, -7732], _
        [-3775, -7538], _
        [-4543, -4760], _
        [-5240, -2413], _
        [-11180, 1656], _
        [-13070, 227], _
        [-14841, -910], _
        [-13000, -373], _
        [-11325, -3876], _
        [-9344, -9444], _
        [-13723, -10548], _
        [-17905, -8309] _
]

Global $aProph_SouthernShiverpeaks_MineralSpringsRoute02[59][2] = [ _
        [-17905, -8309], _
        [-13723, -10548], _
        [-9344, -9444], _
        [-11325, -3876], _
        [-13000, -373], _
        [-14841, -910], _
        [-13070, 227], _
        [-11180, 1656], _
        [-5240, -2413], _
        [-4543, -4760], _
        [-3775, -7538], _
        [-317, -7732], _
        [507, -4867], _
        [117, -3343], _
        [4231, -1503], _
        [7748, -5073], _
        [7039, -7508], _
        [8478, -7524], _
        [11862, -7931], _
        [14257, -9540], _
        [15773, -6569], _
        [15028, -953], _
        [16698, 3473], _
        [14524, 9843], _
        [19116, 9301], _
        [24284, 8839], _
        [23897, 3479], _
        [21614, 1213], _
        [21640, -1502], _
        [20973, -111], _
        [23905, 3561], _
        [24995, 6613], _
        [23496, 8276], _
        [21202, 8874], _
        [15268, 10083], _
        [13620, 8349], _
        [6881, 4780], _
        [2674, 3722], _
        [1276, 6274], _
        [2201, 8670], _
        [1025, 6810], _
        [-2869, 6065], _
        [-3798, 6573], _
        [-5604, 6442], _
        [-6418, 8273], _
        [-6105, 9617], _
        [-7586, 9053], _
        [-9288, 8710], _
        [-13637, 7228], _
        [-18019, 9974], _
        [-19891, 9390], _
        [-20819, 7548], _
        [-20113, 3695], _
        [-22884, 2132], _
        [-25001, -969], _
        [-23562, -3417], _
        [-21304, -6247], _
        [-20491, -8464], _
        [-20810, -9703] _
]

Func GoOutMineralSprings()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $MineralSprings_Map Then Return

	If $l_i_Map = $MineralSprings_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MineralSprings (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMineralSpringsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MineralSprings_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MineralSprings (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMineralSpringsTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQMineralSprings()
	If GetMapID() <> $MineralSprings_Map And GetMapID() <> $MineralSprings_Outpost And GetMapID() <> $MineralSprings_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MineralSprings.")
		TravelTo($MineralSprings_Outpost)
	EndIf

	If GetMapID() = $MineralSprings_Outpost Or GetMapID() = $MineralSprings_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutMineralSprings()
		If GetMapID() <> $MineralSprings_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MineralSprings (" & $MineralSprings_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $MineralSprings_Map Then
		CurrentAction("MineralSprings route waiting - on map " & GetMapID() & ", need " & $MineralSprings_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MineralSprings vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_MineralSpringsRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_MineralSpringsRoute02)
EndFunc

