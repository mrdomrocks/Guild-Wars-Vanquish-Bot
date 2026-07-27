#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFlameTempleCorridorTransitPath[13][2] = [ _
	[3071, 13038], _
	[4060, 14711], _
	[5827, 15815], _
	[7552, 15350], _
	[11026, 16534], _
	[13413, 16545], _
	[14862, 14674], _
	[14696, 13229], _
	[17052, 14409], _
	[19976, 15169], _
	[21502, 16356], _
	[21419, 17256], _
	[21411, 17437] _
]

Func GoOutFlameTempleCorridor()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $FlameTempleCorridor_Map Then Return

	If $l_i_Map = $FlameTempleCorridor_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("DiessaLowlands -> FlameTempleCorridor")
		_Vanquisher_RunAggroPortalPath($aFlameTempleCorridorTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQFlameTempleCorridor()
	If GetMapID() <> $FlameTempleCorridor_Map And GetMapID() <> $FlameTempleCorridor_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("FlameTempleCorridor route waiting - on map " & GetMapID() & ", need " & $FlameTempleCorridor_Map & " via Diessa Lowlands.")
		Return
	EndIf

	If GetMapID() = $FlameTempleCorridor_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutFlameTempleCorridor()
		If GetMapID() <> $FlameTempleCorridor_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need FlameTempleCorridor (" & $FlameTempleCorridor_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $FlameTempleCorridor_Map Then
		CurrentAction("FlameTempleCorridor route waiting - on map " & GetMapID() & ", need " & $FlameTempleCorridor_Map & ".")
		Return
	EndIf

	CurrentAction("Starting FlameTempleCorridor vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-18448, -11278)
	If GetAreaVanquished() = False Then AggroMoveTo(-19523, -8452)
	If GetAreaVanquished() = False Then AggroMoveTo(-17298, -5976)
	If GetAreaVanquished() = False Then AggroMoveTo(-16657, -4503)
	If GetAreaVanquished() = False Then AggroMoveTo(-16531, -3652)
	If GetAreaVanquished() = False Then AggroMoveTo(-16808, -3391)
	If GetAreaVanquished() = False Then AggroMoveTo(-18534, -1989)
	If GetAreaVanquished() = False Then AggroMoveTo(-19133, -2480)
	If GetAreaVanquished() = False Then AggroMoveTo(-18534, -1989)
	If GetAreaVanquished() = False Then AggroMoveTo(-16808, -3391)
	If GetAreaVanquished() = False Then AggroMoveTo(-16531, -3652)
	If GetAreaVanquished() = False Then AggroMoveTo(-16315, -4578)
	If GetAreaVanquished() = False Then AggroMoveTo(-16167, -6465)
	If GetAreaVanquished() = False Then AggroMoveTo(-15235, -7517)
	If GetAreaVanquished() = False Then AggroMoveTo(-14899, -8035)
	If GetAreaVanquished() = False Then AggroMoveTo(-13857, -9107)
	If GetAreaVanquished() = False Then AggroMoveTo(-12983, -8753)
	If GetAreaVanquished() = False Then AggroMoveTo(-11863, -6401)
	If GetAreaVanquished() = False Then AggroMoveTo(-11669, -4432)
	If GetAreaVanquished() = False Then AggroMoveTo(-10411, -4387)
	If GetAreaVanquished() = False Then AggroMoveTo(-11228, -2247)
	If GetAreaVanquished() = False Then AggroMoveTo(-8600, -3114)
	If GetAreaVanquished() = False Then AggroMoveTo(-8045, -4392)
	If GetAreaVanquished() = False Then AggroMoveTo(-6407, -2886)
	If GetAreaVanquished() = False Then AggroMoveTo(-8426, -4766)
	If GetAreaVanquished() = False Then AggroMoveTo(-7147, -1130)
	If GetAreaVanquished() = False Then AggroMoveTo(-4804, -1469)
	If GetAreaVanquished() = False Then AggroMoveTo(-4528, -3762)
	If GetAreaVanquished() = False Then AggroMoveTo(-6297, -5441)
	If GetAreaVanquished() = False Then AggroMoveTo(-6322, -7133)
	If GetAreaVanquished() = False Then AggroMoveTo(-7358, -7061)
	If GetAreaVanquished() = False Then AggroMoveTo(-8074, -6424)
	If GetAreaVanquished() = False Then AggroMoveTo(-10037, -7547)
	If GetAreaVanquished() = False Then AggroMoveTo(-8895, -9545)
	If GetAreaVanquished() = False Then AggroMoveTo(-8074, -10340)
	If GetAreaVanquished() = False Then AggroMoveTo(-7931, -9197)
	If GetAreaVanquished() = False Then AggroMoveTo(-6145, -9120)
	If GetAreaVanquished() = False Then AggroMoveTo(-5153, -11967)
	If GetAreaVanquished() = False Then AggroMoveTo(-5987, -14539)
	If GetAreaVanquished() = False Then AggroMoveTo(-9011, -15721)
	If GetAreaVanquished() = False Then AggroMoveTo(-10509, -14685)
	If GetAreaVanquished() = False Then AggroMoveTo(-9611, -12759)
	If GetAreaVanquished() = False Then AggroMoveTo(-9303, -12518)
	If GetAreaVanquished() = False Then AggroMoveTo(-10359, -9564)
	If GetAreaVanquished() = False Then AggroMoveTo(-11546, -9365)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-11546, -9365)
	If GetAreaVanquished() = False Then AggroMoveTo(-10359, -9564)
	If GetAreaVanquished() = False Then AggroMoveTo(-9303, -12518)
	If GetAreaVanquished() = False Then AggroMoveTo(-9611, -12759)
	If GetAreaVanquished() = False Then AggroMoveTo(-10509, -14685)
	If GetAreaVanquished() = False Then AggroMoveTo(-9011, -15721)
	If GetAreaVanquished() = False Then AggroMoveTo(-5987, -14539)
	If GetAreaVanquished() = False Then AggroMoveTo(-5153, -11967)
	If GetAreaVanquished() = False Then AggroMoveTo(-6145, -9120)
	If GetAreaVanquished() = False Then AggroMoveTo(-7931, -9197)
	If GetAreaVanquished() = False Then AggroMoveTo(-8074, -10340)
	If GetAreaVanquished() = False Then AggroMoveTo(-8895, -9545)
	If GetAreaVanquished() = False Then AggroMoveTo(-10037, -7547)
	If GetAreaVanquished() = False Then AggroMoveTo(-8074, -6424)
	If GetAreaVanquished() = False Then AggroMoveTo(-7358, -7061)
	If GetAreaVanquished() = False Then AggroMoveTo(-6322, -7133)
	If GetAreaVanquished() = False Then AggroMoveTo(-6297, -5441)
	If GetAreaVanquished() = False Then AggroMoveTo(-4528, -3762)
	If GetAreaVanquished() = False Then AggroMoveTo(-4804, -1469)
	If GetAreaVanquished() = False Then AggroMoveTo(-7147, -1130)
	If GetAreaVanquished() = False Then AggroMoveTo(-8426, -4766)
	If GetAreaVanquished() = False Then AggroMoveTo(-6407, -2886)
	If GetAreaVanquished() = False Then AggroMoveTo(-8045, -4392)
	If GetAreaVanquished() = False Then AggroMoveTo(-8600, -3114)
	If GetAreaVanquished() = False Then AggroMoveTo(-11228, -2247)
	If GetAreaVanquished() = False Then AggroMoveTo(-10411, -4387)
	If GetAreaVanquished() = False Then AggroMoveTo(-11669, -4432)
	If GetAreaVanquished() = False Then AggroMoveTo(-11863, -6401)
	If GetAreaVanquished() = False Then AggroMoveTo(-12983, -8753)
	If GetAreaVanquished() = False Then AggroMoveTo(-13857, -9107)
	If GetAreaVanquished() = False Then AggroMoveTo(-14899, -8035)
	If GetAreaVanquished() = False Then AggroMoveTo(-15235, -7517)
	If GetAreaVanquished() = False Then AggroMoveTo(-16167, -6465)
	If GetAreaVanquished() = False Then AggroMoveTo(-16315, -4578)
	If GetAreaVanquished() = False Then AggroMoveTo(-16531, -3652)
	If GetAreaVanquished() = False Then AggroMoveTo(-16808, -3391)
	If GetAreaVanquished() = False Then AggroMoveTo(-18534, -1989)
	If GetAreaVanquished() = False Then AggroMoveTo(-19133, -2480)
	If GetAreaVanquished() = False Then AggroMoveTo(-18534, -1989)
	If GetAreaVanquished() = False Then AggroMoveTo(-16808, -3391)
	If GetAreaVanquished() = False Then AggroMoveTo(-16531, -3652)
	If GetAreaVanquished() = False Then AggroMoveTo(-16657, -4503)
	If GetAreaVanquished() = False Then AggroMoveTo(-17298, -5976)
	If GetAreaVanquished() = False Then AggroMoveTo(-19523, -8452)
	If GetAreaVanquished() = False Then AggroMoveTo(-18448, -11278)
EndFunc
