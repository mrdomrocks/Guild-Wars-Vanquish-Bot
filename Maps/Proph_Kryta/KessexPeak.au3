#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aKessexPeakOutpostPath[2][2] = [ _
	[-5199, 16327], _
	[-5252, 15997] _
]

Global $aKessexPeakTransitPath[12][2] = [ _
	[-5241, 15182], _
	[-6837, 11715], _
	[-7152, 7351], _
	[156, 2791], _
	[1680, 496], _
	[-3802, -4905], _
	[-5955, -9211], _
	[-753, -10986], _
	[7797, -13034], _
	[8548, -17166], _
	[7834, -18238], _
	[6093, -18015] _
]

Func GoOutKessexPeak()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $KessexPeak_Map Then Return

	If $l_i_Map = $KessexPeak_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> KessexPeak (portal 1)")
		_Vanquisher_RunAggroPortalPath($aKessexPeakOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $KessexPeak_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> KessexPeak (portal 2)")
		_Vanquisher_RunAggroPortalPath($aKessexPeakTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQKessexPeak()
	If GetMapID() <> $KessexPeak_Map And GetMapID() <> $KessexPeak_Outpost And GetMapID() <> $KessexPeak_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for KessexPeak.")
		TravelTo($KessexPeak_Outpost)
	EndIf

	If GetMapID() = $KessexPeak_Outpost Or GetMapID() = $KessexPeak_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutKessexPeak()
		If GetMapID() <> $KessexPeak_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need KessexPeak (" & $KessexPeak_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $KessexPeak_Map Then
		CurrentAction("KessexPeak route waiting - on map " & GetMapID() & ", need " & $KessexPeak_Map & ".")
		Return
	EndIf

	CurrentAction("Starting KessexPeak vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(8625, 21923)
	If GetAreaVanquished() = False Then AggroMoveTo(5919, 21200)
	If GetAreaVanquished() = False Then AggroMoveTo(6705, 14475)
	If GetAreaVanquished() = False Then AggroMoveTo(3860, 13340)
	If GetAreaVanquished() = False Then AggroMoveTo(2367, 10037)
	If GetAreaVanquished() = False Then AggroMoveTo(1853, 7655)
	If GetAreaVanquished() = False Then AggroMoveTo(1375, 4976)
	If GetAreaVanquished() = False Then AggroMoveTo(2700, 3089)
	If GetAreaVanquished() = False Then AggroMoveTo(264, 3406)
	If GetAreaVanquished() = False Then AggroMoveTo(-2823, 4276)
	If GetAreaVanquished() = False Then AggroMoveTo(-4595, 10987)
	If GetAreaVanquished() = False Then AggroMoveTo(-5643, 13409)
	If GetAreaVanquished() = False Then AggroMoveTo(-10953, 14977)
	If GetAreaVanquished() = False Then AggroMoveTo(-10974, 16060)
	If GetAreaVanquished() = False Then AggroMoveTo(-7982, 15702)
	If GetAreaVanquished() = False Then AggroMoveTo(-3496, 14288)
	If GetAreaVanquished() = False Then AggroMoveTo(-6478, 15542)
	If GetAreaVanquished() = False Then AggroMoveTo(-13533, 15707)
	If GetAreaVanquished() = False Then AggroMoveTo(-14716, 11271)
	If GetAreaVanquished() = False Then AggroMoveTo(-13615, 10133)
	If GetAreaVanquished() = False Then AggroMoveTo(-11311, 11359)
	If GetAreaVanquished() = False Then AggroMoveTo(-10677, 10090)
	If GetAreaVanquished() = False Then AggroMoveTo(-8493, 10911)
	If GetAreaVanquished() = False Then AggroMoveTo(-11506, 7051)
	If GetAreaVanquished() = False Then AggroMoveTo(-11535, 4835)
	If GetAreaVanquished() = False Then AggroMoveTo(-13372, 6934)
	If GetAreaVanquished() = False Then AggroMoveTo(-15888, 8854)
	If GetAreaVanquished() = False Then AggroMoveTo(-17305, 9577)
	If GetAreaVanquished() = False Then AggroMoveTo(-14451, 4310)
	If GetAreaVanquished() = False Then AggroMoveTo(-15661, 986)
	If GetAreaVanquished() = False Then AggroMoveTo(-15321, -957)
	If GetAreaVanquished() = False Then AggroMoveTo(-14037, -3098)
	If GetAreaVanquished() = False Then AggroMoveTo(-10397, -4716)
	If GetAreaVanquished() = False Then AggroMoveTo(-6498, -3883)
	If GetAreaVanquished() = False Then AggroMoveTo(-1295, -3987)
	If GetAreaVanquished() = False Then AggroMoveTo(998, -5239)
	If GetAreaVanquished() = False Then AggroMoveTo(1632, -6769)
	If GetAreaVanquished() = False Then AggroMoveTo(4040, -7515)
	If GetAreaVanquished() = False Then AggroMoveTo(3784, -11613)
	If GetAreaVanquished() = False Then AggroMoveTo(2975, -11703)
	If GetAreaVanquished() = False Then AggroMoveTo(1840, -12742)
	If GetAreaVanquished() = False Then AggroMoveTo(-734, -11602)
	If GetAreaVanquished() = False Then AggroMoveTo(-1048, -9676)
	If GetAreaVanquished() = False Then AggroMoveTo(-2253, -10660)
	If GetAreaVanquished() = False Then AggroMoveTo(-7504, -10865)
	If GetAreaVanquished() = False Then AggroMoveTo(-9426, -9419)
	If GetAreaVanquished() = False Then AggroMoveTo(-7425, -10893)
	If GetAreaVanquished() = False Then AggroMoveTo(-6162, -7935)
	If GetAreaVanquished() = False Then AggroMoveTo(-6483, -6746)
	If GetAreaVanquished() = False Then AggroMoveTo(-7364, -7458)
	If GetAreaVanquished() = False Then AggroMoveTo(-14061, -5047)
	If GetAreaVanquished() = False Then AggroMoveTo(-14660, -6170)
	If GetAreaVanquished() = False Then AggroMoveTo(-13074, -6245)
	If GetAreaVanquished() = False Then AggroMoveTo(-12869, -7626)
	If GetAreaVanquished() = False Then AggroMoveTo(-9454, -8018)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-9454, -8018)
	If GetAreaVanquished() = False Then AggroMoveTo(-12869, -7626)
	If GetAreaVanquished() = False Then AggroMoveTo(-13074, -6245)
	If GetAreaVanquished() = False Then AggroMoveTo(-14660, -6170)
	If GetAreaVanquished() = False Then AggroMoveTo(-14061, -5047)
	If GetAreaVanquished() = False Then AggroMoveTo(-7364, -7458)
	If GetAreaVanquished() = False Then AggroMoveTo(-6483, -6746)
	If GetAreaVanquished() = False Then AggroMoveTo(-6162, -7935)
	If GetAreaVanquished() = False Then AggroMoveTo(-7425, -10893)
	If GetAreaVanquished() = False Then AggroMoveTo(-9426, -9419)
	If GetAreaVanquished() = False Then AggroMoveTo(-7504, -10865)
	If GetAreaVanquished() = False Then AggroMoveTo(-2253, -10660)
	If GetAreaVanquished() = False Then AggroMoveTo(-1048, -9676)
	If GetAreaVanquished() = False Then AggroMoveTo(-734, -11602)
	If GetAreaVanquished() = False Then AggroMoveTo(1840, -12742)
	If GetAreaVanquished() = False Then AggroMoveTo(2975, -11703)
	If GetAreaVanquished() = False Then AggroMoveTo(3784, -11613)
	If GetAreaVanquished() = False Then AggroMoveTo(4040, -7515)
	If GetAreaVanquished() = False Then AggroMoveTo(1632, -6769)
	If GetAreaVanquished() = False Then AggroMoveTo(998, -5239)
	If GetAreaVanquished() = False Then AggroMoveTo(-1295, -3987)
	If GetAreaVanquished() = False Then AggroMoveTo(-6498, -3883)
	If GetAreaVanquished() = False Then AggroMoveTo(-10397, -4716)
	If GetAreaVanquished() = False Then AggroMoveTo(-14037, -3098)
	If GetAreaVanquished() = False Then AggroMoveTo(-15321, -957)
	If GetAreaVanquished() = False Then AggroMoveTo(-15661, 986)
	If GetAreaVanquished() = False Then AggroMoveTo(-14451, 4310)
	If GetAreaVanquished() = False Then AggroMoveTo(-17305, 9577)
	If GetAreaVanquished() = False Then AggroMoveTo(-15888, 8854)
	If GetAreaVanquished() = False Then AggroMoveTo(-13372, 6934)
	If GetAreaVanquished() = False Then AggroMoveTo(-11535, 4835)
	If GetAreaVanquished() = False Then AggroMoveTo(-11506, 7051)
	If GetAreaVanquished() = False Then AggroMoveTo(-8493, 10911)
	If GetAreaVanquished() = False Then AggroMoveTo(-10677, 10090)
	If GetAreaVanquished() = False Then AggroMoveTo(-11311, 11359)
	If GetAreaVanquished() = False Then AggroMoveTo(-13615, 10133)
	If GetAreaVanquished() = False Then AggroMoveTo(-14716, 11271)
	If GetAreaVanquished() = False Then AggroMoveTo(-13533, 15707)
	If GetAreaVanquished() = False Then AggroMoveTo(-6478, 15542)
	If GetAreaVanquished() = False Then AggroMoveTo(-3496, 14288)
	If GetAreaVanquished() = False Then AggroMoveTo(-7982, 15702)
	If GetAreaVanquished() = False Then AggroMoveTo(-10974, 16060)
	If GetAreaVanquished() = False Then AggroMoveTo(-10953, 14977)
	If GetAreaVanquished() = False Then AggroMoveTo(-5643, 13409)
	If GetAreaVanquished() = False Then AggroMoveTo(-4595, 10987)
	If GetAreaVanquished() = False Then AggroMoveTo(-2823, 4276)
	If GetAreaVanquished() = False Then AggroMoveTo(264, 3406)
	If GetAreaVanquished() = False Then AggroMoveTo(2700, 3089)
	If GetAreaVanquished() = False Then AggroMoveTo(1375, 4976)
	If GetAreaVanquished() = False Then AggroMoveTo(1853, 7655)
	If GetAreaVanquished() = False Then AggroMoveTo(2367, 10037)
	If GetAreaVanquished() = False Then AggroMoveTo(3860, 13340)
	If GetAreaVanquished() = False Then AggroMoveTo(6705, 14475)
	If GetAreaVanquished() = False Then AggroMoveTo(5919, 21200)
	If GetAreaVanquished() = False Then AggroMoveTo(8625, 21923)
EndFunc

