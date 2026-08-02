Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDivinersAscentOutpostPath[2][2] = [ _
	[16763, 6828], _
	[17024, 6837] _
]

Global $aProph_CrystalDesert_DivinersAscentRoute01[56][2] = [ _
        [-5681, 3541], _
        [-2632, 6401], _
        [-1332, 8504], _
        [2519, 13932], _
        [-1231, 15836], _
        [-5212, 19298], _
        [-6751, 17911], _
        [-7880, 14906], _
        [-8231, 12809], _
        [-9580, 10883], _
        [-13214, 9329], _
        [-14894, 8123], _
        [-15369, 12149], _
        [-17472, 16823], _
        [-13825, 9052], _
        [-6590, 13329], _
        [-4332, 16058], _
        [1896, 16690], _
        [6023, 15024], _
        [7148, 13356], _
        [11064, 15735], _
        [13187, 16463], _
        [13040, 13169], _
        [8100, 11612], _
        [3695, 7830], _
        [3384, 5293], _
        [5697, 4528], _
        [10214, 9505], _
        [12984, 8838], _
        [16481, 7681], _
        [17121, 5679], _
        [11564, 5890], _
        [15019, 3801], _
        [12492, 2982], _
        [9490, 1598], _
        [6620, 419], _
        [6576, -1272], _
        [9167, -1233], _
        [7664, -2845], _
        [9040, -4989], _
        [12198, -6182], _
        [15591, -4735], _
        [15606, -7162], _
        [17114, -10290], _
        [16367, -11077], _
        [13043, -10983], _
        [11926, -9787], _
        [8810, -11417], _
        [6842, -11707], _
        [3754, -6782], _
        [2287, -10306], _
        [-598, -13421], _
        [8, -15799], _
        [-9612, -15123], _
        [-9848, -12998], _
        [-13444, -13808] _
]

Global $aProph_CrystalDesert_DivinersAscentRoute02[56][2] = [ _
        [-13444, -13808], _
        [-9848, -12998], _
        [-9612, -15123], _
        [8, -15799], _
        [-598, -13421], _
        [2287, -10306], _
        [3754, -6782], _
        [6842, -11707], _
        [8810, -11417], _
        [11926, -9787], _
        [13043, -10983], _
        [16367, -11077], _
        [17114, -10290], _
        [15606, -7162], _
        [15591, -4735], _
        [12198, -6182], _
        [9040, -4989], _
        [7664, -2845], _
        [9167, -1233], _
        [6576, -1272], _
        [6620, 419], _
        [9490, 1598], _
        [12492, 2982], _
        [15019, 3801], _
        [11564, 5890], _
        [17121, 5679], _
        [16481, 7681], _
        [12984, 8838], _
        [10214, 9505], _
        [5697, 4528], _
        [3384, 5293], _
        [3695, 7830], _
        [8100, 11612], _
        [13040, 13169], _
        [13187, 16463], _
        [11064, 15735], _
        [7148, 13356], _
        [6023, 15024], _
        [1896, 16690], _
        [-4332, 16058], _
        [-6590, 13329], _
        [-13825, 9052], _
        [-17472, 16823], _
        [-15369, 12149], _
        [-14894, 8123], _
        [-13214, 9329], _
        [-9580, 10883], _
        [-8231, 12809], _
        [-7880, 14906], _
        [-6751, 17911], _
        [-5212, 19298], _
        [-1231, 15836], _
        [2519, 13932], _
        [-1332, 8504], _
        [-2632, 6401], _
        [-5681, 3541] _
]

Func GoOutDivinersAscent()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DivinersAscent_Map Then Return

	If $l_i_Map = $DivinersAscent_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DivinersAscent (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDivinersAscentOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDivinersAscent()
	If GetMapID() <> $DivinersAscent_Map And GetMapID() <> $DivinersAscent_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DivinersAscent.")
		TravelTo($DivinersAscent_Outpost)
	EndIf

	If GetMapID() = $DivinersAscent_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutDivinersAscent()
		If GetMapID() <> $DivinersAscent_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DivinersAscent (" & $DivinersAscent_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DivinersAscent_Map Then
		CurrentAction("DivinersAscent route waiting - on map " & GetMapID() & ", need " & $DivinersAscent_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DivinersAscent vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_CrystalDesert_DivinersAscentRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_CrystalDesert_DivinersAscentRoute02)
EndFunc

