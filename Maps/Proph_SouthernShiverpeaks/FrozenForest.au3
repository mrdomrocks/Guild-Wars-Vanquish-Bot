Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFrozenForestOutpostPath[2][2] = [ _
	[-7081, -31932], _
	[-7584, -31736] _
]

Global $aProph_SouthernShiverpeaks_FrozenForestRoute01[78][2] = [ _
        [18151, 12141], _
        [16413, 9831], _
        [20265, 8296], _
        [19123, 7702], _
        [15467, 9347], _
        [19031, 6308], _
        [18392, 2870], _
        [21053, -1459], _
        [20321, -5133], _
        [24797, -6774], _
        [24631, -8158], _
        [21744, -11748], _
        [20377, -11910], _
        [16408, -9408], _
        [8933, -11266], _
        [8850, -8806], _
        [8754, -6628], _
        [9942, -3209], _
        [12002, -2036], _
        [13267, 276], _
        [12141, 3287], _
        [11737, -1857], _
        [9829, -3576], _
        [8480, -8374], _
        [5662, -8434], _
        [1967, -8690], _
        [1239, -10379], _
        [-968, -10710], _
        [-4514, -12776], _
        [-7623, -11384], _
        [-4984, -8556], _
        [-5415, -6693], _
        [-5927, -6540], _
        [-9970, -5426], _
        [-11880, -4907], _
        [-14947, -2132], _
        [-17325, -5991], _
        [-18296, -10399], _
        [-21273, -12960], _
        [-23979, -14251], _
        [-19021, -11478], _
        [-17034, -8235], _
        [-11074, -5258], _
        [-9982, -5414], _
        [-5915, -6537], _
        [-1476, -2895], _
        [472, -3480], _
        [2263, -1110], _
        [5223, 1431], _
        [8529, 3269], _
        [8955, 7064], _
        [8442, 8708], _
        [9560, 11384], _
        [13216, 12981], _
        [8355, 10796], _
        [5634, 9877], _
        [2865, 11502], _
        [1050, 10739], _
        [-1172, 9532], _
        [-1039, 7966], _
        [-201, 5239], _
        [23, -5], _
        [2230, -1164], _
        [474, -3477], _
        [-2476, -2002], _
        [-3893, 534], _
        [-9794, 1408], _
        [-13349, 4174], _
        [-8234, 4263], _
        [-9187, 10575], _
        [-12079, 5795], _
        [-15484, 4146], _
        [-16689, 4198], _
        [-19434, 5491], _
        [-20120, 7268], _
        [-23613, 8479], _
        [-19820, 7330], _
        [-16794, 8727] _
]

Global $aProph_SouthernShiverpeaks_FrozenForestRoute02[78][2] = [ _
        [-16794, 8727], _
        [-19820, 7330], _
        [-23613, 8479], _
        [-20120, 7268], _
        [-19434, 5491], _
        [-16689, 4198], _
        [-15484, 4146], _
        [-12079, 5795], _
        [-9187, 10575], _
        [-8234, 4263], _
        [-13349, 4174], _
        [-9794, 1408], _
        [-3893, 534], _
        [-2476, -2002], _
        [474, -3477], _
        [2230, -1164], _
        [23, -5], _
        [-201, 5239], _
        [-1039, 7966], _
        [-1172, 9532], _
        [1050, 10739], _
        [2865, 11502], _
        [5634, 9877], _
        [8355, 10796], _
        [13216, 12981], _
        [9560, 11384], _
        [8442, 8708], _
        [8955, 7064], _
        [8529, 3269], _
        [5223, 1431], _
        [2263, -1110], _
        [472, -3480], _
        [-1476, -2895], _
        [-5915, -6537], _
        [-9982, -5414], _
        [-11074, -5258], _
        [-17034, -8235], _
        [-19021, -11478], _
        [-23979, -14251], _
        [-21273, -12960], _
        [-18296, -10399], _
        [-17325, -5991], _
        [-14947, -2132], _
        [-11880, -4907], _
        [-9970, -5426], _
        [-5927, -6540], _
        [-5415, -6693], _
        [-4984, -8556], _
        [-7623, -11384], _
        [-4514, -12776], _
        [-968, -10710], _
        [1239, -10379], _
        [1967, -8690], _
        [5662, -8434], _
        [8480, -8374], _
        [9829, -3576], _
        [11737, -1857], _
        [12141, 3287], _
        [13267, 276], _
        [12002, -2036], _
        [9942, -3209], _
        [8754, -6628], _
        [8850, -8806], _
        [8933, -11266], _
        [16408, -9408], _
        [20377, -11910], _
        [21744, -11748], _
        [24631, -8158], _
        [24797, -6774], _
        [20321, -5133], _
        [21053, -1459], _
        [18392, 2870], _
        [19031, 6308], _
        [15467, 9347], _
        [19123, 7702], _
        [20265, 8296], _
        [16413, 9831], _
        [18151, 12141] _
]

Func GoOutFrozenForest()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $FrozenForest_Map Then Return

	If $l_i_Map = $FrozenForest_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> FrozenForest (portal 1)")
		_Vanquisher_RunAggroPortalPath($aFrozenForestOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQFrozenForest()
	If GetMapID() <> $FrozenForest_Map And GetMapID() <> $FrozenForest_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for FrozenForest.")
		TravelTo($FrozenForest_Outpost)
	EndIf

	If GetMapID() = $FrozenForest_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutFrozenForest()
		If GetMapID() <> $FrozenForest_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need FrozenForest (" & $FrozenForest_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $FrozenForest_Map Then
		CurrentAction("FrozenForest route waiting - on map " & GetMapID() & ", need " & $FrozenForest_Map & ".")
		Return
	EndIf

	CurrentAction("Starting FrozenForest vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_FrozenForestRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_SouthernShiverpeaks_FrozenForestRoute02)
EndFunc
