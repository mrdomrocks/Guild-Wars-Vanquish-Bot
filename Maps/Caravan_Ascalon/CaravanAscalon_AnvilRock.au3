; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_AnvilRock()
        _Vanquisher_RunDynamicCaravanGoOut($AnvilRock_Map, "AnvilRock")
EndFunc

Func VQCaravanAscalon_AnvilRock()
	If GetMapID() <> $AnvilRock_Map And GetMapID() <> $AnvilRock_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for AnvilRock.")
		TravelTo($AnvilRock_Outpost)
	EndIf

	If GetMapID() = $AnvilRock_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_AnvilRock()
		If GetMapID() <> $AnvilRock_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need AnvilRock (" & $AnvilRock_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $AnvilRock_Map Then
		CurrentAction("AnvilRock route waiting - on map " & GetMapID() & ", need " & $AnvilRock_Map & ".")
		Return
	EndIf

	CurrentAction("Starting AnvilRock vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_AnvilRockRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_AnvilRockRoute02)
EndFunc

