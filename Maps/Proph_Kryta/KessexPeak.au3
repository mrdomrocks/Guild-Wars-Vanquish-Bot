Global $vqrange = 1450
Global $ActionCounter = 1

Global $aKessexPeakOutpostPath[2][2] = [ _
	[-5199, 16327], _
	[-5252, 15997] _
]

Global $aKessexPeakTransitPath[12][2] = [ _
	[-5241, 15182], _
	[-6837, 11715], _
	[-7152, 7351], _
	[156, 2791], _
	[1680, 496], _
	[-3802, -4905], _
	[-5955, -9211], _
	[-753, -10986], _
	[7797, -13034], _
	[8548, -17166], _
	[7834, -18238], _
	[6093, -18015] _
]

Global $aProph_Kryta_KessexPeakRoute01[55][2] = [ _
        [8625, 21923], _
        [5919, 21200], _
        [6705, 14475], _
        [3860, 13340], _
        [2367, 10037], _
        [1853, 7655], _
        [1375, 4976], _
        [2700, 3089], _
        [264, 3406], _
        [-2823, 4276], _
        [-4595, 10987], _
        [-5643, 13409], _
        [-10953, 14977], _
        [-10974, 16060], _
        [-7982, 15702], _
        [-3496, 14288], _
        [-6478, 15542], _
        [-13533, 15707], _
        [-14716, 11271], _
        [-13615, 10133], _
        [-11311, 11359], _
        [-10677, 10090], _
        [-8493, 10911], _
        [-11506, 7051], _
        [-11535, 4835], _
        [-13372, 6934], _
        [-15888, 8854], _
        [-17305, 9577], _
        [-14451, 4310], _
        [-15661, 986], _
        [-15321, -957], _
        [-14037, -3098], _
        [-10397, -4716], _
        [-6498, -3883], _
        [-1295, -3987], _
        [998, -5239], _
        [1632, -6769], _
        [4040, -7515], _
        [3784, -11613], _
        [2975, -11703], _
        [1840, -12742], _
        [-734, -11602], _
        [-1048, -9676], _
        [-2253, -10660], _
        [-7504, -10865], _
        [-9426, -9419], _
        [-7425, -10893], _
        [-6162, -7935], _
        [-6483, -6746], _
        [-7364, -7458], _
        [-14061, -5047], _
        [-14660, -6170], _
        [-13074, -6245], _
        [-12869, -7626], _
        [-9454, -8018] _
]

Global $aProph_Kryta_KessexPeakRoute02[55][2] = [ _
        [-9454, -8018], _
        [-12869, -7626], _
        [-13074, -6245], _
        [-14660, -6170], _
        [-14061, -5047], _
        [-7364, -7458], _
        [-6483, -6746], _
        [-6162, -7935], _
        [-7425, -10893], _
        [-9426, -9419], _
        [-7504, -10865], _
        [-2253, -10660], _
        [-1048, -9676], _
        [-734, -11602], _
        [1840, -12742], _
        [2975, -11703], _
        [3784, -11613], _
        [4040, -7515], _
        [1632, -6769], _
        [998, -5239], _
        [-1295, -3987], _
        [-6498, -3883], _
        [-10397, -4716], _
        [-14037, -3098], _
        [-15321, -957], _
        [-15661, 986], _
        [-14451, 4310], _
        [-17305, 9577], _
        [-15888, 8854], _
        [-13372, 6934], _
        [-11535, 4835], _
        [-11506, 7051], _
        [-8493, 10911], _
        [-10677, 10090], _
        [-11311, 11359], _
        [-13615, 10133], _
        [-14716, 11271], _
        [-13533, 15707], _
        [-6478, 15542], _
        [-3496, 14288], _
        [-7982, 15702], _
        [-10974, 16060], _
        [-10953, 14977], _
        [-5643, 13409], _
        [-4595, 10987], _
        [-2823, 4276], _
        [264, 3406], _
        [2700, 3089], _
        [1375, 4976], _
        [1853, 7655], _
        [2367, 10037], _
        [3860, 13340], _
        [6705, 14475], _
        [5919, 21200], _
        [8625, 21923] _
]

Func GoOutKessexPeak()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $KessexPeak_Map Then Return

	If $l_i_Map = $KessexPeak_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> KessexPeak (portal 1)")
		_Vanquisher_RunAggroPortalPath($aKessexPeakOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $KessexPeak_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> KessexPeak (portal 2)")
		_Vanquisher_RunAggroPortalPath($aKessexPeakTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQKessexPeak()
	If GetMapID() <> $KessexPeak_Map And GetMapID() <> $KessexPeak_Outpost And GetMapID() <> $KessexPeak_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for KessexPeak.")
		TravelTo($KessexPeak_Outpost)
	EndIf

	If GetMapID() = $KessexPeak_Outpost Or GetMapID() = $KessexPeak_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutKessexPeak()
		If GetMapID() <> $KessexPeak_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need KessexPeak (" & $KessexPeak_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $KessexPeak_Map Then
		CurrentAction("KessexPeak route waiting - on map " & GetMapID() & ", need " & $KessexPeak_Map & ".")
		Return
	EndIf

	CurrentAction("Starting KessexPeak vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_Kryta_KessexPeakRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_KessexPeakRoute02)
EndFunc

