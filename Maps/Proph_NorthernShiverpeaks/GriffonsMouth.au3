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


	If GetAreaVanquished() = False Then AggroMoveTo(-2913, -7105)
	If GetAreaVanquished() = False Then AggroMoveTo(-570, -6574)
	If GetAreaVanquished() = False Then AggroMoveTo(1535, -4368)
	If GetAreaVanquished() = False Then AggroMoveTo(3009, -6002)
	If GetAreaVanquished() = False Then AggroMoveTo(5547, -3291)
	If GetAreaVanquished() = False Then AggroMoveTo(6196, -356)
	If GetAreaVanquished() = False Then AggroMoveTo(5998, -3834)
	If GetAreaVanquished() = False Then AggroMoveTo(5162, -7264)
	If GetAreaVanquished() = False Then AggroMoveTo(6002, -3706)
	If GetAreaVanquished() = False Then AggroMoveTo(3041, -6006)
	If GetAreaVanquished() = False Then AggroMoveTo(1692, -3331)
	If GetAreaVanquished() = False Then AggroMoveTo(762, -1374)
	If GetAreaVanquished() = False Then AggroMoveTo(-2270, -1127)
	If GetAreaVanquished() = False Then AggroMoveTo(-1849, -4314)
	If GetAreaVanquished() = False Then AggroMoveTo(-2464, -1537)
	If GetAreaVanquished() = False Then AggroMoveTo(-5098, -977)
	If GetAreaVanquished() = False Then AggroMoveTo(-7529, 905)
	If GetAreaVanquished() = False Then AggroMoveTo(-6410, 3478)
	If GetAreaVanquished() = False Then AggroMoveTo(-3518, 5166)
	If GetAreaVanquished() = False Then AggroMoveTo(-2345, 4080)
	If GetAreaVanquished() = False Then AggroMoveTo(1349, 2834)
	If GetAreaVanquished() = False Then AggroMoveTo(-1156, 3651)
	If GetAreaVanquished() = False Then AggroMoveTo(-367, 6241)
	If GetAreaVanquished() = False Then AggroMoveTo(-961, 8115)
	If GetAreaVanquished() = False Then AggroMoveTo(-3406, 6831)
	If GetAreaVanquished() = False Then AggroMoveTo(-1159, 8115)
	If GetAreaVanquished() = False Then AggroMoveTo(597, 6595)
	If GetAreaVanquished() = False Then AggroMoveTo(3032, 8331)
	If GetAreaVanquished() = False Then AggroMoveTo(6586, 5423)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(6586, 5423)
	If GetAreaVanquished() = False Then AggroMoveTo(3032, 8331)
	If GetAreaVanquished() = False Then AggroMoveTo(597, 6595)
	If GetAreaVanquished() = False Then AggroMoveTo(-1159, 8115)
	If GetAreaVanquished() = False Then AggroMoveTo(-3406, 6831)
	If GetAreaVanquished() = False Then AggroMoveTo(-961, 8115)
	If GetAreaVanquished() = False Then AggroMoveTo(-367, 6241)
	If GetAreaVanquished() = False Then AggroMoveTo(-1156, 3651)
	If GetAreaVanquished() = False Then AggroMoveTo(1349, 2834)
	If GetAreaVanquished() = False Then AggroMoveTo(-2345, 4080)
	If GetAreaVanquished() = False Then AggroMoveTo(-3518, 5166)
	If GetAreaVanquished() = False Then AggroMoveTo(-6410, 3478)
	If GetAreaVanquished() = False Then AggroMoveTo(-7529, 905)
	If GetAreaVanquished() = False Then AggroMoveTo(-5098, -977)
	If GetAreaVanquished() = False Then AggroMoveTo(-2464, -1537)
	If GetAreaVanquished() = False Then AggroMoveTo(-1849, -4314)
	If GetAreaVanquished() = False Then AggroMoveTo(-2270, -1127)
	If GetAreaVanquished() = False Then AggroMoveTo(762, -1374)
	If GetAreaVanquished() = False Then AggroMoveTo(1692, -3331)
	If GetAreaVanquished() = False Then AggroMoveTo(3041, -6006)
	If GetAreaVanquished() = False Then AggroMoveTo(6002, -3706)
	If GetAreaVanquished() = False Then AggroMoveTo(5162, -7264)
	If GetAreaVanquished() = False Then AggroMoveTo(5998, -3834)
	If GetAreaVanquished() = False Then AggroMoveTo(6196, -356)
	If GetAreaVanquished() = False Then AggroMoveTo(5547, -3291)
	If GetAreaVanquished() = False Then AggroMoveTo(3009, -6002)
	If GetAreaVanquished() = False Then AggroMoveTo(1535, -4368)
	If GetAreaVanquished() = False Then AggroMoveTo(-570, -6574)
	If GetAreaVanquished() = False Then AggroMoveTo(-2913, -7105)
EndFunc

