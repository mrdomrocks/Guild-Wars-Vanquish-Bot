#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDragonsGulletTransitPath[13][2] = [ _
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
	[21436, 17268], _
	[21431, 17396] _
]

Global $aDragonsGulletTransit2Path[19][2] = [ _
	[-18448, -11278], _
	[-19523, -8452], _
	[-17298, -5976], _
	[-16454, -6435], _
	[-15811, -6814], _
	[-15235, -7517], _
	[-14899, -8035], _
	[-14241, -8715], _
	[-13971, -9342], _
	[-13495, -9042], _
	[-12983, -8753], _
	[-12597, -6271], _
	[-11975, -4276], _
	[-10411, -4387], _
	[-8600, -3114], _
	[-8221, -2061], _
	[-7238, -1008], _
	[-4682, -1082], _
	[-4577, -978] _
]

Func GoOutDragonsGullet()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DragonsGullet_Map Then Return

	If $l_i_Map = $DragonsGullet_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("DiessaLowlands -> FlameTempleCorridor (en route to Dragon's Gullet)")
		_Vanquisher_RunAggroPortalPath($aDragonsGulletTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $DragonsGullet_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("FlameTempleCorridor -> DragonsGullet")
		_Vanquisher_RunAggroPortalPath($aDragonsGulletTransit2Path, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDragonsGullet()
	If GetMapID() <> $DragonsGullet_Map And GetMapID() <> $DragonsGullet_Transit And GetMapID() <> $DragonsGullet_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("DragonsGullet route waiting - on map " & GetMapID() & ", need " & $DragonsGullet_Map & " via Diessa Lowlands and Flame Temple Corridor.")
		Return
	EndIf

	If GetMapID() = $DragonsGullet_Transit Or GetMapID() = $DragonsGullet_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutDragonsGullet()
		If GetMapID() <> $DragonsGullet_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DragonsGullet (" & $DragonsGullet_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $DragonsGullet_Map Then
		CurrentAction("DragonsGullet route waiting - on map " & GetMapID() & ", need " & $DragonsGullet_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DragonsGullet vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-2441, 1199)
	If GetAreaVanquished() = False Then AggroMoveTo(-3786, 4261)
	If GetAreaVanquished() = False Then AggroMoveTo(-4511, 4941)
	If GetAreaVanquished() = False Then AggroMoveTo(-4458, 7103)
	If GetAreaVanquished() = False Then AggroMoveTo(-6474, 7825)
	If GetAreaVanquished() = False Then AggroMoveTo(-9084, 5538)
	If GetAreaVanquished() = False Then AggroMoveTo(-10996, 4076)
	If GetAreaVanquished() = False Then AggroMoveTo(-11891, 7312)
	If GetAreaVanquished() = False Then AggroMoveTo(-8262, 9422)
	If GetAreaVanquished() = False Then AggroMoveTo(-6183, 12310)
	If GetAreaVanquished() = False Then AggroMoveTo(-3421, 9865)
	If GetAreaVanquished() = False Then AggroMoveTo(-6193, 12300)
	If GetAreaVanquished() = False Then AggroMoveTo(-8253, 9425)
	If GetAreaVanquished() = False Then AggroMoveTo(-12025, 7089)
	If GetAreaVanquished() = False Then AggroMoveTo(-13993, 8234)
	If GetAreaVanquished() = False Then AggroMoveTo(-16405, 8071)
	If GetAreaVanquished() = False Then AggroMoveTo(-17240, 6890)
	If GetAreaVanquished() = False Then AggroMoveTo(-18192, 8643)
	If GetAreaVanquished() = False Then AggroMoveTo(-15732, 12777)
	If GetAreaVanquished() = False Then AggroMoveTo(-13921, 14773)
	If GetAreaVanquished() = False Then AggroMoveTo(-11568, 15408)
	If GetAreaVanquished() = False Then AggroMoveTo(-12619, 18572)
	If GetAreaVanquished() = False Then AggroMoveTo(-11511, 15300)
	If GetAreaVanquished() = False Then AggroMoveTo(-11293, 14019)
	If GetAreaVanquished() = False Then AggroMoveTo(-11511, 15300)
	If GetAreaVanquished() = False Then AggroMoveTo(-10423, 16288)
	If GetAreaVanquished() = False Then AggroMoveTo(-7246, 16043)
	If GetAreaVanquished() = False Then AggroMoveTo(-6104, 15971)
	If GetAreaVanquished() = False Then AggroMoveTo(-2400, 16669)
	If GetAreaVanquished() = False Then AggroMoveTo(-362, 18116)
	If GetAreaVanquished() = False Then AggroMoveTo(3861, 16159)
	If GetAreaVanquished() = False Then AggroMoveTo(5213, 16640)
	If GetAreaVanquished() = False Then AggroMoveTo(6111, 15609)
	If GetAreaVanquished() = False Then AggroMoveTo(5792, 10855)
	If GetAreaVanquished() = False Then AggroMoveTo(6111, 15609)
	If GetAreaVanquished() = False Then AggroMoveTo(9631, 15570)
	If GetAreaVanquished() = False Then AggroMoveTo(10754, 14676)
	If GetAreaVanquished() = False Then AggroMoveTo(9380, 12376)
	If GetAreaVanquished() = False Then AggroMoveTo(11090, 14522)
	If GetAreaVanquished() = False Then AggroMoveTo(11626, 16120)
	If GetAreaVanquished() = False Then AggroMoveTo(13212, 16155)
	If GetAreaVanquished() = False Then AggroMoveTo(14660, 14624)
	If GetAreaVanquished() = False Then AggroMoveTo(15150, 11258)
	If GetAreaVanquished() = False Then AggroMoveTo(11539, 6690)
	If GetAreaVanquished() = False Then AggroMoveTo(14726, 10109)
	If GetAreaVanquished() = False Then AggroMoveTo(17267, 9806)
	If GetAreaVanquished() = False Then AggroMoveTo(17465, 8219)
	If GetAreaVanquished() = False Then AggroMoveTo(16784, 8091)
	If GetAreaVanquished() = False Then AggroMoveTo(18663, 7058)
	If GetAreaVanquished() = False Then AggroMoveTo(19093, 5743)
	If GetAreaVanquished() = False Then AggroMoveTo(18486, 5443)
	If GetAreaVanquished() = False Then AggroMoveTo(17637, 5785)
	If GetAreaVanquished() = False Then AggroMoveTo(15291, 5161)
	If GetAreaVanquished() = False Then AggroMoveTo(13941, 6109)
	If GetAreaVanquished() = False Then AggroMoveTo(16114, 5051)
	If GetAreaVanquished() = False Then AggroMoveTo(16515, 3569)
	If GetAreaVanquished() = False Then AggroMoveTo(17953, 2287)
	If GetAreaVanquished() = False Then AggroMoveTo(17608, 1019)
	If GetAreaVanquished() = False Then AggroMoveTo(19116, -2284)
	If GetAreaVanquished() = False Then AggroMoveTo(18379, -6191)
	If GetAreaVanquished() = False Then AggroMoveTo(14845, -4481)
	If GetAreaVanquished() = False Then AggroMoveTo(13416, -7125)
	If GetAreaVanquished() = False Then AggroMoveTo(13367, -7165)
	If GetAreaVanquished() = False Then AggroMoveTo(14688, -7752)
	If GetAreaVanquished() = False Then AggroMoveTo(16914, -8471)
	If GetAreaVanquished() = False Then AggroMoveTo(18010, -8705)
	If GetAreaVanquished() = False Then AggroMoveTo(16967, -10233)
	If GetAreaVanquished() = False Then AggroMoveTo(17865, -13635)
	If GetAreaVanquished() = False Then AggroMoveTo(15170, -15387)
	If GetAreaVanquished() = False Then AggroMoveTo(17679, -13433)
	If GetAreaVanquished() = False Then AggroMoveTo(16561, -10941)
	If GetAreaVanquished() = False Then AggroMoveTo(13151, -11479)
	If GetAreaVanquished() = False Then AggroMoveTo(7957, -11218)
	If GetAreaVanquished() = False Then AggroMoveTo(6958, -12316)
	If GetAreaVanquished() = False Then AggroMoveTo(5347, -12996)
	If GetAreaVanquished() = False Then AggroMoveTo(3999, -12033)
	If GetAreaVanquished() = False Then AggroMoveTo(5411, -8596)
	If GetAreaVanquished() = False Then AggroMoveTo(8326, -8863)
	If GetAreaVanquished() = False Then AggroMoveTo(10746, -8236)
	If GetAreaVanquished() = False Then AggroMoveTo(6118, -8232)
	If GetAreaVanquished() = False Then AggroMoveTo(5521, -7227)
	If GetAreaVanquished() = False Then AggroMoveTo(4991, -5190)
	If GetAreaVanquished() = False Then AggroMoveTo(4552, -4635)
	If GetAreaVanquished() = False Then AggroMoveTo(4257, -4033)
	If GetAreaVanquished() = False Then AggroMoveTo(1791, -2308)
	If GetAreaVanquished() = False Then AggroMoveTo(1597, -1792)
	If GetAreaVanquished() = False Then AggroMoveTo(2471, -1165)
	If GetAreaVanquished() = False Then AggroMoveTo(1610, -1792)
	If GetAreaVanquished() = False Then AggroMoveTo(1749, -2286)
	If GetAreaVanquished() = False Then AggroMoveTo(3173, -2982)
	If GetAreaVanquished() = False Then AggroMoveTo(6117, -2309)
	If GetAreaVanquished() = False Then AggroMoveTo(7063, -3150)
	If GetAreaVanquished() = False Then AggroMoveTo(9130, -2184)
	If GetAreaVanquished() = False Then AggroMoveTo(9500, -3486)
	If GetAreaVanquished() = False Then AggroMoveTo(11003, 578)
	If GetAreaVanquished() = False Then AggroMoveTo(7390, 3443)
	If GetAreaVanquished() = False Then AggroMoveTo(4111, 3698)
	If GetAreaVanquished() = False Then AggroMoveTo(3658, 3807)
	If GetAreaVanquished() = False Then AggroMoveTo(1460, 5313)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(1460, 5313)
	If GetAreaVanquished() = False Then AggroMoveTo(3658, 3807)
	If GetAreaVanquished() = False Then AggroMoveTo(4111, 3698)
	If GetAreaVanquished() = False Then AggroMoveTo(7390, 3443)
	If GetAreaVanquished() = False Then AggroMoveTo(11003, 578)
	If GetAreaVanquished() = False Then AggroMoveTo(9500, -3486)
	If GetAreaVanquished() = False Then AggroMoveTo(9130, -2184)
	If GetAreaVanquished() = False Then AggroMoveTo(7063, -3150)
	If GetAreaVanquished() = False Then AggroMoveTo(6117, -2309)
	If GetAreaVanquished() = False Then AggroMoveTo(3173, -2982)
	If GetAreaVanquished() = False Then AggroMoveTo(1749, -2286)
	If GetAreaVanquished() = False Then AggroMoveTo(1610, -1792)
	If GetAreaVanquished() = False Then AggroMoveTo(2471, -1165)
	If GetAreaVanquished() = False Then AggroMoveTo(1597, -1792)
	If GetAreaVanquished() = False Then AggroMoveTo(1791, -2308)
	If GetAreaVanquished() = False Then AggroMoveTo(4257, -4033)
	If GetAreaVanquished() = False Then AggroMoveTo(4552, -4635)
	If GetAreaVanquished() = False Then AggroMoveTo(4991, -5190)
	If GetAreaVanquished() = False Then AggroMoveTo(5521, -7227)
	If GetAreaVanquished() = False Then AggroMoveTo(6118, -8232)
	If GetAreaVanquished() = False Then AggroMoveTo(10746, -8236)
	If GetAreaVanquished() = False Then AggroMoveTo(8326, -8863)
	If GetAreaVanquished() = False Then AggroMoveTo(5411, -8596)
	If GetAreaVanquished() = False Then AggroMoveTo(3999, -12033)
	If GetAreaVanquished() = False Then AggroMoveTo(5347, -12996)
	If GetAreaVanquished() = False Then AggroMoveTo(6958, -12316)
	If GetAreaVanquished() = False Then AggroMoveTo(7957, -11218)
	If GetAreaVanquished() = False Then AggroMoveTo(13151, -11479)
	If GetAreaVanquished() = False Then AggroMoveTo(16561, -10941)
	If GetAreaVanquished() = False Then AggroMoveTo(17679, -13433)
	If GetAreaVanquished() = False Then AggroMoveTo(15170, -15387)
	If GetAreaVanquished() = False Then AggroMoveTo(17865, -13635)
	If GetAreaVanquished() = False Then AggroMoveTo(16967, -10233)
	If GetAreaVanquished() = False Then AggroMoveTo(18010, -8705)
	If GetAreaVanquished() = False Then AggroMoveTo(16914, -8471)
	If GetAreaVanquished() = False Then AggroMoveTo(14688, -7752)
	If GetAreaVanquished() = False Then AggroMoveTo(13367, -7165)
	If GetAreaVanquished() = False Then AggroMoveTo(13416, -7125)
	If GetAreaVanquished() = False Then AggroMoveTo(14845, -4481)
	If GetAreaVanquished() = False Then AggroMoveTo(18379, -6191)
	If GetAreaVanquished() = False Then AggroMoveTo(19116, -2284)
	If GetAreaVanquished() = False Then AggroMoveTo(17608, 1019)
	If GetAreaVanquished() = False Then AggroMoveTo(17953, 2287)
	If GetAreaVanquished() = False Then AggroMoveTo(16515, 3569)
	If GetAreaVanquished() = False Then AggroMoveTo(16114, 5051)
	If GetAreaVanquished() = False Then AggroMoveTo(13941, 6109)
	If GetAreaVanquished() = False Then AggroMoveTo(15291, 5161)
	If GetAreaVanquished() = False Then AggroMoveTo(17637, 5785)
	If GetAreaVanquished() = False Then AggroMoveTo(18486, 5443)
	If GetAreaVanquished() = False Then AggroMoveTo(19093, 5743)
	If GetAreaVanquished() = False Then AggroMoveTo(18663, 7058)
	If GetAreaVanquished() = False Then AggroMoveTo(16784, 8091)
	If GetAreaVanquished() = False Then AggroMoveTo(17465, 8219)
	If GetAreaVanquished() = False Then AggroMoveTo(17267, 9806)
	If GetAreaVanquished() = False Then AggroMoveTo(14726, 10109)
	If GetAreaVanquished() = False Then AggroMoveTo(11539, 6690)
	If GetAreaVanquished() = False Then AggroMoveTo(15150, 11258)
	If GetAreaVanquished() = False Then AggroMoveTo(14660, 14624)
	If GetAreaVanquished() = False Then AggroMoveTo(13212, 16155)
	If GetAreaVanquished() = False Then AggroMoveTo(11626, 16120)
	If GetAreaVanquished() = False Then AggroMoveTo(11090, 14522)
	If GetAreaVanquished() = False Then AggroMoveTo(9380, 12376)
	If GetAreaVanquished() = False Then AggroMoveTo(10754, 14676)
	If GetAreaVanquished() = False Then AggroMoveTo(9631, 15570)
	If GetAreaVanquished() = False Then AggroMoveTo(6111, 15609)
	If GetAreaVanquished() = False Then AggroMoveTo(5792, 10855)
	If GetAreaVanquished() = False Then AggroMoveTo(6111, 15609)
	If GetAreaVanquished() = False Then AggroMoveTo(5213, 16640)
	If GetAreaVanquished() = False Then AggroMoveTo(3861, 16159)
	If GetAreaVanquished() = False Then AggroMoveTo(-362, 18116)
	If GetAreaVanquished() = False Then AggroMoveTo(-2400, 16669)
	If GetAreaVanquished() = False Then AggroMoveTo(-6104, 15971)
	If GetAreaVanquished() = False Then AggroMoveTo(-7246, 16043)
	If GetAreaVanquished() = False Then AggroMoveTo(-10423, 16288)
	If GetAreaVanquished() = False Then AggroMoveTo(-11511, 15300)
	If GetAreaVanquished() = False Then AggroMoveTo(-11293, 14019)
	If GetAreaVanquished() = False Then AggroMoveTo(-11511, 15300)
	If GetAreaVanquished() = False Then AggroMoveTo(-12619, 18572)
	If GetAreaVanquished() = False Then AggroMoveTo(-11568, 15408)
	If GetAreaVanquished() = False Then AggroMoveTo(-13921, 14773)
	If GetAreaVanquished() = False Then AggroMoveTo(-15732, 12777)
	If GetAreaVanquished() = False Then AggroMoveTo(-18192, 8643)
	If GetAreaVanquished() = False Then AggroMoveTo(-17240, 6890)
	If GetAreaVanquished() = False Then AggroMoveTo(-16405, 8071)
	If GetAreaVanquished() = False Then AggroMoveTo(-13993, 8234)
	If GetAreaVanquished() = False Then AggroMoveTo(-12025, 7089)
	If GetAreaVanquished() = False Then AggroMoveTo(-8253, 9425)
	If GetAreaVanquished() = False Then AggroMoveTo(-6193, 12300)
	If GetAreaVanquished() = False Then AggroMoveTo(-3421, 9865)
	If GetAreaVanquished() = False Then AggroMoveTo(-6183, 12310)
	If GetAreaVanquished() = False Then AggroMoveTo(-8262, 9422)
	If GetAreaVanquished() = False Then AggroMoveTo(-11891, 7312)
	If GetAreaVanquished() = False Then AggroMoveTo(-10996, 4076)
	If GetAreaVanquished() = False Then AggroMoveTo(-9084, 5538)
	If GetAreaVanquished() = False Then AggroMoveTo(-6474, 7825)
	If GetAreaVanquished() = False Then AggroMoveTo(-4458, 7103)
	If GetAreaVanquished() = False Then AggroMoveTo(-4511, 4941)
	If GetAreaVanquished() = False Then AggroMoveTo(-3786, 4261)
	If GetAreaVanquished() = False Then AggroMoveTo(-2441, 1199)
EndFunc
