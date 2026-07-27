#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aIronHorseMineOutpostPath[2][2] = [ _
	[-11688, 11666], _
	[-12281, 11654] _
]

Global $aIronHorseMineTransitPath[10][2] = [ _
	[-14364, 12884], _
	[-7306, 17104], _
	[-1519, 15606], _
	[4887, 17101], _
	[10751, 16175], _
	[12604, 19236], _
	[16305, 19985], _
	[18238, 17604], _
	[20070, 20046], _
	[20520, 20584] _
]

Func GoOutIronHorseMine()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $IronHorseMine_Map Then Return

	If $l_i_Map = $IronHorseMine_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> IronHorseMine (portal 1)")
		_Vanquisher_RunAggroPortalPath($aIronHorseMineOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $IronHorseMine_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> IronHorseMine (portal 2)")
		_Vanquisher_RunAggroPortalPath($aIronHorseMineTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQIronHorseMine()
	If GetMapID() <> $IronHorseMine_Map And GetMapID() <> $IronHorseMine_Outpost And GetMapID() <> $IronHorseMine_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for IronHorseMine.")
		TravelTo($IronHorseMine_Outpost)
	EndIf

	If GetMapID() = $IronHorseMine_Outpost Or GetMapID() = $IronHorseMine_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutIronHorseMine()
		If GetMapID() <> $IronHorseMine_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need IronHorseMine (" & $IronHorseMine_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $IronHorseMine_Map Then
		CurrentAction("IronHorseMine route waiting - on map " & GetMapID() & ", need " & $IronHorseMine_Map & ".")
		Return
	EndIf

	CurrentAction("Starting IronHorseMine vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(-23955, 4146)
	If GetAreaVanquished() = False Then AggroMoveTo(-23588, 6713)
	If GetAreaVanquished() = False Then AggroMoveTo(-17833, 5133)
	If GetAreaVanquished() = False Then AggroMoveTo(-18474, 605)
	If GetAreaVanquished() = False Then AggroMoveTo(-18087, -3239)
	If GetAreaVanquished() = False Then AggroMoveTo(-19673, -5919)
	If GetAreaVanquished() = False Then AggroMoveTo(-16641, -7577)
	If GetAreaVanquished() = False Then AggroMoveTo(-12902, -5919)
	If GetAreaVanquished() = False Then AggroMoveTo(-15653, -3204)
	If GetAreaVanquished() = False Then AggroMoveTo(-12656, -4826)
	If GetAreaVanquished() = False Then AggroMoveTo(-8988, -3239)
	If GetAreaVanquished() = False Then AggroMoveTo(-6237, -3380)
	If GetAreaVanquished() = False Then AggroMoveTo(-3322, -1353)
	If GetAreaVanquished() = False Then AggroMoveTo(-618, -267)
	If GetAreaVanquished() = False Then AggroMoveTo(-421, 1340)
	If GetAreaVanquished() = False Then AggroMoveTo(386, 3895)
	If GetAreaVanquished() = False Then AggroMoveTo(-47, 5755)
	If GetAreaVanquished() = False Then AggroMoveTo(-2412, 6983)
	If GetAreaVanquished() = False Then AggroMoveTo(-3622, 5863)
	If GetAreaVanquished() = False Then AggroMoveTo(-1347, 3155)
	If GetAreaVanquished() = False Then AggroMoveTo(25, 3732)
	If GetAreaVanquished() = False Then AggroMoveTo(-1203, 6676)
	If GetAreaVanquished() = False Then AggroMoveTo(-4326, 7091)
	If GetAreaVanquished() = False Then AggroMoveTo(-7826, 6115)
	If GetAreaVanquished() = False Then AggroMoveTo(-8221, 2052)
	If GetAreaVanquished() = False Then AggroMoveTo(-5804, 1975)
	If GetAreaVanquished() = False Then AggroMoveTo(-10501, 1902)
	If GetAreaVanquished() = False Then AggroMoveTo(-12013, 3414)
	If GetAreaVanquished() = False Then AggroMoveTo(-14315, 5220)
	If GetAreaVanquished() = False Then AggroMoveTo(-15918, 7928)
	If GetAreaVanquished() = False Then AggroMoveTo(-18626, 6597)
	If GetAreaVanquished() = False Then AggroMoveTo(-15150, 7748)
	If GetAreaVanquished() = False Then AggroMoveTo(-13525, 3979)
	If GetAreaVanquished() = False Then AggroMoveTo(-8447, 5852)
	If GetAreaVanquished() = False Then AggroMoveTo(-1766, 8177)
	If GetAreaVanquished() = False Then AggroMoveTo(468, 10592)
	If GetAreaVanquished() = False Then AggroMoveTo(3673, 9960)
	If GetAreaVanquished() = False Then AggroMoveTo(3515, 6710)
	If GetAreaVanquished() = False Then AggroMoveTo(7443, 7319)
	If GetAreaVanquished() = False Then AggroMoveTo(7660, 9277)
	If GetAreaVanquished() = False Then AggroMoveTo(7746, 9207)
	If GetAreaVanquished() = False Then AggroMoveTo(8477, 7286)
	If GetAreaVanquished() = False Then AggroMoveTo(7777, 3275)
	If GetAreaVanquished() = False Then AggroMoveTo(11620, 3419)
	If GetAreaVanquished() = False Then AggroMoveTo(12472, 6077)
	If GetAreaVanquished() = False Then AggroMoveTo(9424, 7594)
	If GetAreaVanquished() = False Then AggroMoveTo(12703, 5730)
	If GetAreaVanquished() = False Then AggroMoveTo(12024, 3202)
	If GetAreaVanquished() = False Then AggroMoveTo(14827, 3982)
	If GetAreaVanquished() = False Then AggroMoveTo(13830, 5470)
	If GetAreaVanquished() = False Then AggroMoveTo(16970, 6146)
	If GetAreaVanquished() = False Then AggroMoveTo(18765, 7824)
	If GetAreaVanquished() = False Then AggroMoveTo(18413, 10728)
	If GetAreaVanquished() = False Then AggroMoveTo(20551, 10300)
	If GetAreaVanquished() = False Then AggroMoveTo(23255, 10855)
	If GetAreaVanquished() = False Then AggroMoveTo(24931, 10069)
	If GetAreaVanquished() = False Then AggroMoveTo(25130, 6254)
	If GetAreaVanquished() = False Then AggroMoveTo(23954, 5154)
	If GetAreaVanquished() = False Then AggroMoveTo(22579, 4391)
	If GetAreaVanquished() = False Then AggroMoveTo(25866, 1698)
	If GetAreaVanquished() = False Then AggroMoveTo(25626, -1969)
	If GetAreaVanquished() = False Then AggroMoveTo(24610, -3549)
	If GetAreaVanquished() = False Then AggroMoveTo(25338, -6370)
	If GetAreaVanquished() = False Then AggroMoveTo(23036, -5083)
	If GetAreaVanquished() = False Then AggroMoveTo(20576, -6573)
	If GetAreaVanquished() = False Then AggroMoveTo(16716, -6257)
	If GetAreaVanquished() = False Then AggroMoveTo(17100, -7363)
	If GetAreaVanquished() = False Then AggroMoveTo(15317, -9913)
	If GetAreaVanquished() = False Then AggroMoveTo(10668, -7589)
	If GetAreaVanquished() = False Then AggroMoveTo(10803, -4564)
	If GetAreaVanquished() = False Then AggroMoveTo(12315, -2398)
	If GetAreaVanquished() = False Then AggroMoveTo(9787, -1156)
	If GetAreaVanquished() = False Then AggroMoveTo(4991, -5907)
	If GetAreaVanquished() = False Then AggroMoveTo(1886, -6586)
	If GetAreaVanquished() = False Then AggroMoveTo(3691, -4607)
	If GetAreaVanquished() = False Then AggroMoveTo(3101, -2217)
	If GetAreaVanquished() = False Then AggroMoveTo(6599, 2777)
	If GetAreaVanquished() = False Then AggroMoveTo(2609, -2524)
	If GetAreaVanquished() = False Then AggroMoveTo(586, -3841)
	If GetAreaVanquished() = False Then AggroMoveTo(571, -5199)
	If GetAreaVanquished() = False Then AggroMoveTo(-872, -6129)
	If GetAreaVanquished() = False Then AggroMoveTo(-135, -7672)
	If GetAreaVanquished() = False Then AggroMoveTo(-4699, -8582)
	If GetAreaVanquished() = False Then AggroMoveTo(-8368, -7730)
	If GetAreaVanquished() = False Then AggroMoveTo(-7877, -4046)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-7877, -4046)
	If GetAreaVanquished() = False Then AggroMoveTo(-8368, -7730)
	If GetAreaVanquished() = False Then AggroMoveTo(-4699, -8582)
	If GetAreaVanquished() = False Then AggroMoveTo(-135, -7672)
	If GetAreaVanquished() = False Then AggroMoveTo(-872, -6129)
	If GetAreaVanquished() = False Then AggroMoveTo(571, -5199)
	If GetAreaVanquished() = False Then AggroMoveTo(586, -3841)
	If GetAreaVanquished() = False Then AggroMoveTo(2609, -2524)
	If GetAreaVanquished() = False Then AggroMoveTo(6599, 2777)
	If GetAreaVanquished() = False Then AggroMoveTo(3101, -2217)
	If GetAreaVanquished() = False Then AggroMoveTo(3691, -4607)
	If GetAreaVanquished() = False Then AggroMoveTo(1886, -6586)
	If GetAreaVanquished() = False Then AggroMoveTo(4991, -5907)
	If GetAreaVanquished() = False Then AggroMoveTo(9787, -1156)
	If GetAreaVanquished() = False Then AggroMoveTo(12315, -2398)
	If GetAreaVanquished() = False Then AggroMoveTo(10803, -4564)
	If GetAreaVanquished() = False Then AggroMoveTo(10668, -7589)
	If GetAreaVanquished() = False Then AggroMoveTo(15317, -9913)
	If GetAreaVanquished() = False Then AggroMoveTo(17100, -7363)
	If GetAreaVanquished() = False Then AggroMoveTo(16716, -6257)
	If GetAreaVanquished() = False Then AggroMoveTo(20576, -6573)
	If GetAreaVanquished() = False Then AggroMoveTo(23036, -5083)
	If GetAreaVanquished() = False Then AggroMoveTo(25338, -6370)
	If GetAreaVanquished() = False Then AggroMoveTo(24610, -3549)
	If GetAreaVanquished() = False Then AggroMoveTo(25626, -1969)
	If GetAreaVanquished() = False Then AggroMoveTo(25866, 1698)
	If GetAreaVanquished() = False Then AggroMoveTo(22579, 4391)
	If GetAreaVanquished() = False Then AggroMoveTo(23954, 5154)
	If GetAreaVanquished() = False Then AggroMoveTo(25130, 6254)
	If GetAreaVanquished() = False Then AggroMoveTo(24931, 10069)
	If GetAreaVanquished() = False Then AggroMoveTo(23255, 10855)
	If GetAreaVanquished() = False Then AggroMoveTo(20551, 10300)
	If GetAreaVanquished() = False Then AggroMoveTo(18413, 10728)
	If GetAreaVanquished() = False Then AggroMoveTo(18765, 7824)
	If GetAreaVanquished() = False Then AggroMoveTo(16970, 6146)
	If GetAreaVanquished() = False Then AggroMoveTo(13830, 5470)
	If GetAreaVanquished() = False Then AggroMoveTo(14827, 3982)
	If GetAreaVanquished() = False Then AggroMoveTo(12024, 3202)
	If GetAreaVanquished() = False Then AggroMoveTo(12703, 5730)
	If GetAreaVanquished() = False Then AggroMoveTo(9424, 7594)
	If GetAreaVanquished() = False Then AggroMoveTo(12472, 6077)
	If GetAreaVanquished() = False Then AggroMoveTo(11620, 3419)
	If GetAreaVanquished() = False Then AggroMoveTo(7777, 3275)
	If GetAreaVanquished() = False Then AggroMoveTo(8477, 7286)
	If GetAreaVanquished() = False Then AggroMoveTo(7746, 9207)
	If GetAreaVanquished() = False Then AggroMoveTo(7660, 9277)
	If GetAreaVanquished() = False Then AggroMoveTo(7443, 7319)
	If GetAreaVanquished() = False Then AggroMoveTo(3515, 6710)
	If GetAreaVanquished() = False Then AggroMoveTo(3673, 9960)
	If GetAreaVanquished() = False Then AggroMoveTo(468, 10592)
	If GetAreaVanquished() = False Then AggroMoveTo(-1766, 8177)
	If GetAreaVanquished() = False Then AggroMoveTo(-8447, 5852)
	If GetAreaVanquished() = False Then AggroMoveTo(-13525, 3979)
	If GetAreaVanquished() = False Then AggroMoveTo(-15150, 7748)
	If GetAreaVanquished() = False Then AggroMoveTo(-18626, 6597)
	If GetAreaVanquished() = False Then AggroMoveTo(-15918, 7928)
	If GetAreaVanquished() = False Then AggroMoveTo(-14315, 5220)
	If GetAreaVanquished() = False Then AggroMoveTo(-12013, 3414)
	If GetAreaVanquished() = False Then AggroMoveTo(-10501, 1902)
	If GetAreaVanquished() = False Then AggroMoveTo(-5804, 1975)
	If GetAreaVanquished() = False Then AggroMoveTo(-8221, 2052)
	If GetAreaVanquished() = False Then AggroMoveTo(-7826, 6115)
	If GetAreaVanquished() = False Then AggroMoveTo(-4326, 7091)
	If GetAreaVanquished() = False Then AggroMoveTo(-1203, 6676)
	If GetAreaVanquished() = False Then AggroMoveTo(25, 3732)
	If GetAreaVanquished() = False Then AggroMoveTo(-1347, 3155)
	If GetAreaVanquished() = False Then AggroMoveTo(-3622, 5863)
	If GetAreaVanquished() = False Then AggroMoveTo(-2412, 6983)
	If GetAreaVanquished() = False Then AggroMoveTo(-47, 5755)
	If GetAreaVanquished() = False Then AggroMoveTo(386, 3895)
	If GetAreaVanquished() = False Then AggroMoveTo(-421, 1340)
	If GetAreaVanquished() = False Then AggroMoveTo(-618, -267)
	If GetAreaVanquished() = False Then AggroMoveTo(-3322, -1353)
	If GetAreaVanquished() = False Then AggroMoveTo(-6237, -3380)
	If GetAreaVanquished() = False Then AggroMoveTo(-8988, -3239)
	If GetAreaVanquished() = False Then AggroMoveTo(-12656, -4826)
	If GetAreaVanquished() = False Then AggroMoveTo(-15653, -3204)
	If GetAreaVanquished() = False Then AggroMoveTo(-12902, -5919)
	If GetAreaVanquished() = False Then AggroMoveTo(-16641, -7577)
	If GetAreaVanquished() = False Then AggroMoveTo(-19673, -5919)
	If GetAreaVanquished() = False Then AggroMoveTo(-18087, -3239)
	If GetAreaVanquished() = False Then AggroMoveTo(-18474, 605)
	If GetAreaVanquished() = False Then AggroMoveTo(-17833, 5133)
	If GetAreaVanquished() = False Then AggroMoveTo(-23588, 6713)
	If GetAreaVanquished() = False Then AggroMoveTo(-23955, 4146)
EndFunc

