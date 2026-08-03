; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_TheFalls()
        _Vanquisher_RunDynamicCaravanGoOut($TheFalls_Map, "TheFalls")
EndFunc

Func VQCaravanMaguuma_TheFalls()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $TheFalls_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TheFalls()
                        If GetMapID() <> $TheFalls_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TheFalls (" & $TheFalls_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $TheFalls_Map And GetMapID() <> $TheFalls_Outpost And GetMapID() <> $TheFalls_Transit And GetMapID() <> $TheFalls_Transit2 Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for TheFalls.")
                        TravelTo($TheFalls_Outpost)
                EndIf

                If GetMapID() = $TheFalls_Outpost Or GetMapID() = $TheFalls_Transit Or GetMapID() = $TheFalls_Transit2 Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TheFalls()
                        If GetMapID() <> $TheFalls_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TheFalls (" & $TheFalls_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $TheFalls_Map Then
		CurrentAction("TheFalls route waiting - on map " & GetMapID() & ", need " & $TheFalls_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheFalls vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TheFallsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TheFallsRoute02)
EndFunc
