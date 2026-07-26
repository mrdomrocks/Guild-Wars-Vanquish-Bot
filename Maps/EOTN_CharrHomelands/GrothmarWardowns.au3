;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutGrothmarWardowns()
	;650 Longeye's Ledge
	MoveTo(-22914, 14828)
	MoveTo(-23471, 14148)
	;650 last outpost cord before explorable (crosses portal to 649)
	Move(-22135, 12878)
	WaitForLoad()
EndFunc

Func VQGrothmarWardowns()
	If GetMapID() <> $GrothmarWardowns_Map And GetMapID() <> $GrothmarWardowns_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Grothmar Wardowns.")
		TravelTo($GrothmarWardowns_Outpost)
	EndIf

	If GetMapID() = $GrothmarWardowns_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $GrothmarWardowns_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Grothmar Wardowns (" & $GrothmarWardowns_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $GrothmarWardowns_Map Then
		CurrentAction("Grothmar Wardowns route waiting - on map " & GetMapID() & ", need " & $GrothmarWardowns_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Grothmar Wardowns vanquish route.")

	Local $aWaypoints[141][4] = [ _
		[-21449, 12487, " ", $vqrange], _
		[-21747, 11494, "shrine", $vqrange], _
		[-19496, 12742, " ", $vqrange], _
		[-16674, 11580, " ", $vqrange], _
		[-17628, 13908, " ", $vqrange], _
		[-18275, 14549, " ", $vqrange], _
		[-16576, 12562, " ", $vqrange], _
		[-14606, 10845, " ", $vqrange], _
		[-11991, 11124, " ", $vqrange], _
		[-10967, 10495, " ", $vqrange], _
		[-8535, 9461, " ", $vqrange], _
		[-9108, 7658, " ", $vqrange], _
		[-7084, 9311, " ", $vqrange], _
		[-4535, 9710, " ", $vqrange], _
		[-2332, 8439, " ", $vqrange], _
		[110, 8352, "shrine", $vqrange], _
		[1485, 10500, " ", $vqrange], _
		[3459, 12079, " ", $vqrange], _
		[5798, 12986, " ", $vqrange], _
		[7246, 15164, " ", $vqrange], _
		[7376, 15493, " ", $vqrange], _
		[9854, 14782, " ", $vqrange], _
		[12448, 14602, " ", $vqrange], _
		[14988, 14428, " ", $vqrange], _
		[17268, 15468, " ", $vqrange], _
		[15734, 13421, " ", $vqrange], _
		[18061, 12390, " ", $vqrange], _
		[20355, 13479, " ", $vqrange], _
		[22540, 14771, "shrine", $vqrange], _
		[20486, 13292, " ", $vqrange], _
		[18384, 11777, " ", $vqrange], _
		[16561, 9937, " ", $vqrange], _
		[18349, 8101, " ", $vqrange], _
		[19240, 7798, " ", $vqrange], _
		[16739, 8254, " ", $vqrange], _
		[14488, 6854, " ", $vqrange], _
		[11975, 6314, " ", $vqrange], _
		[9836, 7771, " ", $vqrange], _
		[7346, 8115, " ", $vqrange], _
		[5715, 6090, " ", $vqrange], _
		[6693, 3646, " ", $vqrange], _
		[4633, 2193, " ", $vqrange], _
		[2498, 3532, " ", $vqrange], _
		[4629, 2057, " ", $vqrange], _
		[6795, 720, " ", $vqrange], _
		[6854, -1806, " ", $vqrange], _
		[6240, -4317, " ", $vqrange], _
		[7808, -2365, " ", $vqrange], _
		[8794, 52, " ", $vqrange], _
		[10715, 1708, " ", $vqrange], _
		[11960, 2197, "shrine", $vqrange], _
		[12624, -252, " ", $vqrange], _
		[13889, -2470, " ", $vqrange], _
		[15225, -4653, " ", $vqrange], _
		[17709, -3828, " ", $vqrange], _
		[18528, -1465, " ", $vqrange], _
		[19287, 924, " ", $vqrange], _
		[19864, 3424, " ", $vqrange], _
		[18014, 3306, " ", $vqrange], _
		[18739, 909, " ", $vqrange], _
		[18986, -1688, " ", $vqrange], _
		[20622, -3701, " ", $vqrange], _
		[21971, -5821, " ", $vqrange], _
		[22795, -8222, " ", $vqrange], _
		[22521, -10732, " ", $vqrange], _
		[20956, -12690, " ", $vqrange], _
		[19984, -13194, "shrine", $vqrange], _
		[18596, -11041, " ", $vqrange], _
		[17125, -8942, " ", $vqrange], _
		[14618, -8700, " ", $vqrange], _
		[13628, -11032, " ", $vqrange], _
		[12956, -12311, " ", $vqrange], _
		[10391, -12334, " ", $vqrange], _
		[7908, -11587, " ", $vqrange], _
		[10335, -10795, " ", $vqrange], _
		[12597, -9569, " ", $vqrange], _
		[10001, -9229, " ", $vqrange], _
		[8547, -11366, " ", $vqrange], _
		[6082, -12228, " ", $vqrange], _
		[3603, -12373, "shrine", $vqrange], _
		[3356, -9821, " ", $vqrange], _
		[3455, -7258, " ", $vqrange], _
		[2736, -4846, " ", $vqrange], _
		[3641, -2414, " ", $vqrange], _
		[2822, -35, " ", $vqrange], _
		[474, 1023, " ", $vqrange], _
		[-2303, 1414, " ", $vqrange], _
		[-1080, 3238, " ", $vqrange], _
		[740, 4957, " ", $vqrange], _
		[2595, 6812, " ", $vqrange], _
		[4488, 8462, " ", $vqrange], _
		[2005, 7558, " ", $vqrange], _
		[166, 8354, "shrine", $vqrange], _
		[-1554, 6509, " ", $vqrange], _
		[-3063, 4344, " ", $vqrange], _
		[-4007, 1929, " ", $vqrange], _
		[-3574, -682, "shrine", $vqrange], _
		[-1808, -2562, " ", $vqrange], _
		[-367, -4777, " ", $vqrange], _
		[-102, -7367, " ", $vqrange], _
		[-120, -9959, " ", $vqrange], _
		[-634, -12384, " ", $vqrange], _
		[-2997, -11507, " ", $vqrange], _
		[-2997, -11507, " ", $vqrange], _
		[-5184, -12384, " ", $vqrange], _
		[-3278, -11359, " ", $vqrange], _
		[-4136, -9281, " ", $vqrange], _
		[-2810, -7012, " ", $vqrange], _
		[-3185, -4413, " ", $vqrange], _
		[-4316, -6777, " ", $vqrange], _
		[-6818, -6849, " ", $vqrange], _
		[-8335, -4784, " ", $vqrange], _
		[-9666, -2541, " ", $vqrange], _
		[-10882, -184, " ", $vqrange], _
		[-11598, 2317, " ", $vqrange], _
		[-11830, 4941, " ", $vqrange], _
		[-14367, 5427, " ", $vqrange], _
		[-16692, 6476, " ", $vqrange], _
		[-18183, 8508, " ", $vqrange], _
		[-19521, 9170, " ", $vqrange], _
		[-18913, 6648, " ", $vqrange], _
		[-18640, 4122, " ", $vqrange], _
		[-19513, 1680, " ", $vqrange], _
		[-19775, -890, " ", $vqrange], _
		[-18752, -3057, "shrine", $vqrange], _
		[-20649, -4693, " ", $vqrange], _
		[-22461, -6520, " ", $vqrange], _
		[-23030, -9083, " ", $vqrange], _
		[-23441, -11556, " ", $vqrange], _
		[-20909, -11367, " ", $vqrange], _
		[-18884, -9805, " ", $vqrange], _
		[-17848, -7510, " ", $vqrange], _
		[-16847, -5168, " ", $vqrange], _
		[-14994, -3327, " ", $vqrange], _
		[-14947, -783, " ", $vqrange], _
		[-15732, 1745, " ", $vqrange], _
		[-14934, -667, " ", $vqrange], _
		[-14239, -3187, " ", $vqrange], _
		[-11886, -2236, " ", $vqrange], _
		[-9704, -932, " ", $vqrange], _
		[-7400, 324, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
