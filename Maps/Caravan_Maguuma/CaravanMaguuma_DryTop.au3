Func GoOutCaravanMaguuma_DryTop()
        _Vanquisher_RunDynamicCaravanGoOut($DryTop_Map, "DryTop")
EndFunc

Func VQCaravanMaguuma_DryTop()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $DryTop_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_DryTop()
                        If GetMapID() <> $DryTop_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need DryTop (" & $DryTop_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $DryTop_Map And GetMapID() <> $DryTop_Outpost And GetMapID() <> $DryTop_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for DryTop.")
                        TravelTo($DryTop_Outpost)
                EndIf

                If GetMapID() = $DryTop_Outpost Or GetMapID() = $DryTop_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_DryTop()
                        If GetMapID() <> $DryTop_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need DryTop (" & $DryTop_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $DryTop_Map Then
		CurrentAction("DryTop route waiting - on map " & GetMapID() & ", need " & $DryTop_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DryTop vanquish route.")


	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4726, -6046)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3652, -6357)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1709, -6960)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(150, -6957)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1465, -6071)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2973, -6180)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4743, -4626)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5546, -3189)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6116, -1455)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6942, 221)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7052, 1744)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6870, 3675)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6762, 4836)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6246, 7872)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6666, 5394)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4459, 6750)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2761, 7679)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2045, 6834)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-401, 6976)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1153, 6953)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2522, 6652)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1794, 5353)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3262, 3513)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3107, 2892)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6138, 2248)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6528, 4224)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3646, 1677)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1775, 1367)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1210, -191)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2669, -2336)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5369, -2187)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6427, -3114)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5919, -5577)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1639, -7009)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2905, -6831)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1896, -6216)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4104, -3672)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5428, -3241)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6134, -1119)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7154, 3174)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6772, 5855)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5742, 6064)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2241, 7155)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1724, 6378)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4813, 4913)

	; reverse
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4813, 4913)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1724, 6378)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2241, 7155)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5742, 6064)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6772, 5855)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7154, 3174)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6134, -1119)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5428, -3241)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4104, -3672)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1896, -6216)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2905, -6831)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1639, -7009)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5919, -5577)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6427, -3114)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5369, -2187)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2669, -2336)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1210, -191)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1775, 1367)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3646, 1677)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6528, 4224)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6138, 2248)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3107, 2892)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3262, 3513)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1794, 5353)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2522, 6652)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1153, 6953)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-401, 6976)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2045, 6834)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2761, 7679)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4459, 6750)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6666, 5394)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6246, 7872)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6762, 4836)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6870, 3675)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7052, 1744)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6942, 221)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6116, -1455)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5546, -3189)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4743, -4626)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2973, -6180)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1465, -6071)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(150, -6957)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1709, -6960)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3652, -6357)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4726, -6046)
EndFunc
