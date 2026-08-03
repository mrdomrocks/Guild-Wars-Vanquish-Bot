Global Const $CHECK_INTERVAL = 1500
Global Const $REWARD_WAIT_TIME = 1800000 ; 30 minuti
Global Const $VANQUISHER_PATHFINDER_REPATH_MS = 1000
Global Const $VANQUISHER_PATHFINDER_REACHED_DISTANCE = 250
Global $ActionCounter = 0
Global $RangeLimit = 1450

; All maps use these route helpers — vanquish complete / abort is handled here globally.
Func _Vanquisher_ExitRouteIfDone($a_s_Phase = "")
    If _Vanquisher_ShouldStop() Then Return True
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
        _Vanquisher_OnVanquishComplete($a_s_Phase)
        Return True
    EndIf
    Return False
EndFunc

; Move through path with combat; last point is a portal (AggroMoveTo then Move + Wait).
Func _Vanquisher_RunAggroPortalPath($a_a_Points, $a_i_AggroRange = 1450, $a_s_Label = "", $a_i_PostMoveDelayMs = 0, $a_s_WaitFunc = "WaitForLoad")
    Local $l_i_Count = UBound($a_a_Points)
    If $l_i_Count < 1 Then Return False
    Local $l_i_Last = $l_i_Count - 1
    For $l_i_Idx = 0 To $l_i_Last - 1
        If _Vanquisher_ShouldStop() Then Return False
        AggroMoveTo($a_a_Points[$l_i_Idx][0], $a_a_Points[$l_i_Idx][1], $a_s_Label & ($l_i_Idx + 1), $a_i_AggroRange)
    Next
    If _Vanquisher_ShouldStop() Then Return False
    AggroMoveTo($a_a_Points[$l_i_Last][0], $a_a_Points[$l_i_Last][1], $a_s_Label & " portal", $a_i_AggroRange)
    Local $l_i_MapBefore = GetMapID()
    Local $l_b_LoadTriggered = False
    Local $l_i_Attempt = 0
    For $l_i_Attempt = 1 To 4
        Move($a_a_Points[$l_i_Last][0], $a_a_Points[$l_i_Last][1])
        If $a_i_PostMoveDelayMs > 0 Then Sleep($a_i_PostMoveDelayMs)
        Sleep(250)

        If GetMapID() <> $l_i_MapBefore Or Map_GetInstanceInfo("IsLoading") Then
            $l_b_LoadTriggered = True
            ExitLoop
        EndIf

        ; Re-issue a tighter move to help fire borderline portal triggers.
        MoveTo($a_a_Points[$l_i_Last][0], $a_a_Points[$l_i_Last][1], 60, False)
        Sleep(250)

        If GetMapID() <> $l_i_MapBefore Or Map_GetInstanceInfo("IsLoading") Then
            $l_b_LoadTriggered = True
            ExitLoop
        EndIf
    Next

    ; Portal fired (map changed or loading) — must wait for load before cons/VQ start.
    If $l_b_LoadTriggered Then
        Call($a_s_WaitFunc)
        Return True
    EndIf
    Return False
EndFunc

; Named aliases for map files authored as route arrays instead of repeated MoveTo()/Move().
; These route runners stay pathfinder-friendly because AggroMoveTo() already prefers
; the Pathfinder backend and falls back to legacy movement when needed.
Func _Vanquisher_RunPathfinderRoute($a_a_Points, $a_i_AggroRange = 1450, $a_s_Label = "")
    Local $l_i_Count = UBound($a_a_Points)
    If $l_i_Count < 1 Then Return

    For $l_i_Idx = 0 To $l_i_Count - 1
        If _Vanquisher_ShouldStop() Then Return
        AggroMoveTo($a_a_Points[$l_i_Idx][0], $a_a_Points[$l_i_Idx][1], $a_s_Label & ($l_i_Idx + 1), $a_i_AggroRange)
    Next
EndFunc

Func _Vanquisher_RunVanquishRoute($a_a_Points, $a_i_AggroRange = 1450)
    Local $l_i_Count = UBound($a_a_Points)
    If $l_i_Count < 1 Then Return

    For $l_i_Idx = 0 To $l_i_Count - 1
        If _Vanquisher_ShouldStop() Then Return
        If GetAreaVanquished() = False Then AggroMoveTo($a_a_Points[$l_i_Idx][0], $a_a_Points[$l_i_Idx][1], "", $a_i_AggroRange)
    Next
EndFunc

Func _Vanquisher_RunCaravanRoute($a_a_Points, $a_i_AggroRange = 1450)
    Local $l_i_Count = UBound($a_a_Points)
    If $l_i_Count < 1 Then Return

    For $l_i_Idx = 0 To $l_i_Count - 1
        If _Vanquisher_ShouldStop() Then Return
        If _Vanquisher_ShouldRunCaravanWaypoint() Then AggroMoveTo($a_a_Points[$l_i_Idx][0], $a_a_Points[$l_i_Idx][1], "", $a_i_AggroRange)
    Next
