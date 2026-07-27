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


	If GetAreaVanquished() = False Then AggroMoveTo(21522, -3238)
	If GetAreaVanquished() = False Then AggroMoveTo(21779, 2461)
	If GetAreaVanquished() = False Then AggroMoveTo(22541, 4683)
	If GetAreaVanquished() = False Then AggroMoveTo(21272, 6143)
	If GetAreaVanquished() = False Then AggroMoveTo(21113, 4524)
	If GetAreaVanquished() = False Then AggroMoveTo(20256, 3604)
	If GetAreaVanquished() = False Then AggroMoveTo(18129, 2842)
	If GetAreaVanquished() = False Then AggroMoveTo(20319, 2048)
	If GetAreaVanquished() = False Then AggroMoveTo(18986, 937)
	If GetAreaVanquished() = False Then AggroMoveTo(20192, 1033)
	If GetAreaVanquished() = False Then AggroMoveTo(20129, -1760)
	If GetAreaVanquished() = False Then AggroMoveTo(18193, -269)
	If GetAreaVanquished() = False Then AggroMoveTo(16865, 420)
	If GetAreaVanquished() = False Then AggroMoveTo(16252, -1572)
	If GetAreaVanquished() = False Then AggroMoveTo(17470, -1816)
	If GetAreaVanquished() = False Then AggroMoveTo(14470, -1522)
	If GetAreaVanquished() = False Then AggroMoveTo(13929, -179)
	If GetAreaVanquished() = False Then AggroMoveTo(13789, 167)
	If GetAreaVanquished() = False Then AggroMoveTo(13383, 1318)
	If GetAreaVanquished() = False Then AggroMoveTo(12857, 1127)
	If GetAreaVanquished() = False Then AggroMoveTo(14042, 1574)
	If GetAreaVanquished() = False Then AggroMoveTo(13386, 1320)
	If GetAreaVanquished() = False Then AggroMoveTo(13783, 170)
	If GetAreaVanquished() = False Then AggroMoveTo(13925, -184)
	If GetAreaVanquished() = False Then AggroMoveTo(14467, -1528)
	If GetAreaVanquished() = False Then AggroMoveTo(15320, -4921)
	If GetAreaVanquished() = False Then AggroMoveTo(19111, -7402)
	If GetAreaVanquished() = False Then AggroMoveTo(15322, -4908)
	If GetAreaVanquished() = False Then AggroMoveTo(14287, -5855)
	If GetAreaVanquished() = False Then AggroMoveTo(13149, -2097)
	If GetAreaVanquished() = False Then AggroMoveTo(11484, -6221)
	If GetAreaVanquished() = False Then AggroMoveTo(8805, -3632)
	If GetAreaVanquished() = False Then AggroMoveTo(10805, -966)
	If GetAreaVanquished() = False Then AggroMoveTo(10709, 3128)
	If GetAreaVanquished() = False Then AggroMoveTo(12931, 4938)
	If GetAreaVanquished() = False Then AggroMoveTo(15534, 3509)
	If GetAreaVanquished() = False Then AggroMoveTo(16319, 1057)
	If GetAreaVanquished() = False Then AggroMoveTo(15541, 3507)
	If GetAreaVanquished() = False Then AggroMoveTo(18276, 5403)
	If GetAreaVanquished() = False Then AggroMoveTo(15542, 3517)
	If GetAreaVanquished() = False Then AggroMoveTo(12933, 4938)
	If GetAreaVanquished() = False Then AggroMoveTo(13397, 6362)
	If GetAreaVanquished() = False Then AggroMoveTo(11537, 7896)
	If GetAreaVanquished() = False Then AggroMoveTo(9509, 7662)
	If GetAreaVanquished() = False Then AggroMoveTo(7572, 6635)
	If GetAreaVanquished() = False Then AggroMoveTo(7780, 4373)
	If GetAreaVanquished() = False Then AggroMoveTo(9496, 5933)
	If GetAreaVanquished() = False Then AggroMoveTo(9535, 7677)
	If GetAreaVanquished() = False Then AggroMoveTo(7589, 6650)
	If GetAreaVanquished() = False Then AggroMoveTo(7797, 4379)
	If GetAreaVanquished() = False Then AggroMoveTo(7341, 1421)
	If GetAreaVanquished() = False Then AggroMoveTo(8809, -3599)
	If GetAreaVanquished() = False Then AggroMoveTo(7368, 1495)
	If GetAreaVanquished() = False Then AggroMoveTo(4757, 4572)
	If GetAreaVanquished() = False Then AggroMoveTo(2336, 1664)
	If GetAreaVanquished() = False Then AggroMoveTo(-2741, -521)
	If GetAreaVanquished() = False Then AggroMoveTo(-5523, 833)
	If GetAreaVanquished() = False Then AggroMoveTo(-5316, -2823)
	If GetAreaVanquished() = False Then AggroMoveTo(-8030, -1960)
	If GetAreaVanquished() = False Then AggroMoveTo(-6194, -3179)
	If GetAreaVanquished() = False Then AggroMoveTo(-9703, -4954)
	If GetAreaVanquished() = False Then AggroMoveTo(-8470, -6348)
	If GetAreaVanquished() = False Then AggroMoveTo(-10353, -6155)
	If GetAreaVanquished() = False Then AggroMoveTo(-9691, -4930)
	If GetAreaVanquished() = False Then AggroMoveTo(-11913, -5155)
	If GetAreaVanquished() = False Then AggroMoveTo(-10456, -4250)
	If GetAreaVanquished() = False Then AggroMoveTo(-11244, -2854)
	If GetAreaVanquished() = False Then AggroMoveTo(-10907, -1180)
	If GetAreaVanquished() = False Then AggroMoveTo(-8225, -1147)
	If GetAreaVanquished() = False Then AggroMoveTo(-6721, 1585)
	If GetAreaVanquished() = False Then AggroMoveTo(-9188, 5174)
	If GetAreaVanquished() = False Then AggroMoveTo(-13314, 2000)
	If GetAreaVanquished() = False Then AggroMoveTo(-11277, -543)
	If GetAreaVanquished() = False Then AggroMoveTo(-13536, 1472)
	If GetAreaVanquished() = False Then AggroMoveTo(-17144, -511)
	If GetAreaVanquished() = False Then AggroMoveTo(-22539, 1049)
	If GetAreaVanquished() = False Then AggroMoveTo(-23160, 337)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-23160, 337)
	If GetAreaVanquished() = False Then AggroMoveTo(-22539, 1049)
	If GetAreaVanquished() = False Then AggroMoveTo(-17144, -511)
	If GetAreaVanquished() = False Then AggroMoveTo(-13536, 1472)
	If GetAreaVanquished() = False Then AggroMoveTo(-11277, -543)
	If GetAreaVanquished() = False Then AggroMoveTo(-13314, 2000)
	If GetAreaVanquished() = False Then AggroMoveTo(-9188, 5174)
	If GetAreaVanquished() = False Then AggroMoveTo(-6721, 1585)
	If GetAreaVanquished() = False Then AggroMoveTo(-8225, -1147)
	If GetAreaVanquished() = False Then AggroMoveTo(-10907, -1180)
	If GetAreaVanquished() = False Then AggroMoveTo(-11244, -2854)
	If GetAreaVanquished() = False Then AggroMoveTo(-10456, -4250)
	If GetAreaVanquished() = False Then AggroMoveTo(-11913, -5155)
	If GetAreaVanquished() = False Then AggroMoveTo(-9691, -4930)
	If GetAreaVanquished() = False Then AggroMoveTo(-10353, -6155)
	If GetAreaVanquished() = False Then AggroMoveTo(-8470, -6348)
	If GetAreaVanquished() = False Then AggroMoveTo(-9703, -4954)
	If GetAreaVanquished() = False Then AggroMoveTo(-6194, -3179)
	If GetAreaVanquished() = False Then AggroMoveTo(-8030, -1960)
	If GetAreaVanquished() = False Then AggroMoveTo(-5316, -2823)
	If GetAreaVanquished() = False Then AggroMoveTo(-5523, 833)
	If GetAreaVanquished() = False Then AggroMoveTo(-2741, -521)
	If GetAreaVanquished() = False Then AggroMoveTo(2336, 1664)
	If GetAreaVanquished() = False Then AggroMoveTo(4757, 4572)
	If GetAreaVanquished() = False Then AggroMoveTo(7368, 1495)
	If GetAreaVanquished() = False Then AggroMoveTo(8809, -3599)
	If GetAreaVanquished() = False Then AggroMoveTo(7341, 1421)
	If GetAreaVanquished() = False Then AggroMoveTo(7797, 4379)
	If GetAreaVanquished() = False Then AggroMoveTo(7589, 6650)
	If GetAreaVanquished() = False Then AggroMoveTo(9535, 7677)
	If GetAreaVanquished() = False Then AggroMoveTo(9496, 5933)
	If GetAreaVanquished() = False Then AggroMoveTo(7780, 4373)
	If GetAreaVanquished() = False Then AggroMoveTo(7572, 6635)
	If GetAreaVanquished() = False Then AggroMoveTo(9509, 7662)
	If GetAreaVanquished() = False Then AggroMoveTo(11537, 7896)
	If GetAreaVanquished() = False Then AggroMoveTo(13397, 6362)
	If GetAreaVanquished() = False Then AggroMoveTo(12933, 4938)
	If GetAreaVanquished() = False Then AggroMoveTo(15542, 3517)
	If GetAreaVanquished() = False Then AggroMoveTo(18276, 5403)
	If GetAreaVanquished() = False Then AggroMoveTo(15541, 3507)
	If GetAreaVanquished() = False Then AggroMoveTo(16319, 1057)
	If GetAreaVanquished() = False Then AggroMoveTo(15534, 3509)
	If GetAreaVanquished() = False Then AggroMoveTo(12931, 4938)
	If GetAreaVanquished() = False Then AggroMoveTo(10709, 3128)
	If GetAreaVanquished() = False Then AggroMoveTo(10805, -966)
	If GetAreaVanquished() = False Then AggroMoveTo(8805, -3632)
	If GetAreaVanquished() = False Then AggroMoveTo(11484, -6221)
	If GetAreaVanquished() = False Then AggroMoveTo(13149, -2097)
	If GetAreaVanquished() = False Then AggroMoveTo(14287, -5855)
	If GetAreaVanquished() = False Then AggroMoveTo(15322, -4908)
	If GetAreaVanquished() = False Then AggroMoveTo(19111, -7402)
	If GetAreaVanquished() = False Then AggroMoveTo(15320, -4921)
	If GetAreaVanquished() = False Then AggroMoveTo(14467, -1528)
	If GetAreaVanquished() = False Then AggroMoveTo(13925, -184)
	If GetAreaVanquished() = False Then AggroMoveTo(13783, 170)
	If GetAreaVanquished() = False Then AggroMoveTo(13386, 1320)
	If GetAreaVanquished() = False Then AggroMoveTo(14042, 1574)
	If GetAreaVanquished() = False Then AggroMoveTo(12857, 1127)
	If GetAreaVanquished() = False Then AggroMoveTo(13383, 1318)
	If GetAreaVanquished() = False Then AggroMoveTo(13789, 167)
	If GetAreaVanquished() = False Then AggroMoveTo(13929, -179)
	If GetAreaVanquished() = False Then AggroMoveTo(14470, -1522)
	If GetAreaVanquished() = False Then AggroMoveTo(17470, -1816)
	If GetAreaVanquished() = False Then AggroMoveTo(16252, -1572)
	If GetAreaVanquished() = False Then AggroMoveTo(16865, 420)
	If GetAreaVanquished() = False Then AggroMoveTo(18193, -269)
	If GetAreaVanquished() = False Then AggroMoveTo(20129, -1760)
	If GetAreaVanquished() = False Then AggroMoveTo(20192, 1033)
	If GetAreaVanquished() = False Then AggroMoveTo(18986, 937)
	If GetAreaVanquished() = False Then AggroMoveTo(20319, 2048)
	If GetAreaVanquished() = False Then AggroMoveTo(18129, 2842)
	If GetAreaVanquished() = False Then AggroMoveTo(20256, 3604)
	If GetAreaVanquished() = False Then AggroMoveTo(21113, 4524)
	If GetAreaVanquished() = False Then AggroMoveTo(21272, 6143)
	If GetAreaVanquished() = False Then AggroMoveTo(22541, 4683)
	If GetAreaVanquished() = False Then AggroMoveTo(21779, 2461)
	If GetAreaVanquished() = False Then AggroMoveTo(21522, -3238)
EndFunc

