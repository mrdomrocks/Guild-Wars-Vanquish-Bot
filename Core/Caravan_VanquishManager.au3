#include-once

; Caravan vanquish manager:
; keeps caravan maps on their coordinate routes until the map script finishes,
; then finalizes the vanquish handoff for the next portal transition.

Func _Vanquisher_ShouldRunCaravanWaypoint()
    If _Vanquisher_ShouldStop() Then Return False
    If _Vanquisher_ShouldDelayCaravanTransition() Then Return True
    Return Not GetAreaVanquished()
EndFunc

Func _Vanquisher_ShouldCompleteCurrentZoneNow()
    If $g_b_Vanquisher_TransitOnly Then Return False
    If Not _Vanquisher_IsVanquishComplete() Then Return False
    If _Vanquisher_ShouldDelayCaravanTransition() Then Return False
    Return True
EndFunc

Func _Vanquisher_ShouldFinalizeDelayedCaravanAfterRoute($iMapIndex = -1)
    If Not _Vanquisher_ShouldDelayCaravanTransition() Then Return False
    ; Maguuma special runner owns resign/advance between its own stages.
    If _Vanquisher_IsCombinedMaguumaCaravanActive() Then Return False
    If $g_b_Vanquisher_TransitOnly Then Return False
    If Not Map_GetInstanceInfo("IsExplorable") Then Return False
    If Not GetAreaVanquished() Then Return False

    If $iMapIndex >= 0 And IsDeclared("g_aMapEntries") Then
        If $iMapIndex >= UBound($g_aMapEntries) Then Return False
        Local $iTargetMapID = $g_aMapEntries[$iMapIndex][4]
        If $iTargetMapID > 0 And GetMapID() <> $iTargetMapID Then Return False
    EndIf

    Return True
EndFunc

Func _Vanquisher_FinalizeDelayedCaravanAfterRoute($iMapIndex = -1)
    If Not _Vanquisher_ShouldFinalizeDelayedCaravanAfterRoute($iMapIndex) Then Return False
    _Vanquisher_OnVanquishComplete(" (caravan route complete)")
    Return True
EndFunc
