; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_ReedBog()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($ReedBog_Map, "ReedBog", "GoOutReedBog")
EndFunc

Func VQCaravanMaguuma_ReedBog()
	If GetMapID() <> $ReedBog_Map And GetMapID() <> $ReedBog_Outpost And GetMapID() <> $ReedBog_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for ReedBog.")
		TravelTo($ReedBog_Outpost)
	EndIf

	If GetMapID() = $ReedBog_Outpost Or GetMapID() = $ReedBog_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_ReedBog()
		If GetMapID() <> $ReedBog_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need ReedBog (" & $ReedBog_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $ReedBog_Map Then
		CurrentAction("ReedBog route waiting - on map " & GetMapID() & ", need " & $ReedBog_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ReedBog vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_ReedBogRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_ReedBogRoute02)
EndFunc
