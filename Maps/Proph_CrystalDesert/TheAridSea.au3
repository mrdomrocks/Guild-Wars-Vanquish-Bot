#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheAridSeaOutpostPath[2][2] = [ _
	[10795, 6556], _
	[10556, 5908] _
]

Global $aTheAridSeaTransitPath[11][2] = [ _
	[-4667, -13772], _
	[-2247, -14229], _
	[1025, -8357], _
	[-3110, -4890], _
	[2382, -2425], _
	[3462, -6718], _
	[4443, -9835], _
	[13232, -5778], _
	[16850, 4402], _
	[18984, 3739], _
	[20707, 6478] _
]

Func GoOutTheAridSea()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TheAridSea_Map Then Return

	If $l_i_Map = $TheAridSea_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TheAridSea (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTheAridSeaOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheAridSea_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> TheAridSea (portal 2)")
		_Vanquisher_RunAggroPortalPath($aTheAridSeaTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTheAridSea()
	If GetMapID() <> $TheAridSea_Map And GetMapID() <> $TheAridSea_Outpost And GetMapID() <> $TheAridSea_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TheAridSea.")
		TravelTo($TheAridSea_Outpost)
	EndIf

	If GetMapID() = $TheAridSea_Outpost Or GetMapID() = $TheAridSea_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheAridSea()
		If GetMapID() <> $TheAridSea_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheAridSea (" & $TheAridSea_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TheAridSea_Map Then
		CurrentAction("TheAridSea route waiting - on map " & GetMapID() & ", need " & $TheAridSea_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheAridSea vanquish route.")

	Local $aWaypoints[71][4] = [ _
		[-12517, 4131, " ", $vqrange], _
		[-12517, 4131, " ", $vqrange], _
		[-11612, -1888, " ", $vqrange], _
		[-11216, -5092, " ", $vqrange], _
		[-7847, -8855, " ", $vqrange], _
		[-4358, -10956, " ", $vqrange], _
		[-620, -14121, " ", $vqrange], _
		[2951, -16579, " ", $vqrange], _
		[4821, -13127, " ", $vqrange], _
		[6851, -16767, " ", $vqrange], _
		[7366, -18957, " ", $vqrange], _
		[5904, -8294, " ", $vqrange], _
		[3045, 7490, " ", $vqrange], _
		[-1880, 19088, " ", $vqrange], _
		[-1011, 14688, " ", $vqrange], _
		[2145, 14392, " ", $vqrange], _
		[4579, 11634, " ", $vqrange], _
		[5647, 8058, " ", $vqrange], _
		[4848, 3638, " ", $vqrange], _
		[6944, 266, " ", $vqrange], _
		[9685, 68, " ", $vqrange], _
		[13790, -1896, " ", $vqrange], _
		[16285, -4276, " ", $vqrange], _
		[16385, -9534, " ", $vqrange], _
		[16613, -11922, " ", $vqrange], _
		[15300, -15057, " ", $vqrange], _
		[15161, -16996, " ", $vqrange], _
		[12870, -18939, " ", $vqrange], _
		[10087, -17498, " ", $vqrange], _
		[9491, -15982, " ", $vqrange], _
		[9182, -14634, " ", $vqrange], _
		[7091, -13971, " ", $vqrange], _
		[4317, -12524, " ", $vqrange], _
		[12429, -18315, " ", $vqrange], _
		[2420, -18580, " ", $vqrange], _
		[-150, -17028, " ", $vqrange], _
		[-2074, -19820, " ", $vqrange], _
		[-5110, -17982, " ", $vqrange], _
		[-7921, -19693, " ", $vqrange], _
		[-11508, -20021, " ", $vqrange], _
		[-15040, -17408, " ", $vqrange], _
		[-14504, -16106, " ", $vqrange], _
		[-15432, -11503, " ", $vqrange], _
		[-17315, -6675, " ", $vqrange], _
		[-16507, -533, " ", $vqrange], _
		[-15460, 2643, " ", $vqrange], _
		[-15136, 4402, " ", $vqrange], _
		[-13592, 1783, " ", $vqrange], _
		[-12978, 4596, " ", $vqrange], _
		[-13163, 7424, " ", $vqrange], _
		[-10824, 7473, " ", $vqrange], _
		[-12215, 9148, " ", $vqrange], _
		[-9360, 11683, " ", $vqrange], _
		[-7461, 9757, " ", $vqrange], _
		[-9475, 13352, " ", $vqrange], _
		[-4393, 12093, " ", $vqrange], _
		[-666, 8217, " ", $vqrange], _
		[-309, 3936, " ", $vqrange], _
		[-888, 807, " ", $vqrange], _
		[-1533, -1247, " ", $vqrange], _
		[-3547, -3366, " ", $vqrange], _
		[-7609, -3668, " ", $vqrange], _
		[-4391, -7590, " ", $vqrange], _
		[-4197, -9582, " ", $vqrange], _
		[-1597, -11135, " ", $vqrange], _
		[3709, -11969, " ", $vqrange], _
		[6771, -9109, " ", $vqrange], _
		[4936, -4619, " ", $vqrange], _
		[3948, 212, " ", $vqrange], _
		[4243, 2236, " ", $vqrange], _
		[964, 6154, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

