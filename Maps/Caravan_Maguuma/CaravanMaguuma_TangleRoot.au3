; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_TangleRoot()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($TangleRoot_Map, "TangleRoot", "GoOutTangleRoot")
EndFunc

Func VQCaravanMaguuma_TangleRoot()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($TangleRoot_Map, "GoOutCaravanMaguuma_TangleRoot", $TangleRoot_Outpost, 0, 0, 0, "TangleRoot") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need TangleRoot (" & $TangleRoot_Map & ").")
                Return
        EndIf

	CurrentAction("Starting TangleRoot vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute02)
EndFunc
