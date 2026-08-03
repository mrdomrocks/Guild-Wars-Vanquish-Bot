; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_MamnoonLagoon()
        _Vanquisher_RunDynamicCaravanGoOut($MamnoonLagoon_Map, "MamnoonLagoon")
EndFunc

Func VQCaravanMaguuma_MamnoonLagoon()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $MamnoonLagoon_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_MamnoonLagoon()
                        If GetMapID() <> $MamnoonLagoon_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for MamnoonLagoon.")
                        TravelTo($MamnoonLagoon_Outpost)
                EndIf
                If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_MamnoonLagoon()
                        If GetMapID() <> $MamnoonLagoon_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf
	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("MamnoonLagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf
	CurrentAction("Starting MamnoonLagoon vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute02)
EndFunc
