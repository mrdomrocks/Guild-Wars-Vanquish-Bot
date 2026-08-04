; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_Silverwood()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($Silverwood_Map, "Silverwood", "GoOutSilverwood")
EndFunc

Func VQCaravanMaguuma_Silverwood()
	If GetMapID() <> $Silverwood_Map And GetMapID() <> $Silverwood_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Silverwood.")
		TravelTo($Silverwood_Outpost)
	EndIf

	If GetMapID() = $Silverwood_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_Silverwood()
		If GetMapID() <> $Silverwood_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Silverwood (" & $Silverwood_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $Silverwood_Map Then
		CurrentAction("Silverwood route waiting - on map " & GetMapID() & ", need " & $Silverwood_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Silverwood vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SilverwoodRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SilverwoodRoute02)
EndFunc
