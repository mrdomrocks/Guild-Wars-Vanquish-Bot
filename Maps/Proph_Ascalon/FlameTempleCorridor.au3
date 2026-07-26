#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFlameTempleCorridorTransitPath[13][2] = [ _
	[3071, 13038], _
	[4060, 14711], _
	[5827, 15815], _
	[7552, 15350], _
	[11026, 16534], _
	[13413, 16545], _
	[14862, 14674], _
	[14696, 13229], _
	[17052, 14409], _
	[19976, 15169], _
	[21502, 16356], _
	[21419, 17256], _
	[21411, 17437] _
]

Func GoOutFlameTempleCorridor()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $FlameTempleCorridor_Map Then Return

	If $l_i_Map = $FlameTempleCorridor_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("DiessaLowlands -> FlameTempleCorridor")
		_Vanquisher_RunAggroPortalPath($aFlameTempleCorridorTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQFlameTempleCorridor()
	If GetMapID() <> $FlameTempleCorridor_Map And GetMapID() <> $FlameTempleCorridor_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("FlameTempleCorridor route waiting - on map " & GetMapID() & ", need " & $FlameTempleCorridor_Map & " via Diessa Lowlands.")
		Return
	EndIf

	If GetMapID() = $FlameTempleCorridor_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutFlameTempleCorridor()
		If GetMapID() <> $FlameTempleCorridor_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need FlameTempleCorridor (" & $FlameTempleCorridor_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $FlameTempleCorridor_Map Then
		CurrentAction("FlameTempleCorridor route waiting - on map " & GetMapID() & ", need " & $FlameTempleCorridor_Map & ".")
		Return
	EndIf

	CurrentAction("Starting FlameTempleCorridor vanquish route.")

	Local $aWaypoints[45][4] = [ _
		[-18448, -11278, " ", $vqrange], _
		[-19523, -8452, " ", $vqrange], _
		[-17298, -5976, " ", $vqrange], _
		[-16657, -4503, " ", $vqrange], _
		[-16531, -3652, " ", $vqrange], _
		[-16808, -3391, " ", $vqrange], _
		[-18534, -1989, " ", $vqrange], _
		[-19133, -2480, " ", $vqrange], _
		[-18534, -1989, " ", $vqrange], _
		[-16808, -3391, " ", $vqrange], _
		[-16531, -3652, " ", $vqrange], _
		[-16315, -4578, " ", $vqrange], _
		[-16167, -6465, " ", $vqrange], _
		[-15235, -7517, " ", $vqrange], _
		[-14899, -8035, " ", $vqrange], _
		[-13857, -9107, " ", $vqrange], _
		[-12983, -8753, " ", $vqrange], _
		[-11863, -6401, " ", $vqrange], _
		[-11669, -4432, " ", $vqrange], _
		[-10411, -4387, " ", $vqrange], _
		[-11228, -2247, " ", $vqrange], _
		[-8600, -3114, " ", $vqrange], _
		[-8045, -4392, " ", $vqrange], _
		[-6407, -2886, " ", $vqrange], _
		[-8426, -4766, " ", $vqrange], _
		[-7147, -1130, " ", $vqrange], _
		[-4804, -1469, " ", $vqrange], _
		[-4528, -3762, " ", $vqrange], _
		[-6297, -5441, " ", $vqrange], _
		[-6322, -7133, " ", $vqrange], _
		[-7358, -7061, " ", $vqrange], _
		[-8074, -6424, " ", $vqrange], _
		[-10037, -7547, " ", $vqrange], _
		[-8895, -9545, " ", $vqrange], _
		[-8074, -10340, " ", $vqrange], _
		[-7931, -9197, " ", $vqrange], _
		[-6145, -9120, " ", $vqrange], _
		[-5153, -11967, " ", $vqrange], _
		[-5987, -14539, " ", $vqrange], _
		[-9011, -15721, " ", $vqrange], _
		[-10509, -14685, " ", $vqrange], _
		[-9611, -12759, " ", $vqrange], _
		[-9303, -12518, " ", $vqrange], _
		[-10359, -9564, " ", $vqrange], _
		[-11546, -9365, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
