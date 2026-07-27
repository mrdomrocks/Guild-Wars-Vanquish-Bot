;Mapped from route notes
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aCrystalOverlookOutpostPath[1][2] = [ _
	[-4454, -6313] _
]

Global $aCrystalOverlookTransitPathA[4][2] = [ _
	[-5086, -6608], _
	[-7402, -5641], _
	[0, 0], _
	[-2041, -3468] _
]

Global $aCrystalOverlookTransitPathB[8][2] = [ _
	[-5217, -6706], _
	[-7347, -5330], _
	[-8751, -3218], _
	[-11362, -3312], _
	[-13161, -1485], _
	[-15359, -224], _
	[-17327, 1473], _
	[-18421, 1661] _
]

Func GoOutCrystalOverlook()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $CrystalOverlook_Map Then Return

	If $l_i_Map = $CrystalOverlook_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> Crystal Overlook (portal)")
		_Vanquisher_RunAggroPortalPath($aCrystalOverlookOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $CrystalOverlook_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> Crystal Overlook (portal)")
		; Use the longer transit chain by default.
		_Vanquisher_RunAggroPortalPath($aCrystalOverlookTransitPathB, $vqrange, "transit ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQCrystalOverlook()
	If GetMapID() <> $CrystalOverlook_Map And GetMapID() <> $CrystalOverlook_Outpost And GetMapID() <> $CrystalOverlook_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Crystal Overlook.")
		TravelTo($CrystalOverlook_Outpost)
	EndIf

	If GetMapID() = $CrystalOverlook_Outpost Or GetMapID() = $CrystalOverlook_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCrystalOverlook()
		If GetMapID() <> $CrystalOverlook_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Crystal Overlook (" & $CrystalOverlook_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $CrystalOverlook_Map Then
		CurrentAction("Crystal Overlook route waiting - on map " & GetMapID() & ", need " & $CrystalOverlook_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Crystal Overlook vanquish route.")

	If GetAreaVanquished() = False Then AggroMoveTo(13262, 21107)
	If GetAreaVanquished() = False Then Sleep(7000)
	; shrine
	If GetAreaVanquished() = False Then AggroMoveTo(10987, 21836)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(13152, 23270)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(12906, 24978)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10300, 24829)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(7765, 24574)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(5952, 24672)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(6048, 24001)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(6642, 21496)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(8830, 20278)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(11390, 19900)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10779, 17440)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(9288, 15378)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(9132, 12862)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10575, 10810)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(11147, 8303)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(11570, 5811)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(13344, 4024)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(13048, 1515)
	If GetAreaVanquished() = False Then Sleep(7000)
	; shrine
	If GetAreaVanquished() = False Then AggroMoveTo(11211, -224)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(9377, 1476)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(7066, 2468)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(6952, 5020)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(9151, 6289)
	If GetAreaVanquished() = False Then Sleep(7000)
	; UseWormSpoor
	If GetAreaVanquished() = False Then AggroMoveTo(10518, 7595)
	If GetAreaVanquished() = False Then UseWormSpoor(10518, 7595)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10825, 5061)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(11641, 2668)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(12708, 343)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(13810, -1927)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(12417, -4136)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(13344, -6136)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(12415, -8496)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(9865, -8499)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(8644, -6232)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(7813, -3773)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(6694, -1517)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(6697, -4119)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(7074, -6648)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(8155, -8952)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(5641, -8799)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(3139, -8452)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(844, -7270)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(860, -9863)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(1986, -12220)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(4350, -11335)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(6847, -10876)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(9043, -9546)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10487, -7500)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10653, -10012)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(9407, -12308)
	If GetAreaVanquished() = False Then Sleep(7000)
	; UseWormSpoor
	If GetAreaVanquished() = False Then AggroMoveTo(8796, -13223)
	If GetAreaVanquished() = False Then UseWormSpoor(8796, -13223)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(7613, -15438)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(8409, -17864)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10543, -19318)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(12776, -20538)
	If GetAreaVanquished() = False Then Sleep(7000)
	; shrine
	If GetAreaVanquished() = False Then AggroMoveTo(12578, -21558)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(10010, -21349)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(7500, -21208)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(4976, -22026)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(2382, -22464)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(128, -23546)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-1345, -25603)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3379, -24109)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3246, -23603)
	If GetAreaVanquished() = False Then Sleep(7000)
	; shrine
	If GetAreaVanquished() = False Then AggroMoveTo(-3556, -23339)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-5682, -21823)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3656, -20299)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-1147, -20561)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(1380, -20665)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(3581, -19365)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(5498, -17706)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(6416, -15272)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(4376, -13700)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(1815, -13710)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-583, -14666)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-2945, -15777)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-5459, -16095)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-7979, -16190)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-9398, -14114)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-6843, -13609)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-4492, -12695)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-2317, -11413)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-2528, -8872)
	If GetAreaVanquished() = False Then Sleep(7000)
	; shrine
	If GetAreaVanquished() = False Then AggroMoveTo(-4453, -8829)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3921, -6281)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3312, -3813)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-1380, -2148)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-2823, -21)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-4123, -2217)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-5541, -4337)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-7191, -6386)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-7929, -8861)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-9677, -10795)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-11888, -9419)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-12948, -7150)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-12128, -4700)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-9948, -3386)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-10680, -867)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-12567, 870)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-12944, 3391)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-10482, 2850)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-8392, 1310)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-5805, 1417)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-4246, 3512)
	If GetAreaVanquished() = False Then Sleep(7000)
	; shrine
	If GetAreaVanquished() = False Then AggroMoveTo(-2889, 5121)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-5387, 5428)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3941, 7582)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-1581, 8472)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(314, 10158)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(2950, 10490)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(5425, 11284)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(2927, 11569)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(640, 10528)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-1186, 8807)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3156, 7259)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-4618, 9412)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-5568, 10656)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-3543, 9111)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-5514, 7507)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-7935, 6715)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-9768, 8477)
	If GetAreaVanquished() = False Then Sleep(7000)
	If GetAreaVanquished() = False Then AggroMoveTo(-11260, 10509)
	If GetAreaVanquished() = False Then Sleep(7000)
EndFunc