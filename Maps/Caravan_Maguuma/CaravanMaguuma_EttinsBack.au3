; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_EttinsBack()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($EttinsBack_Map, "EttinsBack", "GoOutEttinsBack")
EndFunc

Func VQCaravanMaguuma_EttinsBack()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($EttinsBack_Map, "GoOutCaravanMaguuma_EttinsBack", $EttinsBack_Outpost, 0, 0, 0, "EttinsBack") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need EttinsBack (" & $EttinsBack_Map & ").")
                Return
        EndIf

	CurrentAction("Starting EttinsBack vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute02)
EndFunc
