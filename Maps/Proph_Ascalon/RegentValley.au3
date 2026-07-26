#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aRegentValleyTransitPath[6][2] = [ _
	[13848, -8185], _
	[12519, -9143], _
	[11393, -10165], _
	[10333, -10978], _
	[10249, -13662], _
	[10525, -13681] _
]

Func GoOutRegentValley()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $RegentValley_Map Then Return

	If $l_i_Map = $RegentValley_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("OldAscalon -> RegentValley")
		_Vanquisher_RunAggroPortalPath($aRegentValleyTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQRegentValley()
	If GetMapID() <> $RegentValley_Map And GetMapID() <> $RegentValley_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("RegentValley route waiting - on map " & GetMapID() & ", need " & $RegentValley_Map & " via Old Ascalon.")
		Return
	EndIf

	If GetMapID() = $RegentValley_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutRegentValley()
		If GetMapID() <> $RegentValley_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need RegentValley (" & $RegentValley_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $RegentValley_Map Then
		CurrentAction("RegentValley route waiting - on map " & GetMapID() & ", need " & $RegentValley_Map & ".")
		Return
	EndIf

	CurrentAction("Starting RegentValley vanquish route.")

	Local $aWaypoints[106][4] = [ _
		[21699, 3672, " ", $vqrange], _
		[20836, 1939, " ", $vqrange], _
		[18455, -1521, " ", $vqrange], _
		[17643, -2863, " ", $vqrange], _
		[20445, -5550, " ", $vqrange], _
		[21478, -4761, " ", $vqrange], _
		[18234, -3211, " ", $vqrange], _
		[14919, -3146, " ", $vqrange], _
		[16498, -9490, " ", $vqrange], _
		[15206, -10527, " ", $vqrange], _
		[12313, -10774, " ", $vqrange], _
		[11070, -10965, " ", $vqrange], _
		[9864, -10115, " ", $vqrange], _
		[9864, -10115, " ", $vqrange], _
		[9939, -12556, " ", $vqrange], _
		[5221, -12945, " ", $vqrange], _
		[4344, -13179, " ", $vqrange], _
		[1334, -11871, " ", $vqrange], _
		[528, -10483, " ", $vqrange], _
		[1403, -8861, " ", $vqrange], _
		[-1971, -7535, " ", $vqrange], _
		[-4702, -7478, " ", $vqrange], _
		[-6217, -6654, " ", $vqrange], _
		[-7599, -10017, " ", $vqrange], _
		[-9999, -10387, " ", $vqrange], _
		[-11608, -10839, " ", $vqrange], _
		[-12279, -13028, " ", $vqrange], _
		[-16174, -12648, " ", $vqrange], _
		[-19732, -12366, " ", $vqrange], _
		[-21211, -11417, " ", $vqrange], _
		[-22943, -11033, " ", $vqrange], _
		[-23156, -8099, " ", $vqrange], _
		[-24782, -7465, " ", $vqrange], _
		[-22058, -3958, " ", $vqrange], _
		[-21328, -2190, " ", $vqrange], _
		[-21328, -2190, " ", $vqrange], _
		[-23692, -3505, " ", $vqrange], _
		[-25476, -2187, " ", $vqrange], _
		[-26016, 788, " ", $vqrange], _
		[-24702, 3184, " ", $vqrange], _
		[-24410, 6415, " ", $vqrange], _
		[-22838, 10491, " ", $vqrange], _
		[-19955, 10804, " ", $vqrange], _
		[-17822, 10732, " ", $vqrange], _
		[-15860, 13862, " ", $vqrange], _
		[-13860, 14310, " ", $vqrange], _
		[-8907, 12192, " ", $vqrange], _
		[-5661, 11764, " ", $vqrange], _
		[-3382, 8429, " ", $vqrange], _
		[21, 6773, " ", $vqrange], _
		[589, 9675, " ", $vqrange], _
		[3661, 6260, " ", $vqrange], _
		[6283, 5235, " ", $vqrange], _
		[7652, 3790, " ", $vqrange], _
		[8490, 3320, " ", $vqrange], _
		[7126, 829, " ", $vqrange], _
		[11115, 1954, " ", $vqrange], _
		[13905, 1320, " ", $vqrange], _
		[16783, 5522, " ", $vqrange], _
		[16466, 9848, " ", $vqrange], _
		[14827, 8483, " ", $vqrange], _
		[17357, 6712, " ", $vqrange], _
		[16441, 4697, " ", $vqrange], _
		[17547, 5023, " ", $vqrange], _
		[15704, 2851, " ", $vqrange], _
		[10740, 2036, " ", $vqrange], _
		[6667, -751, " ", $vqrange], _
		[6999, -3284, " ", $vqrange], _
		[7050, -5761, " ", $vqrange], _
		[4608, -1723, " ", $vqrange], _
		[3481, 20, " ", $vqrange], _
		[766, -197, " ", $vqrange], _
		[-3665, -340, " ", $vqrange], _
		[-7683, -533, " ", $vqrange], _
		[-7077, -2634, " ", $vqrange], _
		[-7537, -5424, " ", $vqrange], _
		[-6601, -2790, " ", $vqrange], _
		[-3759, -3592, " ", $vqrange], _
		[-1058, -4608, " ", $vqrange], _
		[-3888, -3514, " ", $vqrange], _
		[-6660, -1623, " ", $vqrange], _
		[-9148, 185, " ", $vqrange], _
		[-11547, 1738, " ", $vqrange], _
		[-12401, 2509, " ", $vqrange], _
		[-13322, 3119, " ", $vqrange], _
		[-13857, 1901, " ", $vqrange], _
		[-16212, -764, " ", $vqrange], _
		[-15176, -4550, " ", $vqrange], _
		[-16699, -2440, " ", $vqrange], _
		[-17605, 167, " ", $vqrange], _
		[-17063, 2062, " ", $vqrange], _
		[-20607, 1233, " ", $vqrange], _
		[-17039, 2076, " ", $vqrange], _
		[-17656, 589, " ", $vqrange], _
		[-16535, -1055, " ", $vqrange], _
		[-15195, 889, " ", $vqrange], _
		[-17768, 5880, " ", $vqrange], _
		[-14062, 3681, " ", $vqrange], _
		[-11469, 5019, " ", $vqrange], _
		[-11593, 6730, " ", $vqrange], _
		[-12250, 7507, " ", $vqrange], _
		[-12982, 3408, " ", $vqrange], _
		[-9548, 4840, " ", $vqrange], _
		[-6728, 5698, " ", $vqrange], _
		[-6347, 6169, " ", $vqrange], _
		[-11819, 9584, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
