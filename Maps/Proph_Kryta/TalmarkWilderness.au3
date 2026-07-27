#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTalmarkWildernessOutpostPath[1][2] = [ _
	[-5252, 15997] _
]

Global $aTalmarkWildernessTransitPath[9][2] = [ _
	[-6302, 14890], _
	[-12310, 14349], _
	[-15074, 13794], _
	[-16069, 13242], _
	[-17215, 12961], _
	[-17978, 10435], _
	[-18374, 7235], _
	[-20108, 2457], _
	[-20274, 1812] _
]

Func GoOutTalmarkWilderness()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TalmarkWilderness_Map Then Return

	If $l_i_Map = $TalmarkWilderness_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TalmarkWilderness (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTalmarkWildernessOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $TalmarkWilderness_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> TalmarkWilderness (portal 2)")
		_Vanquisher_RunAggroPortalPath($aTalmarkWildernessTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTalmarkWilderness()
	If GetMapID() <> $TalmarkWilderness_Map And GetMapID() <> $TalmarkWilderness_Outpost And GetMapID() <> $TalmarkWilderness_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TalmarkWilderness.")
		TravelTo($TalmarkWilderness_Outpost)
	EndIf

	If GetMapID() = $TalmarkWilderness_Outpost Or GetMapID() = $TalmarkWilderness_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutTalmarkWilderness()
		If GetMapID() <> $TalmarkWilderness_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TalmarkWilderness (" & $TalmarkWilderness_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TalmarkWilderness_Map Then
		CurrentAction("TalmarkWilderness route waiting - on map " & GetMapID() & ", need " & $TalmarkWilderness_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TalmarkWilderness vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(16888, 2685)
	If GetAreaVanquished() = False Then AggroMoveTo(10801, 8084)
	If GetAreaVanquished() = False Then AggroMoveTo(8472, 8084)
	If GetAreaVanquished() = False Then AggroMoveTo(9795, 11948)
	If GetAreaVanquished() = False Then AggroMoveTo(7836, 5755)
	If GetAreaVanquished() = False Then AggroMoveTo(3125, 8031)
	If GetAreaVanquished() = False Then AggroMoveTo(-1692, 7396)
	If GetAreaVanquished() = False Then AggroMoveTo(-4021, 9672)
	If GetAreaVanquished() = False Then AggroMoveTo(-7038, 10678)
	If GetAreaVanquished() = False Then AggroMoveTo(-4127, 16024)
	If GetAreaVanquished() = False Then AggroMoveTo(-421, 12583)
	If GetAreaVanquished() = False Then AggroMoveTo(4872, 14489)
	If GetAreaVanquished() = False Then AggroMoveTo(-377, 12410)
	If GetAreaVanquished() = False Then AggroMoveTo(-5391, 13832)
	If GetAreaVanquished() = False Then AggroMoveTo(-6983, 10716)
	If GetAreaVanquished() = False Then AggroMoveTo(-8643, 9801)
	If GetAreaVanquished() = False Then AggroMoveTo(-10608, 13765)
	If GetAreaVanquished() = False Then AggroMoveTo(-12979, 13460)
	If GetAreaVanquished() = False Then AggroMoveTo(-13352, 10784)
	If GetAreaVanquished() = False Then AggroMoveTo(-16299, 9564)
	If GetAreaVanquished() = False Then AggroMoveTo(-16807, 7464)
	If GetAreaVanquished() = False Then AggroMoveTo(-18603, 4686)
	If GetAreaVanquished() = False Then AggroMoveTo(-16977, 7362)
	If GetAreaVanquished() = False Then AggroMoveTo(-14233, 10750)
	If GetAreaVanquished() = False Then AggroMoveTo(-12200, 9225)
	If GetAreaVanquished() = False Then AggroMoveTo(-9591, 8514)
	If GetAreaVanquished() = False Then AggroMoveTo(-10438, 3466)
	If GetAreaVanquished() = False Then AggroMoveTo(-12225, 188)
	If GetAreaVanquished() = False Then AggroMoveTo(-10828, -2522)
	If GetAreaVanquished() = False Then AggroMoveTo(-6974, -5401)
	If GetAreaVanquished() = False Then AggroMoveTo(-4264, -4089)
	If GetAreaVanquished() = False Then AggroMoveTo(-1935, -2437)
	If GetAreaVanquished() = False Then AggroMoveTo(-1709, -6498)
	If GetAreaVanquished() = False Then AggroMoveTo(-555, -4552)
	If GetAreaVanquished() = False Then AggroMoveTo(-72, -2098)
	If GetAreaVanquished() = False Then AggroMoveTo(-2740, 824)
	If GetAreaVanquished() = False Then AggroMoveTo(-6726, 1964)
	If GetAreaVanquished() = False Then AggroMoveTo(-2909, 2136)
	If GetAreaVanquished() = False Then AggroMoveTo(-2824, 5355)
	If GetAreaVanquished() = False Then AggroMoveTo(267, 6159)
	If GetAreaVanquished() = False Then AggroMoveTo(606, -108)
	If GetAreaVanquished() = False Then AggroMoveTo(4849, 1524)
	If GetAreaVanquished() = False Then AggroMoveTo(6831, 4338)
	If GetAreaVanquished() = False Then AggroMoveTo(11150, 2856)
	If GetAreaVanquished() = False Then AggroMoveTo(11955, -447)
	If GetAreaVanquished() = False Then AggroMoveTo(12600, -4097)
	If GetAreaVanquished() = False Then AggroMoveTo(10633, -3261)
	If GetAreaVanquished() = False Then AggroMoveTo(7254, -1675)
	If GetAreaVanquished() = False Then AggroMoveTo(2808, -1506)
	If GetAreaVanquished() = False Then AggroMoveTo(6407, -3792)
	If GetAreaVanquished() = False Then AggroMoveTo(4713, -6714)
	If GetAreaVanquished() = False Then AggroMoveTo(8059, -8662)
	If GetAreaVanquished() = False Then AggroMoveTo(10049, -9086)
	If GetAreaVanquished() = False Then AggroMoveTo(10388, -9170)
	If GetAreaVanquished() = False Then AggroMoveTo(13691, -10102)
	If GetAreaVanquished() = False Then AggroMoveTo(13288, -7637)
	If GetAreaVanquished() = False Then AggroMoveTo(11813, -7490)
	If GetAreaVanquished() = False Then AggroMoveTo(13860, -9933)
	If GetAreaVanquished() = False Then AggroMoveTo(10134, -9382)
	If GetAreaVanquished() = False Then AggroMoveTo(12505, -13659)
	If GetAreaVanquished() = False Then AggroMoveTo(7466, -10144)
	If GetAreaVanquished() = False Then AggroMoveTo(6915, -12092)
	If GetAreaVanquished() = False Then AggroMoveTo(6661, -15353)
	If GetAreaVanquished() = False Then AggroMoveTo(9071, -15697)
	If GetAreaVanquished() = False Then AggroMoveTo(3104, -14464)
	If GetAreaVanquished() = False Then AggroMoveTo(5349, -10652)
	If GetAreaVanquished() = False Then AggroMoveTo(5052, -8154)
	If GetAreaVanquished() = False Then AggroMoveTo(2723, -7730)
	If GetAreaVanquished() = False Then AggroMoveTo(2850, -10017)
	If GetAreaVanquished() = False Then AggroMoveTo(-538, -11584)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-538, -11584)
	If GetAreaVanquished() = False Then AggroMoveTo(2850, -10017)
	If GetAreaVanquished() = False Then AggroMoveTo(2723, -7730)
	If GetAreaVanquished() = False Then AggroMoveTo(5052, -8154)
	If GetAreaVanquished() = False Then AggroMoveTo(5349, -10652)
	If GetAreaVanquished() = False Then AggroMoveTo(3104, -14464)
	If GetAreaVanquished() = False Then AggroMoveTo(9071, -15697)
	If GetAreaVanquished() = False Then AggroMoveTo(6661, -15353)
	If GetAreaVanquished() = False Then AggroMoveTo(6915, -12092)
	If GetAreaVanquished() = False Then AggroMoveTo(7466, -10144)
	If GetAreaVanquished() = False Then AggroMoveTo(12505, -13659)
	If GetAreaVanquished() = False Then AggroMoveTo(10134, -9382)
	If GetAreaVanquished() = False Then AggroMoveTo(13860, -9933)
	If GetAreaVanquished() = False Then AggroMoveTo(11813, -7490)
	If GetAreaVanquished() = False Then AggroMoveTo(13288, -7637)
	If GetAreaVanquished() = False Then AggroMoveTo(13691, -10102)
	If GetAreaVanquished() = False Then AggroMoveTo(10388, -9170)
	If GetAreaVanquished() = False Then AggroMoveTo(10049, -9086)
	If GetAreaVanquished() = False Then AggroMoveTo(8059, -8662)
	If GetAreaVanquished() = False Then AggroMoveTo(4713, -6714)
	If GetAreaVanquished() = False Then AggroMoveTo(6407, -3792)
	If GetAreaVanquished() = False Then AggroMoveTo(2808, -1506)
	If GetAreaVanquished() = False Then AggroMoveTo(7254, -1675)
	If GetAreaVanquished() = False Then AggroMoveTo(10633, -3261)
	If GetAreaVanquished() = False Then AggroMoveTo(12600, -4097)
	If GetAreaVanquished() = False Then AggroMoveTo(11955, -447)
	If GetAreaVanquished() = False Then AggroMoveTo(11150, 2856)
	If GetAreaVanquished() = False Then AggroMoveTo(6831, 4338)
	If GetAreaVanquished() = False Then AggroMoveTo(4849, 1524)
	If GetAreaVanquished() = False Then AggroMoveTo(606, -108)
	If GetAreaVanquished() = False Then AggroMoveTo(267, 6159)
	If GetAreaVanquished() = False Then AggroMoveTo(-2824, 5355)
	If GetAreaVanquished() = False Then AggroMoveTo(-2909, 2136)
	If GetAreaVanquished() = False Then AggroMoveTo(-6726, 1964)
	If GetAreaVanquished() = False Then AggroMoveTo(-2740, 824)
	If GetAreaVanquished() = False Then AggroMoveTo(-72, -2098)
	If GetAreaVanquished() = False Then AggroMoveTo(-555, -4552)
	If GetAreaVanquished() = False Then AggroMoveTo(-1709, -6498)
	If GetAreaVanquished() = False Then AggroMoveTo(-1935, -2437)
	If GetAreaVanquished() = False Then AggroMoveTo(-4264, -4089)
	If GetAreaVanquished() = False Then AggroMoveTo(-6974, -5401)
	If GetAreaVanquished() = False Then AggroMoveTo(-10828, -2522)
	If GetAreaVanquished() = False Then AggroMoveTo(-12225, 188)
	If GetAreaVanquished() = False Then AggroMoveTo(-10438, 3466)
	If GetAreaVanquished() = False Then AggroMoveTo(-9591, 8514)
	If GetAreaVanquished() = False Then AggroMoveTo(-12200, 9225)
	If GetAreaVanquished() = False Then AggroMoveTo(-14233, 10750)
	If GetAreaVanquished() = False Then AggroMoveTo(-16977, 7362)
	If GetAreaVanquished() = False Then AggroMoveTo(-18603, 4686)
	If GetAreaVanquished() = False Then AggroMoveTo(-16807, 7464)
	If GetAreaVanquished() = False Then AggroMoveTo(-16299, 9564)
	If GetAreaVanquished() = False Then AggroMoveTo(-13352, 10784)
	If GetAreaVanquished() = False Then AggroMoveTo(-12979, 13460)
	If GetAreaVanquished() = False Then AggroMoveTo(-10608, 13765)
	If GetAreaVanquished() = False Then AggroMoveTo(-8643, 9801)
	If GetAreaVanquished() = False Then AggroMoveTo(-6983, 10716)
	If GetAreaVanquished() = False Then AggroMoveTo(-5391, 13832)
	If GetAreaVanquished() = False Then AggroMoveTo(-377, 12410)
	If GetAreaVanquished() = False Then AggroMoveTo(4872, 14489)
	If GetAreaVanquished() = False Then AggroMoveTo(-421, 12583)
	If GetAreaVanquished() = False Then AggroMoveTo(-4127, 16024)
	If GetAreaVanquished() = False Then AggroMoveTo(-7038, 10678)
	If GetAreaVanquished() = False Then AggroMoveTo(-4021, 9672)
	If GetAreaVanquished() = False Then AggroMoveTo(-1692, 7396)
	If GetAreaVanquished() = False Then AggroMoveTo(3125, 8031)
	If GetAreaVanquished() = False Then AggroMoveTo(7836, 5755)
	If GetAreaVanquished() = False Then AggroMoveTo(9795, 11948)
	If GetAreaVanquished() = False Then AggroMoveTo(8472, 8084)
	If GetAreaVanquished() = False Then AggroMoveTo(10801, 8084)
	If GetAreaVanquished() = False Then AggroMoveTo(16888, 2685)
EndFunc

