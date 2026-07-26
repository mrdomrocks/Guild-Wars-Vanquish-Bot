#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutDeldrimorBowl()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DeldrimorBowl_Map Then Return

	If $l_i_Map = $DeldrimorBowl_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DeldrimorBowl (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDeldrimorBowlOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDeldrimorBowl()
	If GetMapID() <> $DeldrimorBowl_Map And GetMapID() <> $DeldrimorBowl_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DeldrimorBowl.")
		TravelTo($DeldrimorBowl_Outpost)
	EndIf

	If GetMapID() = $DeldrimorBowl_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutDeldrimorBowl()
		If GetMapID() <> $DeldrimorBowl_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DeldrimorBowl (" & $DeldrimorBowl_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DeldrimorBowl_Map Then
		CurrentAction("DeldrimorBowl route waiting - on map " & GetMapID() & ", need " & $DeldrimorBowl_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DeldrimorBowl vanquish route.")

	Local $aWaypoints[42][4] = [ _
		[12342, -21414, " ", $vqrange], _
		[15627, -15210, " ", $vqrange], _
		[12342, -13124, " ", $vqrange], _
		[12632, -5901, " ", $vqrange], _
		[12882, -2022, " ", $vqrange], _
		[8294, -7736, " ", $vqrange], _
		[6037, -13151, " ", $vqrange], _
		[6334, -16162, " ", $vqrange], _
		[4450, -20112, " ", $vqrange], _
		[620, -20291, " ", $vqrange], _
		[-5595, -16954, " ", $vqrange], _
		[-12127, -20917, " ", $vqrange], _
		[-6821, -16846, " ", $vqrange], _
		[-7695, -13637, " ", $vqrange], _
		[-6173, -11667, " ", $vqrange], _
		[-5321, -8053, " ", $vqrange], _
		[-6821, -2898, " ", $vqrange], _
		[-8319, 3838, " ", $vqrange], _
		[-4109, 6145, " ", $vqrange], _
		[-2545, 215, " ", $vqrange], _
		[-2323, 7592, " ", $vqrange], _
		[2682, 1649, " ", $vqrange], _
		[7954, 6, " ", $vqrange], _
		[10920, 5402, " ", $vqrange], _
		[7329, 10057, " ", $vqrange], _
		[12998, 7398, " ", $vqrange], _
		[15051, 9684, " ", $vqrange], _
		[13566, 13974, " ", $vqrange], _
		[11773, 11587, " ", $vqrange], _
		[8388, 14252, " ", $vqrange], _
		[13110, 17968, " ", $vqrange], _
		[14830, 21878, " ", $vqrange], _
		[6801, 26727, " ", $vqrange], _
		[1952, 23338, " ", $vqrange], _
		[-5712, 24068, " ", $vqrange], _
		[-8319, 22347, " ", $vqrange], _
		[-5816, 20053, " ", $vqrange], _
		[649, 21096, " ", $vqrange], _
		[-133, 18645, " ", $vqrange], _
		[-4826, 17811, " ", $vqrange], _
		[-7015, 10564, " ", $vqrange], _
		[-7276, 7227, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

