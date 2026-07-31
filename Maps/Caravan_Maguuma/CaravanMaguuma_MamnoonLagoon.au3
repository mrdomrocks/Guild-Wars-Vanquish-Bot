Func GoOutCaravanMaguuma_MamnoonLagoon()
        _Vanquisher_RunDynamicCaravanGoOut($MamnoonLagoon_Map, "MamnoonLagoon")
EndFunc

Func VQCaravanMaguuma_MamnoonLagoon()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $MamnoonLagoon_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_MamnoonLagoon()
                        If GetMapID() <> $MamnoonLagoon_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for MamnoonLagoon.")
                        TravelTo($MamnoonLagoon_Outpost)
                EndIf
                If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_MamnoonLagoon()
                        If GetMapID() <> $MamnoonLagoon_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf
	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("MamnoonLagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf
	CurrentAction("Starting MamnoonLagoon vanquish route.")

	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6363, -5190)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5201, -2844)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4173, -512)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2301, 1258)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2598, 3819)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1594, 3867)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1274, 1374)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1964, -1108)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1898, -3680)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-529, -5780)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1962, -6355)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-576, -6729)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2353, -6877)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(168, -6488)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1932, -4710)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4309, -5734)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5877, -3750)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5744, -1158)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4281, 963)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3573, 3385)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4207, 5824)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6444, 7160)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(7147, 4948)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6786, 7237)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4711, 5810)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2240, 5264)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-24, 6356)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2592, 6615)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5051, 5817)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7118, 4306)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7450, 3475)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7329, 5997)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4763, 5921)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2273, 6167)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2544, 3657)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3085, 1120)

	; reverse
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3085, 1120)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2544, 3657)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2273, 6167)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4763, 5921)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7329, 5997)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7450, 3475)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7118, 4306)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5051, 5817)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2592, 6615)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-24, 6356)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2240, 5264)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4711, 5810)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6786, 7237)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(7147, 4948)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6444, 7160)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4207, 5824)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3573, 3385)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4281, 963)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5744, -1158)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5877, -3750)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4309, -5734)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1932, -4710)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(168, -6488)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2353, -6877)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-576, -6729)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1962, -6355)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-529, -5780)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1898, -3680)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1964, -1108)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1274, 1374)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1594, 3867)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2598, 3819)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2301, 1258)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-4173, -512)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5201, -2844)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6363, -5190)
EndFunc
