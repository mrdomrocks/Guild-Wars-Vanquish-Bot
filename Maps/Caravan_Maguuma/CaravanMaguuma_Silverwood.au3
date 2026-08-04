; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_Silverwood()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($Silverwood_Map, "Silverwood", "GoOutSilverwood")
EndFunc

Func VQCaravanMaguuma_Silverwood()
        If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($Silverwood_Map, "GoOutCaravanMaguuma_Silverwood", $Silverwood_Outpost, 0, 0, 0, "Silverwood") Then
                CurrentAction("Routing - on map " & GetMapID() & ", need Silverwood (" & $Silverwood_Map & ").")
                Return
        EndIf

	CurrentAction("Starting Silverwood vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SilverwoodRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SilverwoodRoute02)
EndFunc
