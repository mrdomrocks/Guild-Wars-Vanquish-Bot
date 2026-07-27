#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTheEternalGrove()
        Local $aGoOutRoute[3][2] = [ [19629.66, 5725.48] _
                , [18761, 2360] _
                , [18400, 2000] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "TheEternalGrove exit ")
EndFunc

Func VQTheEternalGrove()
    If GetMapID() <> $TheEternalGrove_Map And GetMapID() <> $TheEternalGrove_Outpost  Then TravelTo($TheEternalGrove_Outpost)   
    If GetMapID() = $TheEternalGrove_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TheEternalGrove_Map Then    

		
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

		If GetAreaVanquished() = False Then AggroMoveTo(14380.2, -674.562)
		If GetAreaVanquished() = False Then AggroMoveTo(12437.5, -1727.91)
		If GetAreaVanquished() = False Then AggroMoveTo(9123.92, 729.996)
		If GetAreaVanquished() = False Then AggroMoveTo(4736.91, 5926.64)
		If GetAreaVanquished() = False Then AggroMoveTo(481.706, 4060.73)
		If GetAreaVanquished() = False Then AggroMoveTo(-4227.9, 7190.21)
		If GetAreaVanquished() = False Then AggroMoveTo(-666.852, 9355.51)
		If GetAreaVanquished() = False Then AggroMoveTo(6694.72, 13251.7)
		If GetAreaVanquished() = False Then AggroMoveTo(4043.05, 8245.06)
		If GetAreaVanquished() = False Then AggroMoveTo(-6433.92, 7347.38)
		If GetAreaVanquished() = False Then AggroMoveTo(-5590.98, 5023.76)
		If GetAreaVanquished() = False Then AggroMoveTo(-8564.03, 4743.28)
		If GetAreaVanquished() = False Then AggroMoveTo(-10295.88, 2547.11)
		If GetAreaVanquished() = False Then AggroMoveTo(-11559.7, 5709.07)
		If GetAreaVanquished() = False Then AggroMoveTo(-12625.2, 5400.72)
		If GetAreaVanquished() = False Then AggroMoveTo(-14734.1, 6554.66)
		If GetAreaVanquished() = False Then AggroMoveTo(-14244.2, 10454.8)
		If GetAreaVanquished() = False Then AggroMoveTo(-18444, 7943.79)
		If GetAreaVanquished() = False Then AggroMoveTo(-18678.9, 903.827)
		If GetAreaVanquished() = False Then AggroMoveTo(-21752.6, 2728.14)
		If GetAreaVanquished() = False Then AggroMoveTo(-18540.7, -865.82)
		If GetAreaVanquished() = False Then AggroMoveTo(-14451.5, -2656.05)
		If GetAreaVanquished() = False Then AggroMoveTo(-12513.4, -3655.56)
		If GetAreaVanquished() = False Then AggroMoveTo(-13045.5, 1118.3)
		If GetAreaVanquished() = False Then AggroMoveTo(-9326.44, -2388.4)
		If GetAreaVanquished() = False Then AggroMoveTo(-8431.99, -4342.06)
		If GetAreaVanquished() = False Then AggroMoveTo(-4769.11, -3564.89)
		If GetAreaVanquished() = False Then AggroMoveTo(-6334.89, 2809.35)
		If GetAreaVanquished() = False Then AggroMoveTo(-3708.65, -3428.09)
		If GetAreaVanquished() = False Then AggroMoveTo(-2289.25, -2768.47)
		If GetAreaVanquished() = False Then AggroMoveTo(-1106.36, -1834.79)
		If GetAreaVanquished() = False Then AggroMoveTo(1705.19, -2907.84)
		If GetAreaVanquished() = False Then AggroMoveTo(3616.41, -2523.71)
		If GetAreaVanquished() = False Then AggroMoveTo(3300.95, 181.991)
		If GetAreaVanquished() = False Then AggroMoveTo(2536.94, 1598.65)
		If GetAreaVanquished() = False Then AggroMoveTo(5022.31, -5489.66)
		If GetAreaVanquished() = False Then AggroMoveTo(7467.85, -3996.19)
		If GetAreaVanquished() = False Then AggroMoveTo(10458.1, -7461.93)
		If GetAreaVanquished() = False Then AggroMoveTo(9199.96, -2569.42)
		If GetAreaVanquished() = False Then AggroMoveTo(16640.2, -2953.63)
		If GetAreaVanquished() = False Then AggroMoveTo(20062.1, -4508.37)
		If GetAreaVanquished() = False Then AggroMoveTo(20392.4, -2128.2)
      		If GetAreaVanquished() = False Then AggroMoveTo(20392.4, -2128.2)
      		If GetAreaVanquished() = False Then AggroMoveTo(20062.1, -4508.37)
      		If GetAreaVanquished() = False Then AggroMoveTo(16640.2, -2953.63)
      		If GetAreaVanquished() = False Then AggroMoveTo(9199.96, -2569.42)
      		If GetAreaVanquished() = False Then AggroMoveTo(10458.1, -7461.93)
      		If GetAreaVanquished() = False Then AggroMoveTo(7467.85, -3996.19)
      		If GetAreaVanquished() = False Then AggroMoveTo(5022.31, -5489.66)
      		If GetAreaVanquished() = False Then AggroMoveTo(2536.94, 1598.65)
      		If GetAreaVanquished() = False Then AggroMoveTo(3300.95, 181.991)
      		If GetAreaVanquished() = False Then AggroMoveTo(3616.41, -2523.71)
      		If GetAreaVanquished() = False Then AggroMoveTo(1705.19, -2907.84)
      		If GetAreaVanquished() = False Then AggroMoveTo(-1106.36, -1834.79)
      		If GetAreaVanquished() = False Then AggroMoveTo(-2289.25, -2768.47)
      		If GetAreaVanquished() = False Then AggroMoveTo(-3708.65, -3428.09)
      		If GetAreaVanquished() = False Then AggroMoveTo(-6334.89, 2809.35)
      		If GetAreaVanquished() = False Then AggroMoveTo(-4769.11, -3564.89)
      		If GetAreaVanquished() = False Then AggroMoveTo(-8431.99, -4342.06)
      		If GetAreaVanquished() = False Then AggroMoveTo(-9326.44, -2388.4)
      		If GetAreaVanquished() = False Then AggroMoveTo(-13045.5, 1118.3)
      		If GetAreaVanquished() = False Then AggroMoveTo(-12513.4, -3655.56)
      		If GetAreaVanquished() = False Then AggroMoveTo(-14451.5, -2656.05)
      		If GetAreaVanquished() = False Then AggroMoveTo(-18540.7, -865.82)
      		If GetAreaVanquished() = False Then AggroMoveTo(-21752.6, 2728.14)
      		If GetAreaVanquished() = False Then AggroMoveTo(-18678.9, 903.827)
      		If GetAreaVanquished() = False Then AggroMoveTo(-18444, 7943.79)
      		If GetAreaVanquished() = False Then AggroMoveTo(-14244.2, 10454.8)
      		If GetAreaVanquished() = False Then AggroMoveTo(-14734.1, 6554.66)
      		If GetAreaVanquished() = False Then AggroMoveTo(-12625.2, 5400.72)
      		If GetAreaVanquished() = False Then AggroMoveTo(-11559.7, 5709.07)
      		If GetAreaVanquished() = False Then AggroMoveTo(-10295.88, 2547.11)
      		If GetAreaVanquished() = False Then AggroMoveTo(-8564.03, 4743.28)
      		If GetAreaVanquished() = False Then AggroMoveTo(-5590.98, 5023.76)
      		If GetAreaVanquished() = False Then AggroMoveTo(-6433.92, 7347.38)
      		If GetAreaVanquished() = False Then AggroMoveTo(4043.05, 8245.06)
      		If GetAreaVanquished() = False Then AggroMoveTo(6694.72, 13251.7)
      		If GetAreaVanquished() = False Then AggroMoveTo(-666.852, 9355.51)
      		If GetAreaVanquished() = False Then AggroMoveTo(-4227.9, 7190.21)
      		If GetAreaVanquished() = False Then AggroMoveTo(481.706, 4060.73)
      		If GetAreaVanquished() = False Then AggroMoveTo(4736.91, 5926.64)
      		If GetAreaVanquished() = False Then AggroMoveTo(9123.92, 729.996)
      		If GetAreaVanquished() = False Then AggroMoveTo(12437.5, -1727.91)
      		If GetAreaVanquished() = False Then AggroMoveTo(14380.2, -674.562)
		
    EndIf
EndFunc