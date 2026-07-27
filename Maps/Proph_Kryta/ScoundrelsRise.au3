#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aScoundrelsRiseOutpostPath[2][2] = [ _
	[-1453.60, 24938.46], _
	[-4334.29, 26859.33] _
]

Func GoOutScoundrelsRise()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $ScoundrelsRise_Map Then Return

	If $l_i_Map = $ScoundrelsRise_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> ScoundrelsRise (portal 1)")
		_Vanquisher_RunAggroPortalPath($aScoundrelsRiseOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQScoundrelsRise()
	If GetMapID() <> $ScoundrelsRise_Map And GetMapID() <> $ScoundrelsRise_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for ScoundrelsRise.")
		TravelTo($ScoundrelsRise_Outpost)
	EndIf

	If GetMapID() = $ScoundrelsRise_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutScoundrelsRise()
		If GetMapID() <> $ScoundrelsRise_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need ScoundrelsRise (" & $ScoundrelsRise_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $ScoundrelsRise_Map Then
		CurrentAction("ScoundrelsRise route waiting - on map " & GetMapID() & ", need " & $ScoundrelsRise_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ScoundrelsRise vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-2529, -5002)
	If GetAreaVanquished() = False Then AggroMoveTo(-470, -2966)
	If GetAreaVanquished() = False Then AggroMoveTo(2763, -2033)
	If GetAreaVanquished() = False Then AggroMoveTo(4006, -1526)
	If GetAreaVanquished() = False Then AggroMoveTo(4030, -1364)
	If GetAreaVanquished() = False Then AggroMoveTo(4333, -1079)
	If GetAreaVanquished() = False Then AggroMoveTo(5013, -591)
	If GetAreaVanquished() = False Then AggroMoveTo(4648, -167)
	If GetAreaVanquished() = False Then AggroMoveTo(3978, 494)
	If GetAreaVanquished() = False Then AggroMoveTo(2655, 1441)
	If GetAreaVanquished() = False Then AggroMoveTo(2199, 2371)
	If GetAreaVanquished() = False Then AggroMoveTo(2159, 2464)
	If GetAreaVanquished() = False Then AggroMoveTo(2892, 2837)
	If GetAreaVanquished() = False Then AggroMoveTo(3772, 3968)
	If GetAreaVanquished() = False Then AggroMoveTo(3751, 4621)
	If GetAreaVanquished() = False Then AggroMoveTo(5106, 4888)
	If GetAreaVanquished() = False Then AggroMoveTo(6761, 4999)
	If GetAreaVanquished() = False Then AggroMoveTo(7683, 6114)
	If GetAreaVanquished() = False Then AggroMoveTo(6914, 7092)
	If GetAreaVanquished() = False Then AggroMoveTo(6540, 7500)
	If GetAreaVanquished() = False Then AggroMoveTo(4766, 8885)
	If GetAreaVanquished() = False Then AggroMoveTo(4359, 8553)
	If GetAreaVanquished() = False Then AggroMoveTo(3501, 7961)
	If GetAreaVanquished() = False Then AggroMoveTo(2428, 5685)
	If GetAreaVanquished() = False Then AggroMoveTo(2327, 5658)
	If GetAreaVanquished() = False Then AggroMoveTo(791, 5064)
	If GetAreaVanquished() = False Then AggroMoveTo(-37, 6023)
	If GetAreaVanquished() = False Then AggroMoveTo(-672, 7194)
	If GetAreaVanquished() = False Then AggroMoveTo(-2283, 7737)
	If GetAreaVanquished() = False Then AggroMoveTo(-4571, 8588)
	If GetAreaVanquished() = False Then AggroMoveTo(-5158, 8757)
	If GetAreaVanquished() = False Then AggroMoveTo(-5737, 9153)
	If GetAreaVanquished() = False Then AggroMoveTo(-3183, 8086)
	If GetAreaVanquished() = False Then AggroMoveTo(-2535, 6465)
	If GetAreaVanquished() = False Then AggroMoveTo(-2394, 5688)
	If GetAreaVanquished() = False Then AggroMoveTo(-3686, 4096)
	If GetAreaVanquished() = False Then AggroMoveTo(-4695, 2122)
	If GetAreaVanquished() = False Then AggroMoveTo(-5057, 416)
	If GetAreaVanquished() = False Then AggroMoveTo(-3522, 4099)
	If GetAreaVanquished() = False Then AggroMoveTo(-2551, 5576)
	If GetAreaVanquished() = False Then AggroMoveTo(-668, 4943)
	If GetAreaVanquished() = False Then AggroMoveTo(1202, 3009)
	If GetAreaVanquished() = False Then AggroMoveTo(5940, 1835)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(5940, 1835)
	If GetAreaVanquished() = False Then AggroMoveTo(1202, 3009)
	If GetAreaVanquished() = False Then AggroMoveTo(-668, 4943)
	If GetAreaVanquished() = False Then AggroMoveTo(-2551, 5576)
	If GetAreaVanquished() = False Then AggroMoveTo(-3522, 4099)
	If GetAreaVanquished() = False Then AggroMoveTo(-5057, 416)
	If GetAreaVanquished() = False Then AggroMoveTo(-4695, 2122)
	If GetAreaVanquished() = False Then AggroMoveTo(-3686, 4096)
	If GetAreaVanquished() = False Then AggroMoveTo(-2394, 5688)
	If GetAreaVanquished() = False Then AggroMoveTo(-2535, 6465)
	If GetAreaVanquished() = False Then AggroMoveTo(-3183, 8086)
	If GetAreaVanquished() = False Then AggroMoveTo(-5737, 9153)
	If GetAreaVanquished() = False Then AggroMoveTo(-5158, 8757)
	If GetAreaVanquished() = False Then AggroMoveTo(-4571, 8588)
	If GetAreaVanquished() = False Then AggroMoveTo(-2283, 7737)
	If GetAreaVanquished() = False Then AggroMoveTo(-672, 7194)
	If GetAreaVanquished() = False Then AggroMoveTo(-37, 6023)
	If GetAreaVanquished() = False Then AggroMoveTo(791, 5064)
	If GetAreaVanquished() = False Then AggroMoveTo(2327, 5658)
	If GetAreaVanquished() = False Then AggroMoveTo(2428, 5685)
	If GetAreaVanquished() = False Then AggroMoveTo(3501, 7961)
	If GetAreaVanquished() = False Then AggroMoveTo(4359, 8553)
	If GetAreaVanquished() = False Then AggroMoveTo(4766, 8885)
	If GetAreaVanquished() = False Then AggroMoveTo(6540, 7500)
	If GetAreaVanquished() = False Then AggroMoveTo(6914, 7092)
	If GetAreaVanquished() = False Then AggroMoveTo(7683, 6114)
	If GetAreaVanquished() = False Then AggroMoveTo(6761, 4999)
	If GetAreaVanquished() = False Then AggroMoveTo(5106, 4888)
	If GetAreaVanquished() = False Then AggroMoveTo(3751, 4621)
	If GetAreaVanquished() = False Then AggroMoveTo(3772, 3968)
	If GetAreaVanquished() = False Then AggroMoveTo(2892, 2837)
	If GetAreaVanquished() = False Then AggroMoveTo(2159, 2464)
	If GetAreaVanquished() = False Then AggroMoveTo(2199, 2371)
	If GetAreaVanquished() = False Then AggroMoveTo(2655, 1441)
	If GetAreaVanquished() = False Then AggroMoveTo(3978, 494)
	If GetAreaVanquished() = False Then AggroMoveTo(4648, -167)
	If GetAreaVanquished() = False Then AggroMoveTo(5013, -591)
	If GetAreaVanquished() = False Then AggroMoveTo(4333, -1079)
	If GetAreaVanquished() = False Then AggroMoveTo(4030, -1364)
	If GetAreaVanquished() = False Then AggroMoveTo(4006, -1526)
	If GetAreaVanquished() = False Then AggroMoveTo(2763, -2033)
	If GetAreaVanquished() = False Then AggroMoveTo(-470, -2966)
	If GetAreaVanquished() = False Then AggroMoveTo(-2529, -5002)
EndFunc

