
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTheSulfurousWastes()
        Local $aGoOutRoute[4][2] = [ [903, 345] _
                , [-3659, 3475] _
                , [-4758, 4639] _
                , [-4858, 4639] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "TheSulfurousWastes exit ")
EndFunc

Func VQTheSulfurousWastes()
    If GetMapID() <> $TheSulfurousWastes_Map And GetMapID() <> $TheSulfurousWastes_Outpost  Then TravelTo($TheSulfurousWastes_Outpost)
    If GetMapID() = $TheSulfurousWastes_Outpost then
       GoOut()

    EndIf

	If GetMapID() = $TheSulfurousWastes_Map Then



		GoNearestNPCToCoords(24412, -10695)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)

		AggroMoveTo(23368, -6278)
		AggroMoveTo(21141, -5736)

		UseWormSpoor(24080, -5864)

		If GetAreaVanquished() = False Then AggroMoveTo(25522, -4436)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(24325, -2826)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(24948, 259)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(22699, 2364)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(22264, 3884)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(21187, 4286)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(22449, 324)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(20662, -1404)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(16996, -1145)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(18136, -4457)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(15832, -5071)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(17250, -8849)
		If GetAreaVanquished() = False Then Sleep(7000)
		If GetAreaVanquished() = False Then AggroMoveTo(16039, -9571)
		If GetAreaVanquished() = False Then Sleep(7000)

		If GetAreaVanquished() = False Then AggroMoveTo(16039, -9571)
		If GetAreaVanquished() = False Then AggroMoveTo(17250, -8849)
		If GetAreaVanquished() = False Then AggroMoveTo(15832, -5071)
		If GetAreaVanquished() = False Then AggroMoveTo(18136, -4457)
		If GetAreaVanquished() = False Then AggroMoveTo(16996, -1145)
		If GetAreaVanquished() = False Then AggroMoveTo(20662, -1404)
		If GetAreaVanquished() = False Then AggroMoveTo(22449, 324)
		If GetAreaVanquished() = False Then AggroMoveTo(21187, 4286)
		If GetAreaVanquished() = False Then AggroMoveTo(22264, 3884)
		If GetAreaVanquished() = False Then AggroMoveTo(22699, 2364)
		If GetAreaVanquished() = False Then AggroMoveTo(24948, 259)
		If GetAreaVanquished() = False Then AggroMoveTo(24325, -2826)
		If GetAreaVanquished() = False Then AggroMoveTo(25522, -4436)

    EndIf
EndFunc