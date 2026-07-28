Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSaoshangTrail()
        Local $aGoOutRoute[2][2] = [ [16589, 13096] _
                , [16200, 13500] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "SaoshangTrail exit ")
EndFunc

Func VQSaoshangTrail()
    If GetMapID() <> $SaoshangTrail_Map And GetMapID() <> $SaoshangTrail_Outpost  Then TravelTo($SaoshangTrail_Outpost)   
    If GetMapID() = $SaoshangTrail_Outpost then
       GoOut() 
      
    EndIf

	 If GetMapID() = $SaoshangTrail_Map Then   
 
		
	    If GetAreaVanquished() = False Then AggroMoveTo(15519, 13409)
	    If GetAreaVanquished() = False Then AggroMoveTo(14502, 13165)
	    If GetAreaVanquished() = False Then AggroMoveTo(12763, 12433)
	    If GetAreaVanquished() = False Then AggroMoveTo(9805, 10947)
	    If GetAreaVanquished() = False Then AggroMoveTo(8691, 11878)
	    If GetAreaVanquished() = False Then AggroMoveTo(8329, 12867)
	    If GetAreaVanquished() = False Then AggroMoveTo(7215, 13842)
	    If GetAreaVanquished() = False Then AggroMoveTo(6003, 13827)
	    If GetAreaVanquished() = False Then AggroMoveTo(3584, 10280)
	    Reverse($aWaypoints)
        
    EndIf
EndFunc

