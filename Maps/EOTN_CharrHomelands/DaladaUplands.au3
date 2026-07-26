;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aDaladaUplandsOutpostPath[1][2] = [ _
	[-15789, 14108]]

Func GoOutDaladaUplands()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $DaladaUplands_Map Then Return
	If $l_i_Map = $DaladaUplands_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Doomlore Shrine -> Dalada Uplands (portal).")
		_Vanquisher_RunAggroPortalPath($aDaladaUplandsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQDaladaUplands()
	If GetMapID() <> $DaladaUplands_Map And GetMapID() <> $DaladaUplands_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DaladaUplands.")
		TravelTo($DaladaUplands_Outpost)
	EndIf
	If GetMapID() = $DaladaUplands_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutDaladaUplands()
		If GetMapID() <> $DaladaUplands_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DaladaUplands (" & $DaladaUplands_Map & ").")
			Return
	EndIf
	EndIf
	If GetMapID() <> $DaladaUplands_Map Then
		CurrentAction("DaladaUplands route waiting - on map " & GetMapID() & ", need " & $DaladaUplands_Map & ".")
		Return
	EndIf
	CurrentAction("Starting DaladaUplands vanquish route.")
	Local $aWaypoints[199][4] = [ _
		[-14310, 12724, " ", $vqrange], _
		[-14971, 11013, "shrine", $vqrange], _
		[-17460, 10298, " ", $vqrange], _
		[-19296, 9646, " ", $vqrange], _
		[-17622, 7650, " ", $vqrange], _
		[-17027, 5210, " ", $vqrange], _
		[-18952, 3847, " ", $vqrange], _
		[-17988, 3429, " ", $vqrange], _
		[-15575, 4376, " ", $vqrange], _
		[-13273, 5414, " ", $vqrange], _
		[-10931, 4347, " ", $vqrange], _
		[-8672, 5620, " ", $vqrange], _
		[-7569, 3340, " ", $vqrange], _
		[-9868, 2151, " ", $vqrange], _
		[-12081, 3420, " ", $vqrange], _
		[-13326, 1162, " ", $vqrange], _
		[-11668, 112, " ", $vqrange], _
		[-12003, -303, " ", $vqrange], _
		[-13838, -1316, " ", $vqrange], _
		[-14913, -3685, " ", $vqrange], _
		[-12458, -3055, " ", $vqrange], _
		[-10009, -3694, " ", $vqrange], _
		[-7467, -3254, " ", $vqrange], _
		[-7781, -699, " ", $vqrange], _
		[-9450, -2685, " ", $vqrange], _
		[-11064, -4741, " ", $vqrange], _
		[-12818, -6627, " ", $vqrange], _
		[-14100, -8039, " ", $vqrange], _
		[-15384, -6564, " ", $vqrange], _
		[-17154, -4690, " ", $vqrange], _
		[-17557, -2144, " ", $vqrange], _
		[-17566, 440, "shrine", $vqrange], _
		[-19745, 164, " ", $vqrange], _
		[-17632, -1374, " ", $vqrange], _
		[-17819, -3962, " ", $vqrange], _
		[-18321, -6480, " ", $vqrange], _
		[-18204, -9027, " ", $vqrange], _
		[-17805, -11564, " ", $vqrange], _
		[-16757, -13891, " ", $vqrange], _
		[-13857, -12093, " ", $vqrange], _
		[-15127, -14371, " ", $vqrange], _
		[-15769, -16810, " ", $vqrange], _
		[-14196, -18255, " ", $vqrange], _
		[-13368, -16913, " ", $vqrange], _
		[-14094, -18217, " ", $vqrange], _
		[-12501, -18709, " ", $vqrange], _
		[-12078, -16205, " ", $vqrange], _
		[-9829, -15054, " ", $vqrange], _
		[-7879, -13483, " ", $vqrange], _
		[-7683, -11792, " ", $vqrange], _
		[-5633, -12278, " ", $vqrange], _
		[-3977, -11438, "shrine", $vqrange], _
		[-4354, -14049, " ", $vqrange], _
		[-5205, -16425, " ", $vqrange], _
		[-7334, -17769, " ", $vqrange], _
		[-9187, -15978, " ", $vqrange], _
		[-10192, -13607, " ", $vqrange], _
		[-11383, -11227, " ", $vqrange], _
		[-12405, -8918, " ", $vqrange], _
		[-10563, -7079, " ", $vqrange], _
		[-8685, -5363, " ", $vqrange], _
		[-6757, -3638, " ", $vqrange], _
		[-4888, -1896, " ", $vqrange], _
		[-5275, 681, " ", $vqrange], _
		[-2610, -1663, " ", $vqrange], _
		[-3101, -32, " ", $vqrange], _
		[-2641, 449, "shrine", $vqrange], _
		[-4223, 1414, " ", $vqrange], _
		[-2779, 2954, " ", $vqrange], _
		[-315, 3380, " ", $vqrange], _
		[1007, 1249, " ", $vqrange], _
		[1516, -1231, " ", $vqrange], _
		[1838, -1532, " ", $vqrange], _
		[4062, -1698, " ", $vqrange], _
		[4657, -4137, " ", $vqrange], _
		[7207, -4360, " ", $vqrange], _
		[8655, -3971, "shrine", $vqrange], _
		[9179, -1430, " ", $vqrange], _
		[10411, 859, " ", $vqrange], _
		[10176, 3360, " ", $vqrange], _
		[12637, 2831, " ", $vqrange], _
		[15210, 3037, " ", $vqrange], _
		[16385, 726, " ", $vqrange], _
		[18566, 239, " ", $vqrange], _
		[16036, 423, " ", $vqrange], _
		[13467, 236, " ", $vqrange], _
		[13489, -2342, " ", $vqrange], _
		[14135, -4758, " ", $vqrange], _
		[16716, -4464, " ", $vqrange], _
		[18941, -4296, " ", $vqrange], _
		[16402, -4392, " ", $vqrange], _
		[14313, -5820, " ", $vqrange], _
		[13048, -7983, " ", $vqrange], _
		[14888, -9691, " ", $vqrange], _
		[16850, -11362, " ", $vqrange], _
		[19358, -11851, " ", $vqrange], _
		[19355, -11874, " ", $vqrange], _
		[17142, -13109, " ", $vqrange], _
		[14787, -13985, " ", $vqrange], _
		[13953, -11520, " ", $vqrange], _
		[13068, -13929, " ", $vqrange], _
		[13910, -16372, " ", $vqrange], _
		[14918, -18156, "shrine", $vqrange], _
		[12584, -17093, " ", $vqrange], _
		[10138, -16176, " ", $vqrange], _
		[7701, -16812, " ", $vqrange], _
		[5223, -17445, " ", $vqrange], _
		[2659, -17284, " ", $vqrange], _
		[101, -16937, " ", $vqrange], _
		[-2211, -15915, " ", $vqrange], _
		[-3631, -14259, " ", $vqrange], _
		[-983, -14324, " ", $vqrange], _
		[1497, -13629, " ", $vqrange], _
		[3297, -11834, " ", $vqrange], _
		[1836, -9699, " ", $vqrange], _
		[4109, -8643, " ", $vqrange], _
		[7141, -9282, " ", $vqrange], _
		[8757, -11269, " ", $vqrange], _
		[7268, -9197, " ", $vqrange], _
		[6002, -7013, " ", $vqrange], _
		[3634, -8110, " ", $vqrange], _
		[1216, -8912, " ", $vqrange], _
		[-1394, -9020, " ", $vqrange], _
		[-3963, -9450, " ", $vqrange], _
		[-5550, -7444, " ", $vqrange], _
		[-6509, -9897, " ", $vqrange], _
		[-8997, -10369, " ", $vqrange], _
		[-8219, -7922, " ", $vqrange], _
		[-7292, -5438, " ", $vqrange], _
		[-4952, -4552, " ", $vqrange], _
		[-1616, -5944, " ", $vqrange], _
		[-2484, -3752, " ", $vqrange], _
		[-609, -2040, " ", $vqrange], _
		[429, 260, " ", $vqrange], _
		[531, 2850, " ", $vqrange], _
		[3036, 2520, " ", $vqrange], _
		[5658, 2252, " ", $vqrange], _
		[6458, -143, " ", $vqrange], _
		[7181, -2543, " ", $vqrange], _
		[9779, -2560, " ", $vqrange], _
		[12072, -1359, " ", $vqrange], _
		[13386, 856, " ", $vqrange], _
		[14996, 2853, " ", $vqrange], _
		[16271, 5102, " ", $vqrange], _
		[16688, 7635, " ", $vqrange], _
		[17357, 9308, " ", $vqrange], _
		[14856, 9819, " ", $vqrange], _
		[13938, 12198, " ", $vqrange], _
		[13116, 14635, " ", $vqrange], _
		[12077, 17006, " ", $vqrange], _
		[12346, 15282, " ", $vqrange], _
		[9819, 15919, " ", $vqrange], _
		[7328, 16271, " ", $vqrange], _
		[4985, 17156, " ", $vqrange], _
		[2942, 15691, " ", $vqrange], _
		[378, 15574, " ", $vqrange], _
		[-711, 16220, " ", $vqrange], _
		[992, 14336, " ", $vqrange], _
		[1833, 11911, " ", $vqrange], _
		[4421, 11850, " ", $vqrange], _
		[5786, 11756, "shrine", $vqrange], _
		[8384, 11959, " ", $vqrange], _
		[10754, 12960, " ", $vqrange], _
		[10558, 10388, " ", $vqrange], _
		[9949, 7840, " ", $vqrange], _
		[10113, 5860, " ", $vqrange], _
		[12454, 6895, " ", $vqrange], _
		[14046, 4094, " ", $vqrange], _
		[12227, 6007, " ", $vqrange], _
		[9680, 5540, " ", $vqrange], _
		[7832, 3823, " ", $vqrange], _
		[5450, 2771, " ", $vqrange], _
		[2960, 2528, " ", $vqrange], _
		[360, 2679, " ", $vqrange], _
		[-2242, 2917, " ", $vqrange], _
		[-4454, 4119, " ", $vqrange], _
		[-5644, 6414, " ", $vqrange], _
		[-7355, 8363, " ", $vqrange], _
		[-9334, 10056, " ", $vqrange], _
		[-10316, 12413, " ", $vqrange], _
		[-10666, 14934, " ", $vqrange], _
		[-9917, 17396, " ", $vqrange], _
		[-8240, 15536, " ", $vqrange], _
		[-8053, 13025, " ", $vqrange], _
		[-5651, 12011, " ", $vqrange], _
		[-3044, 11907, " ", $vqrange], _
		[-563, 11570, " ", $vqrange], _
		[1165, 9683, " ", $vqrange], _
		[2986, 7775, " ", $vqrange], _
		[5465, 7068, " ", $vqrange], _
		[5426, 4529, " ", $vqrange], _
		[2913, 4795, " ", $vqrange], _
		[560, 5903, " ", $vqrange], _
		[-1464, 7471, " ", $vqrange], _
		[-3886, 8264, " ", $vqrange], _
		[-6375, 8767, " ", $vqrange], _
		[-8997, 8865, " ", $vqrange], _
		[-11537, 9008, " ", $vqrange], _
		[-13870, 10072, " ", $vqrange]]
	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
