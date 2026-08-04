; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_MajestysRest()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($MajestysRest_Map, "MajestysRest", "GoOutMajestysRest")
EndFunc

Func VQCaravanMaguuma_MajestysRest()
	If GetMapID() <> $MajestysRest_Map And GetMapID() <> $MajestysRest_Outpost And GetMapID() <> $MajestysRest_Transit And GetMapID() <> $MajestysRest_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MajestysRest.")
		TravelTo($MajestysRest_Outpost)
	EndIf

	If GetMapID() = $MajestysRest_Outpost Or GetMapID() = $MajestysRest_Transit Or GetMapID() = $MajestysRest_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_MajestysRest()
		If GetMapID() <> $MajestysRest_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MajestysRest (" & $MajestysRest_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $MajestysRest_Map Then
		CurrentAction("MajestysRest route waiting - on map " & GetMapID() & ", need " & $MajestysRest_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MajestysRest vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute02)
EndFunc
