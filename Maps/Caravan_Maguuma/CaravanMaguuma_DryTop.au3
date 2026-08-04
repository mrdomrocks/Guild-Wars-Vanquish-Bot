; Route coordinates shared with the standard vanquish map script.
; Vanquish this map fully, then the caravan queue advances and portals to the next area.

Func GoOutCaravanMaguuma_DryTop()
        _Vanquisher_RunDynamicCaravanGoOutWithFallback($DryTop_Map, "DryTop", "GoOutDryTop")
EndFunc

Func VQCaravanMaguuma_DryTop()
	If GetMapID() <> $DryTop_Map And GetMapID() <> $DryTop_Outpost And GetMapID() <> $DryTop_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DryTop.")
		TravelTo($DryTop_Outpost)
	EndIf

	If GetMapID() = $DryTop_Outpost Or GetMapID() = $DryTop_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanMaguuma_DryTop()
		If GetMapID() <> $DryTop_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DryTop (" & $DryTop_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $DryTop_Map Then
		CurrentAction("DryTop route waiting - on map " & GetMapID() & ", need " & $DryTop_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DryTop vanquish route.")

	_Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute02)
EndFunc
