Func GoOutCaravanMaguuma_ReedBog()
        _Vanquisher_RunDynamicCaravanGoOut($ReedBog_Map, "ReedBog")
EndFunc

Func VQCaravanMaguuma_ReedBog()
        If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
                If GetMapID() <> $ReedBog_Map Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_ReedBog()
                        If GetMapID() <> $ReedBog_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need ReedBog (" & $ReedBog_Map & ").")
                                Return
                        EndIf
                EndIf
        Else
                If GetMapID() <> $ReedBog_Map And GetMapID() <> $ReedBog_Outpost And GetMapID() <> $ReedBog_Transit Then
                        _Vanquisher_ResetGoOutRouteProgress()
                        CurrentAction("Traveling to outpost for ReedBog.")
                        TravelTo($ReedBog_Outpost)
                EndIf

                If GetMapID() = $ReedBog_Outpost Or GetMapID() = $ReedBog_Transit Then
                        _Vanquisher_ApplyDifficulty()
                        GoOutCaravanMaguuma_ReedBog()
                        If GetMapID() <> $ReedBog_Map Then
                                CurrentAction("Routing - on map " & GetMapID() & ", need ReedBog (" & $ReedBog_Map & ").")
                                Return
                        EndIf
                EndIf
        EndIf

	If GetMapID() <> $ReedBog_Map Then
		CurrentAction("ReedBog route waiting - on map " & GetMapID() & ", need " & $ReedBog_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ReedBog vanquish route.")


	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(7164, 7081)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4803, 4633)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-485, 7205)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2694, 6082)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5773, 5901)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-8670, 3619)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-8526, 70)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7871, -440)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7013, 2110)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5338, 3510)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2332, 4959)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2731, 3112)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5954, 939)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2948, 1881)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5198, -476)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7334, -1604)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-8794, -2909)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7825, -5029)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7658, -6698)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2670, -6828)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1613, -9109)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-333, -8646)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(186, -5512)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2727, -4362)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5507, -4939)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5456, -1279)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5874, 2961)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6662, 4422)

	; reverse
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6662, 4422)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5874, 2961)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5456, -1279)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5507, -4939)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2727, -4362)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(186, -5512)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-333, -8646)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1613, -9109)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2670, -6828)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7658, -6698)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7825, -5029)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-8794, -2909)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7334, -1604)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5198, -476)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2948, 1881)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5954, 939)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2731, 3112)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2332, 4959)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5338, 3510)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7013, 2110)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7871, -440)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-8526, 70)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-8670, 3619)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5773, 5901)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2694, 6082)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-485, 7205)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4803, 4633)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(7164, 7081)
EndFunc
