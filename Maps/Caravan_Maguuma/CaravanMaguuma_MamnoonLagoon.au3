; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_MamnoonLagoon()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($MamnoonLagoon_Map, "MamnoonLagoon", "GoOutMamnoonLagoon")
EndFunc

Func VQCaravanMaguuma_MamnoonLagoon()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($MamnoonLagoon_Map, "GoOutCaravanMaguuma_MamnoonLagoon", $MamnoonLagoon_Outpost, $MamnoonLagoon_Transit, 0, 0, "MamnoonLagoon") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
                Return
        EndIf

	CurrentAction("Starting MamnoonLagoon vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute02)
EndFunc
