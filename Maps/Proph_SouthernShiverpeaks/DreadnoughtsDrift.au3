#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDreadnoughtsDriftOutpostPath[2][2] = [ _
	[6647, -41652], _
	[5831, -41296] _
]

Global $aDreadnoughtsDriftTransitPath[38][2] = [ _
	[4361, -40986], _
	[2911, -39264], _
	[2133, -33852], _
	[-1060, -33346], _
	[-4758, -28947], _
	[-6471, -25171], _
	[-6082, -22640], _
	[-904, -21784], _
	[1054, -19774], _
	[1709, -15734], _
	[777, -12391], _
	[-1244, -9061], _
	[3023, -995], _
	[3610, 211], _
	[1680, 291], _
	[2015, 1742], _
	[-305, 3030], _
	[3103, 7774], _
	[1909, 14297], _
	[-816, 17801], _
	[-3619, 17256], _
	[-5371, 19670], _
	[-1984, 23796], _
	[-1945, 26833], _
	[508, 25354], _
	[1870, 22590], _
	[4868, 23524], _
	[3856, 27378], _
	[2065, 30960], _
	[2026, 32945], _
	[4634, 33957], _
	[6230, 35670], _
	[3038, 39018], _
	[-310, 37850], _
	[-2023, 40926], _
	[-5916, 41977], _
	[-7311, 44525], _
	[-7091, 45561] _
]

