Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTwinSerpentLakesOutpostPath[4][2] = [ _
	[-20183, 10506], _
	[-18896, 12390], _
	[-16812, 13585], _
	[-16612, 13585] _
]

Func GoOutTwinSerpentLakes()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TwinSerpentLakes_Map Then Return

	If $l_i_Map = $TwinSerpentLakes_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TwinSerpentLakes (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTwinSerpentLakesOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTwinSerpentLakes()
	If GetMapID() <> $TwinSerpentLakes_Map And GetMapID() <> $TwinSerpentLakes_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TwinSerpentLakes.")
		TravelTo($TwinSerpentLakes_Outpost)
	EndIf

	If GetMapID() = $TwinSerpentLakes_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTwinSerpentLakes()
		If GetMapID() <> $TwinSerpentLakes_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TwinSerpentLakes (" & $TwinSerpentLakes_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TwinSerpentLakes_Map Then
		CurrentAction("TwinSerpentLakes route waiting - on map " & GetMapID() & ", need " & $TwinSerpentLakes_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TwinSerpentLakes vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-3283, -19532)
	If GetAreaVanquished() = False Then AggroMoveTo(-1025, -14423)
	If GetAreaVanquished() = False Then AggroMoveTo(-5383, -12959)
	If GetAreaVanquished() = False Then AggroMoveTo(-6837, -12938)
	If GetAreaVanquished() = False Then AggroMoveTo(-5269, -10803)
	If GetAreaVanquished() = False Then AggroMoveTo(-4180, -8806)
	If GetAreaVanquished() = False Then AggroMoveTo(-7459, -7918)
	If GetAreaVanquished() = False Then AggroMoveTo(-7314, -5004)
	If GetAreaVanquished() = False Then AggroMoveTo(-7260, -1537)
	If GetAreaVanquished() = False Then AggroMoveTo(-5765, -246)
	If GetAreaVanquished() = False Then AggroMoveTo(-4722, 2951)
	If GetAreaVanquished() = False Then AggroMoveTo(-7164, 4446)
	If GetAreaVanquished() = False Then AggroMoveTo(-6170, 6072)
	If GetAreaVanquished() = False Then AggroMoveTo(-5580, 4193)
	If GetAreaVanquished() = False Then AggroMoveTo(-7627, 9236)
	If GetAreaVanquished() = False Then AggroMoveTo(-7378, 11781)
	If GetAreaVanquished() = False Then AggroMoveTo(-6985, 13468)
	If GetAreaVanquished() = False Then AggroMoveTo(-6755, 14363)
	If GetAreaVanquished() = False Then AggroMoveTo(-4186, 15450)
	If GetAreaVanquished() = False Then AggroMoveTo(-6977, 16130)
	If GetAreaVanquished() = False Then AggroMoveTo(-6759, 18749)
	If GetAreaVanquished() = False Then AggroMoveTo(-7445, 22211)
	If GetAreaVanquished() = False Then AggroMoveTo(-7418, 21231)
	If GetAreaVanquished() = False Then AggroMoveTo(-3719, 19223)
	If GetAreaVanquished() = False Then AggroMoveTo(-1495, 17257)
	If GetAreaVanquished() = False Then AggroMoveTo(-225, 15508)
	If GetAreaVanquished() = False Then AggroMoveTo(1851, 13088)
	If GetAreaVanquished() = False Then AggroMoveTo(1284, 10680)
	If GetAreaVanquished() = False Then AggroMoveTo(443, 10030)
	If GetAreaVanquished() = False Then AggroMoveTo(3394, 12902)
	If GetAreaVanquished() = False Then AggroMoveTo(3729, 14404)
	If GetAreaVanquished() = False Then AggroMoveTo(2082, 19864)
	If GetAreaVanquished() = False Then AggroMoveTo(4220, 14910)
	If GetAreaVanquished() = False Then AggroMoveTo(2471, 13104)
	If GetAreaVanquished() = False Then AggroMoveTo(5571, 9667)
	If GetAreaVanquished() = False Then AggroMoveTo(6325, 7938)
	If GetAreaVanquished() = False Then AggroMoveTo(6947, 8930)
	If GetAreaVanquished() = False Then AggroMoveTo(3416, 11148)
	If GetAreaVanquished() = False Then AggroMoveTo(1053, 10216)
	If GetAreaVanquished() = False Then AggroMoveTo(5104, 4231)
	If GetAreaVanquished() = False Then AggroMoveTo(6361, -336)
	If GetAreaVanquished() = False Then AggroMoveTo(4964, -3964)
	If GetAreaVanquished() = False Then AggroMoveTo(3353, -5873)
	If GetAreaVanquished() = False Then AggroMoveTo(2477, -4192)
	If GetAreaVanquished() = False Then AggroMoveTo(4719, -6641)
	If GetAreaVanquished() = False Then AggroMoveTo(4520, -7882)
	If GetAreaVanquished() = False Then AggroMoveTo(4941, -11123)
	If GetAreaVanquished() = False Then AggroMoveTo(7176, -14002)
	If GetAreaVanquished() = False Then AggroMoveTo(1195, -12633)
	If GetAreaVanquished() = False Then AggroMoveTo(2525, -5997)
	If GetAreaVanquished() = False Then AggroMoveTo(2225, -3778)
	If GetAreaVanquished() = False Then AggroMoveTo(-900, -4527)
	If GetAreaVanquished() = False Then AggroMoveTo(-4399, -7300)
	If GetAreaVanquished() = False Then AggroMoveTo(-6666, -2761)
	If GetAreaVanquished() = False Then AggroMoveTo(-4806, 901)
	If GetAreaVanquished() = False Then AggroMoveTo(-1395, 3279)
	If GetAreaVanquished() = False Then AggroMoveTo(-1866, 6989)
	If GetAreaVanquished() = False Then AggroMoveTo(-3370, 9011)
	If GetAreaVanquished() = False Then AggroMoveTo(-2252, 12553)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-2252, 12553)
	If GetAreaVanquished() = False Then AggroMoveTo(-3370, 9011)
	If GetAreaVanquished() = False Then AggroMoveTo(-1866, 6989)
	If GetAreaVanquished() = False Then AggroMoveTo(-1395, 3279)
	If GetAreaVanquished() = False Then AggroMoveTo(-4806, 901)
	If GetAreaVanquished() = False Then AggroMoveTo(-6666, -2761)
	If GetAreaVanquished() = False Then AggroMoveTo(-4399, -7300)
	If GetAreaVanquished() = False Then AggroMoveTo(-900, -4527)
	If GetAreaVanquished() = False Then AggroMoveTo(2225, -3778)
	If GetAreaVanquished() = False Then AggroMoveTo(2525, -5997)
	If GetAreaVanquished() = False Then AggroMoveTo(1195, -12633)
	If GetAreaVanquished() = False Then AggroMoveTo(7176, -14002)
	If GetAreaVanquished() = False Then AggroMoveTo(4941, -11123)
	If GetAreaVanquished() = False Then AggroMoveTo(4520, -7882)
	If GetAreaVanquished() = False Then AggroMoveTo(4719, -6641)
	If GetAreaVanquished() = False Then AggroMoveTo(2477, -4192)
	If GetAreaVanquished() = False Then AggroMoveTo(3353, -5873)
	If GetAreaVanquished() = False Then AggroMoveTo(4964, -3964)
	If GetAreaVanquished() = False Then AggroMoveTo(6361, -336)
	If GetAreaVanquished() = False Then AggroMoveTo(5104, 4231)
	If GetAreaVanquished() = False Then AggroMoveTo(1053, 10216)
	If GetAreaVanquished() = False Then AggroMoveTo(3416, 11148)
	If GetAreaVanquished() = False Then AggroMoveTo(6947, 8930)
	If GetAreaVanquished() = False Then AggroMoveTo(6325, 7938)
	If GetAreaVanquished() = False Then AggroMoveTo(5571, 9667)
	If GetAreaVanquished() = False Then AggroMoveTo(2471, 13104)
	If GetAreaVanquished() = False Then AggroMoveTo(4220, 14910)
	If GetAreaVanquished() = False Then AggroMoveTo(2082, 19864)
	If GetAreaVanquished() = False Then AggroMoveTo(3729, 14404)
	If GetAreaVanquished() = False Then AggroMoveTo(3394, 12902)
	If GetAreaVanquished() = False Then AggroMoveTo(443, 10030)
	If GetAreaVanquished() = False Then AggroMoveTo(1284, 10680)
	If GetAreaVanquished() = False Then AggroMoveTo(1851, 13088)
	If GetAreaVanquished() = False Then AggroMoveTo(-225, 15508)
	If GetAreaVanquished() = False Then AggroMoveTo(-1495, 17257)
	If GetAreaVanquished() = False Then AggroMoveTo(-3719, 19223)
	If GetAreaVanquished() = False Then AggroMoveTo(-7418, 21231)
	If GetAreaVanquished() = False Then AggroMoveTo(-7445, 22211)
	If GetAreaVanquished() = False Then AggroMoveTo(-6759, 18749)
	If GetAreaVanquished() = False Then AggroMoveTo(-6977, 16130)
	If GetAreaVanquished() = False Then AggroMoveTo(-4186, 15450)
	If GetAreaVanquished() = False Then AggroMoveTo(-6755, 14363)
	If GetAreaVanquished() = False Then AggroMoveTo(-6985, 13468)
	If GetAreaVanquished() = False Then AggroMoveTo(-7378, 11781)
	If GetAreaVanquished() = False Then AggroMoveTo(-7627, 9236)
	If GetAreaVanquished() = False Then AggroMoveTo(-5580, 4193)
	If GetAreaVanquished() = False Then AggroMoveTo(-6170, 6072)
	If GetAreaVanquished() = False Then AggroMoveTo(-7164, 4446)
	If GetAreaVanquished() = False Then AggroMoveTo(-4722, 2951)
	If GetAreaVanquished() = False Then AggroMoveTo(-5765, -246)
	If GetAreaVanquished() = False Then AggroMoveTo(-7260, -1537)
	If GetAreaVanquished() = False Then AggroMoveTo(-7314, -5004)
	If GetAreaVanquished() = False Then AggroMoveTo(-7459, -7918)
	If GetAreaVanquished() = False Then AggroMoveTo(-4180, -8806)
	If GetAreaVanquished() = False Then AggroMoveTo(-5269, -10803)
	If GetAreaVanquished() = False Then AggroMoveTo(-6837, -12938)
	If GetAreaVanquished() = False Then AggroMoveTo(-5383, -12959)
	If GetAreaVanquished() = False Then AggroMoveTo(-1025, -14423)
	If GetAreaVanquished() = False Then AggroMoveTo(-3283, -19532)
EndFunc

