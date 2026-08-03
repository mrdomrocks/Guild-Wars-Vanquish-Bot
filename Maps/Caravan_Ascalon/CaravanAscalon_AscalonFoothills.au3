; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_AscalonFoothills()
        _Vanquisher_RunDynamicCaravanGoOut($AscalonFoothills_Map, "AscalonFoothills")
EndFunc

Func VQCaravanAscalon_AscalonFoothills()
	If GetMapID() <> $AscalonFoothills_Map And GetMapID() <> $AscalonFoothills_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("AscalonFoothills route waiting - on map " & GetMapID() & ", need " & $AscalonFoothills_Map & " via Traveler's Vale.")
		Return
	EndIf

	If GetMapID() = $AscalonFoothills_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_AscalonFoothills()
		If GetMapID() <> $AscalonFoothills_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need AscalonFoothills (" & $AscalonFoothills_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $AscalonFoothills_Map Then
		CurrentAction("AscalonFoothills route waiting - on map " & GetMapID() & ", need " & $AscalonFoothills_Map & ".")
		Return
	EndIf

	CurrentAction("Starting AscalonFoothills vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_AscalonFoothillsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_AscalonFoothillsRoute02)
EndFunc
