Global $vqrange = 1450
Global $ActionCounter = 1

Global $aWatchtowerCoastOutpostPath[3][2] = [ _
	[18349, -10465], _
	[17407, -10077], _
	[17324, -9489] _
]

Global $aProph_Kryta_WatchtowerCoastRoute01[48][2] = [ _
        [15452, -7007], _
        [13011, -4166], _
        [14695, 445], _
        [13606, 6422], _
        [13209, 8833], _
        [11030, 8437], _
        [11492, 6653], _
        [11261, 1270], _
        [8619, -1207], _
        [2872, -2230], _
        [9312, 2228], _
        [8751, 3714], _
        [3863, 2228], _
        [2311, 3318], _
        [7001, 7776], _
        [-1916, 5795], _
        [-2015, -3981], _
        [1948, -5962], _
        [-3931, -4542], _
        [-892, 4705], _
        [-7630, 4210], _
        [-2643, 3219], _
        [-4360, 280], _
        [-7927, 2459], _
        [-8158, -1174], _
        [-4988, -2032], _
        [-6242, -4773], _
        [-10734, -8010], _
        [-15589, -9166], _
        [-19023, -9760], _
        [-15655, -8967], _
        [-10965, -7911], _
        [-4888, -11940], _
        [-7134, -7250], _
        [-5252, -5764], _
        [-6507, -9925], _
        [-3039, -6358], _
        [-3039, -9133], _
        [-3171, -10949], _
        [-265, -11676], _
        [2047, -11411], _
        [3698, -7316], _
        [6868, -7911], _
        [7760, -11973], _
        [10369, -12303], _
        [10105, -9463], _
        [8289, -8505], _
        [12053, -4443] _
]

Global $aProph_Kryta_WatchtowerCoastRoute02[48][2] = [ _
        [12053, -4443], _
        [8289, -8505], _
        [10105, -9463], _
        [10369, -12303], _
        [7760, -11973], _
        [6868, -7911], _
        [3698, -7316], _
        [2047, -11411], _
        [-265, -11676], _
        [-3171, -10949], _
        [-3039, -9133], _
        [-3039, -6358], _
        [-6507, -9925], _
        [-5252, -5764], _
        [-7134, -7250], _
        [-4888, -11940], _
        [-10965, -7911], _
        [-15655, -8967], _
        [-19023, -9760], _
        [-15589, -9166], _
        [-10734, -8010], _
        [-6242, -4773], _
        [-4988, -2032], _
        [-8158, -1174], _
        [-7927, 2459], _
        [-4360, 280], _
        [-2643, 3219], _
        [-7630, 4210], _
        [-892, 4705], _
        [-3931, -4542], _
        [1948, -5962], _
        [-2015, -3981], _
        [-1916, 5795], _
        [7001, 7776], _
        [2311, 3318], _
        [3863, 2228], _
        [8751, 3714], _
        [9312, 2228], _
        [2872, -2230], _
        [8619, -1207], _
        [11261, 1270], _
        [11492, 6653], _
        [11030, 8437], _
        [13209, 8833], _
        [13606, 6422], _
        [14695, 445], _
        [13011, -4166], _
        [15452, -7007] _
]

Func GoOutWatchtowerCoast()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $WatchtowerCoast_Map Then Return

	If $l_i_Map = $WatchtowerCoast_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> WatchtowerCoast (portal 1)")
		_Vanquisher_RunAggroPortalPath($aWatchtowerCoastOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQWatchtowerCoast()
	If GetMapID() <> $WatchtowerCoast_Map And GetMapID() <> $WatchtowerCoast_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for WatchtowerCoast.")
		TravelTo($WatchtowerCoast_Outpost)
	EndIf

	If GetMapID() = $WatchtowerCoast_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutWatchtowerCoast()
		If GetMapID() <> $WatchtowerCoast_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need WatchtowerCoast (" & $WatchtowerCoast_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $WatchtowerCoast_Map Then
		CurrentAction("WatchtowerCoast route waiting - on map " & GetMapID() & ", need " & $WatchtowerCoast_Map & ".")
		Return
	EndIf

	CurrentAction("Starting WatchtowerCoast vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_Kryta_WatchtowerCoastRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_WatchtowerCoastRoute02)
EndFunc

