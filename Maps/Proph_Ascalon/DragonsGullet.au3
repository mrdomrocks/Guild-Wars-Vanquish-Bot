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

Global $aProph_Ascalon_DragonsGulletRoute01[99][2] = [ _
        [-2441, 1199], _
        [-3786, 4261], _
        [-4511, 4941], _
        [-4458, 7103], _
        [-6474, 7825], _
        [-9084, 5538], _
        [-10996, 4076], _
        [-11891, 7312], _
        [-8262, 9422], _
        [-6183, 12310], _
        [-3421, 9865], _
        [-6193, 12300], _
        [-8253, 9425], _
        [-12025, 7089], _
        [-13993, 8234], _
        [-16405, 8071], _
        [-17240, 6890], _
        [-18192, 8643], _
        [-15732, 12777], _
        [-13921, 14773], _
        [-11568, 15408], _
        [-12619, 18572], _
        [-11511, 15300], _
        [-11293, 14019], _
        [-11511, 15300], _
        [-10423, 16288], _
        [-7246, 16043], _
        [-6104, 15971], _
        [-2400, 16669], _
        [-362, 18116], _
        [3861, 16159], _
        [5213, 16640], _
        [6111, 15609], _
        [5792, 10855], _
        [6111, 15609], _
        [9631, 15570], _
        [10754, 14676], _
        [9380, 12376], _
        [11090, 14522], _
        [11626, 16120], _
        [13212, 16155], _
        [14660, 14624], _
        [15150, 11258], _
        [11539, 6690], _
        [14726, 10109], _
        [17267, 9806], _
        [17465, 8219], _
        [16784, 8091], _
        [18663, 7058], _
        [19093, 5743], _
        [18486, 5443], _
        [17637, 5785], _
        [15291, 5161], _
        [13941, 6109], _
        [16114, 5051], _
        [16515, 3569], _
        [17953, 2287], _
        [17608, 1019], _
        [19116, -2284], _
        [18379, -6191], _
        [14845, -4481], _
        [13416, -7125], _
        [13367, -7165], _
        [14688, -7752], _
        [16914, -8471], _
        [18010, -8705], _
        [16967, -10233], _
        [17865, -13635], _
        [15170, -15387], _
        [17679, -13433], _
        [16561, -10941], _
        [13151, -11479], _
        [7957, -11218], _
        [6958, -12316], _
        [5347, -12996], _
        [3999, -12033], _
        [5411, -8596], _
        [8326, -8863], _
        [10746, -8236], _
        [6118, -8232], _
        [5521, -7227], _
        [4991, -5190], _
        [4552, -4635], _
        [4257, -4033], _
        [1791, -2308], _
        [1597, -1792], _
        [2471, -1165], _
        [1610, -1792], _
        [1749, -2286], _
        [3173, -2982], _
        [6117, -2309], _
        [7063, -3150], _
        [9130, -2184], _
        [9500, -3486], _
        [11003, 578], _
        [7390, 3443], _
        [4111, 3698], _
        [3658, 3807], _
        [1460, 5313] _
]

Global $aProph_Ascalon_DragonsGulletRoute02[99][2] = [ _
        [1460, 5313], _
        [3658, 3807], _
        [4111, 3698], _
        [7390, 3443], _
        [11003, 578], _
        [9500, -3486], _
        [9130, -2184], _
        [7063, -3150], _
        [6117, -2309], _
        [3173, -2982], _
        [1749, -2286], _
        [1610, -1792], _
        [2471, -1165], _
        [1597, -1792], _
        [1791, -2308], _
        [4257, -4033], _
        [4552, -4635], _
        [4991, -5190], _
        [5521, -7227], _
        [6118, -8232], _
        [10746, -8236], _
        [8326, -8863], _
        [5411, -8596], _
        [3999, -12033], _
        [5347, -12996], _
        [6958, -12316], _
        [7957, -11218], _
        [13151, -11479], _
        [16561, -10941], _
        [17679, -13433], _
        [15170, -15387], _
        [17865, -13635], _
        [16967, -10233], _
        [18010, -8705], _
        [16914, -8471], _
        [14688, -7752], _
        [13367, -7165], _
        [13416, -7125], _
        [14845, -4481], _
        [18379, -6191], _
        [19116, -2284], _
        [17608, 1019], _
        [17953, 2287], _
        [16515, 3569], _
        [16114, 5051], _
        [13941, 6109], _
        [15291, 5161], _
        [17637, 5785], _
        [18486, 5443], _
        [19093, 5743], _
        [18663, 7058], _
        [16784, 8091], _
        [17465, 8219], _
        [17267, 9806], _
        [14726, 10109], _
        [11539, 6690], _
        [15150, 11258], _
        [14660, 14624], _
        [13212, 16155], _
        [11626, 16120], _
        [11090, 14522], _
        [9380, 12376], _
        [10754, 14676], _
        [9631, 15570], _
        [6111, 15609], _
        [5792, 10855], _
        [6111, 15609], _
        [5213, 16640], _
        [3861, 16159], _
        [-362, 18116], _
        [-2400, 16669], _
        [-6104, 15971], _
        [-7246, 16043], _
        [-10423, 16288], _
        [-11511, 15300], _
        [-11293, 14019], _
        [-11511, 15300], _
        [-12619, 18572], _
        [-11568, 15408], _
        [-13921, 14773], _
        [-15732, 12777], _
        [-18192, 8643], _
        [-17240, 6890], _
        [-16405, 8071], _
        [-13993, 8234], _
        [-12025, 7089], _
        [-8253, 9425], _
        [-6193, 12300], _
        [-3421, 9865], _
        [-6183, 12310], _
        [-8262, 9422], _
        [-11891, 7312], _
        [-10996, 4076], _
        [-9084, 5538], _
        [-6474, 7825], _
        [-4458, 7103], _
        [-4511, 4941], _
        [-3786, 4261], _
        [-2441, 1199] _
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


	_Vanquisher_RunVanquishRoute($aProph_Ascalon_DragonsGulletRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Ascalon_DragonsGulletRoute02)
EndFunc
