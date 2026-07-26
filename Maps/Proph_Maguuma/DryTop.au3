#include <Array.au3>
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

	Local $aWaypoints[45][4] = [ _
		[4726, -6046, " ", $vqrange], _
		[3652, -6357, " ", $vqrange], _
		[1709, -6960, " ", $vqrange], _
		[150, -6957, " ", $vqrange], _
		[-1465, -6071, " ", $vqrange], _
		[-2973, -6180, " ", $vqrange], _
		[-4743, -4626, " ", $vqrange], _
		[-5546, -3189, " ", $vqrange], _
		[-6116, -1455, " ", $vqrange], _
		[-6942, 221, " ", $vqrange], _
		[-7052, 1744, " ", $vqrange], _
		[-6870, 3675, " ", $vqrange], _
		[-6762, 4836, " ", $vqrange], _
		[-6246, 7872, " ", $vqrange], _
		[-6666, 5394, " ", $vqrange], _
		[-4459, 6750, " ", $vqrange], _
		[-2761, 7679, " ", $vqrange], _
		[-2045, 6834, " ", $vqrange], _
		[-401, 6976, " ", $vqrange], _
		[1153, 6953, " ", $vqrange], _
		[2522, 6652, " ", $vqrange], _
		[1794, 5353, " ", $vqrange], _
		[3262, 3513, " ", $vqrange], _
		[3107, 2892, " ", $vqrange], _
		[6138, 2248, " ", $vqrange], _
		[6528, 4224, " ", $vqrange], _
		[3646, 1677, " ", $vqrange], _
		[1775, 1367, " ", $vqrange], _
		[1210, -191, " ", $vqrange], _
		[2669, -2336, " ", $vqrange], _
		[5369, -2187, " ", $vqrange], _
		[6427, -3114, " ", $vqrange], _
		[5919, -5577, " ", $vqrange], _
		[1639, -7009, " ", $vqrange], _
		[-2905, -6831, " ", $vqrange], _
		[-1896, -6216, " ", $vqrange], _
		[-4104, -3672, " ", $vqrange], _
		[-5428, -3241, " ", $vqrange], _
		[-6134, -1119, " ", $vqrange], _
		[-7154, 3174, " ", $vqrange], _
		[-6772, 5855, " ", $vqrange], _
		[-5742, 6064, " ", $vqrange], _
		[-2241, 7155, " ", $vqrange], _
		[1724, 6378, " ", $vqrange], _
		[4813, 4913, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

