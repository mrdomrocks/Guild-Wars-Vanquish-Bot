#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSaoshangTrail()
	MoveTo(16589, 13096)
	Move(16200, 13500)
	WaitForLoad()
EndFunc

Func VQSaoshangTrail()
    If GetMapID() <> $SaoshangTrail_Map And GetMapID() <> $SaoshangTrail_Outpost  Then TravelTo($SaoshangTrail_Outpost)   
    If GetMapID() = $SaoshangTrail_Outpost then
       GoOut() 
      
    EndIf

	 If GetMapID() = $SaoshangTrail_Map Then   
 
	    Local $aWaypoints[9][4] = [ [15519, 13409, " ", $vqrange] _			
            , [14502, 13165, " ", $vqrange] _
            , [12763, 12433, " ", $vqrange] _
            , [9805, 10947, " ", $vqrange] _
            , [8691, 11878, " ", $vqrange] _
            , [8329, 12867, " ", $vqrange] _
            , [7215, 13842, " ", $vqrange] _
            , [6003, 13827, " ", $vqrange] _
            , [3584, 10280, " ", $vqrange] ]
		
	    MoveandAggroVQ($aWaypoints)
	    Reverse($aWaypoints)
        
    EndIf
EndFunc

