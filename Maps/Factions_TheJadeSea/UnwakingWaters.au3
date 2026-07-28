Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutUnwakingWaters()
        Local $aGoOutRoute[2][2] = [ [3355.47, 3054.54] _
                , [3355.47, 2300.54] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "UnwakingWaters exit ")
EndFunc

Func VQUnwakingWaters()
    If GetMapID() <> $UnwakingWaters_Map And GetMapID() <> $UnwakingWaters_Outpost  Then TravelTo($UnwakingWaters_Outpost)   
    If GetMapID() = $UnwakingWaters_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $UnwakingWaters_Map Then    

	
		If GetAreaVanquished() = False Then AggroMoveTo(3464.00, 1917.00)
		If GetAreaVanquished() = False Then AggroMoveTo(3078.88, 5448.03)
		If GetAreaVanquished() = False Then AggroMoveTo(797.97, 3818.96)
		If GetAreaVanquished() = False Then AggroMoveTo(1027.28, 1349.43)
		If GetAreaVanquished() = False Then AggroMoveTo(3400.14, -1050.81)
		If GetAreaVanquished() = False Then AggroMoveTo(7306.71, -550.47)
		If GetAreaVanquished() = False Then AggroMoveTo(10527.24, -630.89)
		If GetAreaVanquished() = False Then AggroMoveTo(14328.43, 1316.61)
		If GetAreaVanquished() = False Then AggroMoveTo(10590.52, 3601.10)
		If GetAreaVanquished() = False Then AggroMoveTo(7283.98, 82.61)
		If GetAreaVanquished() = False Then AggroMoveTo(7086.35, 1018.25)
		If GetAreaVanquished() = False Then AggroMoveTo(9502.52, 4770.71)
		If GetAreaVanquished() = False Then AggroMoveTo(9641.66, 4987.45)
		If GetAreaVanquished() = False Then AggroMoveTo(11014.83, 7214.74)
		If GetAreaVanquished() = False Then AggroMoveTo(5983.94, 7500.72)
		If GetAreaVanquished() = False Then AggroMoveTo(1518.70, 8470.11)
		If GetAreaVanquished() = False Then AggroMoveTo(-1412.39, 6396.44)
		If GetAreaVanquished() = False Then AggroMoveTo(-5065.51, 4624.91)
		If GetAreaVanquished() = False Then AggroMoveTo(-8647.60, 2369.40)
		If GetAreaVanquished() = False Then AggroMoveTo(-4920.25, -135.66)
		If GetAreaVanquished() = False Then AggroMoveTo(-3720.08, 1924.34)
		If GetAreaVanquished() = False Then AggroMoveTo(-2685.00, -954.10)
		If GetAreaVanquished() = False Then AggroMoveTo(-1820.30, 2831.60)
      		If GetAreaVanquished() = False Then AggroMoveTo(-1820.30, 2831.60)
      		If GetAreaVanquished() = False Then AggroMoveTo(-2685.00, -954.10)
      		If GetAreaVanquished() = False Then AggroMoveTo(-3720.08, 1924.34)
      		If GetAreaVanquished() = False Then AggroMoveTo(-4920.25, -135.66)
      		If GetAreaVanquished() = False Then AggroMoveTo(-8647.60, 2369.40)
      		If GetAreaVanquished() = False Then AggroMoveTo(-5065.51, 4624.91)
      		If GetAreaVanquished() = False Then AggroMoveTo(-1412.39, 6396.44)
      		If GetAreaVanquished() = False Then AggroMoveTo(1518.70, 8470.11)
      		If GetAreaVanquished() = False Then AggroMoveTo(5983.94, 7500.72)
      		If GetAreaVanquished() = False Then AggroMoveTo(11014.83, 7214.74)
      		If GetAreaVanquished() = False Then AggroMoveTo(9641.66, 4987.45)
      		If GetAreaVanquished() = False Then AggroMoveTo(9502.52, 4770.71)
      		If GetAreaVanquished() = False Then AggroMoveTo(7086.35, 1018.25)
      		If GetAreaVanquished() = False Then AggroMoveTo(7283.98, 82.61)
      		If GetAreaVanquished() = False Then AggroMoveTo(10590.52, 3601.10)
      		If GetAreaVanquished() = False Then AggroMoveTo(14328.43, 1316.61)
      		If GetAreaVanquished() = False Then AggroMoveTo(10527.24, -630.89)
      		If GetAreaVanquished() = False Then AggroMoveTo(7306.71, -550.47)
      		If GetAreaVanquished() = False Then AggroMoveTo(3400.14, -1050.81)
      		If GetAreaVanquished() = False Then AggroMoveTo(1027.28, 1349.43)
      		If GetAreaVanquished() = False Then AggroMoveTo(797.97, 3818.96)
      		If GetAreaVanquished() = False Then AggroMoveTo(3078.88, 5448.03)
      		If GetAreaVanquished() = False Then AggroMoveTo(3464.00, 1917.00)
		
    EndIf
EndFunc