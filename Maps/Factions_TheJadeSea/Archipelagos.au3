#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutArchipelagos()
	MoveTo(5419, -4307)
	MoveTo(5916, -6569)
	Move(6650, -7500)
	WaitForLoad()
EndFunc

Func VQArchipelagos()
    If GetMapID() <> $Archipelagos_Map And GetMapID() <> $Archipelagos_Outpost  Then TravelTo($Archipelagos_Outpost)   
    If GetMapID() = $Archipelagos_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $Archipelagos_Map Then    

		Local $aWaypoints[51][4] = [ [8197.62 ,9297.92, " ", $vqrange] _
		, [9222.12 ,7973.71, " ", $vqrange] _
		, [13341 ,7105.67, " ", $vqrange] _
		, [15144 ,3157.91, " ", $vqrange] _
		, [13540 ,2676.19, " ", $vqrange] _
		, [13757.2 ,-755.13, " ", $vqrange] _
		, [10797.3 ,54.79, " ", $vqrange] _
		, [8723.12 ,-954.48, " ", $vqrange] _
		, [7975.3 ,-4567.31, " ", $vqrange] _
		, [12155.7 ,-4612.38, " ", $vqrange] _
		, [11879.4 ,-6211.21, " ", $vqrange] _
		, [15285.6 ,-6784.58, " ", $vqrange] _
		, [16631.8 ,-7428.99, " ", $vqrange] _
		, [13834.3 ,-6348.62, " ", $vqrange] _
		, [9109.71 ,-5212.96, " ", $vqrange] _
		, [6835.79 ,-5260.21, " ", $vqrange] _
		, [6320.1 ,-9489.52, " ", $vqrange] _
		, [2073.65 ,-10355.9, " ", $vqrange] _
		, [611.872 ,-9800.2, " ", $vqrange] _
		, [875.048 ,-5452.94, " ", $vqrange] _
		, [1155.08 ,-3153.91, " ", $vqrange] _
		, [3232.6 ,-1739.11, " ", $vqrange] _
		, [2581.55 ,1223.37, " ", $vqrange] _
		, [6479.69 ,2810.76, " ", $vqrange] _
		, [6396.28 ,4246.52, " ", $vqrange] _
		, [10007.7 ,4254, " ", $vqrange] _
		, [4674.73 ,5393.84, " ", $vqrange] _
		, [2058.23 ,8470.78, " ", $vqrange] _
		, [-975.356 ,9873.85, " ", $vqrange] _
		, [-4261.81 ,9184.8, " ", $vqrange] _
		, [-6774.32 ,8444.04, " ", $vqrange] _
		, [-10072.6 ,9140.46, " ", $vqrange] _
		, [-12694.8 ,7967.57, " ", $vqrange] _
		, [-16518.5 ,7683.83, " ", $vqrange] _
		, [-16472.8 ,6159.68, " ", $vqrange] _
		, [-16098.2 ,3798.79, " ", $vqrange] _
		, [-15447.8 ,2197.5, " ", $vqrange] _
		, [-13665.3 ,-116.023, " ", $vqrange] _
		, [-11501.7 ,2204.11, " ", $vqrange] _
		, [-6766.35 ,5282.97, " ", $vqrange] _
		, [-3733.23 ,2825.36, " ", $vqrange] _
		, [-1543.9 ,-1258.61, " ", $vqrange] _
		, [1002.17 ,-4032.93, " ", $vqrange] _
		, [599.199 ,-8282.41, " ", $vqrange] _
		, [2676.17 ,-10340.7, " ", $vqrange] _
		, [6155.32 ,-9204.76, " ", $vqrange] _
		, [3970.7 ,-6214.6, " ", $vqrange] _
		, [162.16 ,-5386.09, " ", $vqrange] _
		, [-2451.76 ,-5735.13, " ", $vqrange] _
		, [-6859.77 ,-4873.08, " ", $vqrange] _
		, [-8686.33 ,-5612.6, " ", $vqrange] ]

		GoNearestNPCToCoords(4444.00, 10675.00)
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