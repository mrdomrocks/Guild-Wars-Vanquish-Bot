#include-once

; Maguuma caravan hop plan metadata used by SpecialRoute_TempleOfTheAgesMaguumaCaravan.
; Continuous portal spine (no planned resign breaks):
; - TOA -> Talmark -> MajestysRest -> SageLands -> Mamnoon -> Silverwood -> EttinsBack
; - Northern split: EttinsBack -> ReedBog -> TheFalls
; - Southern split: return through EttinsBack -> DryTop -> TangleRoot
; Between maps: portal catch-up via shared explorable path / neighbor GoOut.
; Resign+TravelTo only as stall recovery when no portal hop can be made.

Global Const $GC_I_MAGUUMA_CARAVAN_MAP_COUNT = 10

; Columns: map id, outpost id, transit, transit2, transit3, GoOut func name, unused, unused, label
Global $g_a_MaguumaCaravanPlan[$GC_I_MAGUUMA_CARAVAN_MAP_COUNT][9]

Func _Vanquisher_InitMaguumaCaravanPlan()
    If $g_a_MaguumaCaravanPlan[0][0] <> 0 Then Return

    $g_a_MaguumaCaravanPlan[0][0] = $TalmarkWilderness_Map
    $g_a_MaguumaCaravanPlan[0][1] = $TalmarkWilderness_Outpost
    $g_a_MaguumaCaravanPlan[0][2] = $TalmarkWilderness_Transit
    $g_a_MaguumaCaravanPlan[0][3] = 0
    $g_a_MaguumaCaravanPlan[0][4] = 0
    $g_a_MaguumaCaravanPlan[0][5] = "GoOutTalmarkWilderness"
    $g_a_MaguumaCaravanPlan[0][8] = "TalmarkWilderness"

    $g_a_MaguumaCaravanPlan[1][0] = $MajestysRest_Map
    $g_a_MaguumaCaravanPlan[1][1] = $MajestysRest_Outpost
    $g_a_MaguumaCaravanPlan[1][2] = $MajestysRest_Transit
    $g_a_MaguumaCaravanPlan[1][3] = $MajestysRest_Transit2
    $g_a_MaguumaCaravanPlan[1][4] = 0
    $g_a_MaguumaCaravanPlan[1][5] = "GoOutMajestysRest"
    $g_a_MaguumaCaravanPlan[1][8] = "MajestysRest"

    $g_a_MaguumaCaravanPlan[2][0] = $SageLands_Map
    $g_a_MaguumaCaravanPlan[2][1] = $SageLands_Outpost
    $g_a_MaguumaCaravanPlan[2][2] = $SageLands_Transit
    $g_a_MaguumaCaravanPlan[2][3] = 0
    $g_a_MaguumaCaravanPlan[2][4] = 0
    $g_a_MaguumaCaravanPlan[2][5] = "GoOutSageLands"
    $g_a_MaguumaCaravanPlan[2][8] = "SageLands"

    $g_a_MaguumaCaravanPlan[3][0] = $MamnoonLagoon_Map
    $g_a_MaguumaCaravanPlan[3][1] = $MamnoonLagoon_Outpost
    $g_a_MaguumaCaravanPlan[3][2] = $MamnoonLagoon_Transit
    $g_a_MaguumaCaravanPlan[3][3] = $MamnoonLagoon_Transit2
    $g_a_MaguumaCaravanPlan[3][4] = 0
    $g_a_MaguumaCaravanPlan[3][5] = "GoOutMamnoonLagoon"
    $g_a_MaguumaCaravanPlan[3][8] = "MamnoonLagoon"

    $g_a_MaguumaCaravanPlan[4][0] = $Silverwood_Map
    $g_a_MaguumaCaravanPlan[4][1] = $Silverwood_Outpost
    $g_a_MaguumaCaravanPlan[4][2] = 0
    $g_a_MaguumaCaravanPlan[4][3] = 0
    $g_a_MaguumaCaravanPlan[4][4] = 0
    $g_a_MaguumaCaravanPlan[4][5] = "GoOutSilverwood"
    $g_a_MaguumaCaravanPlan[4][8] = "Silverwood"

    $g_a_MaguumaCaravanPlan[5][0] = $EttinsBack_Map
    $g_a_MaguumaCaravanPlan[5][1] = $EttinsBack_Outpost
    $g_a_MaguumaCaravanPlan[5][2] = 0
    $g_a_MaguumaCaravanPlan[5][3] = 0
    $g_a_MaguumaCaravanPlan[5][4] = 0
    $g_a_MaguumaCaravanPlan[5][5] = "GoOutEttinsBack"
    $g_a_MaguumaCaravanPlan[5][8] = "EttinsBack"

    $g_a_MaguumaCaravanPlan[6][0] = $ReedBog_Map
    $g_a_MaguumaCaravanPlan[6][1] = $ReedBog_Outpost
    $g_a_MaguumaCaravanPlan[6][2] = $ReedBog_Transit
    $g_a_MaguumaCaravanPlan[6][3] = 0
    $g_a_MaguumaCaravanPlan[6][4] = 0
    $g_a_MaguumaCaravanPlan[6][5] = "GoOutReedBog"
    $g_a_MaguumaCaravanPlan[6][8] = "ReedBog"

    $g_a_MaguumaCaravanPlan[7][0] = $TheFalls_Map
    $g_a_MaguumaCaravanPlan[7][1] = $TheFalls_Outpost
    $g_a_MaguumaCaravanPlan[7][2] = $TheFalls_Transit
    $g_a_MaguumaCaravanPlan[7][3] = $TheFalls_Transit2
    $g_a_MaguumaCaravanPlan[7][4] = 0
    $g_a_MaguumaCaravanPlan[7][5] = "GoOutTheFalls"
    $g_a_MaguumaCaravanPlan[7][8] = "TheFalls"

    $g_a_MaguumaCaravanPlan[8][0] = $DryTop_Map
    $g_a_MaguumaCaravanPlan[8][1] = $DryTop_Outpost
    $g_a_MaguumaCaravanPlan[8][2] = $DryTop_Transit
    $g_a_MaguumaCaravanPlan[8][3] = 0
    $g_a_MaguumaCaravanPlan[8][4] = 0
    $g_a_MaguumaCaravanPlan[8][5] = "GoOutDryTop"
    $g_a_MaguumaCaravanPlan[8][8] = "DryTop"

    $g_a_MaguumaCaravanPlan[9][0] = $TangleRoot_Map
    $g_a_MaguumaCaravanPlan[9][1] = $TangleRoot_Outpost
    $g_a_MaguumaCaravanPlan[9][2] = 0
    $g_a_MaguumaCaravanPlan[9][3] = 0
    $g_a_MaguumaCaravanPlan[9][4] = 0
    $g_a_MaguumaCaravanPlan[9][5] = "GoOutTangleRoot"
    $g_a_MaguumaCaravanPlan[9][8] = "TangleRoot"
