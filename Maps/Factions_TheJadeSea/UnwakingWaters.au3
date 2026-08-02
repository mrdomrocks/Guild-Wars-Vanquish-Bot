Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFactions_TheJadeSea_UnwakingWatersRoute01[23][2] = [ _
        [3464.00, 1917.00], _
        [3078.88, 5448.03], _
        [797.97, 3818.96], _
        [1027.28, 1349.43], _
        [3400.14, -1050.81], _
        [7306.71, -550.47], _
        [10527.24, -630.89], _
        [14328.43, 1316.61], _
        [10590.52, 3601.10], _
        [7283.98, 82.61], _
        [7086.35, 1018.25], _
        [9502.52, 4770.71], _
        [9641.66, 4987.45], _
        [11014.83, 7214.74], _
        [5983.94, 7500.72], _
        [1518.70, 8470.11], _
        [-1412.39, 6396.44], _
        [-5065.51, 4624.91], _
        [-8647.60, 2369.40], _
        [-4920.25, -135.66], _
        [-3720.08, 1924.34], _
        [-2685.00, -954.10], _
        [-1820.30, 2831.60] _
]

Global $aFactions_TheJadeSea_UnwakingWatersRoute02[23][2] = [ _
        [-1820.30, 2831.60], _
        [-2685.00, -954.10], _
        [-3720.08, 1924.34], _
        [-4920.25, -135.66], _
        [-8647.60, 2369.40], _
        [-5065.51, 4624.91], _
        [-1412.39, 6396.44], _
        [1518.70, 8470.11], _
        [5983.94, 7500.72], _
        [11014.83, 7214.74], _
        [9641.66, 4987.45], _
        [9502.52, 4770.71], _
        [7086.35, 1018.25], _
        [7283.98, 82.61], _
        [10590.52, 3601.10], _
        [14328.43, 1316.61], _
        [10527.24, -630.89], _
        [7306.71, -550.47], _
        [3400.14, -1050.81], _
        [1027.28, 1349.43], _
        [797.97, 3818.96], _
        [3078.88, 5448.03], _
        [3464.00, 1917.00] _
]

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

	
		_Vanquisher_RunVanquishRoute($aFactions_TheJadeSea_UnwakingWatersRoute01)
      		_Vanquisher_RunVanquishRoute($aFactions_TheJadeSea_UnwakingWatersRoute02)
		
    EndIf
EndFunc