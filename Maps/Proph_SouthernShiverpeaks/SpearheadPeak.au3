#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aSpearheadPeakOutpostPath[2][2] = [ _
	[-21052.03, 13106.16], _
	[-22899, 13360] _
]

Func GoOutSpearheadPeak()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $SpearheadPeak_Map Then Return

	If $l_i_Map = $SpearheadPeak_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> SpearheadPeak (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSpearheadPeakOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQSpearheadPeak()
	If GetMapID() <> $SpearheadPeak_Map And GetMapID() <> $SpearheadPeak_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SpearheadPeak.")
		TravelTo($SpearheadPeak_Outpost)
	EndIf

	If GetMapID() = $SpearheadPeak_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutSpearheadPeak()
		If GetMapID() <> $SpearheadPeak_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SpearheadPeak (" & $SpearheadPeak_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $SpearheadPeak_Map Then
		CurrentAction("SpearheadPeak route waiting - on map " & GetMapID() & ", need " & $SpearheadPeak_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SpearheadPeak vanquish route.")

	Local $aWaypoints[123][4] = [ _
		[7547, -25881, " ", $vqrange], _
		[7443, -25155, " ", $vqrange], _
		[6856, -24163, " ", $vqrange], _
		[6382, -23762, " ", $vqrange], _
		[6909, -22441, " ", $vqrange], _
		[5907, -22130, " ", $vqrange], _
		[5236, -21939, " ", $vqrange], _
		[4059, -21533, " ", $vqrange], _
		[1979, -21361, " ", $vqrange], _
		[3425, -22010, " ", $vqrange], _
		[3432, -22666, " ", $vqrange], _
		[2666, -23354, " ", $vqrange], _
		[1060, -24200, " ", $vqrange], _
		[-775, -24383, " ", $vqrange], _
		[-1757, -24035, " ", $vqrange], _
		[-2301, -23203, " ", $vqrange], _
		[-2413, -22464, " ", $vqrange], _
		[-2349, -20969, " ", $vqrange], _
		[-2327, -20610, " ", $vqrange], _
		[-2363, -20048, " ", $vqrange], _
		[-1595, -16834, " ", $vqrange], _
		[-149, -15189, " ", $vqrange], _
		[522, -14406, " ", $vqrange], _
		[2323, -12787, " ", $vqrange], _
		[3677, -11082, " ", $vqrange], _
		[3693, -11019, " ", $vqrange], _
		[4168, -10351, " ", $vqrange], _
		[6164, -9754, " ", $vqrange], _
		[7850, -8623, " ", $vqrange], _
		[8142, -8460, " ", $vqrange], _
		[9439, -8195, " ", $vqrange], _
		[9959, -8170, " ", $vqrange], _
		[10272, -8298, " ", $vqrange], _
		[11375, -8173, " ", $vqrange], _
		[11757, -8872, " ", $vqrange], _
		[11809, -10308, " ", $vqrange], _
		[11598, -10977, " ", $vqrange], _
		[11257, -12346, " ", $vqrange], _
		[11097, -13656, " ", $vqrange], _
		[10589, -14462, " ", $vqrange], _
		[9983, -14922, " ", $vqrange], _
		[10732, -13698, " ", $vqrange], _
		[11348, -8130, " ", $vqrange], _
		[10754, -7286, " ", $vqrange], _
		[10058, -4718, " ", $vqrange], _
		[8889, -3731, " ", $vqrange], _
		[7724, -3316, " ", $vqrange], _
		[7371, -3085, " ", $vqrange], _
		[6497, -1914, " ", $vqrange], _
		[4764, -916, " ", $vqrange], _
		[3749, -699, " ", $vqrange], _
		[2573, -1037, " ", $vqrange], _
		[1182, -979, " ", $vqrange], _
		[1454, -81, " ", $vqrange], _
		[2370, 761, " ", $vqrange], _
		[2942, 1875, " ", $vqrange], _
		[2509, 3170, " ", $vqrange], _
		[2459, 4362, " ", $vqrange], _
		[1881, 4283, " ", $vqrange], _
		[457, 3664, " ", $vqrange], _
		[-918, 3473, " ", $vqrange], _
		[-1596, 4270, " ", $vqrange], _
		[-2251, 5089, " ", $vqrange], _
		[-2572, 5430, " ", $vqrange], _
		[-2994, 5274, " ", $vqrange], _
		[-3955, 4793, " ", $vqrange], _
		[-5580, 5265, " ", $vqrange], _
		[-6554, 5135, " ", $vqrange], _
		[-8236, 5414, " ", $vqrange], _
		[-9182, 5820, " ", $vqrange], _
		[-10246, 5487, " ", $vqrange], _
		[-10369, 5121, " ", $vqrange], _
		[-12060, 4780, " ", $vqrange], _
		[-14392, 666, " ", $vqrange], _
		[-12163, 5046, " ", $vqrange], _
		[-12523, 5770, " ", $vqrange], _
		[-13152, 8023, " ", $vqrange], _
		[-13081, 9078, " ", $vqrange], _
		[-13043, 9344, " ", $vqrange], _
		[-12897, 9674, " ", $vqrange], _
		[-12956, 10249, " ", $vqrange], _
		[-12329, 12101, " ", $vqrange], _
		[-13011, 9048, " ", $vqrange], _
		[-13129, 7311, " ", $vqrange], _
		[-12841, 6340, " ", $vqrange], _
		[-11847, 5401, " ", $vqrange], _
		[-10541, 4848, " ", $vqrange], _
		[-10076, 3909, " ", $vqrange], _
		[-9465, 2654, " ", $vqrange], _
		[-9234, 1467, " ", $vqrange], _
		[-6897, 127, " ", $vqrange], _
		[-5231, -807, " ", $vqrange], _
		[-4769, -1285, " ", $vqrange], _
		[-4473, -4281, " ", $vqrange], _
		[-5353, -4131, " ", $vqrange], _
		[-4974, -4449, " ", $vqrange], _
		[-4790, -4737, " ", $vqrange], _
		[-4634, -5829, " ", $vqrange], _
		[-4761, -5955, " ", $vqrange], _
		[-4933, -6184, " ", $vqrange], _
		[-5705, -8053, " ", $vqrange], _
		[-5754, -8838, " ", $vqrange], _
		[-7465, -7977, " ", $vqrange], _
		[-9510, -8759, " ", $vqrange], _
		[-8799, -7647, " ", $vqrange], _
		[-10214, -8605, " ", $vqrange], _
		[-10739, -7478, " ", $vqrange], _
		[-11056, -8069, " ", $vqrange], _
		[-12446, -8594, " ", $vqrange], _
		[-12714, -9526, " ", $vqrange], _
		[-12845, -10052, " ", $vqrange], _
		[-13110, -12824, " ", $vqrange], _
		[-12964, -14425, " ", $vqrange], _
		[-12686, -16653, " ", $vqrange], _
		[-11716, -17194, " ", $vqrange], _
		[-11098, -17593, " ", $vqrange], _
		[-10447, -18371, " ", $vqrange], _
		[-8631, -19331, " ", $vqrange], _
		[-10109, -19370, " ", $vqrange], _
		[-10262, -19966, " ", $vqrange], _
		[-10157, -20649, " ", $vqrange], _
		[-10589, -21278, " ", $vqrange], _
		[-8791, -22860, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

