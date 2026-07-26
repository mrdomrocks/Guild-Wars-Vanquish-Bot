;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1



Local $aLornarsPassOutpostPath[2][2] = [ _
	[-10030, 18833], _
	[-9797, 19027]]

Local $aLornarsPassTransitPath[38][2] = [ _
	[4361, -40986], _
	[2911, -39264], _
	[2133, -33852], _
	[-1060, -33346], _
	[-4758, -28947], _
	[-6471, -25171], _
	[-6082, -22640], _
	[-904, -21784], _
	[1054, -19774], _
	[1709, -15734], _
	[777, -12391], _
	[-1244, -9061], _
	[3023, -995], _
	[3610, 211], _
	[1680, 291], _
	[2015, 1742], _
	[-305, 3030], _
	[3103, 7774], _
	[1909, 14297], _
	[-816, 17801], _
	[-3619, 17256], _
	[-5371, 19670], _
	[-1984, 23796], _
	[-1945, 26833], _
	[508, 25354], _
	[1870, 22590], _
	[4868, 23524], _
	[3856, 27378], _
	[2065, 30960], _
	[2026, 32945], _
	[4634, 33957], _
	[6230, 35670], _
	[3038, 39018], _
	[-310, 37850], _
	[-2023, 40926], _
	[-5916, 41977], _
	[-7311, 44525], _
	[-7091, 45561]]



Local $aLornarsPassTransit2Path[12][2] = [ _
	[-7259, -6921], _
	[-5124, -5438], _
	[-4629, -2903], _
	[-4605, -5429], _
	[-2205, -6317], _
	[-1413, -3853], _
	[-2057, -1427], _
	[-3342, -227], _
	[-3474, 843], _
	[-5840, 1989], _
	[-6887, 4313], _
	[-5679, 6641]]



Func GoOutLornarsPass()

	Local $l_i_Map = GetMapID()



	If $l_i_Map = $LornarsPass_Map Then Return



	If $l_i_Map = $LornarsPass_Outpost Then

		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return

		$g_b_Vanquisher_TransitOnly = True

		CurrentAction("Camp Rankor -> Snake Dance (portal 1)")

		_Vanquisher_RunAggroPortalPath($aLornarsPassOutpostPath, $vqrange, "outpost ")

		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map

		$g_b_Vanquisher_TransitOnly = False

		Return

	EndIf



	If $l_i_Map = $LornarsPass_Transit Then

		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return

		$g_b_Vanquisher_TransitOnly = True

		CurrentAction("Snake Dance -> Dreadnought's Drift (portal 2)")

		_Vanquisher_RunAggroPortalPath($aLornarsPassTransitPath, $vqrange, "transit ")

		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map

		$g_b_Vanquisher_TransitOnly = False

		Return

	EndIf



	If $l_i_Map = $LornarsPass_Transit2 Then

		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return

		$g_b_Vanquisher_TransitOnly = True

		CurrentAction("Dreadnought's Drift -> Lornar's Pass (portal 3)")

		_Vanquisher_RunAggroPortalPath($aLornarsPassTransit2Path, $vqrange, "transit ")

		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map

		$g_b_Vanquisher_TransitOnly = False

		Return

	EndIf



EndFunc



