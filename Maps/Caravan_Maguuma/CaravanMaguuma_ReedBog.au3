Global $aCaravan_Maguuma_CaravanMaguuma_ReedBogRoute01[28][2] = [ _
        [7164, 7081], _
        [4803, 4633], _
        [-485, 7205], _
        [-2694, 6082], _
        [-5773, 5901], _
        [-8670, 3619], _
        [-8526, 70], _
        [-7871, -440], _
        [-7013, 2110], _
        [-5338, 3510], _
        [-2332, 4959], _
        [-2731, 3112], _
        [-5954, 939], _
        [-2948, 1881], _
        [-5198, -476], _
        [-7334, -1604], _
        [-8794, -2909], _
        [-7825, -5029], _
        [-7658, -6698], _
        [-2670, -6828], _
        [-1613, -9109], _
        [-333, -8646], _
        [186, -5512], _
        [2727, -4362], _
        [5507, -4939], _
        [5456, -1279], _
        [5874, 2961], _
        [6662, 4422] _
]

Global $aCaravan_Maguuma_CaravanMaguuma_ReedBogRoute02[28][2] = [ _
        [6662, 4422], _
        [5874, 2961], _
        [5456, -1279], _
        [5507, -4939], _
        [2727, -4362], _
        [186, -5512], _
        [-333, -8646], _
        [-1613, -9109], _
        [-2670, -6828], _
        [-7658, -6698], _
        [-7825, -5029], _
        [-8794, -2909], _
        [-7334, -1604], _
        [-5198, -476], _
        [-2948, 1881], _
        [-5954, 939], _
        [-2731, 3112], _
        [-2332, 4959], _
        [-5338, 3510], _
        [-7013, 2110], _
        [-7871, -440], _
        [-8526, 70], _
        [-8670, 3619], _
        [-5773, 5901], _
        [-2694, 6082], _
        [-485, 7205], _
        [4803, 4633], _
        [7164, 7081] _
]

Func GoOutCaravanMaguuma_ReedBog()
        _Vanquisher_RunDynamicCaravanGoOut($ReedBog_Map, "ReedBog")
EndFunc

Func VQCaravanMaguuma_ReedBog()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $ReedBog_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_ReedBog()
                        If GetMapID() <> $ReedBog_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need ReedBog (" & $ReedBog_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $ReedBog_Map And GetMapID() <> $ReedBog_Outpost And GetMapID() <> $ReedBog_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for ReedBog.")
                        TravelTo($ReedBog_Outpost)
                EndIf

                If GetMapID() = $ReedBog_Outpost Or GetMapID() = $ReedBog_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_ReedBog()
                        If GetMapID() <> $ReedBog_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need ReedBog (" & $ReedBog_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $ReedBog_Map Then
		CurrentAction("ReedBog route waiting - on map " & GetMapID() & ", need " & $ReedBog_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ReedBog vanquish route.")


	_Vanquisher_RunCaravanRoute($aCaravan_Maguuma_CaravanMaguuma_ReedBogRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aCaravan_Maguuma_CaravanMaguuma_ReedBogRoute02)
EndFunc
