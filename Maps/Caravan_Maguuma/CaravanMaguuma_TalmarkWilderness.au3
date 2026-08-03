; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_TalmarkWilderness()
        _Vanquisher_RunDynamicCaravanGoOut($TalmarkWilderness_Map, "TalmarkWilderness")
EndFunc

Func VQCaravanMaguuma_TalmarkWilderness()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $TalmarkWilderness_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TalmarkWilderness()
                        If GetMapID() <> $TalmarkWilderness_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TalmarkWilderness (" & $TalmarkWilderness_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $TalmarkWilderness_Map And GetMapID() <> $TalmarkWilderness_Outpost And GetMapID() <> $TalmarkWilderness_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for TalmarkWilderness.")
                        TravelTo($TalmarkWilderness_Outpost)
                EndIf

                If GetMapID() = $TalmarkWilderness_Outpost Or GetMapID() = $TalmarkWilderness_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TalmarkWilderness()
                        If GetMapID() <> $TalmarkWilderness_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TalmarkWilderness (" & $TalmarkWilderness_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $TalmarkWilderness_Map Then
		CurrentAction("TalmarkWilderness route waiting - on map " & GetMapID() & ", need " & $TalmarkWilderness_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TalmarkWilderness vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Kryta_TalmarkWildernessRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_TalmarkWildernessRoute02)
EndFunc
