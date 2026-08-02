Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTwinSerpentLakesOutpostPath[4][2] = [ _
	[-20183, 10506], _
	[-18896, 12390], _
	[-16812, 13585], _
	[-16612, 13585] _
]

Global $aProph_Kryta_TwinSerpentLakesRoute01[59][2] = [ _
        [-3283, -19532], _
        [-1025, -14423], _
        [-5383, -12959], _
        [-6837, -12938], _
        [-5269, -10803], _
        [-4180, -8806], _
        [-7459, -7918], _
        [-7314, -5004], _
        [-7260, -1537], _
        [-5765, -246], _
        [-4722, 2951], _
        [-7164, 4446], _
        [-6170, 6072], _
        [-5580, 4193], _
        [-7627, 9236], _
        [-7378, 11781], _
        [-6985, 13468], _
        [-6755, 14363], _
        [-4186, 15450], _
        [-6977, 16130], _
        [-6759, 18749], _
        [-7445, 22211], _
        [-7418, 21231], _
        [-3719, 19223], _
        [-1495, 17257], _
        [-225, 15508], _
        [1851, 13088], _
        [1284, 10680], _
        [443, 10030], _
        [3394, 12902], _
        [3729, 14404], _
        [2082, 19864], _
        [4220, 14910], _
        [2471, 13104], _
        [5571, 9667], _
        [6325, 7938], _
        [6947, 8930], _
        [3416, 11148], _
        [1053, 10216], _
        [5104, 4231], _
        [6361, -336], _
        [4964, -3964], _
        [3353, -5873], _
        [2477, -4192], _
        [4719, -6641], _
        [4520, -7882], _
        [4941, -11123], _
        [7176, -14002], _
        [1195, -12633], _
        [2525, -5997], _
        [2225, -3778], _
        [-900, -4527], _
        [-4399, -7300], _
        [-6666, -2761], _
        [-4806, 901], _
        [-1395, 3279], _
        [-1866, 6989], _
        [-3370, 9011], _
        [-2252, 12553] _
]

Global $aProph_Kryta_TwinSerpentLakesRoute02[59][2] = [ _
        [-2252, 12553], _
        [-3370, 9011], _
        [-1866, 6989], _
        [-1395, 3279], _
        [-4806, 901], _
        [-6666, -2761], _
        [-4399, -7300], _
        [-900, -4527], _
        [2225, -3778], _
        [2525, -5997], _
        [1195, -12633], _
        [7176, -14002], _
        [4941, -11123], _
        [4520, -7882], _
        [4719, -6641], _
        [2477, -4192], _
        [3353, -5873], _
        [4964, -3964], _
        [6361, -336], _
        [5104, 4231], _
        [1053, 10216], _
        [3416, 11148], _
        [6947, 8930], _
        [6325, 7938], _
        [5571, 9667], _
        [2471, 13104], _
        [4220, 14910], _
        [2082, 19864], _
        [3729, 14404], _
        [3394, 12902], _
        [443, 10030], _
        [1284, 10680], _
        [1851, 13088], _
        [-225, 15508], _
        [-1495, 17257], _
        [-3719, 19223], _
        [-7418, 21231], _
        [-7445, 22211], _
        [-6759, 18749], _
        [-6977, 16130], _
        [-4186, 15450], _
        [-6755, 14363], _
        [-6985, 13468], _
        [-7378, 11781], _
        [-7627, 9236], _
        [-5580, 4193], _
        [-6170, 6072], _
        [-7164, 4446], _
        [-4722, 2951], _
        [-5765, -246], _
        [-7260, -1537], _
        [-7314, -5004], _
        [-7459, -7918], _
        [-4180, -8806], _
        [-5269, -10803], _
        [-6837, -12938], _
        [-5383, -12959], _
        [-1025, -14423], _
        [-3283, -19532] _
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


	_Vanquisher_RunVanquishRoute($aProph_Kryta_TwinSerpentLakesRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_TwinSerpentLakesRoute02)
EndFunc

