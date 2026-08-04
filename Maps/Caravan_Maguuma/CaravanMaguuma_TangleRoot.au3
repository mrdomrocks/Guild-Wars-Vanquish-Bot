; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_TangleRoot()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($TangleRoot_Map, "TangleRoot", "GoOutTangleRoot")
EndFunc

Func VQCaravanMaguuma_TangleRoot()
	If GetMapID() <> $TangleRoot_Map And GetMapID() <> $TangleRoot_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TangleRoot.")
		TravelTo($TangleRoot_Outpost)
	EndIf

	If GetMapID() = $TangleRoot_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_TangleRoot()
		If GetMapID() <> $TangleRoot_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TangleRoot (" & $TangleRoot_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TangleRoot_Map Then
		CurrentAction("TangleRoot route waiting - on map " & GetMapID() & ", need " & $TangleRoot_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TangleRoot vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute02)
EndFunc
