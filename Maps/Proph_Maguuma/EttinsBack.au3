#include <Array.au3>
; Map update by Crux
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aEttinsBackOutpostPath[2][2] = [ _
	[-14497.57, 835.94], _
	[-15074.91, 437.85] _
]

Func GoOutEttinsBack()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $EttinsBack_Map Then Return

	If $l_i_Map = $EttinsBack_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> EttinsBack (portal 1)")
		_Vanquisher_RunAggroPortalPath($aEttinsBackOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQEttinsBack()
	If GetMapID() <> $EttinsBack_Map And GetMapID() <> $EttinsBack_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for EttinsBack.")
		TravelTo($EttinsBack_Outpost)
	EndIf

	If GetMapID() = $EttinsBack_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutEttinsBack()
		If GetMapID() <> $EttinsBack_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need EttinsBack (" & $EttinsBack_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $EttinsBack_Map Then
		CurrentAction("EttinsBack route waiting - on map " & GetMapID() & ", need " & $EttinsBack_Map & ".")
		Return
	EndIf

	CurrentAction("Starting EttinsBack vanquish route.")

	Local $aWaypoints[221][4] = [ _
		[-17857, -1292, " ", $vqrange], _
		[-18794, -770, " ", $vqrange], _
		[-19825, 392, " ", $vqrange], _
		[-20277, 973, " ", $vqrange], _
		[-20900, 988, " ", $vqrange], _
		[-22425, 1148, " ", $vqrange], _
		[-23226, 2473, " ", $vqrange], _
		[-24205, 2389, " ", $vqrange], _
		[-24842, 1408, " ", $vqrange], _
		[-24100, -138, " ", $vqrange], _
		[-25940, -200, " ", $vqrange], _
		[-25257, -1972, " ", $vqrange], _
		[-25608, -2393, " ", $vqrange], _
		[-27744, -1152, " ", $vqrange], _
		[-26906, 687, " ", $vqrange], _
		[-27076, 3793, " ", $vqrange], _
		[-26707, 5613, " ", $vqrange], _
		[-25777, 6282, " ", $vqrange], _
		[-24943, 5572, " ", $vqrange], _
		[-23404, 5803, " ", $vqrange], _
		[-21932, 6316, " ", $vqrange], _
		[-18491, 8007, " ", $vqrange], _
		[-18722, 8378, " ", $vqrange], _
		[-19779, 9997, " ", $vqrange], _
		[-19954, 10436, " ", $vqrange], _
		[-20797, 12056, " ", $vqrange], _
		[-19539, 9359, " ", $vqrange], _
		[-18117, 8188, " ", $vqrange], _
		[-15871, 8466, " ", $vqrange], _
		[-14606, 7649, " ", $vqrange], _
		[-14368, 7107, " ", $vqrange], _
		[-13815, 6568, " ", $vqrange], _
		[-11174, 5050, " ", $vqrange], _
		[-10914, 5745, " ", $vqrange], _
		[-8963, 7381, " ", $vqrange], _
		[-8015, 8024, " ", $vqrange], _
		[-7552, 8624, " ", $vqrange], _
		[-7836, 9288, " ", $vqrange], _
		[-7938, 9707, " ", $vqrange], _
		[-8321, 11609, " ", $vqrange], _
		[-8195, 13240, " ", $vqrange], _
		[-9134, 12924, " ", $vqrange], _
		[-10267, 12973, " ", $vqrange], _
		[-11494, 12796, " ", $vqrange], _
		[-12653, 12861, " ", $vqrange], _
		[-14567, 12673, " ", $vqrange], _
		[-16089, 12793, " ", $vqrange], _
		[-18277, 13232, " ", $vqrange], _
		[-19702, 12640, " ", $vqrange], _
		[-20618, 12083, " ", $vqrange], _
		[-20075, 12590, " ", $vqrange], _
		[-14532, 12725, " ", $vqrange], _
		[-13001, 12951, " ", $vqrange], _
		[-9312, 12948, " ", $vqrange], _
		[-8093, 11358, " ", $vqrange], _
		[-7755, 10267, " ", $vqrange], _
		[-6585, 9279, " ", $vqrange], _
		[-5218, 8525, " ", $vqrange], _
		[-4826, 8278, " ", $vqrange], _
		[-3459, 7581, " ", $vqrange], _
		[-1865, 7101, " ", $vqrange], _
		[-954, 7527, " ", $vqrange], _
		[-1110, 8171, " ", $vqrange], _
		[-1299, 9309, " ", $vqrange], _
		[-1209, 11113, " ", $vqrange], _
		[-925, 11916, " ", $vqrange], _
		[489, 12124, " ", $vqrange], _
		[1010, 12008, " ", $vqrange], _
		[2297, 11823, " ", $vqrange], _
		[2797, 11980, " ", $vqrange], _
		[4708, 12338, " ", $vqrange], _
		[6628, 12341, " ", $vqrange], _
		[8123, 12435, " ", $vqrange], _
		[9237, 9563, " ", $vqrange], _
		[9075, 9308, " ", $vqrange], _
		[8936, 8628, " ", $vqrange], _
		[8706, 7784, " ", $vqrange], _
		[7513, 6791, " ", $vqrange], _
		[6446, 6122, " ", $vqrange], _
		[4480, 4918, " ", $vqrange], _
		[4273, 4871, " ", $vqrange], _
		[3452, 4711, " ", $vqrange], _
		[1371, 3132, " ", $vqrange], _
		[1715, 2514, " ", $vqrange], _
		[2904, 1577, " ", $vqrange], _
		[3866, 1399, " ", $vqrange], _
		[4975, 1770, " ", $vqrange], _
		[6497, 1988, " ", $vqrange], _
		[7115, 363, " ", $vqrange], _
		[7187, -1164, " ", $vqrange], _
		[7205, -2335, " ", $vqrange], _
		[7148, -3262, " ", $vqrange], _
		[6674, -5908, " ", $vqrange], _
		[5959, -7294, " ", $vqrange], _
		[5708, -7765, " ", $vqrange], _
		[5084, -8566, " ", $vqrange], _
		[3391, -8911, " ", $vqrange], _
		[3426, -8938, " ", $vqrange], _
		[4533, -10249, " ", $vqrange], _
		[4402, -10454, " ", $vqrange], _
		[3782, -12696, " ", $vqrange], _
		[1725, -12677, " ", $vqrange], _
		[687, -12062, " ", $vqrange], _
		[-592, -11196, " ", $vqrange], _
		[-1628, -9547, " ", $vqrange], _
		[-2592, -8912, " ", $vqrange], _
		[-3431, -8968, " ", $vqrange], _
		[-4484, -9627, " ", $vqrange], _
		[-5593, -10354, " ", $vqrange], _
		[-7372, -8652, " ", $vqrange], _
		[-9651, -7062, " ", $vqrange], _
		[-9500, -6342, " ", $vqrange], _
		[-10899, -4633, " ", $vqrange], _
		[-11790, -6734, " ", $vqrange], _
		[-12464, -7630, " ", $vqrange], _
		[-12646, -8073, " ", $vqrange], _
		[-12849, -10006, " ", $vqrange], _
		[-13224, -11102, " ", $vqrange], _
		[-13229, -12003, " ", $vqrange], _
		[-12385, -14127, " ", $vqrange], _
		[-13654, -13232, " ", $vqrange], _
		[-14911, -12312, " ", $vqrange], _
		[-16173, -10544, " ", $vqrange], _
		[-17915, -8871, " ", $vqrange], _
		[-19262, -7534, " ", $vqrange], _
		[-19746, -8772, " ", $vqrange], _
		[-18370, -8652, " ", $vqrange], _
		[-15903, -9802, " ", $vqrange], _
		[-14212, -9901, " ", $vqrange], _
		[-13484, -9876, " ", $vqrange], _
		[-13269, -7960, " ", $vqrange], _
		[-14174, -6844, " ", $vqrange], _
		[-14629, -4970, " ", $vqrange], _
		[-15987, -2806, " ", $vqrange], _
		[-17633, -1761, " ", $vqrange], _
		[-18627, 173, " ", $vqrange], _
		[-16011, -2497, " ", $vqrange], _
		[-15186, -3322, " ", $vqrange], _
		[-14597, -4730, " ", $vqrange], _
		[-13757, -7243, " ", $vqrange], _
		[-12574, -8840, " ", $vqrange], _
		[-13170, -10640, " ", $vqrange], _
		[-13269, -12595, " ", $vqrange], _
		[-14245, -13220, " ", $vqrange], _
		[-14863, -12260, " ", $vqrange], _
		[-15903, -11927, " ", $vqrange], _
		[-16056, -10219, " ", $vqrange], _
		[-17189, -9175, " ", $vqrange], _
		[-15517, -10031, " ", $vqrange], _
		[-13334, -9976, " ", $vqrange], _
		[-12627, -8760, " ", $vqrange], _
		[-12182, -7311, " ", $vqrange], _
		[-11224, -5221, " ", $vqrange], _
		[-9442, -5541, " ", $vqrange], _
		[-8343, -7577, " ", $vqrange], _
		[-6638, -8394, " ", $vqrange], _
		[-5280, -8972, " ", $vqrange], _
		[-3570, -8900, " ", $vqrange], _
		[-2018, -8826, " ", $vqrange], _
		[-552, -6785, " ", $vqrange], _
		[-306, -6316, " ", $vqrange], _
		[630, -5125, " ", $vqrange], _
		[1120, -4075, " ", $vqrange], _
		[1592, -2657, " ", $vqrange], _
		[-3729, -2020, " ", $vqrange], _
		[2080, -1185, " ", $vqrange], _
		[2468, 298, " ", $vqrange], _
		[4300, 1405, " ", $vqrange], _
		[5816, 1708, " ", $vqrange], _
		[7141, 717, " ", $vqrange], _
		[7138, 698, " ", $vqrange], _
		[9628, 1433, " ", $vqrange], _
		[10434, 198, " ", $vqrange], _
		[11741, -1226, " ", $vqrange], _
		[12313, -3042, " ", $vqrange], _
		[12265, -3296, " ", $vqrange], _
		[11907, -5761, " ", $vqrange], _
		[13930, -4594, " ", $vqrange], _
		[15048, -4511, " ", $vqrange], _
		[14823, -4409, " ", $vqrange], _
		[13122, -4604, " ", $vqrange], _
		[12105, -3073, " ", $vqrange], _
		[12389, -2021, " ", $vqrange], _
		[10241, 674, " ", $vqrange], _
		[10888, 2471, " ", $vqrange], _
		[11955, 3576, " ", $vqrange], _
		[12889, 3712, " ", $vqrange], _
		[12126, 5196, " ", $vqrange], _
		[12265, 5774, " ", $vqrange], _
		[13011, 7129, " ", $vqrange], _
		[13562, 8158, " ", $vqrange], _
		[13692, 8639, " ", $vqrange], _
		[14587, 8961, " ", $vqrange], _
		[16026, 8681, " ", $vqrange], _
		[16733, 8112, " ", $vqrange], _
		[17256, 7665, " ", $vqrange], _
		[17837, 7410, " ", $vqrange], _
		[17729, 8103, " ", $vqrange], _
		[18813, 9024, " ", $vqrange], _
		[19754, 8874, " ", $vqrange], _
		[20664, 8950, " ", $vqrange], _
		[21364, 7135, " ", $vqrange], _
		[21780, 5676, " ", $vqrange], _
		[21860, 5302, " ", $vqrange], _
		[22161, 3393, " ", $vqrange], _
		[22698, 2357, " ", $vqrange], _
		[22266, 2268, " ", $vqrange], _
		[19939, 2362, " ", $vqrange], _
		[17918, 1338, " ", $vqrange], _
		[17398, 895, " ", $vqrange], _
		[17117, 904, " ", $vqrange], _
		[14685, 1989, " ", $vqrange], _
		[16831, 551, " ", $vqrange], _
		[19060, 2180, " ", $vqrange], _
		[20209, 2348, " ", $vqrange], _
		[22412, 3742, " ", $vqrange], _
		[21884, 4777, " ", $vqrange], _
		[21635, 6296, " ", $vqrange], _
		[21000, 9479, " ", $vqrange], _
		[23099, 9925, " ", $vqrange], _
		[24769, 8647, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc



