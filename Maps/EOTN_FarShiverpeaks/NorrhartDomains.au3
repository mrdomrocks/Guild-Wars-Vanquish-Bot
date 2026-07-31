#RequireAdmin
#NoTrayIcon

Global $vqrange = 1450
Global $ActionCounter = 1

Func _NorrhartDomainsTakeBlessing($nX, $nY)
        If GetAreaVanquished() = False Then AggroMoveTo($nX, $nY)
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
        If GetAreaVanquished() = False Then AggroMoveTo(10206, -3630)
        If GetAreaVanquished() = False Then AggroMoveTo(11176, -1605)
        If GetAreaVanquished() = False Then AggroMoveTo(15157, -892)
        If GetAreaVanquished() = False Then AggroMoveTo(14254, 3017)
        If GetAreaVanquished() = False Then AggroMoveTo(16162, 5330)
        If GetAreaVanquished() = False Then AggroMoveTo(13316, 3935)
        If GetAreaVanquished() = False Then AggroMoveTo(10208, 2679)
        If GetAreaVanquished() = False Then AggroMoveTo(6191, 2436)

        ; shrine 2
        _NorrhartDomainsTakeBlessing(5677, 809)
        If GetAreaVanquished() = False Then AggroMoveTo(2521, 666)
        If GetAreaVanquished() = False Then AggroMoveTo(-906, 2797)
        If GetAreaVanquished() = False Then AggroMoveTo(-2995, 6264)
        If GetAreaVanquished() = False Then AggroMoveTo(-4837, 9821)
        If GetAreaVanquished() = False Then AggroMoveTo(-5591, 13759)
        If GetAreaVanquished() = False Then AggroMoveTo(-7694, 13277)
        If GetAreaVanquished() = False Then AggroMoveTo(-5008, 14924)

        ; shrine 3
        _NorrhartDomainsTakeBlessing(-3224, 11581)
        If GetAreaVanquished() = False Then AggroMoveTo(-2622, 11229)
        If GetAreaVanquished() = False Then AggroMoveTo(1442, 11209)
        If GetAreaVanquished() = False Then AggroMoveTo(5490, 11284)
        If GetAreaVanquished() = False Then AggroMoveTo(9491, 11681)
        If GetAreaVanquished() = False Then AggroMoveTo(9350, 15689)
        If GetAreaVanquished() = False Then AggroMoveTo(5440, 14564)
        If GetAreaVanquished() = False Then AggroMoveTo(1436, 14191)
        If GetAreaVanquished() = False Then AggroMoveTo(5473, 14642)
        If GetAreaVanquished() = False Then AggroMoveTo(9363, 15709)
        If GetAreaVanquished() = False Then AggroMoveTo(12725, 13484)

        ; shrine 4
        _NorrhartDomainsTakeBlessing(15785, 14790)
        If GetAreaVanquished() = False Then AggroMoveTo(16328, 15250)
        If GetAreaVanquished() = False Then AggroMoveTo(20329, 15592)
        If GetAreaVanquished() = False Then AggroMoveTo(24230, 14634)
        If GetAreaVanquished() = False Then AggroMoveTo(20974, 12277)
        If GetAreaVanquished() = False Then AggroMoveTo(18708, 9276)
        If GetAreaVanquished() = False Then AggroMoveTo(20806, 11454)
        If GetAreaVanquished() = False Then AggroMoveTo(24172, 9851)
        If GetAreaVanquished() = False Then AggroMoveTo(20292, 8845)
        If GetAreaVanquished() = False Then AggroMoveTo(17673, 6851)

        ; shrine 5
        _NorrhartDomainsTakeBlessing(24022, 7636)
        If GetAreaVanquished() = False Then AggroMoveTo(22030, 5201)
        If GetAreaVanquished() = False Then AggroMoveTo(23282, 1357)
        If GetAreaVanquished() = False Then AggroMoveTo(19738, -516)
        If GetAreaVanquished() = False Then AggroMoveTo(15833, -1619)
        If GetAreaVanquished() = False Then AggroMoveTo(13042, -4503)
        If GetAreaVanquished() = False Then AggroMoveTo(10038, -7193)
        If GetAreaVanquished() = False Then AggroMoveTo(10149, -11248)

        ; shrine 6
        _NorrhartDomainsTakeBlessing(9984, -13001)
        If GetAreaVanquished() = False Then AggroMoveTo(6150, -11377)
        If GetAreaVanquished() = False Then AggroMoveTo(4465, -7682)
        If GetAreaVanquished() = False Then AggroMoveTo(1411, -5032)
        If GetAreaVanquished() = False Then AggroMoveTo(-65, -4359)
        If GetAreaVanquished() = False Then AggroMoveTo(-1522, 1595)
        If GetAreaVanquished() = False Then AggroMoveTo(-3966, 1556)
        If GetAreaVanquished() = False Then AggroMoveTo(-1332, 265)
        If GetAreaVanquished() = False Then AggroMoveTo(-1110, -3694)
        If GetAreaVanquished() = False Then AggroMoveTo(-2601, -4861)
        If GetAreaVanquished() = False Then AggroMoveTo(-2436, -8897)
        If GetAreaVanquished() = False Then AggroMoveTo(-2355, -12898)
        If GetAreaVanquished() = False Then AggroMoveTo(-6301, -12074)
        If GetAreaVanquished() = False Then AggroMoveTo(-10304, -11509)
        If GetAreaVanquished() = False Then AggroMoveTo(-12415, -8097)
        If GetAreaVanquished() = False Then AggroMoveTo(-9246, -5576)
        If GetAreaVanquished() = False Then AggroMoveTo(-12714, -7613)
        If GetAreaVanquished() = False Then AggroMoveTo(-15950, -10050)
        If GetAreaVanquished() = False Then AggroMoveTo(-19706, -8615)

        ; shrine 7
        _NorrhartDomainsTakeBlessing(-22581, -10877)
        If GetAreaVanquished() = False Then AggroMoveTo(-20335, -8851)
        If GetAreaVanquished() = False Then AggroMoveTo(-21095, -4860)
        If GetAreaVanquished() = False Then AggroMoveTo(-19197, -3470)
        If GetAreaVanquished() = False Then AggroMoveTo(-23397, -4212)
        If GetAreaVanquished() = False Then AggroMoveTo(-20918, -833)
        If GetAreaVanquished() = False Then AggroMoveTo(-16715, -3833)
        If GetAreaVanquished() = False Then AggroMoveTo(-19114, -5679)
        If GetAreaVanquished() = False Then AggroMoveTo(-14464, -5422)
        If GetAreaVanquished() = False Then AggroMoveTo(-19618, 702)
        If GetAreaVanquished() = False Then AggroMoveTo(-21355, -2799)
        If GetAreaVanquished() = False Then AggroMoveTo(-21255, 1324)
        If GetAreaVanquished() = False Then AggroMoveTo(-22918, 3035)
        If GetAreaVanquished() = False Then AggroMoveTo(-23893, 6969)
        If GetAreaVanquished() = False Then AggroMoveTo(-19885, 7262)
        If GetAreaVanquished() = False Then AggroMoveTo(-16461, 9372)
        If GetAreaVanquished() = False Then AggroMoveTo(-15042, 5625)
        If GetAreaVanquished() = False Then AggroMoveTo(-11006, 6042)
        If GetAreaVanquished() = False Then AggroMoveTo(-10141, 2130)

        ; shrine 8
        _NorrhartDomainsTakeBlessing(-7398, -839)
        If GetAreaVanquished() = False Then AggroMoveTo(-6084, 2190)
        If GetAreaVanquished() = False Then AggroMoveTo(-6295, 6211)
        If GetAreaVanquished() = False Then AggroMoveTo(-6715, 8056)
        If GetAreaVanquished() = False Then AggroMoveTo(-5727, 9551)
        If GetAreaVanquished() = False Then AggroMoveTo(-7070, 8841)
        If GetAreaVanquished() = False Then AggroMoveTo(-7304, 10147)
        If GetAreaVanquished() = False Then AggroMoveTo(-6346, 12361)
        If GetAreaVanquished() = False Then AggroMoveTo(-5561, 12944)
        If GetAreaVanquished() = False Then AggroMoveTo(-6017, 14363)
        If GetAreaVanquished() = False Then AggroMoveTo(-4319, 12741)
        If GetAreaVanquished() = False Then AggroMoveTo(-6346, 12513)
        If GetAreaVanquished() = False Then AggroMoveTo(-10679, 12345)
        If GetAreaVanquished() = False Then AggroMoveTo(-15502, 13832)
        If GetAreaVanquished() = False Then AggroMoveTo(-13728, 11222)
        If GetAreaVanquished() = False Then AggroMoveTo(-16679, 11024)
        If GetAreaVanquished() = False Then AggroMoveTo(-16190, 14078)
        If GetAreaVanquished() = False Then AggroMoveTo(-19598, 15479)
        If GetAreaVanquished() = False Then AggroMoveTo(-21208, 14423)
        If GetAreaVanquished() = False Then AggroMoveTo(-20063, 15427)
        If GetAreaVanquished() = False Then AggroMoveTo(-18093, 14965)
        If GetAreaVanquished() = False Then AggroMoveTo(-20244, 11438)
        If GetAreaVanquished() = False Then AggroMoveTo(-24172, 10483)

        ; final shrine / cleanup
        _NorrhartDomainsTakeBlessing(-24540, 10834)
EndFunc
