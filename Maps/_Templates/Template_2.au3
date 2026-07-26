#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func VQFerndale()
	If GetMapID() = $Ferndale_Map Then    

		Local $aWaypoints[-][4] = [ [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] _
		, [, " ", $vqrange] ]
		

	GoNearestNPCToCoords(-12909, 15616)
	If GetKurzickFaction() > GetLuxonFaction() Then
                Dialog(0x81)
                Sleep(1000)
                Dialog(0x2)
                Sleep(1000)
                Dialog(0x84)
	        Sleep(1000)
	        Dialog(0x86)
	        Sleep(1000)
        Else
                Dialog(0x85)
                Sleep(1000)
                Dialog(0x86)
                Sleep(1000)
        EndIf

	MoveandAggroVQ($aWaypoints)
      	MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc