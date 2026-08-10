;Mapped by Crux, updated by Incognito
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aMamnoonLagoonOutpostPath[4][2] = [ _
	[1692, -2650], _
	[2013, -2216], _
	[1691, -2667], _
	[1950, -2315]
]

Global $aMamnoonLagoonTransitPath[15][2] = [ _
	[2384, -1697], _
	[3673, 525], _
	[5150, 2644], _
	[7357, 3959], _
	[7914, 6488], _
	[7130, 8915], _
	[6393, 11377], _
	[6191, 13960], _
	[8176, 15526], _
	[10709, 15812], _
	[13129, 16739], _
	[15137, 15124], _
	[16834, 13262], _
	[17163, 13225], _
 	[17391, 13256] _
]

Global $aProph_Maguuma_MamnoonLagoonRoute01[115][2] = [ _
        [-6363, -5190], _
        [-5201, -2844], _
        [-4173, -512], _
        [-2301, 1258], _
        [-2598, 3819], _
        [-1594, 3867], _
        [-1274, 1374], _
        [-1964, -1108], _
        [-1898, -3680], _
        [-529, -5780], _
        [1962, -6355], _
        [-576, -6729], _
        [-2353, -6877], _
        [168, -6488], _
        [1932, -4710], _
        [4309, -5734], _
        [5877, -3750], _
        [5744, -1158], _
        [4281, 963], _
        [3573, 3385], _
        [4207, 5824], _
        [6444, 7160], _
        [7147, 4948], _
        [6786, 7237], _
        [4711, 5810], _
        [2240, 5264], _
        [-24, 6356], _
        [-2592, 6615], _
        [-5051, 5817], _
        [-7118, 4306], _
        [-7450, 3475], _
        [-7329, 5997], _
        [-4763, 5921], _
        [-2273, 6167], _
        [-2544, 3657], _
        [-3085, 1120], _
        [-4954, -1414], _
        [-3660, -1], _
        [-3166, 1007], _
        [-2839, 2207], _
        [-3536, 3855], _
        [-2553, 3228], _
        [-1959, 1408], _
        [-978, 1903], _
        [-1349, 3002], _
        [-2225, 5157], _
        [-2384, 6261], _
        [-3158, 6609], _
        [-7069, 4816], _
        [-2734, 6786], _
        [-1646, 6377], _
        [307, 6038], _
        [1399, 5664], _
        [2889, 5225], _
        [3665, 4986], _
        [4501, 5508], _
        [6861, 7507], _
        [4547, 5694], _
        [3710, 4874], _
        [3441, 4550], _
        [2913, 2919], _
        [3813, 1316], _
        [4027, 978], _
        [5204, -1001], _
        [5217, -3474], _
        [4609, -4155], _
        [3984, -4970], _
        [2726, -4867], _
        [2612, -4865], _
        [727, -5686], _
        [-880, -6665], _
        [-379, -6476], _
        [-1818, -5119], _
        [-1911, -4077], _
        [-1849, -2155], _
        [-2356, 852], _
        [-2590, 2772], _
        [-2461, 3931], _
        [-1796, 3880], _
        [-1455, 2414], _
        [-1430, 1245], _
        [-1653, -286], _
        [-1868, -1350], _
        [-1836, -3682], _
        [-1792, -4834], _
        [-733, -5717], _
        [393, -6044], _
        [2220, -6112], _
        [4115, -4790], _
        [4715, -3795], _
        [5062, -1589], _
        [5379, -2602], _
        [4776, -3317], _
        [5201, -1528], _
        [4482, 129], _
        [3982, 1601], _
        [3023, 4135], _
        [2340, 5044], _
        [167, 5877], _
        [-2009, 5967], _
        [-2433, 4570], _
        [-2515, 3034], _
        [-2380, 1530], _
        [-2545, 1793], _
        [2757, -1170], _
        [4836, 2597], _
        [7570, 4470], _
        [7950, 7804], _
        [6520, 9733], _
        [6331, 15284], _
        [11355, 15759], _
        [14292, 16691], _
        [15887, 13608], _
        [17008, 13261], _
        [18066, 13453] _
]

