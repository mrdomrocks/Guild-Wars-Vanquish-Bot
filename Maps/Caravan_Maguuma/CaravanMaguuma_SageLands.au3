; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_SageLands()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($SageLands_Map, "SageLands", "GoOutSageLands")
EndFunc

Func VQCaravanMaguuma_SageLands()
	If GetMapID() <> $SageLands_Map And GetMapID() <> $SageLands_Outpost And GetMapID() <> $SageLands_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SageLands.")
		TravelTo($SageLands_Outpost)
	EndIf

	If GetMapID() = $SageLands_Outpost Or GetMapID() = $SageLands_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_SageLands()
		If GetMapID() <> $SageLands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SageLands (" & $SageLands_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $SageLands_Map Then
		CurrentAction("SageLands route waiting - on map " & GetMapID() & ", need " & $SageLands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SageLands vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute02)
EndFunc