EndFunc

Func _Vanquisher_RunDeadOnTheRunRoute($a_a_Points, $a_i_AggroRange = 1450)
    Local $l_i_Count = UBound($a_a_Points)
    If $l_i_Count < 1 Then Return

    For $l_i_Idx = 0 To $l_i_Count - 1
        If _Vanquisher_ShouldStop() Then Return
        If $DeadOnTheRun = 0 Then AggroMoveTo($a_a_Points[$l_i_Idx][0], $a_a_Points[$l_i_Idx][1], "", $a_i_AggroRange)
    Next
EndFunc

Func _Vanquisher_RunPathfinderPortalRoute($a_a_Points, $a_i_AggroRange = 1450, $a_s_Label = "", $a_i_PostMoveDelayMs = 0, $a_s_WaitFunc = "WaitForLoad")
    _Vanquisher_RunAggroPortalPath($a_a_Points, $a_i_AggroRange, $a_s_Label, $a_i_PostMoveDelayMs, $a_s_WaitFunc)
EndFunc

Func _Vanquisher_IsWormSpoorWaypoint($a_s_Label)
    Return StringInStr(StringLower($a_s_Label), "usewormspoor") > 0
EndFunc

Func UseWormSpoor($a_f_X = 0, $a_f_Y = 0)
    If _Vanquisher_ShouldStop() Then Return
    CurrentAction("Using Wurm Spoor")

    Local $l_f_X = $a_f_X
    Local $l_f_Y = $a_f_Y
    If $l_f_X = 0 And $l_f_Y = 0 Then
        $l_f_X = Agent_GetAgentInfo(-2, "X")
        $l_f_Y = Agent_GetAgentInfo(-2, "Y")
    EndIf

    MoveTo($l_f_X, $l_f_Y, 50, False)
    RndSleep(500)

    Local $l_p_Spoor = GetNearestWormSpoorToCoords($l_f_X, $l_f_Y, 1500)
    If $l_p_Spoor <> 0 Then
        Local $l_i_SpoorID = _Vanquisher_AgentID($l_p_Spoor)
        If $l_i_SpoorID <> 0 Then
            Agent_ChangeTarget($l_i_SpoorID)
            RndSleep(750)
            GoSignpost($l_i_SpoorID)
        EndIf
    Else
        TargetNearestItem()
        RndSleep(750)
        GoSignpost(-1)
    EndIf

    RndSleep(750)
    Sleep(7000)
EndFunc

; Standard forward + reverse route (use for any map with both passes).
Func MoveandAggroVQFullRoute($aWaypoints)
    MoveandAggroVQ($aWaypoints)
    If _Vanquisher_ShouldStop() Then Return
    MoveandAggroVQReverse($aWaypoints)
EndFunc

Func _Vanquisher_HandleDeadOnTheRunRestart(ByRef $iIndex, $iRestartIndex, $sWaypointLabel, ByRef $iActionCounter, $sDirection = "forward")
    $g_i_Vanquisher_DeathRestartCount += 1
    If $g_i_Vanquisher_DeathRestartCount > $VANQUISHER_DEATH_RESTART_MAX Then
        CurrentAction("Party wiped " & $VANQUISHER_DEATH_RESTART_MAX & " times on " & $sDirection & " route — aborting map.")
        _Vanquisher_AbortCurrentRouteToZoneEntry()
        Return False
    EndIf

    CurrentAction("We died fighting at: " & $sWaypointLabel & $iActionCounter & ", restarting waypoints (" & $g_i_Vanquisher_DeathRestartCount & "/" & $VANQUISHER_DEATH_RESTART_MAX & ").")
    $iActionCounter = 1
    $iIndex = $iRestartIndex
    $DeadOnTheRun = 0
    Return True
EndFunc

Func MoveandAggroVQ($aWaypoints)
	If _Vanquisher_ExitRouteIfDone(" (forward skip)") Then Return
	$g_b_Vanquisher_HasRunRoute = True
	_Vanquisher_ApplyConsumablesOnFarmEntry()
    Local $timer = TimerInit()
    Local $Index = 0
    Local $iRouteBlockCount = $VANQUISHER_BLOCK_COUNT_DEFAULT
    $ActionCounter = 1
    CurrentAction("Vanquish route forward — " & UBound($aWaypoints) & " waypoints.")
    For $Index = 0 To UBound($aWaypoints) - 1
        If _Vanquisher_ShouldStop() Then Return
        $RangeLimit = $aWaypoints[$Index][3]
        If _Vanquisher_CheckVanquishDuringRoute($timer, " (forward)") Then Return
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3], $iRouteBlockCount)
        If _Vanquisher_IsWormSpoorWaypoint($aWaypoints[$Index][2]) Then UseWormSpoor($aWaypoints[$Index][0], $aWaypoints[$Index][1])
        $ActionCounter += 1
        If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
            If _Vanquisher_OnVanquishComplete(" (forward)") Then Return
        EndIf
        If $DeadOnTheRun Then
            $iRouteBlockCount = $VANQUISHER_BLOCK_COUNT_DEATH_RECOVERY
            If Not _Vanquisher_HandleDeadOnTheRunRestart($Index, 0, $aWaypoints[$Index][2], $ActionCounter, "forward") Then Return
        EndIf
    Next
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
        _Vanquisher_OnVanquishComplete(" (forward end)")
        Return
    EndIf
EndFunc

Func MoveandAggroVQWurm($aWaypoints)
    If _Vanquisher_ExitRouteIfDone(" (wurm skip)") Then Return
    $g_b_Vanquisher_HasRunRoute = True
    Local $timer = TimerInit()
    Local $Index = 0
    For $Index = 0 To UBound($aWaypoints) - 1
        If _Vanquisher_ShouldStop() Then Return
        If _Vanquisher_CheckVanquishDuringRoute($timer, " (wurm)") Then Return
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        If _Vanquisher_IsWormSpoorWaypoint($aWaypoints[$Index][2]) Then UseWormSpoor($aWaypoints[$Index][0], $aWaypoints[$Index][1])
        $ActionCounter += 1
        If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
            If _Vanquisher_OnVanquishComplete(" (wurm)") Then Return
        EndIf
		Sleep(7000)
    Next
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
        _Vanquisher_OnVanquishComplete(" (wurm end)")
    EndIf
EndFunc

Func MoveandAggroVQReverse($aWaypoints)
    If _Vanquisher_ExitRouteIfDone(" (reverse skip)") Then Return
    $g_b_Vanquisher_HasRunRoute = True
    Local $timer = TimerInit()
    Local $Index = 0
    Local $iRouteBlockCount = $VANQUISHER_BLOCK_COUNT_DEFAULT
    $ActionCounter = 1
    CurrentAction("Vanquish route reverse — " & UBound($aWaypoints) & " waypoints.")
    For $Index = UBound($aWaypoints) - 1 To 0 Step -1
        If _Vanquisher_ShouldStop() Then Return
        If _Vanquisher_CheckVanquishDuringRoute($timer, " (reverse)") Then Return
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3], $iRouteBlockCount)
        If _Vanquisher_IsWormSpoorWaypoint($aWaypoints[$Index][2]) Then UseWormSpoor($aWaypoints[$Index][0], $aWaypoints[$Index][1])
        $ActionCounter += 1
        If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
            If _Vanquisher_OnVanquishComplete(" (reverse)") Then Return
        EndIf
        If $DeadOnTheRun Then
            $iRouteBlockCount = $VANQUISHER_BLOCK_COUNT_DEATH_RECOVERY
            If Not _Vanquisher_HandleDeadOnTheRunRestart($Index, UBound($aWaypoints) - 1, $aWaypoints[$Index][2], $ActionCounter, "reverse") Then Return
        EndIf
    Next
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
        _Vanquisher_OnVanquishComplete(" (reverse end)")
        Return
    EndIf
    CurrentAction("Route done — " & GetFoesKilled() & " killed, " & GetFoesToKill() & " remaining.")
EndFunc

Func _Vanquisher_OnVanquishComplete($a_s_Phase = "")
    UpdateVanquish()
    If Not GetAreaVanquished() Then Return False
    CurrentAction("Vanquish complete" & $a_s_Phase & " — " & GetFoesKilled() & " killed, 0 remaining.")
    _Vanquisher_FinishRun()
    Return True
EndFunc

Func _Vanquisher_CheckVanquishDuringRoute(ByRef $a_h_Timer, $a_s_Phase)
    If TimerDiff($a_h_Timer) < $CHECK_INTERVAL Then Return False
    $a_h_Timer = TimerInit()
    UpdateVanquish()
    If Not _Vanquisher_ShouldCompleteCurrentZoneNow() Then Return False
    Return _Vanquisher_OnVanquishComplete($a_s_Phase)
EndFunc

Func _Vanquisher_SkillIsResurrection($a_i_SkillID)
    For $l_i_Idx = 0 To UBound($RezSkillIDs) - 1
        If $a_i_SkillID = $RezSkillIDs[$l_i_Idx] Then Return True
    Next
    Return False
EndFunc

; Commanded rezzes for player and heroes: Flesh of my Flesh (791) / Resurrection Signet (2).
; Looked up by SkillID so the bar slot does not matter (not hardcoded to skill 8).
Func _Vanquisher_SkillIsPlayerRez($a_i_SkillID)
    For $l_i_Idx = 0 To UBound($VanquisherPlayerRezSkillIDs) - 1
        If $a_i_SkillID = $VanquisherPlayerRezSkillIDs[$l_i_Idx] Then Return True
    Next
    Return False
EndFunc

; Find bar slot (1-8) holding a commanded rez skill that is recharged. Hero 0 = player.
Func _Vanquisher_GetRechargedRezSlot($a_i_Hero = 0)
    For $l_i_Slot = 1 To 8
        Local $l_i_SkillID = Skill_GetSkillbarInfo($l_i_Slot, "SkillID", $a_i_Hero)
        If $l_i_SkillID = 0 Then ContinueLoop
        If Not _Vanquisher_SkillIsPlayerRez($l_i_SkillID) Then ContinueLoop
        If Skill_GetSkillbarInfo($l_i_Slot, "IsRecharged", $a_i_Hero) Then Return $l_i_Slot
    Next
    Return 0
EndFunc

; Player is alive: walk to the nearest dead ally and rez with Flesh of my Flesh / Res Signet.
Func _Vanquisher_PlayerRezDeadAlly()
    If GetIsDead(-2) Then Return False
    Local $l_i_DeadID = _Vanquisher_GetNearestDeadPartyMember()
    If $l_i_DeadID <= 0 Then Return False

    Local $l_i_Slot = _Vanquisher_GetRechargedRezSlot(0)
    If $l_i_Slot = 0 Then Return False

    Local $l_f_X = Agent_GetAgentInfo($l_i_DeadID, "X")
    Local $l_f_Y = Agent_GetAgentInfo($l_i_DeadID, "Y")
    If ComputeDistance(Agent_GetAgentInfo(-2, "X"), Agent_GetAgentInfo(-2, "Y"), $l_f_X, $l_f_Y) > 1000 Then
        Move($l_f_X, $l_f_Y, 50)
        RndSleep(250)
    EndIf
    UseSkillEx($l_i_Slot, $l_i_DeadID)
    Return True
EndFunc

