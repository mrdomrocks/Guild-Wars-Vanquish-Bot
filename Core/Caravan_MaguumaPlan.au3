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
