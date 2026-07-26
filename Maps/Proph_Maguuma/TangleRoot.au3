#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTangleRootOutpostPath[2][2] = [ _
	[6418.01, -10500.90], _
	[6212.98, -10712.02] _
]

Func GoOutTangleRoot()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TangleRoot_Map Then Return

	If $l_i_Map = $TangleRoot_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TangleRoot (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTangleRootOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTangleRoot()
	If GetMapID() <> $TangleRoot_Map And GetMapID() <> $TangleRoot_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TangleRoot.")
		TravelTo($TangleRoot_Outpost)
	EndIf

	If GetMapID() = $TangleRoot_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTangleRoot()
		If GetMapID() <> $TangleRoot_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TangleRoot (" & $TangleRoot_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TangleRoot_Map Then
		CurrentAction("TangleRoot route waiting - on map " & GetMapID() & ", need " & $TangleRoot_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TangleRoot vanquish route.")

	Local $aWaypoints[102][4] = [ _
		[14172, 10445, " ", $vqrange], _
		[15202, 8687, " ", $vqrange], _
		[17509, 7014, " ", $vqrange], _
		[20838, 7769, " ", $vqrange], _
		[18090, 6292, " ", $vqrange], _
		[19582, 2477, " ", $vqrange], _
		[20855, 432, " ", $vqrange], _
		[22061, -2586, " ", $vqrange], _
		[24198, -5098, " ", $vqrange], _
		[25629, -5598, " ", $vqrange], _
		[27744, -6144, " ", $vqrange], _
		[27769, -4567, " ", $vqrange], _
		[26264, -1398, " ", $vqrange], _
		[25065, 2336, " ", $vqrange], _
		[25961, 7128, " ", $vqrange], _
		[24507, 10351, " ", $vqrange], _
		[25995, 4605, " ", $vqrange], _
		[21912, 5586, " ", $vqrange], _
		[20434, 4523, " ", $vqrange], _
		[17319, 3874, " ", $vqrange], _
		[14633, 2396, " ", $vqrange], _
		[13036, 607, " ", $vqrange], _
		[10960, 1726, " ", $vqrange], _
		[9046, 3869, " ", $vqrange], _
		[8447, 6333, " ", $vqrange], _
		[8905, 8728, " ", $vqrange], _
		[8547, 10717, " ", $vqrange], _
		[5109, 10772, " ", $vqrange], _
		[2123, 8516, " ", $vqrange], _
		[-1315, 7826, " ", $vqrange], _
		[-3662, 10072, " ", $vqrange], _
		[-5506, 11139, " ", $vqrange], _
		[-7649, 8003, " ", $vqrange], _
		[-7649, 8003, " ", $vqrange], _
		[-10426, 11498, " ", $vqrange], _
		[-9458, 14248, " ", $vqrange], _
		[-8431, 15775, " ", $vqrange], _
		[-7848, 17125, " ", $vqrange], _
		[-6600, 15309, " ", $vqrange], _
		[-9703, 13704, " ", $vqrange], _
		[-8965, 9656, " ", $vqrange], _
		[-10617, 5486, " ", $vqrange], _
		[-9657, 2671, " ", $vqrange], _
		[-5093, 3590, " ", $vqrange], _
		[-3238, 4619, " ", $vqrange], _
		[-970, 3947, " ", $vqrange], _
		[-928, 1051, " ", $vqrange], _
		[-963, 959, " ", $vqrange], _
		[-1004, -3220, " ", $vqrange], _
		[1604, -7124, " ", $vqrange], _
		[-2554, -7606, " ", $vqrange], _
		[-5168, -8070, " ", $vqrange], _
		[-7604, -10373, " ", $vqrange], _
		[-5384, -10290, " ", $vqrange], _
		[-5772, -12035, " ", $vqrange], _
		[-7061, -12771, " ", $vqrange], _
		[-9570, -12288, " ", $vqrange], _
		[-10494, -8409, " ", $vqrange], _
		[-12341, -7743, " ", $vqrange], _
		[-17168, -7631, " ", $vqrange], _
		[-19515, -9238, " ", $vqrange], _
		[-19935, -10226, " ", $vqrange], _
		[-23243, -9964, " ", $vqrange], _
		[-20523, -12778, " ", $vqrange], _
		[-22981, -12857, " ", $vqrange], _
		[-25056, -12906, " ", $vqrange], _
		[-25695, -6645, " ", $vqrange], _
		[-24835, -4951, " ", $vqrange], _
		[-24229, -3922, " ", $vqrange], _
		[-22574, -1207, " ", $vqrange], _
		[-21787, 183, " ", $vqrange], _
		[-23935, -2884, " ", $vqrange], _
		[-25154, -6426, " ", $vqrange], _
		[-23745, -6459, " ", $vqrange], _
		[-20723, -6383, " ", $vqrange], _
		[-16548, -7021, " ", $vqrange], _
		[-15133, -7685, " ", $vqrange], _
		[-11881, -7064, " ", $vqrange], _
		[-8013, -8092, " ", $vqrange], _
		[-4821, -7783, " ", $vqrange], _
		[672, -7207, " ", $vqrange], _
		[7660, -11527, " ", $vqrange], _
		[8067, -13077, " ", $vqrange], _
		[10038, -9250, " ", $vqrange], _
		[11457, -5752, " ", $vqrange], _
		[16823, -5442, " ", $vqrange], _
		[20945, -5241, " ", $vqrange], _
		[24309, -5131, " ", $vqrange], _
		[25740, -8115, " ", $vqrange], _
		[23643, -10156, " ", $vqrange], _
		[21682, -13028, " ", $vqrange], _
		[18789, -13042, " ", $vqrange], _
		[17478, -13028, " ", $vqrange], _
		[15233, -9286, " ", $vqrange], _
		[18817, -7045, " ", $vqrange], _
		[18253, -3543, " ", $vqrange], _
		[14274, -3418, " ", $vqrange], _
		[10426, 1439, " ", $vqrange], _
		[5983, -1696, " ", $vqrange], _
		[71, 242, " ", $vqrange], _
		[3307, 1051, " ", $vqrange], _
		[4876, -349, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

