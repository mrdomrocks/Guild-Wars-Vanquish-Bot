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


	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5785, 1558)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2684, 2006)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5544, -1613)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3428, -5729)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(373, -3274)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3156, -2098)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1639, 751)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(621, -735)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2040, 2078)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(240, 5077)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4885, 5096)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5939, 1126)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3321, -3531)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(7394, -6932)

	; reverse
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(7394, -6932)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3321, -3531)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5939, 1126)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(4885, 5096)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(240, 5077)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(2040, 2078)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(621, -735)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1639, 751)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3156, -2098)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(373, -3274)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3428, -5729)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5544, -1613)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2684, 2006)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5785, 1558)
EndFunc
