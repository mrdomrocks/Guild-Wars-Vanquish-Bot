#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aAscalonFoothillsTransitPath[143][2] = [ _
	[9115, 3364], _
	[8221, 1462], _
	[8291, 559], _
	[8223, -527], _
	[9528, -542], _
	[10776, -1126], _
	[11111, -1738], _
	[11147, -2830], _
	[10425, -5001], _
	[10059, -6129], _
	[9358, -6423], _
	[10258, -6092], _
	[10763, -7505], _
	[10268, -8689], _
	[9981, -9551], _
	[9889, -11642], _
	[10903, -12906], _
	[9966, -13633], _
	[8986, -14607], _
	[7324, -14312], _
	[6071, -16143], _
	[4543, -16854], _
	[3525, -16495], _
	[2909, -15337], _
	[1082, -14500], _
	[-407, -15038], _
	[-943, -15794], _
	[-1462, -16279], _
	[-2352, -15878], _
	[-3277, -13605], _
	[-3720, -12677], _
	[-4473, -12656], _
	[-5440, -12468], _
	[-6623, -12415], _
	[-8561, -12924], _
	[-8294, -10124], _
	[-7126, -12263], _
	[-4076, -12685], _
	[-2736, -12960], _
	[-2113, -13053], _
	[-453, -12095], _
	[1137, -11354], _
	[2243, -11110], _
	[3186, -11469], _
	[3438, -13186], _
	[3537, -12045], _
	[3126, -10478], _
	[3708, -8655], _
	[3797, -8484], _
	[4366, -7644], _
	[5707, -7092], _
	[8125, -6838], _
	[5784, -7125], _
	[3779, -7956], _
	[2648, -7208], _
	[2227, -6548], _
	[2509, -5471], _
	[3046, -4523], _
	[3934, -3300], _
	[2875, -3089], _
	[2677, -7881], _
	[1887, -9645], _
	[1181, -10908], _
	[2118, -8972], _
	[2341, -5673], _
	[2983, -4019], _
	[1810, -2472], _
	[884, -1855], _
	[111, -1396], _
	[-1278, -2335], _
	[-1263, -3705], _
	[-1561, -4779], _
	[-1872, -5466], _
	[-2274, -3449], _
	[-1138, -716], _
	[-1772, -580], _
	[-2949, -453], _
	[-3302, 1000], _
	[-3023, 1910], _
	[-2622, 3427], _
	[-2822, 4546], _
	[-2313, 7012], _
	[-3562, 9802], _
	[-3493, 11078], _
	[-5957, 13347], _
	[-6591, 13298], _
	[-6982, 15588], _
	[-6183, 16100], _
	[-6096, 16273], _
	[-4211, 17421], _
	[-1700, 15845], _
	[-1357, 15090], _
	[-615, 14848], _
	[-229, 14678], _
	[81, 15350], _
	[1322, 13323], _
	[619, 13037], _
	[170, 12932], _
	[-1375, 12607], _
	[1154, 13292], _
	[-1135, 14698], _
	[-2401, 16860], _
	[-3087, 16572], _
	[-5164, 16625], _
	[-6344, 16119], _
	[-6914, 15610], _
	[-6929, 13988], _
	[-9526, 12484], _
	[-6936, 13667], _
	[-6027, 13584], _
	[-3783, 11258], _
	[-2455, 10313], _
	[-1043, 9237], _
	[-729, 8434], _
	[-364, 7531], _
	[622, 7710], _
	[1419, 7177], _
	[1915, 6879], _
	[2784, 6803], _
	[4393, 6862], _
	[2838, 6222], _
	[2922, 5106], _
	[2600, 3896], _
	[1954, 2479], _
	[2103, 1407], _
	[2585, -613], _
	[2864, -1392], _
	[3449, -2222], _
	[5075, -2158], _
	[6501, -2138], _
	[8384, -897], _
	[10917, -1369], _
	[11097, -3462], _
	[10556, -5401], _
	[10667, -7309], _
	[10136, -9342], _
	[10125, -11182], _
	[10551, -12572], _
	[10282, -13427], _
	[8938, -14476], _
	[9243, -15713], _
	[9755, -16879], _
	[10843, -17072] _
]

Func GoOutAscalonFoothills()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $AscalonFoothills_Map Then Return

	If $l_i_Map = $AscalonFoothills_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		_Vanquisher_ApplyTravelersValeConsumables()
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Traveler's Vale -> AscalonFoothills")
		_Vanquisher_RunAggroPortalPath($aAscalonFoothillsTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQAscalonFoothills()
	If GetMapID() <> $AscalonFoothills_Map And GetMapID() <> $AscalonFoothills_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("AscalonFoothills route waiting - on map " & GetMapID() & ", need " & $AscalonFoothills_Map & " via Traveler's Vale.")
		Return
	EndIf

	If GetMapID() = $AscalonFoothills_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutAscalonFoothills()
		If GetMapID() <> $AscalonFoothills_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need AscalonFoothills (" & $AscalonFoothills_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $AscalonFoothills_Map Then
		CurrentAction("AscalonFoothills route waiting - on map " & GetMapID() & ", need " & $AscalonFoothills_Map & ".")
		Return
	EndIf

	CurrentAction("Starting AscalonFoothills vanquish route.")

	Local $aWaypoints[14][4] = [ _
		[-5785, 1558, " ", $vqrange], _
		[-2684, 2006, " ", $vqrange], _
		[-5544, -1613, " ", $vqrange], _
		[-3428, -5729, " ", $vqrange], _
		[373, -3274, " ", $vqrange], _
		[-3156, -2098, " ", $vqrange], _
		[-1639, 751, " ", $vqrange], _
		[621, -735, " ", $vqrange], _
		[2040, 2078, " ", $vqrange], _
		[240, 5077, " ", $vqrange], _
		[4885, 5096, " ", $vqrange], _
		[5939, 1126, " ", $vqrange], _
		[3321, -3531, " ", $vqrange], _
		[7394, -6932, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