Global $aProph_Maguuma_MamnoonLagoonRoute02[115][2] = [ _
        [18066, 13453], _
        [17008, 13261], _
        [15887, 13608], _
        [14292, 16691], _
        [11355, 15759], _
        [6331, 15284], _
        [6520, 9733], _
        [7950, 7804], _
        [7570, 4470], _
        [4836, 2597], _
        [2757, -1170], _
        [-2545, 1793], _
        [-2380, 1530], _
        [-2515, 3034], _
        [-2433, 4570], _
        [-2009, 5967], _
        [167, 5877], _
        [2340, 5044], _
        [3023, 4135], _
        [3982, 1601], _
        [4482, 129], _
        [5201, -1528], _
        [4776, -3317], _
        [5379, -2602], _
        [5062, -1589], _
        [4715, -3795], _
        [4115, -4790], _
        [2220, -6112], _
        [393, -6044], _
        [-733, -5717], _
        [-1792, -4834], _
        [-1836, -3682], _
        [-1868, -1350], _
        [-1653, -286], _
        [-1430, 1245], _
        [-1455, 2414], _
        [-1796, 3880], _
        [-2461, 3931], _
        [-2590, 2772], _
        [-2356, 852], _
        [-1849, -2155], _
        [-1911, -4077], _
        [-1818, -5119], _
        [-379, -6476], _
        [-880, -6665], _
        [727, -5686], _
        [2612, -4865], _
        [2726, -4867], _
        [3984, -4970], _
        [4609, -4155], _
        [5217, -3474], _
        [5204, -1001], _
        [4027, 978], _
        [3813, 1316], _
        [2913, 2919], _
        [3441, 4550], _
        [3710, 4874], _
        [4547, 5694], _
        [6861, 7507], _
        [4501, 5508], _
        [3665, 4986], _
        [2889, 5225], _
        [1399, 5664], _
        [307, 6038], _
        [-1646, 6377], _
        [-2734, 6786], _
        [-7069, 4816], _
        [-3158, 6609], _
        [-2384, 6261], _
        [-2225, 5157], _
        [-1349, 3002], _
        [-978, 1903], _
        [-1959, 1408], _
        [-2553, 3228], _
        [-3536, 3855], _
        [-2839, 2207], _
        [-3166, 1007], _
        [-3660, -1], _
        [-4954, -1414], _
        [-3085, 1120], _
        [-2544, 3657], _
        [-2273, 6167], _
        [-4763, 5921], _
        [-7329, 5997], _
        [-7450, 3475], _
        [-7118, 4306], _
        [-5051, 5817], _
        [-2592, 6615], _
        [-24, 6356], _
        [2240, 5264], _
        [4711, 5810], _
        [6786, 7237], _
        [7147, 4948], _
        [6444, 7160], _
        [4207, 5824], _
        [3573, 3385], _
        [4281, 963], _
        [5744, -1158], _
        [5877, -3750], _
        [4309, -5734], _
        [1932, -4710], _
        [168, -6488], _
        [-2353, -6877], _
        [-576, -6729], _
        [1962, -6355], _
        [-529, -5780], _
        [-1898, -3680], _
        [-1964, -1108], _
        [-1274, 1374], _
        [-1594, 3867], _
        [-2598, 3819], _
        [-2301, 1258], _
        [-4173, -512], _
        [-5201, -2844], _
        [-6363, -5190] _
]

Func GoOutMamnoonLagoon()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $MamnoonLagoon_Map Then Return
	If $l_i_Map = $MamnoonLagoon_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> MamnoonLagoon (portal 1)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonOutpostPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
	If $l_i_Map = $MamnoonLagoon_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MamnoonLagoon (portal 2)")
		_Vanquisher_RunAggroPortalPath($aMamnoonLagoonTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
	If $l_i_Map = $MamnoonLagoon_Transit2 Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> MamnoonLagoon (Sage Lands portal)")
		_Vanquisher_RunDynamicCaravanGoOut($MamnoonLagoon_Map, "MamnoonLagoon")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQMamnoonLagoon()
	If GetMapID() <> $MamnoonLagoon_Map And GetMapID() <> $MamnoonLagoon_Outpost And GetMapID() <> $MamnoonLagoon_Transit And GetMapID() <> $MamnoonLagoon_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for MamnoonLagoon.")
		TravelTo($MamnoonLagoon_Outpost)
	EndIf
	If GetMapID() = $MamnoonLagoon_Outpost Or GetMapID() = $MamnoonLagoon_Transit Or GetMapID() = $MamnoonLagoon_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutMamnoonLagoon()
		If GetMapID() <> $MamnoonLagoon_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need MamnoonLagoon (" & $MamnoonLagoon_Map & ").")
			Return
	EndIf
	EndIf
	If GetMapID() <> $MamnoonLagoon_Map Then
		CurrentAction("MamnoonLagoon route waiting - on map " & GetMapID() & ", need " & $MamnoonLagoon_Map & ".")
		Return
	EndIf
	CurrentAction("Starting MamnoonLagoon vanquish route.")

	_Vanquisher_RunVanquishRoute($aProph_Maguuma_MamnoonLagoonRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Maguuma_MamnoonLagoonRoute02)
EndFunc
