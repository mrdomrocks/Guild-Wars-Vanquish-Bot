#include <Array.au3>
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

	Local $aWaypoints[55][4] = [ _
		[8625, 21923, " ", $vqrange], _
		[5919, 21200, " ", $vqrange], _
		[6705, 14475, " ", $vqrange], _
		[3860, 13340, " ", $vqrange], _
		[2367, 10037, " ", $vqrange], _
		[1853, 7655, " ", $vqrange], _
		[1375, 4976, " ", $vqrange], _
		[2700, 3089, " ", $vqrange], _
		[264, 3406, " ", $vqrange], _
		[-2823, 4276, " ", $vqrange], _
		[-4595, 10987, " ", $vqrange], _
		[-5643, 13409, " ", $vqrange], _
		[-10953, 14977, " ", $vqrange], _
		[-10974, 16060, " ", $vqrange], _
		[-7982, 15702, " ", $vqrange], _
		[-3496, 14288, " ", $vqrange], _
		[-6478, 15542, " ", $vqrange], _
		[-13533, 15707, " ", $vqrange], _
		[-14716, 11271, " ", $vqrange], _
		[-13615, 10133, " ", $vqrange], _
		[-11311, 11359, " ", $vqrange], _
		[-10677, 10090, " ", $vqrange], _
		[-8493, 10911, " ", $vqrange], _
		[-11506, 7051, " ", $vqrange], _
		[-11535, 4835, " ", $vqrange], _
		[-13372, 6934, " ", $vqrange], _
		[-15888, 8854, " ", $vqrange], _
		[-17305, 9577, " ", $vqrange], _
		[-14451, 4310, " ", $vqrange], _
		[-15661, 986, " ", $vqrange], _
		[-15321, -957, " ", $vqrange], _
		[-14037, -3098, " ", $vqrange], _
		[-10397, -4716, " ", $vqrange], _
		[-6498, -3883, " ", $vqrange], _
		[-1295, -3987, " ", $vqrange], _
		[998, -5239, " ", $vqrange], _
		[1632, -6769, " ", $vqrange], _
		[4040, -7515, " ", $vqrange], _
		[3784, -11613, " ", $vqrange], _
		[2975, -11703, " ", $vqrange], _
		[1840, -12742, " ", $vqrange], _
		[-734, -11602, " ", $vqrange], _
		[-1048, -9676, " ", $vqrange], _
		[-2253, -10660, " ", $vqrange], _
		[-7504, -10865, " ", $vqrange], _
		[-9426, -9419, " ", $vqrange], _
		[-7425, -10893, " ", $vqrange], _
		[-6162, -7935, " ", $vqrange], _
		[-6483, -6746, " ", $vqrange], _
		[-7364, -7458, " ", $vqrange], _
		[-14061, -5047, " ", $vqrange], _
		[-14660, -6170, " ", $vqrange], _
		[-13074, -6245, " ", $vqrange], _
		[-12869, -7626, " ", $vqrange], _
		[-9454, -8018, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

