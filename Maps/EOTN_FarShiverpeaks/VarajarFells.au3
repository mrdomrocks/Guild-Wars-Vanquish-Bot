;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutVarajarFells()
	; Outpost exit not yet mapped - placeholder coords
	MoveTo(1683, -1594)
	Move(4600, -27863)
	WaitForLoad()
EndFunc

Func VQVarajarFells()
	If GetMapID() <> $VarajarFells_Map And GetMapID() <> $VarajarFells_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Varajar Fells.")
		TravelTo($VarajarFells_Outpost)
	EndIf

	If GetMapID() = $VarajarFells_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $VarajarFells_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Varajar Fells (" & $VarajarFells_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $VarajarFells_Map Then
		CurrentAction("Varajar Fells route waiting - on map " & GetMapID() & ", need " & $VarajarFells_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Varajar Fells vanquish route.")

	Local $aWaypoints[203][4] = [ _
		[-2252, 831, " ", $vqrange], _
		[-3431, -1454, " ", $vqrange], _
		[-2561, -3567, " ", $vqrange], _
		[-3817, -4684, " ", $vqrange], _
		[-1964, -4524, "shrine", $vqrange], _
		[463, -5546, " ", $vqrange], _
		[2643, -6910, " ", $vqrange], _
		[3786, -9135, " ", $vqrange], _
		[6254, -9833, " ", $vqrange], _
		[7788, -11983, " ", $vqrange], _
		[8458, -12917, " ", $vqrange], _
		[10102, -10877, " ", $vqrange], _
		[12086, -12056, " ", $vqrange], _
		[13088, -9706, " ", $vqrange], _
		[15186, -8281, " ", $vqrange], _
		[17648, -7471, " ", $vqrange], _
		[20124, -7889, " ", $vqrange], _
		[19353, -9023, " ", $vqrange], _
		[21074, -7163, " ", $vqrange], _
		[23628, -6624, " ", $vqrange], _
		[24511, -6521, "shrine", $vqrange], _
		[23974, -4002, " ", $vqrange], _
		[23024, -4734, " ", $vqrange], _
		[23333, -6403, " ", $vqrange], _
		[22080, -5842, " ", $vqrange], _
		[22124, -6600, " ", $vqrange], _
		[20024, -6615, " ", $vqrange], _
		[21440, -5185, " ", $vqrange], _
		[19944, -3510, " ", $vqrange], _
		[18136, -5284, " ", $vqrange], _
		[15988, -6584, " ", $vqrange], _
		[14860, -4241, " ", $vqrange], _
		[17455, -4449, " ", $vqrange], _
		[20020, -3931, " ", $vqrange], _
		[22205, -5153, " ", $vqrange], _
		[21412, -3227, " ", $vqrange], _
		[20614, -853, " ", $vqrange], _
		[22952, 45, " ", $vqrange], _
		[25187, 1235, " ", $vqrange], _
		[23383, 1879, " ", $vqrange], _
		[20854, 2143, " ", $vqrange], _
		[22608, 4098, " ", $vqrange], _
		[24221, 5654, " ", $vqrange], _
		[22391, 7502, " ", $vqrange], _
		[22357, 7537, " ", $vqrange], _
		[24726, 8481, " ", $vqrange], _
		[25105, 11093, " ", $vqrange], _
		[24861, 13622, " ", $vqrange], _
		[25431, 16045, " ", $vqrange], _
		[22974, 15408, " ", $vqrange], _
		[22893, 12860, "shrine", $vqrange], _
		[20523, 11757, " ", $vqrange], _
		[21162, 9264, " ", $vqrange], _
		[20393, 6846, " ", $vqrange], _
		[19043, 4675, " ", $vqrange], _
		[17817, 4140, " ", $vqrange], _
		[16780, 6433, " ", $vqrange], _
		[17531, 8842, " ", $vqrange], _
		[14947, 8711, " ", $vqrange], _
		[15118, 11241, " ", $vqrange], _
		[15382, 13823, " ", $vqrange], _
		[14566, 16224, " ", $vqrange], _
		[13705, 14651, "shrine", $vqrange], _
		[11205, 14586, " ", $vqrange], _
		[8769, 13864, " ", $vqrange], _
		[11047, 12752, " ", $vqrange], _
		[11271, 10139, " ", $vqrange], _
		[11812, 7678, " ", $vqrange], _
		[13488, 5657, " ", $vqrange], _
		[13139, 3700, " ", $vqrange], _
		[11723, 5892, " ", $vqrange], _
		[11153, 8407, " ", $vqrange], _
		[9116, 10063, " ", $vqrange], _
		[6934, 11366, " ", $vqrange], _
		[7333, 8887, " ", $vqrange], _
		[8607, 6645, " ", $vqrange], _
		[10544, 4906, " ", $vqrange], _
		[9438, 3833, "shrine", $vqrange], _
		[7164, 5019, " ", $vqrange], _
		[7596, 2504, " ", $vqrange], _
		[9071, 474, " ", $vqrange], _
		[10120, -1920, " ", $vqrange], _
		[11114, -4226, " ", $vqrange], _
		[11756, -6781, " ", $vqrange], _
		[9664, -5403, " ", $vqrange], _
		[10776, -7681, " ", $vqrange], _
		[10990, -10220, " ", $vqrange], _
		[8788, -9006, " ", $vqrange], _
		[7046, -7181, " ", $vqrange], _
		[4863, -5720, " ", $vqrange], _
		[4480, -3197, " ", $vqrange], _
		[4658, -697, " ", $vqrange], _
		[6347, 1326, " ", $vqrange], _
		[4363, 2977, " ", $vqrange], _
		[2403, 4564, " ", $vqrange], _
		[4357, 6233, " ", $vqrange], _
		[5908, 8272, " ", $vqrange], _
		[5019, 10680, " ", $vqrange], _
		[4441, 13189, " ", $vqrange], _
		[3257, 15558, " ", $vqrange], _
		[790, 16125, " ", $vqrange], _
		[-1718, 16275, " ", $vqrange], _
		[-864, 13829, " ", $vqrange], _
		[-2125, 14818, "shrine", $vqrange], _
		[153, 13520, " ", $vqrange], _
		[1513, 11334, " ", $vqrange], _
		[-294, 9549, " ", $vqrange], _
		[490, 7157, " ", $vqrange], _
		[1691, 4930, " ", $vqrange], _
		[-812, 4937, " ", $vqrange], _
		[-2751, 3277, " ", $vqrange], _
		[-4020, 984, " ", $vqrange], _
		[-3915, 3563, " ", $vqrange], _
		[-3681, 6082, " ", $vqrange], _
		[-2916, 8534, " ", $vqrange], _
		[-1995, 10968, " ", $vqrange], _
		[-2167, 13488, " ", $vqrange], _
		[-3886, 15361, " ", $vqrange], _
		[-6173, 14166, " ", $vqrange], _
		[-7966, 12238, " ", $vqrange], _
		[-6246, 10333, " ", $vqrange], _
		[-3964, 11490, " ", $vqrange], _
		[-1573, 10592, " ", $vqrange], _
		[-4065, 9810, " ", $vqrange], _
		[-6564, 9452, " ", $vqrange], _
		[-5701, 11947, " ", $vqrange], _
		[-8258, 11649, " ", $vqrange], _
		[-10495, 10322, " ", $vqrange], _
		[-9806, 7879, " ", $vqrange], _
		[-7300, 7544, " ", $vqrange], _
		[-5911, 5341, " ", $vqrange], _
		[-8468, 4756, " ", $vqrange], _
		[-11011, 4577, " ", $vqrange], _
		[-11229, 5406, "shrine", $vqrange], _
		[-13710, 5827, " ", $vqrange], _
		[-16334, 6078, " ", $vqrange], _
		[-15514, 8449, " ", $vqrange], _
		[-16642, 10784, " ", $vqrange], _
		[-19275, 10747, " ", $vqrange], _
		[-21497, 11989, " ", $vqrange], _
		[-22800, 14160, "shrine", $vqrange], _
		[-24303, 15423, " ", $vqrange], _
		[-21833, 14982, " ", $vqrange], _
		[-19333, 14449, " ", $vqrange], _
		[-17632, 15301, " ", $vqrange], _
		[-18443, 12799, " ", $vqrange], _
		[-16490, 13698, " ", $vqrange], _
		[-16493, 11158, " ", $vqrange], _
		[-15388, 8833, " ", $vqrange], _
		[-12852, 8998, " ", $vqrange], _
		[-12444, 6422, " ", $vqrange], _
		[-12600, 3910, " ", $vqrange], _
		[-14551, 2233, " ", $vqrange], _
		[-17073, 2662, " ", $vqrange], _
		[-19537, 1998, " ", $vqrange], _
		[-21627, 522, " ", $vqrange], _
		[-19887, 2336, " ", $vqrange], _
		[-17571, 1307, " ", $vqrange], _
		[-15244, 150, " ", $vqrange], _
		[-17049, -1653, " ", $vqrange], _
		[-19666, -1812, " ", $vqrange], _
		[-21866, -1652, " ", $vqrange], _
		[-23987, -2072, " ", $vqrange], _
		[-22931, -4419, " ", $vqrange], _
		[-20569, -5344, " ", $vqrange], _
		[-18079, -5625, " ", $vqrange], _
		[-15588, -4777, " ", $vqrange], _
		[-18021, -5758, " ", $vqrange], _
		[-20080, -7389, " ", $vqrange], _
		[-22541, -8185, " ", $vqrange], _
		[-24368, -9212, " ", $vqrange], _
		[-21997, -10180, " ", $vqrange], _
		[-20274, -12071, " ", $vqrange], _
		[-20764, -13135, " ", $vqrange], _
		[-23220, -12300, " ", $vqrange], _
		[-20771, -13015, " ", $vqrange], _
		[-18584, -11654, " ", $vqrange], _
		[-18713, -9106, " ", $vqrange], _
		[-19311, -6675, " ", $vqrange], _
		[-17077, -7931, " ", $vqrange], _
		[-15990, -10300, " ", $vqrange], _
		[-14252, -10442, " ", $vqrange], _
		[-12689, -8483, " ", $vqrange], _
		[-11279, -6370, " ", $vqrange], _
		[-13838, -6366, " ", $vqrange], _
		[-15208, -4244, " ", $vqrange], _
		[-13592, -2287, " ", $vqrange], _
		[-11506, -834, " ", $vqrange], _
		[-8999, -1235, " ", $vqrange], _
		[-10571, -3206, " ", $vqrange], _
		[-12116, -4215, "shrine", $vqrange], _
		[-11408, -6625, " ", $vqrange], _
		[-9034, -5776, " ", $vqrange], _
		[-7695, -7949, " ", $vqrange], _
		[-6137, -9062, " ", $vqrange], _
		[-3690, -8370, " ", $vqrange], _
		[-5794, -6756, " ", $vqrange], _
		[-3833, -5190, " ", $vqrange], _
		[-1961, -4530, "shrine", $vqrange], _
		[-3799, -4504, " ", $vqrange], _
		[-2615, -3403, " ", $vqrange], _
		[-3436, -1418, " ", $vqrange], _
		[-2355, 886, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
