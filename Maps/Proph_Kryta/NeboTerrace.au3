#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aNeboTerraceOutpostPath[2][2] = [ _
	[-5199, 16327], _
	[-5252, 15997] _
]

Global $aNeboTerraceTransitPath[14][2] = [ _
	[-5219, 15079], _
	[-1627, 14112], _
	[3680, 18302], _
	[9937, 19075], _
	[12292, 16368], _
	[12011, 14189], _
	[13769, 12256], _
	[14331, 9162], _
	[14050, 8073], _
	[15491, 6526], _
	[17389, 7018], _
	[18966, 4149], _
	[19900, 4564], _
	[20398, 5311] _
]

Global $aNeboTerraceTransit2Path[11][2] = [ _
	[-18325, -2148], _
	[-14836, -4068], _
	[-12293, -4014], _
	[-9886, -1931], _
	[-8777, -2662], _
	[-8966, -4257], _
	[-6153, -3500], _
	[-4612, -7341], _
	[-4560, -10437], _
	[-4436, -11552], _
	[-3911, -11679] _
]

Func GoOutNeboTerrace()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $NeboTerrace_Map Then Return

	If $l_i_Map = $NeboTerrace_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> NeboTerrace (portal 1)")
		_Vanquisher_RunAggroPortalPath($aNeboTerraceOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $NeboTerrace_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> NeboTerrace (portal 2)")
		_Vanquisher_RunAggroPortalPath($aNeboTerraceTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $NeboTerrace_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> NeboTerrace (portal 3)")
		_Vanquisher_RunAggroPortalPath($aNeboTerraceTransit2Path, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQNeboTerrace()
	If GetMapID() <> $NeboTerrace_Map And GetMapID() <> $NeboTerrace_Outpost And GetMapID() <> $NeboTerrace_Transit And GetMapID() <> $NeboTerrace_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for NeboTerrace.")
		TravelTo($NeboTerrace_Outpost)
	EndIf

	If GetMapID() = $NeboTerrace_Outpost Or GetMapID() = $NeboTerrace_Transit Or GetMapID() = $NeboTerrace_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutNeboTerrace()
		If GetMapID() <> $NeboTerrace_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need NeboTerrace (" & $NeboTerrace_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $NeboTerrace_Map Then
		CurrentAction("NeboTerrace route waiting - on map " & GetMapID() & ", need " & $NeboTerrace_Map & ".")
		Return
	EndIf

	CurrentAction("Starting NeboTerrace vanquish route.")

	Local $aWaypoints[60][4] = [ _
		[-279, -10444, " ", $vqrange], _
		[1705, -7538, " ", $vqrange], _
		[4988, -6324, " ", $vqrange], _
		[3462, -7279, " ", $vqrange], _
		[5795, -7208, " ", $vqrange], _
		[9160, -9739, " ", $vqrange], _
		[8187, -10670, " ", $vqrange], _
		[9095, -12725, " ", $vqrange], _
		[12070, -14128, " ", $vqrange], _
		[13604, -14200, " ", $vqrange], _
		[12244, -12945, " ", $vqrange], _
		[14803, -11596, " ", $vqrange], _
		[15072, -11261, " ", $vqrange], _
		[14416, -10804, " ", $vqrange], _
		[6093, -5635, " ", $vqrange], _
		[11033, -3330, " ", $vqrange], _
		[13764, -3762, " ", $vqrange], _
		[15153, -4801, " ", $vqrange], _
		[17743, -2702, " ", $vqrange], _
		[17375, 2800, " ", $vqrange], _
		[16780, 6305, " ", $vqrange], _
		[11742, 6441, " ", $vqrange], _
		[7473, 4615, " ", $vqrange], _
		[7879, 2282, " ", $vqrange], _
		[4512, 395, " ", $vqrange], _
		[6053, 6474, " ", $vqrange], _
		[4302, 9625, " ", $vqrange], _
		[6872, 12398, " ", $vqrange], _
		[5575, 14577, " ", $vqrange], _
		[8959, 16126, " ", $vqrange], _
		[8283, 14181, " ", $vqrange], _
		[11326, 15154, " ", $vqrange], _
		[13651, 13632, " ", $vqrange], _
		[14950, 10082, " ", $vqrange], _
		[9354, 10251, " ", $vqrange], _
		[3201, 15559, " ", $vqrange], _
		[-1093, 17013, " ", $vqrange], _
		[-4508, 17554, " ", $vqrange], _
		[-7585, 18332, " ", $vqrange], _
		[-13028, 18704, " ", $vqrange], _
		[-13332, 14646, " ", $vqrange], _
		[-12622, 11908, " ", $vqrange], _
		[-9715, 12212, " ", $vqrange], _
		[-8610, 10602, " ", $vqrange], _
		[-7720, 12347, " ", $vqrange], _
		[-9144, 14558, " ", $vqrange], _
		[-9850, 15593, " ", $vqrange], _
		[-6962, 15539, " ", $vqrange], _
		[-3716, 10805, " ", $vqrange], _
		[-2337, 10068, " ", $vqrange], _
		[-1783, 7868, " ", $vqrange], _
		[-2191, 5676, " ", $vqrange], _
		[-2513, 3646, " ", $vqrange], _
		[-4854, 4728, " ", $vqrange], _
		[-7424, 3444, " ", $vqrange], _
		[-3190, 2098, " ", $vqrange], _
		[-716, 3731, " ", $vqrange], _
		[-3168, 2098, " ", $vqrange], _
		[-3907, 637, " ", $vqrange], _
		[-1135, -1256, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

