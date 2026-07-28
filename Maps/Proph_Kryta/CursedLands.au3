Global $vqrange = 1450
Global $ActionCounter = 1

Global $aCursedLandsOutpostPath[1][2] = [ _
	[-5234, 16000] _
]

Global $aCursedLandsTransitPath[10][2] = [ _
	[-5205, 15562], _
	[-2349, 13986], _
	[59, 15027], _
	[352, 16720], _
	[9269, 19160], _
	[15029, 16947], _
	[16343, 15691], _
	[17767, 15777], _
	[19161, 18064], _
	[20018, 18317] _
]

Func GoOutCursedLands()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $CursedLands_Map Then Return

	If $l_i_Map = $CursedLands_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> CursedLands (portal 1)")
		_Vanquisher_RunAggroPortalPath($aCursedLandsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $CursedLands_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> CursedLands (portal 2)")
		_Vanquisher_RunAggroPortalPath($aCursedLandsTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQCursedLands()
	If GetMapID() <> $CursedLands_Map And GetMapID() <> $CursedLands_Outpost And GetMapID() <> $CursedLands_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for CursedLands.")
		TravelTo($CursedLands_Outpost)
	EndIf

	If GetMapID() = $CursedLands_Outpost Or GetMapID() = $CursedLands_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCursedLands()
		If GetMapID() <> $CursedLands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need CursedLands (" & $CursedLands_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $CursedLands_Map Then
		CurrentAction("CursedLands route waiting - on map " & GetMapID() & ", need " & $CursedLands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting CursedLands vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-19496, 8848)
	If GetAreaVanquished() = False Then AggroMoveTo(-18602, 6586)
	If GetAreaVanquished() = False Then AggroMoveTo(-17054, 7175)
	If GetAreaVanquished() = False Then AggroMoveTo(-15946, 7445)
	If GetAreaVanquished() = False Then AggroMoveTo(-15053, 7023)
	If GetAreaVanquished() = False Then AggroMoveTo(-13624, 6437)
	If GetAreaVanquished() = False Then AggroMoveTo(-12525, 5679)
	If GetAreaVanquished() = False Then AggroMoveTo(-11018, 4926)
	If GetAreaVanquished() = False Then AggroMoveTo(-12364, 4081)
	If GetAreaVanquished() = False Then AggroMoveTo(-10455, 1232)
	If GetAreaVanquished() = False Then AggroMoveTo(-12270, 1827)
	If GetAreaVanquished() = False Then AggroMoveTo(-13679, 606)
	If GetAreaVanquished() = False Then AggroMoveTo(-12082, -364)
	If GetAreaVanquished() = False Then AggroMoveTo(-13366, 951)
	If GetAreaVanquished() = False Then AggroMoveTo(-10643, 888)
	If GetAreaVanquished() = False Then AggroMoveTo(-11053, -1374)
	If GetAreaVanquished() = False Then AggroMoveTo(-9443, -2167)
	If GetAreaVanquished() = False Then AggroMoveTo(-10789, -2632)
	If GetAreaVanquished() = False Then AggroMoveTo(-11207, -3480)
	If GetAreaVanquished() = False Then AggroMoveTo(-11878, -4157)
	If GetAreaVanquished() = False Then AggroMoveTo(-12322, -5287)
	If GetAreaVanquished() = False Then AggroMoveTo(-14137, -4737)
	If GetAreaVanquished() = False Then AggroMoveTo(-14089, -6291)
	If GetAreaVanquished() = False Then AggroMoveTo(-15448, -3760)
	If GetAreaVanquished() = False Then AggroMoveTo(-13079, -4313)
	If GetAreaVanquished() = False Then AggroMoveTo(-9292, -1291)
	If GetAreaVanquished() = False Then AggroMoveTo(-8202, -2740)
	If GetAreaVanquished() = False Then AggroMoveTo(-9170, -3353)
	If GetAreaVanquished() = False Then AggroMoveTo(-9211, -4044)
	If GetAreaVanquished() = False Then AggroMoveTo(-7336, -3675)
	If GetAreaVanquished() = False Then AggroMoveTo(-9115, -4460)
	If GetAreaVanquished() = False Then AggroMoveTo(-9118, -5042)
	If GetAreaVanquished() = False Then AggroMoveTo(-10272, -5496)
	If GetAreaVanquished() = False Then AggroMoveTo(-10043, -7969)
	If GetAreaVanquished() = False Then AggroMoveTo(-10556, -6510)
	If GetAreaVanquished() = False Then AggroMoveTo(-8929, -5283)
	If GetAreaVanquished() = False Then AggroMoveTo(-7929, -5724)
	If GetAreaVanquished() = False Then AggroMoveTo(-6021, -7049)
	If GetAreaVanquished() = False Then AggroMoveTo(-6905, -7346)
	If GetAreaVanquished() = False Then AggroMoveTo(-8598, -8605)
	If GetAreaVanquished() = False Then AggroMoveTo(-9013, -9298)
	If GetAreaVanquished() = False Then AggroMoveTo(-10887, -8602)
	If GetAreaVanquished() = False Then AggroMoveTo(-12167, -8764)
	If GetAreaVanquished() = False Then AggroMoveTo(-12631, -9765)
	If GetAreaVanquished() = False Then AggroMoveTo(-14267, -9095)
	If GetAreaVanquished() = False Then AggroMoveTo(-12344, -10978)
	If GetAreaVanquished() = False Then AggroMoveTo(-10962, -10738)
	If GetAreaVanquished() = False Then AggroMoveTo(-9900, -11619)
	If GetAreaVanquished() = False Then AggroMoveTo(-11262, -11599)
	If GetAreaVanquished() = False Then AggroMoveTo(-9940, -13102)
	If GetAreaVanquished() = False Then AggroMoveTo(-7184, -12391)
	If GetAreaVanquished() = False Then AggroMoveTo(-7264, -10788)
	If GetAreaVanquished() = False Then AggroMoveTo(-4279, -9403)
	If GetAreaVanquished() = False Then AggroMoveTo(-3958, -8141)
	If GetAreaVanquished() = False Then AggroMoveTo(-6337, -4810)
	If GetAreaVanquished() = False Then AggroMoveTo(-5260, -2957)
	If GetAreaVanquished() = False Then AggroMoveTo(-4033, -6313)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-4033, -6313)
	If GetAreaVanquished() = False Then AggroMoveTo(-5260, -2957)
	If GetAreaVanquished() = False Then AggroMoveTo(-6337, -4810)
	If GetAreaVanquished() = False Then AggroMoveTo(-3958, -8141)
	If GetAreaVanquished() = False Then AggroMoveTo(-4279, -9403)
	If GetAreaVanquished() = False Then AggroMoveTo(-7264, -10788)
	If GetAreaVanquished() = False Then AggroMoveTo(-7184, -12391)
	If GetAreaVanquished() = False Then AggroMoveTo(-9940, -13102)
	If GetAreaVanquished() = False Then AggroMoveTo(-11262, -11599)
	If GetAreaVanquished() = False Then AggroMoveTo(-9900, -11619)
	If GetAreaVanquished() = False Then AggroMoveTo(-10962, -10738)
	If GetAreaVanquished() = False Then AggroMoveTo(-12344, -10978)
	If GetAreaVanquished() = False Then AggroMoveTo(-14267, -9095)
	If GetAreaVanquished() = False Then AggroMoveTo(-12631, -9765)
	If GetAreaVanquished() = False Then AggroMoveTo(-12167, -8764)
	If GetAreaVanquished() = False Then AggroMoveTo(-10887, -8602)
	If GetAreaVanquished() = False Then AggroMoveTo(-9013, -9298)
	If GetAreaVanquished() = False Then AggroMoveTo(-8598, -8605)
	If GetAreaVanquished() = False Then AggroMoveTo(-6905, -7346)
	If GetAreaVanquished() = False Then AggroMoveTo(-6021, -7049)
	If GetAreaVanquished() = False Then AggroMoveTo(-7929, -5724)
	If GetAreaVanquished() = False Then AggroMoveTo(-8929, -5283)
	If GetAreaVanquished() = False Then AggroMoveTo(-10556, -6510)
	If GetAreaVanquished() = False Then AggroMoveTo(-10043, -7969)
	If GetAreaVanquished() = False Then AggroMoveTo(-10272, -5496)
	If GetAreaVanquished() = False Then AggroMoveTo(-9118, -5042)
	If GetAreaVanquished() = False Then AggroMoveTo(-9115, -4460)
	If GetAreaVanquished() = False Then AggroMoveTo(-7336, -3675)
	If GetAreaVanquished() = False Then AggroMoveTo(-9211, -4044)
	If GetAreaVanquished() = False Then AggroMoveTo(-9170, -3353)
	If GetAreaVanquished() = False Then AggroMoveTo(-8202, -2740)
	If GetAreaVanquished() = False Then AggroMoveTo(-9292, -1291)
	If GetAreaVanquished() = False Then AggroMoveTo(-13079, -4313)
	If GetAreaVanquished() = False Then AggroMoveTo(-15448, -3760)
	If GetAreaVanquished() = False Then AggroMoveTo(-14089, -6291)
	If GetAreaVanquished() = False Then AggroMoveTo(-14137, -4737)
	If GetAreaVanquished() = False Then AggroMoveTo(-12322, -5287)
	If GetAreaVanquished() = False Then AggroMoveTo(-11878, -4157)
	If GetAreaVanquished() = False Then AggroMoveTo(-11207, -3480)
	If GetAreaVanquished() = False Then AggroMoveTo(-10789, -2632)
	If GetAreaVanquished() = False Then AggroMoveTo(-9443, -2167)
	If GetAreaVanquished() = False Then AggroMoveTo(-11053, -1374)
	If GetAreaVanquished() = False Then AggroMoveTo(-10643, 888)
	If GetAreaVanquished() = False Then AggroMoveTo(-13366, 951)
	If GetAreaVanquished() = False Then AggroMoveTo(-12082, -364)
	If GetAreaVanquished() = False Then AggroMoveTo(-13679, 606)
	If GetAreaVanquished() = False Then AggroMoveTo(-12270, 1827)
	If GetAreaVanquished() = False Then AggroMoveTo(-10455, 1232)
	If GetAreaVanquished() = False Then AggroMoveTo(-12364, 4081)
	If GetAreaVanquished() = False Then AggroMoveTo(-11018, 4926)
	If GetAreaVanquished() = False Then AggroMoveTo(-12525, 5679)
	If GetAreaVanquished() = False Then AggroMoveTo(-13624, 6437)
	If GetAreaVanquished() = False Then AggroMoveTo(-15053, 7023)
	If GetAreaVanquished() = False Then AggroMoveTo(-15946, 7445)
	If GetAreaVanquished() = False Then AggroMoveTo(-17054, 7175)
	If GetAreaVanquished() = False Then AggroMoveTo(-18602, 6586)
	If GetAreaVanquished() = False Then AggroMoveTo(-19496, 8848)
EndFunc

