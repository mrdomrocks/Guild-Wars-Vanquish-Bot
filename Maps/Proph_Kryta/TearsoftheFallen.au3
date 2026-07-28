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


	If GetAreaVanquished() = False Then AggroMoveTo(3377, -6583)
	If GetAreaVanquished() = False Then AggroMoveTo(2544, -5393)
	If GetAreaVanquished() = False Then AggroMoveTo(-1324, -7624)
	If GetAreaVanquished() = False Then AggroMoveTo(-2484, -3816)
	If GetAreaVanquished() = False Then AggroMoveTo(-5555, -3910)
	If GetAreaVanquished() = False Then AggroMoveTo(-1502, -2477)
	If GetAreaVanquished() = False Then AggroMoveTo(-199, -1006)
	If GetAreaVanquished() = False Then AggroMoveTo(-1151, 1396)
	If GetAreaVanquished() = False Then AggroMoveTo(-2077, 3639)
	If GetAreaVanquished() = False Then AggroMoveTo(-4531, 1826)
	If GetAreaVanquished() = False Then AggroMoveTo(-9006, -3149)
	If GetAreaVanquished() = False Then AggroMoveTo(-6171, 1949)
	If GetAreaVanquished() = False Then AggroMoveTo(-4233, 3485)
	If GetAreaVanquished() = False Then AggroMoveTo(-6382, 3236)
	If GetAreaVanquished() = False Then AggroMoveTo(-7483, 6598)
	If GetAreaVanquished() = False Then AggroMoveTo(-4805, 9037)
	If GetAreaVanquished() = False Then AggroMoveTo(194, 8115)
	If GetAreaVanquished() = False Then AggroMoveTo(973, 6401)
	If GetAreaVanquished() = False Then AggroMoveTo(2996, 5353)
	If GetAreaVanquished() = False Then AggroMoveTo(878, 5051)
	If GetAreaVanquished() = False Then AggroMoveTo(3886, 6194)
	If GetAreaVanquished() = False Then AggroMoveTo(4219, 4096)
	If GetAreaVanquished() = False Then AggroMoveTo(6372, 2264)
	If GetAreaVanquished() = False Then AggroMoveTo(5841, 850)
	If GetAreaVanquished() = False Then AggroMoveTo(4948, -1917)
	If GetAreaVanquished() = False Then AggroMoveTo(2742, -4146)
	If GetAreaVanquished() = False Then AggroMoveTo(7656, -4505)
	If GetAreaVanquished() = False Then AggroMoveTo(2390, -2661)
	If GetAreaVanquished() = False Then AggroMoveTo(-2044, -1471)
	If GetAreaVanquished() = False Then AggroMoveTo(-3145, 1059)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-3145, 1059)
	If GetAreaVanquished() = False Then AggroMoveTo(-2044, -1471)
	If GetAreaVanquished() = False Then AggroMoveTo(2390, -2661)
	If GetAreaVanquished() = False Then AggroMoveTo(7656, -4505)
	If GetAreaVanquished() = False Then AggroMoveTo(2742, -4146)
	If GetAreaVanquished() = False Then AggroMoveTo(4948, -1917)
	If GetAreaVanquished() = False Then AggroMoveTo(5841, 850)
	If GetAreaVanquished() = False Then AggroMoveTo(6372, 2264)
	If GetAreaVanquished() = False Then AggroMoveTo(4219, 4096)
	If GetAreaVanquished() = False Then AggroMoveTo(3886, 6194)
	If GetAreaVanquished() = False Then AggroMoveTo(878, 5051)
	If GetAreaVanquished() = False Then AggroMoveTo(2996, 5353)
	If GetAreaVanquished() = False Then AggroMoveTo(973, 6401)
	If GetAreaVanquished() = False Then AggroMoveTo(194, 8115)
	If GetAreaVanquished() = False Then AggroMoveTo(-4805, 9037)
	If GetAreaVanquished() = False Then AggroMoveTo(-7483, 6598)
	If GetAreaVanquished() = False Then AggroMoveTo(-6382, 3236)
	If GetAreaVanquished() = False Then AggroMoveTo(-4233, 3485)
	If GetAreaVanquished() = False Then AggroMoveTo(-6171, 1949)
	If GetAreaVanquished() = False Then AggroMoveTo(-9006, -3149)
	If GetAreaVanquished() = False Then AggroMoveTo(-4531, 1826)
	If GetAreaVanquished() = False Then AggroMoveTo(-2077, 3639)
	If GetAreaVanquished() = False Then AggroMoveTo(-1151, 1396)
	If GetAreaVanquished() = False Then AggroMoveTo(-199, -1006)
	If GetAreaVanquished() = False Then AggroMoveTo(-1502, -2477)
	If GetAreaVanquished() = False Then AggroMoveTo(-5555, -3910)
	If GetAreaVanquished() = False Then AggroMoveTo(-2484, -3816)
	If GetAreaVanquished() = False Then AggroMoveTo(-1324, -7624)
	If GetAreaVanquished() = False Then AggroMoveTo(2544, -5393)
	If GetAreaVanquished() = False Then AggroMoveTo(3377, -6583)
EndFunc
