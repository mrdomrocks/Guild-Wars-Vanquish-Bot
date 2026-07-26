#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aNorthKrytaProvinceOutpostPath[4][2] = [ _
	[810, 7749], _
	[1458, 9940], _
	[361, 12256], _
	[169, 12479] _
]

Func GoOutNorthKrytaProvince()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $NorthKrytaProvince_Map Then Return

	If $l_i_Map = $NorthKrytaProvince_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> NorthKrytaProvince (portal 1)")
		_Vanquisher_RunAggroPortalPath($aNorthKrytaProvinceOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQNorthKrytaProvince()
	If GetMapID() <> $NorthKrytaProvince_Map And GetMapID() <> $NorthKrytaProvince_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for NorthKrytaProvince.")
		TravelTo($NorthKrytaProvince_Outpost)
	EndIf

	If GetMapID() = $NorthKrytaProvince_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutNorthKrytaProvince()
		If GetMapID() <> $NorthKrytaProvince_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need NorthKrytaProvince (" & $NorthKrytaProvince_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $NorthKrytaProvince_Map Then
		CurrentAction("NorthKrytaProvince route waiting - on map " & GetMapID() & ", need " & $NorthKrytaProvince_Map & ".")
		Return
	EndIf

	CurrentAction("Starting NorthKrytaProvince vanquish route.")

	Local $aWaypoints[136][4] = [ _
		[5605, -16546, " ", $vqrange], _
		[2344, -17322, " ", $vqrange], _
		[929, -16761, " ", $vqrange], _
		[-1773, -16714, " ", $vqrange], _
		[-4339, -15937, " ", $vqrange], _
		[-3045, -12264, " ", $vqrange], _
		[-4339, -15937, " ", $vqrange], _
		[-6759, -15699, " ", $vqrange], _
		[-10153, -16245, " ", $vqrange], _
		[-11395, -17951, " ", $vqrange], _
		[-9999, -13430, " ", $vqrange], _
		[-10282, -9766, " ", $vqrange], _
		[-14697, -11692, " ", $vqrange], _
		[-18691, -14755, " ", $vqrange], _
		[-14759, -11692, " ", $vqrange], _
		[-12416, -8602, " ", $vqrange], _
		[-7436, -7373, " ", $vqrange], _
		[-12901, -5730, " ", $vqrange], _
		[-8076, -3351, " ", $vqrange], _
		[-13768, -3971, " ", $vqrange], _
		[-13586, -1352, " ", $vqrange], _
		[-13095, 1823, " ", $vqrange], _
		[-10301, -531, " ", $vqrange], _
		[-9862, 3083, " ", $vqrange], _
		[-6913, 2850, " ", $vqrange], _
		[-9836, 3186, " ", $vqrange], _
		[-13406, 6885, " ", $vqrange], _
		[-13898, 10300, " ", $vqrange], _
		[-15941, 16975, " ", $vqrange], _
		[-17830, 15474, " ", $vqrange], _
		[-14182, 19277, " ", $vqrange], _
		[-11750, 22123, " ", $vqrange], _
		[-9267, 21528, " ", $vqrange], _
		[-9448, 19070, " ", $vqrange], _
		[-8439, 20364, " ", $vqrange], _
		[-6576, 18553, " ", $vqrange], _
		[-8905, 16406, " ", $vqrange], _
		[-8775, 13224, " ", $vqrange], _
		[-5852, 11057, " ", $vqrange], _
		[-6861, 4393, " ", $vqrange], _
		[-5541, 8454, " ", $vqrange], _
		[-4946, 14534, " ", $vqrange], _
		[-6706, 16060, " ", $vqrange], _
		[-4843, 19501, " ", $vqrange], _
		[-4558, 16216, " ", $vqrange], _
		[567, 14773, " ", $vqrange], _
		[667, 18647, " ", $vqrange], _
		[8221, 18880, " ", $vqrange], _
		[8816, 21208, " ", $vqrange], _
		[17768, 22489, " ", $vqrange], _
		[17541, 19417, " ", $vqrange], _
		[16299, 16261, " ", $vqrange], _
		[18343, 16623, " ", $vqrange], _
		[16292, 16241, " ", $vqrange], _
		[17539, 19517, " ", $vqrange], _
		[13938, 20391, " ", $vqrange], _
		[14019, 15945, " ", $vqrange], _
		[13389, 12776, " ", $vqrange], _
		[12096, 9219, " ", $vqrange], _
		[9218, 7052, " ", $vqrange], _
		[12904, 9316, " ", $vqrange], _
		[14295, 7537, " ", $vqrange], _
		[14650, 11030, " ", $vqrange], _
		[16752, 12776, " ", $vqrange], _
		[19145, 10771, " ", $vqrange], _
		[16752, 12808, " ", $vqrange], _
		[14456, 11192, " ", $vqrange], _
		[15039, 13746, " ", $vqrange], _
		[13152, 12785, " ", $vqrange], _
		[12516, 16042, " ", $vqrange], _
		[11958, 17117, " ", $vqrange], _
		[7390, 15015, " ", $vqrange], _
		[3631, 15258, " ", $vqrange], _
		[5120, 10905, " ", $vqrange], _
		[1705, 11966, " ", $vqrange], _
		[-2253, 8991, " ", $vqrange], _
		[-3133, 12638, " ", $vqrange], _
		[-1270, 13156, " ", $vqrange], _
		[-3314, 12457, " ", $vqrange], _
		[-3469, 7361, " ", $vqrange], _
		[-701, 6585, " ", $vqrange], _
		[2145, 9456, " ", $vqrange], _
		[2041, 5938, " ", $vqrange], _
		[4758, 5860, " ", $vqrange], _
		[3283, 5136, " ", $vqrange], _
		[1912, 2652, " ", $vqrange], _
		[256, 557, " ", $vqrange], _
		[1627, 2704, " ", $vqrange], _
		[1724, 130, " ", $vqrange], _
		[2106, -2774, " ", $vqrange], _
		[3994, -3084, " ", $vqrange], _
		[3917, -627, " ", $vqrange], _
		[5443, 2685, " ", $vqrange], _
		[7047, 4709, " ", $vqrange], _
		[3951, 4328, " ", $vqrange], _
		[7113, 4212, " ", $vqrange], _
		[6484, 2639, " ", $vqrange], _
		[10220, 3331, " ", $vqrange], _
		[11100, 4857, " ", $vqrange], _
		[9522, 6125, " ", $vqrange], _
		[12911, 3021, " ", $vqrange], _
		[12445, 1184, " ", $vqrange], _
		[6211, 744, " ", $vqrange], _
		[11410, -886, " ", $vqrange], _
		[7892, -2904, " ", $vqrange], _
		[8302, -4597, " ", $vqrange], _
		[11717, -3070, " ", $vqrange], _
		[13166, -6873, " ", $vqrange], _
		[13159, -11730, " ", $vqrange], _
		[10896, -8917, " ", $vqrange], _
		[10572, -11310, " ", $vqrange], _
		[8503, -13897, " ", $vqrange], _
		[6659, -15546, " ", $vqrange], _
		[9505, -13477, " ", $vqrange], _
		[10669, -12151, " ", $vqrange], _
		[9214, -10146, " ", $vqrange], _
		[7015, -11051, " ", $vqrange], _
		[4105, -9337, " ", $vqrange], _
		[3393, -12539, " ", $vqrange], _
		[5193, -13662, " ", $vqrange], _
		[3814, -16322, " ", $vqrange], _
		[5111, -12983, " ", $vqrange], _
		[3935, -11559, " ", $vqrange], _
		[2975, -9903, " ", $vqrange], _
		[988, -9903, " ", $vqrange], _
		[-858, -10512, " ", $vqrange], _
		[-1376, -8690, " ", $vqrange], _
		[-2721, -11319, " ", $vqrange], _
		[-4955, -9362, " ", $vqrange], _
		[-3941, -7271, " ", $vqrange], _
		[-940, -6133, " ", $vqrange], _
		[261, -6858, " ", $vqrange], _
		[3758, -4767, " ", $vqrange], _
		[4545, -5016, " ", $vqrange], _
		[5911, -5223, " ", $vqrange], _
		[2930, -6195, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

