Func _Vanquisher_FightExitCallback()
    If $g_h_Vanquisher_FightTimer <> 0 And TimerDiff($g_h_Vanquisher_FightTimer) > 120000 Then Return True
    If $DeadOnTheRun Or $g_b_Vanquisher_AbortRoute Then Return True
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then Return True
    Return False
EndFunc

Func _Vanquisher_JununduTryFeast()
    If Not _Vanquisher_IsInJunundu() Then Return False
    Local $l_p_Corpse = GetNearestCorpseToAgent(-2, $JUNUNDU_RANGE_FEAST, $GC_I_AGENT_TYPE_LIVING, 1, "CorpseFilter")
    If $l_p_Corpse = 0 Then Return False
    Local $l_i_CorpseID = _Vanquisher_AgentID($l_p_Corpse)
    If $l_i_CorpseID = 0 Then Return False
    Return _Vanquisher_JununduTryCast($JUNUNDU_SKILL_FEAST, $l_i_CorpseID)
EndFunc

Func _Vanquisher_JununduTryRanged($a_i_EnemyID)
    If _Vanquisher_JununduTryCast($JUNUNDU_SKILL_SIEGE, $a_i_EnemyID) Then Return True
    Return _Vanquisher_JununduTryCast($JUNUNDU_SKILL_UNKNOWN, $a_i_EnemyID)
EndFunc

Func _Vanquisher_JununduTryMelee($a_i_EnemyID)
    If _Vanquisher_JununduTryCast($JUNUNDU_SKILL_SMASH, $a_i_EnemyID) Then Return True
    Return _Vanquisher_JununduTryCast($JUNUNDU_SKILL_STRIKE, $a_i_EnemyID)
EndFunc

Func FightJunundu($a_i_AggroRange = $JUNUNDU_RANGE_AGGRO, $a_s_Label = "")
    If GetPartyDead() Then Return

    $g_h_Vanquisher_FightTimer = TimerInit()

    Do
        If _Vanquisher_FightExitCallback() Then ExitLoop
        If GetIsDead(-2) Then ExitLoop

        _Vanquisher_JununduTryWail()
        _Vanquisher_JununduTryFeast()

        If GetNumberOfFoesInRangeOfAgent(-2, $a_i_AggroRange) = 0 Then ExitLoop

        Local $l_p_Enemy = GetNearestEnemyToAgent(-2, $a_i_AggroRange)
        If $l_p_Enemy = 0 Then ExitLoop

        Local $l_i_EnemyID = _Vanquisher_AgentID($l_p_Enemy)
        If $l_i_EnemyID = 0 Then ExitLoop

        Local $l_f_Dist = GetDistance($l_p_Enemy, -2)
        Agent_ChangeTarget($l_i_EnemyID)

        If $l_f_Dist >= $JUNUNDU_RANGE_SIEGE_MIN And $l_f_Dist <= $JUNUNDU_RANGE_SIEGE_MAX Then
            _Vanquisher_JununduTryRanged($l_i_EnemyID)
        ElseIf $l_f_Dist <= $JUNUNDU_RANGE_MELEE Then
            _Vanquisher_JununduTryMelee($l_i_EnemyID)
        Else
            Agent_Attack($l_i_EnemyID)
            Move(Agent_GetAgentInfo($l_i_EnemyID, "X"), Agent_GetAgentInfo($l_i_EnemyID, "Y"), 100)
        EndIf

        Agent_Attack($l_i_EnemyID)
        RndSleep(250)
    Until GetNumberOfFoesInRangeOfAgent(-2, $a_i_AggroRange) = 0 Or _Vanquisher_FightExitCallback() Or GetIsDead(-2)

    UpdateVanquish()
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
        _Vanquisher_OnVanquishComplete(" (junundu fight)")
        Return
    EndIf
    If $g_b_Vanquisher_AbortRoute Then Return

    PingSleep(3000)
    PickUpLoot()
EndFunc   ;==>FightJunundu

Func Fight($a_i_AggroRange, $a_s_Label = "")
    If _Vanquisher_IsInJunundu() Then
        FightJunundu($a_i_AggroRange, $a_s_Label)
        Return
    EndIf

    If GetPartyDead() Then Return

    _Vanquisher_InitCombatAI()
    If Not $g_b_Vanquisher_CombatAIReady Then
        Sleep(500)
        _Vanquisher_InitCombatAI()
    EndIf
    If Not $g_b_Vanquisher_CombatAIReady Then
        CurrentAction("Combat AI not ready - need Hard Mode, explorable zone, and a cached skill bar.")
        Return
    EndIf

    $g_h_Vanquisher_FightTimer = TimerInit()
    Local $l_f_AnchorX = Agent_GetAgentInfo(-2, "X")
    Local $l_f_AnchorY = Agent_GetAgentInfo(-2, "Y")

    UAI_UpdateAgentCache($a_i_AggroRange)
    UAI_Fight($l_f_AnchorX, $l_f_AnchorY, $a_i_AggroRange, 3500, $g_i_FinisherMode, True, 0, False, "_Vanquisher_FightExitCallback")

    UpdateVanquish()
    If _Vanquisher_ShouldCompleteCurrentZoneNow() Then
        _Vanquisher_OnVanquishComplete(" (fight)")
        Return
    EndIf
    If $g_b_Vanquisher_AbortRoute Then Return

    PingSleep(3000)
    PickUpLoot()
EndFunc   ;==>Fight
