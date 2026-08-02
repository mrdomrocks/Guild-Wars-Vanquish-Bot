Global $aCaravan_Ascalon_CaravanAscalon_GriffonsMouthRoute01[29][2] = [ _
        [-2913, -7105], _
        [-570, -6574], _
        [1535, -4368], _
        [3009, -6002], _
        [5547, -3291], _
        [6196, -356], _
        [5998, -3834], _
        [5162, -7264], _
        [6002, -3706], _
        [3041, -6006], _
        [1692, -3331], _
        [762, -1374], _
        [-2270, -1127], _
        [-1849, -4314], _
        [-2464, -1537], _
        [-5098, -977], _
        [-7529, 905], _
        [-6410, 3478], _
        [-3518, 5166], _
        [-2345, 4080], _
        [1349, 2834], _
        [-1156, 3651], _
        [-367, 6241], _
        [-961, 8115], _
        [-3406, 6831], _
        [-1159, 8115], _
        [597, 6595], _
        [3032, 8331], _
        [6586, 5423] _
]

Global $aCaravan_Ascalon_CaravanAscalon_GriffonsMouthRoute02[29][2] = [ _
        [6586, 5423], _
        [3032, 8331], _
        [597, 6595], _
        [-1159, 8115], _
        [-3406, 6831], _
        [-961, 8115], _
        [-367, 6241], _
        [-1156, 3651], _
        [1349, 2834], _
        [-2345, 4080], _
        [-3518, 5166], _
        [-6410, 3478], _
        [-7529, 905], _
        [-5098, -977], _
        [-2464, -1537], _
        [-1849, -4314], _
        [-2270, -1127], _
        [762, -1374], _
        [1692, -3331], _
        [3041, -6006], _
        [6002, -3706], _
        [5162, -7264], _
        [5998, -3834], _
        [6196, -356], _
        [5547, -3291], _
        [3009, -6002], _
        [1535, -4368], _
        [-570, -6574], _
        [-2913, -7105] _
]

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


	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_GriffonsMouthRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_GriffonsMouthRoute02)
EndFunc

