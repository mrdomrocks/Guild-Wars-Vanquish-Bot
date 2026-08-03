; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_NeboTerrace()
        _Vanquisher_RunDynamicCaravanGoOut($NeboTerrace_Map, "NeboTerrace")
EndFunc

Func VQCaravanAscalon_NeboTerrace()
	If GetMapID() <> $NeboTerrace_Map And GetMapID() <> $NeboTerrace_Outpost And GetMapID() <> $NeboTerrace_Transit And GetMapID() <> $NeboTerrace_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for NeboTerrace.")
		TravelTo($NeboTerrace_Outpost)
	EndIf

	If GetMapID() = $NeboTerrace_Outpost Or GetMapID() = $NeboTerrace_Transit Or GetMapID() = $NeboTerrace_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_NeboTerrace()
		If GetMapID() <> $NeboTerrace_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need NeboTerrace (" & $NeboTerrace_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $NeboTerrace_Map Then
		CurrentAction("NeboTerrace route waiting - on map " & GetMapID() & ", need " & $NeboTerrace_Map & ".")
		Return
	EndIf

	CurrentAction("Starting NeboTerrace vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Kryta_NeboTerraceRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_NeboTerraceRoute02)
EndFunc

