Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTascasDemiseOutpostPath[2][2] = [ _
	[-10030, 18833], _
	[-9797, 19027] _
]

Global $aProph_SouthernShiverpeaks_TascasDemiseRoute01[23][2] = [ _
        [-7318, 20765], _
        [-4967, 20426], _
        [-1199, 17061], _
        [534, 17369], _
        [1271, 20404], _
        [6097, 21830], _
        [4555, 25630], _
        [4131, 27041], _
        [5634, 28532], _
        [6247, 27996], _
        [7535, 26067], _
        [10512, 26634], _
        [12902, 24369], _
        [13015, 21309], _
        [10944, 18776], _
        [9210, 15807], _
        [8611, 15439], _
        [7336, 17215], _
        [6205, 17276], _
        [8441, 15381], _
        [5275, 14300], _
        [3529, 14567], _
        [1176, 16920] _
]

Global $aProph_SouthernShiverpeaks_TascasDemiseRoute02[23][2] = [ _
        [1176, 16920], _
        [3529, 14567], _
        [5275, 14300], _
        [8441, 15381], _
        [6205, 17276], _
        [7336, 17215], _
        [8611, 15439], _
        [9210, 15807], _
        [10944, 18776], _
        [13015, 21309], _
        [12902, 24369], _
        [10512, 26634], _
        [7535, 26067], _
        [6247, 27996], _
        [5634, 28532], _
        [4131, 27041], _
        [4555, 25630], _
        [6097, 21830], _
        [1271, 20404], _
        [534, 17369], _
        [-1199, 17061], _
        [-4967, 20426], _
        [-7318, 20765] _
]

Func GoOutTascasDemise()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TascasDemise_Map Then Return

	If $l_i_Map = $TascasDemise_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TascasDemise (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTascasDemiseOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTascasDemise()
	If GetMapID() <> $TascasDemise_Map And GetMapID() <> $TascasDemise_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TascasDemise.")
		TravelTo($TascasDemise_Outpost)
	EndIf

	If GetMapID() = $TascasDemise_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTascasDemise()
		If GetMapID() <> $TascasDemise_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TascasDemise (" & $TascasDemise_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TascasDemise_Map Then
		CurrentAction("TascasDemise route waiting - on map " & GetMapID() & ", need " & $TascasDemise_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TascasDemise vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_TascasDemiseRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_TascasDemiseRoute02)
EndFunc

