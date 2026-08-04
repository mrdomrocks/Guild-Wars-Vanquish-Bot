; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_TalmarkWilderness()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($TalmarkWilderness_Map, "TalmarkWilderness", "GoOutTalmarkWilderness")
EndFunc

Func VQCaravanMaguuma_TalmarkWilderness()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($TalmarkWilderness_Map, "GoOutCaravanMaguuma_TalmarkWilderness", $TalmarkWilderness_Outpost, $TalmarkWilderness_Transit, 0, 0, "TalmarkWilderness") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need TalmarkWilderness (" & $TalmarkWilderness_Map & ").")
                Return
        EndIf

	CurrentAction("Starting TalmarkWilderness vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Kryta_TalmarkWildernessRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_TalmarkWildernessRoute02)
EndFunc
