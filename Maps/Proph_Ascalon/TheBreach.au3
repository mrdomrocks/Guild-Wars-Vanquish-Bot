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

	Local $aWaypoints[69][4] = [ _
		[20930, 5611, " ", $vqrange], _
		[16965, 6388, " ", $vqrange], _
		[16032, 3792, " ", $vqrange], _
		[21053, 3511, " ", $vqrange], _
		[20605, 2033, " ", $vqrange], _
		[18406, 724, " ", $vqrange], _
		[18932, 447, " ", $vqrange], _
		[21009, -454, " ", $vqrange], _
		[19297, -1664, " ", $vqrange], _
		[20376, -5923, " ", $vqrange], _
		[22038, -9691, " ", $vqrange], _
		[20181, -6031, " ", $vqrange], _
		[18404, -5474, " ", $vqrange], _
		[15780, -7404, " ", $vqrange], _
		[15863, -4300, " ", $vqrange], _
		[17557, -2487, " ", $vqrange], _
		[12050, -6665, " ", $vqrange], _
		[10429, -6092, " ", $vqrange], _
		[9558, -2437, " ", $vqrange], _
		[11695, -1393, " ", $vqrange], _
		[13012, -2047, " ", $vqrange], _
		[17820, -92, " ", $vqrange], _
		[17349, 2040, " ", $vqrange], _
		[14542, 1758, " ", $vqrange], _
		[13996, 5968, " ", $vqrange], _
		[15016, 7942, " ", $vqrange], _
		[15712, 7637, " ", $vqrange], _
		[16788, 9096, " ", $vqrange], _
		[15607, 9804, " ", $vqrange], _
		[12444, 6652, " ", $vqrange], _
		[11472, 8382, " ", $vqrange], _
		[12019, 6902, " ", $vqrange], _
		[11956, 3346, " ", $vqrange], _
		[9122, 3441, " ", $vqrange], _
		[7517, 5269, " ", $vqrange], _
		[1742, 4710, " ", $vqrange], _
		[-569, 3824, " ", $vqrange], _
		[-1746, 5613, " ", $vqrange], _
		[2480, 7805, " ", $vqrange], _
		[3938, 9623, " ", $vqrange], _
		[8203, 9945, " ", $vqrange], _
		[2532, 7833, " ", $vqrange], _
		[-1144, 10997, " ", $vqrange], _
		[-3937, 9496, " ", $vqrange], _
		[-6036, 9999, " ", $vqrange], _
		[-6832, 5916, " ", $vqrange], _
		[-8200, 9393, " ", $vqrange], _
		[-12489, 9174, " ", $vqrange], _
		[-13055, 8417, " ", $vqrange], _
		[-13224, 6779, " ", $vqrange], _
		[-14404, 5028, " ", $vqrange], _
		[-17412, 4265, " ", $vqrange], _
		[-14248, 4862, " ", $vqrange], _
		[-11130, 2208, " ", $vqrange], _
		[-6693, 3566, " ", $vqrange], _
		[-9310, -1710, " ", $vqrange], _
		[-8204, -2515, " ", $vqrange], _
		[-7186, -6756, " ", $vqrange], _
		[-8669, -4135, " ", $vqrange], _
		[-11289, -3298, " ", $vqrange], _
		[-12825, -4227, " ", $vqrange], _
		[-13632, -1787, " ", $vqrange], _
		[-12762, -4156, " ", $vqrange], _
		[-9920, -6053, " ", $vqrange], _
		[-9565, -8243, " ", $vqrange], _
		[-6846, -8057, " ", $vqrange], _
		[-4791, -6985, " ", $vqrange], _
		[-3600, -8540, " ", $vqrange], _
		[-3795, -8404, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
