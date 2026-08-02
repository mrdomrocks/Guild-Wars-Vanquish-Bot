Global $vqrange = 1450
Global $ActionCounter = 1

Global $aGriffonsMouthOutpostPath[2][2] = [ _
	[-1453.60, 24938.46], _
	[-4334.29, 26859.33] _
]

Global $aGriffonsMouthTransitPath[8][2] = [ _
	[-2324, -5061], _
	[98, -2686], _
	[4808, -1046], _
	[6085, 3327], _
	[7698, 5400], _
	[7355, 6838], _
	[7504, 7406], _
	[7660, 8001] _
]

Global $aProph_NorthernShiverpeaks_GriffonsMouthRoute01[29][2] = [ _
        [-2913, -7105], _
        [-570, -6574], _
        [1535, -4368], _
        [3009, -6002], _
        [5547, -3291], _
        [6196, -356], _
        [5998, -3834], _
        [5162, -7264], _
        [6002, -3706], _
        [3041, -6006], _
        [1692, -3331], _
        [762, -1374], _
        [-2270, -1127], _
        [-1849, -4314], _
        [-2464, -1537], _
        [-5098, -977], _
        [-7529, 905], _
        [-6410, 3478], _
        [-3518, 5166], _
        [-2345, 4080], _
        [1349, 2834], _
        [-1156, 3651], _
        [-367, 6241], _
        [-961, 8115], _
        [-3406, 6831], _
        [-1159, 8115], _
        [597, 6595], _
        [3032, 8331], _
        [6586, 5423] _
]

Global $aProph_NorthernShiverpeaks_GriffonsMouthRoute02[29][2] = [ _
        [6586, 5423], _
        [3032, 8331], _
        [597, 6595], _
        [-1159, 8115], _
        [-3406, 6831], _
        [-961, 8115], _
        [-367, 6241], _
        [-1156, 3651], _
        [1349, 2834], _
        [-2345, 4080], _
        [-3518, 5166], _
        [-6410, 3478], _
        [-7529, 905], _
        [-5098, -977], _
        [-2464, -1537], _
        [-1849, -4314], _
        [-2270, -1127], _
        [762, -1374], _
        [1692, -3331], _
        [3041, -6006], _
        [6002, -3706], _
        [5162, -7264], _
        [5998, -3834], _
        [6196, -356], _
        [5547, -3291], _
        [3009, -6002], _
        [1535, -4368], _
        [-570, -6574], _
        [-2913, -7105] _
]

Func GoOutGriffonsMouth()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $GriffonsMouth_Map Then Return

	If $l_i_Map = $GriffonsMouth_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> GriffonsMouth (portal 1)")
		_Vanquisher_RunAggroPortalPath($aGriffonsMouthOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $GriffonsMouth_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> GriffonsMouth (portal 2)")
		_Vanquisher_RunAggroPortalPath($aGriffonsMouthTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQGriffonsMouth()
	If GetMapID() <> $GriffonsMouth_Map And GetMapID() <> $GriffonsMouth_Outpost And GetMapID() <> $GriffonsMouth_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for GriffonsMouth.")
		TravelTo($GriffonsMouth_Outpost)
	EndIf

	If GetMapID() = $GriffonsMouth_Outpost Or GetMapID() = $GriffonsMouth_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutGriffonsMouth()
		If GetMapID() <> $GriffonsMouth_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need GriffonsMouth (" & $GriffonsMouth_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $GriffonsMouth_Map Then
		CurrentAction("GriffonsMouth route waiting - on map " & GetMapID() & ", need " & $GriffonsMouth_Map & ".")
		Return
	EndIf

	CurrentAction("Starting GriffonsMouth vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_NorthernShiverpeaks_GriffonsMouthRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_NorthernShiverpeaks_GriffonsMouthRoute02)
EndFunc

