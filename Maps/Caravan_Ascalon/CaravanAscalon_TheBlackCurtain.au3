; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_TheBlackCurtain()
        _Vanquisher_RunDynamicCaravanGoOut($TheBlackCurtain_Map, "TheBlackCurtain")
EndFunc

Func VQCaravanAscalon_TheBlackCurtain()
	If GetMapID() <> $TheBlackCurtain_Map And GetMapID() <> $TheBlackCurtain_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TheBlackCurtain.")
		TravelTo($TheBlackCurtain_Outpost)
	EndIf

	If GetMapID() = $TheBlackCurtain_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_TheBlackCurtain()
		If GetMapID() <> $TheBlackCurtain_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheBlackCurtain (" & $TheBlackCurtain_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TheBlackCurtain_Map Then
		CurrentAction("TheBlackCurtain route waiting - on map " & GetMapID() & ", need " & $TheBlackCurtain_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheBlackCurtain vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Kryta_TheBlackCurtainRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_TheBlackCurtainRoute02)
EndFunc

