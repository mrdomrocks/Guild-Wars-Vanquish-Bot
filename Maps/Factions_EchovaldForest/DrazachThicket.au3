#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutDrazachThicket()
	MoveTo(-4557, 13723)
	Move(-6300, 14400)
	Sleep(10000)
	WaitForLoad()
EndFunc

Func VQDrazachThicket()
    If GetMapID() <> $DrazachThicket_Map And GetMapID() <> $DrazachThicket_Outpost  Then TravelTo($DrazachThicket_Outpost)   
    If GetMapID() = $DrazachThicket_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $DrazachThicket_Map Then    

		Local $aWaypoints[68][4] = [ [-6506, -16099, " ", $vqrange] _
		, [-8581, -15354, " ", $vqrange] _
		, [-8627, -13151, " ", $vqrange] _
		, [-6683, -12115, " ", $vqrange] _
		, [-7474, -10044, " ", $vqrange] _
		, [-6021, -8358, " ", $vqrange] _
		, [-5184, -6307, " ", $vqrange] _
		, [-4643, -5336, " ", $vqrange] _
		, [-7368, -6043, " ", $vqrange] _
		, [-9514, -6539, " ", $vqrange] _
		, [-10988, -8177, " ", $vqrange] _
		, [-11388, -7827, " ", $vqrange] _
		, [-11291, -5987, " ", $vqrange] _
		, [-11380, -3787, " ", $vqrange] _
		, [-10641, -1714, " ", $vqrange] _
		, [-7019.81, -976.18, " ", $vqrange] _
		, [-4464.77, 780.87, " ", $vqrange] _
		, [-7019.81, -976.18, " ", $vqrange] _
		, [-10575, 489, " ", $vqrange] _
		, [-11266, 2581, " ", $vqrange] _
		, [-10444, 4234, " ", $vqrange] _
		, [-12820, 4153, " ", $vqrange] _
		, [-12804, 6357, " ", $vqrange] _
		, [-12074, 8448, " ", $vqrange] _
		, [-3750.24, 10567.87, " ", $vqrange] _
		, [-7757.90, 10564.94, " ", $vqrange] _
		, [637.81, 11362.58, " ", $vqrange] _
		, [4102, 12772, " ", $vqrange] _
		, [637.81, 11362.58, " ", $vqrange] _
		, [-7757.90, 10564.94, " ", $vqrange] _
		, [-5963, 8337, " ", $vqrange] _
		, [-5085, 5948, " ", $vqrange] _
		, [-11289, 10505, " ", $vqrange] _
		, [-9193, 11175, " ", $vqrange] _
		, [-7310, 10021, " ", $vqrange] _
		, [-5196, 10638, " ", $vqrange] _
		, [-4567, 12753, " ", $vqrange] _
		, [-5154, 14878, " ", $vqrange] _
		, [-3280, 16044, " ", $vqrange] _
		, [-1272, 15113, " ", $vqrange] _
		, [930, 15165, " ", $vqrange] _
		, [3106, 14786, " ", $vqrange] _
		, [5094, 13825, " ", $vqrange] _
		, [7308, 13779, " ", $vqrange] _
		, [8654, 12037, " ", $vqrange] _
		, [8235, 9874, " ", $vqrange] _
		, [7513, 7790, " ", $vqrange] _
		, [7774, 5603, " ", $vqrange] _
		, [9917, 5008, " ", $vqrange] _
		, [11983, 5810, " ", $vqrange] _
		, [10193, 4527, " ", $vqrange] _
		, [10244, 2324, " ", $vqrange] _
		, [10734, 174, " ", $vqrange] _
		, [8531, 263, " ", $vqrange] _
		, [6324, 132, " ", $vqrange] _
		, [5427, -1890, " ", $vqrange] _
		, [4553, -3915, " ", $vqrange] _
		, [3930, -6028, " ", $vqrange] _
		, [3094, -8066, " ", $vqrange] _
		, [1736, -6672, " ", $vqrange] _
		, [235, -5024, " ", $vqrange] _
		, [985, -8475, " ", $vqrange] _
		, [-2131, -3371, " ", $vqrange] _
		, [-3055, 1867, " ", $vqrange] _
		, [-2427, 5392, " ", $vqrange] _
		, [-905, 8625, " ", $vqrange] _
		, [3174, 10834, " ", $vqrange] _
		, [4105, 9296, " ", $vqrange] ]

		GoNearestNPCToCoords(-5592, -16263)
	If GetLuxonFaction() > GetKurzickFaction() Then
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