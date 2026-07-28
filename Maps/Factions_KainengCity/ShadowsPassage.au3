Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutShadowsPassage()
        Local $aGoOutRoute[3][2] = [ [-12290, 7648] _
                , [-12193, 8409] _
                , [-12182, 8800] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "ShadowsPassage exit ")
EndFunc

Func VQShadowsPassage()
    If GetMapID() <> $ShadowsPassage_Map And GetMapID() <> $ShadowsPassage_Outpost  Then TravelTo($ShadowsPassage_Outpost)   
    If GetMapID() = $ShadowsPassage_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ShadowsPassage_Map Then    

		
		If GetAreaVanquished() = False Then AggroMoveTo(3396, 16639)
		If GetAreaVanquished() = False Then AggroMoveTo(2094, 18885)
		If GetAreaVanquished() = False Then AggroMoveTo(61, 18889)
		If GetAreaVanquished() = False Then AggroMoveTo(-682, 13737)
		If GetAreaVanquished() = False Then AggroMoveTo(-3699, 14519)
		If GetAreaVanquished() = False Then AggroMoveTo(-4255, 16101)
		If GetAreaVanquished() = False Then AggroMoveTo(-4255, 16101)
		If GetAreaVanquished() = False Then AggroMoveTo(-3699, 14519)
		If GetAreaVanquished() = False Then AggroMoveTo(-682, 13737)
		If GetAreaVanquished() = False Then AggroMoveTo(61, 18889)
		If GetAreaVanquished() = False Then AggroMoveTo(2094, 18885)
		If GetAreaVanquished() = False Then AggroMoveTo(3396, 16639)
        
    EndIf
EndFunc

