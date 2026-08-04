; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_SageLands()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($SageLands_Map, "SageLands", "GoOutSageLands")
EndFunc

Func VQCaravanMaguuma_SageLands()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($SageLands_Map, "GoOutCaravanMaguuma_SageLands", $SageLands_Outpost, 0, 0, 0, "SageLands") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need SageLands (" & $SageLands_Map & ").")
                Return
        EndIf

	CurrentAction("Starting SageLands vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute02)
EndFunc