Func VQLornarsPass()

	If GetMapID() <> $LornarsPass_Map And GetMapID() <> $LornarsPass_Outpost And GetMapID() <> $LornarsPass_Transit And GetMapID() <> $LornarsPass_Transit2 Then

		_Vanquisher_ResetGoOutRouteProgress()

		CurrentAction("Traveling to Camp Rankor for Lornar's Pass.")

		TravelTo($LornarsPass_Outpost)

	EndIf



	If GetMapID() = $LornarsPass_Outpost Or GetMapID() = $LornarsPass_Transit Or GetMapID() = $LornarsPass_Transit2 Then

		_Vanquisher_ApplyDifficulty()

		GoOutLornarsPass()

		If GetMapID() <> $LornarsPass_Map Then

			CurrentAction("Routing - on map " & GetMapID() & ", need LornarsPass (" & $LornarsPass_Map & ").")

			Return

	EndIf

	EndIf



	If GetMapID() <> $LornarsPass_Map Then

		CurrentAction("LornarsPass route waiting - on map " & GetMapID() & ", need " & $LornarsPass_Map & ".")

		Return

	EndIf



	CurrentAction("Starting LornarsPass vanquish route.")



	Local $aWaypoints[162][4] = [ _
		[-8678, -34615, " ", $vqrange], _
		[-9985, -33718, " ", $vqrange], _
		[-7673, -32562, " ", $vqrange], _
		[-5422, -31422, " ", $vqrange], _
		[-4344, -29153, " ", $vqrange], _
		[-2605, -30941, " ", $vqrange], _
		[-397, -29652, " ", $vqrange], _
		[2110, -29601, " ", $vqrange], _
		[4702, -29426, " ", $vqrange], _
		[6915, -28227, " ", $vqrange], _
		[6865, -28710, " ", $vqrange], _
		[4455, -29474, " ", $vqrange], _
		[1864, -29634, " ", $vqrange], _
		[-636, -29663, " ", $vqrange], _
		[-9672, 31228, " ", $vqrange], _
		[-7379, 32291, " ", $vqrange], _
		[-4827, 32671, " ", $vqrange], _
		[-4078, -28263, " ", $vqrange], _
		[-6681, -28301, " ", $vqrange], _
		[-9072, -27376, " ", $vqrange], _
		[-7812, -27891, " ", $vqrange], _
		[-5246, -27748, " ", $vqrange], _
		[-4252, -25329, " ", $vqrange], _
		[-3251, -22938, " ", $vqrange], _
		[-1974, -23598, " ", $vqrange], _
		[44, -25132, " ", $vqrange], _
		[2297, -23878, " ", $vqrange], _
		[4706, -23120, " ", $vqrange], _
		[3316, -20954, " ", $vqrange], _
		[2010, -18770, " ", $vqrange], _
		[-23, -17151, " ", $vqrange], _
		[-2081, -15588, " ", $vqrange], _
		[-4577, -14987, " ", $vqrange], _
		[-6783, -13614, " ", $vqrange], _
		[-8080, -11419, " ", $vqrange], _
		[-8661, -8921, " ", $vqrange], _
		[-6404, -7842, " ", $vqrange], _
		[-3819, -7663, " ", $vqrange], _
		[-1229, -7663, " ", $vqrange], _
		[1321, -7725, " ", $vqrange], _
		[-1205, -7749, " ", $vqrange], _
		[-3719, -7417, " ", $vqrange], _
		[-6258, -7042, " ", $vqrange], _
		[-8423, -8389, " ", $vqrange], _
		[-9507, -10742, " ", $vqrange], _
		[-8409, -12527, " ", $vqrange], _
		[-6494, -14292, " ", $vqrange], _
		[-4460, -15773, " ", $vqrange], _
		[-3775, -18251, " ", $vqrange], _
		[-3423, -17799, " ", $vqrange], _
		[-1144, -16540, " ", $vqrange], _
		[770, -18156, " ", $vqrange], _
		[2942, -19470, " ", $vqrange], _
		[5346, -18715, " ", $vqrange], _
		[7680, -19872, " ", $vqrange], _
		[8312, -17447, " ", $vqrange], _
		[9523, -15199, " ", $vqrange], _
		[9273, -12685, " ", $vqrange], _
		[7723, -10660, " ", $vqrange], _
		[9884, -9189, " ", $vqrange], _
		[9221, -7784, " ", $vqrange], _
		[7653, -5816, " ", $vqrange], _
		[9626, -6211, " ", $vqrange], _
		[9858, -4497, " ", $vqrange], _
		[9288, -2052, " ", $vqrange], _
		[9125, 450, " ", $vqrange], _
		[9580, 3002, " ", $vqrange], _
		[10720, 5312, " ", $vqrange], _
		[9301, 5430, " ", $vqrange], _
		[8171, 6239, " ", $vqrange], _
		[6286, 4522, " ", $vqrange], _
		[6319, 2632, " ", $vqrange], _
		[4572, 835, " ", $vqrange], _
		[2537, -630, " ", $vqrange], _
		[2094, -3181, " ", $vqrange], _
		[3234, -5519, " ", $vqrange], _
		[3053, -4690, " ", $vqrange], _
		[2038, -3272, " ", $vqrange], _
		[2387, -707, " ", $vqrange], _
		[3794, 1464, " ", $vqrange], _
		[4163, 4047, " ", $vqrange], _
		[3096, 4610, " ", $vqrange], _
		[2014, 4137, " ", $vqrange], _
		[2698, 4775, " ", $vqrange], _
		[4167, 4276, " ", $vqrange], _
		[4026, 2437, " ", $vqrange], _
		[5439, 1632, " ", $vqrange], _
		[2888, 2003, " ", $vqrange], _
		[497, 1090, " ", $vqrange], _
		[-1980, 570, " ", $vqrange], _
		[-3972, -1091, " ", $vqrange], _
		[-4505, 1454, " ", $vqrange], _
		[-6770, 2647, " ", $vqrange], _
		[-9336, 2903, " ", $vqrange], _
		[-8731, 819, " ", $vqrange], _
		[-10118, -1298, " ", $vqrange], _
		[-8712, 819, " ", $vqrange], _
		[-6926, 2618, " ", $vqrange], _
		[-5334, 4616, " ", $vqrange], _
		[-3628, 6459, " ", $vqrange], _
		[-3354, 7210, " ", $vqrange], _
		[-5506, 7138, " ", $vqrange], _
		[-7995, 6568, " ", $vqrange], _
		[-10518, 6320, " ", $vqrange], _
		[-10752, 8253, " ", $vqrange], _
		[-9682, 10570, " ", $vqrange], _
		[-8041, 12575, " ", $vqrange], _
		[-6454, 14639, " ", $vqrange], _
		[-7477, 16938, " ", $vqrange], _
		[-5069, 17665, " ", $vqrange], _
		[-4785, 15174, " ", $vqrange], _
		[-4439, 12625, " ", $vqrange], _
		[-2970, 14701, " ", $vqrange], _
		[-3530, 17244, " ", $vqrange], _
		[-4572, 19520, " ", $vqrange], _
		[-3122, 21631, " ", $vqrange], _
		[-2199, 24018, " ", $vqrange], _
		[-3863, 22064, " ", $vqrange], _
		[-6212, 21069, " ", $vqrange], _
		[-8736, 21207, " ", $vqrange], _
		[-7101, 23164, " ", $vqrange], _
		[-5152, 24855, " ", $vqrange], _
		[-3398, 26742, " ", $vqrange], _
		[-2025, 28859, " ", $vqrange], _
		[-829, 26630, " ", $vqrange], _
		[-3257, 26009, " ", $vqrange], _
		[-5629, 25218, " ", $vqrange], _
		[-8217, 25097, " ", $vqrange], _
		[-9777, 27060, " ", $vqrange], _
		[-10044, 29609, " ", $vqrange], _
		[-9064, 31789, " ", $vqrange], _
		[-9936, 27589, " ", $vqrange], _
		[-8066, 25775, " ", $vqrange], _
		[-5793, 24641, " ", $vqrange], _
		[-3932, 26416, " ", $vqrange], _
		[-2526, 28525, " ", $vqrange], _
		[-3952, 30639, " ", $vqrange], _
		[-2518, 31511, " ", $vqrange], _
		[-73, 32043, " ", $vqrange], _
		[2464, 31784, " ", $vqrange], _
		[1868, 29350, " ", $vqrange], _
		[629, 27067, " ", $vqrange], _
		[2898, 25870, " ", $vqrange], _
		[4374, 27992, " ", $vqrange], _
		[4696, 30550, " ", $vqrange], _
		[4160, 33082, " ", $vqrange], _
		[6303, 34560, " ", $vqrange], _
		[8156, 32784, " ", $vqrange], _
		[9912, 30949, " ", $vqrange], _
		[8721, 32544, " ", $vqrange], _
		[7412, 34717, " ", $vqrange], _
		[4797, 34587, " ", $vqrange], _
		[3790, 32235, " ", $vqrange], _
		[5827, 30714, " ", $vqrange], _
		[5830, 33262, " ", $vqrange], _
		[4148, 31403, " ", $vqrange], _
		[3715, 33926, " ", $vqrange], _
		[1331, 34818, " ", $vqrange], _
		[-1247, 34833, " ", $vqrange], _
		[-3767, 34937, " ", $vqrange], _
		[-5849, 33395, " ", $vqrange], _
		[-8258, 32467, " ", $vqrange]]



	MoveandAggroVQFullRoute($aWaypoints)

EndFunc
