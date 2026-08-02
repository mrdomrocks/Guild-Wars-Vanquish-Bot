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

Global $aProph_Kryta_CursedLandsRoute01[57][2] = [ _
        [-19496, 8848], _
        [-18602, 6586], _
        [-17054, 7175], _
        [-15946, 7445], _
        [-15053, 7023], _
        [-13624, 6437], _
        [-12525, 5679], _
        [-11018, 4926], _
        [-12364, 4081], _
        [-10455, 1232], _
        [-12270, 1827], _
        [-13679, 606], _
        [-12082, -364], _
        [-13366, 951], _
        [-10643, 888], _
        [-11053, -1374], _
        [-9443, -2167], _
        [-10789, -2632], _
        [-11207, -3480], _
        [-11878, -4157], _
        [-12322, -5287], _
        [-14137, -4737], _
        [-14089, -6291], _
        [-15448, -3760], _
        [-13079, -4313], _
        [-9292, -1291], _
        [-8202, -2740], _
        [-9170, -3353], _
        [-9211, -4044], _
        [-7336, -3675], _
        [-9115, -4460], _
        [-9118, -5042], _
        [-10272, -5496], _
        [-10043, -7969], _
        [-10556, -6510], _
        [-8929, -5283], _
        [-7929, -5724], _
        [-6021, -7049], _
        [-6905, -7346], _
        [-8598, -8605], _
        [-9013, -9298], _
        [-10887, -8602], _
        [-12167, -8764], _
        [-12631, -9765], _
        [-14267, -9095], _
        [-12344, -10978], _
        [-10962, -10738], _
        [-9900, -11619], _
        [-11262, -11599], _
        [-9940, -13102], _
        [-7184, -12391], _
        [-7264, -10788], _
        [-4279, -9403], _
        [-3958, -8141], _
        [-6337, -4810], _
        [-5260, -2957], _
        [-4033, -6313] _
]

Global $aProph_Kryta_CursedLandsRoute02[57][2] = [ _
        [-4033, -6313], _
        [-5260, -2957], _
        [-6337, -4810], _
        [-3958, -8141], _
        [-4279, -9403], _
        [-7264, -10788], _
        [-7184, -12391], _
        [-9940, -13102], _
        [-11262, -11599], _
        [-9900, -11619], _
        [-10962, -10738], _
        [-12344, -10978], _
        [-14267, -9095], _
        [-12631, -9765], _
        [-12167, -8764], _
        [-10887, -8602], _
        [-9013, -9298], _
        [-8598, -8605], _
        [-6905, -7346], _
        [-6021, -7049], _
        [-7929, -5724], _
        [-8929, -5283], _
        [-10556, -6510], _
        [-10043, -7969], _
        [-10272, -5496], _
        [-9118, -5042], _
        [-9115, -4460], _
        [-7336, -3675], _
        [-9211, -4044], _
        [-9170, -3353], _
        [-8202, -2740], _
        [-9292, -1291], _
        [-13079, -4313], _
        [-15448, -3760], _
        [-14089, -6291], _
        [-14137, -4737], _
        [-12322, -5287], _
        [-11878, -4157], _
        [-11207, -3480], _
        [-10789, -2632], _
        [-9443, -2167], _
        [-11053, -1374], _
        [-10643, 888], _
        [-13366, 951], _
        [-12082, -364], _
        [-13679, 606], _
        [-12270, 1827], _
        [-10455, 1232], _
        [-12364, 4081], _
        [-11018, 4926], _
        [-12525, 5679], _
        [-13624, 6437], _
        [-15053, 7023], _
        [-15946, 7445], _
        [-17054, 7175], _
        [-18602, 6586], _
        [-19496, 8848] _
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


	_Vanquisher_RunVanquishRoute($aProph_Kryta_CursedLandsRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_CursedLandsRoute02)
EndFunc

