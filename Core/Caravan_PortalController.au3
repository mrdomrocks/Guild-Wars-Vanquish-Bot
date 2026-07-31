#include-once

; Caravan portal controller:
; handles portal-path lookup, direct caravan catch-up, and explorable-to-next-map
; transitions after a caravan map has finished its vanquish route.

Func _TempleAscalonCaravanGetPortalPath($iTargetMapID)
    Local $aEmpty[0][5]
    Local $iCurrentMap = GetMapID()
    If $iTargetMapID <= 0 Or $iCurrentMap <= 0 Then Return $aEmpty
    If $iCurrentMap = $iTargetMapID Then Return $aEmpty

    Local $aFullPath = Map_GetPathWithPortalCoords($iCurrentMap, $iTargetMapID)
    If Not IsArray($aFullPath) Then Return $aEmpty
    If UBound($aFullPath, 1) < 2 Then Return $aEmpty

    Local $i = 0
    For $i = 1 To UBound($aFullPath, 1) - 2
        If Map_IsOutpost($aFullPath[$i][0]) Then Return $aEmpty
    Next

    Return $aFullPath
EndFunc

Func _TempleAscalonCaravanCanDirectTransition($iTargetMapID)
    Local $aFullPath = _TempleAscalonCaravanGetPortalPath($iTargetMapID)
    Return UBound($aFullPath, 1) > 0
EndFunc

Func _TempleAscalonCaravanWalkPortalPath($aFullPath)
    If Not IsArray($aFullPath) Then Return False
    If UBound($aFullPath, 1) < 2 Then Return False

    Local $iBeforeMap = GetMapID()
    Local $i = 0
    $g_b_Vanquisher_TransitOnly = True
    _Vanquisher_ResetGoOutRouteProgress()

    For $i = 0 To UBound($aFullPath, 1) - 2
        Local $iStepMap = $aFullPath[$i][0]
        Local $fPortalX = $aFullPath[$i][2]
        Local $fPortalY = $aFullPath[$i][3]
        Local $aPortalPoint[1][2] = [[$fPortalX, $fPortalY]]

        If GetMapID() <> $iStepMap Then ExitLoop
        If $fPortalX = 0 And $fPortalY = 0 Then ExitLoop

        CurrentAction("Caravan portal: " & $aFullPath[$i][1] & " -> " & $aFullPath[$i + 1][1] & ".")
        _Vanquisher_RunPathfinderPortalRoute($aPortalPoint, $vqrange, "caravan ")
        If Map_GetInstanceInfo("IsLoading") Then
            Map_WaitMapIsLoaded()
            _Vanquisher_CacheCombatAIForCurrentMap()
        EndIf
        Sleep(1000)
    Next

    $g_b_Vanquisher_TransitOnly = False
    Return GetMapID() <> $iBeforeMap
EndFunc

Func _TempleAscalonCaravanTryCatchUp($iTargetMapID)
    Local $aFullPath = _TempleAscalonCaravanGetPortalPath($iTargetMapID)
    If UBound($aFullPath, 1) = 0 Then Return False
    Return _TempleAscalonCaravanWalkPortalPath($aFullPath)
EndFunc

Func _Vanquisher_RunDynamicCaravanGoOut($iTargetMapID, $sTargetLabel = "")
    Local $iCurrentMap = GetMapID()
    If $iTargetMapID <= 0 Or $iCurrentMap <= 0 Then Return False
    If $iCurrentMap = $iTargetMapID Then Return True

    If $sTargetLabel = "" Then $sTargetLabel = "target map"
    CurrentAction("Routing to " & $sTargetLabel & " via shared caravan portal path.")
    Return _TempleAscalonCaravanTryCatchUp($iTargetMapID)
EndFunc

Func _ShouldStayInExplorableForQueuedRoute()
    If $g_i_VanquisherZoneQueueIndex < 0 Or $g_i_VanquisherZoneQueueIndex >= UBound($g_a_VanquisherZoneQueue) Then Return False

    Local $iNextQueueIndex = $g_i_VanquisherZoneQueueIndex + 1
    If $iNextQueueIndex >= UBound($g_a_VanquisherZoneQueue) Then Return False

    Local $sCurrentProfile = _GetRouteProfileForQueuePosition($g_i_VanquisherZoneQueueIndex)
    Local $sNextProfile = _GetRouteProfileForQueuePosition($iNextQueueIndex)
    Local $iCurrentMapIndex = $g_a_VanquisherZoneQueue[$g_i_VanquisherZoneQueueIndex]
    Local $iNextMapIndex = $g_a_VanquisherZoneQueue[$iNextQueueIndex]

    If _Vanquisher_IsTempleCaravanRouteProfile($sCurrentProfile) And $sCurrentProfile = $sNextProfile Then
        Return _TempleAscalonCaravanCanDirectTransition($g_aMapEntries[$iNextMapIndex][4])
    EndIf

    If Not _Vanquisher_IsCaravanMapIndex($iCurrentMapIndex) Or Not _Vanquisher_IsCaravanMapIndex($iNextMapIndex) Then Return False

    Return _TempleAscalonCaravanCanDirectTransition($g_aMapEntries[$iNextMapIndex][4])
EndFunc
