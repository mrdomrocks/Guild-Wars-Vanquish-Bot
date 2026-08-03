; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_EttinsBack()
        _Vanquisher_RunDynamicCaravanGoOut($EttinsBack_Map, "EttinsBack")
EndFunc

Func VQCaravanMaguuma_EttinsBack()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $EttinsBack_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_EttinsBack()
                        If GetMapID() <> $EttinsBack_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need EttinsBack (" & $EttinsBack_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $EttinsBack_Map And GetMapID() <> $EttinsBack_Outpost Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for EttinsBack.")
                        TravelTo($EttinsBack_Outpost)
                EndIf

                If GetMapID() = $EttinsBack_Outpost Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_EttinsBack()
                        If GetMapID() <> $EttinsBack_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need EttinsBack (" & $EttinsBack_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $EttinsBack_Map Then
		CurrentAction("EttinsBack route waiting - on map " & GetMapID() & ", need " & $EttinsBack_Map & ".")
		Return
	EndIf

	CurrentAction("Starting EttinsBack vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute02)
EndFunc


