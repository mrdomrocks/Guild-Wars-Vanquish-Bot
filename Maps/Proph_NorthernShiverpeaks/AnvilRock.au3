#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aAnvilRockOutpostPath[2][2] = [ _
	[-11688, 11666], _
	[-12281, 11654] _
]

Func GoOutAnvilRock()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $AnvilRock_Map Then Return

	If $l_i_Map = $AnvilRock_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> AnvilRock (portal 1)")
		_Vanquisher_RunAggroPortalPath($aAnvilRockOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQAnvilRock()
	If GetMapID() <> $AnvilRock_Map And GetMapID() <> $AnvilRock_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for AnvilRock.")
		TravelTo($AnvilRock_Outpost)
	EndIf

	If GetMapID() = $AnvilRock_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutAnvilRock()
		If GetMapID() <> $AnvilRock_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need AnvilRock (" & $AnvilRock_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $AnvilRock_Map Then
		CurrentAction("AnvilRock route waiting - on map " & GetMapID() & ", need " & $AnvilRock_Map & ".")
		Return
	EndIf

	CurrentAction("Starting AnvilRock vanquish route.")

	Local $aWaypoints[108][4] = [ _
		[-14361, 12832, " ", $vqrange], _
		[-17375, 9389, " ", $vqrange], _
		[-19120, 4717, " ", $vqrange], _
		[-15928, 7944, " ", $vqrange], _
		[-15500, 4183, " ", $vqrange], _
		[-15170, -2109, " ", $vqrange], _
		[-18090, -5803, " ", $vqrange], _
		[-17315, -11856, " ", $vqrange], _
		[-15267, -15099, " ", $vqrange], _
		[-15975, -16295, " ", $vqrange], _
		[-11899, -15050, " ", $vqrange], _
		[-13346, -8687, " ", $vqrange], _
		[-12001, -7673, " ", $vqrange], _
		[-9180, -6722, " ", $vqrange], _
		[-5484, -7578, " ", $vqrange], _
		[-6502, -15318, " ", $vqrange], _
		[-5190, -9535, " ", $vqrange], _
		[-6673, -15732, " ", $vqrange], _
		[-4528, -7218, " ", $vqrange], _
		[-7912, -3572, " ", $vqrange], _
		[-14119, 5278, " ", $vqrange], _
		[-8389, 360, " ", $vqrange], _
		[-5290, 6735, " ", $vqrange], _
		[-8984, 6795, " ", $vqrange], _
		[-7152, 10078, " ", $vqrange], _
		[-5373, 6997, " ", $vqrange], _
		[2094, 9723, " ", $vqrange], _
		[4732, 8944, " ", $vqrange], _
		[3161, 5945, " ", $vqrange], _
		[1828, 8087, " ", $vqrange], _
		[1451, 4301, " ", $vqrange], _
		[-1995, 1538, " ", $vqrange], _
		[1495, 4400, " ", $vqrange], _
		[4594, 539, " ", $vqrange], _
		[2611, -3464, " ", $vqrange], _
		[-4100, -5333, " ", $vqrange], _
		[514, -5218, " ", $vqrange], _
		[3584, -8971, " ", $vqrange], _
		[6048, -9484, " ", $vqrange], _
		[7383, -8520, " ", $vqrange], _
		[10336, -7954, " ", $vqrange], _
		[12483, -9077, " ", $vqrange], _
		[11470, -8553, " ", $vqrange], _
		[9425, -10955, " ", $vqrange], _
		[11531, -10907, " ", $vqrange], _
		[11470, -12635, " ", $vqrange], _
		[13035, -13562, " ", $vqrange], _
		[14249, -14278, " ", $vqrange], _
		[13194, -15736, " ", $vqrange], _
		[12275, -15920, " ", $vqrange], _
		[11094, -15804, " ", $vqrange], _
		[10496, -15508, " ", $vqrange], _
		[10097, -15620, " ", $vqrange], _
		[10073, -16164, " ", $vqrange], _
		[10227, -16461, " ", $vqrange], _
		[10712, -16609, " ", $vqrange], _
		[12275, -15926, " ", $vqrange], _
		[13227, -15779, " ", $vqrange], _
		[13067, -17830, " ", $vqrange], _
		[14096, -18514, " ", $vqrange], _
		[16160, -17089, " ", $vqrange], _
		[17910, -17485, " ", $vqrange], _
		[16099, -17079, " ", $vqrange], _
		[14064, -18520, " ", $vqrange], _
		[13054, -17785, " ", $vqrange], _
		[13233, -15747, " ", $vqrange], _
		[14281, -14278, " ", $vqrange], _
		[13016, -13536, " ", $vqrange], _
		[11460, -12628, " ", $vqrange], _
		[11578, -10878, " ", $vqrange], _
		[9425, -10917, " ", $vqrange], _
		[11491, -8552, " ", $vqrange], _
		[10693, -7476, " ", $vqrange], _
		[12205, -5040, " ", $vqrange], _
		[11592, -3840, " ", $vqrange], _
		[9632, -5973, " ", $vqrange], _
		[6682, -8326, " ", $vqrange], _
		[8344, -4567, " ", $vqrange], _
		[10257, -2049, " ", $vqrange], _
		[12112, -390, " ", $vqrange], _
		[10940, 4491, " ", $vqrange], _
		[12695, 8286, " ", $vqrange], _
		[11048, 12617, " ", $vqrange], _
		[14373, 9292, " ", $vqrange], _
		[18460, 8194, " ", $vqrange], _
		[21084, 12526, " ", $vqrange], _
		[20443, 17071, " ", $vqrange], _
		[19681, 18931, " ", $vqrange], _
		[17423, 17711, " ", $vqrange], _
		[16325, 20060, " ", $vqrange], _
		[11994, 19175, " ", $vqrange], _
		[10163, 14661, " ", $vqrange], _
		[8669, 8911, " ", $vqrange], _
		[8821, 4488, " ", $vqrange], _
		[8516, 12114, " ", $vqrange], _
		[4665, 14211, " ", $vqrange], _
		[1920, 16499, " ", $vqrange], _
		[3635, 18482, " ", $vqrange], _
		[9050, 16194, " ", $vqrange], _
		[-1016, 15584, " ", $vqrange], _
		[-2389, 13258, " ", $vqrange], _
		[1500, 11351, " ", $vqrange], _
		[-4715, 16689, " ", $vqrange], _
		[-11273, 16537, " ", $vqrange], _
		[-13294, 14402, " ", $vqrange], _
		[-12913, 17147, " ", $vqrange], _
		[-18327, 13563, " ", $vqrange], _
		[-17565, 10665, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

