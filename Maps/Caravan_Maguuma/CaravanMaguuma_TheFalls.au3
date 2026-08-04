; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_TheFalls()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($TheFalls_Map, "TheFalls", "GoOutTheFalls")
EndFunc

Func VQCaravanMaguuma_TheFalls()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($TheFalls_Map, "GoOutCaravanMaguuma_TheFalls", $TheFalls_Outpost, $TheFalls_Transit, $TheFalls_Transit2, 0, "TheFalls") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need TheFalls (" & $TheFalls_Map & ").")
                Return
        EndIf

	CurrentAction("Starting TheFalls vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TheFallsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TheFallsRoute02)
EndFunc
