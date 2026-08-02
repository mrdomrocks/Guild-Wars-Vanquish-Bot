Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTearsOutpostPath[2][2] = [ _
	[2043, 11028], _
	[1795, 11698] _
]

Global $aTearsTransitPath[7][2] = [ _
	[1606, 13394], _
	[-4298, 17149], _
	[-5176, 20570], _
	[-9688, 20389], _
	[-11232, 18965], _
	[-12577, 21055], _
	[-13618, 20788] _
]

Global $aProph_Kryta_TearsoftheFallenRoute01[30][2] = [ _
        [3377, -6583], _
        [2544, -5393], _
        [-1324, -7624], _
        [-2484, -3816], _
        [-5555, -3910], _
        [-1502, -2477], _
        [-199, -1006], _
        [-1151, 1396], _
        [-2077, 3639], _
        [-4531, 1826], _
        [-9006, -3149], _
        [-6171, 1949], _
        [-4233, 3485], _
        [-6382, 3236], _
        [-7483, 6598], _
        [-4805, 9037], _
        [194, 8115], _
        [973, 6401], _
        [2996, 5353], _
        [878, 5051], _
        [3886, 6194], _
        [4219, 4096], _
        [6372, 2264], _
        [5841, 850], _
        [4948, -1917], _
        [2742, -4146], _
        [7656, -4505], _
        [2390, -2661], _
        [-2044, -1471], _
        [-3145, 1059] _
]

Global $aProph_Kryta_TearsoftheFallenRoute02[30][2] = [ _
        [-3145, 1059], _
        [-2044, -1471], _
        [2390, -2661], _
        [7656, -4505], _
        [2742, -4146], _
        [4948, -1917], _
        [5841, 850], _
        [6372, 2264], _
        [4219, 4096], _
        [3886, 6194], _
        [878, 5051], _
        [2996, 5353], _
        [973, 6401], _
        [194, 8115], _
        [-4805, 9037], _
        [-7483, 6598], _
        [-6382, 3236], _
        [-4233, 3485], _
        [-6171, 1949], _
        [-9006, -3149], _
        [-4531, 1826], _
        [-2077, 3639], _
        [-1151, 1396], _
        [-199, -1006], _
        [-1502, -2477], _
        [-5555, -3910], _
        [-2484, -3816], _
        [-1324, -7624], _
        [2544, -5393], _
        [3377, -6583] _
]

Func _Vanquisher_ResetTearsRouteProgress()
	$g_i_TearsRoute_LastMapHandled = -1
EndFunc

; Fisherman's Haven (137) -> Stingray Strand transit (63) -> Tears of the Fallen farm (53).
Func GoOutTearsoftheFallen()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TearsoftheFallen_Map Then Return

	If $l_i_Map = $TearsoftheFallen_Outpost Then
		If $g_i_TearsRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Fisherman's Haven -> Stingray Strand (portal 1).")
		_Vanquisher_RunAggroPortalPath($aTearsOutpostPath, $vqrange, "haven ")
		$g_i_TearsRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TearsoftheFallen_Transit Then
		If $g_i_TearsRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Stingray Strand (transit) -> Tears of the Fallen (portal 2).")
		_Vanquisher_InitCombatAI()
		_Vanquisher_RunAggroPortalPath($aTearsTransitPath, $vqrange, "stingray ")
		$g_i_TearsRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQTearsoftheFallen()
	If GetMapID() <> $TearsoftheFallen_Map And GetMapID() <> $TearsoftheFallen_Outpost And GetMapID() <> $TearsoftheFallen_Transit Then
		_Vanquisher_ResetTearsRouteProgress()
		CurrentAction("Traveling to Fisherman's Haven.")
		TravelTo($TearsoftheFallen_Outpost)
	EndIf

	If GetMapID() = $TearsoftheFallen_Outpost Or GetMapID() = $TearsoftheFallen_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutTearsoftheFallen()
		If GetMapID() <> $TearsoftheFallen_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Tears of the Fallen (" & $TearsoftheFallen_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TearsoftheFallen_Map Then
		CurrentAction("Tears route waiting — on map " & GetMapID() & ", need " & $TearsoftheFallen_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Tears of the Fallen vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_Kryta_TearsoftheFallenRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_TearsoftheFallenRoute02)
EndFunc
