#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutGyalaHatchery()
	MoveTo(9177, -20845)
	Move(8500, -19800)
	WaitForLoad()
EndFunc

Func VQGyalaHatchery()
    If GetMapID() <> $GyalaHatchery_Map And GetMapID() <> $GyalaHatchery_Outpost  Then TravelTo($GyalaHatchery_Outpost)   
    If GetMapID() = $GyalaHatchery_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $GyalaHatchery_Map Then    

		Local $aWaypoints[58][4] = [ [3085.43 ,-15456, " ", $vqrange] _
		, [2880.97 ,-13319.3, " ", $vqrange] _
		, [3886.61 ,-10794, " ", $vqrange] _
		, [-52.6217 ,-9179.12, " ", $vqrange] _
		, [-1135.94 ,-8340.42, " ", $vqrange] _
		, [-3537.51 ,-9243.83, " ", $vqrange] _
		, [-3539.43 ,-10776.1, " ", $vqrange] _
		, [-4686 ,-7623, " ", $vqrange] _
		, [-4750 ,-6936, " ", $vqrange] _
		, [-2580.99 ,-15136.2, " ", $vqrange] _
		, [-5491.64 ,-17373.7, " ", $vqrange] _
		, [-9059.35 ,-14934.9, " ", $vqrange] _
		, [-7896.18 ,-11049.2, " ", $vqrange] _
		, [-5493 ,-2840, " ", $vqrange] _
		, [-8275.25 ,-8690.17, " ", $vqrange] _
		, [-6796.9 ,-4583.78, " ", $vqrange] _
		, [-5054.95 ,-4636.02, " ", $vqrange] _
		, [-6105.98 ,138.561, " ", $vqrange] _
		, [-6294.62 ,5178.32, " ", $vqrange] _
		, [-4634.23 ,4549.27, " ", $vqrange] _
		, [-3669.69 ,6435.47, " ", $vqrange] _
		, [-6932.82 ,12872.4, " ", $vqrange] _
		, [-7181.86 ,17128.9, " ", $vqrange] _
		, [-5858.91 ,19882.9, " ", $vqrange] _
		, [-1617.8 ,18377.1, " ", $vqrange] _
		, [2565.4 ,16307.9, " ", $vqrange] _
		, [6520.48 ,15346.6, " ", $vqrange] _
		, [10035.8 ,14378.4, " ", $vqrange] _
		, [11187.7 ,11856.6, " ", $vqrange] _
		, [6735.72 ,11952.6, " ", $vqrange] _
		, [6655.47 ,14121.2, " ", $vqrange] _
		, [7482.45 ,8252.18, " ", $vqrange] _
		, [12725 ,4772.39, " ", $vqrange] _
		, [10829.9 ,-240.676, " ", $vqrange] _
		, [12635.9 ,-2027.79, " ", $vqrange] _
		, [13589.1 ,-6837.43, " ", $vqrange] _
		, [9461.89 ,-11494.2, " ", $vqrange] _
		, [9576.91 ,-15174.3, " ", $vqrange] _
		, [9904.58 ,-13505.3, " ", $vqrange] _
		, [8233.15 ,-9668.27, " ", $vqrange] _
		, [3572.23 ,-9481.15, " ", $vqrange] _
		, [7010.72 ,-4086.76, " ", $vqrange] _
		, [5588.83 ,-669.14, " ", $vqrange] _
		, [5213.34 ,2425.37, " ", $vqrange] _
		, [2014.77 ,-3142.78, " ", $vqrange] _
		, [-3594.64 ,-3274.69, " ", $vqrange] _
		, [-3222.86 ,439.009, " ", $vqrange] _
		, [-1240.39 ,2811.2, " ", $vqrange] _
		, [-261.604 ,6552.17, " ", $vqrange] _
		, [-5.64007 ,9504.82, " ", $vqrange] _
		, [1267.68 ,13794.9, " ", $vqrange] _
		, [-3329.79 ,13035.8, " ", $vqrange] _
		, [-2082.19 ,14238.1, " ", $vqrange] _
		, [-1551.84, 14006.58, " ", $vqrange] _
		, [-3005 ,10716, " ", $vqrange] _
		, [1461 ,8535, " ", $vqrange] _
		, [-2966 ,8347, " ", $vqrange] _
		, [-2966 ,10490, " ", $vqrange] ]

		GoNearestNPCToCoords(7678.76 ,-19251.5)
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