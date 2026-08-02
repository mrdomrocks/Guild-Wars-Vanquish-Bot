Global $vqrange = 1450
Global $ActionCounter = 1

Global $aScoundrelsRiseOutpostPath[2][2] = [ _
	[-1453.60, 24938.46], _
	[-4334.29, 26859.33] _
]

Global $aProph_Kryta_ScoundrelsRiseRoute01[43][2] = [ _
        [-2529, -5002], _
        [-470, -2966], _
        [2763, -2033], _
        [4006, -1526], _
        [4030, -1364], _
        [4333, -1079], _
        [5013, -591], _
        [4648, -167], _
        [3978, 494], _
        [2655, 1441], _
        [2199, 2371], _
        [2159, 2464], _
        [2892, 2837], _
        [3772, 3968], _
        [3751, 4621], _
        [5106, 4888], _
        [6761, 4999], _
        [7683, 6114], _
        [6914, 7092], _
        [6540, 7500], _
        [4766, 8885], _
        [4359, 8553], _
        [3501, 7961], _
        [2428, 5685], _
        [2327, 5658], _
        [791, 5064], _
        [-37, 6023], _
        [-672, 7194], _
        [-2283, 7737], _
        [-4571, 8588], _
        [-5158, 8757], _
        [-5737, 9153], _
        [-3183, 8086], _
        [-2535, 6465], _
        [-2394, 5688], _
        [-3686, 4096], _
        [-4695, 2122], _
        [-5057, 416], _
        [-3522, 4099], _
        [-2551, 5576], _
        [-668, 4943], _
        [1202, 3009], _
        [5940, 1835] _
]

Global $aProph_Kryta_ScoundrelsRiseRoute02[43][2] = [ _
        [5940, 1835], _
        [1202, 3009], _
        [-668, 4943], _
        [-2551, 5576], _
        [-3522, 4099], _
        [-5057, 416], _
        [-4695, 2122], _
        [-3686, 4096], _
        [-2394, 5688], _
        [-2535, 6465], _
        [-3183, 8086], _
        [-5737, 9153], _
        [-5158, 8757], _
        [-4571, 8588], _
        [-2283, 7737], _
        [-672, 7194], _
        [-37, 6023], _
        [791, 5064], _
        [2327, 5658], _
        [2428, 5685], _
        [3501, 7961], _
        [4359, 8553], _
        [4766, 8885], _
        [6540, 7500], _
        [6914, 7092], _
        [7683, 6114], _
        [6761, 4999], _
        [5106, 4888], _
        [3751, 4621], _
        [3772, 3968], _
        [2892, 2837], _
        [2159, 2464], _
        [2199, 2371], _
        [2655, 1441], _
        [3978, 494], _
        [4648, -167], _
        [5013, -591], _
        [4333, -1079], _
        [4030, -1364], _
        [4006, -1526], _
        [2763, -2033], _
        [-470, -2966], _
        [-2529, -5002] _
]

Func GoOutScoundrelsRise()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $ScoundrelsRise_Map Then Return

	If $l_i_Map = $ScoundrelsRise_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> ScoundrelsRise (portal 1)")
		_Vanquisher_RunAggroPortalPath($aScoundrelsRiseOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQScoundrelsRise()
	If GetMapID() <> $ScoundrelsRise_Map And GetMapID() <> $ScoundrelsRise_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for ScoundrelsRise.")
		TravelTo($ScoundrelsRise_Outpost)
	EndIf

	If GetMapID() = $ScoundrelsRise_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutScoundrelsRise()
		If GetMapID() <> $ScoundrelsRise_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need ScoundrelsRise (" & $ScoundrelsRise_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $ScoundrelsRise_Map Then
		CurrentAction("ScoundrelsRise route waiting - on map " & GetMapID() & ", need " & $ScoundrelsRise_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ScoundrelsRise vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_Kryta_ScoundrelsRiseRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_ScoundrelsRiseRoute02)
EndFunc

