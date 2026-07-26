#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aWitmansFollyOutpostPath[2][2] = [ _
	[4869, 3423], _
	[5800, 1400] _
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

	Local $aWaypoints[70][4] = [ _
		[-15292, 5602, " ", $vqrange], _
		[-16800, 2688, " ", $vqrange], _
		[-14405, 8353, " ", $vqrange], _
		[-10195, 7270, " ", $vqrange], _
		[-9449, 5544, " ", $vqrange], _
		[-7230, 6505, " ", $vqrange], _
		[-7161, 8225, " ", $vqrange], _
		[-5161, 8476, " ", $vqrange], _
		[-2490, 8903, " ", $vqrange], _
		[595, 8093, " ", $vqrange], _
		[1440, 9377, " ", $vqrange], _
		[2741, 8083, " ", $vqrange], _
		[4784, 7607, " ", $vqrange], _
		[6692, 8363, " ", $vqrange], _
		[4586, 6586, " ", $vqrange], _
		[5295, 3679, " ", $vqrange], _
		[7056, 3230, " ", $vqrange], _
		[5129, 1918, " ", $vqrange], _
		[1960, 1492, " ", $vqrange], _
		[1186, 3365, " ", $vqrange], _
		[-513, 2605, " ", $vqrange], _
		[-1999, 3422, " ", $vqrange], _
		[-3892, 4084, " ", $vqrange], _
		[-5722, 2696, " ", $vqrange], _
		[-7926, 5307, " ", $vqrange], _
		[-4765, 7751, " ", $vqrange], _
		[-3013, 7041, " ", $vqrange], _
		[-1143, 5798, " ", $vqrange], _
		[-4984, 7787, " ", $vqrange], _
		[-7415, 5874, " ", $vqrange], _
		[-7399, 3915, " ", $vqrange], _
		[-3149, 2372, " ", $vqrange], _
		[-4520, 958, " ", $vqrange], _
		[-6964, 198, " ", $vqrange], _
		[-4779, -3266, " ", $vqrange], _
		[-4341, -5567, " ", $vqrange], _
		[-3609, -7267, " ", $vqrange], _
		[-1925, -5186, " ", $vqrange], _
		[-1632, -6624, " ", $vqrange], _
		[272, -2916, " ", $vqrange], _
		[2614, -3607, " ", $vqrange], _
		[3610, -4263, " ", $vqrange], _
		[4512, -5952, " ", $vqrange], _
		[5902, -4624, " ", $vqrange], _
		[6071, -5759, " ", $vqrange], _
		[6285, -2547, " ", $vqrange], _
		[8923, -3700, " ", $vqrange], _
		[7296, -6432, " ", $vqrange], _
		[9019, -3562, " ", $vqrange], _
		[11402, -3611, " ", $vqrange], _
		[12864, -2970, " ", $vqrange], _
		[13998, -3748, " ", $vqrange], _
		[15168, -4416, " ", $vqrange], _
		[14898, -2514, " ", $vqrange], _
		[15744, -2400, " ", $vqrange], _
		[13320, -3434, " ", $vqrange], _
		[14573, -1042, " ", $vqrange], _
		[16212, -538, " ", $vqrange], _
		[17170, 1463, " ", $vqrange], _
		[16512, 4608, " ", $vqrange], _
		[14724, 2628, " ", $vqrange], _
		[12173, 1314, " ", $vqrange], _
		[7978, -991, " ", $vqrange], _
		[6508, 952, " ", $vqrange], _
		[5565, 3522, " ", $vqrange], _
		[4953, 6032, " ", $vqrange], _
		[4025, 7592, " ", $vqrange], _
		[1385, 7822, " ", $vqrange], _
		[-904, 8688, " ", $vqrange], _
		[-3215, 8688, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

