; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_MamnoonLagoon()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($MamnoonLagoon_Map, "MamnoonLagoon", "GoOutMamnoonLagoon")
EndFunc

Func VQCaravanMaguuma_MamnoonLagoon()
	If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MamnoonLagoon.")
		TravelTo($MamnoonLagoon_Outpost)
	EndIf

	If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_MamnoonLagoon()
		If GetMapID() <> $MamnoonLagoon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("MamnoonLagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MamnoonLagoon vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute02)
EndFunc
