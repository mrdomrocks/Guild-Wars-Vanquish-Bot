
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

Global $aNF_TheDesolation_TheSulfurousWastesRoute14[92][2] = [ _
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
        [25522, -4436], _
        [24438, -10626], _
        [24191, -5869], _
        [24228, -2684], _
        [23581, 975], _
        [20420, 712], _
        [20740, -1345], _
        [16756, -1888], _
        [16096, -4533], _
        [18581, -4736], _
        [22767, -5496], _
        [15568, -7375], _
        [19037, -8386], _
        [14126, -10493], _
        [12648, -7000], _
        [14641, -2342], _
        [10606, -9537], _
        [7652, -11487], _
        [4975, -12784], _
        [1065, -11555], _
        [-729, -8881], _
        [-434, -4770], _
        [2053, -3406], _
        [6966, -1021], _
        [11199, 2670], _
        [11700, 9999], _
        [7157, 7973], _
        [11761, 12481], _
        [9308, 13655], _
        [9852, 15432], _
        [7304, 16220], _
        [2531, 14384], _
        [-190, 10923], _
        [-6005, 11342], _
        [-4404, 8043], _
        [-3178, 5921], _
        [-2381, 6768], _
        [-2693, 4547], _
        [-45, 981], _
        [-9525, -1171], _
        [-8744, -3708], _
        [-14651, -1993], _
        [-18745, -8], _
        [-18602, -4523], _
        [-3610, 3460], _
        [-21576, -5348], _
        [-19497, -9586], _
        [-23531, -11182], _
        [-21572, -13808], _
        [-18091, -13175], _
        [-16131, -13197], _
        [-21502, -13911], _
        [-23079, -11086], _
        [-19520, -8427], _
        [-22037, -2642], _
        [-17669, 5352], _
        [-20618, 7271], _
        [-23086, 12363], _
        [-20533, 11007], _
        [-20515, 11830], _
        [-18837, 15074], _
        [-20712, 15834], _
        [-21922, 14849], _
        [-20444, 15700], _
        [-19950, 10368], _
        [-22814, 12306], _
        [-17007, 5212], _
        [-13595, 8507], _
        [-12565, 6401], _
        [-9607, 2440], _
        [-4895, -3357], _
        [-4584, 1139], _
        [-4772, 6497], _
        [-6160, 8405], _
        [-8660, 11043], _
        [-9027, 8337], _
        [-11163, 10114], _
        [-12605, 11523], _
        [-10125, 13549], _
        [-14385, 15328] _
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