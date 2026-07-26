#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutYatendiCanyons()
	MoveTo(-1846, 920)
	MoveTo(-4616, -1382)
	Move(-4850, -1388)
	WaitForLoad()
EndFunc

Func VQYatendiCanyons()
    If GetMapID() <> $YatendiCanyons_Map And GetMapID() <> $YatendiCanyons_Outpost  Then TravelTo($YatendiCanyons_Outpost)   
    If GetMapID() = $YatendiCanyons_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $YatendiCanyons_Map Then    	

		Local $aWaypointsA[15][4] = [ [20291, 477, " ", $vqrange] _
		, [19922, -396, " ", $vqrange] _
		, [17825, -607, " ", $vqrange] _
		, [16384, -4880, " ", $vqrange] _
		, [18106, -8354, " ", $vqrange] _
		, [19513, -10994, " ", $vqrange] _
		, [17522, -13023, " ", $vqrange] _
		, [16726, -18074, " ", $vqrange] _
		, [16907, -18980, " ", $vqrange] _
		, [15102, -17128, " ", $vqrange] _
		, [11307, -19059, " ", $vqrange] _
		, [7142, -16674, " ", $vqrange] _
		, [8972, -13722, " ", $vqrange] _
		, [9981, -11332, " ", $vqrange] _
		, [11795, -10457, " ", $vqrange] ]

		Local $aWaypointsB[3][4] = [ [13664, -17589, " ", $vqrange] _
		, [6508, -16853, " ", $vqrange] _
		, [605, -16238, " ", $vqrange] ]

		Local $aWaypointsC[5][4] = [ [-2970, -14463, " ", $vqrange] _
		, [-6166, -11651, " ", $vqrange] _
		, [-5954, -8503, " ", $vqrange] _
		, [-8937, -10417, " ", $vqrange] _
		, [-11155, -11101, " ", $vqrange] ]
		
		Local $aWaypointsD[30][4] = [ [-15595, -13564, " ", $vqrange] _
		, [-18466.30, -12050.60, " ", $vqrange] _
		, [-16031, -14150, " ", $vqrange] _
		, [-17012, -17188, " ", $vqrange] _
		, [-17898, -18981, " ", $vqrange] _
		, [-15770, -17227, " ", $vqrange] _
		, [-15320, -19497, " ", $vqrange] _
		, [-13944, -17383, " ", $vqrange] _
		, [-13360, -17791, " ", $vqrange] _
		, [-10510, -20639, " ", $vqrange] _
		, [-8547, -18278, " ", $vqrange] _
		, [-10902, -20161, " ", $vqrange] _
		, [-14155, -16732, " ", $vqrange] _
		, [-15995, -15010, " ", $vqrange] _
		, [-17189, -11735, " ", $vqrange] _
		, [-12755, -12657, " ", $vqrange] _
		, [-10358, -8597, " ", $vqrange] _
		, [-6582, -7868, " ", $vqrange] _
		, [-3020, -7279, " ", $vqrange] _
		, [1802, -5682, " ", $vqrange] _
		, [3191, -4697, " ", $vqrange] _
		, [3815, -2015, " ", $vqrange] _
		, [4234, -851, " ", $vqrange] _
		, [5387, 570, " ", $vqrange] _
		, [7182, 2195, " ", $vqrange] _
		, [8319, 2112, " ", $vqrange] _
		, [7864, 5265, " ", $vqrange] _ 
		, [8005, 7598, " ", $vqrange] _
		, [6743, 9059, " ", $vqrange] _
		, [10224, 9013, " ", $vqrange] ]
		
		Local $aWaypointsE[19][4] = [ [10384, 13095, " ", $vqrange] _
		, [6827, 12399, " ", $vqrange] _
		, [5771, 12851, " ", $vqrange] _
		, [7116, 15469, " ", $vqrange] _
		, [7212, 16543, " ", $vqrange] _
		, [11678, 13738, " ", $vqrange] _
		, [12679, 16394, " ", $vqrange] _
		, [9762, 17903, " ", $vqrange] _
		, [16135, 19529, " ", $vqrange] _
		, [11313, 16440, " ", $vqrange] _
		, [7856, 11848, " ", $vqrange] _
		, [6949, 9197, " ", $vqrange] _
		, [5311, 6715, " ", $vqrange] _
		, [3825, 5671, " ", $vqrange] _
		, [3249, 5057, " ", $vqrange] _
		, [1640, 3399, " ", $vqrange] _
		, [-1373, -621, " ", $vqrange] _
		, [-1354, -3942, " ", $vqrange] _
		, [1180, -6005, " ", $vqrange] ]
		
		Local $aWaypoints[72][4] = [ [20291, 477, " ", $vqrange] _
		, [19922, -396, " ", $vqrange] _
		, [17825, -607, " ", $vqrange] _
		, [16384, -4880, " ", $vqrange] _
		, [18106, -8354, " ", $vqrange] _
		, [19513, -10994, " ", $vqrange] _
		, [17522, -13023, " ", $vqrange] _
		, [16726, -18074, " ", $vqrange] _
		, [16907, -18980, " ", $vqrange] _
		, [15102, -17128, " ", $vqrange] _
		, [11307, -19059, " ", $vqrange] _
		, [7142, -16674, " ", $vqrange] _
		, [8972, -13722, " ", $vqrange] _
		, [9981, -11332, " ", $vqrange] _
		, [11795, -10457, " ", $vqrange] _
		, [13664, -17589, " ", $vqrange] _
		, [6508, -16853, " ", $vqrange] _
		, [605, -16238, " ", $vqrange] _
		, [-2970, -14463, " ", $vqrange] _
		, [-6166, -11651, " ", $vqrange] _
		, [-5954, -8503, " ", $vqrange] _
		, [-8937, -10417, " ", $vqrange] _
		, [-11155, -11101, " ", $vqrange] _
		, [-15595, -13564, " ", $vqrange] _
		, [-18466, -12050, " ", $vqrange] _
		, [-16031, -14150, " ", $vqrange] _
		, [-17012, -17188, " ", $vqrange] _
		, [-17898, -18981, " ", $vqrange] _
		, [-15770, -17227, " ", $vqrange] _
		, [-15320, -19497, " ", $vqrange] _
		, [-13944, -17383, " ", $vqrange] _
		, [-13360, -17791, " ", $vqrange] _
		, [-10510, -20639, " ", $vqrange] _
		, [-8547, -18278, " ", $vqrange] _
		, [-10902, -20161, " ", $vqrange] _
		, [-14155, -16732, " ", $vqrange] _
		, [-15995, -15010, " ", $vqrange] _
		, [-17189, -11735, " ", $vqrange] _
		, [-12755, -12657, " ", $vqrange] _
		, [-10358, -8597, " ", $vqrange] _
		, [-6582, -7868, " ", $vqrange] _
		, [-3020, -7279, " ", $vqrange] _
		, [1802, -5682, " ", $vqrange] _
		, [3191, -4697, " ", $vqrange] _
		, [3815, -2015, " ", $vqrange] _
		, [4234, -851, " ", $vqrange] _
		, [5387, 570, " ", $vqrange] _
		, [7182, 2195, " ", $vqrange] _
		, [8319, 2112, " ", $vqrange] _
		, [7864, 5265, " ", $vqrange] _ 
		, [8005, 7598, " ", $vqrange] _
		, [6743, 9059, " ", $vqrange] _
		, [10224, 9013, " ", $vqrange] _
		, [10384, 13095, " ", $vqrange] _
		, [6827, 12399, " ", $vqrange] _
		, [5771, 12851, " ", $vqrange] _
		, [7116, 15469, " ", $vqrange] _
		, [7212, 16543, " ", $vqrange] _
		, [11678, 13738, " ", $vqrange] _
		, [12679, 16394, " ", $vqrange] _
		, [9762, 17903, " ", $vqrange] _
		, [16135, 19529, " ", $vqrange] _
		, [11313, 16440, " ", $vqrange] _
		, [7856, 11848, " ", $vqrange] _
		, [6949, 9197, " ", $vqrange] _
		, [5311, 6715, " ", $vqrange] _
		, [3825, 5671, " ", $vqrange] _
		, [3249, 5057, " ", $vqrange] _
		, [1640, 3399, " ", $vqrange] _
		, [-1373, -621, " ", $vqrange] _
		, [-1354, -3942, " ", $vqrange] _
		, [1180, -6005, " ", $vqrange] ]
	
		GoNearestNPCToCoords(17575, -6019)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(12247, -12688)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-2736, -16359)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-14088, -14200)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		GoNearestNPCToCoords(10624, 9662)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsE)
		
		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc