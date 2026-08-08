#include-once

; Explicit Ascalon caravan runner.
; Strategy: for each map reach via portal (or TravelTo+GoOut fallback at TOA only) -> vanquish coords
; -> portal to the next map. Continuous spine from TOA through Kryta, Northern Shiverpeaks, Ascalon.
; Historically completed maps (from connect-time map scan) are scanned across the full route.
; Stage jumps to the first open map; GoOut/TryCatchUp portals the spine there (TOA entry only).
; Resign/TravelTo only as stall recovery when no portal hop can be made — never mid-route outposts.

Func _Vanquisher_BeginAscalonCaravanRun()
    If $g_b_Vanquisher_CombinedAscalonCaravanActive Then Return
    _Vanquisher_InitAscalonCaravanPlan()
    $g_b_Vanquisher_CombinedAscalonCaravanActive = True
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_AbortRoute = False
    $g_b_AscalonCaravan_VisitedDG = False
    _Vanquisher_ResetGoOutRouteProgress()

    ; Scan all remaining route maps, then target the first incomplete stage.
    ; GoOutToMap always enters at TOA (plan[0] outpost) and portals — never mid-route TravelTo.
    Local $iStart = _Vanquisher_AscalonCaravanStageForCurrentMap()
    Local $iFirstIncomplete = _Vanquisher_AscalonCaravanFirstIncompleteStage($iStart)
    $g_i_Vanquisher_CombinedAscalonStage = $iFirstIncomplete

    If $iFirstIncomplete >= $GC_I_ASCALON_CARAVAN_MAP_COUNT Then
        _Log("Ascalon caravan: all route maps already vanquished per map scan.")
        CurrentAction("TOA Ascalon caravan complete - all maps already vanquished.")
        Return
    EndIf

    Local $iProbeMap = Number($g_a_AscalonCaravanPlan[0][0])
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
        $bProbeLive = _Vanquisher_ReadLiveHistoryBitForMapId($iProbeMap)
    EndIf
    _Log("Ascalon history probe: BlackCurtain map " & $iProbeMap & _
            " cached=" & $bProbeCached & " liveBit=" & $bProbeLive & _
            " historyLoaded=" & $g_bVanquishHistoryLoaded & _
            " spineStart=" & ($iStart + 1) & " firstIncomplete=" & ($iFirstIncomplete + 1) & _
            "/" & $GC_I_ASCALON_CARAVAN_MAP_COUNT & ".")

    If $iFirstIncomplete > $iStart Then
        Local $sSkipped = ""
        Local $i = 0
        For $i = $iStart To $iFirstIncomplete - 1
            If $sSkipped <> "" Then $sSkipped &= ", "
            $sSkipped &= $g_a_AscalonCaravanPlan[$i][8]
        Next
        _Log("Ascalon caravan: route scan skipped completed map(s): " & $sSkipped & _
                ". Portal pathing to first open: " & $g_a_AscalonCaravanPlan[$iFirstIncomplete][8] & _
                " (stage " & ($iFirstIncomplete + 1) & "/" & $GC_I_ASCALON_CARAVAN_MAP_COUNT & ").")
        CurrentAction("Portal pathing to " & $g_a_AscalonCaravanPlan[$iFirstIncomplete][8] & _
                " (skipping completed maps).")
    Else
        _Log("Ascalon caravan build: vanquish then portal to next map. First target: " & _
                $g_a_AscalonCaravanPlan[$iFirstIncomplete][8] & ".")
        CurrentAction("Starting TOA Ascalon caravan (portal between maps when possible).")
    EndIf
EndFunc

Func _Vanquisher_EndAscalonCaravanRun($bFinishRun = False)
    $g_b_Vanquisher_CombinedAscalonCaravanActive = False
    $g_i_Vanquisher_CombinedAscalonStage = 0
    _Vanquisher_ResetGoOutRouteProgress()
    If $bFinishRun Then _Vanquisher_FinishRun()
EndFunc

Func _Vanquisher_AscalonCaravanEnsureOutpost($iOutpostID, $sLabel)
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

