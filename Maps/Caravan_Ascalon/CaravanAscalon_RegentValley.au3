; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_RegentValley()
        _Vanquisher_RunDynamicCaravanGoOut($RegentValley_Map, "RegentValley")
EndFunc

Func VQCaravanAscalon_RegentValley()
	If GetMapID() <> $RegentValley_Map And GetMapID() <> $RegentValley_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("RegentValley route waiting - on map " & GetMapID() & ", need " & $RegentValley_Map & " via Old Ascalon.")
		Return
	EndIf

	If GetMapID() = $RegentValley_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_RegentValley()
		If GetMapID() <> $RegentValley_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need RegentValley (" & $RegentValley_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $RegentValley_Map Then
		CurrentAction("RegentValley route waiting - on map " & GetMapID() & ", need " & $RegentValley_Map & ".")
		Return
	EndIf

	CurrentAction("Starting RegentValley vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_RegentValleyRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_RegentValleyRoute02)
EndFunc
