; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_ScoundrelsRise()
        _Vanquisher_RunDynamicCaravanGoOut($ScoundrelsRise_Map, "ScoundrelsRise")
EndFunc

Func VQCaravanAscalon_ScoundrelsRise()
	If GetMapID() <> $ScoundrelsRise_Map And GetMapID() <> $ScoundrelsRise_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for ScoundrelsRise.")
		TravelTo($ScoundrelsRise_Outpost)
	EndIf

	If GetMapID() = $ScoundrelsRise_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_ScoundrelsRise()
		If GetMapID() <> $ScoundrelsRise_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need ScoundrelsRise (" & $ScoundrelsRise_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $ScoundrelsRise_Map Then
		CurrentAction("ScoundrelsRise route waiting - on map " & GetMapID() & ", need " & $ScoundrelsRise_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ScoundrelsRise vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Kryta_ScoundrelsRiseRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_ScoundrelsRiseRoute02)
EndFunc

