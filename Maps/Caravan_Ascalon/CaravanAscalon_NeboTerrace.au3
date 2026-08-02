Global $aCaravan_Ascalon_CaravanAscalon_NeboTerraceRoute01[60][2] = [ _
        [-279, -10444], _
        [1705, -7538], _
        [4988, -6324], _
        [3462, -7279], _
        [5795, -7208], _
        [9160, -9739], _
        [8187, -10670], _
        [9095, -12725], _
        [12070, -14128], _
        [13604, -14200], _
        [12244, -12945], _
        [14803, -11596], _
        [15072, -11261], _
        [14416, -10804], _
        [6093, -5635], _
        [11033, -3330], _
        [13764, -3762], _
        [15153, -4801], _
        [17743, -2702], _
        [17375, 2800], _
        [16780, 6305], _
        [11742, 6441], _
        [7473, 4615], _
        [7879, 2282], _
        [4512, 395], _
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

Global $aCaravan_Ascalon_CaravanAscalon_NeboTerraceRoute02[60][2] = [ _
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

Func GoOutCaravanAscalon_NeboTerrace()
        _Vanquisher_RunDynamicCaravanGoOut($NeboTerrace_Map, "NeboTerrace")
EndFunc

Func VQCaravanAscalon_NeboTerrace()
	If GetMapID() <> $NeboTerrace_Map And GetMapID() <> $NeboTerrace_Outpost And GetMapID() <> $NeboTerrace_Transit And GetMapID() <> $NeboTerrace_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for NeboTerrace.")
		TravelTo($NeboTerrace_Outpost)
	EndIf

	If GetMapID() = $NeboTerrace_Outpost Or GetMapID() = $NeboTerrace_Transit Or GetMapID() = $NeboTerrace_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_NeboTerrace()
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


	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_NeboTerraceRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_NeboTerraceRoute02)
EndFunc

