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






	If GetAreaVanquished() = False Then AggroMoveTo(-8678, -34615)
	If GetAreaVanquished() = False Then AggroMoveTo(-9985, -33718)
	If GetAreaVanquished() = False Then AggroMoveTo(-7673, -32562)
	If GetAreaVanquished() = False Then AggroMoveTo(-5422, -31422)
	If GetAreaVanquished() = False Then AggroMoveTo(-4344, -29153)
	If GetAreaVanquished() = False Then AggroMoveTo(-2605, -30941)
	If GetAreaVanquished() = False Then AggroMoveTo(-397, -29652)
	If GetAreaVanquished() = False Then AggroMoveTo(2110, -29601)
	If GetAreaVanquished() = False Then AggroMoveTo(4702, -29426)
	If GetAreaVanquished() = False Then AggroMoveTo(6915, -28227)
	If GetAreaVanquished() = False Then AggroMoveTo(6865, -28710)
	If GetAreaVanquished() = False Then AggroMoveTo(4455, -29474)
	If GetAreaVanquished() = False Then AggroMoveTo(1864, -29634)
	If GetAreaVanquished() = False Then AggroMoveTo(-636, -29663)
	If GetAreaVanquished() = False Then AggroMoveTo(-9672, 31228)
	If GetAreaVanquished() = False Then AggroMoveTo(-7379, 32291)
	If GetAreaVanquished() = False Then AggroMoveTo(-4827, 32671)
	If GetAreaVanquished() = False Then AggroMoveTo(-4078, -28263)
	If GetAreaVanquished() = False Then AggroMoveTo(-6681, -28301)
	If GetAreaVanquished() = False Then AggroMoveTo(-9072, -27376)
	If GetAreaVanquished() = False Then AggroMoveTo(-7812, -27891)
	If GetAreaVanquished() = False Then AggroMoveTo(-5246, -27748)
	If GetAreaVanquished() = False Then AggroMoveTo(-4252, -25329)
	If GetAreaVanquished() = False Then AggroMoveTo(-3251, -22938)
	If GetAreaVanquished() = False Then AggroMoveTo(-1974, -23598)
	If GetAreaVanquished() = False Then AggroMoveTo(44, -25132)
	If GetAreaVanquished() = False Then AggroMoveTo(2297, -23878)
	If GetAreaVanquished() = False Then AggroMoveTo(4706, -23120)
	If GetAreaVanquished() = False Then AggroMoveTo(3316, -20954)
	If GetAreaVanquished() = False Then AggroMoveTo(2010, -18770)
	If GetAreaVanquished() = False Then AggroMoveTo(-23, -17151)
	If GetAreaVanquished() = False Then AggroMoveTo(-2081, -15588)
	If GetAreaVanquished() = False Then AggroMoveTo(-4577, -14987)
	If GetAreaVanquished() = False Then AggroMoveTo(-6783, -13614)
	If GetAreaVanquished() = False Then AggroMoveTo(-8080, -11419)
	If GetAreaVanquished() = False Then AggroMoveTo(-8661, -8921)
	If GetAreaVanquished() = False Then AggroMoveTo(-6404, -7842)
	If GetAreaVanquished() = False Then AggroMoveTo(-3819, -7663)
	If GetAreaVanquished() = False Then AggroMoveTo(-1229, -7663)
	If GetAreaVanquished() = False Then AggroMoveTo(1321, -7725)
	If GetAreaVanquished() = False Then AggroMoveTo(-1205, -7749)
	If GetAreaVanquished() = False Then AggroMoveTo(-3719, -7417)
	If GetAreaVanquished() = False Then AggroMoveTo(-6258, -7042)
	If GetAreaVanquished() = False Then AggroMoveTo(-8423, -8389)
	If GetAreaVanquished() = False Then AggroMoveTo(-9507, -10742)
	If GetAreaVanquished() = False Then AggroMoveTo(-8409, -12527)
	If GetAreaVanquished() = False Then AggroMoveTo(-6494, -14292)
	If GetAreaVanquished() = False Then AggroMoveTo(-4460, -15773)
	If GetAreaVanquished() = False Then AggroMoveTo(-3775, -18251)
	If GetAreaVanquished() = False Then AggroMoveTo(-3423, -17799)
	If GetAreaVanquished() = False Then AggroMoveTo(-1144, -16540)
	If GetAreaVanquished() = False Then AggroMoveTo(770, -18156)
	If GetAreaVanquished() = False Then AggroMoveTo(2942, -19470)
	If GetAreaVanquished() = False Then AggroMoveTo(5346, -18715)
	If GetAreaVanquished() = False Then AggroMoveTo(7680, -19872)
	If GetAreaVanquished() = False Then AggroMoveTo(8312, -17447)
	If GetAreaVanquished() = False Then AggroMoveTo(9523, -15199)
	If GetAreaVanquished() = False Then AggroMoveTo(9273, -12685)
	If GetAreaVanquished() = False Then AggroMoveTo(7723, -10660)
	If GetAreaVanquished() = False Then AggroMoveTo(9884, -9189)
	If GetAreaVanquished() = False Then AggroMoveTo(9221, -7784)
	If GetAreaVanquished() = False Then AggroMoveTo(7653, -5816)
	If GetAreaVanquished() = False Then AggroMoveTo(9626, -6211)
	If GetAreaVanquished() = False Then AggroMoveTo(9858, -4497)
	If GetAreaVanquished() = False Then AggroMoveTo(9288, -2052)
	If GetAreaVanquished() = False Then AggroMoveTo(9125, 450)
	If GetAreaVanquished() = False Then AggroMoveTo(9580, 3002)
	If GetAreaVanquished() = False Then AggroMoveTo(10720, 5312)
	If GetAreaVanquished() = False Then AggroMoveTo(9301, 5430)
	If GetAreaVanquished() = False Then AggroMoveTo(8171, 6239)
	If GetAreaVanquished() = False Then AggroMoveTo(6286, 4522)
	If GetAreaVanquished() = False Then AggroMoveTo(6319, 2632)
	If GetAreaVanquished() = False Then AggroMoveTo(4572, 835)
	If GetAreaVanquished() = False Then AggroMoveTo(2537, -630)
	If GetAreaVanquished() = False Then AggroMoveTo(2094, -3181)
	If GetAreaVanquished() = False Then AggroMoveTo(3234, -5519)
	If GetAreaVanquished() = False Then AggroMoveTo(3053, -4690)
	If GetAreaVanquished() = False Then AggroMoveTo(2038, -3272)
	If GetAreaVanquished() = False Then AggroMoveTo(2387, -707)
	If GetAreaVanquished() = False Then AggroMoveTo(3794, 1464)
	If GetAreaVanquished() = False Then AggroMoveTo(4163, 4047)
	If GetAreaVanquished() = False Then AggroMoveTo(3096, 4610)
	If GetAreaVanquished() = False Then AggroMoveTo(2014, 4137)
	If GetAreaVanquished() = False Then AggroMoveTo(2698, 4775)
	If GetAreaVanquished() = False Then AggroMoveTo(4167, 4276)
	If GetAreaVanquished() = False Then AggroMoveTo(4026, 2437)
	If GetAreaVanquished() = False Then AggroMoveTo(5439, 1632)
	If GetAreaVanquished() = False Then AggroMoveTo(2888, 2003)
	If GetAreaVanquished() = False Then AggroMoveTo(497, 1090)
	If GetAreaVanquished() = False Then AggroMoveTo(-1980, 570)
	If GetAreaVanquished() = False Then AggroMoveTo(-3972, -1091)
	If GetAreaVanquished() = False Then AggroMoveTo(-4505, 1454)
	If GetAreaVanquished() = False Then AggroMoveTo(-6770, 2647)
	If GetAreaVanquished() = False Then AggroMoveTo(-9336, 2903)
	If GetAreaVanquished() = False Then AggroMoveTo(-8731, 819)
	If GetAreaVanquished() = False Then AggroMoveTo(-10118, -1298)
	If GetAreaVanquished() = False Then AggroMoveTo(-8712, 819)
	If GetAreaVanquished() = False Then AggroMoveTo(-6926, 2618)
	If GetAreaVanquished() = False Then AggroMoveTo(-5334, 4616)
	If GetAreaVanquished() = False Then AggroMoveTo(-3628, 6459)
	If GetAreaVanquished() = False Then AggroMoveTo(-3354, 7210)
	If GetAreaVanquished() = False Then AggroMoveTo(-5506, 7138)
	If GetAreaVanquished() = False Then AggroMoveTo(-7995, 6568)
	If GetAreaVanquished() = False Then AggroMoveTo(-10518, 6320)
	If GetAreaVanquished() = False Then AggroMoveTo(-10752, 8253)
	If GetAreaVanquished() = False Then AggroMoveTo(-9682, 10570)
	If GetAreaVanquished() = False Then AggroMoveTo(-8041, 12575)
	If GetAreaVanquished() = False Then AggroMoveTo(-6454, 14639)
	If GetAreaVanquished() = False Then AggroMoveTo(-7477, 16938)
	If GetAreaVanquished() = False Then AggroMoveTo(-5069, 17665)
	If GetAreaVanquished() = False Then AggroMoveTo(-4785, 15174)
	If GetAreaVanquished() = False Then AggroMoveTo(-4439, 12625)
	If GetAreaVanquished() = False Then AggroMoveTo(-2970, 14701)
	If GetAreaVanquished() = False Then AggroMoveTo(-3530, 17244)
	If GetAreaVanquished() = False Then AggroMoveTo(-4572, 19520)
	If GetAreaVanquished() = False Then AggroMoveTo(-3122, 21631)
	If GetAreaVanquished() = False Then AggroMoveTo(-2199, 24018)
	If GetAreaVanquished() = False Then AggroMoveTo(-3863, 22064)
	If GetAreaVanquished() = False Then AggroMoveTo(-6212, 21069)
	If GetAreaVanquished() = False Then AggroMoveTo(-8736, 21207)
	If GetAreaVanquished() = False Then AggroMoveTo(-7101, 23164)
	If GetAreaVanquished() = False Then AggroMoveTo(-5152, 24855)
	If GetAreaVanquished() = False Then AggroMoveTo(-3398, 26742)
	If GetAreaVanquished() = False Then AggroMoveTo(-2025, 28859)
	If GetAreaVanquished() = False Then AggroMoveTo(-829, 26630)
	If GetAreaVanquished() = False Then AggroMoveTo(-3257, 26009)
	If GetAreaVanquished() = False Then AggroMoveTo(-5629, 25218)
	If GetAreaVanquished() = False Then AggroMoveTo(-8217, 25097)
	If GetAreaVanquished() = False Then AggroMoveTo(-9777, 27060)
	If GetAreaVanquished() = False Then AggroMoveTo(-10044, 29609)
	If GetAreaVanquished() = False Then AggroMoveTo(-9064, 31789)
	If GetAreaVanquished() = False Then AggroMoveTo(-9936, 27589)
	If GetAreaVanquished() = False Then AggroMoveTo(-8066, 25775)
	If GetAreaVanquished() = False Then AggroMoveTo(-5793, 24641)
	If GetAreaVanquished() = False Then AggroMoveTo(-3932, 26416)
	If GetAreaVanquished() = False Then AggroMoveTo(-2526, 28525)
	If GetAreaVanquished() = False Then AggroMoveTo(-3952, 30639)
	If GetAreaVanquished() = False Then AggroMoveTo(-2518, 31511)
	If GetAreaVanquished() = False Then AggroMoveTo(-73, 32043)
	If GetAreaVanquished() = False Then AggroMoveTo(2464, 31784)
	If GetAreaVanquished() = False Then AggroMoveTo(1868, 29350)
	If GetAreaVanquished() = False Then AggroMoveTo(629, 27067)
	If GetAreaVanquished() = False Then AggroMoveTo(2898, 25870)
	If GetAreaVanquished() = False Then AggroMoveTo(4374, 27992)
	If GetAreaVanquished() = False Then AggroMoveTo(4696, 30550)
	If GetAreaVanquished() = False Then AggroMoveTo(4160, 33082)
	If GetAreaVanquished() = False Then AggroMoveTo(6303, 34560)
	If GetAreaVanquished() = False Then AggroMoveTo(8156, 32784)
	If GetAreaVanquished() = False Then AggroMoveTo(9912, 30949)
	If GetAreaVanquished() = False Then AggroMoveTo(8721, 32544)
	If GetAreaVanquished() = False Then AggroMoveTo(7412, 34717)
	If GetAreaVanquished() = False Then AggroMoveTo(4797, 34587)
	If GetAreaVanquished() = False Then AggroMoveTo(3790, 32235)
	If GetAreaVanquished() = False Then AggroMoveTo(5827, 30714)
	If GetAreaVanquished() = False Then AggroMoveTo(5830, 33262)
	If GetAreaVanquished() = False Then AggroMoveTo(4148, 31403)
	If GetAreaVanquished() = False Then AggroMoveTo(3715, 33926)
	If GetAreaVanquished() = False Then AggroMoveTo(1331, 34818)
	If GetAreaVanquished() = False Then AggroMoveTo(-1247, 34833)
	If GetAreaVanquished() = False Then AggroMoveTo(-3767, 34937)
	If GetAreaVanquished() = False Then AggroMoveTo(-5849, 33395)
	If GetAreaVanquished() = False Then AggroMoveTo(-8258, 32467)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-8258, 32467)
	If GetAreaVanquished() = False Then AggroMoveTo(-5849, 33395)
	If GetAreaVanquished() = False Then AggroMoveTo(-3767, 34937)
	If GetAreaVanquished() = False Then AggroMoveTo(-1247, 34833)
	If GetAreaVanquished() = False Then AggroMoveTo(1331, 34818)
	If GetAreaVanquished() = False Then AggroMoveTo(3715, 33926)
	If GetAreaVanquished() = False Then AggroMoveTo(4148, 31403)
	If GetAreaVanquished() = False Then AggroMoveTo(5830, 33262)
	If GetAreaVanquished() = False Then AggroMoveTo(5827, 30714)
	If GetAreaVanquished() = False Then AggroMoveTo(3790, 32235)
	If GetAreaVanquished() = False Then AggroMoveTo(4797, 34587)
	If GetAreaVanquished() = False Then AggroMoveTo(7412, 34717)
	If GetAreaVanquished() = False Then AggroMoveTo(8721, 32544)
	If GetAreaVanquished() = False Then AggroMoveTo(9912, 30949)
	If GetAreaVanquished() = False Then AggroMoveTo(8156, 32784)
	If GetAreaVanquished() = False Then AggroMoveTo(6303, 34560)
	If GetAreaVanquished() = False Then AggroMoveTo(4160, 33082)
	If GetAreaVanquished() = False Then AggroMoveTo(4696, 30550)
	If GetAreaVanquished() = False Then AggroMoveTo(4374, 27992)
	If GetAreaVanquished() = False Then AggroMoveTo(2898, 25870)
	If GetAreaVanquished() = False Then AggroMoveTo(629, 27067)
	If GetAreaVanquished() = False Then AggroMoveTo(1868, 29350)
	If GetAreaVanquished() = False Then AggroMoveTo(2464, 31784)
	If GetAreaVanquished() = False Then AggroMoveTo(-73, 32043)
	If GetAreaVanquished() = False Then AggroMoveTo(-2518, 31511)
	If GetAreaVanquished() = False Then AggroMoveTo(-3952, 30639)
	If GetAreaVanquished() = False Then AggroMoveTo(-2526, 28525)
	If GetAreaVanquished() = False Then AggroMoveTo(-3932, 26416)
	If GetAreaVanquished() = False Then AggroMoveTo(-5793, 24641)
	If GetAreaVanquished() = False Then AggroMoveTo(-8066, 25775)
	If GetAreaVanquished() = False Then AggroMoveTo(-9936, 27589)
	If GetAreaVanquished() = False Then AggroMoveTo(-9064, 31789)
	If GetAreaVanquished() = False Then AggroMoveTo(-10044, 29609)
	If GetAreaVanquished() = False Then AggroMoveTo(-9777, 27060)
	If GetAreaVanquished() = False Then AggroMoveTo(-8217, 25097)
	If GetAreaVanquished() = False Then AggroMoveTo(-5629, 25218)
	If GetAreaVanquished() = False Then AggroMoveTo(-3257, 26009)
	If GetAreaVanquished() = False Then AggroMoveTo(-829, 26630)
	If GetAreaVanquished() = False Then AggroMoveTo(-2025, 28859)
	If GetAreaVanquished() = False Then AggroMoveTo(-3398, 26742)
	If GetAreaVanquished() = False Then AggroMoveTo(-5152, 24855)
	If GetAreaVanquished() = False Then AggroMoveTo(-7101, 23164)
	If GetAreaVanquished() = False Then AggroMoveTo(-8736, 21207)
	If GetAreaVanquished() = False Then AggroMoveTo(-6212, 21069)
	If GetAreaVanquished() = False Then AggroMoveTo(-3863, 22064)
	If GetAreaVanquished() = False Then AggroMoveTo(-2199, 24018)
	If GetAreaVanquished() = False Then AggroMoveTo(-3122, 21631)
	If GetAreaVanquished() = False Then AggroMoveTo(-4572, 19520)
	If GetAreaVanquished() = False Then AggroMoveTo(-3530, 17244)
	If GetAreaVanquished() = False Then AggroMoveTo(-2970, 14701)
	If GetAreaVanquished() = False Then AggroMoveTo(-4439, 12625)
	If GetAreaVanquished() = False Then AggroMoveTo(-4785, 15174)
	If GetAreaVanquished() = False Then AggroMoveTo(-5069, 17665)
	If GetAreaVanquished() = False Then AggroMoveTo(-7477, 16938)
	If GetAreaVanquished() = False Then AggroMoveTo(-6454, 14639)
	If GetAreaVanquished() = False Then AggroMoveTo(-8041, 12575)
	If GetAreaVanquished() = False Then AggroMoveTo(-9682, 10570)
	If GetAreaVanquished() = False Then AggroMoveTo(-10752, 8253)
	If GetAreaVanquished() = False Then AggroMoveTo(-10518, 6320)
	If GetAreaVanquished() = False Then AggroMoveTo(-7995, 6568)
	If GetAreaVanquished() = False Then AggroMoveTo(-5506, 7138)
	If GetAreaVanquished() = False Then AggroMoveTo(-3354, 7210)
	If GetAreaVanquished() = False Then AggroMoveTo(-3628, 6459)
	If GetAreaVanquished() = False Then AggroMoveTo(-5334, 4616)
	If GetAreaVanquished() = False Then AggroMoveTo(-6926, 2618)
	If GetAreaVanquished() = False Then AggroMoveTo(-8712, 819)
	If GetAreaVanquished() = False Then AggroMoveTo(-10118, -1298)
	If GetAreaVanquished() = False Then AggroMoveTo(-8731, 819)
	If GetAreaVanquished() = False Then AggroMoveTo(-9336, 2903)
	If GetAreaVanquished() = False Then AggroMoveTo(-6770, 2647)
	If GetAreaVanquished() = False Then AggroMoveTo(-4505, 1454)
	If GetAreaVanquished() = False Then AggroMoveTo(-3972, -1091)
	If GetAreaVanquished() = False Then AggroMoveTo(-1980, 570)
	If GetAreaVanquished() = False Then AggroMoveTo(497, 1090)
	If GetAreaVanquished() = False Then AggroMoveTo(2888, 2003)
	If GetAreaVanquished() = False Then AggroMoveTo(5439, 1632)
	If GetAreaVanquished() = False Then AggroMoveTo(4026, 2437)
	If GetAreaVanquished() = False Then AggroMoveTo(4167, 4276)
	If GetAreaVanquished() = False Then AggroMoveTo(2698, 4775)
	If GetAreaVanquished() = False Then AggroMoveTo(2014, 4137)
	If GetAreaVanquished() = False Then AggroMoveTo(3096, 4610)
	If GetAreaVanquished() = False Then AggroMoveTo(4163, 4047)
	If GetAreaVanquished() = False Then AggroMoveTo(3794, 1464)
	If GetAreaVanquished() = False Then AggroMoveTo(2387, -707)
	If GetAreaVanquished() = False Then AggroMoveTo(2038, -3272)
	If GetAreaVanquished() = False Then AggroMoveTo(3053, -4690)
	If GetAreaVanquished() = False Then AggroMoveTo(3234, -5519)
	If GetAreaVanquished() = False Then AggroMoveTo(2094, -3181)
	If GetAreaVanquished() = False Then AggroMoveTo(2537, -630)
	If GetAreaVanquished() = False Then AggroMoveTo(4572, 835)
	If GetAreaVanquished() = False Then AggroMoveTo(6319, 2632)
	If GetAreaVanquished() = False Then AggroMoveTo(6286, 4522)
	If GetAreaVanquished() = False Then AggroMoveTo(8171, 6239)
	If GetAreaVanquished() = False Then AggroMoveTo(9301, 5430)
	If GetAreaVanquished() = False Then AggroMoveTo(10720, 5312)
	If GetAreaVanquished() = False Then AggroMoveTo(9580, 3002)
	If GetAreaVanquished() = False Then AggroMoveTo(9125, 450)
	If GetAreaVanquished() = False Then AggroMoveTo(9288, -2052)
	If GetAreaVanquished() = False Then AggroMoveTo(9858, -4497)
	If GetAreaVanquished() = False Then AggroMoveTo(9626, -6211)
	If GetAreaVanquished() = False Then AggroMoveTo(7653, -5816)
	If GetAreaVanquished() = False Then AggroMoveTo(9221, -7784)
	If GetAreaVanquished() = False Then AggroMoveTo(9884, -9189)
	If GetAreaVanquished() = False Then AggroMoveTo(7723, -10660)
	If GetAreaVanquished() = False Then AggroMoveTo(9273, -12685)
	If GetAreaVanquished() = False Then AggroMoveTo(9523, -15199)
	If GetAreaVanquished() = False Then AggroMoveTo(8312, -17447)
	If GetAreaVanquished() = False Then AggroMoveTo(7680, -19872)
	If GetAreaVanquished() = False Then AggroMoveTo(5346, -18715)
	If GetAreaVanquished() = False Then AggroMoveTo(2942, -19470)
	If GetAreaVanquished() = False Then AggroMoveTo(770, -18156)
	If GetAreaVanquished() = False Then AggroMoveTo(-1144, -16540)
	If GetAreaVanquished() = False Then AggroMoveTo(-3423, -17799)
	If GetAreaVanquished() = False Then AggroMoveTo(-3775, -18251)
	If GetAreaVanquished() = False Then AggroMoveTo(-4460, -15773)
	If GetAreaVanquished() = False Then AggroMoveTo(-6494, -14292)
	If GetAreaVanquished() = False Then AggroMoveTo(-8409, -12527)
	If GetAreaVanquished() = False Then AggroMoveTo(-9507, -10742)
	If GetAreaVanquished() = False Then AggroMoveTo(-8423, -8389)
	If GetAreaVanquished() = False Then AggroMoveTo(-6258, -7042)
	If GetAreaVanquished() = False Then AggroMoveTo(-3719, -7417)
	If GetAreaVanquished() = False Then AggroMoveTo(-1205, -7749)
	If GetAreaVanquished() = False Then AggroMoveTo(1321, -7725)
	If GetAreaVanquished() = False Then AggroMoveTo(-1229, -7663)
	If GetAreaVanquished() = False Then AggroMoveTo(-3819, -7663)
	If GetAreaVanquished() = False Then AggroMoveTo(-6404, -7842)
	If GetAreaVanquished() = False Then AggroMoveTo(-8661, -8921)
	If GetAreaVanquished() = False Then AggroMoveTo(-8080, -11419)
	If GetAreaVanquished() = False Then AggroMoveTo(-6783, -13614)
	If GetAreaVanquished() = False Then AggroMoveTo(-4577, -14987)
	If GetAreaVanquished() = False Then AggroMoveTo(-2081, -15588)
	If GetAreaVanquished() = False Then AggroMoveTo(-23, -17151)
	If GetAreaVanquished() = False Then AggroMoveTo(2010, -18770)
	If GetAreaVanquished() = False Then AggroMoveTo(3316, -20954)
	If GetAreaVanquished() = False Then AggroMoveTo(4706, -23120)
	If GetAreaVanquished() = False Then AggroMoveTo(2297, -23878)
	If GetAreaVanquished() = False Then AggroMoveTo(44, -25132)
	If GetAreaVanquished() = False Then AggroMoveTo(-1974, -23598)
	If GetAreaVanquished() = False Then AggroMoveTo(-3251, -22938)
	If GetAreaVanquished() = False Then AggroMoveTo(-4252, -25329)
	If GetAreaVanquished() = False Then AggroMoveTo(-5246, -27748)
	If GetAreaVanquished() = False Then AggroMoveTo(-7812, -27891)
	If GetAreaVanquished() = False Then AggroMoveTo(-9072, -27376)
	If GetAreaVanquished() = False Then AggroMoveTo(-6681, -28301)
	If GetAreaVanquished() = False Then AggroMoveTo(-4078, -28263)
	If GetAreaVanquished() = False Then AggroMoveTo(-4827, 32671)
	If GetAreaVanquished() = False Then AggroMoveTo(-7379, 32291)
	If GetAreaVanquished() = False Then AggroMoveTo(-9672, 31228)
	If GetAreaVanquished() = False Then AggroMoveTo(-636, -29663)
	If GetAreaVanquished() = False Then AggroMoveTo(1864, -29634)
	If GetAreaVanquished() = False Then AggroMoveTo(4455, -29474)
	If GetAreaVanquished() = False Then AggroMoveTo(6865, -28710)
	If GetAreaVanquished() = False Then AggroMoveTo(6915, -28227)
	If GetAreaVanquished() = False Then AggroMoveTo(4702, -29426)
	If GetAreaVanquished() = False Then AggroMoveTo(2110, -29601)
	If GetAreaVanquished() = False Then AggroMoveTo(-397, -29652)
	If GetAreaVanquished() = False Then AggroMoveTo(-2605, -30941)
	If GetAreaVanquished() = False Then AggroMoveTo(-4344, -29153)
	If GetAreaVanquished() = False Then AggroMoveTo(-5422, -31422)
	If GetAreaVanquished() = False Then AggroMoveTo(-7673, -32562)
	If GetAreaVanquished() = False Then AggroMoveTo(-9985, -33718)
	If GetAreaVanquished() = False Then AggroMoveTo(-8678, -34615)

EndFunc
