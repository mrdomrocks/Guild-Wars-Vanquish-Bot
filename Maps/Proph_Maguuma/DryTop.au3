Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDryTopOutpostPath[2][2] = [ _
	[852, -10457], _
	[409, -9585] _
]

Global $aDryTopTransitPath[14][2] = [ _
	[370, -8607], _
	[-504, -7172], _
	[-5166, -8089], _
	[-14358, -7670], _
	[-21665, -6642], _
	[-25990, -6089], _
	[-24347, -3944], _
	[-23878, -3055], _
	[-22788, -1094], _
	[-21448, -1480], _
	[-21582, 2107], _
	[-18948, 3362], _
	[-19327, 4362], _
	[-19513, 4863] _
]

Func GoOutDryTop()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DryTop_Map Then Return

	If $l_i_Map = $DryTop_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DryTop (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDryTopOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $DryTop_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> DryTop (portal 2)")
		_Vanquisher_RunAggroPortalPath($aDryTopTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDryTop()
	If GetMapID() <> $DryTop_Map And GetMapID() <> $DryTop_Outpost And GetMapID() <> $DryTop_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DryTop.")
		TravelTo($DryTop_Outpost)
	EndIf

	If GetMapID() = $DryTop_Outpost Or GetMapID() = $DryTop_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutDryTop()
		If GetMapID() <> $DryTop_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DryTop (" & $DryTop_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DryTop_Map Then
		CurrentAction("DryTop route waiting - on map " & GetMapID() & ", need " & $DryTop_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DryTop vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(4726, -6046)
	If GetAreaVanquished() = False Then AggroMoveTo(3652, -6357)
	If GetAreaVanquished() = False Then AggroMoveTo(1709, -6960)
	If GetAreaVanquished() = False Then AggroMoveTo(150, -6957)
	If GetAreaVanquished() = False Then AggroMoveTo(-1465, -6071)
	If GetAreaVanquished() = False Then AggroMoveTo(-2973, -6180)
	If GetAreaVanquished() = False Then AggroMoveTo(-4743, -4626)
	If GetAreaVanquished() = False Then AggroMoveTo(-5546, -3189)
	If GetAreaVanquished() = False Then AggroMoveTo(-6116, -1455)
	If GetAreaVanquished() = False Then AggroMoveTo(-6942, 221)
	If GetAreaVanquished() = False Then AggroMoveTo(-7052, 1744)
	If GetAreaVanquished() = False Then AggroMoveTo(-6870, 3675)
	If GetAreaVanquished() = False Then AggroMoveTo(-6762, 4836)
	If GetAreaVanquished() = False Then AggroMoveTo(-6246, 7872)
	If GetAreaVanquished() = False Then AggroMoveTo(-6666, 5394)
	If GetAreaVanquished() = False Then AggroMoveTo(-4459, 6750)
	If GetAreaVanquished() = False Then AggroMoveTo(-2761, 7679)
	If GetAreaVanquished() = False Then AggroMoveTo(-2045, 6834)
	If GetAreaVanquished() = False Then AggroMoveTo(-401, 6976)
	If GetAreaVanquished() = False Then AggroMoveTo(1153, 6953)
	If GetAreaVanquished() = False Then AggroMoveTo(2522, 6652)
	If GetAreaVanquished() = False Then AggroMoveTo(1794, 5353)
	If GetAreaVanquished() = False Then AggroMoveTo(3262, 3513)
	If GetAreaVanquished() = False Then AggroMoveTo(3107, 2892)
	If GetAreaVanquished() = False Then AggroMoveTo(6138, 2248)
	If GetAreaVanquished() = False Then AggroMoveTo(6528, 4224)
	If GetAreaVanquished() = False Then AggroMoveTo(3646, 1677)
	If GetAreaVanquished() = False Then AggroMoveTo(1775, 1367)
	If GetAreaVanquished() = False Then AggroMoveTo(1210, -191)
	If GetAreaVanquished() = False Then AggroMoveTo(2669, -2336)
	If GetAreaVanquished() = False Then AggroMoveTo(5369, -2187)
	If GetAreaVanquished() = False Then AggroMoveTo(6427, -3114)
	If GetAreaVanquished() = False Then AggroMoveTo(5919, -5577)
	If GetAreaVanquished() = False Then AggroMoveTo(1639, -7009)
	If GetAreaVanquished() = False Then AggroMoveTo(-2905, -6831)
	If GetAreaVanquished() = False Then AggroMoveTo(-1896, -6216)
	If GetAreaVanquished() = False Then AggroMoveTo(-4104, -3672)
	If GetAreaVanquished() = False Then AggroMoveTo(-5428, -3241)
	If GetAreaVanquished() = False Then AggroMoveTo(-6134, -1119)
	If GetAreaVanquished() = False Then AggroMoveTo(-7154, 3174)
	If GetAreaVanquished() = False Then AggroMoveTo(-6772, 5855)
	If GetAreaVanquished() = False Then AggroMoveTo(-5742, 6064)
	If GetAreaVanquished() = False Then AggroMoveTo(-2241, 7155)
	If GetAreaVanquished() = False Then AggroMoveTo(1724, 6378)
	If GetAreaVanquished() = False Then AggroMoveTo(4813, 4913)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(4813, 4913)
	If GetAreaVanquished() = False Then AggroMoveTo(1724, 6378)
	If GetAreaVanquished() = False Then AggroMoveTo(-2241, 7155)
	If GetAreaVanquished() = False Then AggroMoveTo(-5742, 6064)
	If GetAreaVanquished() = False Then AggroMoveTo(-6772, 5855)
	If GetAreaVanquished() = False Then AggroMoveTo(-7154, 3174)
	If GetAreaVanquished() = False Then AggroMoveTo(-6134, -1119)
	If GetAreaVanquished() = False Then AggroMoveTo(-5428, -3241)
	If GetAreaVanquished() = False Then AggroMoveTo(-4104, -3672)
	If GetAreaVanquished() = False Then AggroMoveTo(-1896, -6216)
	If GetAreaVanquished() = False Then AggroMoveTo(-2905, -6831)
	If GetAreaVanquished() = False Then AggroMoveTo(1639, -7009)
	If GetAreaVanquished() = False Then AggroMoveTo(5919, -5577)
	If GetAreaVanquished() = False Then AggroMoveTo(6427, -3114)
	If GetAreaVanquished() = False Then AggroMoveTo(5369, -2187)
	If GetAreaVanquished() = False Then AggroMoveTo(2669, -2336)
	If GetAreaVanquished() = False Then AggroMoveTo(1210, -191)
	If GetAreaVanquished() = False Then AggroMoveTo(1775, 1367)
	If GetAreaVanquished() = False Then AggroMoveTo(3646, 1677)
	If GetAreaVanquished() = False Then AggroMoveTo(6528, 4224)
	If GetAreaVanquished() = False Then AggroMoveTo(6138, 2248)
	If GetAreaVanquished() = False Then AggroMoveTo(3107, 2892)
	If GetAreaVanquished() = False Then AggroMoveTo(3262, 3513)
	If GetAreaVanquished() = False Then AggroMoveTo(1794, 5353)
	If GetAreaVanquished() = False Then AggroMoveTo(2522, 6652)
	If GetAreaVanquished() = False Then AggroMoveTo(1153, 6953)
	If GetAreaVanquished() = False Then AggroMoveTo(-401, 6976)
	If GetAreaVanquished() = False Then AggroMoveTo(-2045, 6834)
	If GetAreaVanquished() = False Then AggroMoveTo(-2761, 7679)
	If GetAreaVanquished() = False Then AggroMoveTo(-4459, 6750)
	If GetAreaVanquished() = False Then AggroMoveTo(-6666, 5394)
	If GetAreaVanquished() = False Then AggroMoveTo(-6246, 7872)
	If GetAreaVanquished() = False Then AggroMoveTo(-6762, 4836)
	If GetAreaVanquished() = False Then AggroMoveTo(-6870, 3675)
	If GetAreaVanquished() = False Then AggroMoveTo(-7052, 1744)
	If GetAreaVanquished() = False Then AggroMoveTo(-6942, 221)
	If GetAreaVanquished() = False Then AggroMoveTo(-6116, -1455)
	If GetAreaVanquished() = False Then AggroMoveTo(-5546, -3189)
	If GetAreaVanquished() = False Then AggroMoveTo(-4743, -4626)
	If GetAreaVanquished() = False Then AggroMoveTo(-2973, -6180)
	If GetAreaVanquished() = False Then AggroMoveTo(-1465, -6071)
	If GetAreaVanquished() = False Then AggroMoveTo(150, -6957)
	If GetAreaVanquished() = False Then AggroMoveTo(1709, -6960)
	If GetAreaVanquished() = False Then AggroMoveTo(3652, -6357)
	If GetAreaVanquished() = False Then AggroMoveTo(4726, -6046)
EndFunc

