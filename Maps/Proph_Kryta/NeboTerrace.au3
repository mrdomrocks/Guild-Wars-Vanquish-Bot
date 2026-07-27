#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aNeboTerraceOutpostPath[2][2] = [ _
	[-5199, 16327], _
	[-5252, 15997] _
]

Global $aNeboTerraceTransitPath[14][2] = [ _
	[-5219, 15079], _
	[-1627, 14112], _
	[3680, 18302], _
	[9937, 19075], _
	[12292, 16368], _
	[12011, 14189], _
	[13769, 12256], _
	[14331, 9162], _
	[14050, 8073], _
	[15491, 6526], _
	[17389, 7018], _
	[18966, 4149], _
	[19900, 4564], _
	[20398, 5311] _
]

Global $aNeboTerraceTransit2Path[11][2] = [ _
	[-18325, -2148], _
	[-14836, -4068], _
	[-12293, -4014], _
	[-9886, -1931], _
	[-8777, -2662], _
	[-8966, -4257], _
	[-6153, -3500], _
	[-4612, -7341], _
	[-4560, -10437], _
	[-4436, -11552], _
	[-3911, -11679] _
]

Func GoOutNeboTerrace()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $NeboTerrace_Map Then Return

	If $l_i_Map = $NeboTerrace_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> NeboTerrace (portal 1)")
		_Vanquisher_RunAggroPortalPath($aNeboTerraceOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $NeboTerrace_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> NeboTerrace (portal 2)")
		_Vanquisher_RunAggroPortalPath($aNeboTerraceTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $NeboTerrace_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> NeboTerrace (portal 3)")
		_Vanquisher_RunAggroPortalPath($aNeboTerraceTransit2Path, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQNeboTerrace()
	If GetMapID() <> $NeboTerrace_Map And GetMapID() <> $NeboTerrace_Outpost And GetMapID() <> $NeboTerrace_Transit And GetMapID() <> $NeboTerrace_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for NeboTerrace.")
		TravelTo($NeboTerrace_Outpost)
	EndIf

	If GetMapID() = $NeboTerrace_Outpost Or GetMapID() = $NeboTerrace_Transit Or GetMapID() = $NeboTerrace_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutNeboTerrace()
		If GetMapID() <> $NeboTerrace_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need NeboTerrace (" & $NeboTerrace_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $NeboTerrace_Map Then
		CurrentAction("NeboTerrace route waiting - on map " & GetMapID() & ", need " & $NeboTerrace_Map & ".")
		Return
	EndIf

	CurrentAction("Starting NeboTerrace vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-279, -10444)
	If GetAreaVanquished() = False Then AggroMoveTo(1705, -7538)
	If GetAreaVanquished() = False Then AggroMoveTo(4988, -6324)
	If GetAreaVanquished() = False Then AggroMoveTo(3462, -7279)
	If GetAreaVanquished() = False Then AggroMoveTo(5795, -7208)
	If GetAreaVanquished() = False Then AggroMoveTo(9160, -9739)
	If GetAreaVanquished() = False Then AggroMoveTo(8187, -10670)
	If GetAreaVanquished() = False Then AggroMoveTo(9095, -12725)
	If GetAreaVanquished() = False Then AggroMoveTo(12070, -14128)
	If GetAreaVanquished() = False Then AggroMoveTo(13604, -14200)
	If GetAreaVanquished() = False Then AggroMoveTo(12244, -12945)
	If GetAreaVanquished() = False Then AggroMoveTo(14803, -11596)
	If GetAreaVanquished() = False Then AggroMoveTo(15072, -11261)
	If GetAreaVanquished() = False Then AggroMoveTo(14416, -10804)
	If GetAreaVanquished() = False Then AggroMoveTo(6093, -5635)
	If GetAreaVanquished() = False Then AggroMoveTo(11033, -3330)
	If GetAreaVanquished() = False Then AggroMoveTo(13764, -3762)
	If GetAreaVanquished() = False Then AggroMoveTo(15153, -4801)
	If GetAreaVanquished() = False Then AggroMoveTo(17743, -2702)
	If GetAreaVanquished() = False Then AggroMoveTo(17375, 2800)
	If GetAreaVanquished() = False Then AggroMoveTo(16780, 6305)
	If GetAreaVanquished() = False Then AggroMoveTo(11742, 6441)
	If GetAreaVanquished() = False Then AggroMoveTo(7473, 4615)
	If GetAreaVanquished() = False Then AggroMoveTo(7879, 2282)
	If GetAreaVanquished() = False Then AggroMoveTo(4512, 395)
	If GetAreaVanquished() = False Then AggroMoveTo(6053, 6474)
	If GetAreaVanquished() = False Then AggroMoveTo(4302, 9625)
	If GetAreaVanquished() = False Then AggroMoveTo(6872, 12398)
	If GetAreaVanquished() = False Then AggroMoveTo(5575, 14577)
	If GetAreaVanquished() = False Then AggroMoveTo(8959, 16126)
	If GetAreaVanquished() = False Then AggroMoveTo(8283, 14181)
	If GetAreaVanquished() = False Then AggroMoveTo(11326, 15154)
	If GetAreaVanquished() = False Then AggroMoveTo(13651, 13632)
	If GetAreaVanquished() = False Then AggroMoveTo(14950, 10082)
	If GetAreaVanquished() = False Then AggroMoveTo(9354, 10251)
	If GetAreaVanquished() = False Then AggroMoveTo(3201, 15559)
	If GetAreaVanquished() = False Then AggroMoveTo(-1093, 17013)
	If GetAreaVanquished() = False Then AggroMoveTo(-4508, 17554)
	If GetAreaVanquished() = False Then AggroMoveTo(-7585, 18332)
	If GetAreaVanquished() = False Then AggroMoveTo(-13028, 18704)
	If GetAreaVanquished() = False Then AggroMoveTo(-13332, 14646)
	If GetAreaVanquished() = False Then AggroMoveTo(-12622, 11908)
	If GetAreaVanquished() = False Then AggroMoveTo(-9715, 12212)
	If GetAreaVanquished() = False Then AggroMoveTo(-8610, 10602)
	If GetAreaVanquished() = False Then AggroMoveTo(-7720, 12347)
	If GetAreaVanquished() = False Then AggroMoveTo(-9144, 14558)
	If GetAreaVanquished() = False Then AggroMoveTo(-9850, 15593)
	If GetAreaVanquished() = False Then AggroMoveTo(-6962, 15539)
	If GetAreaVanquished() = False Then AggroMoveTo(-3716, 10805)
	If GetAreaVanquished() = False Then AggroMoveTo(-2337, 10068)
	If GetAreaVanquished() = False Then AggroMoveTo(-1783, 7868)
	If GetAreaVanquished() = False Then AggroMoveTo(-2191, 5676)
	If GetAreaVanquished() = False Then AggroMoveTo(-2513, 3646)
	If GetAreaVanquished() = False Then AggroMoveTo(-4854, 4728)
	If GetAreaVanquished() = False Then AggroMoveTo(-7424, 3444)
	If GetAreaVanquished() = False Then AggroMoveTo(-3190, 2098)
	If GetAreaVanquished() = False Then AggroMoveTo(-716, 3731)
	If GetAreaVanquished() = False Then AggroMoveTo(-3168, 2098)
	If GetAreaVanquished() = False Then AggroMoveTo(-3907, 637)
	If GetAreaVanquished() = False Then AggroMoveTo(-1135, -1256)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-1135, -1256)
	If GetAreaVanquished() = False Then AggroMoveTo(-3907, 637)
	If GetAreaVanquished() = False Then AggroMoveTo(-3168, 2098)
	If GetAreaVanquished() = False Then AggroMoveTo(-716, 3731)
	If GetAreaVanquished() = False Then AggroMoveTo(-3190, 2098)
	If GetAreaVanquished() = False Then AggroMoveTo(-7424, 3444)
	If GetAreaVanquished() = False Then AggroMoveTo(-4854, 4728)
	If GetAreaVanquished() = False Then AggroMoveTo(-2513, 3646)
	If GetAreaVanquished() = False Then AggroMoveTo(-2191, 5676)
	If GetAreaVanquished() = False Then AggroMoveTo(-1783, 7868)
	If GetAreaVanquished() = False Then AggroMoveTo(-2337, 10068)
	If GetAreaVanquished() = False Then AggroMoveTo(-3716, 10805)
	If GetAreaVanquished() = False Then AggroMoveTo(-6962, 15539)
	If GetAreaVanquished() = False Then AggroMoveTo(-9850, 15593)
	If GetAreaVanquished() = False Then AggroMoveTo(-9144, 14558)
	If GetAreaVanquished() = False Then AggroMoveTo(-7720, 12347)
	If GetAreaVanquished() = False Then AggroMoveTo(-8610, 10602)
	If GetAreaVanquished() = False Then AggroMoveTo(-9715, 12212)
	If GetAreaVanquished() = False Then AggroMoveTo(-12622, 11908)
	If GetAreaVanquished() = False Then AggroMoveTo(-13332, 14646)
	If GetAreaVanquished() = False Then AggroMoveTo(-13028, 18704)
	If GetAreaVanquished() = False Then AggroMoveTo(-7585, 18332)
	If GetAreaVanquished() = False Then AggroMoveTo(-4508, 17554)
	If GetAreaVanquished() = False Then AggroMoveTo(-1093, 17013)
	If GetAreaVanquished() = False Then AggroMoveTo(3201, 15559)
	If GetAreaVanquished() = False Then AggroMoveTo(9354, 10251)
	If GetAreaVanquished() = False Then AggroMoveTo(14950, 10082)
	If GetAreaVanquished() = False Then AggroMoveTo(13651, 13632)
	If GetAreaVanquished() = False Then AggroMoveTo(11326, 15154)
	If GetAreaVanquished() = False Then AggroMoveTo(8283, 14181)
	If GetAreaVanquished() = False Then AggroMoveTo(8959, 16126)
	If GetAreaVanquished() = False Then AggroMoveTo(5575, 14577)
	If GetAreaVanquished() = False Then AggroMoveTo(6872, 12398)
	If GetAreaVanquished() = False Then AggroMoveTo(4302, 9625)
	If GetAreaVanquished() = False Then AggroMoveTo(6053, 6474)
	If GetAreaVanquished() = False Then AggroMoveTo(4512, 395)
	If GetAreaVanquished() = False Then AggroMoveTo(7879, 2282)
	If GetAreaVanquished() = False Then AggroMoveTo(7473, 4615)
	If GetAreaVanquished() = False Then AggroMoveTo(11742, 6441)
	If GetAreaVanquished() = False Then AggroMoveTo(16780, 6305)
	If GetAreaVanquished() = False Then AggroMoveTo(17375, 2800)
	If GetAreaVanquished() = False Then AggroMoveTo(17743, -2702)
	If GetAreaVanquished() = False Then AggroMoveTo(15153, -4801)
	If GetAreaVanquished() = False Then AggroMoveTo(13764, -3762)
	If GetAreaVanquished() = False Then AggroMoveTo(11033, -3330)
	If GetAreaVanquished() = False Then AggroMoveTo(6093, -5635)
	If GetAreaVanquished() = False Then AggroMoveTo(14416, -10804)
	If GetAreaVanquished() = False Then AggroMoveTo(15072, -11261)
	If GetAreaVanquished() = False Then AggroMoveTo(14803, -11596)
	If GetAreaVanquished() = False Then AggroMoveTo(12244, -12945)
	If GetAreaVanquished() = False Then AggroMoveTo(13604, -14200)
	If GetAreaVanquished() = False Then AggroMoveTo(12070, -14128)
	If GetAreaVanquished() = False Then AggroMoveTo(9095, -12725)
	If GetAreaVanquished() = False Then AggroMoveTo(8187, -10670)
	If GetAreaVanquished() = False Then AggroMoveTo(9160, -9739)
	If GetAreaVanquished() = False Then AggroMoveTo(5795, -7208)
	If GetAreaVanquished() = False Then AggroMoveTo(3462, -7279)
	If GetAreaVanquished() = False Then AggroMoveTo(4988, -6324)
	If GetAreaVanquished() = False Then AggroMoveTo(1705, -7538)
	If GetAreaVanquished() = False Then AggroMoveTo(-279, -10444)
EndFunc

