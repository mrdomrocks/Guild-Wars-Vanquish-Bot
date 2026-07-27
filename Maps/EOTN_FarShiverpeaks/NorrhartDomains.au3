#RequireAdmin
#NoTrayIcon



Func GoOutNorrhartDomains()
        Local $aGoOutRoute[2][2] = [ [1683, -1594] _
                , [4600, -27863] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "NorrhartDomains exit ")
EndFunc

Func VQNorrhartDomains() ;Add VQ name

	;This block is to pick up blessings. Add NPC coords and the right dialogue
	;~ GoNearestNPCToCoords(, )
	;~ Dialog(0x85)
	;~ Sleep(1000)
	;~ Dialog(0x86)
	;~ Sleep(1000)

Do

		$DeadOnTheRun = 0
		If GetAreaVanquished() = False Then AggroMoveTo( , )



		If  $DeadOnTheRun = 1 then RndSlp(15000)

	Until CheckArea( , , 1800000) ;30min leeway to close the bot

	If $DeadOnTheRun = 0 Then CurrentAction("Waiting to get reward")
	If $DeadOnTheRun = 0 Then Sleep(3000)
EndFunc