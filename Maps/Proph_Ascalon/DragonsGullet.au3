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

	Local $aWaypoints[99][4] = [ _
		[-2441, 1199, " ", $vqrange], _
		[-3786, 4261, " ", $vqrange], _
		[-4511, 4941, " ", $vqrange], _
		[-4458, 7103, " ", $vqrange], _
		[-6474, 7825, " ", $vqrange], _
		[-9084, 5538, " ", $vqrange], _
		[-10996, 4076, " ", $vqrange], _
		[-11891, 7312, " ", $vqrange], _
		[-8262, 9422, " ", $vqrange], _
		[-6183, 12310, " ", $vqrange], _
		[-3421, 9865, " ", $vqrange], _
		[-6193, 12300, " ", $vqrange], _
		[-8253, 9425, " ", $vqrange], _
		[-12025, 7089, " ", $vqrange], _
		[-13993, 8234, " ", $vqrange], _
		[-16405, 8071, " ", $vqrange], _
		[-17240, 6890, " ", $vqrange], _
		[-18192, 8643, " ", $vqrange], _
		[-15732, 12777, " ", $vqrange], _
		[-13921, 14773, " ", $vqrange], _
		[-11568, 15408, " ", $vqrange], _
		[-12619, 18572, " ", $vqrange], _
		[-11511, 15300, " ", $vqrange], _
		[-11293, 14019, " ", $vqrange], _
		[-11511, 15300, " ", $vqrange], _
		[-10423, 16288, " ", $vqrange], _
		[-7246, 16043, " ", $vqrange], _
		[-6104, 15971, " ", $vqrange], _
		[-2400, 16669, " ", $vqrange], _
		[-362, 18116, " ", $vqrange], _
		[3861, 16159, " ", $vqrange], _
		[5213, 16640, " ", $vqrange], _
		[6111, 15609, " ", $vqrange], _
		[5792, 10855, " ", $vqrange], _
		[6111, 15609, " ", $vqrange], _
		[9631, 15570, " ", $vqrange], _
		[10754, 14676, " ", $vqrange], _
		[9380, 12376, " ", $vqrange], _
		[11090, 14522, " ", $vqrange], _
		[11626, 16120, " ", $vqrange], _
		[13212, 16155, " ", $vqrange], _
		[14660, 14624, " ", $vqrange], _
		[15150, 11258, " ", $vqrange], _
		[11539, 6690, " ", $vqrange], _
		[14726, 10109, " ", $vqrange], _
		[17267, 9806, " ", $vqrange], _
		[17465, 8219, " ", $vqrange], _
		[16784, 8091, " ", $vqrange], _
		[18663, 7058, " ", $vqrange], _
		[19093, 5743, " ", $vqrange], _
		[18486, 5443, " ", $vqrange], _
		[17637, 5785, " ", $vqrange], _
		[15291, 5161, " ", $vqrange], _
		[13941, 6109, " ", $vqrange], _
		[16114, 5051, " ", $vqrange], _
		[16515, 3569, " ", $vqrange], _
		[17953, 2287, " ", $vqrange], _
		[17608, 1019, " ", $vqrange], _
		[19116, -2284, " ", $vqrange], _
		[18379, -6191, " ", $vqrange], _
		[14845, -4481, " ", $vqrange], _
		[13416, -7125, " ", $vqrange], _
		[13367, -7165, " ", $vqrange], _
		[14688, -7752, " ", $vqrange], _
		[16914, -8471, " ", $vqrange], _
		[18010, -8705, " ", $vqrange], _
		[16967, -10233, " ", $vqrange], _
		[17865, -13635, " ", $vqrange], _
		[15170, -15387, " ", $vqrange], _
		[17679, -13433, " ", $vqrange], _
		[16561, -10941, " ", $vqrange], _
		[13151, -11479, " ", $vqrange], _
		[7957, -11218, " ", $vqrange], _
		[6958, -12316, " ", $vqrange], _
		[5347, -12996, " ", $vqrange], _
		[3999, -12033, " ", $vqrange], _
		[5411, -8596, " ", $vqrange], _
		[8326, -8863, " ", $vqrange], _
		[10746, -8236, " ", $vqrange], _
		[6118, -8232, " ", $vqrange], _
		[5521, -7227, " ", $vqrange], _
		[4991, -5190, " ", $vqrange], _
		[4552, -4635, " ", $vqrange], _
		[4257, -4033, " ", $vqrange], _
		[1791, -2308, " ", $vqrange], _
		[1597, -1792, " ", $vqrange], _
		[2471, -1165, " ", $vqrange], _
		[1610, -1792, " ", $vqrange], _
		[1749, -2286, " ", $vqrange], _
		[3173, -2982, " ", $vqrange], _
		[6117, -2309, " ", $vqrange], _
		[7063, -3150, " ", $vqrange], _
		[9130, -2184, " ", $vqrange], _
		[9500, -3486, " ", $vqrange], _
		[11003, 578, " ", $vqrange], _
		[7390, 3443, " ", $vqrange], _
		[4111, 3698, " ", $vqrange], _
		[3658, 3807, " ", $vqrange], _
		[1460, 5313, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
