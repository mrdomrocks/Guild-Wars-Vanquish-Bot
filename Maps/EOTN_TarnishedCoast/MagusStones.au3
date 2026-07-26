#RequireAdmin
#NoTrayIcon



Func GoOutMagusStones()
	MoveTo(16448.44, 14224.86)
	RndSleep(500)
	Move(16183.18, 13655.50)
	RndSleep(3000)
	WaitForLoad()
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
	If $DeadOnTheRun = 0 Then MoveTo(16722, 11774)
	If $DeadOnTheRun = 0 Then CurrentAction("Moving")
	If $DeadOnTheRun = 0 Then MoveTo(17383, 8685)

	If GetAreaVanquished() = False Then AggroMoveTo(18824.87, 6179.76)
	If GetAreaVanquished() = False Then AggroMoveTo(18447, 4537)
	If GetAreaVanquished() = False Then AggroMoveTo(18331, 2108)
	If GetAreaVanquished() = False Then AggroMoveTo(17526, 143)
	If GetAreaVanquished() = False Then AggroMoveTo(17205, -1355)
	If GetAreaVanquished() = False Then AggroMoveTo(17366, -5132)
	If GetAreaVanquished() = False Then AggroMoveTo(18111, -8030)

	If GetAreaVanquished() = False Then AggroMoveTo("Taking Blessing")
	If GetAreaVanquished() = False Then AggroMoveTo(18409, -8474)
	If GetAreaVanquished() = False Then Sleep(2000)
	If GetAreaVanquished() = False Then AggroMoveTo(18613, -11799)
	If GetAreaVanquished() = False Then AggroMoveTo(17154, -15669)
	If GetAreaVanquished() = False Then AggroMoveTo(14250, -16744)
	If GetAreaVanquished() = False Then AggroMoveTo(12186, -14139)
	If GetAreaVanquished() = False Then AggroMoveTo(12540, -13440)
	If GetAreaVanquished() = False Then AggroMoveTo(13234, -9948)
	If GetAreaVanquished() = False Then AggroMoveTo(8875, -9065)
	If GetAreaVanquished() = False Then AggroMoveTo(4671, -8699)
	If GetAreaVanquished() = False Then AggroMoveTo(1534, -5493)
	If GetAreaVanquished() = False Then Sleep(2000)
	If GetAreaVanquished() = False Then AggroMoveTo(1052, -7074)
	If GetAreaVanquished() = False Then AggroMoveTo(-1029, -8724)
	If GetAreaVanquished() = False Then AggroMoveTo(-3439, -10339)
	If GetAreaVanquished() = False Then AggroMoveTo(-3024, -12586)
	If GetAreaVanquished() = False Then Sleep(2000)
	If GetAreaVanquished() = False Then AggroMoveTo(-2797, -13645)
	If GetAreaVanquished() = False Then AggroMoveTo(-3393, -15633)
	If GetAreaVanquished() = False Then AggroMoveTo(-4635, -16643)
	If GetAreaVanquished() = False Then AggroMoveTo(-7814, -17796)

	If GetAreaVanquished() = False Then AggroMoveTo("Taking Blessing")
	If GetAreaVanquished() = False Then AggroMoveTo(-10109, -17520)
	If GetAreaVanquished() = False Then AggroMoveTo(2000)
	If GetAreaVanquished() = False Then AggroMoveTo(-9111, -17237)
	If GetAreaVanquished() = False Then AggroMoveTo(-10963, -15506)
	If GetAreaVanquished() = False Then AggroMoveTo(-12885, -14651
	If GetAreaVanquished() = False Then AggroMoveTo(-13975, -17857)
	If GetAreaVanquished() = False Then AggroMoveTo(-11912, -10641)
	If GetAreaVanquished() = False Then AggroMoveTo(-8760, -9933)
	If GetAreaVanquished() = False Then AggroMoveTo(-14030, -9780)
	If GetAreaVanquished() = False Then AggroMoveTo(-12368, -7330)
	If GetAreaVanquished() = False Then AggroMoveTo(-16527, -8175)
	If GetAreaVanquished() = False Then AggroMoveTo(-17391, -5984)
	If GetAreaVanquished() = False Then AggroMoveTo(-15704, -3996)
	If GetAreaVanquished() = False Then AggroMoveTo("Moving")
	If GetAreaVanquished() = False Then AggroMoveTo(-16609, -2607)
	If GetAreaVanquished() = False Then Sleep(2000)
	If GetAreaVanquished() = False Then AggroMoveToo(-15476, 186)
	If GetAreaVanquished() = False Then AggroMoveTo(-16480, 2522)
	If GetAreaVanquished() = False Then AggroMoveTo(-17090, 5252)

	If GetAreaVanquished() = False Then AggroMoveTo("Taking Blessing")
	If GetAreaVanquished() = False Then MoveTo(-19292, 8994)
	Sleep(2000)
	If GetAreaVanquished() = False Then AggroMoveTo(-18640, 8724)
	If GetAreaVanquished() = False Then AggroMoveTo(-18484, 12021)
	If GetAreaVanquished() = False Then AggroMoveTo(-17180, 13093)
	If GetAreaVanquished() = False Then AggroMoveTo(-15072, 14075)
	If GetAreaVanquished() = False Then AggroMoveTo(-11888, 15628)
	If GetAreaVanquished() = False Then AggroMoveTo(-12043, 18463)
	If GetAreaVanquished() = False Then AggroMoveTo(-8876, 17415)
	If GetAreaVanquished() = False Then AggroMoveTo(-5778, 19838)
	If GetAreaVanquished() = False Then AggroMoveTo(-10970, 16860)
	If GetAreaVanquished() = False Then AggroMoveTo(-9301, 15054)
	If GetAreaVanquished() = False Then AggroMoveTo(-5379, 16642)
	If GetAreaVanquished() = False Then AggroMoveTo(-4430, 17268)
	If GetAreaVanquished() = False Then AggroMoveTo(-2974, 14197)
	If GetAreaVanquished() = False Then AggroMoveTo(-5228, 12475)
	If GetAreaVanquished() = False Then AggroMoveTo(-3468, 10837)

	Moveto(-2037, 10758)
	RndSleep(2000)

	If GetAreaVanquished() = False Then AggroMoveTo(-3804, 8017)
	If GetAreaVanquished() = False Then AggroMoveTo(-1346, 12360)
	RndSleep(2000)
	If GetAreaVanquished() = False Then AggroMoveTo(874, 14367)
	If GetAreaVanquished() = False Then AggroMoveTo(3572, 13698)
	If GetAreaVanquished() = False Then AggroMoveTo(5899, 14205)
	If GetAreaVanquished() = False Then AggroMoveTo(7407, 11867)
	If GetAreaVanquished() = False Then AggroMoveTo(9541, 9027)
	If GetAreaVanquished() = False Then AggroMoveTo(12639, 7537)
	If GetAreaVanquished() = False Then AggroMoveTo(9064, 7312)
	If GetAreaVanquished() = False Then AggroMoveTo(7986, 4365)
	If GetAreaVanquished() = False Then AggroMoveTo(6341, 3029)
	If GetAreaVanquished() = False Then AggroMoveTo(7097, 92)

	MoveTo(4893, 445)
	RndSleep(2000)
	If GetAreaVanquished() = False Then AggroMoveTo(8943, -985)
	If GetAreaVanquished() = False Then AggroMoveTo(10949, -2056)
	If GetAreaVanquished() = False Then AggroMoveTo(13780, -5667)
	RndSleep(3000)
	RndSleep(3000)
	If GetAreaVanquished() = False Then AggroMoveTo(10752, 991)

	If GetAreaVanquished() = False Then AggroMoveTo(8193, -841)
	RndSleep(5000)
	If GetAreaVanquished() = False Then AggroMoveTo(3284, -1599)
	If GetAreaVanquished() = False Then AggroMoveTo(-76, -1498)
	If GetAreaVanquished() = False Then AggroMoveTo(578, 719)
	If GetAreaVanquished() = False Then AggroMoveTo(316, 2489)
	If GetAreaVanquished() = False Then AggroMoveTo(-1018, -1235)
	If GetAreaVanquished() = False Then AggroMoveTo(-3195, -1538)
	If GetAreaVanquished() = False Then AggroMoveTo(-6322, -2565)

	MoveTo(-9231, -2629)
	RndSleep(4000)

	If GetAreaVanquished() = False Then AggroMoveTo(-11414, 4055)
	If GetAreaVanquished() = False Then AggroMoveTo(-6907, 8461)
	If GetAreaVanquished() = False Then AggroMoveTo(-8689, 11227)
	RndSleep(10000)
	

		If GetAreaVanquished() = False Then AggroMoveTo(4671, -8699)
		If GetAreaVanquished() = False Then AggroMoveTo(-1018, -1235)
		If GetAreaVanquished() = False Then AggroMoveTo(-6322, -2565)
		If GetAreaVanquished() = False Then AggroMoveTo(-8760, -9933)
	



		If  $DeadOnTheRun = 1 then RndSlp(15000)

Until CheckArea(-8689, 11227, 1800000) ;30min leeway to close the bot
MsgBox(48, "VQ DONE", "VQ should be finished. Please check manually and get your carto done. Close the bot or it will reset in 30min")
Sleep(3600000) ;30min leeway to close the bot;30min leeway to close the bot

	If $DeadOnTheRun = 0 Then CurrentAction("Waiting to get reward")
	If $DeadOnTheRun = 0 Then Sleep(3000)
EndFunc