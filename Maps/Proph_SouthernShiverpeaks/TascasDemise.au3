Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTascasDemiseOutpostPath[2][2] = [ _
	[-10030, 18833], _
	[-9797, 19027] _
]

Func GoOutTascasDemise()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TascasDemise_Map Then Return

	If $l_i_Map = $TascasDemise_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TascasDemise (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTascasDemiseOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTascasDemise()
	If GetMapID() <> $TascasDemise_Map And GetMapID() <> $TascasDemise_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TascasDemise.")
		TravelTo($TascasDemise_Outpost)
	EndIf

	If GetMapID() = $TascasDemise_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTascasDemise()
		If GetMapID() <> $TascasDemise_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TascasDemise (" & $TascasDemise_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TascasDemise_Map Then
		CurrentAction("TascasDemise route waiting - on map " & GetMapID() & ", need " & $TascasDemise_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TascasDemise vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-7318, 20765)
	If GetAreaVanquished() = False Then AggroMoveTo(-4967, 20426)
	If GetAreaVanquished() = False Then AggroMoveTo(-1199, 17061)
	If GetAreaVanquished() = False Then AggroMoveTo(534, 17369)
	If GetAreaVanquished() = False Then AggroMoveTo(1271, 20404)
	If GetAreaVanquished() = False Then AggroMoveTo(6097, 21830)
	If GetAreaVanquished() = False Then AggroMoveTo(4555, 25630)
	If GetAreaVanquished() = False Then AggroMoveTo(4131, 27041)
	If GetAreaVanquished() = False Then AggroMoveTo(5634, 28532)
	If GetAreaVanquished() = False Then AggroMoveTo(6247, 27996)
	If GetAreaVanquished() = False Then AggroMoveTo(7535, 26067)
	If GetAreaVanquished() = False Then AggroMoveTo(10512, 26634)
	If GetAreaVanquished() = False Then AggroMoveTo(12902, 24369)
	If GetAreaVanquished() = False Then AggroMoveTo(13015, 21309)
	If GetAreaVanquished() = False Then AggroMoveTo(10944, 18776)
	If GetAreaVanquished() = False Then AggroMoveTo(9210, 15807)
	If GetAreaVanquished() = False Then AggroMoveTo(8611, 15439)
	If GetAreaVanquished() = False Then AggroMoveTo(7336, 17215)
	If GetAreaVanquished() = False Then AggroMoveTo(6205, 17276)
	If GetAreaVanquished() = False Then AggroMoveTo(8441, 15381)
	If GetAreaVanquished() = False Then AggroMoveTo(5275, 14300)
	If GetAreaVanquished() = False Then AggroMoveTo(3529, 14567)
	If GetAreaVanquished() = False Then AggroMoveTo(1176, 16920)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(1176, 16920)
	If GetAreaVanquished() = False Then AggroMoveTo(3529, 14567)
	If GetAreaVanquished() = False Then AggroMoveTo(5275, 14300)
	If GetAreaVanquished() = False Then AggroMoveTo(8441, 15381)
	If GetAreaVanquished() = False Then AggroMoveTo(6205, 17276)
	If GetAreaVanquished() = False Then AggroMoveTo(7336, 17215)
	If GetAreaVanquished() = False Then AggroMoveTo(8611, 15439)
	If GetAreaVanquished() = False Then AggroMoveTo(9210, 15807)
	If GetAreaVanquished() = False Then AggroMoveTo(10944, 18776)
	If GetAreaVanquished() = False Then AggroMoveTo(13015, 21309)
	If GetAreaVanquished() = False Then AggroMoveTo(12902, 24369)
	If GetAreaVanquished() = False Then AggroMoveTo(10512, 26634)
	If GetAreaVanquished() = False Then AggroMoveTo(7535, 26067)
	If GetAreaVanquished() = False Then AggroMoveTo(6247, 27996)
	If GetAreaVanquished() = False Then AggroMoveTo(5634, 28532)
	If GetAreaVanquished() = False Then AggroMoveTo(4131, 27041)
	If GetAreaVanquished() = False Then AggroMoveTo(4555, 25630)
	If GetAreaVanquished() = False Then AggroMoveTo(6097, 21830)
	If GetAreaVanquished() = False Then AggroMoveTo(1271, 20404)
	If GetAreaVanquished() = False Then AggroMoveTo(534, 17369)
	If GetAreaVanquished() = False Then AggroMoveTo(-1199, 17061)
	If GetAreaVanquished() = False Then AggroMoveTo(-4967, 20426)
	If GetAreaVanquished() = False Then AggroMoveTo(-7318, 20765)
EndFunc

