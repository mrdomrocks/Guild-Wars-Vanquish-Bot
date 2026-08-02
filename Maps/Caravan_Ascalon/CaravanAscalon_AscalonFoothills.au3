Global $aCaravan_Ascalon_CaravanAscalon_AscalonFoothillsRoute01[14][2] = [ _
        [-5785, 1558], _
        [-2684, 2006], _
        [-5544, -1613], _
        [-3428, -5729], _
        [373, -3274], _
        [-3156, -2098], _
        [-1639, 751], _
        [621, -735], _
        [2040, 2078], _
        [240, 5077], _
        [4885, 5096], _
        [5939, 1126], _
        [3321, -3531], _
        [7394, -6932] _
]

Global $aCaravan_Ascalon_CaravanAscalon_AscalonFoothillsRoute02[14][2] = [ _
        [7394, -6932], _
        [3321, -3531], _
        [5939, 1126], _
        [4885, 5096], _
        [240, 5077], _
        [2040, 2078], _
        [621, -735], _
        [-1639, 751], _
        [-3156, -2098], _
        [373, -3274], _
        [-3428, -5729], _
        [-5544, -1613], _
        [-2684, 2006], _
        [-5785, 1558] _
]

Func GoOutCaravanAscalon_AscalonFoothills()
        _Vanquisher_RunDynamicCaravanGoOut($AscalonFoothills_Map, "AscalonFoothills")
EndFunc

Func VQCaravanAscalon_AscalonFoothills()
	If GetMapID() <> $AscalonFoothills_Map And GetMapID() <> $AscalonFoothills_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("AscalonFoothills route waiting - on map " & GetMapID() & ", need " & $AscalonFoothills_Map & " via Traveler's Vale.")
		Return
	EndIf

	If GetMapID() = $AscalonFoothills_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_AscalonFoothills()
		If GetMapID() <> $AscalonFoothills_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need AscalonFoothills (" & $AscalonFoothills_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $AscalonFoothills_Map Then
		CurrentAction("AscalonFoothills route waiting - on map " & GetMapID() & ", need " & $AscalonFoothills_Map & ".")
		Return
	EndIf

	CurrentAction("Starting AscalonFoothills vanquish route.")


	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_AscalonFoothillsRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_AscalonFoothillsRoute02)
EndFunc
