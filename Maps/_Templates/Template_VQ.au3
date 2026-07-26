;~ #include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func VQSAMPLE()
	If GetMapID() <> $ShadowsPassage_Map And GetMapID() <> $ShadowsPassage_Outpost Then TravelTo($ShadowsPassage_Outpost)
	If GetMapID() = $ShadowsPassage_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
	EndIf

	If GetMapID() = $ShadowsPassage_Map Then

		Local $aWaypoints[6][4] = [ [3396, 16639, " ", $vqrange] _
		, [2094, 18885, " ", $vqrange] _
		, [61, 18889, " ", $vqrange] _
		, [-682, 13737, " ", $vqrange] _
		, [-3699, 14519, " ", $vqrange] _
		, [-4255, 16101, " ", $vqrange] ]

		; Forward + reverse: use MoveandAggroVQFullRoute (stops/resigns on 0 remaining).
		MoveandAggroVQFullRoute($aWaypoints)

		; Forward only: MoveandAggroVQ($aWaypoints)
		; Multiple segments: call MoveandAggroVQ($aWaypointsA) then B, etc. — each segment checks abort automatically.
		; Manual waypoints: AggroMoveTo() — also checks complete/abort at entry and during Fight.

	EndIf
EndFunc
