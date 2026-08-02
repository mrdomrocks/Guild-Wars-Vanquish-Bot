Global $vqrange = 1450
Global $ActionCounter = 1

Global $aMajestysRestOutpostPath[2][2] = [ _
	[-5199, 16327], _
	[-5252, 15997] _
]

Global $aMajestysRestTransitPath[7][2] = [ _
	[-6302, 14890], _
	[-13411, 14710], _
	[-16718, 13517], _
	[-17978, 10435], _
	[-18374, 7235], _
	[-20108, 2457], _
	[-20274, 1812] _
]

Global $aMajestysRestTransit2Path[11][2] = [ _
	[16716, 2887], _
	[11180, 7961], _
	[3437, 8483], _
	[-2499, 8992], _
	[-7004, 10342], _
	[-12458, 9257], _
	[-14167, 10912], _
	[-17071, 7303], _
	[-18812, 5631], _
	[-19523, 3658], _
	[-20190, 3714] _
]

Global $aProph_Kryta_MajestysRestRoute01[77][2] = [ _
        [21522, -3238], _
        [21779, 2461], _
        [22541, 4683], _
        [21272, 6143], _
        [21113, 4524], _
        [20256, 3604], _
        [18129, 2842], _
        [20319, 2048], _
        [18986, 937], _
        [20192, 1033], _
        [20129, -1760], _
        [18193, -269], _
        [16865, 420], _
        [16252, -1572], _
        [17470, -1816], _
        [14470, -1522], _
        [13929, -179], _
        [13789, 167], _
        [13383, 1318], _
        [12857, 1127], _
        [14042, 1574], _
        [13386, 1320], _
        [13783, 170], _
        [13925, -184], _
        [14467, -1528], _
        [15320, -4921], _
        [19111, -7402], _
        [15322, -4908], _
        [14287, -5855], _
        [13149, -2097], _
        [11484, -6221], _
        [8805, -3632], _
        [10805, -966], _
        [10709, 3128], _
        [12931, 4938], _
        [15534, 3509], _
        [16319, 1057], _
        [15541, 3507], _
        [18276, 5403], _
        [15542, 3517], _
        [12933, 4938], _
        [13397, 6362], _
        [11537, 7896], _
        [9509, 7662], _
        [7572, 6635], _
        [7780, 4373], _
        [9496, 5933], _
        [9535, 7677], _
        [7589, 6650], _
        [7797, 4379], _
        [7341, 1421], _
        [8809, -3599], _
        [7368, 1495], _
        [4757, 4572], _
        [2336, 1664], _
        [-2741, -521], _
        [-5523, 833], _
        [-5316, -2823], _
        [-8030, -1960], _
        [-6194, -3179], _
        [-9703, -4954], _
        [-8470, -6348], _
        [-10353, -6155], _
        [-9691, -4930], _
        [-11913, -5155], _
        [-10456, -4250], _
        [-11244, -2854], _
        [-10907, -1180], _
        [-8225, -1147], _
        [-6721, 1585], _
        [-9188, 5174], _
        [-13314, 2000], _
        [-11277, -543], _
        [-13536, 1472], _
        [-17144, -511], _
        [-22539, 1049], _
        [-23160, 337] _
]

Global $aProph_Kryta_MajestysRestRoute02[77][2] = [ _
        [-23160, 337], _
        [-22539, 1049], _
        [-17144, -511], _
        [-13536, 1472], _
        [-11277, -543], _
        [-13314, 2000], _
        [-9188, 5174], _
        [-6721, 1585], _
        [-8225, -1147], _
        [-10907, -1180], _
        [-11244, -2854], _
        [-10456, -4250], _
        [-11913, -5155], _
        [-9691, -4930], _
        [-10353, -6155], _
        [-8470, -6348], _
        [-9703, -4954], _
        [-6194, -3179], _
        [-8030, -1960], _
        [-5316, -2823], _
        [-5523, 833], _
        [-2741, -521], _
        [2336, 1664], _
        [4757, 4572], _
        [7368, 1495], _
        [8809, -3599], _
        [7341, 1421], _
        [7797, 4379], _
        [7589, 6650], _
        [9535, 7677], _
        [9496, 5933], _
        [7780, 4373], _
        [7572, 6635], _
        [9509, 7662], _
        [11537, 7896], _
        [13397, 6362], _
        [12933, 4938], _
        [15542, 3517], _
        [18276, 5403], _
        [15541, 3507], _
        [16319, 1057], _
        [15534, 3509], _
        [12931, 4938], _
        [10709, 3128], _
        [10805, -966], _
        [8805, -3632], _
        [11484, -6221], _
        [13149, -2097], _
        [14287, -5855], _
        [15322, -4908], _
        [19111, -7402], _
        [15320, -4921], _
        [14467, -1528], _
        [13925, -184], _
        [13783, 170], _
        [13386, 1320], _
        [14042, 1574], _
        [12857, 1127], _
        [13383, 1318], _
        [13789, 167], _
        [13929, -179], _
        [14470, -1522], _
        [17470, -1816], _
        [16252, -1572], _
        [16865, 420], _
        [18193, -269], _
        [20129, -1760], _
        [20192, 1033], _
        [18986, 937], _
        [20319, 2048], _
        [18129, 2842], _
        [20256, 3604], _
        [21113, 4524], _
        [21272, 6143], _
        [22541, 4683], _
        [21779, 2461], _
        [21522, -3238] _
]

Func GoOutMajestysRest()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $MajestysRest_Map Then Return

	If $l_i_Map = $MajestysRest_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MajestysRest (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMajestysRestOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MajestysRest_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MajestysRest (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMajestysRestTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MajestysRest_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MajestysRest (portal 3)")
		_Vanquisher_RunAggroPortalPath($aMajestysRestTransit2Path, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQMajestysRest()
	If GetMapID() <> $MajestysRest_Map And GetMapID() <> $MajestysRest_Outpost And GetMapID() <> $MajestysRest_Transit And GetMapID() <> $MajestysRest_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MajestysRest.")
		TravelTo($MajestysRest_Outpost)
	EndIf

	If GetMapID() = $MajestysRest_Outpost Or GetMapID() = $MajestysRest_Transit Or GetMapID() = $MajestysRest_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutMajestysRest()
		If GetMapID() <> $MajestysRest_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MajestysRest (" & $MajestysRest_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $MajestysRest_Map Then
		CurrentAction("MajestysRest route waiting - on map " & GetMapID() & ", need " & $MajestysRest_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MajestysRest vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_Kryta_MajestysRestRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_MajestysRestRoute02)
EndFunc

