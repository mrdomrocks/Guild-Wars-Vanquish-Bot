; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_NorthKrytaProvince()
        _Vanquisher_RunDynamicCaravanGoOut($NorthKrytaProvince_Map, "NorthKrytaProvince")
EndFunc

Func VQCaravanAscalon_NorthKrytaProvince()
	If GetMapID() <> $NorthKrytaProvince_Map And GetMapID() <> $NorthKrytaProvince_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for NorthKrytaProvince.")
		TravelTo($NorthKrytaProvince_Outpost)
	EndIf

	If GetMapID() = $NorthKrytaProvince_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_NorthKrytaProvince()
		If GetMapID() <> $NorthKrytaProvince_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need NorthKrytaProvince (" & $NorthKrytaProvince_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $NorthKrytaProvince_Map Then
		CurrentAction("NorthKrytaProvince route waiting - on map " & GetMapID() & ", need " & $NorthKrytaProvince_Map & ".")
		Return
	EndIf

	CurrentAction("Starting NorthKrytaProvince vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Kryta_NorthKrytaProvinceRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_NorthKrytaProvinceRoute02)
EndFunc

