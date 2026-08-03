; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_IronHorseMine()
        _Vanquisher_RunDynamicCaravanGoOut($IronHorseMine_Map, "IronHorseMine")
EndFunc

Func VQCaravanAscalon_IronHorseMine()
	If GetMapID() <> $IronHorseMine_Map And GetMapID() <> $IronHorseMine_Outpost And GetMapID() <> $IronHorseMine_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for IronHorseMine.")
		TravelTo($IronHorseMine_Outpost)
	EndIf

	If GetMapID() = $IronHorseMine_Outpost Or GetMapID() = $IronHorseMine_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_IronHorseMine()
		If GetMapID() <> $IronHorseMine_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need IronHorseMine (" & $IronHorseMine_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $IronHorseMine_Map Then
		CurrentAction("IronHorseMine route waiting - on map " & GetMapID() & ", need " & $IronHorseMine_Map & ".")
		Return
	EndIf

	CurrentAction("Starting IronHorseMine vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_IronHorseMineRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_IronHorseMineRoute02)
EndFunc

