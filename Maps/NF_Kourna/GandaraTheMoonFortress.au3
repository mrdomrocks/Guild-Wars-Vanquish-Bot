#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutGandaraTheMoonFortress()
	MoveTo(3860, -1719)
	MoveTo(2706, -4708)
	Move(2580, -4950)
	WaitForLoad()
EndFunc

Func VQGandaraTheMoonFortress()
    If GetMapID() <> $GandaraTheMoonFortress_Map And GetMapID() <> $GandaraTheMoonFortress_Outpost  Then TravelTo($GandaraTheMoonFortress_Outpost)   
    If GetMapID() = $GandaraTheMoonFortress_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $GandaraTheMoonFortress_Map Then    
		
		Local $aWaypointsA[7][4] = [ [5425, 16446, " ", $vqrange] _
		, [3246, 13158, " ", $vqrange] _
		, [-2989, 14295, " ", $vqrange] _
		, [-4304, 11465, " ", $vqrange] _
		, [-1938, 11165, " ", $vqrange] _
		, [-2396, 14301, " ", $vqrange] _
		, [-6098, 15735, " ", $vqrange] ]

		Local $aWaypointsB[36][4] = [ [-10125, 14233, " ", $vqrange] _		
		, [-10210, 9811, " ", $vqrange] _
		, [-12946, 12759, " ", $vqrange] _
		, [-18180, 12670, " ", $vqrange] _
		, [-23168, 14844, " ", $vqrange] _
		, [-25047, 14113, " ", $vqrange] _
		, [-23478, 10876, " ", $vqrange] _
		, [-24154, 8734, " ", $vqrange] _
		, [-23050, 4721, " ", $vqrange] _
		, [-24672, 3577, " ", $vqrange] _		
		, [-24585, 3991, " ", $vqrange] _
		, [-19619, 5662, " ", $vqrange] _		
		, [-22286, 9017, " ", $vqrange] _
		, [-21070, 10317, " ", $vqrange] _
		, [-18532, 12319, " ", $vqrange] _
		, [-19967, 8553, " ", $vqrange] _
		, [-15516, 9981, " ", $vqrange] _
		, [-12782, 12508, " ", $vqrange] _
		, [-11391, 10947, " ", $vqrange] _
		, [-10171, 9954, " ", $vqrange] _
		, [-10155, 12817, " ", $vqrange] _
		, [-5469, 12312, " ", $vqrange] _
		, [-2614, 14338, " ", $vqrange] _
		, [3843, 12063, " ", $vqrange] _
		, [6063, 10744, " ", $vqrange] _
		, [9786, 11064, " ", $vqrange] _
		, [11645, 10250, " ", $vqrange] _
		, [12199, 7117, " ", $vqrange] _
		, [15633, 9747, " ", $vqrange] _
		, [14905, 13634, " ", $vqrange] _
		, [19445, 9837, " ", $vqrange] _
		, [22045, 9376, " ", $vqrange] _
		, [21646, 6598, " ", $vqrange] _
		, [22185, 4098, " ", $vqrange] _
		, [21294, 3045, " ", $vqrange] _
		, [18447, 6224, " ", $vqrange] ]

		Local $aWaypoints[43][4] = [ [5425, 16446, " ", $vqrange] _
		, [3246, 13158, " ", $vqrange] _
		, [-2989, 14295, " ", $vqrange] _
		, [-4304, 11465, " ", $vqrange] _
		, [-1938, 11165, " ", $vqrange] _
		, [-2396, 14301, " ", $vqrange] _
		, [-6098, 15735, " ", $vqrange] _
		, [-10125, 14233, " ", $vqrange] _		
		, [-10210, 9811, " ", $vqrange] _
		, [-12946, 12759, " ", $vqrange] _
		, [-18180, 12670, " ", $vqrange] _
		, [-23168, 14844, " ", $vqrange] _
		, [-25047, 14113, " ", $vqrange] _
		, [-23478, 10876, " ", $vqrange] _
		, [-24154, 8734, " ", $vqrange] _
		, [-23050, 4721, " ", $vqrange] _
		, [-24672, 3577, " ", $vqrange] _
		, [-24585, 3991, " ", $vqrange] _
		, [-19619, 5662, " ", $vqrange] _
		, [-22286, 9017, " ", $vqrange] _
		, [-21070, 10317, " ", $vqrange] _
		, [-18532, 12319, " ", $vqrange] _
		, [-19967, 8553, " ", $vqrange] _
		, [-15516, 9981, " ", $vqrange] _
		, [-12782, 12508, " ", $vqrange] _
		, [-11391, 10947, " ", $vqrange] _
		, [-10171, 9954, " ", $vqrange] _
		, [-10155, 12817, " ", $vqrange] _
		, [-5469, 12312, " ", $vqrange] _
		, [-2614, 14338, " ", $vqrange] _
		, [3843, 12063, " ", $vqrange] _
		, [6063, 10744, " ", $vqrange] _
		, [9786, 11064, " ", $vqrange] _
		, [11645, 10250, " ", $vqrange] _
		, [12199, 7117, " ", $vqrange] _
		, [15633, 9747, " ", $vqrange] _
		, [14905, 13634, " ", $vqrange] _
		, [19445, 9837, " ", $vqrange] _
		, [22045, 9376, " ", $vqrange] _
		, [21646, 6598, " ", $vqrange] _
		, [22185, 4098, " ", $vqrange] _
		, [21294, 3045, " ", $vqrange] _
		, [18447, 6224, " ", $vqrange] ]	
				
		GoNearestNPCToCoords(6818, 15641)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-7412, 14230)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc