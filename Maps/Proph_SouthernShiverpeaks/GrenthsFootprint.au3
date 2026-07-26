#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aGrenthsFootprintOutpostPath[1][2] = [ _
	[-2911.20, -4543.41] _
]

Func GoOutGrenthsFootprint()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $GrenthsFootprint_Map Then Return

	If $l_i_Map = $GrenthsFootprint_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> GrenthsFootprint (portal 1)")
		_Vanquisher_RunAggroPortalPath($aGrenthsFootprintOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQGrenthsFootprint()
	If GetMapID() <> $GrenthsFootprint_Map And GetMapID() <> $GrenthsFootprint_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for GrenthsFootprint.")
		TravelTo($GrenthsFootprint_Outpost)
	EndIf

	If GetMapID() = $GrenthsFootprint_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutGrenthsFootprint()
		If GetMapID() <> $GrenthsFootprint_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need GrenthsFootprint (" & $GrenthsFootprint_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $GrenthsFootprint_Map Then
		CurrentAction("GrenthsFootprint route waiting - on map " & GetMapID() & ", need " & $GrenthsFootprint_Map & ".")
		Return
	EndIf

	CurrentAction("Starting GrenthsFootprint vanquish route.")

	Local $aWaypoints[121][4] = [ _
		[-3942, -3284, " ", $vqrange], _
		[-3341, -2671, " ", $vqrange], _
		[-1298, -1046, " ", $vqrange], _
		[-429, -176, " ", $vqrange], _
		[507, 438, " ", $vqrange], _
		[2033, 1059, " ", $vqrange], _
		[3118, 1888, " ", $vqrange], _
		[3653, 2189, " ", $vqrange], _
		[4265, 2236, " ", $vqrange], _
		[2647, 230, " ", $vqrange], _
		[2241, -837, " ", $vqrange], _
		[1097, -2842, " ", $vqrange], _
		[5689, -6777, " ", $vqrange], _
		[7021, -8159, " ", $vqrange], _
		[8836, -8891, " ", $vqrange], _
		[11556, -9761, " ", $vqrange], _
		[12466, -9237, " ", $vqrange], _
		[13554, -8832, " ", $vqrange], _
		[13913, -8961, " ", $vqrange], _
		[15265, -8334, " ", $vqrange], _
		[15409, -7675, " ", $vqrange], _
		[15521, -7046, " ", $vqrange], _
		[15721, -6159, " ", $vqrange], _
		[15971, -3915, " ", $vqrange], _
		[15090, -3027, " ", $vqrange], _
		[13754, -2599, " ", $vqrange], _
		[14642, -2297, " ", $vqrange], _
		[15973, -286, " ", $vqrange], _
		[15011, 122, " ", $vqrange], _
		[14853, 348, " ", $vqrange], _
		[14936, 803, " ", $vqrange], _
		[16711, 2405, " ", $vqrange], _
		[18586, 2996, " ", $vqrange], _
		[17277, 3734, " ", $vqrange], _
		[16473, 4547, " ", $vqrange], _
		[15741, 5238, " ", $vqrange], _
		[15114, 3419, " ", $vqrange], _
		[13677, -1252, " ", $vqrange], _
		[11068, -2877, " ", $vqrange], _
		[9735, -3366, " ", $vqrange], _
		[8525, -4995, " ", $vqrange], _
		[7141, -3139, " ", $vqrange], _
		[6933, -1392, " ", $vqrange], _
		[7544, 27, " ", $vqrange], _
		[8086, 2225, " ", $vqrange], _
		[7562, 3162, " ", $vqrange], _
		[8383, 3636, " ", $vqrange], _
		[9865, 3829, " ", $vqrange], _
		[11181, 5230, " ", $vqrange], _
		[11650, 6139, " ", $vqrange], _
		[11229, 6366, " ", $vqrange], _
		[13184, 8985, " ", $vqrange], _
		[15689, 5724, " ", $vqrange], _
		[14804, 11, " ", $vqrange], _
		[14446, -1444, " ", $vqrange], _
		[12805, -1789, " ", $vqrange], _
		[7672, -2865, " ", $vqrange], _
		[2426, -463, " ", $vqrange], _
		[2998, 289, " ", $vqrange], _
		[3938, 2841, " ", $vqrange], _
		[1404, 943, " ", $vqrange], _
		[-78, 44, " ", $vqrange], _
		[-528, -218, " ", $vqrange], _
		[-2424, -2079, " ", $vqrange], _
		[-803, -122, " ", $vqrange], _
		[-4217, -2049, " ", $vqrange], _
		[-5570, -3831, " ", $vqrange], _
		[-6377, -5698, " ", $vqrange], _
		[-6821, -6215, " ", $vqrange], _
		[-7715, -7236, " ", $vqrange], _
		[-8108, -7665, " ", $vqrange], _
		[-8286, -8061, " ", $vqrange], _
		[-8681, -8386, " ", $vqrange], _
		[-10092, -8887, " ", $vqrange], _
		[-11219, -9027, " ", $vqrange], _
		[-11994, -8967, " ", $vqrange], _
		[-13073, -7701, " ", $vqrange], _
		[-13238, -7714, " ", $vqrange], _
		[-13780, -5266, " ", $vqrange], _
		[-13392, -5128, " ", $vqrange], _
		[-15434, -8738, " ", $vqrange], _
		[-13424, -7067, " ", $vqrange], _
		[-13970, -4000, " ", $vqrange], _
		[-12975, -1781, " ", $vqrange], _
		[-10202, 385, " ", $vqrange], _
		[-9792, -1556, " ", $vqrange], _
		[-9754, -2662, " ", $vqrange], _
		[-9112, -3453, " ", $vqrange], _
		[-8610, -3016, " ", $vqrange], _
		[-8352, -2754, " ", $vqrange], _
		[-6903, -1226, " ", $vqrange], _
		[-6773, 1001, " ", $vqrange], _
		[-7084, 1687, " ", $vqrange], _
		[-7672, 3861, " ", $vqrange], _
		[-6438, 4661, " ", $vqrange], _
		[-5330, 3945, " ", $vqrange], _
		[-3127, 2144, " ", $vqrange], _
		[-1948, 2596, " ", $vqrange], _
		[-1251, 2908, " ", $vqrange], _
		[-928, 3312, " ", $vqrange], _
		[-646, 4036, " ", $vqrange], _
		[1245, 3535, " ", $vqrange], _
		[1791, 4863, " ", $vqrange], _
		[2479, 4727, " ", $vqrange], _
		[2182, 4896, " ", $vqrange], _
		[1297, 3842, " ", $vqrange], _
		[195, 4524, " ", $vqrange], _
		[-712, 4833, " ", $vqrange], _
		[-2043, 6389, " ", $vqrange], _
		[-3710, 8238, " ", $vqrange], _
		[-1869, 10046, " ", $vqrange], _
		[-567, 10849, " ", $vqrange], _
		[486, 11246, " ", $vqrange], _
		[2368, 10948, " ", $vqrange], _
		[3099, 9194, " ", $vqrange], _
		[4013, 9517, " ", $vqrange], _
		[4013, 9517, " ", $vqrange], _
		[5166, 9649, " ", $vqrange], _
		[6023, 8202, " ", $vqrange], _
		[6000, 8407, " ", $vqrange], _
		[6692, 7852, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

