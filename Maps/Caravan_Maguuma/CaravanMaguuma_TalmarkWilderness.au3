Global $aCaravan_Maguuma_CaravanMaguuma_TalmarkWildernessRoute01[70][2] = [ _
        [16888, 2685], _
        [10801, 8084], _
        [8472, 8084], _
        [9795, 11948], _
        [7836, 5755], _
        [3125, 8031], _
        [-1692, 7396], _
        [-4021, 9672], _
        [-7038, 10678], _
        [-4127, 16024], _
        [-421, 12583], _
        [4872, 14489], _
        [-377, 12410], _
        [-5391, 13832], _
        [-6983, 10716], _
        [-8643, 9801], _
        [-10608, 13765], _
        [-12979, 13460], _
        [-13352, 10784], _
        [-16299, 9564], _
        [-16807, 7464], _
        [-18603, 4686], _
        [-16977, 7362], _
        [-14233, 10750], _
        [-12200, 9225], _
        [-9591, 8514], _
        [-10438, 3466], _
        [-12225, 188], _
        [-10828, -2522], _
        [-6974, -5401], _
        [-4264, -4089], _
        [-1935, -2437], _
        [-1709, -6498], _
        [-555, -4552], _
        [-72, -2098], _
        [-2740, 824], _
        [-6726, 1964], _
        [-2909, 2136], _
        [-2824, 5355], _
        [267, 6159], _
        [606, -108], _
        [4849, 1524], _
        [6831, 4338], _
        [11150, 2856], _
        [11955, -447], _
        [12600, -4097], _
        [10633, -3261], _
        [7254, -1675], _
        [2808, -1506], _
        [6407, -3792], _
        [4713, -6714], _
        [8059, -8662], _
        [10049, -9086], _
        [10388, -9170], _
        [13691, -10102], _
        [13288, -7637], _
        [11813, -7490], _
        [13860, -9933], _
        [10134, -9382], _
        [12505, -13659], _
        [7466, -10144], _
        [6915, -12092], _
        [6661, -15353], _
        [9071, -15697], _
        [3104, -14464], _
        [5349, -10652], _
        [5052, -8154], _
        [2723, -7730], _
        [2850, -10017], _
        [-538, -11584] _
]

Global $aCaravan_Maguuma_CaravanMaguuma_TalmarkWildernessRoute02[70][2] = [ _
        [-538, -11584], _
        [2850, -10017], _
        [2723, -7730], _
        [5052, -8154], _
        [5349, -10652], _
        [3104, -14464], _
        [9071, -15697], _
        [6661, -15353], _
        [6915, -12092], _
        [7466, -10144], _
        [12505, -13659], _
        [10134, -9382], _
        [13860, -9933], _
        [11813, -7490], _
        [13288, -7637], _
        [13691, -10102], _
        [10388, -9170], _
        [10049, -9086], _
        [8059, -8662], _
        [4713, -6714], _
        [6407, -3792], _
        [2808, -1506], _
        [7254, -1675], _
        [10633, -3261], _
        [12600, -4097], _
        [11955, -447], _
        [11150, 2856], _
        [6831, 4338], _
        [4849, 1524], _
        [606, -108], _
        [267, 6159], _
        [-2824, 5355], _
        [-2909, 2136], _
        [-6726, 1964], _
        [-2740, 824], _
        [-72, -2098], _
        [-555, -4552], _
        [-1709, -6498], _
        [-1935, -2437], _
        [-4264, -4089], _
        [-6974, -5401], _
        [-10828, -2522], _
        [-12225, 188], _
        [-10438, 3466], _
        [-9591, 8514], _
        [-12200, 9225], _
        [-14233, 10750], _
        [-16977, 7362], _
        [-18603, 4686], _
        [-16807, 7464], _
        [-16299, 9564], _
        [-13352, 10784], _
        [-12979, 13460], _
        [-10608, 13765], _
        [-8643, 9801], _
        [-6983, 10716], _
        [-5391, 13832], _
        [-377, 12410], _
        [4872, 14489], _
        [-421, 12583], _
        [-4127, 16024], _
        [-7038, 10678], _
        [-4021, 9672], _
        [-1692, 7396], _
        [3125, 8031], _
        [7836, 5755], _
        [9795, 11948], _
        [8472, 8084], _
        [10801, 8084], _
        [16888, 2685] _
]

Func GoOutCaravanMaguuma_TalmarkWilderness()
        _Vanquisher_RunDynamicCaravanGoOut($TalmarkWilderness_Map, "TalmarkWilderness")
EndFunc

Func VQCaravanMaguuma_TalmarkWilderness()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $TalmarkWilderness_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TalmarkWilderness()
                        If GetMapID() <> $TalmarkWilderness_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TalmarkWilderness (" & $TalmarkWilderness_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $TalmarkWilderness_Map And GetMapID() <> $TalmarkWilderness_Outpost And GetMapID() <> $TalmarkWilderness_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for TalmarkWilderness.")
                        TravelTo($TalmarkWilderness_Outpost)
                EndIf

                If GetMapID() = $TalmarkWilderness_Outpost Or GetMapID() = $TalmarkWilderness_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_TalmarkWilderness()
                        If GetMapID() <> $TalmarkWilderness_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need TalmarkWilderness (" & $TalmarkWilderness_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $TalmarkWilderness_Map Then
		CurrentAction("TalmarkWilderness route waiting - on map " & GetMapID() & ", need " & $TalmarkWilderness_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TalmarkWilderness vanquish route.")


	_Vanquisher_RunCaravanRoute($aCaravan_Maguuma_CaravanMaguuma_TalmarkWildernessRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aCaravan_Maguuma_CaravanMaguuma_TalmarkWildernessRoute02)
EndFunc
