#RequireAdmin
#NoTrayIcon

Global $vqrange = 1450
Global $ActionCounter = 1

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute02[9][2] = [ _
        [14430, -3824], _
        [10206, -3630], _
        [11176, -1605], _
        [15157, -892], _
        [14254, 3017], _
        [16162, 5330], _
        [13316, 3935], _
        [10208, 2679], _
        [6191, 2436] _
]

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute03[8][2] = [ _
        [5677, 809], _
        [2521, 666], _
        [-906, 2797], _
        [-2995, 6264], _
        [-4837, 9821], _
        [-5591, 13759], _
        [-7694, 13277], _
        [-5008, 14924] _
]

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute04[11][2] = [ _
        [-3224, 11581], _
        [-2622, 11229], _
        [1442, 11209], _
        [5490, 11284], _
        [9491, 11681], _
        [9350, 15689], _
        [5440, 14564], _
        [1436, 14191], _
        [5473, 14642], _
        [9363, 15709], _
        [12725, 13484] _
]

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute05[10][2] = [ _
        [15785, 14790], _
        [16328, 15250], _
        [20329, 15592], _
        [24230, 14634], _
        [20974, 12277], _
        [18708, 9276], _
        [20806, 11454], _
        [24172, 9851], _
        [20292, 8845], _
        [17673, 6851] _
]

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute06[8][2] = [ _
        [24022, 7636], _
        [22030, 5201], _
        [23282, 1357], _
        [19738, -516], _
        [15833, -1619], _
        [13042, -4503], _
        [10038, -7193], _
        [10149, -11248] _
]

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute07[19][2] = [ _
        [9984, -13001], _
        [6150, -11377], _
        [4465, -7682], _
        [1411, -5032], _
        [-65, -4359], _
        [-1522, 1595], _
        [-3966, 1556], _
        [-1332, 265], _
        [-1110, -3694], _
        [-2601, -4861], _
        [-2436, -8897], _
        [-2355, -12898], _
        [-6301, -12074], _
        [-10304, -11509], _
        [-12415, -8097], _
        [-9246, -5576], _
        [-12714, -7613], _
        [-15950, -10050], _
        [-19706, -8615] _
]

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute08[19][2] = [ _
        [-22581, -10877], _
        [-20335, -8851], _
        [-21095, -4860], _
        [-19197, -3470], _
        [-23397, -4212], _
        [-20918, -833], _
        [-16715, -3833], _
        [-19114, -5679], _
        [-14464, -5422], _
        [-19618, 702], _
        [-21355, -2799], _
        [-21255, 1324], _
        [-22918, 3035], _
        [-23893, 6969], _
        [-19885, 7262], _
        [-16461, 9372], _
        [-15042, 5625], _
        [-11006, 6042], _
        [-10141, 2130] _
]

Global $aEOTN_FarShiverpeaks_NorrhartDomainsRoute09[24][2] = [ _
        [-7398, -839], _
        [-6084, 2190], _
        [-6295, 6211], _
        [-6715, 8056], _
        [-5727, 9551], _
        [-7070, 8841], _
        [-7304, 10147], _
        [-6346, 12361], _
        [-5561, 12944], _
        [-6017, 14363], _
        [-4319, 12741], _
        [-6346, 12513], _
        [-10679, 12345], _
        [-15502, 13832], _
        [-13728, 11222], _
        [-16679, 11024], _
        [-16190, 14078], _
        [-19598, 15479], _
        [-21208, 14423], _
        [-20063, 15427], _
        [-18093, 14965], _
        [-20244, 11438], _
        [-24172, 10483], _
        [-24540, 10834] _
]

Func _NorrhartDomainsTakeBlessing($nX, $nY)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute01)
        If GetAreaVanquished() = False Then
                GoNearestNPCToCoords($nX, $nY)
                Sleep(300)
                Dialog(0x84)
                Sleep(300)
        EndIf
EndFunc

Func GoOutNorrhartDomains()
        Local $aGoOutRoute[2][2] = [ [1683, -1594] _
                , [4600, -27863] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "NorrhartDomains exit ")
EndFunc

Func VQNorrhartDomains()
        If GetMapID() <> $NorrhartDomains_Map And GetMapID() <> $NorrhartDomains_Outpost Then
                _Vanquisher_ResetGoOutRouteProgress()
                CurrentAction("Traveling to outpost for Norrhart Domains.")
                TravelTo($NorrhartDomains_Outpost)
        EndIf

        If GetMapID() = $NorrhartDomains_Outpost Then
                _Vanquisher_ApplyDifficulty()
                GoOut()
                If GetMapID() <> $NorrhartDomains_Map Then
                        CurrentAction("Routing - on map " & GetMapID() & ", need Norrhart Domains (" & $NorrhartDomains_Map & ").")
                        Return
                EndIf
        EndIf

        If GetMapID() <> $NorrhartDomains_Map Then
                CurrentAction("Norrhart Domains route waiting - on map " & GetMapID() & ", need " & $NorrhartDomains_Map & ".")
                Return
        EndIf

        CurrentAction("Starting Norrhart Domains vanquish route.")

        ; shrine 1
        _NorrhartDomainsTakeBlessing(14430, -3824)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute02)

        ; shrine 2
        _NorrhartDomainsTakeBlessing(5677, 809)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute03)

        ; shrine 3
        _NorrhartDomainsTakeBlessing(-3224, 11581)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute04)

        ; shrine 4
        _NorrhartDomainsTakeBlessing(15785, 14790)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute05)

        ; shrine 5
        _NorrhartDomainsTakeBlessing(24022, 7636)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute06)

        ; shrine 6
        _NorrhartDomainsTakeBlessing(9984, -13001)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute07)

        ; shrine 7
        _NorrhartDomainsTakeBlessing(-22581, -10877)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute08)

        ; shrine 8
        _NorrhartDomainsTakeBlessing(-7398, -839)
        _Vanquisher_RunVanquishRoute($aEOTN_FarShiverpeaks_NorrhartDomainsRoute09)

        ; final shrine / cleanup
        _NorrhartDomainsTakeBlessing(-24540, 10834)
EndFunc
