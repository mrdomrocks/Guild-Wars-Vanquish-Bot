#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aMineralSpringsOutpostPath[2][2] = [ _
	[-10030, 18833], _
	[-9797, 19027] _
]

Global $aMineralSpringsTransitPath[11][2] = [ _
	[-7118, 20976], _
	[-3362, 18610], _
	[-105, 17184], _
	[724, 18845], _
	[2189, 21211], _
	[5084, 21288], _
	[5798, 22956], _
	[4675, 25495], _
	[5365, 28339], _
	[7667, 29462], _
	[8091, 29696] _
]

Func GoOutMineralSprings()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $MineralSprings_Map Then Return

	If $l_i_Map = $MineralSprings_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MineralSprings (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMineralSpringsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MineralSprings_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MineralSprings (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMineralSpringsTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQMineralSprings()
	If GetMapID() <> $MineralSprings_Map And GetMapID() <> $MineralSprings_Outpost And GetMapID() <> $MineralSprings_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MineralSprings.")
		TravelTo($MineralSprings_Outpost)
	EndIf

	If GetMapID() = $MineralSprings_Outpost Or GetMapID() = $MineralSprings_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutMineralSprings()
		If GetMapID() <> $MineralSprings_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MineralSprings (" & $MineralSprings_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $MineralSprings_Map Then
		CurrentAction("MineralSprings route waiting - on map " & GetMapID() & ", need " & $MineralSprings_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MineralSprings vanquish route.")

	Local $aWaypoints[59][4] = [ _
		[-20810, -9703, " ", $vqrange], _
		[-20491, -8464, " ", $vqrange], _
		[-21304, -6247, " ", $vqrange], _
		[-23562, -3417, " ", $vqrange], _
		[-25001, -969, " ", $vqrange], _
		[-22884, 2132, " ", $vqrange], _
		[-20113, 3695, " ", $vqrange], _
		[-20819, 7548, " ", $vqrange], _
		[-19891, 9390, " ", $vqrange], _
		[-18019, 9974, " ", $vqrange], _
		[-13637, 7228, " ", $vqrange], _
		[-9288, 8710, " ", $vqrange], _
		[-7586, 9053, " ", $vqrange], _
		[-6105, 9617, " ", $vqrange], _
		[-6418, 8273, " ", $vqrange], _
		[-5604, 6442, " ", $vqrange], _
		[-3798, 6573, " ", $vqrange], _
		[-2869, 6065, " ", $vqrange], _
		[1025, 6810, " ", $vqrange], _
		[2201, 8670, " ", $vqrange], _
		[1276, 6274, " ", $vqrange], _
		[2674, 3722, " ", $vqrange], _
		[6881, 4780, " ", $vqrange], _
		[13620, 8349, " ", $vqrange], _
		[15268, 10083, " ", $vqrange], _
		[21202, 8874, " ", $vqrange], _
		[23496, 8276, " ", $vqrange], _
		[24995, 6613, " ", $vqrange], _
		[23905, 3561, " ", $vqrange], _
		[20973, -111, " ", $vqrange], _
		[21640, -1502, " ", $vqrange], _
		[21614, 1213, " ", $vqrange], _
		[23897, 3479, " ", $vqrange], _
		[24284, 8839, " ", $vqrange], _
		[19116, 9301, " ", $vqrange], _
		[14524, 9843, " ", $vqrange], _
		[16698, 3473, " ", $vqrange], _
		[15028, -953, " ", $vqrange], _
		[15773, -6569, " ", $vqrange], _
		[14257, -9540, " ", $vqrange], _
		[11862, -7931, " ", $vqrange], _
		[8478, -7524, " ", $vqrange], _
		[7039, -7508, " ", $vqrange], _
		[7748, -5073, " ", $vqrange], _
		[4231, -1503, " ", $vqrange], _
		[117, -3343, " ", $vqrange], _
		[507, -4867, " ", $vqrange], _
		[-317, -7732, " ", $vqrange], _
		[-3775, -7538, " ", $vqrange], _
		[-4543, -4760, " ", $vqrange], _
		[-5240, -2413, " ", $vqrange], _
		[-11180, 1656, " ", $vqrange], _
		[-13070, 227, " ", $vqrange], _
		[-14841, -910, " ", $vqrange], _
		[-13000, -373, " ", $vqrange], _
		[-11325, -3876, " ", $vqrange], _
		[-9344, -9444, " ", $vqrange], _
		[-13723, -10548, " ", $vqrange], _
		[-17905, -8309, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

