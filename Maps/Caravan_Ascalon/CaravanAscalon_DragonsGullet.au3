; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanAscalon_DragonsGullet()
        _Vanquisher_RunDynamicCaravanGoOut($DragonsGullet_Map, "DragonsGullet")
EndFunc

Func VQCaravanAscalon_DragonsGullet()
	If GetMapID() <> $DragonsGullet_Map And GetMapID() <> $DragonsGullet_Transit And GetMapID() <> $DragonsGullet_Transit2 Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("DragonsGullet route waiting - on map " & GetMapID() & ", need " & $DragonsGullet_Map & " via Diessa Lowlands and Flame Temple Corridor.")
		Return
	EndIf

	If GetMapID() = $DragonsGullet_Transit Or GetMapID() = $DragonsGullet_Transit2 Then
		_Vanquisher_ApplyDifficulty()
		GoOutCaravanAscalon_DragonsGullet()
		If GetMapID() <> $DragonsGullet_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DragonsGullet (" & $DragonsGullet_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $DragonsGullet_Map Then
		CurrentAction("DragonsGullet route waiting - on map " & GetMapID() & ", need " & $DragonsGullet_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DragonsGullet vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Ascalon_DragonsGulletRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Ascalon_DragonsGulletRoute02)
EndFunc
