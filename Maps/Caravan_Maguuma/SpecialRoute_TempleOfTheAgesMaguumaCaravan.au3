Func _Vanquisher_BeginCombinedMaguumaCaravan()
    If $g_b_Vanquisher_CombinedMaguumaCaravanActive Then Return
    $g_b_Vanquisher_CombinedMaguumaCaravanActive = True
    $g_i_Vanquisher_CombinedMaguumaStage = 0
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_AbortRoute = False
    _Vanquisher_ResetGoOutRouteProgress()
    CurrentAction("Starting TOA Maguuma caravan.")
EndFunc

Func _Vanquisher_EndCombinedMaguumaCaravan($bFinishRun = False)
    $g_b_Vanquisher_CombinedMaguumaCaravanActive = False
    $g_i_Vanquisher_CombinedMaguumaStage = 0
    _Vanquisher_ResetGoOutRouteProgress()
    If $bFinishRun Then _Vanquisher_FinishRun()
EndFunc

Func _Vanquisher_RunCombinedMaguumaStage($iStageIndex, $sStageLabel, $iTargetMapID, $sRouteFunc)
    If $g_i_Vanquisher_CombinedMaguumaStage <> $iStageIndex Then Return False

    CurrentAction("TOA Maguuma caravan " & ($iStageIndex + 1) & "/10: " & $sStageLabel & ".")
    Call($sRouteFunc)

    Local $iCallError = @error
    Local $iCallExtended = @extended
    If $iCallError = 0xDEAD And $iCallExtended = 0xBEEF Then
        _Log("Start failed: combined Maguuma caravan route function call failed for " & $sStageLabel & " (" & $sRouteFunc & ").")
        _Vanquisher_EndCombinedMaguumaCaravan(False)
        $g_b_Vanquisher_AbortRoute = True
        Return True
    EndIf

    If _Vanquisher_ShouldStop() Or $g_b_Vanquisher_AbortRoute Or $g_b_Vanquisher_RunFinished Then Return True
    If GetMapID() <> $iTargetMapID Then Return True

    $g_i_Vanquisher_CombinedMaguumaStage += 1
    _Vanquisher_ResetGoOutRouteProgress()
    If $g_i_Vanquisher_CombinedMaguumaStage >= 10 Then
        CurrentAction("TOA Maguuma caravan complete.")
        _Vanquisher_EndCombinedMaguumaCaravan(True)
    EndIf
    Return True
EndFunc

Func VQSpecialRoute_TempleOfTheAgesMaguumaCaravan()
    _Vanquisher_BeginCombinedMaguumaCaravan()

    If $g_i_Vanquisher_CombinedMaguumaStage = 0 Then
        If _Vanquisher_RunCombinedMaguumaStage(0, "TalmarkWilderness", $TalmarkWilderness_Map, "VQCaravanMaguuma_TalmarkWilderness") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 1 Then
        If _Vanquisher_RunCombinedMaguumaStage(1, "MajestysRest", $MajestysRest_Map, "VQCaravanMaguuma_MajestysRest") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 2 Then
        If _Vanquisher_RunCombinedMaguumaStage(2, "SageLands", $SageLands_Map, "VQCaravanMaguuma_SageLands") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 3 Then
        If _Vanquisher_RunCombinedMaguumaStage(3, "MamnoonLagoon", $MamnoonLagoon_Map, "VQCaravanMaguuma_MamnoonLagoon") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 4 Then
        If _Vanquisher_RunCombinedMaguumaStage(4, "Silverwood", $Silverwood_Map, "VQCaravanMaguuma_Silverwood") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 5 Then
        If _Vanquisher_RunCombinedMaguumaStage(5, "EttinsBack", $EttinsBack_Map, "VQCaravanMaguuma_EttinsBack") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 6 Then
        If _Vanquisher_RunCombinedMaguumaStage(6, "ReedBog", $ReedBog_Map, "VQCaravanMaguuma_ReedBog") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 7 Then
        If _Vanquisher_RunCombinedMaguumaStage(7, "TheFalls", $TheFalls_Map, "VQCaravanMaguuma_TheFalls") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 8 Then
        If _Vanquisher_RunCombinedMaguumaStage(8, "DryTop", $DryTop_Map, "VQCaravanMaguuma_DryTop") Then Return
    EndIf
    If $g_i_Vanquisher_CombinedMaguumaStage = 9 Then
        If _Vanquisher_RunCombinedMaguumaStage(9, "TangleRoot", $TangleRoot_Map, "VQCaravanMaguuma_TangleRoot") Then Return
    EndIf

EndFunc
