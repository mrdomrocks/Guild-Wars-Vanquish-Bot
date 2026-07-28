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


	If GetAreaVanquished() = False Then AggroMoveTo(-12517, 4131)
	If GetAreaVanquished() = False Then AggroMoveTo(-12517, 4131)
	If GetAreaVanquished() = False Then AggroMoveTo(-11612, -1888)
	If GetAreaVanquished() = False Then AggroMoveTo(-11216, -5092)
	If GetAreaVanquished() = False Then AggroMoveTo(-7847, -8855)
	If GetAreaVanquished() = False Then AggroMoveTo(-4358, -10956)
	If GetAreaVanquished() = False Then AggroMoveTo(-620, -14121)
	If GetAreaVanquished() = False Then AggroMoveTo(2951, -16579)
	If GetAreaVanquished() = False Then AggroMoveTo(4821, -13127)
	If GetAreaVanquished() = False Then AggroMoveTo(6851, -16767)
	If GetAreaVanquished() = False Then AggroMoveTo(7366, -18957)
	If GetAreaVanquished() = False Then AggroMoveTo(5904, -8294)
	If GetAreaVanquished() = False Then AggroMoveTo(3045, 7490)
	If GetAreaVanquished() = False Then AggroMoveTo(-1880, 19088)
	If GetAreaVanquished() = False Then AggroMoveTo(-1011, 14688)
	If GetAreaVanquished() = False Then AggroMoveTo(2145, 14392)
	If GetAreaVanquished() = False Then AggroMoveTo(4579, 11634)
	If GetAreaVanquished() = False Then AggroMoveTo(5647, 8058)
	If GetAreaVanquished() = False Then AggroMoveTo(4848, 3638)
	If GetAreaVanquished() = False Then AggroMoveTo(6944, 266)
	If GetAreaVanquished() = False Then AggroMoveTo(9685, 68)
	If GetAreaVanquished() = False Then AggroMoveTo(13790, -1896)
	If GetAreaVanquished() = False Then AggroMoveTo(16285, -4276)
	If GetAreaVanquished() = False Then AggroMoveTo(16385, -9534)
	If GetAreaVanquished() = False Then AggroMoveTo(16613, -11922)
	If GetAreaVanquished() = False Then AggroMoveTo(15300, -15057)
	If GetAreaVanquished() = False Then AggroMoveTo(15161, -16996)
	If GetAreaVanquished() = False Then AggroMoveTo(12870, -18939)
	If GetAreaVanquished() = False Then AggroMoveTo(10087, -17498)
	If GetAreaVanquished() = False Then AggroMoveTo(9491, -15982)
	If GetAreaVanquished() = False Then AggroMoveTo(9182, -14634)
	If GetAreaVanquished() = False Then AggroMoveTo(7091, -13971)
	If GetAreaVanquished() = False Then AggroMoveTo(4317, -12524)
	If GetAreaVanquished() = False Then AggroMoveTo(12429, -18315)
	If GetAreaVanquished() = False Then AggroMoveTo(2420, -18580)
	If GetAreaVanquished() = False Then AggroMoveTo(-150, -17028)
	If GetAreaVanquished() = False Then AggroMoveTo(-2074, -19820)
	If GetAreaVanquished() = False Then AggroMoveTo(-5110, -17982)
	If GetAreaVanquished() = False Then AggroMoveTo(-7921, -19693)
	If GetAreaVanquished() = False Then AggroMoveTo(-11508, -20021)
	If GetAreaVanquished() = False Then AggroMoveTo(-15040, -17408)
	If GetAreaVanquished() = False Then AggroMoveTo(-14504, -16106)
	If GetAreaVanquished() = False Then AggroMoveTo(-15432, -11503)
	If GetAreaVanquished() = False Then AggroMoveTo(-17315, -6675)
	If GetAreaVanquished() = False Then AggroMoveTo(-16507, -533)
	If GetAreaVanquished() = False Then AggroMoveTo(-15460, 2643)
	If GetAreaVanquished() = False Then AggroMoveTo(-15136, 4402)
	If GetAreaVanquished() = False Then AggroMoveTo(-13592, 1783)
	If GetAreaVanquished() = False Then AggroMoveTo(-12978, 4596)
	If GetAreaVanquished() = False Then AggroMoveTo(-13163, 7424)
	If GetAreaVanquished() = False Then AggroMoveTo(-10824, 7473)
	If GetAreaVanquished() = False Then AggroMoveTo(-12215, 9148)
	If GetAreaVanquished() = False Then AggroMoveTo(-9360, 11683)
	If GetAreaVanquished() = False Then AggroMoveTo(-7461, 9757)
	If GetAreaVanquished() = False Then AggroMoveTo(-9475, 13352)
	If GetAreaVanquished() = False Then AggroMoveTo(-4393, 12093)
	If GetAreaVanquished() = False Then AggroMoveTo(-666, 8217)
	If GetAreaVanquished() = False Then AggroMoveTo(-309, 3936)
	If GetAreaVanquished() = False Then AggroMoveTo(-888, 807)
	If GetAreaVanquished() = False Then AggroMoveTo(-1533, -1247)
	If GetAreaVanquished() = False Then AggroMoveTo(-3547, -3366)
	If GetAreaVanquished() = False Then AggroMoveTo(-7609, -3668)
	If GetAreaVanquished() = False Then AggroMoveTo(-4391, -7590)
	If GetAreaVanquished() = False Then AggroMoveTo(-4197, -9582)
	If GetAreaVanquished() = False Then AggroMoveTo(-1597, -11135)
	If GetAreaVanquished() = False Then AggroMoveTo(3709, -11969)
	If GetAreaVanquished() = False Then AggroMoveTo(6771, -9109)
	If GetAreaVanquished() = False Then AggroMoveTo(4936, -4619)
	If GetAreaVanquished() = False Then AggroMoveTo(3948, 212)
	If GetAreaVanquished() = False Then AggroMoveTo(4243, 2236)
	If GetAreaVanquished() = False Then AggroMoveTo(964, 6154)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(964, 6154)
	If GetAreaVanquished() = False Then AggroMoveTo(4243, 2236)
	If GetAreaVanquished() = False Then AggroMoveTo(3948, 212)
	If GetAreaVanquished() = False Then AggroMoveTo(4936, -4619)
	If GetAreaVanquished() = False Then AggroMoveTo(6771, -9109)
	If GetAreaVanquished() = False Then AggroMoveTo(3709, -11969)
	If GetAreaVanquished() = False Then AggroMoveTo(-1597, -11135)
	If GetAreaVanquished() = False Then AggroMoveTo(-4197, -9582)
	If GetAreaVanquished() = False Then AggroMoveTo(-4391, -7590)
	If GetAreaVanquished() = False Then AggroMoveTo(-7609, -3668)
	If GetAreaVanquished() = False Then AggroMoveTo(-3547, -3366)
	If GetAreaVanquished() = False Then AggroMoveTo(-1533, -1247)
	If GetAreaVanquished() = False Then AggroMoveTo(-888, 807)
	If GetAreaVanquished() = False Then AggroMoveTo(-309, 3936)
	If GetAreaVanquished() = False Then AggroMoveTo(-666, 8217)
	If GetAreaVanquished() = False Then AggroMoveTo(-4393, 12093)
	If GetAreaVanquished() = False Then AggroMoveTo(-9475, 13352)
	If GetAreaVanquished() = False Then AggroMoveTo(-7461, 9757)
	If GetAreaVanquished() = False Then AggroMoveTo(-9360, 11683)
	If GetAreaVanquished() = False Then AggroMoveTo(-12215, 9148)
	If GetAreaVanquished() = False Then AggroMoveTo(-10824, 7473)
	If GetAreaVanquished() = False Then AggroMoveTo(-13163, 7424)
	If GetAreaVanquished() = False Then AggroMoveTo(-12978, 4596)
	If GetAreaVanquished() = False Then AggroMoveTo(-13592, 1783)
	If GetAreaVanquished() = False Then AggroMoveTo(-15136, 4402)
	If GetAreaVanquished() = False Then AggroMoveTo(-15460, 2643)
	If GetAreaVanquished() = False Then AggroMoveTo(-16507, -533)
	If GetAreaVanquished() = False Then AggroMoveTo(-17315, -6675)
	If GetAreaVanquished() = False Then AggroMoveTo(-15432, -11503)
	If GetAreaVanquished() = False Then AggroMoveTo(-14504, -16106)
	If GetAreaVanquished() = False Then AggroMoveTo(-15040, -17408)
	If GetAreaVanquished() = False Then AggroMoveTo(-11508, -20021)
	If GetAreaVanquished() = False Then AggroMoveTo(-7921, -19693)
	If GetAreaVanquished() = False Then AggroMoveTo(-5110, -17982)
	If GetAreaVanquished() = False Then AggroMoveTo(-2074, -19820)
	If GetAreaVanquished() = False Then AggroMoveTo(-150, -17028)
	If GetAreaVanquished() = False Then AggroMoveTo(2420, -18580)
	If GetAreaVanquished() = False Then AggroMoveTo(12429, -18315)
	If GetAreaVanquished() = False Then AggroMoveTo(4317, -12524)
	If GetAreaVanquished() = False Then AggroMoveTo(7091, -13971)
	If GetAreaVanquished() = False Then AggroMoveTo(9182, -14634)
	If GetAreaVanquished() = False Then AggroMoveTo(9491, -15982)
	If GetAreaVanquished() = False Then AggroMoveTo(10087, -17498)
	If GetAreaVanquished() = False Then AggroMoveTo(12870, -18939)
	If GetAreaVanquished() = False Then AggroMoveTo(15161, -16996)
	If GetAreaVanquished() = False Then AggroMoveTo(15300, -15057)
	If GetAreaVanquished() = False Then AggroMoveTo(16613, -11922)
	If GetAreaVanquished() = False Then AggroMoveTo(16385, -9534)
	If GetAreaVanquished() = False Then AggroMoveTo(16285, -4276)
	If GetAreaVanquished() = False Then AggroMoveTo(13790, -1896)
	If GetAreaVanquished() = False Then AggroMoveTo(9685, 68)
	If GetAreaVanquished() = False Then AggroMoveTo(6944, 266)
	If GetAreaVanquished() = False Then AggroMoveTo(4848, 3638)
	If GetAreaVanquished() = False Then AggroMoveTo(5647, 8058)
	If GetAreaVanquished() = False Then AggroMoveTo(4579, 11634)
	If GetAreaVanquished() = False Then AggroMoveTo(2145, 14392)
	If GetAreaVanquished() = False Then AggroMoveTo(-1011, 14688)
	If GetAreaVanquished() = False Then AggroMoveTo(-1880, 19088)
	If GetAreaVanquished() = False Then AggroMoveTo(3045, 7490)
	If GetAreaVanquished() = False Then AggroMoveTo(5904, -8294)
	If GetAreaVanquished() = False Then AggroMoveTo(7366, -18957)
	If GetAreaVanquished() = False Then AggroMoveTo(6851, -16767)
	If GetAreaVanquished() = False Then AggroMoveTo(4821, -13127)
	If GetAreaVanquished() = False Then AggroMoveTo(2951, -16579)
	If GetAreaVanquished() = False Then AggroMoveTo(-620, -14121)
	If GetAreaVanquished() = False Then AggroMoveTo(-4358, -10956)
	If GetAreaVanquished() = False Then AggroMoveTo(-7847, -8855)
	If GetAreaVanquished() = False Then AggroMoveTo(-11216, -5092)
	If GetAreaVanquished() = False Then AggroMoveTo(-11612, -1888)
	If GetAreaVanquished() = False Then AggroMoveTo(-12517, 4131)
	If GetAreaVanquished() = False Then AggroMoveTo(-12517, 4131)
EndFunc

