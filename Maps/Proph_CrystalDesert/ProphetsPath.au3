#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aProphetsPathOutpostPath[3][2] = [ _
	[-17562, -1143], _
	[-18791, -310], _
	[-20099, -320] _
]

Func GoOutProphetsPath()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $ProphetsPath_Map Then Return

	If $l_i_Map = $ProphetsPath_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> ProphetsPath (portal 1)")
		_Vanquisher_RunAggroPortalPath($aProphetsPathOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQProphetsPath()
	If GetMapID() <> $ProphetsPath_Map And GetMapID() <> $ProphetsPath_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for ProphetsPath.")
		TravelTo($ProphetsPath_Outpost)
	EndIf

	If GetMapID() = $ProphetsPath_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutProphetsPath()
		If GetMapID() <> $ProphetsPath_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need ProphetsPath (" & $ProphetsPath_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $ProphetsPath_Map Then
		CurrentAction("ProphetsPath route waiting - on map " & GetMapID() & ", need " & $ProphetsPath_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ProphetsPath vanquish route.")

	Local $aWaypoints[87][4] = [ _
		[18507, 2552, " ", $vqrange], _
		[15854, 142, " ", $vqrange], _
		[13621, 728, " ", $vqrange], _
		[10567, 1916, " ", $vqrange], _
		[8650, 346, " ", $vqrange], _
		[10825, -259, " ", $vqrange], _
		[10230, -5584, " ", $vqrange], _
		[11441, -6973, " ", $vqrange], _
		[15913, -11253, " ", $vqrange], _
		[17045, -15067, " ", $vqrange], _
		[12331, -13048, " ", $vqrange], _
		[9185, -16683, " ", $vqrange], _
		[7671, -12361, " ", $vqrange], _
		[4420, -12805, " ", $vqrange], _
		[3534, -10662, " ", $vqrange], _
		[7929, -8815, " ", $vqrange], _
		[2314, -7522, " ", $vqrange], _
		[1502, -9923, " ", $vqrange], _
		[-101, -9280, " ", $vqrange], _
		[-988, -11571, " ", $vqrange], _
		[-4181, -13922, " ", $vqrange], _
		[-3929, -18124, " ", $vqrange], _
		[113, -18337, " ", $vqrange], _
		[-3953, -18124, " ", $vqrange], _
		[-5925, -10234, " ", $vqrange], _
		[-6487, -12395, " ", $vqrange], _
		[-8758, -13923, " ", $vqrange], _
		[-14884, -12454, " ", $vqrange], _
		[-14214, -10541, " ", $vqrange], _
		[-18861, -14698, " ", $vqrange], _
		[-17051, -11631, " ", $vqrange], _
		[-16005, -4498, " ", $vqrange], _
		[-16802, -3558, " ", $vqrange], _
		[-13477, -1183, " ", $vqrange], _
		[-14377, 2293, " ", $vqrange], _
		[-12035, 2932, " ", $vqrange], _
		[-10907, 968, " ", $vqrange], _
		[-7174, 2107, " ", $vqrange], _
		[-8547, 5685, " ", $vqrange], _
		[-4246, 4631, " ", $vqrange], _
		[-1719, 6368, " ", $vqrange], _
		[-249, 1737, " ", $vqrange], _
		[-4160, -259, " ", $vqrange], _
		[-8466, -295, " ", $vqrange], _
		[-9877, -2558, " ", $vqrange], _
		[-12672, -692, " ", $vqrange], _
		[-10466, -2975, " ", $vqrange], _
		[-10590, -5963, " ", $vqrange], _
		[-8832, -6427, " ", $vqrange], _
		[-7898, -5738, " ", $vqrange], _
		[-6960, -5476, " ", $vqrange], _
		[-7140, -3420, " ", $vqrange], _
		[-9168, -3072, " ", $vqrange], _
		[-7558, -2056, " ", $vqrange], _
		[-2863, -2007, " ", $vqrange], _
		[505, -1242, " ", $vqrange], _
		[3375, -4615, " ", $vqrange], _
		[3777, -845, " ", $vqrange], _
		[2812, 652, " ", $vqrange], _
		[4476, -479, " ", $vqrange], _
		[7917, 3302, " ", $vqrange], _
		[10369, 5717, " ", $vqrange], _
		[8779, 7659, " ", $vqrange], _
		[5348, 8840, " ", $vqrange], _
		[2622, 7651, " ", $vqrange], _
		[279, 9089, " ", $vqrange], _
		[5409, 8806, " ", $vqrange], _
		[8968, 9290, " ", $vqrange], _
		[9079, 10288, " ", $vqrange], _
		[12814, 9887, " ", $vqrange], _
		[15492, 11180, " ", $vqrange], _
		[16725, 9965, " ", $vqrange], _
		[18428, 12940, " ", $vqrange], _
		[16516, 13071, " ", $vqrange], _
		[14707, 13027, " ", $vqrange], _
		[11677, 15083, " ", $vqrange], _
		[11865, 17926, " ", $vqrange], _
		[10504, 18696, " ", $vqrange], _
		[10995, 17501, " ", $vqrange], _
		[16600, 11088, " ", $vqrange], _
		[8981, 13535, " ", $vqrange], _
		[2424, 18384, " ", $vqrange], _
		[-3994, 12381, " ", $vqrange], _
		[-6478, 14603, " ", $vqrange], _
		[-5669, 18547, " ", $vqrange], _
		[-2701, 19169, " ", $vqrange], _
		[-1685, 18153, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

