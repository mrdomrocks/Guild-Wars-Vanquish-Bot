; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_SageLands()
        _Vanquisher_RunDynamicCaravanGoOut($SageLands_Map, "SageLands")
EndFunc

Func VQCaravanMaguuma_SageLands()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $SageLands_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_SageLands()
                        If GetMapID() <> $SageLands_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need SageLands (" & $SageLands_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $SageLands_Map And GetMapID() <> $SageLands_Outpost Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for SageLands.")
                        TravelTo($SageLands_Outpost)
                EndIf

                If GetMapID() = $SageLands_Outpost Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_SageLands()
                        If GetMapID() <> $SageLands_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need SageLands (" & $SageLands_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $SageLands_Map Then
		CurrentAction("SageLands route waiting - on map " & GetMapID() & ", need " & $SageLands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SageLands vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute02)
EndFunc
