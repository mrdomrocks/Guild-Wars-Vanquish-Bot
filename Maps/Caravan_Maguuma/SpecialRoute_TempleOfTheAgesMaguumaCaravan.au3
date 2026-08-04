#include-once

; Explicit Maguuma caravan runner.
; Strategy: for each map TravelTo(outpost) -> GoOut until on map -> vanquish coords -> resign.
; Do not stay-in-explorable / dynamic portal catch-up between maps. Maguuma is not one
; continuous portal spine (breaks after MajestysRest and after TheFalls).

Func _Vanquisher_BeginMaguumaCaravanRun()
    If $g_b_Vanquisher_CombinedMaguumaCaravanActive Then Return
    _Vanquisher_InitMaguumaCaravanPlan()
    $g_b_Vanquisher_CombinedMaguumaCaravanActive = True
    $g_i_Vanquisher_CombinedMaguumaStage = 0
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_AbortRoute = False
    _Vanquisher_ResetGoOutRouteProgress()
    CurrentAction("Starting TOA Maguuma caravan (travel -> GoOut -> vanquish -> resign).")
EndFunc

Func _Vanquisher_EndMaguumaCaravanRun($bFinishRun = False)
    $g_b_Vanquisher_CombinedMaguumaCaravanActive = False
    $g_i_Vanquisher_CombinedMaguumaStage = 0
    _Vanquisher_ResetGoOutRouteProgress()
    If $bFinishRun Then _Vanquisher_FinishRun()
EndFunc

Func _Vanquisher_MaguumaCaravanEnsureOutpost($iOutpostID, $sLabel)
    If $iOutpostID <= 0 Then Return False
    If GetMapID() = $iOutpostID Then Return True
    If Map_GetInstanceInfo("IsExplorable") Then
        CurrentAction("Resigning before travel to " & $sLabel & " outpost.")
        If Not _Vanquisher_ReturnToOutpost() Then Return False
    EndIf
    If GetMapID() = $iOutpostID Then Return True
    _Vanquisher_ResetGoOutRouteProgress()
    CurrentAction("Traveling to outpost for " & $sLabel & ".")
    TravelTo($iOutpostID)
    Return GetMapID() = $iOutpostID
EndFunc

Func _Vanquisher_MaguumaCaravanGoOutToMap($iStage)
    Local $iTargetMap = $g_a_MaguumaCaravanPlan[$iStage][0]
    Local $iOutpost = $g_a_MaguumaCaravanPlan[$iStage][1]
    Local $sGoOutFunc = $g_a_MaguumaCaravanPlan[$iStage][5]
    Local $sLabel = $g_a_MaguumaCaravanPlan[$iStage][8]
    Local $iCurrent = GetMapID()

    If $iCurrent = $iTargetMap Then Return True

    If Not _Vanquisher_IsMaguumaCaravanEntryMap($iCurrent, $iStage) Then
        If Not _Vanquisher_MaguumaCaravanEnsureOutpost($iOutpost, $sLabel) Then Return False
        $iCurrent = GetMapID()
    EndIf

    If $iCurrent = $iTargetMap Then Return True

    If _Vanquisher_IsMaguumaCaravanEntryMap($iCurrent, $iStage) And $iCurrent <> $iTargetMap Then
        _Vanquisher_ApplyDifficulty()
        CurrentAction("Maguuma caravan GoOut: " & $sLabel & " (map " & $iCurrent & " -> " & $iTargetMap & ").")
        If $sGoOutFunc <> "" Then Call($sGoOutFunc)
    EndIf

    Return GetMapID() = $iTargetMap
EndFunc

