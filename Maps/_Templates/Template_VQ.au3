;~ #include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

; Example GoOut route authored as a pathfinder-friendly array:
; Func GoOutSAMPLE()
;         Local $aGoOutRoute[3][2] = [ [1000, 2000] _
;                 , [1500, 2500] _
;                 , [1800, 2600] ]
;
;         _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "SAMPLE exit ")
; EndFunc

Func VQSAMPLE()
	If GetMapID() <> $ShadowsPassage_Map And GetMapID() <> $ShadowsPassage_Outpost Then TravelTo($ShadowsPassage_Outpost)
	If GetMapID() = $ShadowsPassage_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
	EndIf

	If GetMapID() = $ShadowsPassage_Map Then

                If GetAreaVanquished() = False Then AggroMoveTo(3396, 16639)
                If GetAreaVanquished() = False Then AggroMoveTo(2094, 18885)
                If GetAreaVanquished() = False Then AggroMoveTo(61, 18889)
                If GetAreaVanquished() = False Then AggroMoveTo(-682, 13737)
                If GetAreaVanquished() = False Then AggroMoveTo(-3699, 14519)
                If GetAreaVanquished() = False Then AggroMoveTo(-4255, 16101)

                ; Reverse pass example:
                If GetAreaVanquished() = False Then AggroMoveTo(-4255, 16101)
                If GetAreaVanquished() = False Then AggroMoveTo(-3699, 14519)
                If GetAreaVanquished() = False Then AggroMoveTo(-682, 13737)
                If GetAreaVanquished() = False Then AggroMoveTo(61, 18889)
                If GetAreaVanquished() = False Then AggroMoveTo(2094, 18885)
                If GetAreaVanquished() = False Then AggroMoveTo(3396, 16639)

	EndIf
EndFunc
