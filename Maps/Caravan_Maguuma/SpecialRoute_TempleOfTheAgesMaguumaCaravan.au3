#include-once

; Explicit Maguuma caravan runner.
; Strategy: for each map reach via portal (or TravelTo+GoOut fallback) -> vanquish coords
; -> portal to the next map. Continuous spine including MajestysRest -> SageLands -> Mamnoon.
; Southern split after TheFalls returns through EttinsBack to DryTop -> TangleRoot.
; Historically completed maps (from connect-time map scan) are skipped via portal routing.
; Resign/TravelTo only as stall recovery when no portal hop can be made.

Func _Vanquisher_BeginMaguumaCaravanRun()
    If $g_b_Vanquisher_CombinedMaguumaCaravanActive Then Return
    _Vanquisher_InitMaguumaCaravanPlan()
    $g_b_Vanquisher_CombinedMaguumaCaravanActive = True
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_AbortRoute = False
    _Vanquisher_ResetGoOutRouteProgress()

    Local $iFirst = _Vanquisher_MaguumaCaravanFirstIncompleteStage(0)
    Local $iSkipped = 0
    Local $sSkipped = ""
    Local $i = 0
    For $i = 0 To $iFirst - 1
        If $i >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then ExitLoop
        $iSkipped += 1
        If $sSkipped <> "" Then $sSkipped &= ", "
        $sSkipped &= $g_a_MaguumaCaravanPlan[$i][8]
    Next

    $g_i_Vanquisher_CombinedMaguumaStage = $iFirst

    If $iFirst >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then
        _Log("Maguuma caravan: all route maps already vanquished per map scan.")
        CurrentAction("TOA Maguuma caravan complete - all maps already vanquished.")
        Return
    EndIf

    Local $iProbeMap = Number($g_a_MaguumaCaravanPlan[0][0])
    Local $bProbeCached = False
    Local $bProbeLive = False
    If $iProbeMap > 0 Then
        If IsDeclared("g_aMapEntries") Then
            Local $p = 0
            For $p = 0 To UBound($g_aMapEntries) - 1
                If Number($g_aMapEntries[$p][4]) = $iProbeMap And $g_aMapEntries[$p][5] Then
                    $bProbeCached = True
                    ExitLoop
                EndIf
            Next
        EndIf
        If IsFunc("_Vanquisher_ReadLiveHistoryBitForMapId") Then
            $bProbeLive = _Vanquisher_ReadLiveHistoryBitForMapId($iProbeMap)
        EndIf
    EndIf
    _Log("Maguuma history probe: Talmark map " & $iProbeMap & _
            " cached=" & $bProbeCached & " liveBit=" & $bProbeLive & _
            " historyLoaded=" & $g_bVanquishHistoryLoaded & _
            " firstIncomplete=" & ($iFirst + 1) & "/" & $GC_I_MAGUUMA_CARAVAN_MAP_COUNT & ".")

    If $iSkipped > 0 Then
        _Log("Maguuma caravan: skipping " & $iSkipped & " historically completed map(s): " & $sSkipped & _
                ". Starting at " & $g_a_MaguumaCaravanPlan[$iFirst][8] & " (stage " & ($iFirst + 1) & "/" & $GC_I_MAGUUMA_CARAVAN_MAP_COUNT & ").")
        CurrentAction("Skipping completed maps; portaling to " & $g_a_MaguumaCaravanPlan[$iFirst][8] & ".")
    Else
        _Log("Maguuma caravan build: vanquish then portal to next map. First target: " & _
                $g_a_MaguumaCaravanPlan[$iFirst][8] & ".")
        CurrentAction("Starting TOA Maguuma caravan (portal between maps when possible).")
    EndIf
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

