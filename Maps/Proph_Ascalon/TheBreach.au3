#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheBreachReturnFromDGPath[3][2] = [ _
	[-4577, -978], _
	[-4682, -1082], _
	[-4819, -1215] _
]

Global $aTheBreachReturnFromFTCPath[4][2] = [ _
	[-18448, -11278], _
	[-19523, -8452], _
	[-17298, -5976], _
	[-18414, -13661] _
]

Global $aTheBreachTransitPath[14][2] = [ _
	[-21985, 16166], _
	[-21331, 15866], _
	[-20807, 15451], _
	[-20132, 15059], _
	[-19524, 14998], _
	[-18289, 14805], _
	[-18303, 14382], _
	[18866, -12417], _
	[20923, -13708], _
	[21327, -15126], _
	[22108, -15166], _
	[22695, -15234], _
	[23184, -15256], _
	[23537, -15272] _
]

Func GoOutTheBreach()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TheBreach_Map Then Return

	If $l_i_Map = $TheBreach_Transit3 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Dragon's Gullet -> FlameTempleCorridor (en route to The Breach)")
		_Vanquisher_RunAggroPortalPath($aTheBreachReturnFromDGPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheBreach_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("FlameTempleCorridor -> DiessaLowlands (en route to The Breach)")
		_Vanquisher_RunAggroPortalPath($aTheBreachReturnFromFTCPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheBreach_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("DiessaLowlands -> TheBreach")
		_Vanquisher_RunAggroPortalPath($aTheBreachTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTheBreach()
	If GetMapID() <> $TheBreach_Map And GetMapID() <> $TheBreach_Transit And GetMapID() <> $TheBreach_Transit2 And GetMapID() <> $TheBreach_Transit3 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("TheBreach route waiting - on map " & GetMapID() & ", need " & $TheBreach_Map & " via Diessa Lowlands.")
		Return
	EndIf

	If GetMapID() = $TheBreach_Transit Or GetMapID() = $TheBreach_Transit2 Or GetMapID() = $TheBreach_Transit3 Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheBreach()
		If GetMapID() <> $TheBreach_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheBreach (" & $TheBreach_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TheBreach_Map Then
		CurrentAction("TheBreach route waiting - on map " & GetMapID() & ", need " & $TheBreach_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheBreach vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(20930, 5611)
	If GetAreaVanquished() = False Then AggroMoveTo(16965, 6388)
	If GetAreaVanquished() = False Then AggroMoveTo(16032, 3792)
	If GetAreaVanquished() = False Then AggroMoveTo(21053, 3511)
	If GetAreaVanquished() = False Then AggroMoveTo(20605, 2033)
	If GetAreaVanquished() = False Then AggroMoveTo(18406, 724)
	If GetAreaVanquished() = False Then AggroMoveTo(18932, 447)
	If GetAreaVanquished() = False Then AggroMoveTo(21009, -454)
	If GetAreaVanquished() = False Then AggroMoveTo(19297, -1664)
	If GetAreaVanquished() = False Then AggroMoveTo(20376, -5923)
	If GetAreaVanquished() = False Then AggroMoveTo(22038, -9691)
	If GetAreaVanquished() = False Then AggroMoveTo(20181, -6031)
	If GetAreaVanquished() = False Then AggroMoveTo(18404, -5474)
	If GetAreaVanquished() = False Then AggroMoveTo(15780, -7404)
	If GetAreaVanquished() = False Then AggroMoveTo(15863, -4300)
	If GetAreaVanquished() = False Then AggroMoveTo(17557, -2487)
	If GetAreaVanquished() = False Then AggroMoveTo(12050, -6665)
	If GetAreaVanquished() = False Then AggroMoveTo(10429, -6092)
	If GetAreaVanquished() = False Then AggroMoveTo(9558, -2437)
	If GetAreaVanquished() = False Then AggroMoveTo(11695, -1393)
	If GetAreaVanquished() = False Then AggroMoveTo(13012, -2047)
	If GetAreaVanquished() = False Then AggroMoveTo(17820, -92)
	If GetAreaVanquished() = False Then AggroMoveTo(17349, 2040)
	If GetAreaVanquished() = False Then AggroMoveTo(14542, 1758)
	If GetAreaVanquished() = False Then AggroMoveTo(13996, 5968)
	If GetAreaVanquished() = False Then AggroMoveTo(15016, 7942)
	If GetAreaVanquished() = False Then AggroMoveTo(15712, 7637)
	If GetAreaVanquished() = False Then AggroMoveTo(16788, 9096)
	If GetAreaVanquished() = False Then AggroMoveTo(15607, 9804)
	If GetAreaVanquished() = False Then AggroMoveTo(12444, 6652)
	If GetAreaVanquished() = False Then AggroMoveTo(11472, 8382)
	If GetAreaVanquished() = False Then AggroMoveTo(12019, 6902)
	If GetAreaVanquished() = False Then AggroMoveTo(11956, 3346)
	If GetAreaVanquished() = False Then AggroMoveTo(9122, 3441)
	If GetAreaVanquished() = False Then AggroMoveTo(7517, 5269)
	If GetAreaVanquished() = False Then AggroMoveTo(1742, 4710)
	If GetAreaVanquished() = False Then AggroMoveTo(-569, 3824)
	If GetAreaVanquished() = False Then AggroMoveTo(-1746, 5613)
	If GetAreaVanquished() = False Then AggroMoveTo(2480, 7805)
	If GetAreaVanquished() = False Then AggroMoveTo(3938, 9623)
	If GetAreaVanquished() = False Then AggroMoveTo(8203, 9945)
	If GetAreaVanquished() = False Then AggroMoveTo(2532, 7833)
	If GetAreaVanquished() = False Then AggroMoveTo(-1144, 10997)
	If GetAreaVanquished() = False Then AggroMoveTo(-3937, 9496)
	If GetAreaVanquished() = False Then AggroMoveTo(-6036, 9999)
	If GetAreaVanquished() = False Then AggroMoveTo(-6832, 5916)
	If GetAreaVanquished() = False Then AggroMoveTo(-8200, 9393)
	If GetAreaVanquished() = False Then AggroMoveTo(-12489, 9174)
	If GetAreaVanquished() = False Then AggroMoveTo(-13055, 8417)
	If GetAreaVanquished() = False Then AggroMoveTo(-13224, 6779)
	If GetAreaVanquished() = False Then AggroMoveTo(-14404, 5028)
	If GetAreaVanquished() = False Then AggroMoveTo(-17412, 4265)
	If GetAreaVanquished() = False Then AggroMoveTo(-14248, 4862)
	If GetAreaVanquished() = False Then AggroMoveTo(-11130, 2208)
	If GetAreaVanquished() = False Then AggroMoveTo(-6693, 3566)
	If GetAreaVanquished() = False Then AggroMoveTo(-9310, -1710)
	If GetAreaVanquished() = False Then AggroMoveTo(-8204, -2515)
	If GetAreaVanquished() = False Then AggroMoveTo(-7186, -6756)
	If GetAreaVanquished() = False Then AggroMoveTo(-8669, -4135)
	If GetAreaVanquished() = False Then AggroMoveTo(-11289, -3298)
	If GetAreaVanquished() = False Then AggroMoveTo(-12825, -4227)
	If GetAreaVanquished() = False Then AggroMoveTo(-13632, -1787)
	If GetAreaVanquished() = False Then AggroMoveTo(-12762, -4156)
	If GetAreaVanquished() = False Then AggroMoveTo(-9920, -6053)
	If GetAreaVanquished() = False Then AggroMoveTo(-9565, -8243)
	If GetAreaVanquished() = False Then AggroMoveTo(-6846, -8057)
	If GetAreaVanquished() = False Then AggroMoveTo(-4791, -6985)
	If GetAreaVanquished() = False Then AggroMoveTo(-3600, -8540)
	If GetAreaVanquished() = False Then AggroMoveTo(-3795, -8404)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-3795, -8404)
	If GetAreaVanquished() = False Then AggroMoveTo(-3600, -8540)
	If GetAreaVanquished() = False Then AggroMoveTo(-4791, -6985)
	If GetAreaVanquished() = False Then AggroMoveTo(-6846, -8057)
	If GetAreaVanquished() = False Then AggroMoveTo(-9565, -8243)
	If GetAreaVanquished() = False Then AggroMoveTo(-9920, -6053)
	If GetAreaVanquished() = False Then AggroMoveTo(-12762, -4156)
	If GetAreaVanquished() = False Then AggroMoveTo(-13632, -1787)
	If GetAreaVanquished() = False Then AggroMoveTo(-12825, -4227)
	If GetAreaVanquished() = False Then AggroMoveTo(-11289, -3298)
	If GetAreaVanquished() = False Then AggroMoveTo(-8669, -4135)
	If GetAreaVanquished() = False Then AggroMoveTo(-7186, -6756)
	If GetAreaVanquished() = False Then AggroMoveTo(-8204, -2515)
	If GetAreaVanquished() = False Then AggroMoveTo(-9310, -1710)
	If GetAreaVanquished() = False Then AggroMoveTo(-6693, 3566)
	If GetAreaVanquished() = False Then AggroMoveTo(-11130, 2208)
	If GetAreaVanquished() = False Then AggroMoveTo(-14248, 4862)
	If GetAreaVanquished() = False Then AggroMoveTo(-17412, 4265)
	If GetAreaVanquished() = False Then AggroMoveTo(-14404, 5028)
	If GetAreaVanquished() = False Then AggroMoveTo(-13224, 6779)
	If GetAreaVanquished() = False Then AggroMoveTo(-13055, 8417)
	If GetAreaVanquished() = False Then AggroMoveTo(-12489, 9174)
	If GetAreaVanquished() = False Then AggroMoveTo(-8200, 9393)
	If GetAreaVanquished() = False Then AggroMoveTo(-6832, 5916)
	If GetAreaVanquished() = False Then AggroMoveTo(-6036, 9999)
	If GetAreaVanquished() = False Then AggroMoveTo(-3937, 9496)
	If GetAreaVanquished() = False Then AggroMoveTo(-1144, 10997)
	If GetAreaVanquished() = False Then AggroMoveTo(2532, 7833)
	If GetAreaVanquished() = False Then AggroMoveTo(8203, 9945)
	If GetAreaVanquished() = False Then AggroMoveTo(3938, 9623)
	If GetAreaVanquished() = False Then AggroMoveTo(2480, 7805)
	If GetAreaVanquished() = False Then AggroMoveTo(-1746, 5613)
	If GetAreaVanquished() = False Then AggroMoveTo(-569, 3824)
	If GetAreaVanquished() = False Then AggroMoveTo(1742, 4710)
	If GetAreaVanquished() = False Then AggroMoveTo(7517, 5269)
	If GetAreaVanquished() = False Then AggroMoveTo(9122, 3441)
	If GetAreaVanquished() = False Then AggroMoveTo(11956, 3346)
	If GetAreaVanquished() = False Then AggroMoveTo(12019, 6902)
	If GetAreaVanquished() = False Then AggroMoveTo(11472, 8382)
	If GetAreaVanquished() = False Then AggroMoveTo(12444, 6652)
	If GetAreaVanquished() = False Then AggroMoveTo(15607, 9804)
	If GetAreaVanquished() = False Then AggroMoveTo(16788, 9096)
	If GetAreaVanquished() = False Then AggroMoveTo(15712, 7637)
	If GetAreaVanquished() = False Then AggroMoveTo(15016, 7942)
	If GetAreaVanquished() = False Then AggroMoveTo(13996, 5968)
	If GetAreaVanquished() = False Then AggroMoveTo(14542, 1758)
	If GetAreaVanquished() = False Then AggroMoveTo(17349, 2040)
	If GetAreaVanquished() = False Then AggroMoveTo(17820, -92)
	If GetAreaVanquished() = False Then AggroMoveTo(13012, -2047)
	If GetAreaVanquished() = False Then AggroMoveTo(11695, -1393)
	If GetAreaVanquished() = False Then AggroMoveTo(9558, -2437)
	If GetAreaVanquished() = False Then AggroMoveTo(10429, -6092)
	If GetAreaVanquished() = False Then AggroMoveTo(12050, -6665)
	If GetAreaVanquished() = False Then AggroMoveTo(17557, -2487)
	If GetAreaVanquished() = False Then AggroMoveTo(15863, -4300)
	If GetAreaVanquished() = False Then AggroMoveTo(15780, -7404)
	If GetAreaVanquished() = False Then AggroMoveTo(18404, -5474)
	If GetAreaVanquished() = False Then AggroMoveTo(20181, -6031)
	If GetAreaVanquished() = False Then AggroMoveTo(22038, -9691)
	If GetAreaVanquished() = False Then AggroMoveTo(20376, -5923)
	If GetAreaVanquished() = False Then AggroMoveTo(19297, -1664)
	If GetAreaVanquished() = False Then AggroMoveTo(21009, -454)
	If GetAreaVanquished() = False Then AggroMoveTo(18932, 447)
	If GetAreaVanquished() = False Then AggroMoveTo(18406, 724)
	If GetAreaVanquished() = False Then AggroMoveTo(20605, 2033)
	If GetAreaVanquished() = False Then AggroMoveTo(21053, 3511)
	If GetAreaVanquished() = False Then AggroMoveTo(16032, 3792)
	If GetAreaVanquished() = False Then AggroMoveTo(16965, 6388)
	If GetAreaVanquished() = False Then AggroMoveTo(20930, 5611)
EndFunc
