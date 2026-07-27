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


	If GetAreaVanquished() = False Then AggroMoveTo(-15292, 5602)
	If GetAreaVanquished() = False Then AggroMoveTo(-16800, 2688)
	If GetAreaVanquished() = False Then AggroMoveTo(-14405, 8353)
	If GetAreaVanquished() = False Then AggroMoveTo(-10195, 7270)
	If GetAreaVanquished() = False Then AggroMoveTo(-9449, 5544)
	If GetAreaVanquished() = False Then AggroMoveTo(-7230, 6505)
	If GetAreaVanquished() = False Then AggroMoveTo(-7161, 8225)
	If GetAreaVanquished() = False Then AggroMoveTo(-5161, 8476)
	If GetAreaVanquished() = False Then AggroMoveTo(-2490, 8903)
	If GetAreaVanquished() = False Then AggroMoveTo(595, 8093)
	If GetAreaVanquished() = False Then AggroMoveTo(1440, 9377)
	If GetAreaVanquished() = False Then AggroMoveTo(2741, 8083)
	If GetAreaVanquished() = False Then AggroMoveTo(4784, 7607)
	If GetAreaVanquished() = False Then AggroMoveTo(6692, 8363)
	If GetAreaVanquished() = False Then AggroMoveTo(4586, 6586)
	If GetAreaVanquished() = False Then AggroMoveTo(5295, 3679)
	If GetAreaVanquished() = False Then AggroMoveTo(7056, 3230)
	If GetAreaVanquished() = False Then AggroMoveTo(5129, 1918)
	If GetAreaVanquished() = False Then AggroMoveTo(1960, 1492)
	If GetAreaVanquished() = False Then AggroMoveTo(1186, 3365)
	If GetAreaVanquished() = False Then AggroMoveTo(-513, 2605)
	If GetAreaVanquished() = False Then AggroMoveTo(-1999, 3422)
	If GetAreaVanquished() = False Then AggroMoveTo(-3892, 4084)
	If GetAreaVanquished() = False Then AggroMoveTo(-5722, 2696)
	If GetAreaVanquished() = False Then AggroMoveTo(-7926, 5307)
	If GetAreaVanquished() = False Then AggroMoveTo(-4765, 7751)
	If GetAreaVanquished() = False Then AggroMoveTo(-3013, 7041)
	If GetAreaVanquished() = False Then AggroMoveTo(-1143, 5798)
	If GetAreaVanquished() = False Then AggroMoveTo(-4984, 7787)
	If GetAreaVanquished() = False Then AggroMoveTo(-7415, 5874)
	If GetAreaVanquished() = False Then AggroMoveTo(-7399, 3915)
	If GetAreaVanquished() = False Then AggroMoveTo(-3149, 2372)
	If GetAreaVanquished() = False Then AggroMoveTo(-4520, 958)
	If GetAreaVanquished() = False Then AggroMoveTo(-6964, 198)
	If GetAreaVanquished() = False Then AggroMoveTo(-4779, -3266)
	If GetAreaVanquished() = False Then AggroMoveTo(-4341, -5567)
	If GetAreaVanquished() = False Then AggroMoveTo(-3609, -7267)
	If GetAreaVanquished() = False Then AggroMoveTo(-1925, -5186)
	If GetAreaVanquished() = False Then AggroMoveTo(-1632, -6624)
	If GetAreaVanquished() = False Then AggroMoveTo(272, -2916)
	If GetAreaVanquished() = False Then AggroMoveTo(2614, -3607)
	If GetAreaVanquished() = False Then AggroMoveTo(3610, -4263)
	If GetAreaVanquished() = False Then AggroMoveTo(4512, -5952)
	If GetAreaVanquished() = False Then AggroMoveTo(5902, -4624)
	If GetAreaVanquished() = False Then AggroMoveTo(6071, -5759)
	If GetAreaVanquished() = False Then AggroMoveTo(6285, -2547)
	If GetAreaVanquished() = False Then AggroMoveTo(8923, -3700)
	If GetAreaVanquished() = False Then AggroMoveTo(7296, -6432)
	If GetAreaVanquished() = False Then AggroMoveTo(9019, -3562)
	If GetAreaVanquished() = False Then AggroMoveTo(11402, -3611)
	If GetAreaVanquished() = False Then AggroMoveTo(12864, -2970)
	If GetAreaVanquished() = False Then AggroMoveTo(13998, -3748)
	If GetAreaVanquished() = False Then AggroMoveTo(15168, -4416)
	If GetAreaVanquished() = False Then AggroMoveTo(14898, -2514)
	If GetAreaVanquished() = False Then AggroMoveTo(15744, -2400)
	If GetAreaVanquished() = False Then AggroMoveTo(13320, -3434)
	If GetAreaVanquished() = False Then AggroMoveTo(14573, -1042)
	If GetAreaVanquished() = False Then AggroMoveTo(16212, -538)
	If GetAreaVanquished() = False Then AggroMoveTo(17170, 1463)
	If GetAreaVanquished() = False Then AggroMoveTo(16512, 4608)
	If GetAreaVanquished() = False Then AggroMoveTo(14724, 2628)
	If GetAreaVanquished() = False Then AggroMoveTo(12173, 1314)
	If GetAreaVanquished() = False Then AggroMoveTo(7978, -991)
	If GetAreaVanquished() = False Then AggroMoveTo(6508, 952)
	If GetAreaVanquished() = False Then AggroMoveTo(5565, 3522)
	If GetAreaVanquished() = False Then AggroMoveTo(4953, 6032)
	If GetAreaVanquished() = False Then AggroMoveTo(4025, 7592)
	If GetAreaVanquished() = False Then AggroMoveTo(1385, 7822)
	If GetAreaVanquished() = False Then AggroMoveTo(-904, 8688)
	If GetAreaVanquished() = False Then AggroMoveTo(-3215, 8688)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-3215, 8688)
	If GetAreaVanquished() = False Then AggroMoveTo(-904, 8688)
	If GetAreaVanquished() = False Then AggroMoveTo(1385, 7822)
	If GetAreaVanquished() = False Then AggroMoveTo(4025, 7592)
	If GetAreaVanquished() = False Then AggroMoveTo(4953, 6032)
	If GetAreaVanquished() = False Then AggroMoveTo(5565, 3522)
	If GetAreaVanquished() = False Then AggroMoveTo(6508, 952)
	If GetAreaVanquished() = False Then AggroMoveTo(7978, -991)
	If GetAreaVanquished() = False Then AggroMoveTo(12173, 1314)
	If GetAreaVanquished() = False Then AggroMoveTo(14724, 2628)
	If GetAreaVanquished() = False Then AggroMoveTo(16512, 4608)
	If GetAreaVanquished() = False Then AggroMoveTo(17170, 1463)
	If GetAreaVanquished() = False Then AggroMoveTo(16212, -538)
	If GetAreaVanquished() = False Then AggroMoveTo(14573, -1042)
	If GetAreaVanquished() = False Then AggroMoveTo(13320, -3434)
	If GetAreaVanquished() = False Then AggroMoveTo(15744, -2400)
	If GetAreaVanquished() = False Then AggroMoveTo(14898, -2514)
	If GetAreaVanquished() = False Then AggroMoveTo(15168, -4416)
	If GetAreaVanquished() = False Then AggroMoveTo(13998, -3748)
	If GetAreaVanquished() = False Then AggroMoveTo(12864, -2970)
	If GetAreaVanquished() = False Then AggroMoveTo(11402, -3611)
	If GetAreaVanquished() = False Then AggroMoveTo(9019, -3562)
	If GetAreaVanquished() = False Then AggroMoveTo(7296, -6432)
	If GetAreaVanquished() = False Then AggroMoveTo(8923, -3700)
	If GetAreaVanquished() = False Then AggroMoveTo(6285, -2547)
	If GetAreaVanquished() = False Then AggroMoveTo(6071, -5759)
	If GetAreaVanquished() = False Then AggroMoveTo(5902, -4624)
	If GetAreaVanquished() = False Then AggroMoveTo(4512, -5952)
	If GetAreaVanquished() = False Then AggroMoveTo(3610, -4263)
	If GetAreaVanquished() = False Then AggroMoveTo(2614, -3607)
	If GetAreaVanquished() = False Then AggroMoveTo(272, -2916)
	If GetAreaVanquished() = False Then AggroMoveTo(-1632, -6624)
	If GetAreaVanquished() = False Then AggroMoveTo(-1925, -5186)
	If GetAreaVanquished() = False Then AggroMoveTo(-3609, -7267)
	If GetAreaVanquished() = False Then AggroMoveTo(-4341, -5567)
	If GetAreaVanquished() = False Then AggroMoveTo(-4779, -3266)
	If GetAreaVanquished() = False Then AggroMoveTo(-6964, 198)
	If GetAreaVanquished() = False Then AggroMoveTo(-4520, 958)
	If GetAreaVanquished() = False Then AggroMoveTo(-3149, 2372)
	If GetAreaVanquished() = False Then AggroMoveTo(-7399, 3915)
	If GetAreaVanquished() = False Then AggroMoveTo(-7415, 5874)
	If GetAreaVanquished() = False Then AggroMoveTo(-4984, 7787)
	If GetAreaVanquished() = False Then AggroMoveTo(-1143, 5798)
	If GetAreaVanquished() = False Then AggroMoveTo(-3013, 7041)
	If GetAreaVanquished() = False Then AggroMoveTo(-4765, 7751)
	If GetAreaVanquished() = False Then AggroMoveTo(-7926, 5307)
	If GetAreaVanquished() = False Then AggroMoveTo(-5722, 2696)
	If GetAreaVanquished() = False Then AggroMoveTo(-3892, 4084)
	If GetAreaVanquished() = False Then AggroMoveTo(-1999, 3422)
	If GetAreaVanquished() = False Then AggroMoveTo(-513, 2605)
	If GetAreaVanquished() = False Then AggroMoveTo(1186, 3365)
	If GetAreaVanquished() = False Then AggroMoveTo(1960, 1492)
	If GetAreaVanquished() = False Then AggroMoveTo(5129, 1918)
	If GetAreaVanquished() = False Then AggroMoveTo(7056, 3230)
	If GetAreaVanquished() = False Then AggroMoveTo(5295, 3679)
	If GetAreaVanquished() = False Then AggroMoveTo(4586, 6586)
	If GetAreaVanquished() = False Then AggroMoveTo(6692, 8363)
	If GetAreaVanquished() = False Then AggroMoveTo(4784, 7607)
	If GetAreaVanquished() = False Then AggroMoveTo(2741, 8083)
	If GetAreaVanquished() = False Then AggroMoveTo(1440, 9377)
	If GetAreaVanquished() = False Then AggroMoveTo(595, 8093)
	If GetAreaVanquished() = False Then AggroMoveTo(-2490, 8903)
	If GetAreaVanquished() = False Then AggroMoveTo(-5161, 8476)
	If GetAreaVanquished() = False Then AggroMoveTo(-7161, 8225)
	If GetAreaVanquished() = False Then AggroMoveTo(-7230, 6505)
	If GetAreaVanquished() = False Then AggroMoveTo(-9449, 5544)
	If GetAreaVanquished() = False Then AggroMoveTo(-10195, 7270)
	If GetAreaVanquished() = False Then AggroMoveTo(-14405, 8353)
	If GetAreaVanquished() = False Then AggroMoveTo(-16800, 2688)
	If GetAreaVanquished() = False Then AggroMoveTo(-15292, 5602)
EndFunc

