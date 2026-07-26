#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTheEternalGrove()
	MoveTo(19629.66, 5725.48)
	MoveTo(18761, 2360)
	Move(18400, 2000)
	WaitForLoad()
EndFunc

Func VQTheEternalGrove()
    If GetMapID() <> $TheEternalGrove_Map And GetMapID() <> $TheEternalGrove_Outpost  Then TravelTo($TheEternalGrove_Outpost)   
    If GetMapID() = $TheEternalGrove_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TheEternalGrove_Map Then    

		Local $aWaypoints[42][4] = [ [14380.2 ,-674.562, " ", $vqrange] _
		, [12437.5 ,-1727.91, " ", $vqrange] _
		, [9123.92 ,729.996, " ", $vqrange] _
		, [4736.91 ,5926.64, " ", $vqrange] _
		, [481.706 ,4060.73, " ", $vqrange] _
		, [-4227.9 ,7190.21, " ", $vqrange] _
		, [-666.852 ,9355.51, " ", $vqrange] _
		, [6694.72 ,13251.7, " ", $vqrange] _
		, [4043.05 ,8245.06, " ", $vqrange] _
		, [-6433.92 ,7347.38, " ", $vqrange] _
		, [-5590.98 ,5023.76, " ", $vqrange] _
		, [-8564.03 ,4743.28, " ", $vqrange] _
		, [-10295.88 ,2547.11, " ", $vqrange] _
		, [-11559.7 ,5709.07, " ", $vqrange] _
		, [-12625.2 ,5400.72, " ", $vqrange] _
		, [-14734.1 ,6554.66, " ", $vqrange] _
		, [-14244.2 ,10454.8, " ", $vqrange] _
		, [-18444 ,7943.79, " ", $vqrange] _
		, [-18678.9 ,903.827, " ", $vqrange] _
		, [-21752.6 ,2728.14, " ", $vqrange] _
		, [-18540.7 ,-865.82, " ", $vqrange] _
		, [-14451.5 ,-2656.05, " ", $vqrange] _
		, [-12513.4 ,-3655.56, " ", $vqrange] _
		, [-13045.5 ,1118.3, " ", $vqrange] _
		, [-9326.44 ,-2388.4, " ", $vqrange] _
		, [-8431.99 ,-4342.06, " ", $vqrange] _
		, [-4769.11 ,-3564.89, " ", $vqrange] _
		, [-6334.89 ,2809.35, " ", $vqrange] _
		, [-3708.65 ,-3428.09, " ", $vqrange] _
		, [-2289.25 ,-2768.47, " ", $vqrange] _
		, [-1106.36 ,-1834.79, " ", $vqrange] _
		, [1705.19 ,-2907.84, " ", $vqrange] _
		, [3616.41 ,-2523.71, " ", $vqrange] _
		, [3300.95 ,181.991, " ", $vqrange] _
		, [2536.94 ,1598.65, " ", $vqrange] _
		, [5022.31 ,-5489.66, " ", $vqrange] _
		, [7467.85 ,-3996.19, " ", $vqrange] _
		, [10458.1 ,-7461.93, " ", $vqrange] _
		, [9199.96 ,-2569.42, " ", $vqrange] _
		, [16640.2 ,-2953.63, " ", $vqrange] _
		, [20062.1 ,-4508.37, " ", $vqrange] _
		, [20392.4 ,-2128.2, " ", $vqrange] ]
		
		GoNearestNPCToCoords(14859.7 ,1397.25)
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