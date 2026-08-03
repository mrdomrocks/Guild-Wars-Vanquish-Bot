; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_TheBreach()
        _Vanquisher_RunDynamicCaravanGoOut($TheBreach_Map, "TheBreach")
EndFunc

Func VQCaravanAscalon_TheBreach()
	If GetMapID() <> $TheBreach_Map And GetMapID() <> $TheBreach_Transit And GetMapID() <> $TheBreach_Transit2 And GetMapID() <> $TheBreach_Transit3 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("TheBreach route waiting - on map " & GetMapID() & ", need " & $TheBreach_Map & " via Diessa Lowlands.")
		Return
	EndIf

	If GetMapID() = $TheBreach_Transit Or GetMapID() = $TheBreach_Transit2 Or GetMapID() = $TheBreach_Transit3 Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_TheBreach()
		If GetMapID() <> $TheBreach_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheBreach (" & $TheBreach_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TheBreach_Map Then
		CurrentAction("TheBreach route waiting - on map " & GetMapID() & ", need " & $TheBreach_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheBreach vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_TheBreachRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_TheBreachRoute02)
EndFunc
