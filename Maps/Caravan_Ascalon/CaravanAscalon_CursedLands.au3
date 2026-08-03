; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_CursedLands()
        _Vanquisher_RunDynamicCaravanGoOut($CursedLands_Map, "CursedLands")
EndFunc

Func VQCaravanAscalon_CursedLands()
	If GetMapID() <> $CursedLands_Map And GetMapID() <> $CursedLands_Outpost And GetMapID() <> $CursedLands_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for CursedLands.")
		TravelTo($CursedLands_Outpost)
	EndIf

	If GetMapID() = $CursedLands_Outpost Or GetMapID() = $CursedLands_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_CursedLands()
		If GetMapID() <> $CursedLands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need CursedLands (" & $CursedLands_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $CursedLands_Map Then
		CurrentAction("CursedLands route waiting - on map " & GetMapID() & ", need " & $CursedLands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting CursedLands vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Kryta_CursedLandsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_CursedLandsRoute02)
EndFunc