; Reach the stage map via shared portal path when already explorable; otherwise TravelTo+GoOut.
Func _Vanquisher_MaguumaCaravanGoOutToMap($iStage)
    Local $iTargetMap = $g_a_MaguumaCaravanPlan[$iStage][0]
    Local $iOutpost = $g_a_MaguumaCaravanPlan[$iStage][1]
    Local $sGoOutFunc = $g_a_MaguumaCaravanPlan[$iStage][5]
    Local $sLabel = $g_a_MaguumaCaravanPlan[$iStage][8]
    Local $iHop = 0

    While $iHop < 8 And Not _Vanquisher_ShouldStop()
        Local $iCurrent = GetMapID()
        If $iCurrent = $iTargetMap Then Return True

        ; Already in explorable: prefer dynamic portal catch-up (neighbor hops + Ettins backtrack).
        If Map_GetInstanceInfo("IsExplorable") Then
            If _TempleAscalonCaravanCanDirectTransition($iTargetMap) Then
                CurrentAction("Maguuma caravan portal hop " & ($iHop + 1) & ": " & $sLabel & _
                        " (map " & $iCurrent & " -> " & $iTargetMap & ").")
                Local $iBeforePortal = $iCurrent
                _Vanquisher_ApplyDifficulty()
                _TempleAscalonCaravanTryCatchUp($iTargetMap)
                If GetMapID() = $iTargetMap Then Return True
                If GetMapID() <> $iBeforePortal Then
                    $iHop += 1
                    ContinueLoop
                EndIf
            EndIf

            If _Vanquisher_IsMaguumaCaravanEntryMap($iCurrent, $iStage) Then
                Local $iBeforeGoOut = $iCurrent
                _Vanquisher_ApplyDifficulty()
                CurrentAction("Maguuma caravan GoOut hop " & ($iHop + 1) & ": " & $sLabel & _
                        " (map " & $iCurrent & " -> " & $iTargetMap & ").")
                If $sGoOutFunc <> "" Then Call($sGoOutFunc)
                If GetMapID() = $iTargetMap Then Return True
                If GetMapID() <> $iBeforeGoOut Then
                    $iHop += 1
                    ContinueLoop
                EndIf
                _Vanquisher_ResetGoOutRouteProgress()
            EndIf

            ; No usable portal spine from here — fall back to resign + TravelTo.
            If Not _Vanquisher_MaguumaCaravanEnsureOutpost($iOutpost, $sLabel) Then Return False
            $iHop += 1
            ContinueLoop
        EndIf

        ; Outpost / non-explorable: travel to the stage outpost then hardcoded GoOut.
        If Not _Vanquisher_IsMaguumaCaravanEntryMap($iCurrent, $iStage) Then
            If Not _Vanquisher_MaguumaCaravanEnsureOutpost($iOutpost, $sLabel) Then Return False
            $iCurrent = GetMapID()
            If $iCurrent = $iTargetMap Then Return True
        EndIf

        If Not _Vanquisher_IsMaguumaCaravanEntryMap($iCurrent, $iStage) Or $iCurrent = $iTargetMap Then ExitLoop

        Local $iBefore = $iCurrent
        _Vanquisher_ApplyDifficulty()
        CurrentAction("Maguuma caravan GoOut hop " & ($iHop + 1) & ": " & $sLabel & _
                " (map " & $iCurrent & " -> " & $iTargetMap & ").")
        If $sGoOutFunc <> "" Then Call($sGoOutFunc)

        If GetMapID() = $iTargetMap Then Return True
        If GetMapID() = $iBefore Then
            _Vanquisher_ResetGoOutRouteProgress()
            Return False
        EndIf
        $iHop += 1
    WEnd

    Return GetMapID() = $iTargetMap
EndFunc

; Settle after portal load and return True when this instance is already clear (0 foes left).
; History skip is preferred; this is a safety net so clear instances never walk farm arrays.
Func _Vanquisher_MaguumaCaravanIsVanquishedAfterLoad($sLabel)
    Local $iWait = 0
    Local $iRemaining = -1
    While $iWait < 25 And Not _Vanquisher_ShouldStop()
        $iRemaining = GetFoesToKill()
        If $iRemaining >= 0 Then ExitLoop
        Sleep(200)
        $iWait += 1
    WEnd

    ; Give the counter one more settle tick after it becomes readable.
    Sleep(400)
    UpdateVanquish()
    $iRemaining = GetFoesToKill()
    If _Vanquisher_IsAlreadyVanquishedOnEntry() Then
        CurrentAction($sLabel & " already clear in this instance (" & GetFoesKilled() & " killed, " & _
                $iRemaining & " remaining) - skipping coordinate arrays.")
        Return True
    EndIf

    Return False
