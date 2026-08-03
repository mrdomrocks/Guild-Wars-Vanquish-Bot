; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_FlameTempleCorridor()
        _Vanquisher_RunDynamicCaravanGoOut($FlameTempleCorridor_Map, "FlameTempleCorridor")
EndFunc

Func VQCaravanAscalon_FlameTempleCorridor()
	If GetMapID() <> $FlameTempleCorridor_Map And GetMapID() <> $FlameTempleCorridor_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("FlameTempleCorridor route waiting - on map " & GetMapID() & ", need " & $FlameTempleCorridor_Map & " via Diessa Lowlands.")
		Return
	EndIf

	If GetMapID() = $FlameTempleCorridor_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_FlameTempleCorridor()
		If GetMapID() <> $FlameTempleCorridor_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need FlameTempleCorridor (" & $FlameTempleCorridor_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $FlameTempleCorridor_Map Then
		CurrentAction("FlameTempleCorridor route waiting - on map " & GetMapID() & ", need " & $FlameTempleCorridor_Map & ".")
		Return
	EndIf

	CurrentAction("Starting FlameTempleCorridor vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_FlameTempleCorridorRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_FlameTempleCorridorRoute02)
EndFunc
