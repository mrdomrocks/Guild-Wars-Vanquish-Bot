;Mapped by Crux, updated by Incognito
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aMamnoonLagoonOutpostPath[2][2] = [ _
	[1692, -2650], _
	[2013, -2216] _
]

Global $aMamnoonLagoonTransitPath[15][2] = [ _
	[2384, -1697], _
	[3673, 525], _
	[5150, 2644], _
	[7357, 3959], _
	[7914, 6488], _
	[7130, 8915], _
	[6393, 11377], _
	[6191, 13960], _
	[8176, 15526], _
	[10709, 15812], _
	[13129, 16739], _
	[15137, 15124], _
	[16834, 13262], _
	[17163, 13225], _
 	[17391, 13256] _
]

Func GoOutMamnoonLagoon()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $MamnoonLagoon_Map Then Return
	If $l_i_Map = $MamnoonLagoon_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MamnoonLagoon (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
	If $l_i_Map = $MamnoonLagoon_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MamnoonLagoon (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQMamnoonLagoon()
	If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MamnoonLagoon.")
		TravelTo($MamnoonLagoon_Outpost)
	EndIf
	If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutMamnoonLagoon()
		If GetMapID() <> $MamnoonLagoon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
			Return
	EndIf
	EndIf
	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("MamnoonLagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf
	CurrentAction("Starting MamnoonLagoon vanquish route.")

	If GetAreaVanquished() = False Then AggroMoveTo(-6363, -5190)
	If GetAreaVanquished() = False Then AggroMoveTo(-5201, -2844)
	If GetAreaVanquished() = False Then AggroMoveTo(-4173, -512)
	If GetAreaVanquished() = False Then AggroMoveTo(-2301, 1258)
	If GetAreaVanquished() = False Then AggroMoveTo(-2598, 3819)
	If GetAreaVanquished() = False Then AggroMoveTo(-1594, 3867)
	If GetAreaVanquished() = False Then AggroMoveTo(-1274, 1374)
	If GetAreaVanquished() = False Then AggroMoveTo(-1964, -1108)
	If GetAreaVanquished() = False Then AggroMoveTo(-1898, -3680)
	If GetAreaVanquished() = False Then AggroMoveTo(-529, -5780)
	If GetAreaVanquished() = False Then AggroMoveTo(1962, -6355)
	If GetAreaVanquished() = False Then AggroMoveTo(-576, -6729)
	If GetAreaVanquished() = False Then AggroMoveTo(-2353, -6877)
	If GetAreaVanquished() = False Then AggroMoveTo(168, -6488)
	If GetAreaVanquished() = False Then AggroMoveTo(1932, -4710)
	If GetAreaVanquished() = False Then AggroMoveTo(4309, -5734)
	If GetAreaVanquished() = False Then AggroMoveTo(5877, -3750)
	If GetAreaVanquished() = False Then AggroMoveTo(5744, -1158)
	If GetAreaVanquished() = False Then AggroMoveTo(4281, 963)
	If GetAreaVanquished() = False Then AggroMoveTo(3573, 3385)
	If GetAreaVanquished() = False Then AggroMoveTo(4207, 5824)
	If GetAreaVanquished() = False Then AggroMoveTo(6444, 7160)
	If GetAreaVanquished() = False Then AggroMoveTo(7147, 4948)
	If GetAreaVanquished() = False Then AggroMoveTo(6786, 7237)
	If GetAreaVanquished() = False Then AggroMoveTo(4711, 5810)
	If GetAreaVanquished() = False Then AggroMoveTo(2240, 5264)
	If GetAreaVanquished() = False Then AggroMoveTo(-24, 6356)
	If GetAreaVanquished() = False Then AggroMoveTo(-2592, 6615)
	If GetAreaVanquished() = False Then AggroMoveTo(-5051, 5817)
	If GetAreaVanquished() = False Then AggroMoveTo(-7118, 4306)
	If GetAreaVanquished() = False Then AggroMoveTo(-7450, 3475)
	If GetAreaVanquished() = False Then AggroMoveTo(-7329, 5997)
	If GetAreaVanquished() = False Then AggroMoveTo(-4763, 5921)
	If GetAreaVanquished() = False Then AggroMoveTo(-2273, 6167)
	If GetAreaVanquished() = False Then AggroMoveTo(-2544, 3657)
	If GetAreaVanquished() = False Then AggroMoveTo(-3085, 1120)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-3085, 1120)
	If GetAreaVanquished() = False Then AggroMoveTo(-2544, 3657)
	If GetAreaVanquished() = False Then AggroMoveTo(-2273, 6167)
	If GetAreaVanquished() = False Then AggroMoveTo(-4763, 5921)
	If GetAreaVanquished() = False Then AggroMoveTo(-7329, 5997)
	If GetAreaVanquished() = False Then AggroMoveTo(-7450, 3475)
	If GetAreaVanquished() = False Then AggroMoveTo(-7118, 4306)
	If GetAreaVanquished() = False Then AggroMoveTo(-5051, 5817)
	If GetAreaVanquished() = False Then AggroMoveTo(-2592, 6615)
	If GetAreaVanquished() = False Then AggroMoveTo(-24, 6356)
	If GetAreaVanquished() = False Then AggroMoveTo(2240, 5264)
	If GetAreaVanquished() = False Then AggroMoveTo(4711, 5810)
	If GetAreaVanquished() = False Then AggroMoveTo(6786, 7237)
	If GetAreaVanquished() = False Then AggroMoveTo(7147, 4948)
	If GetAreaVanquished() = False Then AggroMoveTo(6444, 7160)
	If GetAreaVanquished() = False Then AggroMoveTo(4207, 5824)
	If GetAreaVanquished() = False Then AggroMoveTo(3573, 3385)
	If GetAreaVanquished() = False Then AggroMoveTo(4281, 963)
	If GetAreaVanquished() = False Then AggroMoveTo(5744, -1158)
	If GetAreaVanquished() = False Then AggroMoveTo(5877, -3750)
	If GetAreaVanquished() = False Then AggroMoveTo(4309, -5734)
	If GetAreaVanquished() = False Then AggroMoveTo(1932, -4710)
	If GetAreaVanquished() = False Then AggroMoveTo(168, -6488)
	If GetAreaVanquished() = False Then AggroMoveTo(-2353, -6877)
	If GetAreaVanquished() = False Then AggroMoveTo(-576, -6729)
	If GetAreaVanquished() = False Then AggroMoveTo(1962, -6355)
	If GetAreaVanquished() = False Then AggroMoveTo(-529, -5780)
	If GetAreaVanquished() = False Then AggroMoveTo(-1898, -3680)
	If GetAreaVanquished() = False Then AggroMoveTo(-1964, -1108)
	If GetAreaVanquished() = False Then AggroMoveTo(-1274, 1374)
	If GetAreaVanquished() = False Then AggroMoveTo(-1594, 3867)
	If GetAreaVanquished() = False Then AggroMoveTo(-2598, 3819)
	If GetAreaVanquished() = False Then AggroMoveTo(-2301, 1258)
	If GetAreaVanquished() = False Then AggroMoveTo(-4173, -512)
	If GetAreaVanquished() = False Then AggroMoveTo(-5201, -2844)
	If GetAreaVanquished() = False Then AggroMoveTo(-6363, -5190)
EndFunc