EndFunc

Func _Vanquisher_MaguumaCaravanRunVanquish($iStage)
    Local $sLabel = $g_a_MaguumaCaravanPlan[$iStage][8]
    Local $iTargetMap = Number($g_a_MaguumaCaravanPlan[$iStage][0])

    ; GoOut portal approach can leave TransitOnly / stale combat state. Settle the farm map
    ; before walking vanquish coordinates so AggroMoveTo actually starts the array.
    $g_b_Vanquisher_TransitOnly = False
    Map_WaitMapIsLoaded()
    If GetMapID() <> $iTargetMap Then
        CurrentAction($sLabel & " vanquish aborted - on map " & GetMapID() & ", need " & $iTargetMap & ".")
        Return
    EndIf

    ; Never farm a map the history scan / live bitfield already marked complete.
    If _Vanquisher_MaguumaCaravanIsStageHistoricallyVanquished($iStage) Then
        CurrentAction($sLabel & " already vanquished per map scan - skipping coordinate arrays.")
        _Log("Maguuma caravan: " & $sLabel & " (map " & $iTargetMap & ") skipped by history - portal onward.")
        Return
    EndIf

    ; If this loaded instance is already clear, skip arrays; caller portals onward.
    If _Vanquisher_MaguumaCaravanIsVanquishedAfterLoad($sLabel) Then Return

    _Vanquisher_CacheCombatAIForCurrentMap(True)
    $g_b_Vanquisher_ConsumablesAppliedThisZone = False
    _Vanquisher_ApplyConsumablesOnFarmEntry()

    Local $aRoute01 = _Vanquisher_MaguumaCaravanRouteArray($iStage, 1)
    Local $aRoute02 = _Vanquisher_MaguumaCaravanRouteArray($iStage, 2)
    Local $iCount01 = 0
    Local $iCount02 = 0
    If IsArray($aRoute01) Then $iCount01 = UBound($aRoute01)
    If IsArray($aRoute02) Then $iCount02 = UBound($aRoute02)

    _Log("Maguuma caravan: farming " & $sLabel & " map " & $iTargetMap & _
            " (historyBit=" & _Vanquisher_ReadLiveHistoryBitForMapId($iTargetMap) & _
            ", foes " & GetFoesKilled() & "/" & GetFoesToKill() & ").")
    CurrentAction("Starting " & $sLabel & " vanquish route (" & ($iStage + 1) & "/" & $GC_I_MAGUUMA_CARAVAN_MAP_COUNT & ") - " & _
            $iCount01 & "+" & $iCount02 & " waypoints on map " & GetMapID() & ".")

    If $iCount01 < 1 And $iCount02 < 1 Then
        CurrentAction($sLabel & " has no vanquish coordinate arrays loaded.")
        Return
    EndIf

    If $iCount01 > 0 Then _Vanquisher_RunCaravanRoute($aRoute01)
    If _Vanquisher_ShouldStop() Or $g_b_Vanquisher_AbortRoute Then Return
    If $iCount02 > 0 Then _Vanquisher_RunCaravanRoute($aRoute02)
EndFunc

