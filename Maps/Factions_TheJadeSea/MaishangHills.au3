#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMaishangHills()
	MoveTo(1059, 23549)
	MoveTo(2750, 24727)
	Move(4300, 25800)
	Sleep(3000)
	WaitForLoad()
EndFunc

Func VQMaishangHills()
    If GetMapID() <> $MaishangHills_Map And GetMapID() <> $MaishangHills_Outpost  Then TravelTo($MaishangHills_Outpost)   
    If GetMapID() = $MaishangHills_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $MaishangHills_Map Then    

		Local $aWaypoints[80][4] = [ [16423, -10318, " ", $vqrange] _
		, [19047, -12390, " ", $vqrange] _
		, [21315, -12774, " ", $vqrange] _
		, [18043, -10677, " ", $vqrange] _
		, [17701, -7081, " ", $vqrange] _
		, [19805, -3334, " ", $vqrange] _
		, [19234, -1539, " ", $vqrange] _
		, [17767, -548, " ", $vqrange] _
		, [19742, 3713, " ", $vqrange] _
		, [19589, 7580, " ", $vqrange] _
		, [19891, 9327, " ", $vqrange] _
		, [17256, 10181, " ", $vqrange] _
		, [14057, 9514, " ", $vqrange] _
		, [12606, 8973, " ", $vqrange] _
		, [9742, 8285, " ", $vqrange] _
		, [6705, 9111, " ", $vqrange] _
		, [3108, 10104, " ", $vqrange] _
		, [2244, 10368, " ", $vqrange] _
		, [871, 10550, " ", $vqrange] _
		, [-178, 9128, " ", $vqrange] _
		, [-1290, 5887, " ", $vqrange] _
		, [-3178, 3358, " ", $vqrange] _
		, [-4941, 344, " ", $vqrange] _
		, [-5913, 4457, " ", $vqrange] _
		, [-7895, 5291, " ", $vqrange] _
		, [-11081, 3447, " ", $vqrange] _
		, [-8502, 1646, " ", $vqrange] _
		, [-5800, -364, " ", $vqrange] _
		, [-7624, -2495, " ", $vqrange] _
		, [-9540, -2552, " ", $vqrange] _
		, [-9235, -153, " ", $vqrange] _
		, [-8702, 2353, " ", $vqrange] _
		, [-11381, 3189, " ", $vqrange] _
		, [-13091, -947, " ", $vqrange] _
		, [-12884, -2407, " ", $vqrange] _
		, [-17021, 476, " ", $vqrange] _
		, [-18874, -2605, " ", $vqrange] _
		, [-19362, -6075, " ", $vqrange] _
		, [-15988, -8006, " ", $vqrange] _
		, [-19362, -6075, " ", $vqrange] _
		, [-20079, -840, " ", $vqrange] _
		, [-19775, 2653, " ", $vqrange] _
		, [-18651, 3519, " ", $vqrange] _
		, [-18433, 4838, " ", $vqrange] _
		, [-19177, 5539, " ", $vqrange] _
		, [-19227, 8810, " ", $vqrange] _
		, [-16845, 10804, " ", $vqrange] _
		, [-13004, 11923, " ", $vqrange] _
		, [-11368, 11297, " ", $vqrange] _
		, [-8531, 11174, " ", $vqrange] _
		, [-8959, 8901, " ", $vqrange] _
		, [-11400, 7242, " ", $vqrange] _
		, [-8959, 8901, " ", $vqrange] _
		, [-6546, 10303, " ", $vqrange] _
		, [-3964, 8953, " ", $vqrange] _
		, [-2516, 7003, " ", $vqrange] _
		, [-585, 3255, " ", $vqrange] _
		, [-2288, 747, " ", $vqrange] _
		, [-2345, -1390, " ", $vqrange] _
		, [309, -2979, " ", $vqrange] _
		, [3237, -4095, " ", $vqrange] _
		, [4159, -6681, " ", $vqrange] _
		, [1187, -7498, " ", $vqrange] _
		, [1159, -8593, " ", $vqrange] _
		, [2828, -9741, " ", $vqrange] _
		, [5172, -10477, " ", $vqrange] _
		, [8188, -7645, " ", $vqrange] _
		, [11798, -9060, " ", $vqrange] _
		, [8188, -7645, " ", $vqrange] _
		, [8538, -4986, " ", $vqrange] _
		, [10597, -4203, " ", $vqrange] _
		, [12353, -3619, " ", $vqrange] _
		, [12598, 233, " ", $vqrange] _
		, [13416, 1560, " ", $vqrange] _
		, [11702, -1599, " ", $vqrange] _
		, [8588, 224, " ", $vqrange] _
		, [9850, 2893, " ", $vqrange] _
		, [8588, 224, " ", $vqrange] _
		, [5731, 692, " ", $vqrange] _
		, [4964, 4379, " ", $vqrange] ]
		
		GoNearestNPCToCoords(14087, -10651)
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