Global $vqrange = 1450
Global $ActionCounter = 1

Global $aWatchtowerCoastOutpostPath[3][2] = [ _
	[18349, -10465], _
	[17407, -10077], _
	[17324, -9489] _
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


	If GetAreaVanquished() = False Then AggroMoveTo(15452, -7007)
	If GetAreaVanquished() = False Then AggroMoveTo(13011, -4166)
	If GetAreaVanquished() = False Then AggroMoveTo(14695, 445)
	If GetAreaVanquished() = False Then AggroMoveTo(13606, 6422)
	If GetAreaVanquished() = False Then AggroMoveTo(13209, 8833)
	If GetAreaVanquished() = False Then AggroMoveTo(11030, 8437)
	If GetAreaVanquished() = False Then AggroMoveTo(11492, 6653)
	If GetAreaVanquished() = False Then AggroMoveTo(11261, 1270)
	If GetAreaVanquished() = False Then AggroMoveTo(8619, -1207)
	If GetAreaVanquished() = False Then AggroMoveTo(2872, -2230)
	If GetAreaVanquished() = False Then AggroMoveTo(9312, 2228)
	If GetAreaVanquished() = False Then AggroMoveTo(8751, 3714)
	If GetAreaVanquished() = False Then AggroMoveTo(3863, 2228)
	If GetAreaVanquished() = False Then AggroMoveTo(2311, 3318)
	If GetAreaVanquished() = False Then AggroMoveTo(7001, 7776)
	If GetAreaVanquished() = False Then AggroMoveTo(-1916, 5795)
	If GetAreaVanquished() = False Then AggroMoveTo(-2015, -3981)
	If GetAreaVanquished() = False Then AggroMoveTo(1948, -5962)
	If GetAreaVanquished() = False Then AggroMoveTo(-3931, -4542)
	If GetAreaVanquished() = False Then AggroMoveTo(-892, 4705)
	If GetAreaVanquished() = False Then AggroMoveTo(-7630, 4210)
	If GetAreaVanquished() = False Then AggroMoveTo(-2643, 3219)
	If GetAreaVanquished() = False Then AggroMoveTo(-4360, 280)
	If GetAreaVanquished() = False Then AggroMoveTo(-7927, 2459)
	If GetAreaVanquished() = False Then AggroMoveTo(-8158, -1174)
	If GetAreaVanquished() = False Then AggroMoveTo(-4988, -2032)
	If GetAreaVanquished() = False Then AggroMoveTo(-6242, -4773)
	If GetAreaVanquished() = False Then AggroMoveTo(-10734, -8010)
	If GetAreaVanquished() = False Then AggroMoveTo(-15589, -9166)
	If GetAreaVanquished() = False Then AggroMoveTo(-19023, -9760)
	If GetAreaVanquished() = False Then AggroMoveTo(-15655, -8967)
	If GetAreaVanquished() = False Then AggroMoveTo(-10965, -7911)
	If GetAreaVanquished() = False Then AggroMoveTo(-4888, -11940)
	If GetAreaVanquished() = False Then AggroMoveTo(-7134, -7250)
	If GetAreaVanquished() = False Then AggroMoveTo(-5252, -5764)
	If GetAreaVanquished() = False Then AggroMoveTo(-6507, -9925)
	If GetAreaVanquished() = False Then AggroMoveTo(-3039, -6358)
	If GetAreaVanquished() = False Then AggroMoveTo(-3039, -9133)
	If GetAreaVanquished() = False Then AggroMoveTo(-3171, -10949)
	If GetAreaVanquished() = False Then AggroMoveTo(-265, -11676)
	If GetAreaVanquished() = False Then AggroMoveTo(2047, -11411)
	If GetAreaVanquished() = False Then AggroMoveTo(3698, -7316)
	If GetAreaVanquished() = False Then AggroMoveTo(6868, -7911)
	If GetAreaVanquished() = False Then AggroMoveTo(7760, -11973)
	If GetAreaVanquished() = False Then AggroMoveTo(10369, -12303)
	If GetAreaVanquished() = False Then AggroMoveTo(10105, -9463)
	If GetAreaVanquished() = False Then AggroMoveTo(8289, -8505)
	If GetAreaVanquished() = False Then AggroMoveTo(12053, -4443)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(12053, -4443)
	If GetAreaVanquished() = False Then AggroMoveTo(8289, -8505)
	If GetAreaVanquished() = False Then AggroMoveTo(10105, -9463)
	If GetAreaVanquished() = False Then AggroMoveTo(10369, -12303)
	If GetAreaVanquished() = False Then AggroMoveTo(7760, -11973)
	If GetAreaVanquished() = False Then AggroMoveTo(6868, -7911)
	If GetAreaVanquished() = False Then AggroMoveTo(3698, -7316)
	If GetAreaVanquished() = False Then AggroMoveTo(2047, -11411)
	If GetAreaVanquished() = False Then AggroMoveTo(-265, -11676)
	If GetAreaVanquished() = False Then AggroMoveTo(-3171, -10949)
	If GetAreaVanquished() = False Then AggroMoveTo(-3039, -9133)
	If GetAreaVanquished() = False Then AggroMoveTo(-3039, -6358)
	If GetAreaVanquished() = False Then AggroMoveTo(-6507, -9925)
	If GetAreaVanquished() = False Then AggroMoveTo(-5252, -5764)
	If GetAreaVanquished() = False Then AggroMoveTo(-7134, -7250)
	If GetAreaVanquished() = False Then AggroMoveTo(-4888, -11940)
	If GetAreaVanquished() = False Then AggroMoveTo(-10965, -7911)
	If GetAreaVanquished() = False Then AggroMoveTo(-15655, -8967)
	If GetAreaVanquished() = False Then AggroMoveTo(-19023, -9760)
	If GetAreaVanquished() = False Then AggroMoveTo(-15589, -9166)
	If GetAreaVanquished() = False Then AggroMoveTo(-10734, -8010)
	If GetAreaVanquished() = False Then AggroMoveTo(-6242, -4773)
	If GetAreaVanquished() = False Then AggroMoveTo(-4988, -2032)
	If GetAreaVanquished() = False Then AggroMoveTo(-8158, -1174)
	If GetAreaVanquished() = False Then AggroMoveTo(-7927, 2459)
	If GetAreaVanquished() = False Then AggroMoveTo(-4360, 280)
	If GetAreaVanquished() = False Then AggroMoveTo(-2643, 3219)
	If GetAreaVanquished() = False Then AggroMoveTo(-7630, 4210)
	If GetAreaVanquished() = False Then AggroMoveTo(-892, 4705)
	If GetAreaVanquished() = False Then AggroMoveTo(-3931, -4542)
	If GetAreaVanquished() = False Then AggroMoveTo(1948, -5962)
	If GetAreaVanquished() = False Then AggroMoveTo(-2015, -3981)
	If GetAreaVanquished() = False Then AggroMoveTo(-1916, 5795)
	If GetAreaVanquished() = False Then AggroMoveTo(7001, 7776)
	If GetAreaVanquished() = False Then AggroMoveTo(2311, 3318)
	If GetAreaVanquished() = False Then AggroMoveTo(3863, 2228)
	If GetAreaVanquished() = False Then AggroMoveTo(8751, 3714)
	If GetAreaVanquished() = False Then AggroMoveTo(9312, 2228)
	If GetAreaVanquished() = False Then AggroMoveTo(2872, -2230)
	If GetAreaVanquished() = False Then AggroMoveTo(8619, -1207)
	If GetAreaVanquished() = False Then AggroMoveTo(11261, 1270)
	If GetAreaVanquished() = False Then AggroMoveTo(11492, 6653)
	If GetAreaVanquished() = False Then AggroMoveTo(11030, 8437)
	If GetAreaVanquished() = False Then AggroMoveTo(13209, 8833)
	If GetAreaVanquished() = False Then AggroMoveTo(13606, 6422)
	If GetAreaVanquished() = False Then AggroMoveTo(14695, 445)
	If GetAreaVanquished() = False Then AggroMoveTo(13011, -4166)
	If GetAreaVanquished() = False Then AggroMoveTo(15452, -7007)
EndFunc

