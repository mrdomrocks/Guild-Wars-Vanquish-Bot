#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aSkywardReachOutpostPath[2][2] = [ _
	[-15225.14, 1966.78], _
	[-15233.08, 2352.49] _
]

Func GoOutSkywardReach()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $SkywardReach_Map Then Return

	If $l_i_Map = $SkywardReach_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> SkywardReach (portal 1)")
		_Vanquisher_RunAggroPortalPath($aSkywardReachOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQSkywardReach()
	If GetMapID() <> $SkywardReach_Map And GetMapID() <> $SkywardReach_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SkywardReach.")
		TravelTo($SkywardReach_Outpost)
	EndIf

	If GetMapID() = $SkywardReach_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutSkywardReach()
		If GetMapID() <> $SkywardReach_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SkywardReach (" & $SkywardReach_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $SkywardReach_Map Then
		CurrentAction("SkywardReach route waiting - on map " & GetMapID() & ", need " & $SkywardReach_Map & ".")
		Return
	EndIf

	CurrentAction("Starting SkywardReach vanquish route.")

	Local $aWaypoints[111][4] = [ _
		[-15191, 4871, " ", $vqrange], _
		[-11639, 7080, " ", $vqrange], _
		[-8429, 5472, " ", $vqrange], _
		[-9518, 8419, " ", $vqrange], _
		[-12374, 10226, " ", $vqrange], _
		[-14750, 12280, " ", $vqrange], _
		[-14411, 12922, " ", $vqrange], _
		[-15727, 11206, " ", $vqrange], _
		[-17749, 12765, " ", $vqrange], _
		[-17182, 13326, " ", $vqrange], _
		[-16926, 14342, " ", $vqrange], _
		[-10674, 10747, " ", $vqrange], _
		[-8299, 14410, " ", $vqrange], _
		[-9291, 12029, " ", $vqrange], _
		[-5667, 9437, " ", $vqrange], _
		[-982, 10134, " ", $vqrange], _
		[-283, 11869, " ", $vqrange], _
		[-1568, 14217, " ", $vqrange], _
		[342, 12040, " ", $vqrange], _
		[433, 11353, " ", $vqrange], _
		[3031, 10509, " ", $vqrange], _
		[5519, 8889, " ", $vqrange], _
		[7195, 7857, " ", $vqrange], _
		[9885, 8366, " ", $vqrange], _
		[10380, 9673, " ", $vqrange], _
		[8923, 11306, " ", $vqrange], _
		[5412, 14465, " ", $vqrange], _
		[2389, 18690, " ", $vqrange], _
		[-557, 20848, " ", $vqrange], _
		[-3352, 21043, " ", $vqrange], _
		[-5655, 19338, " ", $vqrange], _
		[-2776, 20362, " ", $vqrange], _
		[-939, 16508, " ", $vqrange], _
		[-1912, 18202, " ", $vqrange], _
		[-669, 20928, " ", $vqrange], _
		[2467, 15667, " ", $vqrange], _
		[9153, 14450, " ", $vqrange], _
		[10123, 17138, " ", $vqrange], _
		[8037, 17925, " ", $vqrange], _
		[5321, 18406, " ", $vqrange], _
		[10127, 16518, " ", $vqrange], _
		[9029, 14355, " ", $vqrange], _
		[11758, 13465, " ", $vqrange], _
		[14964, 15994, " ", $vqrange], _
		[17333, 18847, " ", $vqrange], _
		[15552, 16696, " ", $vqrange], _
		[13983, 14148, " ", $vqrange], _
		[12232, 10248, " ", $vqrange], _
		[14158, 11219, " ", $vqrange], _
		[12956, 10520, " ", $vqrange], _
		[13635, 8389, " ", $vqrange], _
		[11427, 4186, " ", $vqrange], _
		[9782, 5936, " ", $vqrange], _
		[8827, 7900, " ", $vqrange], _
		[5138, 7110, " ", $vqrange], _
		[-6355, 7333, " ", $vqrange], _
		[-4905, 2378, " ", $vqrange], _
		[-8487, 4390, " ", $vqrange], _
		[-12199, -41, " ", $vqrange], _
		[-9621, -3665, " ", $vqrange], _
		[-7158, -4978, " ", $vqrange], _
		[-4351, -6146, " ", $vqrange], _
		[-2669, -5393, " ", $vqrange], _
		[-6294, -4872, " ", $vqrange], _
		[-6502, -2725, " ", $vqrange], _
		[-11422, -4502, " ", $vqrange], _
		[-15696, -5190, " ", $vqrange], _
		[-16995, -9056, " ", $vqrange], _
		[-17545, -15640, " ", $vqrange], _
		[-18263, -17692, " ", $vqrange], _
		[-18983, -15644, " ", $vqrange], _
		[-16845, -8535, " ", $vqrange], _
		[-13428, -5016, " ", $vqrange], _
		[-7055, -9455, " ", $vqrange], _
		[-1432, -11848, " ", $vqrange], _
		[-2198, -15127, " ", $vqrange], _
		[-10117, -15331, " ", $vqrange], _
		[-10921, -13788, " ", $vqrange], _
		[-9054, -12066, " ", $vqrange], _
		[-10936, -14009, " ", $vqrange], _
		[-10174, -15680, " ", $vqrange], _
		[-11936, -17746, " ", $vqrange], _
		[-10158, -15564, " ", $vqrange], _
		[-7609, -16410, " ", $vqrange], _
		[-6760, -15236, " ", $vqrange], _
		[-3101, -16844, " ", $vqrange], _
		[979, -16676, " ", $vqrange], _
		[2846, -18654, " ", $vqrange], _
		[6021, -17620, " ", $vqrange], _
		[3383, -16966, " ", $vqrange], _
		[3212, -15295, " ", $vqrange], _
		[7373, -13242, " ", $vqrange], _
		[10514, -12191, " ", $vqrange], _
		[13664, -13939, " ", $vqrange], _
		[14443, -15191, " ", $vqrange], _
		[12235, -15599, " ", $vqrange], _
		[11324, -14427, " ", $vqrange], _
		[10493, -11449, " ", $vqrange], _
		[11398, -6452, " ", $vqrange], _
		[14128, -6045, " ", $vqrange], _
		[13441, -2767, " ", $vqrange], _
		[14078, -6111, " ", $vqrange], _
		[9622, -6279, " ", $vqrange], _
		[9493, -8571, " ", $vqrange], _
		[5079, -8046, " ", $vqrange], _
		[6073, -10496, " ", $vqrange], _
		[4114, -12257, " ", $vqrange], _
		[3697, -8433, " ", $vqrange], _
		[-1483, -7568, " ", $vqrange], _
		[119, -10325, " ", $vqrange], _
		[1093, -13987, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

