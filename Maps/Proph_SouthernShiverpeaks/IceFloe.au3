#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aIceFloeOutpostPath[1][2] = [ _
	[-12092.02, -23274.70] _
]

Func GoOutIceFloe()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $IceFloe_Map Then Return

	If $l_i_Map = $IceFloe_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> IceFloe (portal 1)")
		_Vanquisher_RunAggroPortalPath($aIceFloeOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQIceFloe()
	If GetMapID() <> $IceFloe_Map And GetMapID() <> $IceFloe_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for IceFloe.")
		TravelTo($IceFloe_Outpost)
	EndIf

	If GetMapID() = $IceFloe_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutIceFloe()
		If GetMapID() <> $IceFloe_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need IceFloe (" & $IceFloe_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $IceFloe_Map Then
		CurrentAction("IceFloe route waiting - on map " & GetMapID() & ", need " & $IceFloe_Map & ".")
		Return
	EndIf

	CurrentAction("Starting IceFloe vanquish route.")

	Local $aWaypoints[142][4] = [ _
		[20782, 13552, " ", $vqrange], _
		[19976, 13364, " ", $vqrange], _
		[19666, 13266, " ", $vqrange], _
		[18512, 12980, " ", $vqrange], _
		[16775, 13827, " ", $vqrange], _
		[16490, 13923, " ", $vqrange], _
		[15437, 14423, " ", $vqrange], _
		[12973, 13840, " ", $vqrange], _
		[12040, 12144, " ", $vqrange], _
		[11478, 11446, " ", $vqrange], _
		[10138, 10769, " ", $vqrange], _
		[9096, 10571, " ", $vqrange], _
		[8079, 11786, " ", $vqrange], _
		[7780, 12106, " ", $vqrange], _
		[7254, 12673, " ", $vqrange], _
		[6764, 13193, " ", $vqrange], _
		[6330, 13631, " ", $vqrange], _
		[6967, 14301, " ", $vqrange], _
		[6096, 16425, " ", $vqrange], _
		[6479, 16541, " ", $vqrange], _
		[7418, 15081, " ", $vqrange], _
		[7155, 14608, " ", $vqrange], _
		[8420, 10952, " ", $vqrange], _
		[9656, 8721, " ", $vqrange], _
		[9805, 6587, " ", $vqrange], _
		[9836, 6524, " ", $vqrange], _
		[9908, 6535, " ", $vqrange], _
		[10550, 5747, " ", $vqrange], _
		[11821, 5697, " ", $vqrange], _
		[13135, 7091, " ", $vqrange], _
		[13832, 7312, " ", $vqrange], _
		[15673, 7520, " ", $vqrange], _
		[18645, 7688, " ", $vqrange], _
		[21966, 7952, " ", $vqrange], _
		[21091, 6262, " ", $vqrange], _
		[21419, 4347, " ", $vqrange], _
		[21596, 2023, " ", $vqrange], _
		[20665, -1144, " ", $vqrange], _
		[17660, -855, " ", $vqrange], _
		[20340, -1753, " ", $vqrange], _
		[19972, -2794, " ", $vqrange], _
		[19938, -2851, " ", $vqrange], _
		[19298, -3275, " ", $vqrange], _
		[18472, -4166, " ", $vqrange], _
		[17926, -4725, " ", $vqrange], _
		[16806, -5598, " ", $vqrange], _
		[15878, -7517, " ", $vqrange], _
		[15692, -8139, " ", $vqrange], _
		[15348, -8659, " ", $vqrange], _
		[15403, -9850, " ", $vqrange], _
		[12755, -9777, " ", $vqrange], _
		[12096, -9854, " ", $vqrange], _
		[11682, -10666, " ", $vqrange], _
		[11147, -11957, " ", $vqrange], _
		[9581, -14952, " ", $vqrange], _
		[11294, -12084, " ", $vqrange], _
		[11897, -10227, " ", $vqrange], _
		[10383, -9872, " ", $vqrange], _
		[9407, -9462, " ", $vqrange], _
		[8461, -6749, " ", $vqrange], _
		[7639, -4684, " ", $vqrange], _
		[7099, -3137, " ", $vqrange], _
		[6805, -2431, " ", $vqrange], _
		[7901, -815, " ", $vqrange], _
		[7802, 174, " ", $vqrange], _
		[5434, 2796, " ", $vqrange], _
		[3295, 3731, " ", $vqrange], _
		[2383, 3729, " ", $vqrange], _
		[1031, 3965, " ", $vqrange], _
		[1031, 3965, " ", $vqrange], _
		[3360, 5491, " ", $vqrange], _
		[458, 9619, " ", $vqrange], _
		[-2121, 7551, " ", $vqrange], _
		[-4920, 6258, " ", $vqrange], _
		[-9526, 7391, " ", $vqrange], _
		[-10686, 7397, " ", $vqrange], _
		[-11595, 7440, " ", $vqrange], _
		[-12113, 7327, " ", $vqrange], _
		[-13143, 7316, " ", $vqrange], _
		[-14170, 7160, " ", $vqrange], _
		[-14306, 7027, " ", $vqrange], _
		[-15407, 6977, " ", $vqrange], _
		[-15403, 6231, " ", $vqrange], _
		[-15611, 5106, " ", $vqrange], _
		[-15800, 4768, " ", $vqrange], _
		[-15261, 1053, " ", $vqrange], _
		[-14871, -2980, " ", $vqrange], _
		[-15433, -4618, " ", $vqrange], _
		[-13546, -3683, " ", $vqrange], _
		[-11748, -2516, " ", $vqrange], _
		[-13520, -5721, " ", $vqrange], _
		[-13344, -9599, " ", $vqrange], _
		[-14137, -5325, " ", $vqrange], _
		[-15381, -3516, " ", $vqrange], _
		[-15132, -1979, " ", $vqrange], _
		[-15222, 341, " ", $vqrange], _
		[-15662, 2554, " ", $vqrange], _
		[-16482, 4340, " ", $vqrange], _
		[-19912, 1887, " ", $vqrange], _
		[-17827, 4593, " ", $vqrange], _
		[-17386, 6074, " ", $vqrange], _
		[-17514, 9123, " ", $vqrange], _
		[-15170, 10425, " ", $vqrange], _
		[-12764, 12355, " ", $vqrange], _
		[-9954, 14937, " ", $vqrange], _
		[-6064, 15196, " ", $vqrange], _
		[-5935, 16797, " ", $vqrange], _
		[-3256, 17257, " ", $vqrange], _
		[-4827, 17645, " ", $vqrange], _
		[-2655, 17044, " ", $vqrange], _
		[-1717, 16629, " ", $vqrange], _
		[-223, 15937, " ", $vqrange], _
		[1792, 17051, " ", $vqrange], _
		[339, 16097, " ", $vqrange], _
		[221, 12700, " ", $vqrange], _
		[2179, 9795, " ", $vqrange], _
		[3359, 7228, " ", $vqrange], _
		[514, 3841, " ", $vqrange], _
		[-2800, 3865, " ", $vqrange], _
		[-4454, 6735, " ", $vqrange], _
		[-2786, 8555, " ", $vqrange], _
		[3599, 12860, " ", $vqrange], _
		[7829, 14777, " ", $vqrange], _
		[8263, 11362, " ", $vqrange], _
		[9846, 8699, " ", $vqrange], _
		[10904, 5349, " ", $vqrange], _
		[10988, 2374, " ", $vqrange], _
		[9713, -391, " ", $vqrange], _
		[8482, -1888, " ", $vqrange], _
		[5013, -3266, " ", $vqrange], _
		[2288, -5363, " ", $vqrange], _
		[-545, -6672, " ", $vqrange], _
		[-3142, -7486, " ", $vqrange], _
		[-5088, -8925, " ", $vqrange], _
		[-5647, -9903, " ", $vqrange], _
		[-6150, -10936, " ", $vqrange], _
		[-6913, -13149, " ", $vqrange], _
		[-13413, -10285, " ", $vqrange], _
		[-6891, -13524, " ", $vqrange], _
		[-5510, -14758, " ", $vqrange], _
		[-3530, -15083, " ", $vqrange], _
		[-1590, -15014, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

