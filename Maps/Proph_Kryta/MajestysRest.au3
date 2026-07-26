#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aMajestysRestOutpostPath[2][2] = [ _
	[-5199, 16327], _
	[-5252, 15997] _
]

Global $aMajestysRestTransitPath[7][2] = [ _
	[-6302, 14890], _
	[-13411, 14710], _
	[-16718, 13517], _
	[-17978, 10435], _
	[-18374, 7235], _
	[-20108, 2457], _
	[-20274, 1812] _
]

Global $aMajestysRestTransit2Path[11][2] = [ _
	[16716, 2887], _
	[11180, 7961], _
	[3437, 8483], _
	[-2499, 8992], _
	[-7004, 10342], _
	[-12458, 9257], _
	[-14167, 10912], _
	[-17071, 7303], _
	[-18812, 5631], _
	[-19523, 3658], _
	[-20190, 3714] _
]

Func GoOutMajestysRest()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $MajestysRest_Map Then Return

	If $l_i_Map = $MajestysRest_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MajestysRest (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMajestysRestOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MajestysRest_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MajestysRest (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMajestysRestTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $MajestysRest_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MajestysRest (portal 3)")
		_Vanquisher_RunAggroPortalPath($aMajestysRestTransit2Path, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQMajestysRest()
	If GetMapID() <> $MajestysRest_Map And GetMapID() <> $MajestysRest_Outpost And GetMapID() <> $MajestysRest_Transit And GetMapID() <> $MajestysRest_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MajestysRest.")
		TravelTo($MajestysRest_Outpost)
	EndIf

	If GetMapID() = $MajestysRest_Outpost Or GetMapID() = $MajestysRest_Transit Or GetMapID() = $MajestysRest_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutMajestysRest()
		If GetMapID() <> $MajestysRest_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MajestysRest (" & $MajestysRest_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $MajestysRest_Map Then
		CurrentAction("MajestysRest route waiting - on map " & GetMapID() & ", need " & $MajestysRest_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MajestysRest vanquish route.")

	Local $aWaypoints[77][4] = [ _
		[21522, -3238, " ", $vqrange], _
		[21779, 2461, " ", $vqrange], _
		[22541, 4683, " ", $vqrange], _
		[21272, 6143, " ", $vqrange], _
		[21113, 4524, " ", $vqrange], _
		[20256, 3604, " ", $vqrange], _
		[18129, 2842, " ", $vqrange], _
		[20319, 2048, " ", $vqrange], _
		[18986, 937, " ", $vqrange], _
		[20192, 1033, " ", $vqrange], _
		[20129, -1760, " ", $vqrange], _
		[18193, -269, " ", $vqrange], _
		[16865, 420, " ", $vqrange], _
		[16252, -1572, " ", $vqrange], _
		[17470, -1816, " ", $vqrange], _
		[14470, -1522, " ", $vqrange], _
		[13929, -179, " ", $vqrange], _
		[13789, 167, " ", $vqrange], _
		[13383, 1318, " ", $vqrange], _
		[12857, 1127, " ", $vqrange], _
		[14042, 1574, " ", $vqrange], _
		[13386, 1320, " ", $vqrange], _
		[13783, 170, " ", $vqrange], _
		[13925, -184, " ", $vqrange], _
		[14467, -1528, " ", $vqrange], _
		[15320, -4921, " ", $vqrange], _
		[19111, -7402, " ", $vqrange], _
		[15322, -4908, " ", $vqrange], _
		[14287, -5855, " ", $vqrange], _
		[13149, -2097, " ", $vqrange], _
		[11484, -6221, " ", $vqrange], _
		[8805, -3632, " ", $vqrange], _
		[10805, -966, " ", $vqrange], _
		[10709, 3128, " ", $vqrange], _
		[12931, 4938, " ", $vqrange], _
		[15534, 3509, " ", $vqrange], _
		[16319, 1057, " ", $vqrange], _
		[15541, 3507, " ", $vqrange], _
		[18276, 5403, " ", $vqrange], _
		[15542, 3517, " ", $vqrange], _
		[12933, 4938, " ", $vqrange], _
		[13397, 6362, " ", $vqrange], _
		[11537, 7896, " ", $vqrange], _
		[9509, 7662, " ", $vqrange], _
		[7572, 6635, " ", $vqrange], _
		[7780, 4373, " ", $vqrange], _
		[9496, 5933, " ", $vqrange], _
		[9535, 7677, " ", $vqrange], _
		[7589, 6650, " ", $vqrange], _
		[7797, 4379, " ", $vqrange], _
		[7341, 1421, " ", $vqrange], _
		[8809, -3599, " ", $vqrange], _
		[7368, 1495, " ", $vqrange], _
		[4757, 4572, " ", $vqrange], _
		[2336, 1664, " ", $vqrange], _
		[-2741, -521, " ", $vqrange], _
		[-5523, 833, " ", $vqrange], _
		[-5316, -2823, " ", $vqrange], _
		[-8030, -1960, " ", $vqrange], _
		[-6194, -3179, " ", $vqrange], _
		[-9703, -4954, " ", $vqrange], _
		[-8470, -6348, " ", $vqrange], _
		[-10353, -6155, " ", $vqrange], _
		[-9691, -4930, " ", $vqrange], _
		[-11913, -5155, " ", $vqrange], _
		[-10456, -4250, " ", $vqrange], _
		[-11244, -2854, " ", $vqrange], _
		[-10907, -1180, " ", $vqrange], _
		[-8225, -1147, " ", $vqrange], _
		[-6721, 1585, " ", $vqrange], _
		[-9188, 5174, " ", $vqrange], _
		[-13314, 2000, " ", $vqrange], _
		[-11277, -543, " ", $vqrange], _
		[-13536, 1472, " ", $vqrange], _
		[-17144, -511, " ", $vqrange], _
		[-22539, 1049, " ", $vqrange], _
		[-23160, 337, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

