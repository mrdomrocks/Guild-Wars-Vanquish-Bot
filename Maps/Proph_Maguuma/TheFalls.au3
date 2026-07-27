#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTheFallsOutpostPath[2][2] = [ _
	[-14913, 578], _
	[-15169, 426] _
]

Global $aTheFallsTransitPath[9][2] = [ _
	[-17065, -942], _
	[-15179, -3115], _
	[-13716, -7339], _
	[-12855, -9881], _
	[-15821, -10140], _
	[-19351, -8594], _
	[-20909, -11218], _
	[-22657, -11462], _
	[-23270, -11426] _
]

Global $aTheFallsTransit2Path[11][2] = [ _
	[6861, 6446], _
	[6353, 5885], _
	[6414, 4896], _
	[5527, 398], _
	[5954, -3643], _
	[2470, -4498], _
	[-1229, -8667], _
	[-2550, -6849], _
	[-5626, -6814], _
	[-6340, -7661], _
	[-6489, -8107] _
]

Func GoOutTheFalls()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TheFalls_Map Then Return

	If $l_i_Map = $TheFalls_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TheFalls (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTheFallsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheFalls_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> TheFalls (portal 2)")
		_Vanquisher_RunAggroPortalPath($aTheFallsTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TheFalls_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> TheFalls (portal 3)")
		_Vanquisher_RunAggroPortalPath($aTheFallsTransit2Path, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTheFalls()
	If GetMapID() <> $TheFalls_Map And GetMapID() <> $TheFalls_Outpost And GetMapID() <> $TheFalls_Transit And GetMapID() <> $TheFalls_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TheFalls.")
		TravelTo($TheFalls_Outpost)
	EndIf

	If GetMapID() = $TheFalls_Outpost Or GetMapID() = $TheFalls_Transit Or GetMapID() = $TheFalls_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutTheFalls()
		If GetMapID() <> $TheFalls_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TheFalls (" & $TheFalls_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TheFalls_Map Then
		CurrentAction("TheFalls route waiting - on map " & GetMapID() & ", need " & $TheFalls_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TheFalls vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(17116, 2201)
	If GetAreaVanquished() = False Then AggroMoveTo(14733, 1984)
	If GetAreaVanquished() = False Then AggroMoveTo(14640, -893)
	If GetAreaVanquished() = False Then AggroMoveTo(11608, -2750)
	If GetAreaVanquished() = False Then AggroMoveTo(10710, -6711)
	If GetAreaVanquished() = False Then AggroMoveTo(11670, -10145)
	If GetAreaVanquished() = False Then AggroMoveTo(6997, -13425)
	If GetAreaVanquished() = False Then AggroMoveTo(4089, -14942)
	If GetAreaVanquished() = False Then AggroMoveTo(4924, -17200)
	If GetAreaVanquished() = False Then AggroMoveTo(5883, -18098)
	If GetAreaVanquished() = False Then AggroMoveTo(6564, -16891)
	If GetAreaVanquished() = False Then AggroMoveTo(7895, -16365)
	If GetAreaVanquished() = False Then AggroMoveTo(7771, -14911)
	If GetAreaVanquished() = False Then AggroMoveTo(11979, -15932)
	If GetAreaVanquished() = False Then AggroMoveTo(15551, -9403)
	If GetAreaVanquished() = False Then AggroMoveTo(13115, -15383)
	If GetAreaVanquished() = False Then AggroMoveTo(15888, -13898)
	If GetAreaVanquished() = False Then AggroMoveTo(15554, -12635)
	If GetAreaVanquished() = False Then AggroMoveTo(16480, -11240)
	If GetAreaVanquished() = False Then AggroMoveTo(16670, -8249)
	If GetAreaVanquished() = False Then AggroMoveTo(19420, -10505)
	If GetAreaVanquished() = False Then AggroMoveTo(17291, -12407)
	If GetAreaVanquished() = False Then AggroMoveTo(16289, -15271)
	If GetAreaVanquished() = False Then AggroMoveTo(17658, -12495)
	If GetAreaVanquished() = False Then AggroMoveTo(19040, -10518)
	If GetAreaVanquished() = False Then AggroMoveTo(15871, -7235)
	If GetAreaVanquished() = False Then AggroMoveTo(16543, -5461)
	If GetAreaVanquished() = False Then AggroMoveTo(15339, -6297)
	If GetAreaVanquished() = False Then AggroMoveTo(12969, -5284)
	If GetAreaVanquished() = False Then AggroMoveTo(11055, -6703)
	If GetAreaVanquished() = False Then AggroMoveTo(11993, -10112)
	If GetAreaVanquished() = False Then AggroMoveTo(6999, -14194)
	If GetAreaVanquished() = False Then AggroMoveTo(2452, -16332)
	If GetAreaVanquished() = False Then AggroMoveTo(361, -14194)
	If GetAreaVanquished() = False Then AggroMoveTo(2706, -14051)
	If GetAreaVanquished() = False Then AggroMoveTo(-273, -13956)
	If GetAreaVanquished() = False Then AggroMoveTo(-1287, -12134)
	If GetAreaVanquished() = False Then AggroMoveTo(-2237, -13687)
	If GetAreaVanquished() = False Then AggroMoveTo(-3964, -16285)
	If GetAreaVanquished() = False Then AggroMoveTo(-6990, -19168)
	If GetAreaVanquished() = False Then AggroMoveTo(-10457, -18986)
	If GetAreaVanquished() = False Then AggroMoveTo(-12204, -18155)
	If GetAreaVanquished() = False Then AggroMoveTo(-14972, -18357)
	If GetAreaVanquished() = False Then AggroMoveTo(-13187, -15721)
	If GetAreaVanquished() = False Then AggroMoveTo(-14808, -13390)
	If GetAreaVanquished() = False Then AggroMoveTo(-16603, -14647)
	If GetAreaVanquished() = False Then AggroMoveTo(-17596, -15205)
	If GetAreaVanquished() = False Then AggroMoveTo(-19107, -16644)
	If GetAreaVanquished() = False Then AggroMoveTo(-20517, -16705)
	If GetAreaVanquished() = False Then AggroMoveTo(-19705, -18034)
	If GetAreaVanquished() = False Then AggroMoveTo(-19117, -16703)
	If GetAreaVanquished() = False Then AggroMoveTo(-17197, -15815)
	If GetAreaVanquished() = False Then AggroMoveTo(-15707, -15379)
	If GetAreaVanquished() = False Then AggroMoveTo(-14709, -12432)
	If GetAreaVanquished() = False Then AggroMoveTo(-16777, -10924)
	If GetAreaVanquished() = False Then AggroMoveTo(-18221, -11475)
	If GetAreaVanquished() = False Then AggroMoveTo(-18659, -8766)
	If GetAreaVanquished() = False Then AggroMoveTo(-16747, -7362)
	If GetAreaVanquished() = False Then AggroMoveTo(-17165, -6526)
	If GetAreaVanquished() = False Then AggroMoveTo(-16798, -5854)
	If GetAreaVanquished() = False Then AggroMoveTo(-14681, -5651)
	If GetAreaVanquished() = False Then AggroMoveTo(-13870, -3256)
	If GetAreaVanquished() = False Then AggroMoveTo(-12108, -4244)
	If GetAreaVanquished() = False Then AggroMoveTo(-10663, -5677)
	If GetAreaVanquished() = False Then AggroMoveTo(-10182, -8186)
	If GetAreaVanquished() = False Then AggroMoveTo(-11361, -8870)
	If GetAreaVanquished() = False Then AggroMoveTo(-11386, -10848)
	If GetAreaVanquished() = False Then AggroMoveTo(-11158, -13116)
	If GetAreaVanquished() = False Then AggroMoveTo(-10625, -13725)
	If GetAreaVanquished() = False Then AggroMoveTo(-7432, -10607)
	If GetAreaVanquished() = False Then AggroMoveTo(-7774, -13002)
	If GetAreaVanquished() = False Then AggroMoveTo(-9421, -13002)
	If GetAreaVanquished() = False Then AggroMoveTo(-7444, -18592)
	If GetAreaVanquished() = False Then AggroMoveTo(-9535, -13332)
	If GetAreaVanquished() = False Then AggroMoveTo(-11158, -11012)
	If GetAreaVanquished() = False Then AggroMoveTo(-11500, -8554)
	If GetAreaVanquished() = False Then AggroMoveTo(-13693, -8351)
	If GetAreaVanquished() = False Then AggroMoveTo(-13452, -6602)
	If GetAreaVanquished() = False Then AggroMoveTo(-12717, -5841)
	If GetAreaVanquished() = False Then AggroMoveTo(-12996, -5322)
	If GetAreaVanquished() = False Then AggroMoveTo(-13110, -2432)
	If GetAreaVanquished() = False Then AggroMoveTo(-10752, -1088)
	If GetAreaVanquished() = False Then AggroMoveTo(-9016, 1282)
	If GetAreaVanquished() = False Then AggroMoveTo(-5163, -949)
	If GetAreaVanquished() = False Then AggroMoveTo(-7558, -2533)
	If GetAreaVanquished() = False Then AggroMoveTo(-10233, -2140)
	If GetAreaVanquished() = False Then AggroMoveTo(-8838, -1557)
	If GetAreaVanquished() = False Then AggroMoveTo(-6709, -1418)
	If GetAreaVanquished() = False Then AggroMoveTo(-8648, -62)
	If GetAreaVanquished() = False Then AggroMoveTo(-10042, -873)
	If GetAreaVanquished() = False Then AggroMoveTo(-8091, -87)
	If GetAreaVanquished() = False Then AggroMoveTo(-4935, -2052)
	If GetAreaVanquished() = False Then AggroMoveTo(-4393, -3230)
	If GetAreaVanquished() = False Then AggroMoveTo(-3640, -6180)
	If GetAreaVanquished() = False Then AggroMoveTo(1687, -6893)
	If GetAreaVanquished() = False Then AggroMoveTo(3667, -3844)
	If GetAreaVanquished() = False Then AggroMoveTo(1053, -1348)
	If GetAreaVanquished() = False Then AggroMoveTo(-1204, -3071)
	If GetAreaVanquished() = False Then AggroMoveTo(-3502, -3487)
	If GetAreaVanquished() = False Then AggroMoveTo(-1105, -2041)
	If GetAreaVanquished() = False Then AggroMoveTo(-1290, 799)
	If GetAreaVanquished() = False Then AggroMoveTo(393, 3374)
	If GetAreaVanquished() = False Then AggroMoveTo(-3172, 3497)
	If GetAreaVanquished() = False Then AggroMoveTo(-5375, 5106)
	If GetAreaVanquished() = False Then AggroMoveTo(-10103, 8077)
	If GetAreaVanquished() = False Then AggroMoveTo(-14311, 5354)
	If GetAreaVanquished() = False Then AggroMoveTo(-13866, 3176)
	If GetAreaVanquished() = False Then AggroMoveTo(-15103, 2829)
	If GetAreaVanquished() = False Then AggroMoveTo(-16390, 7136)
	If GetAreaVanquished() = False Then AggroMoveTo(-19534, 10107)
	If GetAreaVanquished() = False Then AggroMoveTo(-18173, 13350)
	If GetAreaVanquished() = False Then AggroMoveTo(-16440, 12681)
	If GetAreaVanquished() = False Then AggroMoveTo(-14274, 16111)
	If GetAreaVanquished() = False Then AggroMoveTo(-12785, 18694)
	If GetAreaVanquished() = False Then AggroMoveTo(-9300, 19185)
	If GetAreaVanquished() = False Then AggroMoveTo(-6480, 16951)
	If GetAreaVanquished() = False Then AggroMoveTo(-5918, 14653)
	If GetAreaVanquished() = False Then AggroMoveTo(-5332, 11928)
	If GetAreaVanquished() = False Then AggroMoveTo(-3906, 14130)
	If GetAreaVanquished() = False Then AggroMoveTo(-4857, 11595)
	If GetAreaVanquished() = False Then AggroMoveTo(-3051, 11072)
	If GetAreaVanquished() = False Then AggroMoveTo(-1958, 11706)
	If GetAreaVanquished() = False Then AggroMoveTo(-1910, 13211)
	If GetAreaVanquished() = False Then AggroMoveTo(-389, 14288)
	If GetAreaVanquished() = False Then AggroMoveTo(-864, 16079)
	If GetAreaVanquished() = False Then AggroMoveTo(-3130, 15889)
	If GetAreaVanquished() = False Then AggroMoveTo(-5459, 14748)
	If GetAreaVanquished() = False Then AggroMoveTo(-6647, 18297)
	If GetAreaVanquished() = False Then AggroMoveTo(-2480, 19501)
	If GetAreaVanquished() = False Then AggroMoveTo(942, 18994)
	If GetAreaVanquished() = False Then AggroMoveTo(2637, 18091)
	If GetAreaVanquished() = False Then AggroMoveTo(3112, 15271)
	If GetAreaVanquished() = False Then AggroMoveTo(2146, 12720)
	If GetAreaVanquished() = False Then AggroMoveTo(2447, 10977)
	If GetAreaVanquished() = False Then AggroMoveTo(1163, 10090)
	If GetAreaVanquished() = False Then AggroMoveTo(3492, 9139)
	If GetAreaVanquished() = False Then AggroMoveTo(2494, 7682)
	If GetAreaVanquished() = False Then AggroMoveTo(1369, 4941)
	If GetAreaVanquished() = False Then AggroMoveTo(1686, 2390)
	If GetAreaVanquished() = False Then AggroMoveTo(149, 4133)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(149, 4133)
	If GetAreaVanquished() = False Then AggroMoveTo(1686, 2390)
	If GetAreaVanquished() = False Then AggroMoveTo(1369, 4941)
	If GetAreaVanquished() = False Then AggroMoveTo(2494, 7682)
	If GetAreaVanquished() = False Then AggroMoveTo(3492, 9139)
	If GetAreaVanquished() = False Then AggroMoveTo(1163, 10090)
	If GetAreaVanquished() = False Then AggroMoveTo(2447, 10977)
	If GetAreaVanquished() = False Then AggroMoveTo(2146, 12720)
	If GetAreaVanquished() = False Then AggroMoveTo(3112, 15271)
	If GetAreaVanquished() = False Then AggroMoveTo(2637, 18091)
	If GetAreaVanquished() = False Then AggroMoveTo(942, 18994)
	If GetAreaVanquished() = False Then AggroMoveTo(-2480, 19501)
	If GetAreaVanquished() = False Then AggroMoveTo(-6647, 18297)
	If GetAreaVanquished() = False Then AggroMoveTo(-5459, 14748)
	If GetAreaVanquished() = False Then AggroMoveTo(-3130, 15889)
	If GetAreaVanquished() = False Then AggroMoveTo(-864, 16079)
	If GetAreaVanquished() = False Then AggroMoveTo(-389, 14288)
	If GetAreaVanquished() = False Then AggroMoveTo(-1910, 13211)
	If GetAreaVanquished() = False Then AggroMoveTo(-1958, 11706)
	If GetAreaVanquished() = False Then AggroMoveTo(-3051, 11072)
	If GetAreaVanquished() = False Then AggroMoveTo(-4857, 11595)
	If GetAreaVanquished() = False Then AggroMoveTo(-3906, 14130)
	If GetAreaVanquished() = False Then AggroMoveTo(-5332, 11928)
	If GetAreaVanquished() = False Then AggroMoveTo(-5918, 14653)
	If GetAreaVanquished() = False Then AggroMoveTo(-6480, 16951)
	If GetAreaVanquished() = False Then AggroMoveTo(-9300, 19185)
	If GetAreaVanquished() = False Then AggroMoveTo(-12785, 18694)
	If GetAreaVanquished() = False Then AggroMoveTo(-14274, 16111)
	If GetAreaVanquished() = False Then AggroMoveTo(-16440, 12681)
	If GetAreaVanquished() = False Then AggroMoveTo(-18173, 13350)
	If GetAreaVanquished() = False Then AggroMoveTo(-19534, 10107)
	If GetAreaVanquished() = False Then AggroMoveTo(-16390, 7136)
	If GetAreaVanquished() = False Then AggroMoveTo(-15103, 2829)
	If GetAreaVanquished() = False Then AggroMoveTo(-13866, 3176)
	If GetAreaVanquished() = False Then AggroMoveTo(-14311, 5354)
	If GetAreaVanquished() = False Then AggroMoveTo(-10103, 8077)
	If GetAreaVanquished() = False Then AggroMoveTo(-5375, 5106)
	If GetAreaVanquished() = False Then AggroMoveTo(-3172, 3497)
	If GetAreaVanquished() = False Then AggroMoveTo(393, 3374)
	If GetAreaVanquished() = False Then AggroMoveTo(-1290, 799)
	If GetAreaVanquished() = False Then AggroMoveTo(-1105, -2041)
	If GetAreaVanquished() = False Then AggroMoveTo(-3502, -3487)
	If GetAreaVanquished() = False Then AggroMoveTo(-1204, -3071)
	If GetAreaVanquished() = False Then AggroMoveTo(1053, -1348)
	If GetAreaVanquished() = False Then AggroMoveTo(3667, -3844)
	If GetAreaVanquished() = False Then AggroMoveTo(1687, -6893)
	If GetAreaVanquished() = False Then AggroMoveTo(-3640, -6180)
	If GetAreaVanquished() = False Then AggroMoveTo(-4393, -3230)
	If GetAreaVanquished() = False Then AggroMoveTo(-4935, -2052)
	If GetAreaVanquished() = False Then AggroMoveTo(-8091, -87)
	If GetAreaVanquished() = False Then AggroMoveTo(-10042, -873)
	If GetAreaVanquished() = False Then AggroMoveTo(-8648, -62)
	If GetAreaVanquished() = False Then AggroMoveTo(-6709, -1418)
	If GetAreaVanquished() = False Then AggroMoveTo(-8838, -1557)
	If GetAreaVanquished() = False Then AggroMoveTo(-10233, -2140)
	If GetAreaVanquished() = False Then AggroMoveTo(-7558, -2533)
	If GetAreaVanquished() = False Then AggroMoveTo(-5163, -949)
	If GetAreaVanquished() = False Then AggroMoveTo(-9016, 1282)
	If GetAreaVanquished() = False Then AggroMoveTo(-10752, -1088)
	If GetAreaVanquished() = False Then AggroMoveTo(-13110, -2432)
	If GetAreaVanquished() = False Then AggroMoveTo(-12996, -5322)
	If GetAreaVanquished() = False Then AggroMoveTo(-12717, -5841)
	If GetAreaVanquished() = False Then AggroMoveTo(-13452, -6602)
	If GetAreaVanquished() = False Then AggroMoveTo(-13693, -8351)
	If GetAreaVanquished() = False Then AggroMoveTo(-11500, -8554)
	If GetAreaVanquished() = False Then AggroMoveTo(-11158, -11012)
	If GetAreaVanquished() = False Then AggroMoveTo(-9535, -13332)
	If GetAreaVanquished() = False Then AggroMoveTo(-7444, -18592)
	If GetAreaVanquished() = False Then AggroMoveTo(-9421, -13002)
	If GetAreaVanquished() = False Then AggroMoveTo(-7774, -13002)
	If GetAreaVanquished() = False Then AggroMoveTo(-7432, -10607)
	If GetAreaVanquished() = False Then AggroMoveTo(-10625, -13725)
	If GetAreaVanquished() = False Then AggroMoveTo(-11158, -13116)
	If GetAreaVanquished() = False Then AggroMoveTo(-11386, -10848)
	If GetAreaVanquished() = False Then AggroMoveTo(-11361, -8870)
	If GetAreaVanquished() = False Then AggroMoveTo(-10182, -8186)
	If GetAreaVanquished() = False Then AggroMoveTo(-10663, -5677)
	If GetAreaVanquished() = False Then AggroMoveTo(-12108, -4244)
	If GetAreaVanquished() = False Then AggroMoveTo(-13870, -3256)
	If GetAreaVanquished() = False Then AggroMoveTo(-14681, -5651)
	If GetAreaVanquished() = False Then AggroMoveTo(-16798, -5854)
	If GetAreaVanquished() = False Then AggroMoveTo(-17165, -6526)
	If GetAreaVanquished() = False Then AggroMoveTo(-16747, -7362)
	If GetAreaVanquished() = False Then AggroMoveTo(-18659, -8766)
	If GetAreaVanquished() = False Then AggroMoveTo(-18221, -11475)
	If GetAreaVanquished() = False Then AggroMoveTo(-16777, -10924)
	If GetAreaVanquished() = False Then AggroMoveTo(-14709, -12432)
	If GetAreaVanquished() = False Then AggroMoveTo(-15707, -15379)
	If GetAreaVanquished() = False Then AggroMoveTo(-17197, -15815)
	If GetAreaVanquished() = False Then AggroMoveTo(-19117, -16703)
	If GetAreaVanquished() = False Then AggroMoveTo(-19705, -18034)
	If GetAreaVanquished() = False Then AggroMoveTo(-20517, -16705)
	If GetAreaVanquished() = False Then AggroMoveTo(-19107, -16644)
	If GetAreaVanquished() = False Then AggroMoveTo(-17596, -15205)
	If GetAreaVanquished() = False Then AggroMoveTo(-16603, -14647)
	If GetAreaVanquished() = False Then AggroMoveTo(-14808, -13390)
	If GetAreaVanquished() = False Then AggroMoveTo(-13187, -15721)
	If GetAreaVanquished() = False Then AggroMoveTo(-14972, -18357)
	If GetAreaVanquished() = False Then AggroMoveTo(-12204, -18155)
	If GetAreaVanquished() = False Then AggroMoveTo(-10457, -18986)
	If GetAreaVanquished() = False Then AggroMoveTo(-6990, -19168)
	If GetAreaVanquished() = False Then AggroMoveTo(-3964, -16285)
	If GetAreaVanquished() = False Then AggroMoveTo(-2237, -13687)
	If GetAreaVanquished() = False Then AggroMoveTo(-1287, -12134)
	If GetAreaVanquished() = False Then AggroMoveTo(-273, -13956)
	If GetAreaVanquished() = False Then AggroMoveTo(2706, -14051)
	If GetAreaVanquished() = False Then AggroMoveTo(361, -14194)
	If GetAreaVanquished() = False Then AggroMoveTo(2452, -16332)
	If GetAreaVanquished() = False Then AggroMoveTo(6999, -14194)
	If GetAreaVanquished() = False Then AggroMoveTo(11993, -10112)
	If GetAreaVanquished() = False Then AggroMoveTo(11055, -6703)
	If GetAreaVanquished() = False Then AggroMoveTo(12969, -5284)
	If GetAreaVanquished() = False Then AggroMoveTo(15339, -6297)
	If GetAreaVanquished() = False Then AggroMoveTo(16543, -5461)
	If GetAreaVanquished() = False Then AggroMoveTo(15871, -7235)
	If GetAreaVanquished() = False Then AggroMoveTo(19040, -10518)
	If GetAreaVanquished() = False Then AggroMoveTo(17658, -12495)
	If GetAreaVanquished() = False Then AggroMoveTo(16289, -15271)
	If GetAreaVanquished() = False Then AggroMoveTo(17291, -12407)
	If GetAreaVanquished() = False Then AggroMoveTo(19420, -10505)
	If GetAreaVanquished() = False Then AggroMoveTo(16670, -8249)
	If GetAreaVanquished() = False Then AggroMoveTo(16480, -11240)
	If GetAreaVanquished() = False Then AggroMoveTo(15554, -12635)
	If GetAreaVanquished() = False Then AggroMoveTo(15888, -13898)
	If GetAreaVanquished() = False Then AggroMoveTo(13115, -15383)
	If GetAreaVanquished() = False Then AggroMoveTo(15551, -9403)
	If GetAreaVanquished() = False Then AggroMoveTo(11979, -15932)
	If GetAreaVanquished() = False Then AggroMoveTo(7771, -14911)
	If GetAreaVanquished() = False Then AggroMoveTo(7895, -16365)
	If GetAreaVanquished() = False Then AggroMoveTo(6564, -16891)
	If GetAreaVanquished() = False Then AggroMoveTo(5883, -18098)
	If GetAreaVanquished() = False Then AggroMoveTo(4924, -17200)
	If GetAreaVanquished() = False Then AggroMoveTo(4089, -14942)
	If GetAreaVanquished() = False Then AggroMoveTo(6997, -13425)
	If GetAreaVanquished() = False Then AggroMoveTo(11670, -10145)
	If GetAreaVanquished() = False Then AggroMoveTo(10710, -6711)
	If GetAreaVanquished() = False Then AggroMoveTo(11608, -2750)
	If GetAreaVanquished() = False Then AggroMoveTo(14640, -893)
	If GetAreaVanquished() = False Then AggroMoveTo(14733, 1984)
	If GetAreaVanquished() = False Then AggroMoveTo(17116, 2201)
EndFunc

