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

Global $aProph_Kryta_NeboTerraceRoute01[88][2] = [ _
        [-279, -10444], _
        [1705, -7538], _
        [4988, -6324], _
        [3462, -7279], _
        [5795, -7208], _
        [8940, -9735], _
        [8187, -10670], _
        [9095, -12725], _
        [12070, -14128], _
        [13604, -14200], _
        [12244, -12945], _
        [14803, -11596], _
        [15072, -11261], _
        [14662, -9099], _
        [16291, -4768], _
        [13947, -10251], _
        [10967, -11086], _
        [11603, -9934], _
        [8742, -7351], _
        [6093, -5635], _
        [11033, -3330], _
        [12358, -3854], _
        [13033, -5006], _
        [13629, -5006], _
        [14344, -4967], _
        [13907, -3536], _
        [15153, -4801], _
        [17743, -2702], _
        [18477, -79], _
        [17375, 2800], _
        [17364, 2741], _
        [15497, 4132], _
        [13470, 5523], _
        [12636, 6715], _
        [17126, 3854], _
        [16887, 6437], _
        [18358, 8026], _
        [17722, 10251], _
        [15854, 10371], _
        [13073, 9298], _
        [11742, 6441], _
        [7473, 4615], _
        [8066, 3139], _
        [7311, 2106], _
        [8384, 2185], _
        [8861, 953], _
        [9576, -278], _
        [10887, -3139], _
        [8861, -635], _
        [7470, 754], _
        [4291, 238], _
        [5920, 1589], _
        [5284, 4688], _
        [6053, 6474], _
        [4302, 9625], _
        [6872, 12398], _
        [5575, 14577], _
        [8959, 16126], _
        [8283, 14181], _
        [11326, 15154], _
        [13651, 13632], _
        [14950, 10082], _
        [9354, 10251], _
        [3201, 15559], _
        [-1093, 17013], _
        [-4508, 17554], _
        [-7585, 18332], _
        [-13028, 18704], _
        [-13332, 14646], _
        [-12622, 11908], _
        [-9715, 12212], _
        [-8610, 10602], _
        [-7720, 12347], _
        [-9144, 14558], _
        [-9850, 15593], _
        [-6962, 15539], _
        [-3716, 10805], _
        [-2337, 10068], _
        [-1783, 7868], _
        [-2191, 5676], _
        [-2513, 3646], _
        [-4854, 4728], _
        [-7424, 3444], _
        [-3190, 2098], _
        [-716, 3731], _
        [-3168, 2098], _
        [-3907, 637], _
        [-1135, -1256] _
]

Global $aProph_Kryta_NeboTerraceRoute02[60][2] = [ _
        [-1135, -1256], _
        [-3907, 637], _
        [-3168, 2098], _
        [-716, 3731], _
        [-3190, 2098], _
        [-7424, 3444], _
        [-4854, 4728], _
        [-2513, 3646], _
        [-2191, 5676], _
        [-1783, 7868], _
        [-2337, 10068], _
        [-3716, 10805], _
        [-6962, 15539], _
        [-9850, 15593], _
        [-9144, 14558], _
        [-7720, 12347], _
        [-8610, 10602], _
        [-9715, 12212], _
        [-12622, 11908], _
        [-13332, 14646], _
        [-13028, 18704], _
        [-7585, 18332], _
        [-4508, 17554], _
        [-1093, 17013], _
        [3201, 15559], _
        [9354, 10251], _
        [14950, 10082], _
        [13651, 13632], _
        [11326, 15154], _
        [8283, 14181], _
        [8959, 16126], _
        [5575, 14577], _
        [6872, 12398], _
        [4302, 9625], _
        [6053, 6474], _
        [4512, 395], _
        [7879, 2282], _
        [7473, 4615], _
        [11742, 6441], _
        [16780, 6305], _
        [17375, 2800], _
        [17743, -2702], _
        [15153, -4801], _
        [13764, -3762], _
        [11033, -3330], _
        [6093, -5635], _
        [14416, -10804], _
        [15072, -11261], _
        [14803, -11596], _
        [12244, -12945], _
        [13604, -14200], _
        [12070, -14128], _
        [9095, -12725], _
        [8187, -10670], _
        [9160, -9739], _
        [5795, -7208], _
        [3462, -7279], _
        [4988, -6324], _
        [1705, -7538], _
        [-279, -10444] _
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


	_Vanquisher_RunVanquishRoute($aProph_Kryta_NeboTerraceRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_NeboTerraceRoute02)
EndFunc

