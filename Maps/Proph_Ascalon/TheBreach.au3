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

Global $aProph_Ascalon_TheBreachRoute01[79][2] = [ _
        [20930, 5611], _
        [16965, 6388], _
        [16032, 3792], _
        [21053, 3511], _
        [20605, 2033], _
        [18406, 724], _
        [18932, 447], _
        [21009, -454], _
        [19297, -1664], _
        [20376, -5923], _
        [22038, -9691], _
        [20181, -6031], _
        [18404, -5474], _
        [15780, -7404], _
        [15863, -4300], _
        [17557, -2487], _
        [12050, -6665], _
        [10429, -6092], _
        [9558, -2437], _
        [11695, -1393], _
        [13012, -2047], _
        [17820, -92], _
        [17349, 2040], _
        [14542, 1758], _
        [13996, 5968], _
        [15016, 7942], _
        [15712, 7637], _
        [16788, 9096], _
        [15607, 9804], _
        [12444, 6652], _
        [11472, 8382], _
        [12019, 6902], _
        [11956, 3346], _
        [9122, 3441], _
        [7517, 5269], _
        [1742, 4710], _
        [-569, 3824], _
        [-1746, 5613], _
        [2480, 7805], _
        [3938, 9623], _
        [8203, 9945], _
        [2532, 7833], _
        [-1144, 10997], _
        [-3937, 9496], _
        [-6036, 9999], _
        [-6832, 5916], _
        [-8200, 9393], _
        [-12489, 9174], _
        [-13055, 8417], _
        [-13224, 6779], _
        [-14404, 5028], _
        [-17412, 4265], _
        [-14248, 4862], _
        [-11130, 2208], _
        [-6693, 3566], _
        [-9310, -1710], _
        [-8204, -2515], _
        [-7186, -6756], _
        [-8669, -4135], _
        [-11289, -3298], _
        [-12825, -4227], _
        [-13632, -1787], _
        [-12762, -4156], _
        [-9920, -6053], _
        [-9565, -8243], _
        [-6846, -8057], _
        [-4791, -6985], _
        [-3600, -8540], _
        [-3795, -8404], _
        [-2411, -4031], _
        [948, -3193], _
        [5332, -2861], _
        [1303, -3599], _
        [441, -4559], _
        [1931, -4717], _
        [2266, -6672], _
        [6900, -6177], _
        [6863, -4430], _
        [6802, -804] _
]

Global $aProph_Ascalon_TheBreachRoute02[79][2] = [ _
        [6802, -804], _
        [6863, -4430], _
        [6900, -6177], _
        [2266, -6672], _
        [1931, -4717], _
        [441, -4559], _
        [1303, -3599], _
        [5332, -2861], _
        [948, -3193], _
        [-2411, -4031], _
        [-3795, -8404], _
        [-3600, -8540], _
        [-4791, -6985], _
        [-6846, -8057], _
        [-9565, -8243], _
        [-9920, -6053], _
        [-12762, -4156], _
        [-13632, -1787], _
        [-12825, -4227], _
        [-11289, -3298], _
        [-8669, -4135], _
        [-7186, -6756], _
        [-8204, -2515], _
        [-9310, -1710], _
        [-6693, 3566], _
        [-11130, 2208], _
        [-14248, 4862], _
        [-17412, 4265], _
        [-14404, 5028], _
        [-13224, 6779], _
        [-13055, 8417], _
        [-12489, 9174], _
        [-8200, 9393], _
        [-6832, 5916], _
        [-6036, 9999], _
        [-3937, 9496], _
        [-1144, 10997], _
        [2532, 7833], _
        [8203, 9945], _
        [3938, 9623], _
        [2480, 7805], _
        [-1746, 5613], _
        [-569, 3824], _
        [1742, 4710], _
        [7517, 5269], _
        [9122, 3441], _
        [11956, 3346], _
        [12019, 6902], _
        [11472, 8382], _
        [12444, 6652], _
        [15607, 9804], _
        [16788, 9096], _
        [15712, 7637], _
        [15016, 7942], _
        [13996, 5968], _
        [14542, 1758], _
        [17349, 2040], _
        [17820, -92], _
        [13012, -2047], _
        [11695, -1393], _
        [9558, -2437], _
        [10429, -6092], _
        [12050, -6665], _
        [17557, -2487], _
        [15863, -4300], _
        [15780, -7404], _
        [18404, -5474], _
        [20181, -6031], _
        [22038, -9691], _
        [20376, -5923], _
        [19297, -1664], _
        [21009, -454], _
        [18932, 447], _
        [18406, 724], _
        [20605, 2033], _
        [21053, 3511], _
        [16032, 3792], _
        [16965, 6388], _
        [20930, 5611] _
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


	_Vanquisher_RunVanquishRoute($aProph_Ascalon_TheBreachRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Ascalon_TheBreachRoute02)
EndFunc
