#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTwinSerpentLakesOutpostPath[4][2] = [ _
	[-20183, 10506], _
	[-18896, 12390], _
	[-16812, 13585], _
	[-16612, 13585] _
]

Func GoOutTwinSerpentLakes()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TwinSerpentLakes_Map Then Return

	If $l_i_Map = $TwinSerpentLakes_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TwinSerpentLakes (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTwinSerpentLakesOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTwinSerpentLakes()
	If GetMapID() <> $TwinSerpentLakes_Map And GetMapID() <> $TwinSerpentLakes_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TwinSerpentLakes.")
		TravelTo($TwinSerpentLakes_Outpost)
	EndIf

	If GetMapID() = $TwinSerpentLakes_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTwinSerpentLakes()
		If GetMapID() <> $TwinSerpentLakes_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TwinSerpentLakes (" & $TwinSerpentLakes_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TwinSerpentLakes_Map Then
		CurrentAction("TwinSerpentLakes route waiting - on map " & GetMapID() & ", need " & $TwinSerpentLakes_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TwinSerpentLakes vanquish route.")

	Local $aWaypoints[59][4] = [ _
		[-3283, -19532, " ", $vqrange], _
		[-1025, -14423, " ", $vqrange], _
		[-5383, -12959, " ", $vqrange], _
		[-6837, -12938, " ", $vqrange], _
		[-5269, -10803, " ", $vqrange], _
		[-4180, -8806, " ", $vqrange], _
		[-7459, -7918, " ", $vqrange], _
		[-7314, -5004, " ", $vqrange], _
		[-7260, -1537, " ", $vqrange], _
		[-5765, -246, " ", $vqrange], _
		[-4722, 2951, " ", $vqrange], _
		[-7164, 4446, " ", $vqrange], _
		[-6170, 6072, " ", $vqrange], _
		[-5580, 4193, " ", $vqrange], _
		[-7627, 9236, " ", $vqrange], _
		[-7378, 11781, " ", $vqrange], _
		[-6985, 13468, " ", $vqrange], _
		[-6755, 14363, " ", $vqrange], _
		[-4186, 15450, " ", $vqrange], _
		[-6977, 16130, " ", $vqrange], _
		[-6759, 18749, " ", $vqrange], _
		[-7445, 22211, " ", $vqrange], _
		[-7418, 21231, " ", $vqrange], _
		[-3719, 19223, " ", $vqrange], _
		[-1495, 17257, " ", $vqrange], _
		[-225, 15508, " ", $vqrange], _
		[1851, 13088, " ", $vqrange], _
		[1284, 10680, " ", $vqrange], _
		[443, 10030, " ", $vqrange], _
		[3394, 12902, " ", $vqrange], _
		[3729, 14404, " ", $vqrange], _
		[2082, 19864, " ", $vqrange], _
		[4220, 14910, " ", $vqrange], _
		[2471, 13104, " ", $vqrange], _
		[5571, 9667, " ", $vqrange], _
		[6325, 7938, " ", $vqrange], _
		[6947, 8930, " ", $vqrange], _
		[3416, 11148, " ", $vqrange], _
		[1053, 10216, " ", $vqrange], _
		[5104, 4231, " ", $vqrange], _
		[6361, -336, " ", $vqrange], _
		[4964, -3964, " ", $vqrange], _
		[3353, -5873, " ", $vqrange], _
		[2477, -4192, " ", $vqrange], _
		[4719, -6641, " ", $vqrange], _
		[4520, -7882, " ", $vqrange], _
		[4941, -11123, " ", $vqrange], _
		[7176, -14002, " ", $vqrange], _
		[1195, -12633, " ", $vqrange], _
		[2525, -5997, " ", $vqrange], _
		[2225, -3778, " ", $vqrange], _
		[-900, -4527, " ", $vqrange], _
		[-4399, -7300, " ", $vqrange], _
		[-6666, -2761, " ", $vqrange], _
		[-4806, 901, " ", $vqrange], _
		[-1395, 3279, " ", $vqrange], _
		[-1866, 6989, " ", $vqrange], _
		[-3370, 9011, " ", $vqrange], _
		[-2252, 12553, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