Func _Vanquisher_MaguumaCaravanRouteArray($iStage, $iPass)
    Switch $iStage
        Case 0
            If $iPass = 1 Then Return $aProph_Kryta_TalmarkWildernessRoute01
            Return $aProph_Kryta_TalmarkWildernessRoute02
        Case 1
            If $iPass = 1 Then Return $aProph_Kryta_MajestysRestRoute01
            Return $aProph_Kryta_MajestysRestRoute02
        Case 2
            If $iPass = 1 Then Return $aProph_Maguuma_SageLandsRoute01
            Return $aProph_Maguuma_SageLandsRoute02
        Case 3
            If $iPass = 1 Then Return $aProph_Maguuma_MamnoonLagoonRoute01
            Return $aProph_Maguuma_MamnoonLagoonRoute02
        Case 4
            If $iPass = 1 Then Return $aProph_Maguuma_SilverwoodRoute01
            Return $aProph_Maguuma_SilverwoodRoute02
        Case 5
            If $iPass = 1 Then Return $aProph_Maguuma_EttinsBackRoute01
            Return $aProph_Maguuma_EttinsBackRoute02
        Case 6
            If $iPass = 1 Then Return $aProph_Maguuma_ReedBogRoute01
            Return $aProph_Maguuma_ReedBogRoute02
        Case 7
            If $iPass = 1 Then Return $aProph_Maguuma_TheFallsRoute01
            Return $aProph_Maguuma_TheFallsRoute02
        Case 8
            If $iPass = 1 Then Return $aProph_Maguuma_DryTopRoute01
            Return $aProph_Maguuma_DryTopRoute02
        Case 9
            If $iPass = 1 Then Return $aProph_Maguuma_TangleRootRoute01
            Return $aProph_Maguuma_TangleRootRoute02
    EndSwitch
    Local $aEmpty[0][2]
    Return $aEmpty
EndFunc

; After a map is vanquished, portal to the next incomplete stage; resign only as fallback.
Func _Vanquisher_MaguumaCaravanAdvanceAfterVanquish($iStage)
    Local $sLabel = $g_a_MaguumaCaravanPlan[$iStage][8]
    Local $iTargetMap = $g_a_MaguumaCaravanPlan[$iStage][0]

    If GetMapID() <> $iTargetMap Then
        CurrentAction("Left " & $sLabel & " before vanquish finished - will re-enter.")
        _Vanquisher_ResetGoOutRouteProgress()
        Return False
    EndIf

    UpdateVanquish()
    ; History-complete maps are skipped even when this fresh instance still has foes.
    Local $bHistoryDone = _Vanquisher_MaguumaCaravanIsStageHistoricallyVanquished($iStage)
    If Not $bHistoryDone And Not GetAreaVanquished() And Not _Vanquisher_IsAlreadyVanquishedOnEntry() Then
        CurrentAction($sLabel & " route finished but area not vanquished yet - retrying route.")
        Return False
    EndIf

    $g_i_Vanquisher_CombinedMaguumaStage = $iStage + 1

    ; Portal past maps already marked completed by the connect-time history scan.
    Local $iNextIncomplete = _Vanquisher_MaguumaCaravanFirstIncompleteStage($g_i_Vanquisher_CombinedMaguumaStage)
    If $iNextIncomplete > $g_i_Vanquisher_CombinedMaguumaStage Then
        Local $sSkipMsg = ""
        Local $j = 0
        For $j = $g_i_Vanquisher_CombinedMaguumaStage To $iNextIncomplete - 1
            If $sSkipMsg <> "" Then $sSkipMsg &= ", "
            $sSkipMsg &= $g_a_MaguumaCaravanPlan[$j][8]
        Next
        _Log("Maguuma caravan: skipping historically completed map(s): " & $sSkipMsg & ".")
        CurrentAction("Skipping historically completed: " & $sSkipMsg & ".")
    EndIf
    $g_i_Vanquisher_CombinedMaguumaStage = $iNextIncomplete

    If $g_i_Vanquisher_CombinedMaguumaStage >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then
        CurrentAction($sLabel & " vanquished (" & GetFoesKilled() & " killed). TOA Maguuma caravan complete.")
        _Vanquisher_EndMaguumaCaravanRun(True)
        Return True
    EndIf

    Local $iNextMap = $g_a_MaguumaCaravanPlan[$g_i_Vanquisher_CombinedMaguumaStage][0]
    Local $sNextLabel = $g_a_MaguumaCaravanPlan[$g_i_Vanquisher_CombinedMaguumaStage][8]
    Local $sNextMsg = "Maguuma caravan next: " & $sNextLabel & _
            " (" & ($g_i_Vanquisher_CombinedMaguumaStage + 1) & "/" & $GC_I_MAGUUMA_CARAVAN_MAP_COUNT & ")."

    CurrentAction($sLabel & " vanquished (" & GetFoesKilled() & " killed). Continuing to " & $sNextLabel & ".")
    _Vanquisher_ResetGoOutRouteProgress()

    ; Prefer shared portal path, then neighbor GoOut (MajestysRest -> SageLands, Sage -> Mamnoon, etc.).
    If Map_GetInstanceInfo("IsExplorable") Then
        If _TempleAscalonCaravanCanDirectTransition($iNextMap) Then
            _Vanquisher_ApplyDifficulty()
            CurrentAction("Portaling to " & $sNextLabel & ".")
            _TempleAscalonCaravanTryCatchUp($iNextMap)
        EndIf

        If GetMapID() <> $iNextMap And _Vanquisher_IsMaguumaCaravanEntryMap(GetMapID(), $g_i_Vanquisher_CombinedMaguumaStage) Then
            Local $sNextGoOut = $g_a_MaguumaCaravanPlan[$g_i_Vanquisher_CombinedMaguumaStage][5]
            Local $iBeforeGoOut = GetMapID()
            _Vanquisher_ApplyDifficulty()
            CurrentAction("Neighbor GoOut to " & $sNextLabel & ".")
            If $sNextGoOut <> "" Then Call($sNextGoOut)
            If GetMapID() = $iBeforeGoOut Then _Vanquisher_ResetGoOutRouteProgress()
        EndIf

        If GetMapID() = $iNextMap Or _TempleAscalonCaravanCanDirectTransition($iNextMap) _
                Or _Vanquisher_IsMaguumaCaravanEntryMap(GetMapID(), $g_i_Vanquisher_CombinedMaguumaStage) Then
            CurrentAction($sNextMsg)
            Return True
        EndIf

        CurrentAction("Portal path to " & $sNextLabel & " stalled - resigning for outpost travel.")
    Else
        CurrentAction("Not explorable after " & $sLabel & " - resigning for " & $sNextLabel & ".")
    EndIf

    _Vanquisher_ReturnToOutpost()
    _Vanquisher_ResetGoOutRouteProgress()
    CurrentAction($sNextMsg)
    Return True
