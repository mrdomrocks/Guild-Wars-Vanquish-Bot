; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_ReedBog()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($ReedBog_Map, "ReedBog", "GoOutReedBog")
EndFunc

Func VQCaravanMaguuma_ReedBog()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($ReedBog_Map, "GoOutCaravanMaguuma_ReedBog", $ReedBog_Outpost, $ReedBog_Transit, 0, 0, "ReedBog") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need ReedBog (" & $ReedBog_Map & ").")
                Return
        EndIf

	CurrentAction("Starting ReedBog vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_ReedBogRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_ReedBogRoute02)
EndFunc
