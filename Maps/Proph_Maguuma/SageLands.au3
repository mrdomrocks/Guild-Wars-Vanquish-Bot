#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aSageLandsOutpostPath[2][2] = [ _
	[3592, -9535], _
	[3000, -9480] _
]

Func GoOutSageLands()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $SageLands_Map Then Return

	If $l_i_Map = $SageLands_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> SageLands (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSageLandsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQSageLands()
	If GetMapID() <> $SageLands_Map And GetMapID() <> $SageLands_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SageLands.")
		TravelTo($SageLands_Outpost)
	EndIf

	If GetMapID() = $SageLands_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutSageLands()
		If GetMapID() <> $SageLands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SageLands (" & $SageLands_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $SageLands_Map Then
		CurrentAction("SageLands route waiting - on map " & GetMapID() & ", need " & $SageLands_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SageLands vanquish route.")

	Local $aWaypoints[98][4] = [ _
		[-81, -11732, " ", $vqrange], _
		[-3479, -12318, " ", $vqrange], _
		[-2537, -10644, " ", $vqrange], _
		[-2195, -6371, " ", $vqrange], _
		[-3671, -4068, " ", $vqrange], _
		[-5868, -2466, " ", $vqrange], _
		[-6522, 1604, " ", $vqrange], _
		[-3575, 4083, " ", $vqrange], _
		[-7718, 761, " ", $vqrange], _
		[-4742, -3224, " ", $vqrange], _
		[-2218, -6980, " ", $vqrange], _
		[-3309, -10742, " ", $vqrange], _
		[-4068, -11992, " ", $vqrange], _
		[-8783, -12124, " ", $vqrange], _
		[-13190, -12500, " ", $vqrange], _
		[-17578, -11711, " ", $vqrange], _
		[-19399, -12693, " ", $vqrange], _
		[-19256, -9219, " ", $vqrange], _
		[-19585, -7085, " ", $vqrange], _
		[-19561, -4537, " ", $vqrange], _
		[-19093, -822, " ", $vqrange], _
		[-21695, -793, " ", $vqrange], _
		[-21600, 384, " ", $vqrange], _
		[-23743, -4066, " ", $vqrange], _
		[-19231, -526, " ", $vqrange], _
		[-15404, -235, " ", $vqrange], _
		[-13699, 1023, " ", $vqrange], _
		[-13110, 257, " ", $vqrange], _
		[-12485, -1853, " ", $vqrange], _
		[-14268, -6015, " ", $vqrange], _
		[-12440, -7909, " ", $vqrange], _
		[-8654, -5048, " ", $vqrange], _
		[-10837, -3495, " ", $vqrange], _
		[-9085, -1405, " ", $vqrange], _
		[-5689, -377, " ", $vqrange], _
		[-1283, -948, " ", $vqrange], _
		[2459, -5888, " ", $vqrange], _
		[3462, -5102, " ", $vqrange], _
		[4716, -2864, " ", $vqrange], _
		[8212, -2929, " ", $vqrange], _
		[9628, -5752, " ", $vqrange], _
		[8023, -9806, " ", $vqrange], _
		[7957, -12562, " ", $vqrange], _
		[11740, -12410, " ", $vqrange], _
		[15052, -10372, " ", $vqrange], _
		[16654, -11215, " ", $vqrange], _
		[16694, -12596, " ", $vqrange], _
		[18729, -12565, " ", $vqrange], _
		[21010, -5741, " ", $vqrange], _
		[22233, -12317, " ", $vqrange], _
		[24502, -9666, " ", $vqrange], _
		[25134, -11940, " ", $vqrange], _
		[25780, -12267, " ", $vqrange], _
		[28498, -12694, " ", $vqrange], _
		[28557, -11056, " ", $vqrange], _
		[26460, -11861, " ", $vqrange], _
		[25502, -8803, " ", $vqrange], _
		[25833, -7264, " ", $vqrange], _
		[27837, -6329, " ", $vqrange], _
		[25366, -6438, " ", $vqrange], _
		[24653, -4958, " ", $vqrange], _
		[23659, -3068, " ", $vqrange], _
		[21818, -1878, " ", $vqrange], _
		[23659, -3068, " ", $vqrange], _
		[26271, -3446, " ", $vqrange], _
		[24100, -6860, " ", $vqrange], _
		[23562, -9907, " ", $vqrange], _
		[19184, -2333, " ", $vqrange], _
		[19136, -4254, " ", $vqrange], _
		[19184, -2333, " ", $vqrange], _
		[16998, -294, " ", $vqrange], _
		[14380, 786, " ", $vqrange], _
		[10911, 1720, " ", $vqrange], _
		[15371, 2320, " ", $vqrange], _
		[19764, 716, " ", $vqrange], _
		[24398, 1683, " ", $vqrange], _
		[17620, -4039, " ", $vqrange], _
		[15342, -3770, " ", $vqrange], _
		[14429, -7941, " ", $vqrange], _
		[15342, -3770, " ", $vqrange], _
		[12868, -819, " ", $vqrange], _
		[10583, 1800, " ", $vqrange], _
		[7863, 4329, " ", $vqrange], _
		[4012, -139, " ", $vqrange], _
		[3969, 4661, " ", $vqrange], _
		[435, 6576, " ", $vqrange], _
		[-3437, 6630, " ", $vqrange], _
		[-7634, 9433, " ", $vqrange], _
		[-9369, 12284, " ", $vqrange], _
		[-3886, 12428, " ", $vqrange], _
		[-953, 11054, " ", $vqrange], _
		[3073, 12363, " ", $vqrange], _
		[7196, 11335, " ", $vqrange], _
		[13307, 11660, " ", $vqrange], _
		[16465, 9192, " ", $vqrange], _
		[20551, 11049, " ", $vqrange], _
		[22868, 8518, " ", $vqrange], _
		[27730, 9942, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

