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

	Local $aWaypoints[85][4] = [ _
		[-23955, 4146, " ", $vqrange], _
		[-23588, 6713, " ", $vqrange], _
		[-17833, 5133, " ", $vqrange], _
		[-18474, 605, " ", $vqrange], _
		[-18087, -3239, " ", $vqrange], _
		[-19673, -5919, " ", $vqrange], _
		[-16641, -7577, " ", $vqrange], _
		[-12902, -5919, " ", $vqrange], _
		[-15653, -3204, " ", $vqrange], _
		[-12656, -4826, " ", $vqrange], _
		[-8988, -3239, " ", $vqrange], _
		[-6237, -3380, " ", $vqrange], _
		[-3322, -1353, " ", $vqrange], _
		[-618, -267, " ", $vqrange], _
		[-421, 1340, " ", $vqrange], _
		[386, 3895, " ", $vqrange], _
		[-47, 5755, " ", $vqrange], _
		[-2412, 6983, " ", $vqrange], _
		[-3622, 5863, " ", $vqrange], _
		[-1347, 3155, " ", $vqrange], _
		[25, 3732, " ", $vqrange], _
		[-1203, 6676, " ", $vqrange], _
		[-4326, 7091, " ", $vqrange], _
		[-7826, 6115, " ", $vqrange], _
		[-8221, 2052, " ", $vqrange], _
		[-5804, 1975, " ", $vqrange], _
		[-10501, 1902, " ", $vqrange], _
		[-12013, 3414, " ", $vqrange], _
		[-14315, 5220, " ", $vqrange], _
		[-15918, 7928, " ", $vqrange], _
		[-18626, 6597, " ", $vqrange], _
		[-15150, 7748, " ", $vqrange], _
		[-13525, 3979, " ", $vqrange], _
		[-8447, 5852, " ", $vqrange], _
		[-1766, 8177, " ", $vqrange], _
		[468, 10592, " ", $vqrange], _
		[3673, 9960, " ", $vqrange], _
		[3515, 6710, " ", $vqrange], _
		[7443, 7319, " ", $vqrange], _
		[7660, 9277, " ", $vqrange], _
		[7746, 9207, " ", $vqrange], _
		[8477, 7286, " ", $vqrange], _
		[7777, 3275, " ", $vqrange], _
		[11620, 3419, " ", $vqrange], _
		[12472, 6077, " ", $vqrange], _
		[9424, 7594, " ", $vqrange], _
		[12703, 5730, " ", $vqrange], _
		[12024, 3202, " ", $vqrange], _
		[14827, 3982, " ", $vqrange], _
		[13830, 5470, " ", $vqrange], _
		[16970, 6146, " ", $vqrange], _
		[18765, 7824, " ", $vqrange], _
		[18413, 10728, " ", $vqrange], _
		[20551, 10300, " ", $vqrange], _
		[23255, 10855, " ", $vqrange], _
		[24931, 10069, " ", $vqrange], _
		[25130, 6254, " ", $vqrange], _
		[23954, 5154, " ", $vqrange], _
		[22579, 4391, " ", $vqrange], _
		[25866, 1698, " ", $vqrange], _
		[25626, -1969, " ", $vqrange], _
		[24610, -3549, " ", $vqrange], _
		[25338, -6370, " ", $vqrange], _
		[23036, -5083, " ", $vqrange], _
		[20576, -6573, " ", $vqrange], _
		[16716, -6257, " ", $vqrange], _
		[17100, -7363, " ", $vqrange], _
		[15317, -9913, " ", $vqrange], _
		[10668, -7589, " ", $vqrange], _
		[10803, -4564, " ", $vqrange], _
		[12315, -2398, " ", $vqrange], _
		[9787, -1156, " ", $vqrange], _
		[4991, -5907, " ", $vqrange], _
		[1886, -6586, " ", $vqrange], _
		[3691, -4607, " ", $vqrange], _
		[3101, -2217, " ", $vqrange], _
		[6599, 2777, " ", $vqrange], _
		[2609, -2524, " ", $vqrange], _
		[586, -3841, " ", $vqrange], _
		[571, -5199, " ", $vqrange], _
		[-872, -6129, " ", $vqrange], _
		[-135, -7672, " ", $vqrange], _
		[-4699, -8582, " ", $vqrange], _
		[-8368, -7730, " ", $vqrange], _
		[-7877, -4046, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

