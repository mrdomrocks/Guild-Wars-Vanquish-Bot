Global $vqrange = 1450
Global $ActionCounter = 1

Global $aNF_Kourna_GandaraTheMoonFortressRoute01[7][2] = [ _
        [5425, 16446], _
        [3246, 13158], _
        [-2989, 14295], _
        [-4304, 11465], _
        [-1938, 11165], _
        [-2396, 14301], _
        [-6098, 15735] _
]

Global $aNF_Kourna_GandaraTheMoonFortressRoute02[36][2] = [ _
        [-10125, 14233], _
        [-10210, 9811], _
        [-12946, 12759], _
        [-18180, 12670], _
        [-23168, 14844], _
        [-25047, 14113], _
        [-23478, 10876], _
        [-24154, 8734], _
        [-23050, 4721], _
        [-24672, 3577], _
        [-24585, 3991], _
        [-19619, 5662], _
        [-22286, 9017], _
        [-21070, 10317], _
        [-18532, 12319], _
        [-19967, 8553], _
        [-15516, 9981], _
        [-12782, 12508], _
        [-11391, 10947], _
        [-10171, 9954], _
        [-10155, 12817], _
        [-5469, 12312], _
        [-2614, 14338], _
        [3843, 12063], _
        [6063, 10744], _
        [9786, 11064], _
        [11645, 10250], _
        [12199, 7117], _
        [15633, 9747], _
        [14905, 13634], _
        [19445, 9837], _
        [22045, 9376], _
        [21646, 6598], _
        [22185, 4098], _
        [21294, 3045], _
        [18447, 6224] _
]

Global $aNF_Kourna_GandaraTheMoonFortressRoute03[43][2] = [ _
        [18447, 6224], _
        [21294, 3045], _
        [22185, 4098], _
        [21646, 6598], _
        [22045, 9376], _
        [19445, 9837], _
        [14905, 13634], _
        [15633, 9747], _
        [12199, 7117], _
        [11645, 10250], _
        [9786, 11064], _
        [6063, 10744], _
        [3843, 12063], _
        [-2614, 14338], _
        [-5469, 12312], _
        [-10155, 12817], _
        [-10171, 9954], _
        [-11391, 10947], _
        [-12782, 12508], _
        [-15516, 9981], _
        [-19967, 8553], _
        [-18532, 12319], _
        [-21070, 10317], _
        [-22286, 9017], _
        [-19619, 5662], _
        [-24585, 3991], _
        [-24672, 3577], _
        [-23050, 4721], _
        [-24154, 8734], _
        [-23478, 10876], _
        [-25047, 14113], _
        [-23168, 14844], _
        [-18180, 12670], _
        [-12946, 12759], _
        [-10210, 9811], _
        [-10125, 14233], _
        [-6098, 15735], _
        [-2396, 14301], _
        [-1938, 11165], _
        [-4304, 11465], _
        [-2989, 14295], _
        [3246, 13158], _
        [5425, 16446] _
]

Func GoOutGandaraTheMoonFortress()
        Local $aGoOutRoute[3][2] = [ [3860, -1719] _
                , [2706, -4708] _
                , [2580, -4950] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "GandaraTheMoonFortress exit ")
EndFunc

Func VQGandaraTheMoonFortress()
    If GetMapID() <> $GandaraTheMoonFortress_Map And GetMapID() <> $GandaraTheMoonFortress_Outpost  Then TravelTo($GandaraTheMoonFortress_Outpost)   
    If GetMapID() = $GandaraTheMoonFortress_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $GandaraTheMoonFortress_Map Then    
		


				
		GoNearestNPCToCoords(6818, 15641)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		_Vanquisher_RunVanquishRoute($aNF_Kourna_GandaraTheMoonFortressRoute01)
		
		GoNearestNPCToCoords(-7412, 14230)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		_Vanquisher_RunVanquishRoute($aNF_Kourna_GandaraTheMoonFortressRoute02)
		
		_Vanquisher_RunVanquishRoute($aNF_Kourna_GandaraTheMoonFortressRoute03)
		
    EndIf
EndFunc