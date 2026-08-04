; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_MajestysRest()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($MajestysRest_Map, "MajestysRest", "GoOutMajestysRest")
EndFunc

Func VQCaravanMaguuma_MajestysRest()
       If Not _Vanquisher_RouteCaravanMaguumaToTargetMap($MajestysRest_Map, "GoOutCaravanMaguuma_MajestysRest", $MajestysRest_Outpost, $MajestysRest_Transit, $MajestysRest_Transit2, 0, "MajestysRest") Then
               CurrentAction("Routing - on map " & GetMapID() & ", need MajestysRest (" & $MajestysRest_Map & ").")
               Return
       EndIf

	CurrentAction("Starting MajestysRest vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute02)
EndFunc
