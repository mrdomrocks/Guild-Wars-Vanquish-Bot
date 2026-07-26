#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aSaltFlatsOutpostPath[2][2] = [ _
	[-17139.62, 8813.30], _
	[-16591.81, 8238.59] _
]

Func GoOutSaltFlats()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $SaltFlats_Map Then Return

	If $l_i_Map = $SaltFlats_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> SaltFlats (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSaltFlatsOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQSaltFlats()
	If GetMapID() <> $SaltFlats_Map And GetMapID() <> $SaltFlats_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SaltFlats.")
		TravelTo($SaltFlats_Outpost)
	EndIf

	If GetMapID() = $SaltFlats_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutSaltFlats()
		If GetMapID() <> $SaltFlats_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SaltFlats (" & $SaltFlats_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $SaltFlats_Map Then
		CurrentAction("SaltFlats route waiting - on map " & GetMapID() & ", need " & $SaltFlats_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SaltFlats vanquish route.")

	Local $aWaypoints[314][4] = [ _
		[0, 0, " ", $vqrange], _
		[-15297, 12489, " ", $vqrange], _
		[-15977, 13275, " ", $vqrange], _
		[-17069, 14564, " ", $vqrange], _
		[-16361, 16461, " ", $vqrange], _
		[-15260, 18683, " ", $vqrange], _
		[-12706, 17724, " ", $vqrange], _
		[-11970, 17990, " ", $vqrange], _
		[-10553, 19237, " ", $vqrange], _
		[-8262, 19694, " ", $vqrange], _
		[-6458, 18307, " ", $vqrange], _
		[-6439, 17353, " ", $vqrange], _
		[-6077, 16832, " ", $vqrange], _
		[-5750, 15871, " ", $vqrange], _
		[-6974, 14985, " ", $vqrange], _
		[-7917, 14475, " ", $vqrange], _
		[-9482, 12416, " ", $vqrange], _
		[-9731, 12164, " ", $vqrange], _
		[-9885, 12117, " ", $vqrange], _
		[-11000, 11696, " ", $vqrange], _
		[-11161, 11425, " ", $vqrange], _
		[-12002, 9937, " ", $vqrange], _
		[-11530, 8316, " ", $vqrange], _
		[-10180, 6973, " ", $vqrange], _
		[-9685, 6000, " ", $vqrange], _
		[-9496, 4973, " ", $vqrange], _
		[-9425, 4583, " ", $vqrange], _
		[-9751, 3292, " ", $vqrange], _
		[-10624, 2730, " ", $vqrange], _
		[-11547, 2311, " ", $vqrange], _
		[-13415, 3139, " ", $vqrange], _
		[-14551, 3899, " ", $vqrange], _
		[-16723, 4990, " ", $vqrange], _
		[-16817, 5146, " ", $vqrange], _
		[-15722, 6348, " ", $vqrange], _
		[-14382, 6049, " ", $vqrange], _
		[-13160, 6550, " ", $vqrange], _
		[-13239, 6421, " ", $vqrange], _
		[-13990, 5500, " ", $vqrange], _
		[-14642, 4692, " ", $vqrange], _
		[-14695, 3679, " ", $vqrange], _
		[-13778, 2204, " ", $vqrange], _
		[-12713, 1379, " ", $vqrange], _
		[-11539, 864, " ", $vqrange], _
		[-10826, 274, " ", $vqrange], _
		[-10224, -1182, " ", $vqrange], _
		[-10013, -2199, " ", $vqrange], _
		[-9737, -3112, " ", $vqrange], _
		[-9167, -4788, " ", $vqrange], _
		[-7898, -6434, " ", $vqrange], _
		[-7073, -6973, " ", $vqrange], _
		[-7275, -7169, " ", $vqrange], _
		[-7584, -7338, " ", $vqrange], _
		[-8217, -7618, " ", $vqrange], _
		[-9171, -8041, " ", $vqrange], _
		[-9166, -8039, " ", $vqrange], _
		[-9333, -8304, " ", $vqrange], _
		[-9600, -8546, " ", $vqrange], _
		[-9975, -8596, " ", $vqrange], _
		[-11772, -8185, " ", $vqrange], _
		[-12459, -7727, " ", $vqrange], _
		[-14522, -6599, " ", $vqrange], _
		[-14522, -6599, " ", $vqrange], _
		[-14393, -6924, " ", $vqrange], _
		[-15648, -6555, " ", $vqrange], _
		[-15914, -5564, " ", $vqrange], _
		[-17858, -5809, " ", $vqrange], _
		[-17841, -5403, " ", $vqrange], _
		[-17218, -4573, " ", $vqrange], _
		[-16222, -3608, " ", $vqrange], _
		[-15323, -2551, " ", $vqrange], _
		[-17029, -4390, " ", $vqrange], _
		[-17966, -5416, " ", $vqrange], _
		[-19116, -6436, " ", $vqrange], _
		[-19267, -7789, " ", $vqrange], _
		[-19199, -9003, " ", $vqrange], _
		[-17840, -10076, " ", $vqrange], _
		[-16902, -9725, " ", $vqrange], _
		[-15897, -9454, " ", $vqrange], _
		[-14581, -9202, " ", $vqrange], _
		[-15047, -10126, " ", $vqrange], _
		[-15399, -11003, " ", $vqrange], _
		[-13275, -7979, " ", $vqrange], _
		[-11578, -8344, " ", $vqrange], _
		[-10189, -9312, " ", $vqrange], _
		[-9226, -8847, " ", $vqrange], _
		[-6796, -6787, " ", $vqrange], _
		[-5900, -8760, " ", $vqrange], _
		[-5300, -9578, " ", $vqrange], _
		[-4278, -10481, " ", $vqrange], _
		[-3887, -10783, " ", $vqrange], _
		[-3554, -11741, " ", $vqrange], _
		[-3876, -12350, " ", $vqrange], _
		[-3915, -12661, " ", $vqrange], _
		[-3764, -13348, " ", $vqrange], _
		[-2964, -13724, " ", $vqrange], _
		[-2630, -13633, " ", $vqrange], _
		[-1131, -12812, " ", $vqrange], _
		[778, -13220, " ", $vqrange], _
		[1510, -13350, " ", $vqrange], _
		[2325, -13114, " ", $vqrange], _
		[3345, -12889, " ", $vqrange], _
		[4087, -12787, " ", $vqrange], _
		[5510, -12039, " ", $vqrange], _
		[6818, -12341, " ", $vqrange], _
		[8165, -12299, " ", $vqrange], _
		[9082, -11798, " ", $vqrange], _
		[10327, -11603, " ", $vqrange], _
		[11376, -12630, " ", $vqrange], _
		[12495, -13456, " ", $vqrange], _
		[13638, -14403, " ", $vqrange], _
		[14088, -15252, " ", $vqrange], _
		[13718, -16834, " ", $vqrange], _
		[13672, -16975, " ", $vqrange], _
		[13920, -17128, " ", $vqrange], _
		[15281, -17361, " ", $vqrange], _
		[15114, -17583, " ", $vqrange], _
		[15941, -17510, " ", $vqrange], _
		[17982, -17499, " ", $vqrange], _
		[19023, -17360, " ", $vqrange], _
		[19632, -17486, " ", $vqrange], _
		[19936, -17723, " ", $vqrange], _
		[18438, -17080, " ", $vqrange], _
		[16539, -17570, " ", $vqrange], _
		[14234, -17930, " ", $vqrange], _
		[13733, -16890, " ", $vqrange], _
		[13426, -15887, " ", $vqrange], _
		[12890, -15010, " ", $vqrange], _
		[11959, -14207, " ", $vqrange], _
		[11705, -13770, " ", $vqrange], _
		[10280, -12277, " ", $vqrange], _
		[9447, -11640, " ", $vqrange], _
		[7575, -12403, " ", $vqrange], _
		[5148, -12560, " ", $vqrange], _
		[3630, -12760, " ", $vqrange], _
		[1965, -13194, " ", $vqrange], _
		[653, -13192, " ", $vqrange], _
		[-1376, -13328, " ", $vqrange], _
		[-2624, -13762, " ", $vqrange], _
		[-3966, -14106, " ", $vqrange], _
		[-5279, -15102, " ", $vqrange], _
		[-6130, -16844, " ", $vqrange], _
		[-4912, -14686, " ", $vqrange], _
		[-4332, -13045, " ", $vqrange], _
		[-4685, -10774, " ", $vqrange], _
		[-6211, -8456, " ", $vqrange], _
		[-6759, -7494, " ", $vqrange], _
		[-7751, -6526, " ", $vqrange], _
		[-6619, -6241, " ", $vqrange], _
		[-6200, -5075, " ", $vqrange], _
		[-5669, -4113, " ", $vqrange], _
		[-4797, -3420, " ", $vqrange], _
		[-4058, -3849, " ", $vqrange], _
		[-3061, -3695, " ", $vqrange], _
		[-1981, -3441, " ", $vqrange], _
		[-1385, -3209, " ", $vqrange], _
		[-750, -3195, " ", $vqrange], _
		[-816, -3222, " ", $vqrange], _
		[-2274, -3496, " ", $vqrange], _
		[-3951, -3536, " ", $vqrange], _
		[-5014, -3889, " ", $vqrange], _
		[-4289, -2643, " ", $vqrange], _
		[-3773, -1002, " ", $vqrange], _
		[-3441, 676, " ", $vqrange], _
		[-3430, 2326, " ", $vqrange], _
		[-3362, 2854, " ", $vqrange], _
		[-2844, 3821, " ", $vqrange], _
		[-3464, 2245, " ", $vqrange], _
		[-3377, 406, " ", $vqrange], _
		[-3419, -183, " ", $vqrange], _
		[-3840, -1850, " ", $vqrange], _
		[-4084, -2869, " ", $vqrange], _
		[-4683, -3804, " ", $vqrange], _
		[-5955, -4238, " ", $vqrange], _
		[-6334, -5105, " ", $vqrange], _
		[-7904, -7218, " ", $vqrange], _
		[-9189, -8138, " ", $vqrange], _
		[-9126, -6644, " ", $vqrange], _
		[-9415, -4620, " ", $vqrange], _
		[-9702, -2913, " ", $vqrange], _
		[-10095, -503, " ", $vqrange], _
		[-10320, 875, " ", $vqrange], _
		[-9950, 2529, " ", $vqrange], _
		[-9540, 3496, " ", $vqrange], _
		[-9576, 4869, " ", $vqrange], _
		[-9942, 6040, " ", $vqrange], _
		[-10404, 7330, " ", $vqrange], _
		[-11197, 9237, " ", $vqrange], _
		[-10980, 10660, " ", $vqrange], _
		[-10035, 11661, " ", $vqrange], _
		[-8990, 13045, " ", $vqrange], _
		[-8113, 14125, " ", $vqrange], _
		[-6928, 15400, " ", $vqrange], _
		[-5723, 15314, " ", $vqrange], _
		[-4244, 13877, " ", $vqrange], _
		[-2652, 12580, " ", $vqrange], _
		[-651, 12212, " ", $vqrange], _
		[-114, 11996, " ", $vqrange], _
		[321, 12312, " ", $vqrange], _
		[131, 13428, " ", $vqrange], _
		[179, 13584, " ", $vqrange], _
		[602, 14990, " ", $vqrange], _
		[763, 16351, " ", $vqrange], _
		[2193, 15853, " ", $vqrange], _
		[2605, 15486, " ", $vqrange], _
		[3896, 12373, " ", $vqrange], _
		[3223, 12035, " ", $vqrange], _
		[1545, 11209, " ", $vqrange], _
		[975, 9404, " ", $vqrange], _
		[935, 10422, " ", $vqrange], _
		[989, 11863, " ", $vqrange], _
		[1027, 12894, " ", $vqrange], _
		[1592, 13263, " ", $vqrange], _
		[2951, 13518, " ", $vqrange], _
		[3987, 13712, " ", $vqrange], _
		[5756, 14304, " ", $vqrange], _
		[5580, 14324, " ", $vqrange], _
		[3765, 16322, " ", $vqrange], _
		[4051, 17395, " ", $vqrange], _
		[5750, 17789, " ", $vqrange], _
		[8539, 16560, " ", $vqrange], _
		[8730, 16466, " ", $vqrange], _
		[8832, 16416, " ", $vqrange], _
		[9158, 16480, " ", $vqrange], _
		[9406, 17098, " ", $vqrange], _
		[9766, 16553, " ", $vqrange], _
		[10430, 15246, " ", $vqrange], _
		[10527, 15088, " ", $vqrange], _
		[10873, 16414, " ", $vqrange], _
		[11131, 17405, " ", $vqrange], _
		[11315, 18113, " ", $vqrange], _
		[11338, 18198, " ", $vqrange], _
		[12046, 18707, " ", $vqrange], _
		[12604, 18790, " ", $vqrange], _
		[13013, 18802, " ", $vqrange], _
		[14383, 18815, " ", $vqrange], _
		[16336, 19840, " ", $vqrange], _
		[17198, 20125, " ", $vqrange], _
		[18640, 19855, " ", $vqrange], _
		[18461, 19433, " ", $vqrange], _
		[18660, 18672, " ", $vqrange], _
		[18961, 17212, " ", $vqrange], _
		[18837, 15381, " ", $vqrange], _
		[18589, 14745, " ", $vqrange], _
		[18592, 13856, " ", $vqrange], _
		[18443, 12469, " ", $vqrange], _
		[18724, 11798, " ", $vqrange], _
		[19492, 10741, " ", $vqrange], _
		[20023, 10272, " ", $vqrange], _
		[19643, 9698, " ", $vqrange], _
		[19392, 9319, " ", $vqrange], _
		[19267, 9710, " ", $vqrange], _
		[18775, 10336, " ", $vqrange], _
		[18477, 10101, " ", $vqrange], _
		[17058, 9033, " ", $vqrange], _
		[15528, 8203, " ", $vqrange], _
		[14318, 7531, " ", $vqrange], _
		[13862, 7278, " ", $vqrange], _
		[13993, 7401, " ", $vqrange], _
		[12797, 8386, " ", $vqrange], _
		[12018, 8916, " ", $vqrange], _
		[10951, 9024, " ", $vqrange], _
		[10275, 9000, " ", $vqrange], _
		[9942, 8815, " ", $vqrange], _
		[8304, 7566, " ", $vqrange], _
		[8105, 7656, " ", $vqrange], _
		[7604, 8251, " ", $vqrange], _
		[6447, 9615, " ", $vqrange], _
		[5549, 10673, " ", $vqrange], _
		[4649, 11729, " ", $vqrange], _
		[3999, 11790, " ", $vqrange], _
		[2611, 11916, " ", $vqrange], _
		[1770, 11539, " ", $vqrange], _
		[1427, 10547, " ", $vqrange], _
		[450, 10866, " ", $vqrange], _
		[377, 12244, " ", $vqrange], _
		[433, 12963, " ", $vqrange], _
		[1064, 13786, " ", $vqrange], _
		[2384, 15395, " ", $vqrange], _
		[3572, 17026, " ", $vqrange], _
		[4608, 17494, " ", $vqrange], _
		[4963, 17589, " ", $vqrange], _
		[6327, 17906, " ", $vqrange], _
		[7872, 16301, " ", $vqrange], _
		[7526, 15745, " ", $vqrange], _
		[5762, 14163, " ", $vqrange], _
		[5146, 13416, " ", $vqrange], _
		[5710, 12185, " ", $vqrange], _
		[6621, 11128, " ", $vqrange], _
		[7704, 9998, " ", $vqrange], _
		[9697, 9638, " ", $vqrange], _
		[11092, 9129, " ", $vqrange], _
		[11912, 8949, " ", $vqrange], _
		[13728, 7352, " ", $vqrange], _
		[14264, 7369, " ", $vqrange], _
		[15106, 8018, " ", $vqrange], _
		[16117, 8991, " ", $vqrange], _
		[18282, 11824, " ", $vqrange], _
		[18494, 13466, " ", $vqrange], _
		[18600, 15203, " ", $vqrange], _
		[18786, 16566, " ", $vqrange], _
		[18458, 20027, " ", $vqrange], _
		[18092, 20325, " ", $vqrange], _
		[16425, 19992, " ", $vqrange], _
		[14904, 19245, " ", $vqrange], _
		[13331, 18766, " ", $vqrange], _
		[12897, 18751, " ", $vqrange], _
		[11363, 18328, " ", $vqrange], _
		[10660, 18179, " ", $vqrange], _
		[9003, 18664, " ", $vqrange], _
		[7336, 18346, " ", $vqrange], _
		[5081, 17606, " ", $vqrange], _
		[3804, 17308, " ", $vqrange], _
		[3036, 16689, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

