; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_DeldrimorBowl()
        _Vanquisher_RunDynamicCaravanGoOut($DeldrimorBowl_Map, "DeldrimorBowl")
EndFunc

Func VQCaravanAscalon_DeldrimorBowl()
	If GetMapID() <> $DeldrimorBowl_Map And GetMapID() <> $DeldrimorBowl_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DeldrimorBowl.")
		TravelTo($DeldrimorBowl_Outpost)
	EndIf

	If GetMapID() = $DeldrimorBowl_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_DeldrimorBowl()
		If GetMapID() <> $DeldrimorBowl_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DeldrimorBowl (" & $DeldrimorBowl_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DeldrimorBowl_Map Then
		CurrentAction("DeldrimorBowl route waiting - on map " & GetMapID() & ", need " & $DeldrimorBowl_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DeldrimorBowl vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_SouthernShiverpeaks_DeldrimorBowlRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_SouthernShiverpeaks_DeldrimorBowlRoute02)
EndFunc

