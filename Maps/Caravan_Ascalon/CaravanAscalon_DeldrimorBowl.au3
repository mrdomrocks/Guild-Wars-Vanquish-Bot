Global $aCaravan_Ascalon_CaravanAscalon_DeldrimorBowlRoute01[42][2] = [ _
        [12342, -21414], _
        [15627, -15210], _
        [12342, -13124], _
        [12632, -5901], _
        [12882, -2022], _
        [8294, -7736], _
        [6037, -13151], _
        [6334, -16162], _
        [4450, -20112], _
        [620, -20291], _
        [-5595, -16954], _
        [-12127, -20917], _
        [-6821, -16846], _
        [-7695, -13637], _
        [-6173, -11667], _
        [-5321, -8053], _
        [-6821, -2898], _
        [-8319, 3838], _
        [-4109, 6145], _
        [-2545, 215], _
        [-2323, 7592], _
        [2682, 1649], _
        [7954, 6], _
        [10920, 5402], _
        [7329, 10057], _
        [12998, 7398], _
        [15051, 9684], _
        [13566, 13974], _
        [11773, 11587], _
        [8388, 14252], _
        [13110, 17968], _
        [14830, 21878], _
        [6801, 26727], _
        [1952, 23338], _
        [-5712, 24068], _
        [-8319, 22347], _
        [-5816, 20053], _
        [649, 21096], _
        [-133, 18645], _
        [-4826, 17811], _
        [-7015, 10564], _
        [-7276, 7227] _
]

Global $aCaravan_Ascalon_CaravanAscalon_DeldrimorBowlRoute02[42][2] = [ _
        [-7276, 7227], _
        [-7015, 10564], _
        [-4826, 17811], _
        [-133, 18645], _
        [649, 21096], _
        [-5816, 20053], _
        [-8319, 22347], _
        [-5712, 24068], _
        [1952, 23338], _
        [6801, 26727], _
        [14830, 21878], _
        [13110, 17968], _
        [8388, 14252], _
        [11773, 11587], _
        [13566, 13974], _
        [15051, 9684], _
        [12998, 7398], _
        [7329, 10057], _
        [10920, 5402], _
        [7954, 6], _
        [2682, 1649], _
        [-2323, 7592], _
        [-2545, 215], _
        [-4109, 6145], _
        [-8319, 3838], _
        [-6821, -2898], _
        [-5321, -8053], _
        [-6173, -11667], _
        [-7695, -13637], _
        [-6821, -16846], _
        [-12127, -20917], _
        [-5595, -16954], _
        [620, -20291], _
        [4450, -20112], _
        [6334, -16162], _
        [6037, -13151], _
        [8294, -7736], _
        [12882, -2022], _
        [12632, -5901], _
        [12342, -13124], _
        [15627, -15210], _
        [12342, -21414] _
]

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


	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_DeldrimorBowlRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_DeldrimorBowlRoute02)
EndFunc

