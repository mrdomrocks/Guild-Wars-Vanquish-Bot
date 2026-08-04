; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_DryTop()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($DryTop_Map, "DryTop", "GoOutDryTop")
EndFunc

Func VQCaravanMaguuma_DryTop()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($DryTop_Map, "GoOutCaravanMaguuma_DryTop", $DryTop_Outpost, $DryTop_Transit, 0, 0, "DryTop") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need DryTop (" & $DryTop_Map & ").")
                Return
        EndIf

	CurrentAction("Starting DryTop vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute02)
EndFunc
