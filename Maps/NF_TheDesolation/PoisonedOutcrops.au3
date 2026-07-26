;Mapped from route notes
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aPoisonedOutcropsOutpostPath[4][2] = [ _
	[1180, 2836], _
	[1180, 2836], _
	[1020, 4093], _
	[2751, 5004] _
]

Func GoOutPoisonedOutcrops()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $PoisonedOutcrops_Map Then Return
	If $l_i_Map = $PoisonedOutcrops_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> PoisonedOutcrops (portal)")
		_Vanquisher_RunAggroPortalPath($aPoisonedOutcropsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQPoisonedOutcrops()
	If GetMapID() <> $PoisonedOutcrops_Map And GetMapID() <> $PoisonedOutcrops_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for PoisonedOutcrops.")
		TravelTo($PoisonedOutcrops_Outpost)
	EndIf

	If GetMapID() = $PoisonedOutcrops_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutPoisonedOutcrops()
		If GetMapID() <> $PoisonedOutcrops_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need PoisonedOutcrops (" & $PoisonedOutcrops_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $PoisonedOutcrops_Map Then
		CurrentAction("PoisonedOutcrops route waiting - on map " & GetMapID() & ", need " & $PoisonedOutcrops_Map & ".")
		Return
	EndIf

	CurrentAction("Starting PoisonedOutcrops vanquish route.")
	Local $aWaypoints[195][4] = [ _
		[17451, -8840, "shrine", $vqrange], _
		[20526, -8677, " ", $vqrange], _
		[21462, -9624, " ", $vqrange], _
		[22944, -10486, " ", $vqrange], _
		[24635, -10667, " ", $vqrange], _
		[24467, -9177, " ", $vqrange], _
		[24110, -8155, " ", $vqrange], _
		[23200, -6490, " ", $vqrange], _
		[22649, -6978, " ", $vqrange], _
		[25009, -5881, " ", $vqrange], _
		[25779, -5243, " ", $vqrange], _
		[27196, -5324, " ", $vqrange], _
		[27602, -6666, " ", $vqrange], _
		[27660, -8453, " ", $vqrange], _
		[26554, -10305, " ", $vqrange], _
		[24824, -8163, " ", $vqrange], _
		[24439, -6257, " ", $vqrange], _
		[25203, -4933, " ", $vqrange], _
		[25703, -4011, " ", $vqrange], _
		[25968, -2260, " ", $vqrange], _
		[25545, -1074, " ", $vqrange], _
		[24491, -1053, " ", $vqrange], _
		[23353, -1355, " ", $vqrange], _
		[21812, -1770, " ", $vqrange], _
		[20793, -2049, " ", $vqrange], _
		[19798, -1427, " ", $vqrange], _
		[19247, -677, " ", $vqrange], _
		[18351, 365, " ", $vqrange], _
		[17330, 651, " ", $vqrange], _
		[16350, 427, " ", $vqrange], _
		[15531, 103, " ", $vqrange], _
		[15277, -752, " ", $vqrange], _
		[16626, -2328, " ", $vqrange], _
		[17865, -3226, " ", $vqrange], _
		[18810, -3992, " ", $vqrange], _
		[17650, -3985, " ", $vqrange], _
		[15762, -3948, " ", $vqrange], _
		[14455, -3983, " ", $vqrange], _
		[16309, -3649, " ", $vqrange], _
		[17373, -4838, " ", $vqrange], _
		[15872, -6592, " ", $vqrange], _
		[14490, -7398, " ", $vqrange], _
		[14772, -8138, " ", $vqrange], _
		[13370, -7439, " ", $vqrange], _
		[12433, -7234, " ", $vqrange], _
		[10857, -6837, " ", $vqrange], _
		[9481, -7278, " ", $vqrange], _
		[7150, -7133, " ", $vqrange], _
		[7045, -5694, " ", $vqrange], _
		[8154, -4173, " ", $vqrange], _
		[9129, -2583, " ", $vqrange], _
		[9835, -874, " ", $vqrange], _
		[10114, -216, " ", $vqrange], _
		[8758, -4135, " ", $vqrange], _
		[11131, -3689, " ", $vqrange], _
		[13182, -4719, " ", $vqrange], _
		[12789, -2708, " ", $vqrange], _
		[12660, -1895, " ", $vqrange], _
		[12459, -450, " ", $vqrange], _
		[12318, 1242, " ", $vqrange], _
		[14456, 2970, " ", $vqrange], _
		[13272, 3952, " ", $vqrange], _
		[12092, 4322, " ", $vqrange], _
		[11473, 3712, " ", $vqrange], _
		[10588, 4176, " ", $vqrange], _
		[9450, 5242, " ", $vqrange], _
		[8513, 4878, " ", $vqrange], _
		[6574, 4343, " ", $vqrange], _
		[5466, 3632, " ", $vqrange], _
		[4170, 2655, " ", $vqrange], _
		[3060, 1816, " ", $vqrange], _
		[1355, 2281, " ", $vqrange], _
		[1238, 3312, " ", $vqrange], _
		[1871, 4125, " ", $vqrange], _
		[2720, 4826, " ", $vqrange], _
		[4045, 5897, " ", $vqrange], _
		[2264, 4691, " ", $vqrange], _
		[83, 3759, " ", $vqrange], _
		[-563, 4793, " ", $vqrange], _
		[-641, 2406, " ", $vqrange], _
		[-430, 1203, " ", $vqrange], _
		[-627, -753, " ", $vqrange], _
		[830, -3105, " ", $vqrange], _
		[2511, -3037, " ", $vqrange], _
		[-110, -2280, " ", $vqrange], _
		[-1826, -2190, " ", $vqrange], _
		[-3799, -2454, " ", $vqrange], _
		[-3143, -1704, " ", $vqrange], _
		[-2444, -898, " ", $vqrange], _
		[-1617, 244, " ", $vqrange], _
		[-1360, 1433, " ", $vqrange], _
		[-1782, 1717, " ", $vqrange], _
		[-3571, 2077, " ", $vqrange], _
		[-4924, 948, " ", $vqrange], _
		[-5905, -453, " ", $vqrange], _
		[-5431, 300, " ", $vqrange], _
		[-4129, 3001, " ", $vqrange], _
		[-4089, 3800, " ", $vqrange], _
		[-4959, 4670, " ", $vqrange], _
		[-5375, 5209, " ", $vqrange], _
		[-5591, 5943, " ", $vqrange], _
		[-5889, 6956, " ", $vqrange], _
		[-5100, 7607, " ", $vqrange], _
		[-4543, 8204, " ", $vqrange], _
		[-4048, 8797, " ", $vqrange], _
		[-3511, 9586, " ", $vqrange], _
		[-2473, 10472, " ", $vqrange], _
		[-38, 12059, " ", $vqrange], _
		[-870, 9157, " ", $vqrange], _
		[-1574, 10348, " ", $vqrange], _
		[-2225, 10784, " ", $vqrange], _
		[-3323, 10006, " ", $vqrange], _
		[-4770, 8379, " ", $vqrange], _
		[-5151, 7646, " ", $vqrange], _
		[-5733, 6860, " ", $vqrange], _
		[-5600, 6734, " ", $vqrange], _
		[-6384, 6096, " ", $vqrange], _
		[-8064, 4905, " ", $vqrange], _
		[-9233, 3945, " ", $vqrange], _
		[-10036, 3249, " ", $vqrange], _
		[-11388, 1908, " ", $vqrange], _
		[-13115, 1697, " ", $vqrange], _
		[-12939, 3732, " ", $vqrange], _
		[-12063, 4641, " ", $vqrange], _
		[-10730, 5238, " ", $vqrange], _
		[-9854, 6098, " ", $vqrange], _
		[-10322, 8207, " ", $vqrange], _
		[-9872, 9548, " ", $vqrange], _
		[-8447, 11164, " ", $vqrange], _
		[-9026, 11550, " ", $vqrange], _
		[-9028, 12695, " ", $vqrange], _
		[-9680, 12835, " ", $vqrange], _
		[-11616, 13076, " ", $vqrange], _
		[-13165, 12613, " ", $vqrange], _
		[-14519, 11923, " ", $vqrange], _
		[-15360, 11444, " ", $vqrange], _
		[-14368, 11938, " ", $vqrange], _
		[-12590, 12805, " ", $vqrange], _
		[-10813, 12611, " ", $vqrange], _
		[-10333, 11735, " ", $vqrange], _
		[-10782, 10733, " ", $vqrange], _
		[-11460, 10223, " ", $vqrange], _
		[-12855, 9092, " ", $vqrange], _
		[-13844, 8893, " ", $vqrange], _
		[-14997, 8480, " ", $vqrange], _
		[-17120, 6851, " ", $vqrange], _
		[-15781, 8531, " ", $vqrange], _
		[-15804, 8562, " ", $vqrange], _
		[-16909, 9558, " ", $vqrange], _
		[-18518, 9766, " ", $vqrange], _
		[-20399, 9785, " ", $vqrange], _
		[-20135, 7721, " ", $vqrange], _
		[-22129, 7173, " ", $vqrange], _
		[-21412, 4200, " ", $vqrange], _
		[-22208, 4462, " ", $vqrange], _
		[-22208, 4462, " ", $vqrange], _
		[-23521, 4523, " ", $vqrange], _
		[-24001, 4497, " ", $vqrange], _
		[-23984, 2959, " ", $vqrange], _
		[-22560, 1422, " ", $vqrange], _
		[-24657, 1412, " ", $vqrange], _
		[-23133, 75, " ", $vqrange], _
		[-23133, 75, " ", $vqrange], _
		[-22807, 398, " ", $vqrange], _
		[-21127, -768, " ", $vqrange], _
		[-20738, -1020, " ", $vqrange], _
		[-19483, -142, " ", $vqrange], _
		[-18240, 1098, " ", $vqrange], _
		[-16942, 693, " ", $vqrange], _
		[-15021, 895, " ", $vqrange], _
		[-14839, 2075, " ", $vqrange], _
		[-15172, 3189, " ", $vqrange], _
		[-14957, 4545, " ", $vqrange], _
		[-13812, 5313, " ", $vqrange], _
		[-15946, 3843, " ", $vqrange], _
		[-16450, 1632, " ", $vqrange], _
		[-17229, 1124, " ", $vqrange], _
		[-17325, -201, " ", $vqrange], _
		[-16835, -2583, " ", $vqrange], _
		[-16010, -2288, " ", $vqrange], _
		[-14853, -1495, " ", $vqrange], _
		[-14131, -705, " ", $vqrange], _
		[-12854, 744, " ", $vqrange], _
		[-12502, 1629, " ", $vqrange], _
		[-14197, -366, " ", $vqrange], _
		[-15144, -803, " ", $vqrange], _
		[-16522, -904, " ", $vqrange], _
		[-17494, -932, " ", $vqrange], _
		[-18888, -1238, " ", $vqrange], _
		[-20428, -1566, " ", $vqrange], _
		[-21169, -2018, " ", $vqrange], _
		[-23293, -2793, " ", $vqrange], _
		[-22659, -4411, " ", $vqrange], _
		[-23128, -5555, " ", $vqrange], _
		[-24914, -6306, " ", $vqrange]]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
