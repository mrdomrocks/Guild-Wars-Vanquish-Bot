; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_PockmarkFlats()
        _Vanquisher_RunDynamicCaravanGoOut($PockmarkFlats_Map, "PockmarkFlats")
EndFunc

Func VQCaravanAscalon_PockmarkFlats()
	If GetMapID() <> $PockmarkFlats_Map And GetMapID() <> $PockmarkFlats_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("PockmarkFlats route waiting - on map " & GetMapID() & ", need " & $PockmarkFlats_Map & " via Regent Valley.")
		Return
	EndIf

	If GetMapID() = $PockmarkFlats_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_PockmarkFlats()
		If GetMapID() <> $PockmarkFlats_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need PockmarkFlats (" & $PockmarkFlats_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $PockmarkFlats_Map Then
		CurrentAction("PockmarkFlats route waiting - on map " & GetMapID() & ", need " & $PockmarkFlats_Map & ".")
		Return
	EndIf

	CurrentAction("Starting PockmarkFlats vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_PockmarkFlatsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_PockmarkFlatsRoute02)
EndFunc