Func _Vanquisher_MaguumaCaravanRunVanquish($iStage)
    Local $sLabel = $g_a_MaguumaCaravanPlan[$iStage][8]
    CurrentAction("Starting " & $sLabel & " vanquish route (" & ($iStage + 1) & "/" & $GC_I_MAGUUMA_CARAVAN_MAP_COUNT & ").")

    Switch $iStage
        Case 0
            _Vanquisher_RunCaravanRoute($aProph_Kryta_TalmarkWildernessRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Kryta_TalmarkWildernessRoute02)
        Case 1
            _Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Kryta_MajestysRestRoute02)
        Case 2
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_SageLandsRoute02)
        Case 3
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_MamnoonLagoonRoute02)
        Case 4
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_SilverwoodRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_SilverwoodRoute02)
        Case 5
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_EttinsBackRoute02)
        Case 6
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_ReedBogRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_ReedBogRoute02)
        Case 7
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_TheFallsRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_TheFallsRoute02)
        Case 8
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_DryTopRoute02)
        Case 9
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute01)
            _Vanquisher_RunCaravanRoute($aProph_Maguuma_TangleRootRoute02)
    EndSwitch
EndFunc

Func _Vanquisher_MaguumaCaravanAdvanceAfterVanquish($iStage)
    Local $sLabel = $g_a_MaguumaCaravanPlan[$iStage][8]
    Local $iTargetMap = $g_a_MaguumaCaravanPlan[$iStage][0]

    If GetMapID() <> $iTargetMap Then
        CurrentAction("Left " & $sLabel & " before vanquish finished - will re-enter.")
        _Vanquisher_ResetGoOutRouteProgress()
        Return False
    EndIf

    UpdateVanquish()
    If Not GetAreaVanquished() Then
        CurrentAction($sLabel & " route finished but area not vanquished yet - retrying route.")
        Return False
    EndIf

    CurrentAction($sLabel & " vanquished (" & GetFoesKilled() & " killed). Resigning for next map.")
    _Vanquisher_ReturnToOutpost()
    _Vanquisher_ResetGoOutRouteProgress()
    $g_i_Vanquisher_CombinedMaguumaStage = $iStage + 1

    If $g_i_Vanquisher_CombinedMaguumaStage >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then
        CurrentAction("TOA Maguuma caravan complete.")
        _Vanquisher_EndMaguumaCaravanRun(True)
        Return True
    EndIf

    CurrentAction("Maguuma caravan next: " & $g_a_MaguumaCaravanPlan[$g_i_Vanquisher_CombinedMaguumaStage][8] & _
            " (" & ($g_i_Vanquisher_CombinedMaguumaStage + 1) & "/" & $GC_I_MAGUUMA_CARAVAN_MAP_COUNT & ").")
    Return True
EndFunc

Func _Vanquisher_RunMaguumaCaravanStage()
    If _Vanquisher_ShouldStop() Then Return True
    _Vanquisher_InitMaguumaCaravanPlan()

    Local $iStage = $g_i_Vanquisher_CombinedMaguumaStage
    If $iStage < 0 Or $iStage >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then
        _Vanquisher_EndMaguumaCaravanRun(True)
        Return True
    EndIf

    Local $iTargetMap = $g_a_MaguumaCaravanPlan[$iStage][0]
    Local $sLabel = $g_a_MaguumaCaravanPlan[$iStage][8]

    If Not _Vanquisher_MaguumaCaravanGoOutToMap($iStage) Then
        CurrentAction("Routing - on map " & GetMapID() & ", need " & $sLabel & " (" & $iTargetMap & ").")
        Return True
    EndIf

    If GetMapID() <> $iTargetMap Then
        CurrentAction($sLabel & " route waiting - on map " & GetMapID() & ", need " & $iTargetMap & ".")
        Return True
    EndIf

    _Vanquisher_MaguumaCaravanRunVanquish($iStage)
    If _Vanquisher_ShouldStop() Or $g_b_Vanquisher_AbortRoute Or $g_b_Vanquisher_RunFinished Then Return True

    _Vanquisher_MaguumaCaravanAdvanceAfterVanquish($iStage)
    Return True
EndFunc

Func VQSpecialRoute_TempleOfTheAgesMaguumaCaravan()
    _Vanquisher_BeginMaguumaCaravanRun()
    _Vanquisher_RunMaguumaCaravanStage()
EndFunc
