;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Local $aSacnothValleyOutpostPath[1][2] = [ _
	[-15660, 13968]]

Local $aSacnothValleyTransitPath[18][2] = [ _
	[-14310, 12724], _
	[-11786, 12509], _
	[-10014, 10738], _
	[-8248, 8896], _
	[-6405, 7167], _
	[-4532, 5433], _
	[-2409, 4044], _
	[-623, 2251], _
	[942, 279], _
	[2534, -1818], _
	[3984, -3905], _
	[5296, -6178], _
	[6712, -8322], _
	[8068, -10592], _
	[9598, -12690], _
	[11233, -14754], _
	[12766, -16898], _
	[13959, -19234]]

Func GoOutSacnothValley()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $SacnothValley_Map Then Return
	If $l_i_Map = $SacnothValley_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> SacnothValley (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSacnothValleyOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
	If $l_i_Map = $SacnothValley_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> SacnothValley (portal 2)")
		_Vanquisher_RunAggroPortalPath($aSacnothValleyTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQSacnothValley()
	If GetMapID() <> $SacnothValley_Map And GetMapID() <> $SacnothValley_Outpost And GetMapID() <> $SacnothValley_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SacnothValley.")
		TravelTo($SacnothValley_Outpost)
	EndIf
	If GetMapID() = $SacnothValley_Outpost Or GetMapID() = $SacnothValley_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutSacnothValley()
		If GetMapID() <> $SacnothValley_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SacnothValley (" & $SacnothValley_Map & ").")
			Return
	EndIf
	EndIf
	If GetMapID() <> $SacnothValley_Map Then
		CurrentAction("SacnothValley route waiting - on map " & GetMapID() & ", need " & $SacnothValley_Map & ".")
		Return
	EndIf
	CurrentAction("Starting SacnothValley vanquish route.")
	Local $aWaypoints[257][4] = [ _
		[12118, 18377, " ", $vqrange], _
		[10476, 19619, "shrine", $vqrange], _
		[11351, 17189, " ", $vqrange], _
		[13537, 15799, " ", $vqrange], _
		[14128, 13316, " ", $vqrange], _
		[16129, 11725, " ", $vqrange], _
		[17248, 11545, " ", $vqrange], _
		[14932, 10349, " ", $vqrange], _
		[13047, 8680, " ", $vqrange], _
		[11168, 6990, " ", $vqrange], _
		[10999, 4410, " ", $vqrange], _
		[11661, 1950, " ", $vqrange], _
		[10061, 930, " ", $vqrange], _
		[13007, 537, "shrine", $vqrange], _
		[13660, -1932, " ", $vqrange], _
		[14072, -3360, " ", $vqrange], _
		[16524, -2539, " ", $vqrange], _
		[18341, -2272, " ", $vqrange], _
		[16269, -3703, " ", $vqrange], _
		[14052, -4910, " ", $vqrange], _
		[11557, -5321, " ", $vqrange], _
		[9208, -6233, " ", $vqrange], _
		[6895, -7224, " ", $vqrange], _
		[9261, -8305, " ", $vqrange], _
		[10759, -10425, " ", $vqrange], _
		[11975, -12627, " ", $vqrange], _
		[13999, -14251, " ", $vqrange], _
		[13961, -14345, " ", $vqrange], _
		[13589, -16414, " ", $vqrange], _
		[16167, -16988, " ", $vqrange], _
		[16304, -17048, " ", $vqrange], _
		[17732, -18339, "shrine", $vqrange], _
		[18892, -16951, " ", $vqrange], _
		[16346, -16785, " ", $vqrange], _
		[16089, -14292, " ", $vqrange], _
		[17194, -12206, " ", $vqrange], _
		[18038, -14213, " ", $vqrange], _
		[17403, -11774, " ", $vqrange], _
		[16408, -9432, " ", $vqrange], _
		[15734, -6919, " ", $vqrange], _
		[14805, -9307, " ", $vqrange], _
		[13294, -11374, " ", $vqrange], _
		[11176, -12703, " ", $vqrange], _
		[9501, -14602, " ", $vqrange], _
		[6987, -14100, " ", $vqrange], _
		[6500, -11900, " ", $vqrange], _
		[4759, -10088, " ", $vqrange], _
		[3099, -11999, " ", $vqrange], _
		[4122, -9542, " ", $vqrange], _
		[4402, -7122, "shrine", $vqrange], _
		[3918, -4571, " ", $vqrange], _
		[4624, -2115, " ", $vqrange], _
		[7226, -1873, " ", $vqrange], _
		[9561, -830, " ", $vqrange], _
		[7056, -535, " ", $vqrange], _
		[4609, 329, " ", $vqrange], _
		[3905, -519, " ", $vqrange], _
		[4456, -1901, " ", $vqrange], _
		[2255, -3126, " ", $vqrange], _
		[8, -1927, " ", $vqrange], _
		[-1686, -3891, " ", $vqrange], _
		[-3954, -2659, " ", $vqrange], _
		[-3615, -5219, " ", $vqrange], _
		[-3048, -7739, " ", $vqrange], _
		[-2266, -10180, " ", $vqrange], _
		[251, -9890, " ", $vqrange], _
		[2753, -10684, " ", $vqrange], _
		[972, -8822, " ", $vqrange], _
		[561, -6336, " ", $vqrange], _
		[616, -8853, " ", $vqrange], _
		[1298, -11284, " ", $vqrange], _
		[-606, -12948, " ", $vqrange], _
		[-3216, -12742, " ", $vqrange], _
		[-5691, -13301, " ", $vqrange], _
		[-8134, -14142, " ", $vqrange], _
		[-10637, -14547, " ", $vqrange], _
		[-12194, -16563, " ", $vqrange], _
		[-14161, -17288, " ", $vqrange], _
		[-16228, -18487, " ", $vqrange], _
		[-16120, -19133, " ", $vqrange], _
		[-17037, -16758, " ", $vqrange], _
		[-15328, -16683, "shrine", $vqrange], _
		[-15486, -14058, " ", $vqrange], _
		[-15224, -11495, " ", $vqrange], _
		[-16733, -12125, " ", $vqrange], _
		[-14992, -10280, " ", $vqrange], _
		[-14536, -7769, " ", $vqrange], _
		[-12823, -5921, " ", $vqrange], _
		[-11304, -6010, " ", $vqrange], _
		[-11144, -7418, " ", $vqrange], _
		[-9217, -7722, " ", $vqrange], _
		[-6670, -7364, " ", $vqrange], _
		[-7554, -9828, " ", $vqrange], _
		[-6229, -11991, " ", $vqrange], _
		[-8625, -13049, " ", $vqrange], _
		[-11189, -13670, " ", $vqrange], _
		[-13727, -14240, " ", $vqrange], _
		[-14629, -13025, " ", $vqrange], _
		[-12917, -11048, " ", $vqrange], _
		[-13054, -8410, " ", $vqrange], _
		[-14500, -6826, " ", $vqrange], _
		[-12354, -8201, " ", $vqrange], _
		[-10174, -9698, " ", $vqrange], _
		[-8453, -11673, " ", $vqrange], _
		[-10992, -11955, " ", $vqrange], _
		[-13626, -12021, " ", $vqrange], _
		[-11506, -10561, " ", $vqrange], _
		[-9351, -9293, " ", $vqrange], _
		[-7197, -7763, " ", $vqrange], _
		[-8010, -10286, " ", $vqrange], _
		[-8876, -12632, " ", $vqrange], _
		[-9615, -15095, " ", $vqrange], _
		[-9660, -15097, " ", $vqrange], _
		[-10922, -12909, " ", $vqrange], _
		[-12482, -10939, " ", $vqrange], _
		[-14183, -9056, " ", $vqrange], _
		[-11859, -7962, " ", $vqrange], _
		[-9504, -7132, " ", $vqrange], _
		[-9113, -4582, " ", $vqrange], _
		[-7049, -2966, " ", $vqrange], _
		[-4658, -2045, " ", $vqrange], _
		[-2310, -3231, " ", $vqrange], _
		[-134, -1849, " ", $vqrange], _
		[-634, 707, " ", $vqrange], _
		[-3228, 1012, " ", $vqrange], _
		[-2882, 1264, "shrine", $vqrange], _
		[-928, 2976, " ", $vqrange], _
		[-3419, 2177, " ", $vqrange], _
		[-5412, 550, " ", $vqrange], _
		[-7953, 323, " ", $vqrange], _
		[-6110, 2024, " ", $vqrange], _
		[-5199, 3096, " ", $vqrange], _
		[-6739, 1065, " ", $vqrange], _
		[-8743, -536, " ", $vqrange], _
		[-11085, -1461, " ", $vqrange], _
		[-13151, -2901, " ", $vqrange], _
		[-15319, -3894, " ", $vqrange], _
		[-15779, -2897, " ", $vqrange], _
		[-15014, -465, " ", $vqrange], _
		[-12577, 218, "shrine", $vqrange], _
		[-10033, 651, " ", $vqrange], _
		[-8074, 2383, " ", $vqrange], _
		[-7461, 3851, " ", $vqrange], _
		[-5540, 2215, " ", $vqrange], _
		[-2985, 2549, " ", $vqrange], _
		[-599, 3315, " ", $vqrange], _
		[-456, 5927, " ", $vqrange], _
		[1706, 7347, " ", $vqrange], _
		[3119, 8269, " ", $vqrange], _
		[1045, 9401, " ", $vqrange], _
		[1513, 6790, " ", $vqrange], _
		[2093, 4954, " ", $vqrange], _
		[-139, 6202, " ", $vqrange], _
		[-2567, 7026, " ", $vqrange], _
		[-1975, 9089, " ", $vqrange], _
		[-3964, 10772, " ", $vqrange], _
		[-4319, 11044, " ", $vqrange], _
		[-1848, 11996, " ", $vqrange], _
		[-2123, 13088, " ", $vqrange], _
		[-27, 14598, " ", $vqrange], _
		[151, 14704, " ", $vqrange], _
		[1953, 12940, " ", $vqrange], _
		[2417, 12245, " ", $vqrange], _
		[1235, 11661, " ", $vqrange], _
		[2157, 14012, " ", $vqrange], _
		[3534, 14409, " ", $vqrange], _
		[2504, 16788, " ", $vqrange], _
		[1867, 18023, " ", $vqrange], _
		[3004, 15753, " ", $vqrange], _
		[1236, 13877, " ", $vqrange], _
		[-862, 15302, " ", $vqrange], _
		[-1497, 14549, " ", $vqrange], _
		[-75, 12456, " ", $vqrange], _
		[196, 10716, " ", $vqrange], _
		[2692, 10562, " ", $vqrange], _
		[4510, 12353, " ", $vqrange], _
		[5771, 14605, " ", $vqrange], _
		[5583, 13155, " ", $vqrange], _
		[8074, 12469, " ", $vqrange], _
		[9652, 14410, " ", $vqrange], _
		[12141, 14721, " ", $vqrange], _
		[12535, 12213, " ", $vqrange], _
		[12782, 9607, " ", $vqrange], _
		[11165, 7592, " ", $vqrange], _
		[9618, 5495, " ", $vqrange], _
		[8423, 3253, " ", $vqrange], _
		[6402, 4744, " ", $vqrange], _
		[5467, 7096, " ", $vqrange], _
		[6769, 9292, " ", $vqrange], _
		[7730, 10266, " ", $vqrange], _
		[5231, 10797, " ", $vqrange], _
		[2590, 10712, " ", $vqrange], _
		[-47, 10766, " ", $vqrange], _
		[-2679, 10937, " ", $vqrange], _
		[-5285, 11059, " ", $vqrange], _
		[-6609, 13295, " ", $vqrange], _
		[-6714, 15918, " ", $vqrange], _
		[-6663, 13346, " ", $vqrange], _
		[-4317, 12499, " ", $vqrange], _
		[-6858, 12908, " ", $vqrange], _
		[-9289, 13787, " ", $vqrange], _
		[-10027, 15765, " ", $vqrange], _
		[-11156, 13412, " ", $vqrange], _
		[-12773, 14646, " ", $vqrange], _
		[-11262, 12619, " ", $vqrange], _
		[-10842, 12097, " ", $vqrange], _
		[-11635, 10453, " ", $vqrange], _
		[-13896, 11527, " ", $vqrange], _
		[-15266, 11432, " ", $vqrange], _
		[-14750, 10460, " ", $vqrange], _
		[-12245, 10656, " ", $vqrange], _
		[-11049, 11441, " ", $vqrange], _
		[-13235, 12713, " ", $vqrange], _
		[-14938, 14680, " ", $vqrange], _
		[-16161, 16672, "shrine", $vqrange], _
		[-18795, 16242, " ", $vqrange], _
		[-16464, 15012, " ", $vqrange], _
		[-16548, 12501, " ", $vqrange], _
		[-17881, 10309, " ", $vqrange], _
		[-18282, 7838, " ", $vqrange], _
		[-17043, 8464, " ", $vqrange], _
		[-15192, 6683, " ", $vqrange], _
		[-17259, 5073, " ", $vqrange], _
		[-17848, 4430, " ", $vqrange], _
		[-15279, 4209, " ", $vqrange], _
		[-13497, 2391, " ", $vqrange], _
		[-13794, -172, " ", $vqrange], _
		[-13300, 2284, " ", $vqrange], _
		[-12255, 4565, " ", $vqrange], _
		[-11844, 5091, " ", $vqrange], _
		[-9505, 4144, " ", $vqrange], _
		[-7399, 2684, " ", $vqrange], _
		[-5468, 998, " ", $vqrange], _
		[-3142, 2125, " ", $vqrange], _
		[-790, 3088, " ", $vqrange], _
		[-437, 5702, " ", $vqrange], _
		[-1337, 8082, " ", $vqrange], _
		[-3158, 9940, " ", $vqrange], _
		[-5463, 10996, " ", $vqrange], _
		[-4788, 8474, " ", $vqrange], _
		[-6732, 8910, " ", $vqrange], _
		[-6811, 6321, " ", $vqrange], _
		[-7008, 8872, " ", $vqrange], _
		[-9301, 7602, " ", $vqrange], _
		[-10717, 5537, " ", $vqrange], _
		[-10463, 8055, " ", $vqrange], _
		[-12246, 7689, " ", $vqrange], _
		[-12634, 8674, " ", $vqrange], _
		[-10608, 10140, " ", $vqrange], _
		[-9647, 11056, " ", $vqrange], _
		[-9090, 10718, " ", $vqrange], _
		[-8646, 10970, " ", $vqrange], _
		[-8224, 10285, " ", $vqrange], _
		[-10706, 10847, " ", $vqrange], _
		[-12831, 12368, " ", $vqrange], _
		[-14694, 14216, " ", $vqrange], _
		[-15994, 16366, " ", $vqrange]]
	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
