Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFactions_TheJadeSea_BoreasSeabedRoute01[45][2] = [ _
        [15139, -7063], _
        [18288, -9106], _
        [19930, -6525], _
        [21821, -8140], _
        [19603, -5849], _
        [18616, -2516], _
        [15500, -993], _
        [12532, -1995], _
        [9383, -1539], _
        [7684, -1887], _
        [7961, -4050], _
        [11091, -6237], _
        [7554, -7600], _
        [2925, -6527], _
        [-634, -5828], _
        [-1275, -9005], _
        [-5928, -5322], _
        [-10598, -3114], _
        [-9772, 1067], _
        [-9158, 3230], _
        [-10241, 5109], _
        [-7839, 4851], _
        [-10869, 7276], _
        [-11256, 9728], _
        [-8200, 9981], _
        [-3190, 9801], _
        [-2424, 8451], _
        [-1763, 3630], _
        [-4181, 113], _
        [1951, -984], _
        [3271, 957], _
        [4828, 5135], _
        [8367, 8549], _
        [10923, 5254], _
        [14184, 4152], _
        [17822, 2507], _
        [14220, 8099], _
        [15520, 10111], _
        [17418, 8581], _
        [18973, 8433], _
        [19623, 8179], _
        [21803, 8558], _
        [22850, 8471], _
        [24070, 8805], _
        [25243, 10408] _
]

Global $aFactions_TheJadeSea_BoreasSeabedRoute02[45][2] = [ _
        [25243, 10408], _
        [24070, 8805], _
        [22850, 8471], _
        [21803, 8558], _
        [19623, 8179], _
        [18973, 8433], _
        [17418, 8581], _
        [15520, 10111], _
        [14220, 8099], _
        [17822, 2507], _
        [14184, 4152], _
        [10923, 5254], _
        [8367, 8549], _
        [4828, 5135], _
        [3271, 957], _
        [1951, -984], _
        [-4181, 113], _
        [-1763, 3630], _
        [-2424, 8451], _
        [-3190, 9801], _
        [-8200, 9981], _
        [-11256, 9728], _
        [-10869, 7276], _
        [-7839, 4851], _
        [-10241, 5109], _
        [-9158, 3230], _
        [-9772, 1067], _
        [-10598, -3114], _
        [-5928, -5322], _
        [-1275, -9005], _
        [-634, -5828], _
        [2925, -6527], _
        [7554, -7600], _
        [11091, -6237], _
        [7961, -4050], _
        [7684, -1887], _
        [9383, -1539], _
        [12532, -1995], _
        [15500, -993], _
        [18616, -2516], _
        [19603, -5849], _
        [21821, -8140], _
        [19930, -6525], _
        [18288, -9106], _
        [15139, -7063] _
]

Func GoOutBoreasSeabed()
        Local $aGoOutRoute[2][2] = [ [3476, 6599] _
                , [3510, 7400] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "BoreasSeabed exit ")
EndFunc

Func VQBoreasSeabed()
    If GetMapID() <> $BoreasSeabed_Map And GetMapID() <> $BoreasSeabed_Outpost  Then TravelTo($BoreasSeabed_Outpost)   
    If GetMapID() = $BoreasSeabed_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $BoreasSeabed_Map Then    


		GoNearestNPCToCoords(13861, -9986)
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

		_Vanquisher_RunVanquishRoute($aFactions_TheJadeSea_BoreasSeabedRoute01)
      		_Vanquisher_RunVanquishRoute($aFactions_TheJadeSea_BoreasSeabedRoute02)
		
    EndIf
EndFunc