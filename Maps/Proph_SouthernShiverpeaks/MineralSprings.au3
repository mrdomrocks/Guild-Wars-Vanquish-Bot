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


	If GetAreaVanquished() = False Then AggroMoveTo(-20810, -9703)
	If GetAreaVanquished() = False Then AggroMoveTo(-20491, -8464)
	If GetAreaVanquished() = False Then AggroMoveTo(-21304, -6247)
	If GetAreaVanquished() = False Then AggroMoveTo(-23562, -3417)
	If GetAreaVanquished() = False Then AggroMoveTo(-25001, -969)
	If GetAreaVanquished() = False Then AggroMoveTo(-22884, 2132)
	If GetAreaVanquished() = False Then AggroMoveTo(-20113, 3695)
	If GetAreaVanquished() = False Then AggroMoveTo(-20819, 7548)
	If GetAreaVanquished() = False Then AggroMoveTo(-19891, 9390)
	If GetAreaVanquished() = False Then AggroMoveTo(-18019, 9974)
	If GetAreaVanquished() = False Then AggroMoveTo(-13637, 7228)
	If GetAreaVanquished() = False Then AggroMoveTo(-9288, 8710)
	If GetAreaVanquished() = False Then AggroMoveTo(-7586, 9053)
	If GetAreaVanquished() = False Then AggroMoveTo(-6105, 9617)
	If GetAreaVanquished() = False Then AggroMoveTo(-6418, 8273)
	If GetAreaVanquished() = False Then AggroMoveTo(-5604, 6442)
	If GetAreaVanquished() = False Then AggroMoveTo(-3798, 6573)
	If GetAreaVanquished() = False Then AggroMoveTo(-2869, 6065)
	If GetAreaVanquished() = False Then AggroMoveTo(1025, 6810)
	If GetAreaVanquished() = False Then AggroMoveTo(2201, 8670)
	If GetAreaVanquished() = False Then AggroMoveTo(1276, 6274)
	If GetAreaVanquished() = False Then AggroMoveTo(2674, 3722)
	If GetAreaVanquished() = False Then AggroMoveTo(6881, 4780)
	If GetAreaVanquished() = False Then AggroMoveTo(13620, 8349)
	If GetAreaVanquished() = False Then AggroMoveTo(15268, 10083)
	If GetAreaVanquished() = False Then AggroMoveTo(21202, 8874)
	If GetAreaVanquished() = False Then AggroMoveTo(23496, 8276)
	If GetAreaVanquished() = False Then AggroMoveTo(24995, 6613)
	If GetAreaVanquished() = False Then AggroMoveTo(23905, 3561)
	If GetAreaVanquished() = False Then AggroMoveTo(20973, -111)
	If GetAreaVanquished() = False Then AggroMoveTo(21640, -1502)
	If GetAreaVanquished() = False Then AggroMoveTo(21614, 1213)
	If GetAreaVanquished() = False Then AggroMoveTo(23897, 3479)
	If GetAreaVanquished() = False Then AggroMoveTo(24284, 8839)
	If GetAreaVanquished() = False Then AggroMoveTo(19116, 9301)
	If GetAreaVanquished() = False Then AggroMoveTo(14524, 9843)
	If GetAreaVanquished() = False Then AggroMoveTo(16698, 3473)
	If GetAreaVanquished() = False Then AggroMoveTo(15028, -953)
	If GetAreaVanquished() = False Then AggroMoveTo(15773, -6569)
	If GetAreaVanquished() = False Then AggroMoveTo(14257, -9540)
	If GetAreaVanquished() = False Then AggroMoveTo(11862, -7931)
	If GetAreaVanquished() = False Then AggroMoveTo(8478, -7524)
	If GetAreaVanquished() = False Then AggroMoveTo(7039, -7508)
	If GetAreaVanquished() = False Then AggroMoveTo(7748, -5073)
	If GetAreaVanquished() = False Then AggroMoveTo(4231, -1503)
	If GetAreaVanquished() = False Then AggroMoveTo(117, -3343)
	If GetAreaVanquished() = False Then AggroMoveTo(507, -4867)
	If GetAreaVanquished() = False Then AggroMoveTo(-317, -7732)
	If GetAreaVanquished() = False Then AggroMoveTo(-3775, -7538)
	If GetAreaVanquished() = False Then AggroMoveTo(-4543, -4760)
	If GetAreaVanquished() = False Then AggroMoveTo(-5240, -2413)
	If GetAreaVanquished() = False Then AggroMoveTo(-11180, 1656)
	If GetAreaVanquished() = False Then AggroMoveTo(-13070, 227)
	If GetAreaVanquished() = False Then AggroMoveTo(-14841, -910)
	If GetAreaVanquished() = False Then AggroMoveTo(-13000, -373)
	If GetAreaVanquished() = False Then AggroMoveTo(-11325, -3876)
	If GetAreaVanquished() = False Then AggroMoveTo(-9344, -9444)
	If GetAreaVanquished() = False Then AggroMoveTo(-13723, -10548)
	If GetAreaVanquished() = False Then AggroMoveTo(-17905, -8309)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-17905, -8309)
	If GetAreaVanquished() = False Then AggroMoveTo(-13723, -10548)
	If GetAreaVanquished() = False Then AggroMoveTo(-9344, -9444)
	If GetAreaVanquished() = False Then AggroMoveTo(-11325, -3876)
	If GetAreaVanquished() = False Then AggroMoveTo(-13000, -373)
	If GetAreaVanquished() = False Then AggroMoveTo(-14841, -910)
	If GetAreaVanquished() = False Then AggroMoveTo(-13070, 227)
	If GetAreaVanquished() = False Then AggroMoveTo(-11180, 1656)
	If GetAreaVanquished() = False Then AggroMoveTo(-5240, -2413)
	If GetAreaVanquished() = False Then AggroMoveTo(-4543, -4760)
	If GetAreaVanquished() = False Then AggroMoveTo(-3775, -7538)
	If GetAreaVanquished() = False Then AggroMoveTo(-317, -7732)
	If GetAreaVanquished() = False Then AggroMoveTo(507, -4867)
	If GetAreaVanquished() = False Then AggroMoveTo(117, -3343)
	If GetAreaVanquished() = False Then AggroMoveTo(4231, -1503)
	If GetAreaVanquished() = False Then AggroMoveTo(7748, -5073)
	If GetAreaVanquished() = False Then AggroMoveTo(7039, -7508)
	If GetAreaVanquished() = False Then AggroMoveTo(8478, -7524)
	If GetAreaVanquished() = False Then AggroMoveTo(11862, -7931)
	If GetAreaVanquished() = False Then AggroMoveTo(14257, -9540)
	If GetAreaVanquished() = False Then AggroMoveTo(15773, -6569)
	If GetAreaVanquished() = False Then AggroMoveTo(15028, -953)
	If GetAreaVanquished() = False Then AggroMoveTo(16698, 3473)
	If GetAreaVanquished() = False Then AggroMoveTo(14524, 9843)
	If GetAreaVanquished() = False Then AggroMoveTo(19116, 9301)
	If GetAreaVanquished() = False Then AggroMoveTo(24284, 8839)
	If GetAreaVanquished() = False Then AggroMoveTo(23897, 3479)
	If GetAreaVanquished() = False Then AggroMoveTo(21614, 1213)
	If GetAreaVanquished() = False Then AggroMoveTo(21640, -1502)
	If GetAreaVanquished() = False Then AggroMoveTo(20973, -111)
	If GetAreaVanquished() = False Then AggroMoveTo(23905, 3561)
	If GetAreaVanquished() = False Then AggroMoveTo(24995, 6613)
	If GetAreaVanquished() = False Then AggroMoveTo(23496, 8276)
	If GetAreaVanquished() = False Then AggroMoveTo(21202, 8874)
	If GetAreaVanquished() = False Then AggroMoveTo(15268, 10083)
	If GetAreaVanquished() = False Then AggroMoveTo(13620, 8349)
	If GetAreaVanquished() = False Then AggroMoveTo(6881, 4780)
	If GetAreaVanquished() = False Then AggroMoveTo(2674, 3722)
	If GetAreaVanquished() = False Then AggroMoveTo(1276, 6274)
	If GetAreaVanquished() = False Then AggroMoveTo(2201, 8670)
	If GetAreaVanquished() = False Then AggroMoveTo(1025, 6810)
	If GetAreaVanquished() = False Then AggroMoveTo(-2869, 6065)
	If GetAreaVanquished() = False Then AggroMoveTo(-3798, 6573)
	If GetAreaVanquished() = False Then AggroMoveTo(-5604, 6442)
	If GetAreaVanquished() = False Then AggroMoveTo(-6418, 8273)
	If GetAreaVanquished() = False Then AggroMoveTo(-6105, 9617)
	If GetAreaVanquished() = False Then AggroMoveTo(-7586, 9053)
	If GetAreaVanquished() = False Then AggroMoveTo(-9288, 8710)
	If GetAreaVanquished() = False Then AggroMoveTo(-13637, 7228)
	If GetAreaVanquished() = False Then AggroMoveTo(-18019, 9974)
	If GetAreaVanquished() = False Then AggroMoveTo(-19891, 9390)
	If GetAreaVanquished() = False Then AggroMoveTo(-20819, 7548)
	If GetAreaVanquished() = False Then AggroMoveTo(-20113, 3695)
	If GetAreaVanquished() = False Then AggroMoveTo(-22884, 2132)
	If GetAreaVanquished() = False Then AggroMoveTo(-25001, -969)
	If GetAreaVanquished() = False Then AggroMoveTo(-23562, -3417)
	If GetAreaVanquished() = False Then AggroMoveTo(-21304, -6247)
	If GetAreaVanquished() = False Then AggroMoveTo(-20491, -8464)
	If GetAreaVanquished() = False Then AggroMoveTo(-20810, -9703)
EndFunc

