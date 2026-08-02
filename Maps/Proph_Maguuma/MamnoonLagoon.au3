;Mapped by Crux, updated by Incognito
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aMamnoonLagoonOutpostPath[2][2] = [ _
	[1692, -2650], _
	[2013, -2216] _
]

Global $aMamnoonLagoonTransitPath[15][2] = [ _
	[2384, -1697], _
	[3673, 525], _
	[5150, 2644], _
	[7357, 3959], _
	[7914, 6488], _
	[7130, 8915], _
	[6393, 11377], _
	[6191, 13960], _
	[8176, 15526], _
	[10709, 15812], _
	[13129, 16739], _
	[15137, 15124], _
	[16834, 13262], _
	[17163, 13225], _
 	[17391, 13256] _
]

Global $aProph_Maguuma_MamnoonLagoonRoute01[36][2] = [ _
        [-6363, -5190], _
        [-5201, -2844], _
        [-4173, -512], _
        [-2301, 1258], _
        [-2598, 3819], _
        [-1594, 3867], _
        [-1274, 1374], _
        [-1964, -1108], _
        [-1898, -3680], _
        [-529, -5780], _
        [1962, -6355], _
        [-576, -6729], _
        [-2353, -6877], _
        [168, -6488], _
        [1932, -4710], _
        [4309, -5734], _
        [5877, -3750], _
        [5744, -1158], _
        [4281, 963], _
        [3573, 3385], _
        [4207, 5824], _
        [6444, 7160], _
        [7147, 4948], _
        [6786, 7237], _
        [4711, 5810], _
        [2240, 5264], _
        [-24, 6356], _
        [-2592, 6615], _
        [-5051, 5817], _
        [-7118, 4306], _
        [-7450, 3475], _
        [-7329, 5997], _
        [-4763, 5921], _
        [-2273, 6167], _
        [-2544, 3657], _
        [-3085, 1120] _
]

Global $aProph_Maguuma_MamnoonLagoonRoute02[36][2] = [ _
        [-3085, 1120], _
        [-2544, 3657], _
        [-2273, 6167], _
        [-4763, 5921], _
        [-7329, 5997], _
        [-7450, 3475], _
        [-7118, 4306], _
        [-5051, 5817], _
        [-2592, 6615], _
        [-24, 6356], _
        [2240, 5264], _
        [4711, 5810], _
        [6786, 7237], _
        [7147, 4948], _
        [6444, 7160], _
        [4207, 5824], _
        [3573, 3385], _
        [4281, 963], _
        [5744, -1158], _
        [5877, -3750], _
        [4309, -5734], _
        [1932, -4710], _
        [168, -6488], _
        [-2353, -6877], _
        [-576, -6729], _
        [1962, -6355], _
        [-529, -5780], _
        [-1898, -3680], _
        [-1964, -1108], _
        [-1274, 1374], _
        [-1594, 3867], _
        [-2598, 3819], _
        [-2301, 1258], _
        [-4173, -512], _
        [-5201, -2844], _
        [-6363, -5190] _
]

Func GoOutMamnoonLagoon()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $MamnoonLagoon_Map Then Return
	If $l_i_Map = $MamnoonLagoon_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MamnoonLagoon (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
	If $l_i_Map = $MamnoonLagoon_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MamnoonLagoon (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQMamnoonLagoon()
	If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MamnoonLagoon.")
		TravelTo($MamnoonLagoon_Outpost)
	EndIf
	If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutMamnoonLagoon()
		If GetMapID() <> $MamnoonLagoon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
			Return
	EndIf
	EndIf
	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("MamnoonLagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf
	CurrentAction("Starting MamnoonLagoon vanquish route.")

	_Vanquisher_RunVanquishRoute($aProph_Maguuma_MamnoonLagoonRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Maguuma_MamnoonLagoonRoute02)
EndFunc