EndFunc

Func _Vanquisher_IsMaguumaCaravanEntryMap($iMapID, $iStage)
    If $iStage < 0 Or $iStage >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then Return False
    If $iMapID = $g_a_MaguumaCaravanPlan[$iStage][0] Then Return True
    If $iMapID = $g_a_MaguumaCaravanPlan[$iStage][1] Then Return True
    If $g_a_MaguumaCaravanPlan[$iStage][2] > 0 And $iMapID = $g_a_MaguumaCaravanPlan[$iStage][2] Then Return True
    If $g_a_MaguumaCaravanPlan[$iStage][3] > 0 And $iMapID = $g_a_MaguumaCaravanPlan[$iStage][3] Then Return True
    If $g_a_MaguumaCaravanPlan[$iStage][4] > 0 And $iMapID = $g_a_MaguumaCaravanPlan[$iStage][4] Then Return True
    Return False
EndFunc

; True when $iMapID is any Maguuma spine farm map / outpost / transit for any stage.
Func _Vanquisher_IsOnMaguumaCaravanSpine($iMapID = -1)
    _Vanquisher_InitMaguumaCaravanPlan()
    If $iMapID < 0 Then $iMapID = GetMapID()
    Local $i = 0
    For $i = 0 To $GC_I_MAGUUMA_CARAVAN_MAP_COUNT - 1
        If _Vanquisher_IsMaguumaCaravanEntryMap($iMapID, $i) Then Return True
    Next
    Return False
EndFunc

