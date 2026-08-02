Global $aCaravan_Ascalon_CaravanAscalon_FlameTempleCorridorRoute01[45][2] = [ _
        [-18448, -11278], _
        [-19523, -8452], _
        [-17298, -5976], _
        [-16657, -4503], _
        [-16531, -3652], _
        [-16808, -3391], _
        [-18534, -1989], _
        [-19133, -2480], _
        [-18534, -1989], _
        [-16808, -3391], _
        [-16531, -3652], _
        [-16315, -4578], _
        [-16167, -6465], _
        [-15235, -7517], _
        [-14899, -8035], _
        [-13857, -9107], _
        [-12983, -8753], _
        [-11863, -6401], _
        [-11669, -4432], _
        [-10411, -4387], _
        [-11228, -2247], _
        [-8600, -3114], _
        [-8045, -4392], _
        [-6407, -2886], _
        [-8426, -4766], _
        [-7147, -1130], _
        [-4804, -1469], _
        [-4528, -3762], _
        [-6297, -5441], _
        [-6322, -7133], _
        [-7358, -7061], _
        [-8074, -6424], _
        [-10037, -7547], _
        [-8895, -9545], _
        [-8074, -10340], _
        [-7931, -9197], _
        [-6145, -9120], _
        [-5153, -11967], _
        [-5987, -14539], _
        [-9011, -15721], _
        [-10509, -14685], _
        [-9611, -12759], _
        [-9303, -12518], _
        [-10359, -9564], _
        [-11546, -9365] _
]

Global $aCaravan_Ascalon_CaravanAscalon_FlameTempleCorridorRoute02[45][2] = [ _
        [-11546, -9365], _
        [-10359, -9564], _
        [-9303, -12518], _
        [-9611, -12759], _
        [-10509, -14685], _
        [-9011, -15721], _
        [-5987, -14539], _
        [-5153, -11967], _
        [-6145, -9120], _
        [-7931, -9197], _
        [-8074, -10340], _
        [-8895, -9545], _
        [-10037, -7547], _
        [-8074, -6424], _
        [-7358, -7061], _
        [-6322, -7133], _
        [-6297, -5441], _
        [-4528, -3762], _
        [-4804, -1469], _
        [-7147, -1130], _
        [-8426, -4766], _
        [-6407, -2886], _
        [-8045, -4392], _
        [-8600, -3114], _
        [-11228, -2247], _
        [-10411, -4387], _
        [-11669, -4432], _
        [-11863, -6401], _
        [-12983, -8753], _
        [-13857, -9107], _
        [-14899, -8035], _
        [-15235, -7517], _
        [-16167, -6465], _
        [-16315, -4578], _
        [-16531, -3652], _
        [-16808, -3391], _
        [-18534, -1989], _
        [-19133, -2480], _
        [-18534, -1989], _
        [-16808, -3391], _
        [-16531, -3652], _
        [-16657, -4503], _
        [-17298, -5976], _
        [-19523, -8452], _
        [-18448, -11278] _
]

Func GoOutCaravanAscalon_FlameTempleCorridor()
        _Vanquisher_RunDynamicCaravanGoOut($FlameTempleCorridor_Map, "FlameTempleCorridor")
EndFunc

Func VQCaravanAscalon_FlameTempleCorridor()
	If GetMapID() <> $FlameTempleCorridor_Map And GetMapID() <> $FlameTempleCorridor_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("FlameTempleCorridor route waiting - on map " & GetMapID() & ", need " & $FlameTempleCorridor_Map & " via Diessa Lowlands.")
		Return
	EndIf

	If GetMapID() = $FlameTempleCorridor_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_FlameTempleCorridor()
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


	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_FlameTempleCorridorRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aCaravan_Ascalon_CaravanAscalon_FlameTempleCorridorRoute02)
EndFunc
