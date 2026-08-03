; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_DiessaLowlands()
        _Vanquisher_RunDynamicCaravanGoOut($DiessaLowlands_Map, "DiessaLowlands")
EndFunc

Func VQCaravanAscalon_DiessaLowlands()
	If GetMapID() <> $DiessaLowlands_Map And GetMapID() <> $DiessaLowlands_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("DiessaLowlands route waiting - on map " & GetMapID() & ", need " & $DiessaLowlands_Map & " via Ascalon Foothills.")
		Return
	EndIf

	If GetMapID() = $DiessaLowlands_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_DiessaLowlands()
		If GetMapID() <> $DiessaLowlands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DiessaLowlands (" & $DiessaLowlands_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $DiessaLowlands_Map Then
		CurrentAction("DiessaLowlands route waiting - on map " & GetMapID() & ", need " & $DiessaLowlands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DiessaLowlands vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_DiessaLowlandsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_DiessaLowlandsRoute02)
EndFunc