; Stage index for the current map on the Maguuma spine, or 0 to begin from TOA -> Talmark.
; Farm map wins, then transit, then lowest outpost stage (TOA is shared by Talmark/MajestysRest).
Func _Vanquisher_MaguumaCaravanStageForCurrentMap()
    _Vanquisher_InitMaguumaCaravanPlan()
    Local $iMapID = Number(GetMapID())
    Local $i = 0
    For $i = 0 To $GC_I_MAGUUMA_CARAVAN_MAP_COUNT - 1
        If Number($g_a_MaguumaCaravanPlan[$i][0]) = $iMapID Then Return $i
    Next
    For $i = 0 To $GC_I_MAGUUMA_CARAVAN_MAP_COUNT - 1
        If $g_a_MaguumaCaravanPlan[$i][2] > 0 And Number($g_a_MaguumaCaravanPlan[$i][2]) = $iMapID Then Return $i
        If $g_a_MaguumaCaravanPlan[$i][3] > 0 And Number($g_a_MaguumaCaravanPlan[$i][3]) = $iMapID Then Return $i
        If $g_a_MaguumaCaravanPlan[$i][4] > 0 And Number($g_a_MaguumaCaravanPlan[$i][4]) = $iMapID Then Return $i
    Next
    For $i = 0 To $GC_I_MAGUUMA_CARAVAN_MAP_COUNT - 1
        If Number($g_a_MaguumaCaravanPlan[$i][1]) = $iMapID Then Return $i
    Next
    Return 0
EndFunc

Func _Vanquisher_MaguumaCaravanStageScriptName($iStage)
    Local $aScripts[10] = [ _
            "CaravanMaguuma_TalmarkWilderness", _
            "CaravanMaguuma_MajestysRest", _
            "CaravanMaguuma_SageLands", _
            "CaravanMaguuma_MamnoonLagoon", _
            "CaravanMaguuma_Silverwood", _
            "CaravanMaguuma_EttinsBack", _
            "CaravanMaguuma_ReedBog", _
            "CaravanMaguuma_TheFalls", _
            "CaravanMaguuma_DryTop", _
            "CaravanMaguuma_TangleRoot" _
            ]
    If $iStage < 0 Or $iStage >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then Return ""
    Return $aScripts[$iStage]
EndFunc

; True when this map id is historically vanquished (live bitfield and/or cached scan flags).
; Note: AutoIt IsFunc() only accepts function references — never guard Call()/direct calls with IsFunc("Name").
Func _Vanquisher_IsMapIdHistoricallyVanquished($iMapID)
    $iMapID = Number($iMapID)
    If $iMapID <= 0 Then Return False

    ; Authoritative live bit — same VanquishedAreasArray the connect-time map scan reads.
    If _Vanquisher_ReadLiveHistoryBitForMapId($iMapID) Then Return True

    ; Cached connect-time flags on any matching campaign/caravan row.
    If IsDeclared("g_aMapEntries") Then
        Local $i = 0
        For $i = 0 To UBound($g_aMapEntries) - 1
            If Number($g_aMapEntries[$i][4]) <> $iMapID Then ContinueLoop
            If $g_aMapEntries[$i][5] Then Return True
        Next
    EndIf

    Return False
EndFunc

; Uses connect-time history flags on Caravan Internal map entries (g_aMapEntries[][5]).
Func _Vanquisher_IsCaravanMapHistoricallyVanquished($sScriptName)
    If $sScriptName = "" Then Return False
    Local $iMapIndex = _FindMapIndexByScriptName($sScriptName)
    If $iMapIndex >= 0 Then
        If $g_aMapEntries[$iMapIndex][5] Then Return True
        If _Vanquisher_IsMapIdHistoricallyVanquished($g_aMapEntries[$iMapIndex][4]) Then Return True
    EndIf
    Return False
EndFunc

Func _Vanquisher_MaguumaCaravanIsStageHistoricallyVanquished($iStage)
    _Vanquisher_InitMaguumaCaravanPlan()
    If $iStage < 0 Or $iStage >= $GC_I_MAGUUMA_CARAVAN_MAP_COUNT Then Return False
    Local $iMapID = Number($g_a_MaguumaCaravanPlan[$iStage][0])
    If $iMapID > 0 And _Vanquisher_IsMapIdHistoricallyVanquished($iMapID) Then Return True
    Return _Vanquisher_IsCaravanMapHistoricallyVanquished(_Vanquisher_MaguumaCaravanStageScriptName($iStage))
EndFunc

; First stage from $iFromStage that is not marked vanquished by map scan; or map count if all done.
Func _Vanquisher_MaguumaCaravanFirstIncompleteStage($iFromStage = 0)
    If $iFromStage < 0 Then $iFromStage = 0
    _Vanquisher_InitMaguumaCaravanPlan()
    Local $i = 0
    For $i = $iFromStage To $GC_I_MAGUUMA_CARAVAN_MAP_COUNT - 1
        If Not _Vanquisher_MaguumaCaravanIsStageHistoricallyVanquished($i) Then Return $i
    Next
    Return $GC_I_MAGUUMA_CARAVAN_MAP_COUNT
EndFunc
