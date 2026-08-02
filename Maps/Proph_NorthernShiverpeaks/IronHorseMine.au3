Global $vqrange = 1450
Global $ActionCounter = 1

Global $aIronHorseMineOutpostPath[2][2] = [ _
	[-11688, 11666], _
	[-12281, 11654] _
]

Global $aIronHorseMineTransitPath[10][2] = [ _
	[-14364, 12884], _
	[-7306, 17104], _
	[-1519, 15606], _
	[4887, 17101], _
	[10751, 16175], _
	[12604, 19236], _
	[16305, 19985], _
	[18238, 17604], _
	[20070, 20046], _
	[20520, 20584] _
]

Global $aProph_NorthernShiverpeaks_IronHorseMineRoute01[85][2] = [ _
        [-23955, 4146], _
        [-23588, 6713], _
        [-17833, 5133], _
        [-18474, 605], _
        [-18087, -3239], _
        [-19673, -5919], _
        [-16641, -7577], _
        [-12902, -5919], _
        [-15653, -3204], _
        [-12656, -4826], _
        [-8988, -3239], _
        [-6237, -3380], _
        [-3322, -1353], _
        [-618, -267], _
        [-421, 1340], _
        [386, 3895], _
        [-47, 5755], _
        [-2412, 6983], _
        [-3622, 5863], _
        [-1347, 3155], _
        [25, 3732], _
        [-1203, 6676], _
        [-4326, 7091], _
        [-7826, 6115], _
        [-8221, 2052], _
        [-5804, 1975], _
        [-10501, 1902], _
        [-12013, 3414], _
        [-14315, 5220], _
        [-15918, 7928], _
        [-18626, 6597], _
        [-15150, 7748], _
        [-13525, 3979], _
        [-8447, 5852], _
        [-1766, 8177], _
        [468, 10592], _
        [3673, 9960], _
        [3515, 6710], _
        [7443, 7319], _
        [7660, 9277], _
        [7746, 9207], _
        [8477, 7286], _
        [7777, 3275], _
        [11620, 3419], _
        [12472, 6077], _
        [9424, 7594], _
        [12703, 5730], _
        [12024, 3202], _
        [14827, 3982], _
        [13830, 5470], _
        [16970, 6146], _
        [18765, 7824], _
        [18413, 10728], _
        [20551, 10300], _
        [23255, 10855], _
        [24931, 10069], _
        [25130, 6254], _
        [23954, 5154], _
        [22579, 4391], _
        [25866, 1698], _
        [25626, -1969], _
        [24610, -3549], _
        [25338, -6370], _
        [23036, -5083], _
        [20576, -6573], _
        [16716, -6257], _
        [17100, -7363], _
        [15317, -9913], _
        [10668, -7589], _
        [10803, -4564], _
        [12315, -2398], _
        [9787, -1156], _
        [4991, -5907], _
        [1886, -6586], _
        [3691, -4607], _
        [3101, -2217], _
        [6599, 2777], _
        [2609, -2524], _
        [586, -3841], _
        [571, -5199], _
        [-872, -6129], _
        [-135, -7672], _
        [-4699, -8582], _
        [-8368, -7730], _
        [-7877, -4046] _
]

Global $aProph_NorthernShiverpeaks_IronHorseMineRoute02[85][2] = [ _
        [-7877, -4046], _
        [-8368, -7730], _
        [-4699, -8582], _
        [-135, -7672], _
        [-872, -6129], _
        [571, -5199], _
        [586, -3841], _
        [2609, -2524], _
        [6599, 2777], _
        [3101, -2217], _
        [3691, -4607], _
        [1886, -6586], _
        [4991, -5907], _
        [9787, -1156], _
        [12315, -2398], _
        [10803, -4564], _
        [10668, -7589], _
        [15317, -9913], _
        [17100, -7363], _
        [16716, -6257], _
        [20576, -6573], _
        [23036, -5083], _
        [25338, -6370], _
        [24610, -3549], _
        [25626, -1969], _
        [25866, 1698], _
        [22579, 4391], _
        [23954, 5154], _
        [25130, 6254], _
        [24931, 10069], _
        [23255, 10855], _
        [20551, 10300], _
        [18413, 10728], _
        [18765, 7824], _
        [16970, 6146], _
        [13830, 5470], _
        [14827, 3982], _
        [12024, 3202], _
        [12703, 5730], _
        [9424, 7594], _
        [12472, 6077], _
        [11620, 3419], _
        [7777, 3275], _
        [8477, 7286], _
        [7746, 9207], _
        [7660, 9277], _
        [7443, 7319], _
        [3515, 6710], _
        [3673, 9960], _
        [468, 10592], _
        [-1766, 8177], _
        [-8447, 5852], _
        [-13525, 3979], _
        [-15150, 7748], _
        [-18626, 6597], _
        [-15918, 7928], _
        [-14315, 5220], _
        [-12013, 3414], _
        [-10501, 1902], _
        [-5804, 1975], _
        [-8221, 2052], _
        [-7826, 6115], _
        [-4326, 7091], _
        [-1203, 6676], _
        [25, 3732], _
        [-1347, 3155], _
        [-3622, 5863], _
        [-2412, 6983], _
        [-47, 5755], _
        [386, 3895], _
        [-421, 1340], _
        [-618, -267], _
        [-3322, -1353], _
        [-6237, -3380], _
        [-8988, -3239], _
        [-12656, -4826], _
        [-15653, -3204], _
        [-12902, -5919], _
        [-16641, -7577], _
        [-19673, -5919], _
        [-18087, -3239], _
        [-18474, 605], _
        [-17833, 5133], _
        [-23588, 6713], _
        [-23955, 4146] _
]

Func GoOutIronHorseMine()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $IronHorseMine_Map Then Return

	If $l_i_Map = $IronHorseMine_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> IronHorseMine (portal 1)")
		_Vanquisher_RunAggroPortalPath($aIronHorseMineOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $IronHorseMine_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> IronHorseMine (portal 2)")
		_Vanquisher_RunAggroPortalPath($aIronHorseMineTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQIronHorseMine()
	If GetMapID() <> $IronHorseMine_Map And GetMapID() <> $IronHorseMine_Outpost And GetMapID() <> $IronHorseMine_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for IronHorseMine.")
		TravelTo($IronHorseMine_Outpost)
	EndIf

	If GetMapID() = $IronHorseMine_Outpost Or GetMapID() = $IronHorseMine_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutIronHorseMine()
		If GetMapID() <> $IronHorseMine_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need IronHorseMine (" & $IronHorseMine_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $IronHorseMine_Map Then
		CurrentAction("IronHorseMine route waiting - on map " & GetMapID() & ", need " & $IronHorseMine_Map & ".")
		Return
	EndIf

	CurrentAction("Starting IronHorseMine vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_NorthernShiverpeaks_IronHorseMineRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_NorthernShiverpeaks_IronHorseMineRoute02)
EndFunc

