;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutDrakkarLake()
	; Outpost exit not yet mapped - placeholder coords
	MoveTo(1683, -1594)
	Move(4600, -27863)
	WaitForLoad()
EndFunc

Func VQDrakkarLake()
	If GetMapID() <> $DrakkarLake_Map And GetMapID() <> $DrakkarLake_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Drakkar Lake.")
		TravelTo($DrakkarLake_Outpost)
	EndIf

	If GetMapID() = $DrakkarLake_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $DrakkarLake_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Drakkar Lake (" & $DrakkarLake_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $DrakkarLake_Map Then
		CurrentAction("Drakkar Lake route waiting - on map " & GetMapID() & ", need " & $DrakkarLake_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Drakkar Lake vanquish route.")
	Local $aWaypoints[247][4] = [ _
		[8872, 23295, " ", $vqrange], _
		[7417, 23727, "shrine", $vqrange], _
		[4923, 23037, " ", $vqrange], _
		[2620, 21947, " ", $vqrange], _
		[1098, 24054, " ", $vqrange], _
		[-1448, 24355, " ", $vqrange], _
		[-3927, 24030, " ", $vqrange], _
		[-6382, 23515, " ", $vqrange], _
		[-8899, 23225, " ", $vqrange], _
		[-7301, 25296, " ", $vqrange], _
		[-9752, 24429, " ", $vqrange], _
		[-11533, 24949, "shrine", $vqrange], _
		[-11975, 25939, " ", $vqrange], _
		[-13251, 23751, " ", $vqrange], _
		[-12958, 21207, " ", $vqrange], _
		[-12362, 18717, " ", $vqrange], _
		[-10665, 20627, " ", $vqrange], _
		[-8150, 21078, " ", $vqrange], _
		[-9691, 18789, " ", $vqrange], _
		[-11459, 16832, " ", $vqrange], _
		[-12105, 19323, " ", $vqrange], _
		[-11439, 16800, " ", $vqrange], _
		[-10291, 14450, " ", $vqrange], _
		[-9607, 12015, " ", $vqrange], _
		[-8296, 9823, " ", $vqrange], _
		[-5794, 9336, " ", $vqrange], _
		[-3971, 11066, " ", $vqrange], _
		[-4821, 13437, " ", $vqrange], _
		[-6343, 15525, " ", $vqrange], _
		[-4072, 14373, " ", $vqrange], _
		[-2344, 13190, " ", $vqrange], _
		[-3174, 15617, " ", $vqrange], _
		[-673, 14857, " ", $vqrange], _
		[664, 15761, " ", $vqrange], _
		[3251, 16043, " ", $vqrange], _
		[4910, 14049, " ", $vqrange], _
		[3617, 11591, " ", $vqrange], _
		[1126, 11020, " ", $vqrange], _
		[-675, 9244, " ", $vqrange], _
		[-2471, 7311, " ", $vqrange], _
		[-4296, 5547, " ", $vqrange], _
		[-6087, 7365, " ", $vqrange], _
		[-8512, 8011, " ", $vqrange], _
		[-9364, 5543, " ", $vqrange], _
		[-9539, 3017, " ", $vqrange], _
		[-8050, 1897, " ", $vqrange], _
		[-10632, 2098, " ", $vqrange], _
		[-12547, 382, " ", $vqrange], _
		[-11580, -238, " ", $vqrange], _
		[-12650, 2182, " ", $vqrange], _
		[-12480, 4584, " ", $vqrange], _
		[-11756, 2107, " ", $vqrange], _
		[-9562, 3345, " ", $vqrange], _
		[-9269, 5874, " ", $vqrange], _
		[-7591, 7735, " ", $vqrange], _
		[-5433, 6249, " ", $vqrange], _
		[-2904, 6847, " ", $vqrange], _
		[-1169, 8731, " ", $vqrange], _
		[1408, 9064, " ", $vqrange], _
		[1534, 11587, " ", $vqrange], _
		[4034, 11854, " ", $vqrange], _
		[4506, 14397, " ", $vqrange], _
		[3137, 16563, " ", $vqrange], _
		[1132, 18132, " ", $vqrange], _
		[-851, 19745, " ", $vqrange], _
		[-2718, 21501, " ", $vqrange], _
		[-4342, 23558, " ", $vqrange], _
		[-1866, 24038, " ", $vqrange], _
		[585, 23493, " ", $vqrange], _
		[3041, 22735, " ", $vqrange], _
		[5543, 22898, " ", $vqrange], _
		[8061, 22632, " ", $vqrange], _
		[9474, 20459, " ", $vqrange], _
		[10983, 18453, " ", $vqrange], _
		[12270, 16846, "shrine", $vqrange], _
		[14319, 15287, " ", $vqrange], _
		[14883, 12775, " ", $vqrange], _
		[14479, 10249, " ", $vqrange], _
		[14668, 7667, " ", $vqrange], _
		[12306, 6696, " ", $vqrange], _
		[10357, 7316, " ", $vqrange], _
		[11982, 9307, " ", $vqrange], _
		[12289, 11911, " ", $vqrange], _
		[11001, 14191, " ", $vqrange], _
		[8504, 14057, " ", $vqrange], _
		[6149, 15031, " ", $vqrange], _
		[5682, 12536, " ", $vqrange], _
		[3214, 11700, " ", $vqrange], _
		[740, 11166, " ", $vqrange], _
		[-605, 8955, " ", $vqrange], _
		[-2432, 7148, " ", $vqrange], _
		[-3526, 4816, " ", $vqrange], _
		[-3773, 2277, " ", $vqrange], _
		[-4754, -137, " ", $vqrange], _
		[-5552, -2591, " ", $vqrange], _
		[-5178, -4173, "shrine", $vqrange], _
		[-2683, -3358, " ", $vqrange], _
		[-1078, -1416, " ", $vqrange], _
		[-846, -3962, " ", $vqrange], _
		[-1552, -6436, " ", $vqrange], _
		[-890, -4003, " ", $vqrange], _
		[-304, -1516, " ", $vqrange], _
		[149, 1000, " ", $vqrange], _
		[939, 3447, " ", $vqrange], _
		[3454, 4092, " ", $vqrange], _
		[5903, 4610, " ", $vqrange], _
		[7429, 6727, " ", $vqrange], _
		[4893, 6906, " ", $vqrange], _
		[4269, 5435, "shrine", $vqrange], _
		[5829, 7529, " ", $vqrange], _
		[7906, 5969, " ", $vqrange], _
		[9962, 4487, " ", $vqrange], _
		[12351, 3331, " ", $vqrange], _
		[14452, 2385, "shrine", $vqrange], _
		[13528, -39, " ", $vqrange], _
		[11020, 515, " ", $vqrange], _
		[10185, 1058, " ", $vqrange], _
		[7928, 2429, " ", $vqrange], _
		[5636, 1122, " ", $vqrange], _
		[7933, 27, " ", $vqrange], _
		[10004, 1444, " ", $vqrange], _
		[11306, 3713, " ", $vqrange], _
		[11339, 1110, " ", $vqrange], _
		[12026, -1358, " ", $vqrange], _
		[13369, -3509, " ", $vqrange], _
		[14880, -3312, " ", $vqrange], _
		[15227, -5805, " ", $vqrange], _
		[15426, -8324, " ", $vqrange], _
		[12896, -8145, " ", $vqrange], _
		[11545, -5987, " ", $vqrange], _
		[9206, -7111, " ", $vqrange], _
		[9421, -9630, " ", $vqrange], _
		[11604, -11013, " ", $vqrange], _
		[11269, -8505, " ", $vqrange], _
		[10754, -6005, " ", $vqrange], _
		[10222, -3461, " ", $vqrange], _
		[9699, -1009, " ", $vqrange], _
		[9558, 1490, " ", $vqrange], _
		[10197, -1049, " ", $vqrange], _
		[10198, -3605, " ", $vqrange], _
		[10379, -6109, " ", $vqrange], _
		[11471, -8428, " ", $vqrange], _
		[12602, -10737, " ", $vqrange], _
		[13461, -13112, " ", $vqrange], _
		[13916, -15664, " ", $vqrange], _
		[14850, -18099, " ", $vqrange], _
		[12635, -16736, " ", $vqrange], _
		[12244, -14173, " ", $vqrange], _
		[10629, -12140, " ", $vqrange], _
		[8102, -12473, " ", $vqrange], _
		[6184, -10852, " ", $vqrange], _
		[8780, -11210, " ", $vqrange], _
		[11360, -11615, " ", $vqrange], _
		[10818, -14125, " ", $vqrange], _
		[9990, -16555, " ", $vqrange], _
		[9194, -18951, " ", $vqrange], _
		[8398, -21347, " ", $vqrange], _
		[8538, -23871, " ", $vqrange], _
		[10219, -25844, " ", $vqrange], _
		[7980, -24650, " ", $vqrange], _
		[5976, -23492, "shrine", $vqrange], _
		[3609, -22653, " ", $vqrange], _
		[1022, -22746, " ", $vqrange], _
		[-1368, -23560, " ", $vqrange], _
		[-3694, -24505, " ", $vqrange], _
		[-6194, -24477, " ", $vqrange], _
		[-8721, -24127, " ", $vqrange], _
		[-9976, -21847, " ", $vqrange], _
		[-11503, -20893, "shrine", $vqrange], _
		[-11945, -18410, " ", $vqrange], _
		[-10910, -16102, " ", $vqrange], _
		[-9451, -13927, " ", $vqrange], _
		[-7805, -15833, " ", $vqrange], _
		[-8525, -17171, " ", $vqrange], _
		[-6110, -18078, " ", $vqrange], _
		[-5032, -20384, " ", $vqrange], _
		[-4049, -22805, " ", $vqrange], _
		[-6469, -21970, " ", $vqrange], _
		[-8188, -20060, " ", $vqrange], _
		[-5628, -20040, " ", $vqrange], _
		[-3030, -20263, " ", $vqrange], _
		[-521, -20504, " ", $vqrange], _
		[1970, -20736, " ", $vqrange], _
		[4589, -20947, " ", $vqrange], _
		[7189, -21154, " ", $vqrange], _
		[5446, -19289, " ", $vqrange], _
		[6334, -16930, " ", $vqrange], _
		[7170, -14537, " ", $vqrange], _
		[7587, -11934, " ", $vqrange], _
		[8379, -9544, " ", $vqrange], _
		[5925, -10339, " ", $vqrange], _
		[3590, -11330, " ", $vqrange], _
		[3988, -13857, " ", $vqrange], _
		[4399, -16417, " ", $vqrange], _
		[4358, -18930, " ", $vqrange], _
		[1785, -18609, " ", $vqrange], _
		[-625, -17842, " ", $vqrange], _
		[-3065, -17098, " ", $vqrange], _
		[-5267, -15865, " ", $vqrange], _
		[-5921, -13426, " ", $vqrange], _
		[-6579, -10902, " ", $vqrange], _
		[-4334, -12206, " ", $vqrange], _
		[-5153, -11559, " ", $vqrange], _
		[-2744, -12428, " ", $vqrange], _
		[-678, -13899, " ", $vqrange], _
		[1700, -14671, " ", $vqrange], _
		[3533, -16535, " ", $vqrange], _
		[2387, -14301, " ", $vqrange], _
		[1132, -12085, " ", $vqrange], _
		[-873, -10504, " ", $vqrange], _
		[-2947, -9053, " ", $vqrange], _
		[-4875, -7310, " ", $vqrange], _
		[-6690, -5563, " ", $vqrange], _
		[-8528, -7371, " ", $vqrange], _
		[-9080, -4904, " ", $vqrange], _
		[-11016, -6513, " ", $vqrange], _
		[-12620, -8575, " ", $vqrange], _
		[-12099, -11090, " ", $vqrange], _
		[-10517, -13051, " ", $vqrange], _
		[-8506, -14695, " ", $vqrange], _
		[-6141, -15752, " ", $vqrange], _
		[-3587, -15264, " ", $vqrange], _
		[-1139, -14618, " ", $vqrange], _
		[1358, -13960, " ", $vqrange], _
		[3890, -13977, " ", $vqrange], _
		[6452, -14296, " ", $vqrange], _
		[8963, -14424, " ", $vqrange], _
		[11525, -14622, " ", $vqrange], _
		[12185, -17101, " ", $vqrange], _
		[12401, -19712, " ", $vqrange], _
		[10357, -18122, " ", $vqrange], _
		[12506, -19444, " ", $vqrange], _
		[10351, -18130, " ", $vqrange], _
		[8083, -16933, " ", $vqrange], _
		[5944, -15531, " ", $vqrange], _
		[3956, -13898, " ", $vqrange], _
		[2017, -12243, " ", $vqrange], _
		[805, -9949, " ", $vqrange], _
		[644, -7312, " ", $vqrange], _
		[2905, -8389, " ", $vqrange], _
		[5259, -7471, " ", $vqrange], _
		[6793, -5398, " ", $vqrange], _
		[7698, -2972, " ", $vqrange], _
		[5090, -2486, " ", $vqrange], _
		[2654, -1918, " ", $vqrange], _
		[1706, 515, " ", $vqrange], _
		[1942, -2064, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
