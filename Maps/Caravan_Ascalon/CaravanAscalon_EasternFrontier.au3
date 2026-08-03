; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_EasternFrontier()
        _Vanquisher_RunDynamicCaravanGoOut($EasternFrontier_Map, "EasternFrontier")
EndFunc

Func VQCaravanAscalon_EasternFrontier()
	If GetMapID() <> $EasternFrontier_Map And GetMapID() <> $EasternFrontier_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("EasternFrontier route waiting - on map " & GetMapID() & ", need " & $EasternFrontier_Map & " via Pockmark Flats.")
		Return
	EndIf

	If GetMapID() = $EasternFrontier_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_EasternFrontier()
		If GetMapID() <> $EasternFrontier_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need EasternFrontier (" & $EasternFrontier_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $EasternFrontier_Map Then
		CurrentAction("EasternFrontier route waiting - on map " & GetMapID() & ", need " & $EasternFrontier_Map & ".")
		Return
	EndIf

	CurrentAction("Starting EasternFrontier vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_EasternFrontierRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_EasternFrontierRoute02)
EndFunc
