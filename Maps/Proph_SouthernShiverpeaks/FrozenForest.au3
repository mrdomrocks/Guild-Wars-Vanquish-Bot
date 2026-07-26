#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFrozenForestOutpostPath[2][2] = [ _
	[-7081, -31932], _
	[-7584, -31736] _
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

	Local $aWaypoints[78][4] = [ _
		[18151, 12141, " ", $vqrange], _
		[16413, 9831, " ", $vqrange], _
		[20265, 8296, " ", $vqrange], _
		[19123, 7702, " ", $vqrange], _
		[15467, 9347, " ", $vqrange], _
		[19031, 6308, " ", $vqrange], _
		[18392, 2870, " ", $vqrange], _
		[21053, -1459, " ", $vqrange], _
		[20321, -5133, " ", $vqrange], _
		[24797, -6774, " ", $vqrange], _
		[24631, -8158, " ", $vqrange], _
		[21744, -11748, " ", $vqrange], _
		[20377, -11910, " ", $vqrange], _
		[16408, -9408, " ", $vqrange], _
		[8933, -11266, " ", $vqrange], _
		[8850, -8806, " ", $vqrange], _
		[8754, -6628, " ", $vqrange], _
		[9942, -3209, " ", $vqrange], _
		[12002, -2036, " ", $vqrange], _
		[13267, 276, " ", $vqrange], _
		[12141, 3287, " ", $vqrange], _
		[11737, -1857, " ", $vqrange], _
		[9829, -3576, " ", $vqrange], _
		[8480, -8374, " ", $vqrange], _
		[5662, -8434, " ", $vqrange], _
		[1967, -8690, " ", $vqrange], _
		[1239, -10379, " ", $vqrange], _
		[-968, -10710, " ", $vqrange], _
		[-4514, -12776, " ", $vqrange], _
		[-7623, -11384, " ", $vqrange], _
		[-4984, -8556, " ", $vqrange], _
		[-5415, -6693, " ", $vqrange], _
		[-5927, -6540, " ", $vqrange], _
		[-9970, -5426, " ", $vqrange], _
		[-11880, -4907, " ", $vqrange], _
		[-14947, -2132, " ", $vqrange], _
		[-17325, -5991, " ", $vqrange], _
		[-18296, -10399, " ", $vqrange], _
		[-21273, -12960, " ", $vqrange], _
		[-23979, -14251, " ", $vqrange], _
		[-19021, -11478, " ", $vqrange], _
		[-17034, -8235, " ", $vqrange], _
		[-11074, -5258, " ", $vqrange], _
		[-9982, -5414, " ", $vqrange], _
		[-5915, -6537, " ", $vqrange], _
		[-1476, -2895, " ", $vqrange], _
		[472, -3480, " ", $vqrange], _
		[2263, -1110, " ", $vqrange], _
		[5223, 1431, " ", $vqrange], _
		[8529, 3269, " ", $vqrange], _
		[8955, 7064, " ", $vqrange], _
		[8442, 8708, " ", $vqrange], _
		[9560, 11384, " ", $vqrange], _
		[13216, 12981, " ", $vqrange], _
		[8355, 10796, " ", $vqrange], _
		[5634, 9877, " ", $vqrange], _
		[2865, 11502, " ", $vqrange], _
		[1050, 10739, " ", $vqrange], _
		[-1172, 9532, " ", $vqrange], _
		[-1039, 7966, " ", $vqrange], _
		[-201, 5239, " ", $vqrange], _
		[23, -5, " ", $vqrange], _
		[2230, -1164, " ", $vqrange], _
		[474, -3477, " ", $vqrange], _
		[-2476, -2002, " ", $vqrange], _
		[-3893, 534, " ", $vqrange], _
		[-9794, 1408, " ", $vqrange], _
		[-13349, 4174, " ", $vqrange], _
		[-8234, 4263, " ", $vqrange], _
		[-9187, 10575, " ", $vqrange], _
		[-12079, 5795, " ", $vqrange], _
		[-15484, 4146, " ", $vqrange], _
		[-16689, 4198, " ", $vqrange], _
		[-19434, 5491, " ", $vqrange], _
		[-20120, 7268, " ", $vqrange], _
		[-23613, 8479, " ", $vqrange], _
		[-19820, 7330, " ", $vqrange], _
		[-16794, 8727, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