Func GoOutDreadnoughtsDrift()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DreadnoughtsDrift_Map Then Return

	If $l_i_Map = $DreadnoughtsDrift_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DreadnoughtsDrift (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDreadnoughtsDriftOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $DreadnoughtsDrift_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> DreadnoughtsDrift (portal 2)")
		_Vanquisher_RunAggroPortalPath($aDreadnoughtsDriftTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDreadnoughtsDrift()
	If GetMapID() <> $DreadnoughtsDrift_Map And GetMapID() <> $DreadnoughtsDrift_Outpost And GetMapID() <> $DreadnoughtsDrift_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DreadnoughtsDrift.")
		TravelTo($DreadnoughtsDrift_Outpost)
	EndIf

	If GetMapID() = $DreadnoughtsDrift_Outpost Or GetMapID() = $DreadnoughtsDrift_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutDreadnoughtsDrift()
		If GetMapID() <> $DreadnoughtsDrift_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DreadnoughtsDrift (" & $DreadnoughtsDrift_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DreadnoughtsDrift_Map Then
		CurrentAction("DreadnoughtsDrift route waiting - on map " & GetMapID() & ", need " & $DreadnoughtsDrift_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DreadnoughtsDrift vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-5119, -5407)
	If GetAreaVanquished() = False Then AggroMoveTo(-4427, -4775)
	If GetAreaVanquished() = False Then AggroMoveTo(-4446, -2638)
	If GetAreaVanquished() = False Then AggroMoveTo(-4555, -5927)
	If GetAreaVanquished() = False Then AggroMoveTo(-2949, -7679)
	If GetAreaVanquished() = False Then AggroMoveTo(-2050, -6796)
	If GetAreaVanquished() = False Then AggroMoveTo(-1308, -1897)
	If GetAreaVanquished() = False Then AggroMoveTo(106, -103)
	If GetAreaVanquished() = False Then AggroMoveTo(514, 176)
	If GetAreaVanquished() = False Then AggroMoveTo(3533, 498)
	If GetAreaVanquished() = False Then AggroMoveTo(4356, -3346)
	If GetAreaVanquished() = False Then AggroMoveTo(4207, -4303)
	If GetAreaVanquished() = False Then AggroMoveTo(3699, -6090)
	If GetAreaVanquished() = False Then AggroMoveTo(4471, -5998)
	If GetAreaVanquished() = False Then AggroMoveTo(7167, -5819)
	If GetAreaVanquished() = False Then AggroMoveTo(6078, -2889)
	If GetAreaVanquished() = False Then AggroMoveTo(6326, -1135)
	If GetAreaVanquished() = False Then AggroMoveTo(6525, -355)
	If GetAreaVanquished() = False Then AggroMoveTo(6602, -227)
	If GetAreaVanquished() = False Then AggroMoveTo(5077, 1710)
	If GetAreaVanquished() = False Then AggroMoveTo(5045, 2476)
	If GetAreaVanquished() = False Then AggroMoveTo(5045, 2476)
	If GetAreaVanquished() = False Then AggroMoveTo(4953, 3191)
	If GetAreaVanquished() = False Then AggroMoveTo(6067, 5643)
	If GetAreaVanquished() = False Then AggroMoveTo(3323, 825)
	If GetAreaVanquished() = False Then AggroMoveTo(-1930, 112)
	If GetAreaVanquished() = False Then AggroMoveTo(-1997, 919)
	If GetAreaVanquished() = False Then AggroMoveTo(-1170, 2400)
	If GetAreaVanquished() = False Then AggroMoveTo(-783, 3165)
	If GetAreaVanquished() = False Then AggroMoveTo(-738, 3773)
	If GetAreaVanquished() = False Then AggroMoveTo(-1796, 7507)
	If GetAreaVanquished() = False Then AggroMoveTo(-4843, 6735)
	If GetAreaVanquished() = False Then AggroMoveTo(-6772, 3979)
	If GetAreaVanquished() = False Then AggroMoveTo(-6108, 2572)
	If GetAreaVanquished() = False Then AggroMoveTo(-5394, 1659)
	If GetAreaVanquished() = False Then AggroMoveTo(-4355, 1206)
	If GetAreaVanquished() = False Then AggroMoveTo(-3584, 1138)
	If GetAreaVanquished() = False Then AggroMoveTo(-1491, 2807)
	If GetAreaVanquished() = False Then AggroMoveTo(-1006, 3799)
	If GetAreaVanquished() = False Then AggroMoveTo(-828, 4909)
	If GetAreaVanquished() = False Then AggroMoveTo(-1219, 5993)
	If GetAreaVanquished() = False Then AggroMoveTo(-2209, 7086)
	If GetAreaVanquished() = False Then AggroMoveTo(-3361, 7077)
	If GetAreaVanquished() = False Then AggroMoveTo(-4223, 6917)
	If GetAreaVanquished() = False Then AggroMoveTo(-5167, 7362)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-5167, 7362)
	If GetAreaVanquished() = False Then AggroMoveTo(-4223, 6917)
	If GetAreaVanquished() = False Then AggroMoveTo(-3361, 7077)
	If GetAreaVanquished() = False Then AggroMoveTo(-2209, 7086)
	If GetAreaVanquished() = False Then AggroMoveTo(-1219, 5993)
	If GetAreaVanquished() = False Then AggroMoveTo(-828, 4909)
	If GetAreaVanquished() = False Then AggroMoveTo(-1006, 3799)
	If GetAreaVanquished() = False Then AggroMoveTo(-1491, 2807)
	If GetAreaVanquished() = False Then AggroMoveTo(-3584, 1138)
	If GetAreaVanquished() = False Then AggroMoveTo(-4355, 1206)
	If GetAreaVanquished() = False Then AggroMoveTo(-5394, 1659)
	If GetAreaVanquished() = False Then AggroMoveTo(-6108, 2572)
	If GetAreaVanquished() = False Then AggroMoveTo(-6772, 3979)
	If GetAreaVanquished() = False Then AggroMoveTo(-4843, 6735)
	If GetAreaVanquished() = False Then AggroMoveTo(-1796, 7507)
	If GetAreaVanquished() = False Then AggroMoveTo(-738, 3773)
	If GetAreaVanquished() = False Then AggroMoveTo(-783, 3165)
	If GetAreaVanquished() = False Then AggroMoveTo(-1170, 2400)
	If GetAreaVanquished() = False Then AggroMoveTo(-1997, 919)
	If GetAreaVanquished() = False Then AggroMoveTo(-1930, 112)
	If GetAreaVanquished() = False Then AggroMoveTo(3323, 825)
	If GetAreaVanquished() = False Then AggroMoveTo(6067, 5643)
	If GetAreaVanquished() = False Then AggroMoveTo(4953, 3191)
	If GetAreaVanquished() = False Then AggroMoveTo(5045, 2476)
	If GetAreaVanquished() = False Then AggroMoveTo(5045, 2476)
	If GetAreaVanquished() = False Then AggroMoveTo(5077, 1710)
	If GetAreaVanquished() = False Then AggroMoveTo(6602, -227)
	If GetAreaVanquished() = False Then AggroMoveTo(6525, -355)
	If GetAreaVanquished() = False Then AggroMoveTo(6326, -1135)
	If GetAreaVanquished() = False Then AggroMoveTo(6078, -2889)
	If GetAreaVanquished() = False Then AggroMoveTo(7167, -5819)
	If GetAreaVanquished() = False Then AggroMoveTo(4471, -5998)
	If GetAreaVanquished() = False Then AggroMoveTo(3699, -6090)
	If GetAreaVanquished() = False Then AggroMoveTo(4207, -4303)
	If GetAreaVanquished() = False Then AggroMoveTo(4356, -3346)
	If GetAreaVanquished() = False Then AggroMoveTo(3533, 498)
	If GetAreaVanquished() = False Then AggroMoveTo(514, 176)
	If GetAreaVanquished() = False Then AggroMoveTo(106, -103)
	If GetAreaVanquished() = False Then AggroMoveTo(-1308, -1897)
	If GetAreaVanquished() = False Then AggroMoveTo(-2050, -6796)
	If GetAreaVanquished() = False Then AggroMoveTo(-2949, -7679)
	If GetAreaVanquished() = False Then AggroMoveTo(-4555, -5927)
	If GetAreaVanquished() = False Then AggroMoveTo(-4446, -2638)
	If GetAreaVanquished() = False Then AggroMoveTo(-4427, -4775)
	If GetAreaVanquished() = False Then AggroMoveTo(-5119, -5407)
EndFunc