; Reach the stage map via shared portal path when already explorable; otherwise enter at TOA and portal.
; Mid-route outposts (Lion's Arch, Yak's Bend, Ice Tooth Cave, etc.) are not used for caravan entry.
Func _Vanquisher_AscalonCaravanGoOutToMap($iStage)
    Local $iTargetMap = $g_a_AscalonCaravanPlan[$iStage][0]
    Local $iSpineOutpost = $g_a_AscalonCaravanPlan[0][1] ; Temple of the Ages — caravan entry
    Local $sGoOutFunc = $g_a_AscalonCaravanPlan[$iStage][5]
    Local $sLabel = $g_a_AscalonCaravanPlan[$iStage][8]
    Local $sEntryGoOut = $g_a_AscalonCaravanPlan[0][5]
    Local $iHop = 0

    While $iHop < 24 And Not _Vanquisher_ShouldStop()
        Local $iCurrent = GetMapID()
        If $iCurrent = $iTargetMap Then Return True

        ; Already in explorable: prefer dynamic portal catch-up (neighbor hops).
        If Map_GetInstanceInfo("IsExplorable") Then
            If _TempleAscalonCaravanCanDirectTransition($iTargetMap) Then
                CurrentAction("Ascalon caravan portal hop " & ($iHop + 1) & ": " & $sLabel & _
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

            If _Vanquisher_IsAscalonCaravanEntryMap($iCurrent, $iStage) Then
                Local $iBeforeGoOut = $iCurrent
                _Vanquisher_ApplyDifficulty()
                CurrentAction("Ascalon caravan GoOut hop " & ($iHop + 1) & ": " & $sLabel & _
                        " (map " & $iCurrent & " -> " & $iTargetMap & ").")
                If $sGoOutFunc <> "" Then Call($sGoOutFunc)
                If GetMapID() = $iTargetMap Then Return True
                If GetMapID() <> $iBeforeGoOut Then
                    $iHop += 1
                    ContinueLoop
                EndIf
                _Vanquisher_ResetGoOutRouteProgress()
            EndIf

            ; On an earlier spine map: portal one neighbor toward the target via stage GoOut / catch-up.
            If _Vanquisher_IsOnAscalonCaravanSpine($iCurrent) Then
                Local $iSpineStage = _Vanquisher_AscalonCaravanStageForCurrentMap()
                If $iSpineStage < $iStage Then
                    Local $iNextMap = $g_a_AscalonCaravanPlan[$iSpineStage + 1][0]
                    Local $sNextGoOut = $g_a_AscalonCaravanPlan[$iSpineStage + 1][5]
                    Local $sNextLabel = $g_a_AscalonCaravanPlan[$iSpineStage + 1][8]
                    Local $iBeforeHop = $iCurrent
                    _Vanquisher_ApplyDifficulty()
                    If _TempleAscalonCaravanCanDirectTransition($iNextMap) Then
                        CurrentAction("Ascalon caravan portal toward " & $sLabel & " via " & $sNextLabel & ".")
                        _TempleAscalonCaravanTryCatchUp($iNextMap)
                    ElseIf $sNextGoOut <> "" Then
                        CurrentAction("Ascalon caravan GoOut toward " & $sLabel & " via " & $sNextLabel & ".")
                        Call($sNextGoOut)
                    EndIf
                    If GetMapID() = $iTargetMap Then Return True
                    If GetMapID() <> $iBeforeHop Then
                        $iHop += 1
                        ContinueLoop
                    EndIf
                    _Vanquisher_ResetGoOutRouteProgress()
                EndIf
            EndIf

            ; Off-spine explorable: resign back to TOA, then portal the caravan route.
            If Not _Vanquisher_IsOnAscalonCaravanSpine(GetMapID()) Then
                If Not _Vanquisher_AscalonCaravanEnsureOutpost($iSpineOutpost, "TOA Ascalon entry") Then Return False
                $iHop += 1
                ContinueLoop
            EndIf

            ; On spine but no portal progress this pass — let the caller retry next tick.
            Return False
        EndIf

        ; Outpost / non-explorable: always enter the caravan at TOA, never mid-route TravelTo.
        If Not _Vanquisher_IsOnAscalonCaravanSpine($iCurrent) Or Not _Vanquisher_IsAscalonCaravanEntryMap($iCurrent, 0) Then
            If GetMapID() <> $iSpineOutpost Then
                If Not _Vanquisher_AscalonCaravanEnsureOutpost($iSpineOutpost, "TOA Ascalon entry") Then Return False
            EndIf
            $iCurrent = GetMapID()
            If $iCurrent = $iTargetMap Then Return True
        EndIf

        ; From TOA: hardcoded GoOut into Black Curtain, then portal onward.
        If _Vanquisher_IsAscalonCaravanEntryMap($iCurrent, 0) And $iCurrent <> $g_a_AscalonCaravanPlan[0][0] Then
            Local $iBeforeEntry = $iCurrent
            _Vanquisher_ApplyDifficulty()
            CurrentAction("Ascalon caravan entering spine via TheBlackCurtain.")
            If $sEntryGoOut <> "" Then Call($sEntryGoOut)
            If GetMapID() = $iTargetMap Then Return True
            If GetMapID() = $iBeforeEntry Then
                _Vanquisher_ResetGoOutRouteProgress()
                Return False
            EndIf
            $iHop += 1
            ContinueLoop
        EndIf

        If _Vanquisher_IsAscalonCaravanEntryMap($iCurrent, $iStage) Then
            Local $iBefore = $iCurrent
            _Vanquisher_ApplyDifficulty()
            CurrentAction("Ascalon caravan GoOut hop " & ($iHop + 1) & ": " & $sLabel & _
                    " (map " & $iCurrent & " -> " & $iTargetMap & ").")
            If $sGoOutFunc <> "" Then Call($sGoOutFunc)
            If GetMapID() = $iTargetMap Then Return True
            If GetMapID() = $iBefore Then
                _Vanquisher_ResetGoOutRouteProgress()
                Return False
            EndIf
            $iHop += 1
            ContinueLoop
        EndIf

        ExitLoop
    WEnd

    Return GetMapID() = $iTargetMap
EndFunc

Func _Vanquisher_AscalonCaravanRunVanquish($iStage)
    Local $sLabel = $g_a_AscalonCaravanPlan[$iStage][8]
    Local $iTargetMap = Number($g_a_AscalonCaravanPlan[$iStage][0])

    ; GoOut portal approach can leave TransitOnly / stale combat state. Settle the farm map
    ; before walking vanquish coordinates so AggroMoveTo actually starts the array.
    $g_b_Vanquisher_TransitOnly = False
    Map_WaitMapIsLoaded()
    If GetMapID() <> $iTargetMap Then
        CurrentAction($sLabel & " vanquish aborted - on map " & GetMapID() & ", need " & $iTargetMap & ".")
        Return
    EndIf

    ; Skip only from connect-time / live history bitfield — no per-load foe-counter settle.
    If _Vanquisher_AscalonCaravanIsStageHistoricallyVanquished($iStage) Then
        CurrentAction($sLabel & " already vanquished per map scan - skipping coordinate arrays.")
        _Log("Ascalon caravan: " & $sLabel & " (map " & $iTargetMap & ") skipped by history - portal onward.")
        Return
    EndIf

    _Vanquisher_CacheCombatAIForCurrentMap(True)
    $g_b_Vanquisher_ConsumablesAppliedThisZone = False
    _Vanquisher_ApplyConsumablesOnFarmEntry()

    Local $aRoute01 = _Vanquisher_AscalonCaravanRouteArray($iStage, 1)
    Local $aRoute02 = _Vanquisher_AscalonCaravanRouteArray($iStage, 2)
    Local $iCount01 = 0
    Local $iCount02 = 0
    If IsArray($aRoute01) Then $iCount01 = UBound($aRoute01)
    If IsArray($aRoute02) Then $iCount02 = UBound($aRoute02)

    Local $bLiveBit = _Vanquisher_ReadLiveHistoryBitForMapId($iTargetMap)
    Local $bCachedBit = False
    If IsDeclared("g_aMapEntries") Then
        Local $c = 0
        For $c = 0 To UBound($g_aMapEntries) - 1
            If Number($g_aMapEntries[$c][4]) = $iTargetMap And $g_aMapEntries[$c][5] Then
                $bCachedBit = True
                ExitLoop
            EndIf
        Next
    EndIf
    _Log("Ascalon caravan: farming " & $sLabel & " map " & $iTargetMap & _
            " (cached=" & $bCachedBit & ", liveBit=" & $bLiveBit & _
            ", foes " & GetFoesKilled() & "/" & GetFoesToKill() & ").")
    CurrentAction("Starting " & $sLabel & " vanquish route (" & ($iStage + 1) & "/" & $GC_I_ASCALON_CARAVAN_MAP_COUNT & ") - " & _
            $iCount01 & "+" & $iCount02 & " waypoints on map " & GetMapID() & ".")

    If $iCount01 < 1 And $iCount02 < 1 Then
        CurrentAction($sLabel & " has no vanquish coordinate arrays loaded.")
        Return
    EndIf

    If $iCount01 > 0 Then _Vanquisher_RunCaravanRoute($aRoute01)
    If _Vanquisher_ShouldStop() Or $g_b_Vanquisher_AbortRoute Then Return
    If $iCount02 > 0 Then _Vanquisher_RunCaravanRoute($aRoute02)
EndFunc

Func _Vanquisher_AscalonCaravanRouteArray($iStage, $iPass)
    Switch $iStage
        Case 0
            If $iPass = 1 Then Return $aProph_Kryta_TheBlackCurtainRoute01
            Return $aProph_Kryta_TheBlackCurtainRoute02
        Case 1
            If $iPass = 1 Then Return $aProph_Kryta_CursedLandsRoute01
            Return $aProph_Kryta_CursedLandsRoute02
        Case 2
            If $iPass = 1 Then Return $aProph_Kryta_NeboTerraceRoute01
            Return $aProph_Kryta_NeboTerraceRoute02
        Case 3
            If $iPass = 1 Then Return $aProph_Kryta_NorthKrytaProvinceRoute01
            Return $aProph_Kryta_NorthKrytaProvinceRoute02
        Case 4
            If $iPass = 1 Then Return $aProph_Kryta_ScoundrelsRiseRoute01
            Return $aProph_Kryta_ScoundrelsRiseRoute02
        Case 5
            If $iPass = 1 Then Return $aProph_NorthernShiverpeaks_GriffonsMouthRoute01
            Return $aProph_NorthernShiverpeaks_GriffonsMouthRoute02
        Case 6
            If $iPass = 1 Then Return $aProph_NorthernShiverpeaks_DeldrimorBowlRoute01
            Return $aProph_NorthernShiverpeaks_DeldrimorBowlRoute02
        Case 7
            If $iPass = 1 Then Return $aProph_NorthernShiverpeaks_AnvilRockRoute01
            Return $aProph_NorthernShiverpeaks_AnvilRockRoute02
        Case 8
            If $iPass = 1 Then Return $aProph_NorthernShiverpeaks_IronHorseMineRoute01
            Return $aProph_NorthernShiverpeaks_IronHorseMineRoute02
        Case 9
            If $iPass = 1 Then Return $aProph_NorthernShiverpeaks_TravelersValeRoute01
            Return $aProph_NorthernShiverpeaks_TravelersValeRoute02
        Case 10
            If $iPass = 1 Then Return $aProph_Ascalon_AscalonFoothillsRoute01
            Return $aProph_Ascalon_AscalonFoothillsRoute02
        Case 11
            If $iPass = 1 Then Return $aProph_Ascalon_DiessaLowlandsRoute01
            Return $aProph_Ascalon_DiessaLowlandsRoute02
        Case 12
            If $iPass = 1 Then Return $aProph_Ascalon_FlameTempleCorridorRoute01
            Return $aProph_Ascalon_FlameTempleCorridorRoute02
        Case 13
            If $iPass = 1 Then Return $aProph_Ascalon_DragonsGulletRoute01
            Return $aProph_Ascalon_DragonsGulletRoute02
        Case 14
            If $iPass = 1 Then Return $aProph_Ascalon_TheBreachRoute01
            Return $aProph_Ascalon_TheBreachRoute02
        Case 15
            If $iPass = 1 Then Return $aCaravan_Ascalon_CaravanAscalon_OldAscalonRoute01
            Return $aCaravan_Ascalon_CaravanAscalon_OldAscalonRoute02
        Case 16
            If $iPass = 1 Then Return $aProph_Ascalon_RegentValleyRoute01
            Return $aProph_Ascalon_RegentValleyRoute02
        Case 17
            If $iPass = 1 Then Return $aProph_Ascalon_PockmarkFlatsRoute01
            Return $aProph_Ascalon_PockmarkFlatsRoute02
        Case 18
            If $iPass = 1 Then Return $aProph_Ascalon_EasternFrontierRoute01
            Return $aProph_Ascalon_EasternFrontierRoute02
    EndSwitch
    Local $aEmpty[0][2]
    Return $aEmpty
EndFunc

; After a map is handled, re-scan remaining route maps and portal-path to the first open stage.
; GoOut/TryCatchUp handle multi-hop portal paths; TOA entry only — never mid-route TravelTo.
Func _Vanquisher_AscalonCaravanAdvanceAfterVanquish($iStage)
    Local $sLabel = $g_a_AscalonCaravanPlan[$iStage][8]
    Local $iTargetMap = $g_a_AscalonCaravanPlan[$iStage][0]

    If GetMapID() <> $iTargetMap Then
        CurrentAction("Left " & $sLabel & " before vanquish finished - will re-enter.")
        _Vanquisher_ResetGoOutRouteProgress()
        Return False
    EndIf

    UpdateVanquish()
    ; History-complete maps are skipped even when this fresh instance still has foes.
    Local $bHistoryDone = _Vanquisher_AscalonCaravanIsStageHistoricallyVanquished($iStage)
    If Not $bHistoryDone And Not GetAreaVanquished() And Not _Vanquisher_IsAlreadyVanquishedOnEntry() Then
        CurrentAction($sLabel & " route finished but area not vanquished yet - retrying route.")
        Return False
    EndIf

    If $iTargetMap = $DragonsGullet_Map Then $g_b_AscalonCaravan_VisitedDG = True

    Local $iNextIncomplete = _Vanquisher_AscalonCaravanFirstIncompleteStage($iStage + 1)
    $g_i_Vanquisher_CombinedAscalonStage = $iNextIncomplete

    If $iNextIncomplete >= $GC_I_ASCALON_CARAVAN_MAP_COUNT Then
        If $bHistoryDone Then
            CurrentAction($sLabel & " already vanquished. TOA Ascalon caravan complete.")
        Else
            CurrentAction($sLabel & " vanquished (" & GetFoesKilled() & " killed). TOA Ascalon caravan complete.")
        EndIf
        _Vanquisher_EndAscalonCaravanRun(True)
        Return True
    EndIf

    If $iNextIncomplete > ($iStage + 1) Then
        Local $sSkipMsg = ""
        Local $j = 0
        For $j = $iStage + 1 To $iNextIncomplete - 1
            If $sSkipMsg <> "" Then $sSkipMsg &= ", "
            $sSkipMsg &= $g_a_AscalonCaravanPlan[$j][8]
        Next
        _Log("Ascalon caravan: route scan skipped completed map(s): " & $sSkipMsg & ".")
    EndIf

    Local $iNextMap = $g_a_AscalonCaravanPlan[$iNextIncomplete][0]
    Local $sNextLabel = $g_a_AscalonCaravanPlan[$iNextIncomplete][8]
    Local $sNextMsg = "Ascalon caravan next: " & $sNextLabel & _
            " (" & ($iNextIncomplete + 1) & "/" & $GC_I_ASCALON_CARAVAN_MAP_COUNT & ")."

    If $bHistoryDone Then
        CurrentAction($sLabel & " already vanquished - portal pathing to " & $sNextLabel & ".")
    Else
        CurrentAction($sLabel & " vanquished (" & GetFoesKilled() & " killed). Continuing to " & $sNextLabel & ".")
    EndIf
    _Vanquisher_ResetGoOutRouteProgress()

    ; Prefer shared portal path to the first open map, then neighbor GoOut fallback.
    If Map_GetInstanceInfo("IsExplorable") Then
        If _TempleAscalonCaravanCanDirectTransition($iNextMap) Then
            _Vanquisher_ApplyDifficulty()
            CurrentAction("Portaling to " & $sNextLabel & ".")
            _TempleAscalonCaravanTryCatchUp($iNextMap)
        EndIf

        If GetMapID() <> $iNextMap And _Vanquisher_IsAscalonCaravanEntryMap(GetMapID(), $iNextIncomplete) Then
            Local $sNextGoOut = $g_a_AscalonCaravanPlan[$iNextIncomplete][5]
            Local $iBeforeGoOut = GetMapID()
            _Vanquisher_ApplyDifficulty()
            CurrentAction("Neighbor GoOut to " & $sNextLabel & ".")
            If $sNextGoOut <> "" Then Call($sNextGoOut)
            If GetMapID() = $iBeforeGoOut Then _Vanquisher_ResetGoOutRouteProgress()
        EndIf

        If GetMapID() = $iNextMap Or _TempleAscalonCaravanCanDirectTransition($iNextMap) _
                Or _Vanquisher_IsAscalonCaravanEntryMap(GetMapID(), $iNextIncomplete) Then
            CurrentAction($sNextMsg)
            Return True
        EndIf

        CurrentAction("Portal path to " & $sNextLabel & " stalled - resigning to TOA for spine re-entry.")
    Else
        CurrentAction("Not explorable after " & $sLabel & " - resigning to TOA for " & $sNextLabel & ".")
    EndIf

    ; Stall recovery returns to TOA; next stage will portal the spine (never TravelTo mid-route outposts).
    _Vanquisher_ReturnToOutpost()
    _Vanquisher_ResetGoOutRouteProgress()
    CurrentAction($sNextMsg)
    Return True
EndFunc

Func _Vanquisher_RunAscalonCaravanStage()
    If _Vanquisher_ShouldStop() Then Return True
    If Not $g_b_Vanquisher_CombinedAscalonCaravanActive Then Return True
    _Vanquisher_InitAscalonCaravanPlan()

    ; Re-scan the full remaining route, then portal-path to the first open farm map.
    Local $iStage = $g_i_Vanquisher_CombinedAscalonStage
    If $iStage < 0 Then $iStage = 0

    Local $iFirstIncomplete = _Vanquisher_AscalonCaravanFirstIncompleteStage($iStage)
    If $iFirstIncomplete >= $GC_I_ASCALON_CARAVAN_MAP_COUNT Then
        _Log("Ascalon caravan: remaining maps already vanquished per map scan.")
        CurrentAction("TOA Ascalon caravan complete - remaining maps already vanquished.")
        _Vanquisher_EndAscalonCaravanRun(True)
        Return True
    EndIf

    If $iFirstIncomplete > $iStage Then
        Local $sSkipMsg = ""
        Local $j = 0
        For $j = $iStage To $iFirstIncomplete - 1
            If $sSkipMsg <> "" Then $sSkipMsg &= ", "
            $sSkipMsg &= $g_a_AscalonCaravanPlan[$j][8]
        Next
        _Log("Ascalon caravan: route scan skipped completed map(s): " & $sSkipMsg & _
                ". Portal pathing to " & $g_a_AscalonCaravanPlan[$iFirstIncomplete][8] & ".")
        CurrentAction("Portal pathing to " & $g_a_AscalonCaravanPlan[$iFirstIncomplete][8] & _
                " (skipping completed maps).")
        $g_i_Vanquisher_CombinedAscalonStage = $iFirstIncomplete
        $iStage = $iFirstIncomplete
    EndIf

    Local $iTargetMap = $g_a_AscalonCaravanPlan[$iStage][0]
    Local $sLabel = $g_a_AscalonCaravanPlan[$iStage][8]

    If Not _Vanquisher_AscalonCaravanGoOutToMap($iStage) Then
        CurrentAction("Routing - on map " & GetMapID() & ", need " & $sLabel & " (" & $iTargetMap & ").")
        Return True
    EndIf

    If GetMapID() <> $iTargetMap Then
        CurrentAction($sLabel & " route waiting - on map " & GetMapID() & ", need " & $iTargetMap & ".")
        Return True
    EndIf

    CurrentAction("Ascalon caravan on " & $sLabel & " (map " & GetMapID() & ") - starting vanquish.")
    _Vanquisher_AscalonCaravanRunVanquish($iStage)
    If _Vanquisher_ShouldStop() Or $g_b_Vanquisher_AbortRoute Or $g_b_Vanquisher_RunFinished Then Return True

    _Vanquisher_AscalonCaravanAdvanceAfterVanquish($iStage)
    Return True
EndFunc

Func VQSpecialRoute_TempleOfTheAgesAscalonCaravan()
    _Vanquisher_BeginAscalonCaravanRun()
    _Vanquisher_RunAscalonCaravanStage()
EndFunc
