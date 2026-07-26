#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func VQLionsGate()

	If GetMapID() = $LionsGate_Map Then    

		Local $aWaypoints[1][4] = [ [0, 0, " ", $vqrange] ]			
	
		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

	EndIf
EndFunc