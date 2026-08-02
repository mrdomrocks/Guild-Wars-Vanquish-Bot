Global $vqrange = 1450
Global $ActionCounter = 1

Global $aWitmansFollyOutpostPath[2][2] = [ _
	[4869, 3423], _
	[5800, 1400] _
]

Global $aProph_SouthernShiverpeaks_WitmansFollyRoute01[70][2] = [ _
        [-15292, 5602], _
        [-16800, 2688], _
        [-14405, 8353], _
        [-10195, 7270], _
        [-9449, 5544], _
        [-7230, 6505], _
        [-7161, 8225], _
        [-5161, 8476], _
        [-2490, 8903], _
        [595, 8093], _
        [1440, 9377], _
        [2741, 8083], _
        [4784, 7607], _
        [6692, 8363], _
        [4586, 6586], _
        [5295, 3679], _
        [7056, 3230], _
        [5129, 1918], _
        [1960, 1492], _
        [1186, 3365], _
        [-513, 2605], _
        [-1999, 3422], _
        [-3892, 4084], _
        [-5722, 2696], _
        [-7926, 5307], _
        [-4765, 7751], _
        [-3013, 7041], _
        [-1143, 5798], _
        [-4984, 7787], _
        [-7415, 5874], _
        [-7399, 3915], _
        [-3149, 2372], _
        [-4520, 958], _
        [-6964, 198], _
        [-4779, -3266], _
        [-4341, -5567], _
        [-3609, -7267], _
        [-1925, -5186], _
        [-1632, -6624], _
        [272, -2916], _
        [2614, -3607], _
        [3610, -4263], _
        [4512, -5952], _
        [5902, -4624], _
        [6071, -5759], _
        [6285, -2547], _
        [8923, -3700], _
        [7296, -6432], _
        [9019, -3562], _
        [11402, -3611], _
        [12864, -2970], _
        [13998, -3748], _
        [15168, -4416], _
        [14898, -2514], _
        [15744, -2400], _
        [13320, -3434], _
        [14573, -1042], _
        [16212, -538], _
        [17170, 1463], _
        [16512, 4608], _
        [14724, 2628], _
        [12173, 1314], _
        [7978, -991], _
        [6508, 952], _
        [5565, 3522], _
        [4953, 6032], _
        [4025, 7592], _
        [1385, 7822], _
        [-904, 8688], _
        [-3215, 8688] _
]

Global $aProph_SouthernShiverpeaks_WitmansFollyRoute02[70][2] = [ _
        [-3215, 8688], _
        [-904, 8688], _
        [1385, 7822], _
        [4025, 7592], _
        [4953, 6032], _
        [5565, 3522], _
        [6508, 952], _
        [7978, -991], _
        [12173, 1314], _
        [14724, 2628], _
        [16512, 4608], _
        [17170, 1463], _
        [16212, -538], _
        [14573, -1042], _
        [13320, -3434], _
        [15744, -2400], _
        [14898, -2514], _
        [15168, -4416], _
        [13998, -3748], _
        [12864, -2970], _
        [11402, -3611], _
        [9019, -3562], _
        [7296, -6432], _
        [8923, -3700], _
        [6285, -2547], _
        [6071, -5759], _
        [5902, -4624], _
        [4512, -5952], _
        [3610, -4263], _
        [2614, -3607], _
        [272, -2916], _
        [-1632, -6624], _
        [-1925, -5186], _
        [-3609, -7267], _
        [-4341, -5567], _
        [-4779, -3266], _
        [-6964, 198], _
        [-4520, 958], _
        [-3149, 2372], _
        [-7399, 3915], _
        [-7415, 5874], _
        [-4984, 7787], _
        [-1143, 5798], _
        [-3013, 7041], _
        [-4765, 7751], _
        [-7926, 5307], _
        [-5722, 2696], _
        [-3892, 4084], _
        [-1999, 3422], _
        [-513, 2605], _
        [1186, 3365], _
        [1960, 1492], _
        [5129, 1918], _
        [7056, 3230], _
        [5295, 3679], _
        [4586, 6586], _
        [6692, 8363], _
        [4784, 7607], _
        [2741, 8083], _
        [1440, 9377], _
        [595, 8093], _
        [-2490, 8903], _
        [-5161, 8476], _
        [-7161, 8225], _
        [-7230, 6505], _
        [-9449, 5544], _
        [-10195, 7270], _
        [-14405, 8353], _
        [-16800, 2688], _
        [-15292, 5602] _
]

Func GoOutWitmansFolly()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $WitmansFolly_Map Then Return

	If $l_i_Map = $WitmansFolly_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> WitmansFolly (portal 1)")
		_Vanquisher_RunAggroPortalPath($aWitmansFollyOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQWitmansFolly()
	If GetMapID() <> $WitmansFolly_Map And GetMapID() <> $WitmansFolly_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for WitmansFolly.")
		TravelTo($WitmansFolly_Outpost)
	EndIf

	If GetMapID() = $WitmansFolly_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutWitmansFolly()
		If GetMapID() <> $WitmansFolly_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need WitmansFolly (" & $WitmansFolly_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $WitmansFolly_Map Then
		CurrentAction("WitmansFolly route waiting - on map " & GetMapID() & ", need " & $WitmansFolly_Map & ".")
		Return
	EndIf

	CurrentAction("Starting WitmansFolly vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_WitmansFollyRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_WitmansFollyRoute02)
EndFunc

