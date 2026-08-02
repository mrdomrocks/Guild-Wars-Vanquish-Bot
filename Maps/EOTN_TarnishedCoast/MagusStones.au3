#RequireAdmin
#NoTrayIcon



Global $aEOTN_TarnishedCoast_MagusStonesRoute01[1][2] = [ _
        [16722, 11774] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute02[1][2] = [ _
        [17383, 8685] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute03[7][2] = [ _
        [18824.87, 6179.76], _
        [18447, 4537], _
        [18331, 2108], _
        [17526, 143], _
        [17205, -1355], _
        [17366, -5132], _
        [18111, -8030] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute04[1][2] = [ _
        [18409, -8474] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute05[9][2] = [ _
        [18613, -11799], _
        [17154, -15669], _
        [14250, -16744], _
        [12186, -14139], _
        [12540, -13440], _
        [13234, -9948], _
        [8875, -9065], _
        [4671, -8699], _
        [1534, -5493] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute06[4][2] = [ _
        [1052, -7074], _
        [-1029, -8724], _
        [-3439, -10339], _
        [-3024, -12586] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute07[4][2] = [ _
        [-2797, -13645], _
        [-3393, -15633], _
        [-4635, -16643], _
        [-7814, -17796] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute08[1][2] = [ _
        [-10109, -17520] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute09[2][2] = [ _
        [-9111, -17237], _
        [-10963, -15506] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute10[1][2] = [ _
        [-12885, -14651] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute11[8][2] = [ _
        [-13975, -17857], _
        [-11912, -10641], _
        [-8760, -9933], _
        [-14030, -9780], _
        [-12368, -7330], _
        [-16527, -8175], _
        [-17391, -5984], _
        [-15704, -3996] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute12[1][2] = [ _
        [-16609, -2607] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute13[1][2] = [ _
        [-15476, 186] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute14[2][2] = [ _
        [-16480, 2522], _
        [-17090, 5252] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute15[1][2] = [ _
        [-19292, 8994] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute16[15][2] = [ _
        [-18640, 8724], _
        [-18484, 12021], _
        [-17180, 13093], _
        [-15072, 14075], _
        [-11888, 15628], _
        [-12043, 18463], _
        [-8876, 17415], _
        [-5778, 19838], _
        [-10970, 16860], _
        [-9301, 15054], _
        [-5379, 16642], _
        [-4430, 17268], _
        [-2974, 14197], _
        [-5228, 12475], _
        [-3468, 10837] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute17[2][2] = [ _
        [-3804, 8017], _
        [-1346, 12360] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute18[10][2] = [ _
        [874, 14367], _
        [3572, 13698], _
        [5899, 14205], _
        [7407, 11867], _
        [9541, 9027], _
        [12639, 7537], _
        [9064, 7312], _
        [7986, 4365], _
        [6341, 3029], _
        [7097, 92] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute19[3][2] = [ _
        [8943, -985], _
        [10949, -2056], _
        [13780, -5667] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute20[1][2] = [ _
        [10752, 991] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute21[1][2] = [ _
        [8193, -841] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute22[7][2] = [ _
        [3284, -1599], _
        [-76, -1498], _
        [578, 719], _
        [316, 2489], _
        [-1018, -1235], _
        [-3195, -1538], _
        [-6322, -2565] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute23[3][2] = [ _
        [-11414, 4055], _
        [-6907, 8461], _
        [-8689, 11227] _
]

Global $aEOTN_TarnishedCoast_MagusStonesRoute24[4][2] = [ _
        [4671, -8699], _
        [-1018, -1235], _
        [-6322, -2565], _
        [-8760, -9933] _
]

Func GoOutMagusStones()
        Local $aGoOutRoute[2][2] = [ [16448.44, 14224.86] _
                , [16183.18, 13655.50] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "MagusStones exit ", 3000)
EndFunc

Func VQMagusStones() ;Add VQ name

	;This block is to pick up blessings. Add NPC coords and the right dialogue
	GoNearestNPCToCoords(14796, 13170)
	Sleep(1000)
	Dialog(0x83)
	Sleep(1000)
	Dialog(0x84)
	Sleep(1000)


Do

	$DeadOnTheRun = 0
	If $DeadOnTheRun = 0 Then CurrentAction("Moving")
        _Vanquisher_RunDeadOnTheRunRoute($aEOTN_TarnishedCoast_MagusStonesRoute01)
	If $DeadOnTheRun = 0 Then CurrentAction("Moving")
        _Vanquisher_RunDeadOnTheRunRoute($aEOTN_TarnishedCoast_MagusStonesRoute02)

	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute03)

        If $DeadOnTheRun = 0 Then CurrentAction("Taking Blessing")
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute04)
	If GetAreaVanquished() = False Then Sleep(2000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute05)
	If GetAreaVanquished() = False Then Sleep(2000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute06)
	If GetAreaVanquished() = False Then Sleep(2000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute07)

        If $DeadOnTheRun = 0 Then CurrentAction("Taking Blessing")
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute08)
        If GetAreaVanquished() = False Then Sleep(2000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute09)
        _Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute10)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute11)
        If $DeadOnTheRun = 0 Then CurrentAction("Moving")
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute12)
	If GetAreaVanquished() = False Then Sleep(2000)
        _Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute13)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute14)

        If $DeadOnTheRun = 0 Then CurrentAction("Taking Blessing")
        _Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute15)
	Sleep(2000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute16)

        AggroMoveTo(-2037, 10758)
	RndSleep(2000)

	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute17)
	RndSleep(2000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute18)

        AggroMoveTo(4893, 445)
	RndSleep(2000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute19)
	RndSleep(3000)
	RndSleep(3000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute20)

	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute21)
	RndSleep(5000)
	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute22)

        AggroMoveTo(-9231, -2629)
	RndSleep(4000)

	_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute23)
	RndSleep(10000)
	

		_Vanquisher_RunVanquishRoute($aEOTN_TarnishedCoast_MagusStonesRoute24)
	



		If  $DeadOnTheRun = 1 then RndSlp(15000)

Until CheckArea(-8689, 11227, 1800000) ;30min leeway to close the bot
MsgBox(48, "VQ DONE", "VQ should be finished. Please check manually and get your carto done. Close the bot or it will reset in 30min")
Sleep(3600000) ;30min leeway to close the bot;30min leeway to close the bot

	If $DeadOnTheRun = 0 Then CurrentAction("Waiting to get reward")
	If $DeadOnTheRun = 0 Then Sleep(3000)
EndFunc
