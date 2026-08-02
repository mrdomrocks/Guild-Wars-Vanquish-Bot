Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheAridSeaOutpostPath[2][2] = [ _
	[10795, 6556], _
	[10556, 5908] _
]

Global $aTheAridSeaTransitPath[11][2] = [ _
	[-4667, -13772], _
	[-2247, -14229], _
	[1025, -8357], _
	[-3110, -4890], _
	[2382, -2425], _
	[3462, -6718], _
	[4443, -9835], _
	[13232, -5778], _
	[16850, 4402], _
	[18984, 3739], _
	[20707, 6478] _
]

Global $aProph_CrystalDesert_TheAridSeaRoute01[71][2] = [ _
        [-12517, 4131], _
        [-12517, 4131], _
        [-11612, -1888], _
        [-11216, -5092], _
        [-7847, -8855], _
        [-4358, -10956], _
        [-620, -14121], _
        [2951, -16579], _
        [4821, -13127], _
        [6851, -16767], _
        [7366, -18957], _
        [5904, -8294], _
        [3045, 7490], _
        [-1880, 19088], _
        [-1011, 14688], _
        [2145, 14392], _
        [4579, 11634], _
        [5647, 8058], _
        [4848, 3638], _
        [6944, 266], _
        [9685, 68], _
        [13790, -1896], _
        [16285, -4276], _
        [16385, -9534], _
        [16613, -11922], _
        [15300, -15057], _
        [15161, -16996], _
        [12870, -18939], _
        [10087, -17498], _
        [9491, -15982], _
        [9182, -14634], _
        [7091, -13971], _
        [4317, -12524], _
        [12429, -18315], _
        [2420, -18580], _
        [-150, -17028], _
        [-2074, -19820], _
        [-5110, -17982], _
        [-7921, -19693], _
        [-11508, -20021], _
        [-15040, -17408], _
        [-14504, -16106], _
        [-15432, -11503], _
        [-17315, -6675], _
        [-16507, -533], _
        [-15460, 2643], _
        [-15136, 4402], _
        [-13592, 1783], _
        [-12978, 4596], _
        [-13163, 7424], _
        [-10824, 7473], _
        [-12215, 9148], _
        [-9360, 11683], _
        [-7461, 9757], _
        [-9475, 13352], _
        [-4393, 12093], _
        [-666, 8217], _
        [-309, 3936], _
        [-888, 807], _
        [-1533, -1247], _
        [-3547, -3366], _
        [-7609, -3668], _
        [-4391, -7590], _
        [-4197, -9582], _
        [-1597, -11135], _
        [3709, -11969], _
        [6771, -9109], _
        [4936, -4619], _
        [3948, 212], _
        [4243, 2236], _
        [964, 6154] _
]

Global $aProph_CrystalDesert_TheAridSeaRoute02[71][2] = [ _
        [964, 6154], _
        [4243, 2236], _
        [3948, 212], _
        [4936, -4619], _
        [6771, -9109], _
        [3709, -11969], _
        [-1597, -11135], _
        [-4197, -9582], _
        [-4391, -7590], _
        [-7609, -3668], _
        [-3547, -3366], _
        [-1533, -1247], _
        [-888, 807], _
        [-309, 3936], _
        [-666, 8217], _
        [-4393, 12093], _
        [-9475, 13352], _
        [-7461, 9757], _
        [-9360, 11683], _
        [-12215, 9148], _
        [-10824, 7473], _
        [-13163, 7424], _
        [-12978, 4596], _
        [-13592, 1783], _
        [-15136, 4402], _
        [-15460, 2643], _
        [-16507, -533], _
        [-17315, -6675], _
        [-15432, -11503], _
        [-14504, -16106], _
        [-15040, -17408], _
        [-11508, -20021], _
        [-7921, -19693], _
        [-5110, -17982], _
        [-2074, -19820], _
        [-150, -17028], _
        [2420, -18580], _
        [12429, -18315], _
        [4317, -12524], _
        [7091, -13971], _
        [9182, -14634], _
        [9491, -15982], _
        [10087, -17498], _
        [12870, -18939], _
        [15161, -16996], _
        [15300, -15057], _
        [16613, -11922], _
        [16385, -9534], _
        [16285, -4276], _
        [13790, -1896], _
        [9685, 68], _
        [6944, 266], _
        [4848, 3638], _
        [5647, 8058], _
        [4579, 11634], _
        [2145, 14392], _
        [-1011, 14688], _
        [-1880, 19088], _
        [3045, 7490], _
        [5904, -8294], _
        [7366, -18957], _
        [6851, -16767], _
        [4821, -13127], _
        [2951, -16579], _
        [-620, -14121], _
        [-4358, -10956], _
        [-7847, -8855], _
        [-11216, -5092], _
        [-11612, -1888], _
        [-12517, 4131], _
        [-12517, 4131] _
]

Func GoOutTheAridSea()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TheAridSea_Map Then Return

	If $l_i_Map = $TheAridSea_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TheAridSea (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTheAridSeaOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheAridSea_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> TheAridSea (portal 2)")
		_Vanquisher_RunAggroPortalPath($aTheAridSeaTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTheAridSea()
	If GetMapID() <> $TheAridSea_Map And GetMapID() <> $TheAridSea_Outpost And GetMapID() <> $TheAridSea_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TheAridSea.")
		TravelTo($TheAridSea_Outpost)
	EndIf

	If GetMapID() = $TheAridSea_Outpost Or GetMapID() = $TheAridSea_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheAridSea()
		If GetMapID() <> $TheAridSea_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheAridSea (" & $TheAridSea_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TheAridSea_Map Then
		CurrentAction("TheAridSea route waiting - on map " & GetMapID() & ", need " & $TheAridSea_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheAridSea vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_CrystalDesert_TheAridSeaRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_CrystalDesert_TheAridSeaRoute02)
EndFunc

