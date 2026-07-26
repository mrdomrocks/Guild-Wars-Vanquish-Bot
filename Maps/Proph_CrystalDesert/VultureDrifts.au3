#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutVultureDrifts()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $VultureDrifts_Map Then Return

	If $l_i_Map = $VultureDrifts_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> VultureDrifts (portal 1)")
		_Vanquisher_RunAggroPortalPath($aVultureDriftsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQVultureDrifts()
	If GetMapID() <> $VultureDrifts_Map And GetMapID() <> $VultureDrifts_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for VultureDrifts.")
		TravelTo($VultureDrifts_Outpost)
	EndIf

	If GetMapID() = $VultureDrifts_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutVultureDrifts()
		If GetMapID() <> $VultureDrifts_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need VultureDrifts (" & $VultureDrifts_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $VultureDrifts_Map Then
		CurrentAction("VultureDrifts route waiting - on map " & GetMapID() & ", need " & $VultureDrifts_Map & ".")
		Return
	EndIf

	CurrentAction("Starting VultureDrifts vanquish route.")

	Local $aWaypoints[194][4] = [ _
		[-4959, -13118, " ", $vqrange], _
		[-3338, -11417, " ", $vqrange], _
		[-3848, -14051, " ", $vqrange], _
		[-2214, -14070, " ", $vqrange], _
		[-1808, -13724, " ", $vqrange], _
		[-1183, -12949, " ", $vqrange], _
		[-348, -11876, " ", $vqrange], _
		[485, -10638, " ", $vqrange], _
		[758, -10726, " ", $vqrange], _
		[631, -10011, " ", $vqrange], _
		[1153, -8888, " ", $vqrange], _
		[708, -8339, " ", $vqrange], _
		[437, -8115, " ", $vqrange], _
		[-294, -7678, " ", $vqrange], _
		[-865, -7363, " ", $vqrange], _
		[-1460, -7252, " ", $vqrange], _
		[-1460, -7252, " ", $vqrange], _
		[-2473, -5931, " ", $vqrange], _
		[-2670, -5461, " ", $vqrange], _
		[-1666, -4661, " ", $vqrange], _
		[222, -3761, " ", $vqrange], _
		[652, -3363, " ", $vqrange], _
		[80, -2923, " ", $vqrange], _
		[-1392, -3032, " ", $vqrange], _
		[-1799, -2936, " ", $vqrange], _
		[-3121, -2869, " ", $vqrange], _
		[-3550, -1430, " ", $vqrange], _
		[-3657, -1080, " ", $vqrange], _
		[-4290, -9, " ", $vqrange], _
		[-4789, 1874, " ", $vqrange], _
		[-5292, 1753, " ", $vqrange], _
		[-6082, 1241, " ", $vqrange], _
		[-7190, 896, " ", $vqrange], _
		[-7364, 957, " ", $vqrange], _
		[-7484, 1276, " ", $vqrange], _
		[-7904, 264, " ", $vqrange], _
		[-7933, -706, " ", $vqrange], _
		[-7446, -1856, " ", $vqrange], _
		[-7329, -2145, " ", $vqrange], _
		[-7259, -2918, " ", $vqrange], _
		[-7990, -5995, " ", $vqrange], _
		[-8833, -6808, " ", $vqrange], _
		[-8211, -5792, " ", $vqrange], _
		[-7443, -3713, " ", $vqrange], _
		[-8519, -2104, " ", $vqrange], _
		[-8759, -4112, " ", $vqrange], _
		[-10996, -3501, " ", $vqrange], _
		[-10715, -1879, " ", $vqrange], _
		[-2171, -131, " ", $vqrange], _
		[-458, 820, " ", $vqrange], _
		[327, 2068, " ", $vqrange], _
		[1653, 2717, " ", $vqrange], _
		[2725, 5400, " ", $vqrange], _
		[3161, 5968, " ", $vqrange], _
		[3841, 7037, " ", $vqrange], _
		[4928, 8641, " ", $vqrange], _
		[6636, 8938, " ", $vqrange], _
		[5452, 9846, " ", $vqrange], _
		[5115, 10084, " ", $vqrange], _
		[2234, 11251, " ", $vqrange], _
		[-428, 9322, " ", $vqrange], _
		[-428, 9322, " ", $vqrange], _
		[-1390, 8848, " ", $vqrange], _
		[-2295, 7534, " ", $vqrange], _
		[-5099, 6964, " ", $vqrange], _
		[-7403, 6668, " ", $vqrange], _
		[-8543, 6454, " ", $vqrange], _
		[-10073, 6215, " ", $vqrange], _
		[-15358, 4287, " ", $vqrange], _
		[-16198, 3859, " ", $vqrange], _
		[-18914, 3096, " ", $vqrange], _
		[-18820, 378, " ", $vqrange], _
		[-18245, -1068, " ", $vqrange], _
		[-17035, -4515, " ", $vqrange], _
		[-15408, -3924, " ", $vqrange], _
		[-15448, -4908, " ", $vqrange], _
		[-15405, -6963, " ", $vqrange], _
		[-15243, -7420, " ", $vqrange], _
		[-13890, -7664, " ", $vqrange], _
		[-13303, -7906, " ", $vqrange], _
		[-11313, -9065, " ", $vqrange], _
		[-10282, -9859, " ", $vqrange], _
		[-8666, -10534, " ", $vqrange], _
		[-7203, -12609, " ", $vqrange], _
		[-7978, -13387, " ", $vqrange], _
		[-9344, -16844, " ", $vqrange], _
		[-8497, -17824, " ", $vqrange], _
		[-6791, -18726, " ", $vqrange], _
		[-6158, -19333, " ", $vqrange], _
		[-2988, -18822, " ", $vqrange], _
		[-2529, -18407, " ", $vqrange], _
		[-3, -19433, " ", $vqrange], _
		[4031, -19951, " ", $vqrange], _
		[5831, -19377, " ", $vqrange], _
		[7636, -20005, " ", $vqrange], _
		[11118, -21097, " ", $vqrange], _
		[12541, -19537, " ", $vqrange], _
		[12227, -16584, " ", $vqrange], _
		[14361, -15303, " ", $vqrange], _
		[14888, -15298, " ", $vqrange], _
		[16304, -16050, " ", $vqrange], _
		[10449, -14928, " ", $vqrange], _
		[9348, -14923, " ", $vqrange], _
		[5878, -16679, " ", $vqrange], _
		[4471, -15586, " ", $vqrange], _
		[2836, -15602, " ", $vqrange], _
		[-793, -14828, " ", $vqrange], _
		[-1422, -18892, " ", $vqrange], _
		[-6520, -18871, " ", $vqrange], _
		[-9278, -16835, " ", $vqrange], _
		[-7293, -12759, " ", $vqrange], _
		[-9404, -10323, " ", $vqrange], _
		[-16062, -7208, " ", $vqrange], _
		[-15929, -4935, " ", $vqrange], _
		[-15046, -2480, " ", $vqrange], _
		[-17369, 393, " ", $vqrange], _
		[-16066, 4447, " ", $vqrange], _
		[-14986, 4633, " ", $vqrange], _
		[-14277, 4665, " ", $vqrange], _
		[-10455, 6208, " ", $vqrange], _
		[-8191, 9501, " ", $vqrange], _
		[-9502, 10956, " ", $vqrange], _
		[-10351, 12183, " ", $vqrange], _
		[-11344, 11941, " ", $vqrange], _
		[-12773, 11330, " ", $vqrange], _
		[-14755, 10093, " ", $vqrange], _
		[-15672, 9401, " ", $vqrange], _
		[-17915, 8715, " ", $vqrange], _
		[-18581, 9329, " ", $vqrange], _
		[-18877, 10009, " ", $vqrange], _
		[-20343, 10622, " ", $vqrange], _
		[-20859, 12826, " ", $vqrange], _
		[-20869, 13526, " ", $vqrange], _
		[-19510, 13916, " ", $vqrange], _
		[-19388, 13586, " ", $vqrange], _
		[-17846, 13747, " ", $vqrange], _
		[-15771, 13725, " ", $vqrange], _
		[-11272, 13835, " ", $vqrange], _
		[-9122, 11802, " ", $vqrange], _
		[-4704, 8784, " ", $vqrange], _
		[-4650, 12295, " ", $vqrange], _
		[-2863, 13139, " ", $vqrange], _
		[-3358, 17369, " ", $vqrange], _
		[-4671, 17869, " ", $vqrange], _
		[-2957, 13260, " ", $vqrange], _
		[-2971, 13164, " ", $vqrange], _
		[-1301, 10088, " ", $vqrange], _
		[785, 11765, " ", $vqrange], _
		[3049, 13242, " ", $vqrange], _
		[5219, 14013, " ", $vqrange], _
		[7277, 14138, " ", $vqrange], _
		[8159, 13360, " ", $vqrange], _
		[9064, 12637, " ", $vqrange], _
		[9450, 12277, " ", $vqrange], _
		[11167, 9703, " ", $vqrange], _
		[12682, 8195, " ", $vqrange], _
		[10562, 10506, " ", $vqrange], _
		[9957, 11734, " ", $vqrange], _
		[10578, 10684, " ", $vqrange], _
		[12039, 8483, " ", $vqrange], _
		[14317, 7911, " ", $vqrange], _
		[15191, 13913, " ", $vqrange], _
		[14850, 8811, " ", $vqrange], _
		[14892, 8856, " ", $vqrange], _
		[12803, 7225, " ", $vqrange], _
		[12725, 3644, " ", $vqrange], _
		[14032, 796, " ", $vqrange], _
		[14507, -507, " ", $vqrange], _
		[14909, -1577, " ", $vqrange], _
		[15478, -2027, " ", $vqrange], _
		[15766, -2125, " ", $vqrange], _
		[16099, -2837, " ", $vqrange], _
		[15737, -3170, " ", $vqrange], _
		[14881, -3934, " ", $vqrange], _
		[14555, -4902, " ", $vqrange], _
		[14979, -5533, " ", $vqrange], _
		[14577, -5805, " ", $vqrange], _
		[13078, -6037, " ", $vqrange], _
		[11792, -6101, " ", $vqrange], _
		[11477, -6350, " ", $vqrange], _
		[9976, -7592, " ", $vqrange], _
		[9380, -8079, " ", $vqrange], _
		[8884, -8411, " ", $vqrange], _
		[7926, -9075, " ", $vqrange], _
		[6918, -9428, " ", $vqrange], _
		[5364, -9415, " ", $vqrange], _
		[4898, -8035, " ", $vqrange], _
		[5435, -6226, " ", $vqrange], _
		[5214, -5629, " ", $vqrange], _
		[3469, -4182, " ", $vqrange], _
		[2759, -3991, " ", $vqrange], _
		[2815, -3549, " ", $vqrange], _
		[4384, -497, " ", $vqrange], _
		[6506, -548, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

