#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDivinersAscentOutpostPath[2][2] = [ _
	[16763, 6828], _
	[17024, 6837] _
]

Func GoOutDivinersAscent()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DivinersAscent_Map Then Return

	If $l_i_Map = $DivinersAscent_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DivinersAscent (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDivinersAscentOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDivinersAscent()
	If GetMapID() <> $DivinersAscent_Map And GetMapID() <> $DivinersAscent_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DivinersAscent.")
		TravelTo($DivinersAscent_Outpost)
	EndIf

	If GetMapID() = $DivinersAscent_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutDivinersAscent()
		If GetMapID() <> $DivinersAscent_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DivinersAscent (" & $DivinersAscent_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DivinersAscent_Map Then
		CurrentAction("DivinersAscent route waiting - on map " & GetMapID() & ", need " & $DivinersAscent_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DivinersAscent vanquish route.")

	Local $aWaypoints[56][4] = [ _
		[-5681, 3541, " ", $vqrange], _
		[-2632, 6401, " ", $vqrange], _
		[-1332, 8504, " ", $vqrange], _
		[2519, 13932, " ", $vqrange], _
		[-1231, 15836, " ", $vqrange], _
		[-5212, 19298, " ", $vqrange], _
		[-6751, 17911, " ", $vqrange], _
		[-7880, 14906, " ", $vqrange], _
		[-8231, 12809, " ", $vqrange], _
		[-9580, 10883, " ", $vqrange], _
		[-13214, 9329, " ", $vqrange], _
		[-14894, 8123, " ", $vqrange], _
		[-15369, 12149, " ", $vqrange], _
		[-17472, 16823, " ", $vqrange], _
		[-13825, 9052, " ", $vqrange], _
		[-6590, 13329, " ", $vqrange], _
		[-4332, 16058, " ", $vqrange], _
		[1896, 16690, " ", $vqrange], _
		[6023, 15024, " ", $vqrange], _
		[7148, 13356, " ", $vqrange], _
		[11064, 15735, " ", $vqrange], _
		[13187, 16463, " ", $vqrange], _
		[13040, 13169, " ", $vqrange], _
		[8100, 11612, " ", $vqrange], _
		[3695, 7830, " ", $vqrange], _
		[3384, 5293, " ", $vqrange], _
		[5697, 4528, " ", $vqrange], _
		[10214, 9505, " ", $vqrange], _
		[12984, 8838, " ", $vqrange], _
		[16481, 7681, " ", $vqrange], _
		[17121, 5679, " ", $vqrange], _
		[11564, 5890, " ", $vqrange], _
		[15019, 3801, " ", $vqrange], _
		[12492, 2982, " ", $vqrange], _
		[9490, 1598, " ", $vqrange], _
		[6620, 419, " ", $vqrange], _
		[6576, -1272, " ", $vqrange], _
		[9167, -1233, " ", $vqrange], _
		[7664, -2845, " ", $vqrange], _
		[9040, -4989, " ", $vqrange], _
		[12198, -6182, " ", $vqrange], _
		[15591, -4735, " ", $vqrange], _
		[15606, -7162, " ", $vqrange], _
		[17114, -10290, " ", $vqrange], _
		[16367, -11077, " ", $vqrange], _
		[13043, -10983, " ", $vqrange], _
		[11926, -9787, " ", $vqrange], _
		[8810, -11417, " ", $vqrange], _
		[6842, -11707, " ", $vqrange], _
		[3754, -6782, " ", $vqrange], _
		[2287, -10306, " ", $vqrange], _
		[-598, -13421, " ", $vqrange], _
		[8, -15799, " ", $vqrange], _
		[-9612, -15123, " ", $vqrange], _
		[-9848, -12998, " ", $vqrange], _
		[-13444, -13808, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

