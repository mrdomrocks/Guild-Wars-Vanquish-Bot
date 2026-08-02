Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFactions_KainengCity_ShadowsPassageRoute01[12][2] = [ _
        [3396, 16639], _
        [2094, 18885], _
        [61, 18889], _
        [-682, 13737], _
        [-3699, 14519], _
        [-4255, 16101], _
        [-4255, 16101], _
        [-3699, 14519], _
        [-682, 13737], _
        [61, 18889], _
        [2094, 18885], _
        [3396, 16639] _
]

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

		
		_Vanquisher_RunVanquishRoute($aFactions_KainengCity_ShadowsPassageRoute01)
        
    EndIf
EndFunc

