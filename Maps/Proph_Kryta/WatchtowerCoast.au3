#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aWatchtowerCoastOutpostPath[3][2] = [ _
	[18349, -10465], _
	[17407, -10077], _
	[17324, -9489] _
]

Func GoOutWatchtowerCoast()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $WatchtowerCoast_Map Then Return

	If $l_i_Map = $WatchtowerCoast_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> WatchtowerCoast (portal 1)")
		_Vanquisher_RunAggroPortalPath($aWatchtowerCoastOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQWatchtowerCoast()
	If GetMapID() <> $WatchtowerCoast_Map And GetMapID() <> $WatchtowerCoast_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for WatchtowerCoast.")
		TravelTo($WatchtowerCoast_Outpost)
	EndIf

	If GetMapID() = $WatchtowerCoast_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutWatchtowerCoast()
		If GetMapID() <> $WatchtowerCoast_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need WatchtowerCoast (" & $WatchtowerCoast_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $WatchtowerCoast_Map Then
		CurrentAction("WatchtowerCoast route waiting - on map " & GetMapID() & ", need " & $WatchtowerCoast_Map & ".")
		Return
	EndIf

	CurrentAction("Starting WatchtowerCoast vanquish route.")

	Local $aWaypoints[48][4] = [ _
		[15452, -7007, " ", $vqrange], _
		[13011, -4166, " ", $vqrange], _
		[14695, 445, " ", $vqrange], _
		[13606, 6422, " ", $vqrange], _
		[13209, 8833, " ", $vqrange], _
		[11030, 8437, " ", $vqrange], _
		[11492, 6653, " ", $vqrange], _
		[11261, 1270, " ", $vqrange], _
		[8619, -1207, " ", $vqrange], _
		[2872, -2230, " ", $vqrange], _
		[9312, 2228, " ", $vqrange], _
		[8751, 3714, " ", $vqrange], _
		[3863, 2228, " ", $vqrange], _
		[2311, 3318, " ", $vqrange], _
		[7001, 7776, " ", $vqrange], _
		[-1916, 5795, " ", $vqrange], _
		[-2015, -3981, " ", $vqrange], _
		[1948, -5962, " ", $vqrange], _
		[-3931, -4542, " ", $vqrange], _
		[-892, 4705, " ", $vqrange], _
		[-7630, 4210, " ", $vqrange], _
		[-2643, 3219, " ", $vqrange], _
		[-4360, 280, " ", $vqrange], _
		[-7927, 2459, " ", $vqrange], _
		[-8158, -1174, " ", $vqrange], _
		[-4988, -2032, " ", $vqrange], _
		[-6242, -4773, " ", $vqrange], _
		[-10734, -8010, " ", $vqrange], _
		[-15589, -9166, " ", $vqrange], _
		[-19023, -9760, " ", $vqrange], _
		[-15655, -8967, " ", $vqrange], _
		[-10965, -7911, " ", $vqrange], _
		[-4888, -11940, " ", $vqrange], _
		[-7134, -7250, " ", $vqrange], _
		[-5252, -5764, " ", $vqrange], _
		[-6507, -9925, " ", $vqrange], _
		[-3039, -6358, " ", $vqrange], _
		[-3039, -9133, " ", $vqrange], _
		[-3171, -10949, " ", $vqrange], _
		[-265, -11676, " ", $vqrange], _
		[2047, -11411, " ", $vqrange], _
		[3698, -7316, " ", $vqrange], _
		[6868, -7911, " ", $vqrange], _
		[7760, -11973, " ", $vqrange], _
		[10369, -12303, " ", $vqrange], _
		[10105, -9463, " ", $vqrange], _
		[8289, -8505, " ", $vqrange], _
		[12053, -4443, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