EndFunc

Func _Vanquisher_RunMaguumaCaravanStage()
    If _Vanquisher_ShouldStop() Then Return True
    If Not $g_b_Vanquisher_CombinedMaguumaCaravanActive Then Return True
    _Vanquisher_InitMaguumaCaravanPlan()

    Local $iStage = $g_i_Vanquisher_CombinedMaguumaStage
    ; Re-check map-scan flags every stage so completed maps are never farmed.
    Local $iIncomplete = _Vanquisher_MaguumaCaravanFirstIncompleteStage($iStage)
    If $iIncomplete > $iStage Then
        Local $sSkipMsg = ""
        Local $j = 0
        For $j = $iStage To $iIncomplete - 1
            If $sSkipMsg <> "" Then $sSkipMsg &= ", "
            $sSkipMsg &= $g_a_MaguumaCaravanPlan[$j][8]
        Next
        _Log("Maguuma caravan: skipping historically completed map(s): " & $sSkipMsg & ".")
        CurrentAction("Skipping historically completed: " & $sSkipMsg & ".")
        $g_i_Vanquisher_CombinedMaguumaStage = $iIncomplete
        $iStage = $iIncomplete
    EndIf

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

    CurrentAction("Maguuma caravan on " & $sLabel & " (map " & GetMapID() & ") - starting vanquish.")
    _Vanquisher_MaguumaCaravanRunVanquish($iStage)
    If _Vanquisher_ShouldStop() Or $g_b_Vanquisher_AbortRoute Or $g_b_Vanquisher_RunFinished Then Return True

    ; Runs after arrays finish, or immediately when skipped as history/instance-complete.
    _Vanquisher_MaguumaCaravanAdvanceAfterVanquish($iStage)
    Return True
EndFunc

Func VQSpecialRoute_TempleOfTheAgesMaguumaCaravan()
    _Vanquisher_BeginMaguumaCaravanRun()
    _Vanquisher_RunMaguumaCaravanStage()
EndFunc
