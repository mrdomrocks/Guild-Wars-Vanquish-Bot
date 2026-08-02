Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFactions_ShingJeaIsland_SaoshangTrailRoute01[9][2] = [ _
        [15519, 13409], _
        [14502, 13165], _
        [12763, 12433], _
        [9805, 10947], _
        [8691, 11878], _
        [8329, 12867], _
        [7215, 13842], _
        [6003, 13827], _
        [3584, 10280] _
]

Global $aFactions_ShingJeaIsland_SaoshangTrailRoute02[9][2] = [ _
        [3584, 10280], _
        [6003, 13827], _
        [7215, 13842], _
        [8329, 12867], _
        [8691, 11878], _
        [9805, 10947], _
        [12763, 12433], _
        [14502, 13165], _
        [15519, 13409] _
]

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
 
		
	    _Vanquisher_RunVanquishRoute($aFactions_ShingJeaIsland_SaoshangTrailRoute01)
            _Vanquisher_RunVanquishRoute($aFactions_ShingJeaIsland_SaoshangTrailRoute02)
        
    EndIf
EndFunc
