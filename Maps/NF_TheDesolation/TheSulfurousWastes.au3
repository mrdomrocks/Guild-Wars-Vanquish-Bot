
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aNF_TheDesolation_TheSulfurousWastesRoute01[1][2] = [ _
        [25522, -4436] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute02[1][2] = [ _
        [24325, -2826] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute03[1][2] = [ _
        [24948, 259] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute04[1][2] = [ _
        [22699, 2364] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute05[1][2] = [ _
        [22264, 3884] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute06[1][2] = [ _
        [21187, 4286] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute07[1][2] = [ _
        [22449, 324] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute08[1][2] = [ _
        [20662, -1404] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute09[1][2] = [ _
        [16996, -1145] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute10[1][2] = [ _
        [18136, -4457] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute11[1][2] = [ _
        [15832, -5071] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute12[1][2] = [ _
        [17250, -8849] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute13[1][2] = [ _
        [16039, -9571] _
]

Global $aNF_TheDesolation_TheSulfurousWastesRoute14[13][2] = [ _
        [16039, -9571], _
        [17250, -8849], _
        [15832, -5071], _
        [18136, -4457], _
        [16996, -1145], _
        [20662, -1404], _
        [22449, 324], _
        [21187, 4286], _
        [22264, 3884], _
        [22699, 2364], _
        [24948, 259], _
        [24325, -2826], _
        [25522, -4436] _
]

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

		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute01)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute02)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute03)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute04)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute05)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute06)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute07)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute08)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute09)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute10)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute11)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute12)
		If GetAreaVanquished() = False Then Sleep(7000)
		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute13)
		If GetAreaVanquished() = False Then Sleep(7000)

		_Vanquisher_RunVanquishRoute($aNF_TheDesolation_TheSulfurousWastesRoute14)

    EndIf
EndFunc