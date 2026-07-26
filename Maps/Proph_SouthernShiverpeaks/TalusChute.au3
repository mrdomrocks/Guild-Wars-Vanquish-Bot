#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTalusChuteOutpostPath[2][2] = [ _
	[-22877, -5419], _
	[-23133, -5519] _
]

Func GoOutTalusChute()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TalusChute_Map Then Return

	If $l_i_Map = $TalusChute_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TalusChute (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTalusChuteOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTalusChute()
	If GetMapID() <> $TalusChute_Map And GetMapID() <> $TalusChute_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TalusChute.")
		TravelTo($TalusChute_Outpost)
	EndIf

	If GetMapID() = $TalusChute_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTalusChute()
		If GetMapID() <> $TalusChute_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TalusChute (" & $TalusChute_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TalusChute_Map Then
		CurrentAction("TalusChute route waiting - on map " & GetMapID() & ", need " & $TalusChute_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TalusChute vanquish route.")

	Local $aWaypoints[110][4] = [ _
		[19939, -13283, " ", $vqrange], _
		[18445, -8103, " ", $vqrange], _
		[13525, -8366, " ", $vqrange], _
		[12822, -10463, " ", $vqrange], _
		[10771, -9239, " ", $vqrange], _
		[4930, -13914, " ", $vqrange], _
		[2139, -13287, " ", $vqrange], _
		[-1325, -15498, " ", $vqrange], _
		[-4648, -16571, " ", $vqrange], _
		[-5772, -15020, " ", $vqrange], _
		[-8239, -13539, " ", $vqrange], _
		[-6977, -9431, " ", $vqrange], _
		[-8469, -13612, " ", $vqrange], _
		[-10339, -16935, " ", $vqrange], _
		[-14403, -15930, " ", $vqrange], _
		[-20364, -15310, " ", $vqrange], _
		[-22378, -12916, " ", $vqrange], _
		[-20768, -9615, " ", $vqrange], _
		[-17950, -9216, " ", $vqrange], _
		[-16388, -6887, " ", $vqrange], _
		[-18527, -6290, " ", $vqrange], _
		[-21585, -6661, " ", $vqrange], _
		[-21640, -3785, " ", $vqrange], _
		[-21724, 1402, " ", $vqrange], _
		[-21593, 7552, " ", $vqrange], _
		[-17477, 2444, " ", $vqrange], _
		[-17561, 7076, " ", $vqrange], _
		[-16916, 4218, " ", $vqrange], _
		[-15151, 4597, " ", $vqrange], _
		[-12824, 7232, " ", $vqrange], _
		[-15128, 10934, " ", $vqrange], _
		[-17746, 13853, " ", $vqrange], _
		[-22066, 15112, " ", $vqrange], _
		[-19068, 14722, " ", $vqrange], _
		[-16971, 10651, " ", $vqrange], _
		[-12239, 9797, " ", $vqrange], _
		[-13826, 14722, " ", $vqrange], _
		[-11191, 16516, " ", $vqrange], _
		[-8629, 14177, " ", $vqrange], _
		[-9768, 11323, " ", $vqrange], _
		[-8682, 9529, " ", $vqrange], _
		[-6694, 12712, " ", $vqrange], _
		[-8181, 14298, " ", $vqrange], _
		[-2132, 15196, " ", $vqrange], _
		[1789, 14579, " ", $vqrange], _
		[3214, 14912, " ", $vqrange], _
		[9084, 15087, " ", $vqrange], _
		[3769, 14159, " ", $vqrange], _
		[4414, 12354, " ", $vqrange], _
		[2392, 10875, " ", $vqrange], _
		[2035, 11365, " ", $vqrange], _
		[-1644, 11074, " ", $vqrange], _
		[-2030, 7909, " ", $vqrange], _
		[-4837, 8460, " ", $vqrange], _
		[-7500, 4738, " ", $vqrange], _
		[-5018, 1697, " ", $vqrange], _
		[-7548, -2251, " ", $vqrange], _
		[-10619, 425, " ", $vqrange], _
		[-13294, 2963, " ", $vqrange], _
		[-13781, -612, " ", $vqrange], _
		[-15137, 1468, " ", $vqrange], _
		[-19399, 168, " ", $vqrange], _
		[-17147, -4282, " ", $vqrange], _
		[-12591, -4378, " ", $vqrange], _
		[-11431, -7128, " ", $vqrange], _
		[-7415, -5303, " ", $vqrange], _
		[-1127, -7648, " ", $vqrange], _
		[4316, -5175, " ", $vqrange], _
		[2859, -325, " ", $vqrange], _
		[-235, 886, " ", $vqrange], _
		[-1916, 5929, " ", $vqrange], _
		[162, 564, " ", $vqrange], _
		[8, -4980, " ", $vqrange], _
		[-361, 203, " ", $vqrange], _
		[1976, 1347, " ", $vqrange], _
		[2882, 5770, " ", $vqrange], _
		[5468, 7840, " ", $vqrange], _
		[9738, 7871, " ", $vqrange], _
		[11664, 11950, " ", $vqrange], _
		[9814, 8080, " ", $vqrange], _
		[14234, 10705, " ", $vqrange], _
		[15982, 16169, " ", $vqrange], _
		[19543, 14862, " ", $vqrange], _
		[21604, 14424, " ", $vqrange], _
		[23152, 11283, " ", $vqrange], _
		[22157, 6943, " ", $vqrange], _
		[21413, 246, " ", $vqrange], _
		[20031, 1521, " ", $vqrange], _
		[14953, 1730, " ", $vqrange], _
		[15981, 5844, " ", $vqrange], _
		[16906, 7952, " ", $vqrange], _
		[20938, 10089, " ", $vqrange], _
		[16247, 5309, " ", $vqrange], _
		[15261, 1694, " ", $vqrange], _
		[16405, -1630, " ", $vqrange], _
		[20051, 1454, " ", $vqrange], _
		[20017, -933, " ", $vqrange], _
		[16117, -5733, " ", $vqrange], _
		[14125, -7231, " ", $vqrange], _
		[12437, -6272, " ", $vqrange], _
		[7781, 529, " ", $vqrange], _
		[8564, 4635, " ", $vqrange], _
		[11519, 405, " ", $vqrange], _
		[12843, -7920, " ", $vqrange], _
		[14917, -5320, " ", $vqrange], _
		[14245, -1580, " ", $vqrange], _
		[13496, 661, " ", $vqrange], _
		[12865, 1686, " ", $vqrange], _
		[13929, 7587, " ", $vqrange], _
		[18772, 11402, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

