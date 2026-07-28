Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutDeldrimorBowl()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DeldrimorBowl_Map Then Return

	If $l_i_Map = $DeldrimorBowl_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DeldrimorBowl (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDeldrimorBowlOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDeldrimorBowl()
	If GetMapID() <> $DeldrimorBowl_Map And GetMapID() <> $DeldrimorBowl_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DeldrimorBowl.")
		TravelTo($DeldrimorBowl_Outpost)
	EndIf

	If GetMapID() = $DeldrimorBowl_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutDeldrimorBowl()
		If GetMapID() <> $DeldrimorBowl_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DeldrimorBowl (" & $DeldrimorBowl_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DeldrimorBowl_Map Then
		CurrentAction("DeldrimorBowl route waiting - on map " & GetMapID() & ", need " & $DeldrimorBowl_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DeldrimorBowl vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(12342, -21414)
	If GetAreaVanquished() = False Then AggroMoveTo(15627, -15210)
	If GetAreaVanquished() = False Then AggroMoveTo(12342, -13124)
	If GetAreaVanquished() = False Then AggroMoveTo(12632, -5901)
	If GetAreaVanquished() = False Then AggroMoveTo(12882, -2022)
	If GetAreaVanquished() = False Then AggroMoveTo(8294, -7736)
	If GetAreaVanquished() = False Then AggroMoveTo(6037, -13151)
	If GetAreaVanquished() = False Then AggroMoveTo(6334, -16162)
	If GetAreaVanquished() = False Then AggroMoveTo(4450, -20112)
	If GetAreaVanquished() = False Then AggroMoveTo(620, -20291)
	If GetAreaVanquished() = False Then AggroMoveTo(-5595, -16954)
	If GetAreaVanquished() = False Then AggroMoveTo(-12127, -20917)
	If GetAreaVanquished() = False Then AggroMoveTo(-6821, -16846)
	If GetAreaVanquished() = False Then AggroMoveTo(-7695, -13637)
	If GetAreaVanquished() = False Then AggroMoveTo(-6173, -11667)
	If GetAreaVanquished() = False Then AggroMoveTo(-5321, -8053)
	If GetAreaVanquished() = False Then AggroMoveTo(-6821, -2898)
	If GetAreaVanquished() = False Then AggroMoveTo(-8319, 3838)
	If GetAreaVanquished() = False Then AggroMoveTo(-4109, 6145)
	If GetAreaVanquished() = False Then AggroMoveTo(-2545, 215)
	If GetAreaVanquished() = False Then AggroMoveTo(-2323, 7592)
	If GetAreaVanquished() = False Then AggroMoveTo(2682, 1649)
	If GetAreaVanquished() = False Then AggroMoveTo(7954, 6)
	If GetAreaVanquished() = False Then AggroMoveTo(10920, 5402)
	If GetAreaVanquished() = False Then AggroMoveTo(7329, 10057)
	If GetAreaVanquished() = False Then AggroMoveTo(12998, 7398)
	If GetAreaVanquished() = False Then AggroMoveTo(15051, 9684)
	If GetAreaVanquished() = False Then AggroMoveTo(13566, 13974)
	If GetAreaVanquished() = False Then AggroMoveTo(11773, 11587)
	If GetAreaVanquished() = False Then AggroMoveTo(8388, 14252)
	If GetAreaVanquished() = False Then AggroMoveTo(13110, 17968)
	If GetAreaVanquished() = False Then AggroMoveTo(14830, 21878)
	If GetAreaVanquished() = False Then AggroMoveTo(6801, 26727)
	If GetAreaVanquished() = False Then AggroMoveTo(1952, 23338)
	If GetAreaVanquished() = False Then AggroMoveTo(-5712, 24068)
	If GetAreaVanquished() = False Then AggroMoveTo(-8319, 22347)
	If GetAreaVanquished() = False Then AggroMoveTo(-5816, 20053)
	If GetAreaVanquished() = False Then AggroMoveTo(649, 21096)
	If GetAreaVanquished() = False Then AggroMoveTo(-133, 18645)
	If GetAreaVanquished() = False Then AggroMoveTo(-4826, 17811)
	If GetAreaVanquished() = False Then AggroMoveTo(-7015, 10564)
	If GetAreaVanquished() = False Then AggroMoveTo(-7276, 7227)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-7276, 7227)
	If GetAreaVanquished() = False Then AggroMoveTo(-7015, 10564)
	If GetAreaVanquished() = False Then AggroMoveTo(-4826, 17811)
	If GetAreaVanquished() = False Then AggroMoveTo(-133, 18645)
	If GetAreaVanquished() = False Then AggroMoveTo(649, 21096)
	If GetAreaVanquished() = False Then AggroMoveTo(-5816, 20053)
	If GetAreaVanquished() = False Then AggroMoveTo(-8319, 22347)
	If GetAreaVanquished() = False Then AggroMoveTo(-5712, 24068)
	If GetAreaVanquished() = False Then AggroMoveTo(1952, 23338)
	If GetAreaVanquished() = False Then AggroMoveTo(6801, 26727)
	If GetAreaVanquished() = False Then AggroMoveTo(14830, 21878)
	If GetAreaVanquished() = False Then AggroMoveTo(13110, 17968)
	If GetAreaVanquished() = False Then AggroMoveTo(8388, 14252)
	If GetAreaVanquished() = False Then AggroMoveTo(11773, 11587)
	If GetAreaVanquished() = False Then AggroMoveTo(13566, 13974)
	If GetAreaVanquished() = False Then AggroMoveTo(15051, 9684)
	If GetAreaVanquished() = False Then AggroMoveTo(12998, 7398)
	If GetAreaVanquished() = False Then AggroMoveTo(7329, 10057)
	If GetAreaVanquished() = False Then AggroMoveTo(10920, 5402)
	If GetAreaVanquished() = False Then AggroMoveTo(7954, 6)
	If GetAreaVanquished() = False Then AggroMoveTo(2682, 1649)
	If GetAreaVanquished() = False Then AggroMoveTo(-2323, 7592)
	If GetAreaVanquished() = False Then AggroMoveTo(-2545, 215)
	If GetAreaVanquished() = False Then AggroMoveTo(-4109, 6145)
	If GetAreaVanquished() = False Then AggroMoveTo(-8319, 3838)
	If GetAreaVanquished() = False Then AggroMoveTo(-6821, -2898)
	If GetAreaVanquished() = False Then AggroMoveTo(-5321, -8053)
	If GetAreaVanquished() = False Then AggroMoveTo(-6173, -11667)
	If GetAreaVanquished() = False Then AggroMoveTo(-7695, -13637)
	If GetAreaVanquished() = False Then AggroMoveTo(-6821, -16846)
	If GetAreaVanquished() = False Then AggroMoveTo(-12127, -20917)
	If GetAreaVanquished() = False Then AggroMoveTo(-5595, -16954)
	If GetAreaVanquished() = False Then AggroMoveTo(620, -20291)
	If GetAreaVanquished() = False Then AggroMoveTo(4450, -20112)
	If GetAreaVanquished() = False Then AggroMoveTo(6334, -16162)
	If GetAreaVanquished() = False Then AggroMoveTo(6037, -13151)
	If GetAreaVanquished() = False Then AggroMoveTo(8294, -7736)
	If GetAreaVanquished() = False Then AggroMoveTo(12882, -2022)
	If GetAreaVanquished() = False Then AggroMoveTo(12632, -5901)
	If GetAreaVanquished() = False Then AggroMoveTo(12342, -13124)
	If GetAreaVanquished() = False Then AggroMoveTo(15627, -15210)
	If GetAreaVanquished() = False Then AggroMoveTo(12342, -21414)
EndFunc

