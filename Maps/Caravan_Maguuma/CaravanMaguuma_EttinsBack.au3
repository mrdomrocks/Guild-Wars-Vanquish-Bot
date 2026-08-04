; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_EttinsBack()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($EttinsBack_Map, "EttinsBack", "GoOutEttinsBack")
EndFunc

Func VQCaravanMaguuma_EttinsBack()
	If GetMapID() <> $EttinsBack_Map And GetMapID() <> $EttinsBack_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for EttinsBack.")
		TravelTo($EttinsBack_Outpost)
	EndIf

	If GetMapID() = $EttinsBack_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_EttinsBack()
		If GetMapID() <> $EttinsBack_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need EttinsBack (" & $EttinsBack_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $EttinsBack_Map Then
		CurrentAction("EttinsBack route waiting - on map " & GetMapID() & ", need " & $EttinsBack_Map & ".")
		Return
	EndIf

	CurrentAction("Starting EttinsBack vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute02)
EndFunc
