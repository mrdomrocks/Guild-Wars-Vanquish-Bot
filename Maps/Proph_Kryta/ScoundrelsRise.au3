#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aScoundrelsRiseOutpostPath[2][2] = [ _
	[-1453.60, 24938.46], _
	[-4334.29, 26859.33] _
]

Func GoOutScoundrelsRise()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $ScoundrelsRise_Map Then Return

	If $l_i_Map = $ScoundrelsRise_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> ScoundrelsRise (portal 1)")
		_Vanquisher_RunAggroPortalPath($aScoundrelsRiseOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQScoundrelsRise()
	If GetMapID() <> $ScoundrelsRise_Map And GetMapID() <> $ScoundrelsRise_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for ScoundrelsRise.")
		TravelTo($ScoundrelsRise_Outpost)
	EndIf

	If GetMapID() = $ScoundrelsRise_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutScoundrelsRise()
		If GetMapID() <> $ScoundrelsRise_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need ScoundrelsRise (" & $ScoundrelsRise_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $ScoundrelsRise_Map Then
		CurrentAction("ScoundrelsRise route waiting - on map " & GetMapID() & ", need " & $ScoundrelsRise_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ScoundrelsRise vanquish route.")

	Local $aWaypoints[43][4] = [ _
		[-2529, -5002, " ", $vqrange], _
		[-470, -2966, " ", $vqrange], _
		[2763, -2033, " ", $vqrange], _
		[4006, -1526, " ", $vqrange], _
		[4030, -1364, " ", $vqrange], _
		[4333, -1079, " ", $vqrange], _
		[5013, -591, " ", $vqrange], _
		[4648, -167, " ", $vqrange], _
		[3978, 494, " ", $vqrange], _
		[2655, 1441, " ", $vqrange], _
		[2199, 2371, " ", $vqrange], _
		[2159, 2464, " ", $vqrange], _
		[2892, 2837, " ", $vqrange], _
		[3772, 3968, " ", $vqrange], _
		[3751, 4621, " ", $vqrange], _
		[5106, 4888, " ", $vqrange], _
		[6761, 4999, " ", $vqrange], _
		[7683, 6114, " ", $vqrange], _
		[6914, 7092, " ", $vqrange], _
		[6540, 7500, " ", $vqrange], _
		[4766, 8885, " ", $vqrange], _
		[4359, 8553, " ", $vqrange], _
		[3501, 7961, " ", $vqrange], _
		[2428, 5685, " ", $vqrange], _
		[2327, 5658, " ", $vqrange], _
		[791, 5064, " ", $vqrange], _
		[-37, 6023, " ", $vqrange], _
		[-672, 7194, " ", $vqrange], _
		[-2283, 7737, " ", $vqrange], _
		[-4571, 8588, " ", $vqrange], _
		[-5158, 8757, " ", $vqrange], _
		[-5737, 9153, " ", $vqrange], _
		[-3183, 8086, " ", $vqrange], _
		[-2535, 6465, " ", $vqrange], _
		[-2394, 5688, " ", $vqrange], _
		[-3686, 4096, " ", $vqrange], _
		[-4695, 2122, " ", $vqrange], _
		[-5057, 416, " ", $vqrange], _
		[-3522, 4099, " ", $vqrange], _
		[-2551, 5576, " ", $vqrange], _
		[-668, 4943, " ", $vqrange], _
		[1202, 3009, " ", $vqrange], _
		[5940, 1835, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

