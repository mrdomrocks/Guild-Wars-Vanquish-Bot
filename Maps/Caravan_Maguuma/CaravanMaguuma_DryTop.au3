; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_DryTop()
        _Vanquisher_RunDynamicCaravanGoOut($DryTop_Map, "DryTop")
EndFunc

Func VQCaravanMaguuma_DryTop()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $DryTop_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_DryTop()
                        If GetMapID() <> $DryTop_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need DryTop (" & $DryTop_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $DryTop_Map And GetMapID() <> $DryTop_Outpost And GetMapID() <> $DryTop_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for DryTop.")
                        TravelTo($DryTop_Outpost)
                EndIf

                If GetMapID() = $DryTop_Outpost Or GetMapID() = $DryTop_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_DryTop()
                        If GetMapID() <> $DryTop_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need DryTop (" & $DryTop_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $DryTop_Map Then
		CurrentAction("DryTop route waiting - on map " & GetMapID() & ", need " & $DryTop_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DryTop vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute02)
EndFunc
