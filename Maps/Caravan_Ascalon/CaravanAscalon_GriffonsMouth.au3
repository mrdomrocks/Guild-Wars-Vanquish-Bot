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


	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2913, -7105)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-570, -6574)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1535, -4368)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3009, -6002)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5547, -3291)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6196, -356)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5998, -3834)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5162, -7264)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6002, -3706)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3041, -6006)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1692, -3331)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(762, -1374)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2270, -1127)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1849, -4314)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2464, -1537)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5098, -977)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7529, 905)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6410, 3478)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3518, 5166)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2345, 4080)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1349, 2834)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1156, 3651)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-367, 6241)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-961, 8115)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3406, 6831)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1159, 8115)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(597, 6595)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3032, 8331)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6586, 5423)

	; reverse
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6586, 5423)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3032, 8331)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(597, 6595)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1159, 8115)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3406, 6831)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-961, 8115)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-367, 6241)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1156, 3651)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1349, 2834)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2345, 4080)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-3518, 5166)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-6410, 3478)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-7529, 905)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-5098, -977)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2464, -1537)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-1849, -4314)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2270, -1127)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(762, -1374)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1692, -3331)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3041, -6006)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6002, -3706)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5162, -7264)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5998, -3834)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(6196, -356)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(5547, -3291)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(3009, -6002)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(1535, -4368)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-570, -6574)
	If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo(-2913, -7105)
EndFunc