; Command a living hero to rez the nearest dead ally with FoMF (791) or Res Signet (2).
Func _Vanquisher_HeroRezDeadAlly()
    Local $l_i_DeadID = _Vanquisher_GetNearestDeadPartyMember()
    If $l_i_DeadID = 0 Then Return False

    Local $l_i_HeroCount = Party_GetMyPartyInfo("ArrayHeroPartyMemberSize")
    For $l_i_Hero = 1 To $l_i_HeroCount
        Local $l_i_AgentID = Party_GetMyPartyHeroInfo($l_i_Hero, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then ContinueLoop
        ; Don't command a hero to rez themselves.
        If $l_i_DeadID <> -2 And $l_i_AgentID = $l_i_DeadID Then ContinueLoop

        Local $l_i_Slot = _Vanquisher_GetRechargedRezSlot($l_i_Hero)
        If $l_i_Slot = 0 Then ContinueLoop

        Skill_UseHeroSkill($l_i_Hero, $l_i_Slot, $l_i_DeadID)
        Return True
    Next
    Return False
EndFunc

; Player and/or heroes attempt FoMF / Res Signet on the nearest dead party member.
Func _Vanquisher_TryPartyRez()
    Local $l_b_Player = _Vanquisher_PlayerRezDeadAlly()
    Local $l_b_Hero = _Vanquisher_HeroRezDeadAlly()
    Return $l_b_Player Or $l_b_Hero
EndFunc

Func _Vanquisher_CountDeadPartyMembers()
    Local $l_i_Count = 0
    If GetIsDead(-2) Then $l_i_Count += 1

    Local $l_i_HeroCount = Party_GetMyPartyInfo("ArrayHeroPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HeroCount
        Local $l_i_AgentID = Party_GetMyPartyHeroInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then $l_i_Count += 1
    Next

    Local $l_i_HenchCount = Party_GetMyPartyInfo("ArrayHenchmanPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HenchCount
        Local $l_i_AgentID = Party_GetMyPartyHenchmanInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then $l_i_Count += 1
    Next

    Return $l_i_Count
EndFunc

Func _Vanquisher_CountAvailableResurrections()
    Local $l_i_Count = 0

    If Not GetIsDead(-2) And _Vanquisher_GetRechargedRezSlot(0) > 0 Then $l_i_Count += 1

    Local $l_i_HeroCount = Party_GetMyPartyInfo("ArrayHeroPartyMemberSize")
    For $l_i_Hero = 1 To $l_i_HeroCount
        Local $l_i_AgentID = Party_GetMyPartyHeroInfo($l_i_Hero, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then ContinueLoop
        If _Vanquisher_GetRechargedRezSlot($l_i_Hero) > 0 Then $l_i_Count += 1
    Next

    Return $l_i_Count
EndFunc

Func _Vanquisher_ShouldAttemptResurrection()
    If GetPartyDead() Then Return False
    If _Vanquisher_CountDeadPartyMembers() = 0 Then Return False
    Return _Vanquisher_CountAvailableResurrections() > 0
EndFunc

Func _Vanquisher_GetNearestDeadPartyMember()
    Local $l_i_NearestID = 0
    Local $l_f_NearestDist = 999999

    If GetIsDead(-2) Then Return -2

    Local $l_i_HeroCount = Party_GetMyPartyInfo("ArrayHeroPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HeroCount
        Local $l_i_AgentID = Party_GetMyPartyHeroInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Not Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then ContinueLoop
        Local $l_f_Dist = GetDistance($l_i_AgentID, -2)
        If $l_f_Dist < $l_f_NearestDist Then
            $l_f_NearestDist = $l_f_Dist
            $l_i_NearestID = $l_i_AgentID
        EndIf
    Next

    Local $l_i_HenchCount = Party_GetMyPartyInfo("ArrayHenchmanPartyMemberSize")
    For $l_i_Idx = 1 To $l_i_HenchCount
        Local $l_i_AgentID = Party_GetMyPartyHenchmanInfo($l_i_Idx, "AgentID")
        If $l_i_AgentID = 0 Then ContinueLoop
        If Not Agent_GetAgentInfo($l_i_AgentID, "IsDead") Then ContinueLoop
        Local $l_f_Dist = GetDistance($l_i_AgentID, -2)
        If $l_f_Dist < $l_f_NearestDist Then
            $l_f_NearestDist = $l_f_Dist
            $l_i_NearestID = $l_i_AgentID
        EndIf
    Next

    Return $l_i_NearestID
EndFunc

Func _Vanquisher_JununduTryWail()
    If Not _Vanquisher_IsInJunundu() Then Return False
    If _Vanquisher_CountDeadPartyMembers() = 0 Then Return False
    If Not _Vanquisher_JununduCanCastSkill($JUNUNDU_SKILL_WAIL) Then Return False

    Local $l_i_DeadID = _Vanquisher_GetNearestDeadPartyMember()
    If $l_i_DeadID <= 0 Then Return False

    Local $l_f_Dist = GetDistance($l_i_DeadID, -2)
    If $l_f_Dist > $JUNUNDU_RANGE_WAIL Then
        Move(Agent_GetAgentInfo($l_i_DeadID, "X"), Agent_GetAgentInfo($l_i_DeadID, "Y"), 50)
        Return False
    EndIf

    Return _Vanquisher_JununduTryCast($JUNUNDU_SKILL_WAIL, -2)
EndFunc

Func _Vanquisher_JununduTryTunnel()
    If Not _Vanquisher_IsInJunundu() Then Return False
    Return _Vanquisher_JununduTryCast($JUNUNDU_SKILL_TUNNEL, -2)
EndFunc

Func _Vanquisher_HandlePartyResurrection($a_i_MaxWaitMs = $VANQUISHER_REZ_COMBAT_WAIT_MS)
    Local $l_i_DeadID = _Vanquisher_GetNearestDeadPartyMember()
    If $l_i_DeadID = 0 Then Return

    Local $l_h_Timer = TimerInit()
    Do
        If _Vanquisher_ShouldStop() Or GetPartyDead() Then Return

        ; Keep the player near the corpse so FoMF / Res Signet range is valid.
        If Not GetIsDead(-2) And $l_i_DeadID <> -2 Then
            Local $l_f_X = Agent_GetAgentInfo($l_i_DeadID, "X")
            Local $l_f_Y = Agent_GetAgentInfo($l_i_DeadID, "Y")
            If ComputeDistance(Agent_GetAgentInfo(-2, "X"), Agent_GetAgentInfo(-2, "Y"), $l_f_X, $l_f_Y) > 1000 Then
                Move($l_f_X, $l_f_Y, 50)
            EndIf
        EndIf

        _Vanquisher_TryPartyRez()
        RndSleep(250)

        If $l_i_DeadID = -2 Then
            If Not GetIsDead(-2) Then Return
        ElseIf Not Agent_GetAgentInfo($l_i_DeadID, "IsDead") Then
            $l_i_DeadID = _Vanquisher_GetNearestDeadPartyMember()
            If $l_i_DeadID = 0 Then Return
        EndIf
    Until _Vanquisher_CountAvailableResurrections() = 0 Or _Vanquisher_CountDeadPartyMembers() = 0 Or TimerDiff($l_h_Timer) > $a_i_MaxWaitMs
EndFunc

Func _Vanquisher_ShouldUsePathfinder()
    If _Vanquisher_IsInJunundu() Then Return False
    If Agent_GetAgentPtr(-2) = 0 Then Return False
    If GetMapID() = 0 Then Return False
    If Map_GetInstanceInfo("Type") = $GC_I_MAP_TYPE_LOADING Then Return False
    Return True
EndFunc

Func _Vanquisher_InitPathfinderForZone()
    If Not _Vanquisher_ShouldUsePathfinder() Then Return False

    Local $l_i_MapID = GetMapID()
    If $g_b_Vanquisher_PathfinderZoneActive And $g_i_Vanquisher_PathfinderZoneMapID = $l_i_MapID Then Return True

    _Vanquisher_ShutdownPathfinderForZone()
    If Not _Vanquisher_EnsurePathfinderReady() Then Return False

    $g_b_Vanquisher_PathfinderZoneActive = True
    $g_i_Vanquisher_PathfinderZoneMapID = $l_i_MapID
    Return True
EndFunc

Func _Vanquisher_ShutdownPathfinderForZone()
    If Not $g_b_Vanquisher_PathfinderZoneActive Then Return
    If $g_hPathfinderDLL <> 0 And $g_hPathfinderDLL <> -1 Then Pathfinder_Shutdown()
    $g_b_Vanquisher_PathfinderZoneActive = False
    $g_i_Vanquisher_PathfinderZoneMapID = 0
EndFunc

Func _Vanquisher_EnsurePathfinderReady()
    If $DLL_PATH = "" Then
        $DLL_PATH = @ScriptDir & "\..\..\API\Plugins\Pathfinder\GWPathfinder.dll"
    EndIf
    If Not FileExists($DLL_PATH) Then Return False

    If IsDeclared("g_bPathfinder_CheckForMapUpdates") Then $g_bPathfinder_CheckForMapUpdates = False

    If $g_hPathfinderDLL <> 0 And $g_hPathfinderDLL <> -1 Then Return True

    Local $l_i_InitResult = Pathfinder_Initialize()
    If $l_i_InitResult = 0 Then Return False
    If Not Pathfinder_IsMapAvailable(GetMapID()) Then Return False

    Pathfinder_SetWaypointReachedDistance($VANQUISHER_PATHFINDER_REACHED_DISTANCE)
    Pathfinder_SetSimplifyRange(1250)
    Return True
EndFunc

Func _Vanquisher_PathfinderBuildPath($a_f_DestX, $a_f_DestY)
    Local $l_i_MapID = GetMapID()
    Local $l_f_X = Agent_GetAgentInfo(-2, "X")
    Local $l_f_Y = Agent_GetAgentInfo(-2, "Y")
    Local $l_i_Layer = Agent_GetAgentInfo(-2, "Plane")
    Local $l_a_Path = Pathfinder_FindPath($l_i_MapID, $l_f_X, $l_f_Y, $l_i_Layer, $a_f_DestX, $a_f_DestY, -1, 0, 1250)
    If @error Or Not IsArray($l_a_Path) Then Return 0
    Return $l_a_Path
EndFunc

Func _Vanquisher_PathfinderSelectMoveTarget(ByRef $a_a_Path, ByRef $a_i_PathIndex, $a_f_CurrentX, $a_f_CurrentY, $a_f_DestX, $a_f_DestY, ByRef $a_f_MoveX, ByRef $a_f_MoveY, ByRef $a_i_MoveLayer)
    If IsArray($a_a_Path) Then
        While $a_i_PathIndex < UBound($a_a_Path) And ComputeDistance($a_f_CurrentX, $a_f_CurrentY, $a_a_Path[$a_i_PathIndex][0], $a_a_Path[$a_i_PathIndex][1]) < $VANQUISHER_PATHFINDER_REACHED_DISTANCE
            $a_i_PathIndex += 1
        WEnd

        If $a_i_PathIndex < UBound($a_a_Path) Then
            $a_f_MoveX = $a_a_Path[$a_i_PathIndex][0]
            $a_f_MoveY = $a_a_Path[$a_i_PathIndex][1]
            $a_i_MoveLayer = $a_a_Path[$a_i_PathIndex][2]
            Return
        EndIf
    EndIf

    $a_f_MoveX = $a_f_DestX
    $a_f_MoveY = $a_f_DestY
    $a_i_MoveLayer = Agent_GetAgentInfo(-2, "Plane")
EndFunc

Func _Vanquisher_PathfinderAggroMoveTo($x, $y, $s = "", $z = 1450, $iBlockCount = $VANQUISHER_BLOCK_COUNT_DEFAULT)
    If Not _Vanquisher_InitPathfinderForZone() Then Return False

    Local $iBlocked = 0
    Local $boolOpenChests = _IsOpenChestsEnabled()
    Local $hRepathTimer = TimerInit()
    Local $aPath = _Vanquisher_PathfinderBuildPath($x, $y)
    If Not IsArray($aPath) Then Return False

    Local $iPathIndex = 0
    Local $coordsX = Agent_GetAgentInfo(-2, "X")
    Local $coordsY = Agent_GetAgentInfo(-2, "Y")
    Local $moveX = $x
    Local $moveY = $y
    Local $moveLayer = Agent_GetAgentInfo(-2, "Plane")

    _Vanquisher_PathfinderSelectMoveTarget($aPath, $iPathIndex, $coordsX, $coordsY, $x, $y, $moveX, $moveY, $moveLayer)
    Map_MoveLayer($moveX, $moveY, $moveLayer)

    Do
        If $DeadOnTheRun Or _Vanquisher_ShouldStop() Then ExitLoop

        If _Vanquisher_CountDeadPartyMembers() > 0 Then
            If _Vanquisher_IsInJunundu() Then
                _Vanquisher_JununduTryWail()
            ElseIf _Vanquisher_ShouldAttemptResurrection() Then
                _Vanquisher_HandlePartyResurrection($VANQUISHER_REZ_COMBAT_WAIT_MS)
            EndIf
            If GetPartyDead() Then $DeadOnTheRun = 1
        EndIf

        If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
            _Vanquisher_OnVanquishComplete(" (move)")
            Return True
        EndIf

        If _Vanquisher_ShouldPollConsumables() Then
            _Vanquisher_ApplyConsumables()
            Map_MoveLayer($moveX, $moveY, $moveLayer)
        EndIf

        RndSleep(250)

        Local $oldCoordsX = $coordsX
        Local $oldCoordsY = $coordsY
        Local $nearestenemy = GetNearestEnemyToAgent(-2, $z)
        If $nearestenemy <> 0 Then
            Local $lDistance = GetDistance($nearestenemy, -2)
            If $lDistance < $z And _Vanquisher_AgentID($nearestenemy) <> 0 Then
                Fight($z, $s)
                If _Vanquisher_ShouldStop() Then Return True
                _Vanquisher_ApplyConsumables()
                UpdateVanquish()
                If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
                    _Vanquisher_OnVanquishComplete(" (after fight)")
                    Return True
                EndIf

                $iBlocked = 0
                $aPath = _Vanquisher_PathfinderBuildPath($x, $y)
                If Not IsArray($aPath) Then Return False
                $iPathIndex = 0
                $hRepathTimer = TimerInit()
                $coordsX = Agent_GetAgentInfo(-2, "X")
                $coordsY = Agent_GetAgentInfo(-2, "Y")
                _Vanquisher_PathfinderSelectMoveTarget($aPath, $iPathIndex, $coordsX, $coordsY, $x, $y, $moveX, $moveY, $moveLayer)
                Map_MoveLayer($moveX, $moveY, $moveLayer)
            EndIf
        EndIf

        If $boolOpenChests Then CheckForChest()
        If $DeadOnTheRun Then ExitLoop

        RndSleep(250)
        $coordsX = Agent_GetAgentInfo(-2, "X")
        $coordsY = Agent_GetAgentInfo(-2, "Y")

        If TimerDiff($hRepathTimer) >= $VANQUISHER_PATHFINDER_REPATH_MS Then
            $aPath = _Vanquisher_PathfinderBuildPath($x, $y)
            If IsArray($aPath) Then
                $iPathIndex = 0
            EndIf
            $hRepathTimer = TimerInit()
        EndIf

        _Vanquisher_PathfinderSelectMoveTarget($aPath, $iPathIndex, $coordsX, $coordsY, $x, $y, $moveX, $moveY, $moveLayer)
        If ComputeDistance($coordsX, $coordsY, $x, $y) >= $VANQUISHER_PATHFINDER_REACHED_DISTANCE Then
            Map_MoveLayer($moveX, $moveY, $moveLayer)
        EndIf

        If $oldCoordsX = $coordsX And $oldCoordsY = $coordsY Then
            $iBlocked += 1
            Move($coordsX, $coordsY, 500)
            RndSleep(350)

            $aPath = _Vanquisher_PathfinderBuildPath($x, $y)
            If IsArray($aPath) Then
                $iPathIndex = 0
                _Vanquisher_PathfinderSelectMoveTarget($aPath, $iPathIndex, $coordsX, $coordsY, $x, $y, $moveX, $moveY, $moveLayer)
                Map_MoveLayer($moveX, $moveY, $moveLayer)
            EndIf
        EndIf

        If $boolOpenChests Then CheckForChest()
    Until ComputeDistance($coordsX, $coordsY, $x, $y) < $VANQUISHER_PATHFINDER_REACHED_DISTANCE Or $iBlocked > $iBlockCount

    Return ComputeDistance($coordsX, $coordsY, $x, $y) < $VANQUISHER_PATHFINDER_REACHED_DISTANCE
EndFunc

Func AggroMoveTo($x, $y, $s = "", $z = 1450, $iBlockCount = $VANQUISHER_BLOCK_COUNT_DEFAULT)
    If _Vanquisher_ShouldStop() Then Return
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
        _Vanquisher_OnVanquishComplete(" (waypoint)")
        Return
    EndIf

    _Vanquisher_ApplyConsumablesOnFarmEntry()

    CurrentAction("Moving to Waypoint:" & $s)

    If _Vanquisher_ShouldUsePathfinder() Then
        If _Vanquisher_PathfinderAggroMoveTo($x, $y, $s, $z, $iBlockCount) Then Return
    EndIf

    _Vanquisher_AggroMoveToLegacy($x, $y, $s, $z, $iBlockCount)
EndFunc   ;==>AggroMoveTo

Func _Vanquisher_AggroMoveToLegacy($x, $y, $s = "", $z = 1450, $iBlockCount = $VANQUISHER_BLOCK_COUNT_DEFAULT)
        Local $random = 50
        Local $iBlocked = 0
        Local $boolOpenChests = _IsOpenChestsEnabled()

        Move($x, $y, $random)

        Local $lMe = GetAgentByID(-2)
        Local $coordsX = DllStructGetData($lMe, "X")
        Local $coordsY = DllStructGetData($lMe, "Y")

        Do
                If $DeadOnTheRun Or _Vanquisher_ShouldStop() Then ExitLoop
                If _Vanquisher_CountDeadPartyMembers() > 0 Then
                        If _Vanquisher_IsInJunundu() Then
                                _Vanquisher_JununduTryWail()
                        ElseIf _Vanquisher_ShouldAttemptResurrection() Then
                                _Vanquisher_HandlePartyResurrection($VANQUISHER_REZ_COMBAT_WAIT_MS)
                        EndIf
                        If GetPartyDead() Then $DeadOnTheRun = 1
                EndIf
                If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
                        _Vanquisher_OnVanquishComplete(" (move)")
                        Return
                EndIf
                If _Vanquisher_ShouldPollConsumables() Then
                        _Vanquisher_ApplyConsumables()
                        Move($x, $y, $random)
                EndIf
                RndSleep(250)
                Local $oldCoordsX = $coordsX
                Local $oldCoordsY = $coordsY
                Local $nearestenemy = GetNearestEnemyToAgent(-2, $z)
                If $nearestenemy = 0 And _Vanquisher_IsInJunundu() And ComputeDistance($coordsX, $coordsY, $x, $y) >= 600 Then
                        _Vanquisher_JununduTryTunnel()
                EndIf
                If $nearestenemy <> 0 Then
                        Local $lDistance = GetDistance($nearestenemy, -2)
                        If $lDistance < $z And _Vanquisher_AgentID($nearestenemy) <> 0 Then
                                Fight($z, $s)
                                If _Vanquisher_ShouldStop() Then Return
                                _Vanquisher_ApplyConsumables()
                                UpdateVanquish()
                                If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
                                        _Vanquisher_OnVanquishComplete(" (after fight)")
                                        Return
                                EndIf
                                $iBlocked = 0
                                Move($x, $y, $random)
                        EndIf
                EndIf
                If $boolOpenChests Then
                        CheckForChest()
                EndIf


                If $DeadOnTheRun Then ExitLoop
                RndSleep(250)
                $lMe = GetAgentByID(-2)
                $coordsX = DllStructGetData($lMe, "X")
                $coordsY = DllStructGetData($lMe, "Y")
                If ComputeDistance($coordsX, $coordsY, $x, $y) >= 250 Then
                        Move($x, $y, $random)
                EndIf
                If $oldCoordsX = $coordsX And $oldCoordsY = $coordsY Then
                        $iBlocked += 1
                        Move($coordsX, $coordsY, 500)
                        RndSleep(350)
                        Move($x, $y, $random)
                EndIf
                If $boolOpenChests Then
                        CheckForChest()
                EndIf
        Until ComputeDistance($coordsX, $coordsY, $x, $y) < 250 Or $iBlocked > $iBlockCount
EndFunc

Func GetMaxPartySize($mapid)
    Local $iPartySize = 0

    If $mapid > 0 Then
        $iPartySize = Map_GetAreaInfo($mapid, "MaxPartySize")

        If $iPartySize <= 0 Then
            Local $iControlledOutpostID = Map_GetAreaInfo($mapid, "ControlledOutpostID")
            If $iControlledOutpostID > 0 Then $iPartySize = Map_GetAreaInfo($iControlledOutpostID, "MaxPartySize")
        EndIf
    Else
        $iPartySize = Map_GetCurrentAreaInfo("MaxPartySize")
    EndIf

    If $iPartySize <= 0 Then Return 8
    If $iPartySize <= 4 Then Return 4
    If $iPartySize <= 6 Then Return 6
    If $iPartySize <= 8 Then Return 8
    Return 8
EndFunc
