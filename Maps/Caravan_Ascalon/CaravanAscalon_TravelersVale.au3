; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_TravelersVale()
        _Vanquisher_RunDynamicCaravanGoOut($TravelersVale_Map, "TravelersVale")
EndFunc

Func VQCaravanAscalon_TravelersVale()
	If GetMapID() <> $TravelersVale_Map And GetMapID() <> $TravelersVale_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to Yak's Bend for Traveler's Vale.")
		TravelTo($TravelersVale_Outpost)
	EndIf

	If GetMapID() = $TravelersVale_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_TravelersVale()
		If GetMapID() <> $TravelersVale_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Traveler's Vale (" & $TravelersVale_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TravelersVale_Map Then
		CurrentAction("Traveler's Vale route waiting - on map " & GetMapID() & ", need " & $TravelersVale_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Traveler's Vale vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_TravelersValeRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_TravelersValeRoute02)
EndFunc
