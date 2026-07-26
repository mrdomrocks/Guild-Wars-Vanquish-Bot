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

	Local $aWaypoints[70][4] = [ _
		[16888, 2685, " ", $vqrange], _
		[10801, 8084, " ", $vqrange], _
		[8472, 8084, " ", $vqrange], _
		[9795, 11948, " ", $vqrange], _
		[7836, 5755, " ", $vqrange], _
		[3125, 8031, " ", $vqrange], _
		[-1692, 7396, " ", $vqrange], _
		[-4021, 9672, " ", $vqrange], _
		[-7038, 10678, " ", $vqrange], _
		[-4127, 16024, " ", $vqrange], _
		[-421, 12583, " ", $vqrange], _
		[4872, 14489, " ", $vqrange], _
		[-377, 12410, " ", $vqrange], _
		[-5391, 13832, " ", $vqrange], _
		[-6983, 10716, " ", $vqrange], _
		[-8643, 9801, " ", $vqrange], _
		[-10608, 13765, " ", $vqrange], _
		[-12979, 13460, " ", $vqrange], _
		[-13352, 10784, " ", $vqrange], _
		[-16299, 9564, " ", $vqrange], _
		[-16807, 7464, " ", $vqrange], _
		[-18603, 4686, " ", $vqrange], _
		[-16977, 7362, " ", $vqrange], _
		[-14233, 10750, " ", $vqrange], _
		[-12200, 9225, " ", $vqrange], _
		[-9591, 8514, " ", $vqrange], _
		[-10438, 3466, " ", $vqrange], _
		[-12225, 188, " ", $vqrange], _
		[-10828, -2522, " ", $vqrange], _
		[-6974, -5401, " ", $vqrange], _
		[-4264, -4089, " ", $vqrange], _
		[-1935, -2437, " ", $vqrange], _
		[-1709, -6498, " ", $vqrange], _
		[-555, -4552, " ", $vqrange], _
		[-72, -2098, " ", $vqrange], _
		[-2740, 824, " ", $vqrange], _
		[-6726, 1964, " ", $vqrange], _
		[-2909, 2136, " ", $vqrange], _
		[-2824, 5355, " ", $vqrange], _
		[267, 6159, " ", $vqrange], _
		[606, -108, " ", $vqrange], _
		[4849, 1524, " ", $vqrange], _
		[6831, 4338, " ", $vqrange], _
		[11150, 2856, " ", $vqrange], _
		[11955, -447, " ", $vqrange], _
		[12600, -4097, " ", $vqrange], _
		[10633, -3261, " ", $vqrange], _
		[7254, -1675, " ", $vqrange], _
		[2808, -1506, " ", $vqrange], _
		[6407, -3792, " ", $vqrange], _
		[4713, -6714, " ", $vqrange], _
		[8059, -8662, " ", $vqrange], _
		[10049, -9086, " ", $vqrange], _
		[10388, -9170, " ", $vqrange], _
		[13691, -10102, " ", $vqrange], _
		[13288, -7637, " ", $vqrange], _
		[11813, -7490, " ", $vqrange], _
		[13860, -9933, " ", $vqrange], _
		[10134, -9382, " ", $vqrange], _
		[12505, -13659, " ", $vqrange], _
		[7466, -10144, " ", $vqrange], _
		[6915, -12092, " ", $vqrange], _
		[6661, -15353, " ", $vqrange], _
		[9071, -15697, " ", $vqrange], _
		[3104, -14464, " ", $vqrange], _
		[5349, -10652, " ", $vqrange], _
		[5052, -8154, " ", $vqrange], _
		[2723, -7730, " ", $vqrange], _
		[2850, -10017, " ", $vqrange], _
		[-538, -11584, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

