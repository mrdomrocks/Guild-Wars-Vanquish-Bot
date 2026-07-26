#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aPerditionRockOutpostPath[2][2] = [ _
	[3603, -10090], _
	[3800, -8600] _
]

Func GoOutPerditionRock()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $PerditionRock_Map Then Return

	If $l_i_Map = $PerditionRock_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> PerditionRock (portal 1)")
		_Vanquisher_RunAggroPortalPath($aPerditionRockOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQPerditionRock()
	If GetMapID() <> $PerditionRock_Map And GetMapID() <> $PerditionRock_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for PerditionRock.")
		TravelTo($PerditionRock_Outpost)
	EndIf

	If GetMapID() = $PerditionRock_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutPerditionRock()
		If GetMapID() <> $PerditionRock_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need PerditionRock (" & $PerditionRock_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $PerditionRock_Map Then
		CurrentAction("PerditionRock route waiting - on map " & GetMapID() & ", need " & $PerditionRock_Map & ".")
		Return
	EndIf

	CurrentAction("Starting PerditionRock vanquish route.")

	Local $aWaypoints[100][4] = [ _
		[5625, -3064, " ", $vqrange], _
		[6745, -1125, " ", $vqrange], _
		[8499, -2790, " ", $vqrange], _
		[7322, -5742, " ", $vqrange], _
		[4917, -4460, " ", $vqrange], _
		[6518, -1708, " ", $vqrange], _
		[4044, -629, " ", $vqrange], _
		[2579, -1129, " ", $vqrange], _
		[657, -2730, " ", $vqrange], _
		[-479, -4423, " ", $vqrange], _
		[-1160, -7685, " ", $vqrange], _
		[-1337, -3472, " ", $vqrange], _
		[-3007, -3256, " ", $vqrange], _
		[-3680, -1440, " ", $vqrange], _
		[-2854, 75, " ", $vqrange], _
		[-4186, 1102, " ", $vqrange], _
		[-3425, -1561, " ", $vqrange], _
		[-5568, -864, " ", $vqrange], _
		[-7725, -951, " ", $vqrange], _
		[-7629, 2646, " ", $vqrange], _
		[-6107, 5318, " ", $vqrange], _
		[-4604, 5345, " ", $vqrange], _
		[-3461, 4656, " ", $vqrange], _
		[-2958, 2881, " ", $vqrange], _
		[-1183, 5014, " ", $vqrange], _
		[192, 5930, " ", $vqrange], _
		[12, 1914, " ", $vqrange], _
		[2453, 451, " ", $vqrange], _
		[4030, 804, " ", $vqrange], _
		[6205, -693, " ", $vqrange], _
		[8663, 662, " ", $vqrange], _
		[7117, 2741, " ", $vqrange], _
		[9300, 2693, " ", $vqrange], _
		[11186, 6514, " ", $vqrange], _
		[14741, 7624, " ", $vqrange], _
		[17666, 8274, " ", $vqrange], _
		[18767, 8761, " ", $vqrange], _
		[18236, 10547, " ", $vqrange], _
		[20149, 11729, " ", $vqrange], _
		[20252, 12329, " ", $vqrange], _
		[18198, 12299, " ", $vqrange], _
		[20561, 13864, " ", $vqrange], _
		[20718, 12973, " ", $vqrange], _
		[22203, 10042, " ", $vqrange], _
		[23670, 7093, " ", $vqrange], _
		[22203, 10042, " ", $vqrange], _
		[23500, 12044, " ", $vqrange], _
		[25566, 12172, " ", $vqrange], _
		[27452, 10762, " ", $vqrange], _
		[28585, 8477, " ", $vqrange], _
		[27007, 7605, " ", $vqrange], _
		[26705, 4916, " ", $vqrange], _
		[26607, 2699, " ", $vqrange], _
		[25166, 1988, " ", $vqrange], _
		[27021, -114, " ", $vqrange], _
		[28382, -350, " ", $vqrange], _
		[27058, -2694, " ", $vqrange], _
		[24932, -4713, " ", $vqrange], _
		[27234, -6702, " ", $vqrange], _
		[24932, -4713, " ", $vqrange], _
		[22344, -4182, " ", $vqrange], _
		[20077, -5323, " ", $vqrange], _
		[22344, -4182, " ", $vqrange], _
		[24922, -2060, " ", $vqrange], _
		[24932, -4713, " ", $vqrange], _
		[26415, -10186, " ", $vqrange], _
		[23893, -11907, " ", $vqrange], _
		[22060, -12732, " ", $vqrange], _
		[19215, -11656, " ", $vqrange], _
		[18517, -10037, " ", $vqrange], _
		[16445, -7987, " ", $vqrange], _
		[14813, -9623, " ", $vqrange], _
		[13469, -8085, " ", $vqrange], _
		[11283, -9532, " ", $vqrange], _
		[8977, -9671, " ", $vqrange], _
		[9290, -7778, " ", $vqrange], _
		[6681, -6403, " ", $vqrange], _
		[8328, -3895, " ", $vqrange], _
		[11010, -1451, " ", $vqrange], _
		[15313, -985, " ", $vqrange], _
		[15782, -3100, " ", $vqrange], _
		[17085, -5939, " ", $vqrange], _
		[20990, -5037, " ", $vqrange], _
		[23951, -3114, " ", $vqrange], _
		[24338, -111, " ", $vqrange], _
		[22652, 1747, " ", $vqrange], _
		[25573, 385, " ", $vqrange], _
		[21064, 1708, " ", $vqrange], _
		[16727, -734, " ", $vqrange], _
		[21314, 2887, " ", $vqrange], _
		[23521, 4061, " ", $vqrange], _
		[23723, 7462, " ", $vqrange], _
		[22418, 4813, " ", $vqrange], _
		[18093, 5338, " ", $vqrange], _
		[17358, 12020, " ", $vqrange], _
		[18125, 6490, " ", $vqrange], _
		[16699, 3723, " ", $vqrange], _
		[14825, 3405, " ", $vqrange], _
		[13079, 3700, " ", $vqrange], _
		[9413, 3352, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

