Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDivinersAscentOutpostPath[2][2] = [ _
	[16763, 6828], _
	[17024, 6837] _
]

Func GoOutDivinersAscent()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DivinersAscent_Map Then Return

	If $l_i_Map = $DivinersAscent_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DivinersAscent (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDivinersAscentOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDivinersAscent()
	If GetMapID() <> $DivinersAscent_Map And GetMapID() <> $DivinersAscent_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DivinersAscent.")
		TravelTo($DivinersAscent_Outpost)
	EndIf

	If GetMapID() = $DivinersAscent_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutDivinersAscent()
		If GetMapID() <> $DivinersAscent_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DivinersAscent (" & $DivinersAscent_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DivinersAscent_Map Then
		CurrentAction("DivinersAscent route waiting - on map " & GetMapID() & ", need " & $DivinersAscent_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DivinersAscent vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-5681, 3541)
	If GetAreaVanquished() = False Then AggroMoveTo(-2632, 6401)
	If GetAreaVanquished() = False Then AggroMoveTo(-1332, 8504)
	If GetAreaVanquished() = False Then AggroMoveTo(2519, 13932)
	If GetAreaVanquished() = False Then AggroMoveTo(-1231, 15836)
	If GetAreaVanquished() = False Then AggroMoveTo(-5212, 19298)
	If GetAreaVanquished() = False Then AggroMoveTo(-6751, 17911)
	If GetAreaVanquished() = False Then AggroMoveTo(-7880, 14906)
	If GetAreaVanquished() = False Then AggroMoveTo(-8231, 12809)
	If GetAreaVanquished() = False Then AggroMoveTo(-9580, 10883)
	If GetAreaVanquished() = False Then AggroMoveTo(-13214, 9329)
	If GetAreaVanquished() = False Then AggroMoveTo(-14894, 8123)
	If GetAreaVanquished() = False Then AggroMoveTo(-15369, 12149)
	If GetAreaVanquished() = False Then AggroMoveTo(-17472, 16823)
	If GetAreaVanquished() = False Then AggroMoveTo(-13825, 9052)
	If GetAreaVanquished() = False Then AggroMoveTo(-6590, 13329)
	If GetAreaVanquished() = False Then AggroMoveTo(-4332, 16058)
	If GetAreaVanquished() = False Then AggroMoveTo(1896, 16690)
	If GetAreaVanquished() = False Then AggroMoveTo(6023, 15024)
	If GetAreaVanquished() = False Then AggroMoveTo(7148, 13356)
	If GetAreaVanquished() = False Then AggroMoveTo(11064, 15735)
	If GetAreaVanquished() = False Then AggroMoveTo(13187, 16463)
	If GetAreaVanquished() = False Then AggroMoveTo(13040, 13169)
	If GetAreaVanquished() = False Then AggroMoveTo(8100, 11612)
	If GetAreaVanquished() = False Then AggroMoveTo(3695, 7830)
	If GetAreaVanquished() = False Then AggroMoveTo(3384, 5293)
	If GetAreaVanquished() = False Then AggroMoveTo(5697, 4528)
	If GetAreaVanquished() = False Then AggroMoveTo(10214, 9505)
	If GetAreaVanquished() = False Then AggroMoveTo(12984, 8838)
	If GetAreaVanquished() = False Then AggroMoveTo(16481, 7681)
	If GetAreaVanquished() = False Then AggroMoveTo(17121, 5679)
	If GetAreaVanquished() = False Then AggroMoveTo(11564, 5890)
	If GetAreaVanquished() = False Then AggroMoveTo(15019, 3801)
	If GetAreaVanquished() = False Then AggroMoveTo(12492, 2982)
	If GetAreaVanquished() = False Then AggroMoveTo(9490, 1598)
	If GetAreaVanquished() = False Then AggroMoveTo(6620, 419)
	If GetAreaVanquished() = False Then AggroMoveTo(6576, -1272)
	If GetAreaVanquished() = False Then AggroMoveTo(9167, -1233)
	If GetAreaVanquished() = False Then AggroMoveTo(7664, -2845)
	If GetAreaVanquished() = False Then AggroMoveTo(9040, -4989)
	If GetAreaVanquished() = False Then AggroMoveTo(12198, -6182)
	If GetAreaVanquished() = False Then AggroMoveTo(15591, -4735)
	If GetAreaVanquished() = False Then AggroMoveTo(15606, -7162)
	If GetAreaVanquished() = False Then AggroMoveTo(17114, -10290)
	If GetAreaVanquished() = False Then AggroMoveTo(16367, -11077)
	If GetAreaVanquished() = False Then AggroMoveTo(13043, -10983)
	If GetAreaVanquished() = False Then AggroMoveTo(11926, -9787)
	If GetAreaVanquished() = False Then AggroMoveTo(8810, -11417)
	If GetAreaVanquished() = False Then AggroMoveTo(6842, -11707)
	If GetAreaVanquished() = False Then AggroMoveTo(3754, -6782)
	If GetAreaVanquished() = False Then AggroMoveTo(2287, -10306)
	If GetAreaVanquished() = False Then AggroMoveTo(-598, -13421)
	If GetAreaVanquished() = False Then AggroMoveTo(8, -15799)
	If GetAreaVanquished() = False Then AggroMoveTo(-9612, -15123)
	If GetAreaVanquished() = False Then AggroMoveTo(-9848, -12998)
	If GetAreaVanquished() = False Then AggroMoveTo(-13444, -13808)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-13444, -13808)
	If GetAreaVanquished() = False Then AggroMoveTo(-9848, -12998)
	If GetAreaVanquished() = False Then AggroMoveTo(-9612, -15123)
	If GetAreaVanquished() = False Then AggroMoveTo(8, -15799)
	If GetAreaVanquished() = False Then AggroMoveTo(-598, -13421)
	If GetAreaVanquished() = False Then AggroMoveTo(2287, -10306)
	If GetAreaVanquished() = False Then AggroMoveTo(3754, -6782)
	If GetAreaVanquished() = False Then AggroMoveTo(6842, -11707)
	If GetAreaVanquished() = False Then AggroMoveTo(8810, -11417)
	If GetAreaVanquished() = False Then AggroMoveTo(11926, -9787)
	If GetAreaVanquished() = False Then AggroMoveTo(13043, -10983)
	If GetAreaVanquished() = False Then AggroMoveTo(16367, -11077)
	If GetAreaVanquished() = False Then AggroMoveTo(17114, -10290)
	If GetAreaVanquished() = False Then AggroMoveTo(15606, -7162)
	If GetAreaVanquished() = False Then AggroMoveTo(15591, -4735)
	If GetAreaVanquished() = False Then AggroMoveTo(12198, -6182)
	If GetAreaVanquished() = False Then AggroMoveTo(9040, -4989)
	If GetAreaVanquished() = False Then AggroMoveTo(7664, -2845)
	If GetAreaVanquished() = False Then AggroMoveTo(9167, -1233)
	If GetAreaVanquished() = False Then AggroMoveTo(6576, -1272)
	If GetAreaVanquished() = False Then AggroMoveTo(6620, 419)
	If GetAreaVanquished() = False Then AggroMoveTo(9490, 1598)
	If GetAreaVanquished() = False Then AggroMoveTo(12492, 2982)
	If GetAreaVanquished() = False Then AggroMoveTo(15019, 3801)
	If GetAreaVanquished() = False Then AggroMoveTo(11564, 5890)
	If GetAreaVanquished() = False Then AggroMoveTo(17121, 5679)
	If GetAreaVanquished() = False Then AggroMoveTo(16481, 7681)
	If GetAreaVanquished() = False Then AggroMoveTo(12984, 8838)
	If GetAreaVanquished() = False Then AggroMoveTo(10214, 9505)
	If GetAreaVanquished() = False Then AggroMoveTo(5697, 4528)
	If GetAreaVanquished() = False Then AggroMoveTo(3384, 5293)
	If GetAreaVanquished() = False Then AggroMoveTo(3695, 7830)
	If GetAreaVanquished() = False Then AggroMoveTo(8100, 11612)
	If GetAreaVanquished() = False Then AggroMoveTo(13040, 13169)
	If GetAreaVanquished() = False Then AggroMoveTo(13187, 16463)
	If GetAreaVanquished() = False Then AggroMoveTo(11064, 15735)
	If GetAreaVanquished() = False Then AggroMoveTo(7148, 13356)
	If GetAreaVanquished() = False Then AggroMoveTo(6023, 15024)
	If GetAreaVanquished() = False Then AggroMoveTo(1896, 16690)
	If GetAreaVanquished() = False Then AggroMoveTo(-4332, 16058)
	If GetAreaVanquished() = False Then AggroMoveTo(-6590, 13329)
	If GetAreaVanquished() = False Then AggroMoveTo(-13825, 9052)
	If GetAreaVanquished() = False Then AggroMoveTo(-17472, 16823)
	If GetAreaVanquished() = False Then AggroMoveTo(-15369, 12149)
	If GetAreaVanquished() = False Then AggroMoveTo(-14894, 8123)
	If GetAreaVanquished() = False Then AggroMoveTo(-13214, 9329)
	If GetAreaVanquished() = False Then AggroMoveTo(-9580, 10883)
	If GetAreaVanquished() = False Then AggroMoveTo(-8231, 12809)
	If GetAreaVanquished() = False Then AggroMoveTo(-7880, 14906)
	If GetAreaVanquished() = False Then AggroMoveTo(-6751, 17911)
	If GetAreaVanquished() = False Then AggroMoveTo(-5212, 19298)
	If GetAreaVanquished() = False Then AggroMoveTo(-1231, 15836)
	If GetAreaVanquished() = False Then AggroMoveTo(2519, 13932)
	If GetAreaVanquished() = False Then AggroMoveTo(-1332, 8504)
	If GetAreaVanquished() = False Then AggroMoveTo(-2632, 6401)
	If GetAreaVanquished() = False Then AggroMoveTo(-5681, 3541)
EndFunc

