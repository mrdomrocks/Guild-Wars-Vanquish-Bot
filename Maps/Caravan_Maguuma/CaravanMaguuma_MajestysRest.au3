; Route coordinates shared with the standard vanquish map script.

Func GoOutCaravanMaguuma_MajestysRest()
        _Vanquisher_RunDynamicCaravanGoOut($MajestysRest_Map, "MajestysRest")
EndFunc

Func VQCaravanMaguuma_MajestysRest()
       If _Vanquisher_IsCombinedMaguumaCaravanActive() Then
               If GetMapID() <> $MajestysRest_Map Then
                       _Vanquisher_ApplyDifficulty()
                       GoOutCaravanMaguuma_MajestysRest()
                       If GetMapID() <> $MajestysRest_Map Then
                               CurrentAction("Routing - on map " & GetMapID() & ", need MajestysRest (" & $MajestysRest_Map & ").")
                               Return
                       EndIf
               EndIf
       Else
               If GetMapID() <> $MajestysRest_Map And GetMapID() <> $MajestysRest_Outpost And GetMapID() <> $MajestysRest_Transit And GetMapID() <> $MajestysRest_Transit2 Then
                       _Vanquisher_ResetGoOutRouteProgress()
                       CurrentAction("Traveling to outpost for MajestysRest.")
                       TravelTo($MajestysRest_Outpost)
               EndIf

               If GetMapID() = $MajestysRest_Outpost Or GetMapID() = $MajestysRest_Transit Or GetMapID() = $MajestysRest_Transit2 Then
                       _Vanquisher_ApplyDifficulty()
                       GoOutCaravanMaguuma_MajestysRest()
                       If GetMapID() <> $MajestysRest_Map Then
                               CurrentAction("Routing - on map " & GetMapID() & ", need MajestysRest (" & $MajestysRest_Map & ").")
                               Return
                       EndIf
               EndIf
       EndIf

	If GetMapID() <> $MajestysRest_Map Then
		CurrentAction("MajestysRest route waiting - on map " & GetMapID() & ", need " & $MajestysRest_Map & ".")
		Return
	EndIf

	CurrentAction("Starting MajestysRest vanquish route.")


	_Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute01)

	; reverse
	_Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute02)
EndFunc
