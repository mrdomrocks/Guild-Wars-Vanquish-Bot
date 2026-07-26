;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutRivenEarth()
	MoveTo(19623, 16850)
	Move(20300, 16850)
	WaitForLoad()
EndFunc

Func VQRivenEarth()
	If GetMapID() <> $RivenEarth_Map And GetMapID() <> $RivenEarth_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Riven Earth.")
		TravelTo($RivenEarth_Outpost)
	EndIf

	If GetMapID() = $RivenEarth_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $RivenEarth_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Riven Earth (" & $RivenEarth_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $RivenEarth_Map Then
		CurrentAction("Riven Earth route waiting - on map " & GetMapID() & ", need " & $RivenEarth_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Riven Earth vanquish route.")

	Local $aWaypoints[159][4] = [ _
		[-25000, -3996, " ", $vqrange], _
		[-24260, -5678, "shrine", $vqrange], _
		[-22313, -7371, " ", $vqrange], _
		[-20963, -9515, " ", $vqrange], _
		[-18868, -11005, " ", $vqrange], _
		[-21019, -12399, " ", $vqrange], _
		[-22060, -12929, " ", $vqrange], _
		[-24438, -11919, " ", $vqrange], _
		[-24599, -11278, " ", $vqrange], _
		[-22068, -10959, " ", $vqrange], _
		[-19603, -11400, " ", $vqrange], _
		[-17089, -11052, " ", $vqrange], _
		[-14995, -9592, " ", $vqrange], _
		[-16211, -7382, " ", $vqrange], _
		[-17793, -5381, " ", $vqrange], _
		[-18782, -4414, " ", $vqrange], _
		[-16573, -5590, " ", $vqrange], _
		[-14966, -7512, " ", $vqrange], _
		[-12526, -8261, " ", $vqrange], _
		[-12992, -10726, " ", $vqrange], _
		[-13157, -12555, " ", $vqrange], _
		[-11516, -11673, " ", $vqrange], _
		[-8958, -11598, " ", $vqrange], _
		[-7960, -11520, "shrine", $vqrange], _
		[-6684, -12610, " ", $vqrange], _
		[-5091, -10614, " ", $vqrange], _
		[-5939, -8254, " ", $vqrange], _
		[-7161, -6007, " ", $vqrange], _
		[-9723, -5772, " ", $vqrange], _
		[-7843, -7493, " ", $vqrange], _
		[-5725, -8928, " ", $vqrange], _
		[-3253, -9368, " ", $vqrange], _
		[-704, -8953, " ", $vqrange], _
		[-1059, -6429, " ", $vqrange], _
		[-2067, -4302, " ", $vqrange], _
		[-3539, -2173, " ", $vqrange], _
		[-3865, -623, " ", $vqrange], _
		[-3119, -464, "shrine", $vqrange], _
		[-5161, 1019, " ", $vqrange], _
		[-7700, 654, " ", $vqrange], _
		[-9936, 1818, " ", $vqrange], _
		[-12336, 2770, " ", $vqrange], _
		[-14454, 4204, " ", $vqrange], _
		[-16312, 5981, " ", $vqrange], _
		[-18821, 6443, " ", $vqrange], _
		[-19001, 6560, " ", $vqrange], _
		[-21208, 5330, " ", $vqrange], _
		[-23165, 3746, " ", $vqrange], _
		[-23617, 3457, " ", $vqrange], _
		[-22841, 5912, " ", $vqrange], _
		[-21148, 7817, " ", $vqrange], _
		[-18989, 9216, " ", $vqrange], _
		[-16505, 9613, "shrine", $vqrange], _
		[-18604, 11134, " ", $vqrange], _
		[-20924, 12278, " ", $vqrange], _
		[-22269, 12909, " ", $vqrange], _
		[-19952, 11887, " ", $vqrange], _
		[-17700, 13072, " ", $vqrange], _
		[-16799, 15481, " ", $vqrange], _
		[-16557, 15647, " ", $vqrange], _
		[-14540, 14145, " ", $vqrange], _
		[-12091, 13550, " ", $vqrange], _
		[-10673, 11487, " ", $vqrange], _
		[-10482, 8908, " ", $vqrange], _
		[-9266, 6664, " ", $vqrange], _
		[-6808, 5977, " ", $vqrange], _
		[-5192, 7904, " ", $vqrange], _
		[-3800, 9995, " ", $vqrange], _
		[-3645, 9928, " ", $vqrange], _
		[-3548, 7863, " ", $vqrange], _
		[-2667, 7262, " ", $vqrange], _
		[-1154, 8187, " ", $vqrange], _
		[-3132, 9728, " ", $vqrange], _
		[-3013, 12307, " ", $vqrange], _
		[-3062, 12881, "shrine", $vqrange], _
		[-5289, 14169, " ", $vqrange], _
		[-6278, 16002, " ", $vqrange], _
		[-4605, 14092, " ", $vqrange], _
		[-3028, 12064, " ", $vqrange], _
		[-1482, 10014, " ", $vqrange], _
		[687, 8694, " ", $vqrange], _
		[3124, 7765, " ", $vqrange], _
		[5593, 7122, " ", $vqrange], _
		[7542, 5481, " ", $vqrange], _
		[9179, 3577, " ", $vqrange], _
		[10962, 1725, " ", $vqrange], _
		[13275, 600, " ", $vqrange], _
		[15812, 973, " ", $vqrange], _
		[17191, 3063, " ", $vqrange], _
		[15517, 4955, " ", $vqrange], _
		[14444, 7230, " ", $vqrange], _
		[12146, 8459, " ", $vqrange], _
		[11469, 8704, "shrine", $vqrange], _
		[11191, 6126, " ", $vqrange], _
		[12260, 8489, " ", $vqrange], _
		[11300, 10802, " ", $vqrange], _
		[10122, 13066, " ", $vqrange], _
		[7707, 13714, " ", $vqrange], _
		[5643, 12174, " ", $vqrange], _
		[3125, 12316, " ", $vqrange], _
		[1881, 12564, " ", $vqrange], _
		[4412, 11927, " ", $vqrange], _
		[6959, 11533, " ", $vqrange], _
		[9402, 10730, " ", $vqrange], _
		[11525, 9287, " ", $vqrange], _
		[13969, 8708, " ", $vqrange], _
		[16540, 8907, " ", $vqrange], _
		[18647, 8840, " ", $vqrange], _
		[18875, 6602, " ", $vqrange], _
		[18761, 9117, " ", $vqrange], _
		[17243, 7074, " ", $vqrange], _
		[15334, 5338, " ", $vqrange], _
		[16808, 3221, " ", $vqrange], _
		[19358, 2840, " ", $vqrange], _
		[21861, 2169, " ", $vqrange], _
		[23357, 68, " ", $vqrange], _
		[23713, -444, "shrine", $vqrange], _
		[24994, -51, " ", $vqrange], _
		[22636, -1011, " ", $vqrange], _
		[20062, -827, " ", $vqrange], _
		[17797, 266, " ", $vqrange], _
		[18818, -2086, " ", $vqrange], _
		[19967, -4405, " ", $vqrange], _
		[21023, -6656, " ", $vqrange], _
		[19802, -5018, " ", $vqrange], _
		[18120, -6895, " ", $vqrange], _
		[16415, -8799, " ", $vqrange], _
		[14944, -10188, " ", $vqrange], _
		[12493, -9339, " ", $vqrange], _
		[9981, -8708, " ", $vqrange], _
		[9278, -8532, "shrine", $vqrange], _
		[10518, -6256, " ", $vqrange], _
		[10617, -3742, " ", $vqrange], _
		[9024, -1713, " ", $vqrange], _
		[7142, 13, " ", $vqrange], _
		[4843, 1207, " ", $vqrange], _
		[2584, 2384, " ", $vqrange], _
		[425, 3654, " ", $vqrange], _
		[-2099, 3054, " ", $vqrange], _
		[-4547, 2265, " ", $vqrange], _
		[-4941, 1140, "shrine", $vqrange], _
		[-4538, -1400, " ", $vqrange], _
		[-4051, -3959, " ", $vqrange], _
		[-2040, -5446, " ", $vqrange], _
		[-564, -7568, " ", $vqrange], _
		[-383, -8283, " ", $vqrange], _
		[2040, -9254, " ", $vqrange], _
		[3987, -10959, " ", $vqrange], _
		[6479, -10370, " ", $vqrange], _
		[4425, -8839, " ", $vqrange], _
		[3318, -6542, " ", $vqrange], _
		[4038, -4101, " ", $vqrange], _
		[4102, -2599, " ", $vqrange], _
		[6336, -3785, " ", $vqrange], _
		[7663, -1556, " ", $vqrange], _
		[9007, 582, " ", $vqrange], _
		[10712, 2503, " ", $vqrange], _
		[10572, 4495, " ", $vqrange], _
		[11692, 6790, " ", $vqrange] ]

	GoNearestNPCToCoords(18766, 15933)
	Sleep(1000)
	Dialog(0x83)
	Sleep(1000)
	Dialog(0x84)
	Sleep(1000)

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
