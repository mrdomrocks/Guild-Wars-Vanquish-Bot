#include-once

; Caravan route controller:
; owns route-profile detection and readiness checks for queued caravan maps.

Func _Vanquisher_GetCurrentQueueRouteProfile()
    If Not IsDeclared("g_i_VanquisherZoneQueueIndex") Then Return ""
    If Not IsFunc("_GetRouteProfileForQueuePosition") Then Return ""
    Return _GetRouteProfileForQueuePosition($g_i_VanquisherZoneQueueIndex)
EndFunc

Func _Vanquisher_IsCaravanMapIndex($iMapIndex)
    If Not IsDeclared("g_aMapEntries") Then Return False
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return False

    Local $sRouteFunc = ""
    If IsFunc("_GetRouteFunctionNameForMapIndex") Then $sRouteFunc = _GetRouteFunctionNameForMapIndex($iMapIndex)
    If StringLeft($sRouteFunc, 9) = "VQCaravan" Then Return True

    Local $sScriptName = $g_aMapEntries[$iMapIndex][8]
    If StringLeft($sScriptName, 7) = "Caravan" Then Return True

    Return False
EndFunc

Func _Vanquisher_IsCurrentQueuedCaravanMap()
    If Not IsDeclared("g_i_VanquisherZoneQueueIndex") Or Not IsDeclared("g_a_VanquisherZoneQueue") Then Return False
    If $g_i_VanquisherZoneQueueIndex < 0 Or $g_i_VanquisherZoneQueueIndex >= UBound($g_a_VanquisherZoneQueue) Then Return False
    Return _Vanquisher_IsCaravanMapIndex($g_a_VanquisherZoneQueue[$g_i_VanquisherZoneQueueIndex])
EndFunc

Func _Vanquisher_IsCombinedMaguumaCaravanActive()
    Return IsDeclared("g_b_Vanquisher_CombinedMaguumaCaravanActive") And $g_b_Vanquisher_CombinedMaguumaCaravanActive
EndFunc

Func _Vanquisher_IsTempleCaravanRouteProfile($sRouteProfile = "")
    If $sRouteProfile = "" Then $sRouteProfile = _Vanquisher_GetCurrentQueueRouteProfile()
    If $sRouteProfile = "" Then Return _Vanquisher_IsCurrentQueuedCaravanMap()

    Return StringCompare($sRouteProfile, "temple_ascalon_caravan", 0) = 0 _
        Or StringCompare($sRouteProfile, "temple_maguuma_caravan", 0) = 0
EndFunc

Func _Vanquisher_ShouldDelayCaravanTransition()
    Return _Vanquisher_IsTempleCaravanRouteProfile() _
        Or _Vanquisher_IsCurrentQueuedCaravanMap() _
        Or _Vanquisher_IsCombinedMaguumaCaravanActive()
EndFunc

Func _IsQueuedTargetReady($sTargetTitle, $iTargetMapID)
    Local $iCurrentMap = GetMapID()
    If $iCurrentMap = $iTargetMapID Then Return True

    ; Caravan queue titles may arrive prefixed; transit cases use bare map names.
    If StringLeft($sTargetTitle, 15) = "CaravanAscalon_" Then $sTargetTitle = StringTrimLeft($sTargetTitle, 15)
    If StringLeft($sTargetTitle, 15) = "CaravanMaguuma_" Then $sTargetTitle = StringTrimLeft($sTargetTitle, 15)

    Switch $sTargetTitle
        Case "CursedLands"
            Return $iCurrentMap = $CursedLands_Transit
        Case "TalmarkWilderness"
            Return $iCurrentMap = $TalmarkWilderness_Transit
        Case "MajestysRest"
            Return $iCurrentMap = $MajestysRest_Transit Or $iCurrentMap = $MajestysRest_Transit2
        Case "NeboTerrace"
            Return $iCurrentMap = $NeboTerrace_Transit Or $iCurrentMap = $NeboTerrace_Transit2
        Case "MamnoonLagoon"
            Return $iCurrentMap = $MamnoonLagoon_Transit
        Case "GriffonsMouth"
            Return $iCurrentMap = $GriffonsMouth_Transit
        Case "DryTop"
            Return $iCurrentMap = $DryTop_Transit
        Case "IronHorseMine"
            Return $iCurrentMap = $IronHorseMine_Transit
        Case "AscalonFoothills"
            Return $iCurrentMap = $AscalonFoothills_Transit
        Case "DiessaLowlands"
            Return $iCurrentMap = $DiessaLowlands_Transit
        Case "FlameTempleCorridor"
            Return $iCurrentMap = $FlameTempleCorridor_Transit
        Case "DragonsGullet"
            Return $iCurrentMap = $DragonsGullet_Transit Or $iCurrentMap = $DragonsGullet_Transit2
        Case "TheBreach"
            Return $iCurrentMap = $TheBreach_Transit Or $iCurrentMap = $TheBreach_Transit2 Or $iCurrentMap = $TheBreach_Transit3
        Case "OldAscalon"
            Return $iCurrentMap = $OldAscalon_Transit
        Case "RegentValley"
            Return $iCurrentMap = $RegentValley_Transit
        Case "PockmarkFlats"
            Return $iCurrentMap = $PockmarkFlats_Transit
        Case "EasternFrontier"
            Return $iCurrentMap = $EasternFrontier_Transit
        Case "ReedBog"
            Return $iCurrentMap = $ReedBog_Transit
        Case "TheFalls"
            Return $iCurrentMap = $TheFalls_Transit Or $iCurrentMap = $TheFalls_Transit2
    EndSwitch

    Return False
EndFunc
