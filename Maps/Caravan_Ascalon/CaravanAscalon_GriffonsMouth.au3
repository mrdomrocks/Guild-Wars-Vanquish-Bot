; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_GriffonsMouth()
        _Vanquisher_RunDynamicCaravanGoOut($GriffonsMouth_Map, "GriffonsMouth")
EndFunc

Func VQCaravanAscalon_GriffonsMouth()
	If GetMapID() <> $GriffonsMouth_Map And GetMapID() <> $GriffonsMouth_Outpost And GetMapID() <> $GriffonsMouth_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for GriffonsMouth.")
		TravelTo($GriffonsMouth_Outpost)
	EndIf

	If GetMapID() = $GriffonsMouth_Outpost Or GetMapID() = $GriffonsMouth_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_GriffonsMouth()
		If GetMapID() <> $GriffonsMouth_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need GriffonsMouth (" & $GriffonsMouth_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $GriffonsMouth_Map Then
		CurrentAction("GriffonsMouth route waiting - on map " & GetMapID() & ", need " & $GriffonsMouth_Map & ".")
		Return
	EndIf

	CurrentAction("Starting GriffonsMouth vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_GriffonsMouthRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_NorthernShiverpeaks_GriffonsMouthRoute02)
EndFunc

