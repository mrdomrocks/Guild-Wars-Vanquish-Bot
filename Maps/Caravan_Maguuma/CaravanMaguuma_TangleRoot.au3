; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_TangleRoot()
        _Vanquisher_RunDynamicCaravanGoOut($TangleRoot_Map, "TangleRoot")
EndFunc

Func VQCaravanMaguuma_TangleRoot()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $TangleRoot_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TangleRoot()
                        If GetMapID() <> $TangleRoot_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TangleRoot (" & $TangleRoot_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $TangleRoot_Map And GetMapID() <> $TangleRoot_Outpost Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for TangleRoot.")
                        TravelTo($TangleRoot_Outpost)
                EndIf

                If GetMapID() = $TangleRoot_Outpost Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TangleRoot()
                        If GetMapID() <> $TangleRoot_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TangleRoot (" & $TangleRoot_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $TangleRoot_Map Then
		CurrentAction("TangleRoot route waiting - on map " & GetMapID() & ", need " & $TangleRoot_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TangleRoot vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute02)
EndFunc
