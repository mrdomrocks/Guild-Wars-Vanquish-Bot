Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDreadnoughtsDriftOutpostPath[2][2] = [ _
	[6647, -41652], _
	[5831, -41296] _
]

Global $aDreadnoughtsDriftTransitPath[38][2] = [ _
	[4361, -40986], _
	[2911, -39264], _
	[2133, -33852], _
	[-1060, -33346], _
	[-4758, -28947], _
	[-6471, -25171], _
	[-6082, -22640], _
	[-904, -21784], _
	[1054, -19774], _
	[1709, -15734], _
	[777, -12391], _
	[-1244, -9061], _
	[3023, -995], _
	[3610, 211], _
	[1680, 291], _
	[2015, 1742], _
	[-305, 3030], _
	[3103, 7774], _
	[1909, 14297], _
	[-816, 17801], _
	[-3619, 17256], _
	[-5371, 19670], _
	[-1984, 23796], _
	[-1945, 26833], _
	[508, 25354], _
	[1870, 22590], _
	[4868, 23524], _
	[3856, 27378], _
	[2065, 30960], _
	[2026, 32945], _
	[4634, 33957], _
	[6230, 35670], _
	[3038, 39018], _
	[-310, 37850], _
	[-2023, 40926], _
	[-5916, 41977], _
	[-7311, 44525], _
	[-7091, 45561] _
]

Global $aProph_SouthernShiverpeaks_DreadnoughtsDriftRoute01[45][2] = [ _
        [-5119, -5407], _
        [-4427, -4775], _
        [-4446, -2638], _
        [-4555, -5927], _
        [-2949, -7679], _
        [-2050, -6796], _
        [-1308, -1897], _
        [106, -103], _
        [514, 176], _
        [3533, 498], _
        [4356, -3346], _
        [4207, -4303], _
        [3699, -6090], _
        [4471, -5998], _
        [7167, -5819], _
        [6078, -2889], _
        [6326, -1135], _
        [6525, -355], _
        [6602, -227], _
        [5077, 1710], _
        [5045, 2476], _
        [5045, 2476], _
        [4953, 3191], _
        [6067, 5643], _
        [3323, 825], _
        [-1930, 112], _
        [-1997, 919], _
        [-1170, 2400], _
        [-783, 3165], _
        [-738, 3773], _
        [-1796, 7507], _
        [-4843, 6735], _
        [-6772, 3979], _
        [-6108, 2572], _
        [-5394, 1659], _
        [-4355, 1206], _
        [-3584, 1138], _
        [-1491, 2807], _
        [-1006, 3799], _
        [-828, 4909], _
        [-1219, 5993], _
        [-2209, 7086], _
        [-3361, 7077], _
        [-4223, 6917], _
        [-5167, 7362] _
]

Global $aProph_SouthernShiverpeaks_DreadnoughtsDriftRoute02[45][2] = [ _
        [-5167, 7362], _
        [-4223, 6917], _
        [-3361, 7077], _
        [-2209, 7086], _
        [-1219, 5993], _
        [-828, 4909], _
        [-1006, 3799], _
        [-1491, 2807], _
        [-3584, 1138], _
        [-4355, 1206], _
        [-5394, 1659], _
        [-6108, 2572], _
        [-6772, 3979], _
        [-4843, 6735], _
        [-1796, 7507], _
        [-738, 3773], _
        [-783, 3165], _
        [-1170, 2400], _
        [-1997, 919], _
        [-1930, 112], _
        [3323, 825], _
        [6067, 5643], _
        [4953, 3191], _
        [5045, 2476], _
        [5045, 2476], _
        [5077, 1710], _
        [6602, -227], _
        [6525, -355], _
        [6326, -1135], _
        [6078, -2889], _
        [7167, -5819], _
        [4471, -5998], _
        [3699, -6090], _
        [4207, -4303], _
        [4356, -3346], _
        [3533, 498], _
        [514, 176], _
        [106, -103], _
        [-1308, -1897], _
        [-2050, -6796], _
        [-2949, -7679], _
        [-4555, -5927], _
        [-4446, -2638], _
        [-4427, -4775], _
        [-5119, -5407] _
]

Func GoOutDreadnoughtsDrift()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DreadnoughtsDrift_Map Then Return

	If $l_i_Map = $DreadnoughtsDrift_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DreadnoughtsDrift (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDreadnoughtsDriftOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $DreadnoughtsDrift_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> DreadnoughtsDrift (portal 2)")
		_Vanquisher_RunAggroPortalPath($aDreadnoughtsDriftTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDreadnoughtsDrift()
	If GetMapID() <> $DreadnoughtsDrift_Map And GetMapID() <> $DreadnoughtsDrift_Outpost And GetMapID() <> $DreadnoughtsDrift_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DreadnoughtsDrift.")
		TravelTo($DreadnoughtsDrift_Outpost)
	EndIf

	If GetMapID() = $DreadnoughtsDrift_Outpost Or GetMapID() = $DreadnoughtsDrift_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutDreadnoughtsDrift()
		If GetMapID() <> $DreadnoughtsDrift_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DreadnoughtsDrift (" & $DreadnoughtsDrift_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DreadnoughtsDrift_Map Then
		CurrentAction("DreadnoughtsDrift route waiting - on map " & GetMapID() & ", need " & $DreadnoughtsDrift_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DreadnoughtsDrift vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_DreadnoughtsDriftRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_DreadnoughtsDriftRoute02)
EndFunc

