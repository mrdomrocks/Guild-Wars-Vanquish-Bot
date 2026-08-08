#include-once

; Ascalon caravan hop plan metadata used by SpecialRoute_TempleOfTheAgesAscalonCaravan.
; Continuous portal spine (no planned resign breaks):
; - TOA -> BlackCurtain -> CursedLands -> NeboTerrace -> NorthKryta -> ScoundrelsRise
; - -> GriffonsMouth -> DeldrimorBowl -> AnvilRock -> IronHorseMine -> TravelersVale
; - -> AscalonFoothills -> DiessaLowlands -> FlameTempleCorridor -> DragonsGullet
; - -> TheBreach -> OldAscalon -> RegentValley -> PockmarkFlats -> EasternFrontier
; Between maps: portal catch-up via shared explorable path / neighbor GoOut.
; Full-route history scan jumps stage to the first open map; GoOut/TryCatchUp portals there.
; Resign+TravelTo only as stall recovery when no portal hop can be made.
; Never mid-route TravelTo.

Global Const $GC_I_ASCALON_CARAVAN_MAP_COUNT = 19

; Columns: map id, outpost id, transit, transit2, transit3, GoOut func name, unused, unused, label
Global $g_a_AscalonCaravanPlan[$GC_I_ASCALON_CARAVAN_MAP_COUNT][9]

Func _Vanquisher_InitAscalonCaravanPlan()
    If $g_a_AscalonCaravanPlan[0][0] <> 0 Then Return

    $g_a_AscalonCaravanPlan[0][0] = $TheBlackCurtain_Map
    $g_a_AscalonCaravanPlan[0][1] = $TheBlackCurtain_Outpost
    $g_a_AscalonCaravanPlan[0][2] = 0
    $g_a_AscalonCaravanPlan[0][3] = 0
    $g_a_AscalonCaravanPlan[0][4] = 0
    $g_a_AscalonCaravanPlan[0][5] = "GoOutTheBlackCurtain"
    $g_a_AscalonCaravanPlan[0][8] = "TheBlackCurtain"

    $g_a_AscalonCaravanPlan[1][0] = $CursedLands_Map
    $g_a_AscalonCaravanPlan[1][1] = $CursedLands_Outpost
    $g_a_AscalonCaravanPlan[1][2] = $CursedLands_Transit
    $g_a_AscalonCaravanPlan[1][3] = 0
    $g_a_AscalonCaravanPlan[1][4] = 0
    $g_a_AscalonCaravanPlan[1][5] = "GoOutCursedLands"
    $g_a_AscalonCaravanPlan[1][8] = "CursedLands"

    $g_a_AscalonCaravanPlan[2][0] = $NeboTerrace_Map
    $g_a_AscalonCaravanPlan[2][1] = $NeboTerrace_Outpost
    $g_a_AscalonCaravanPlan[2][2] = $NeboTerrace_Transit
    $g_a_AscalonCaravanPlan[2][3] = $NeboTerrace_Transit2
    $g_a_AscalonCaravanPlan[2][4] = 0
    $g_a_AscalonCaravanPlan[2][5] = "GoOutNeboTerrace"
    $g_a_AscalonCaravanPlan[2][8] = "NeboTerrace"

    $g_a_AscalonCaravanPlan[3][0] = $NorthKrytaProvince_Map
    $g_a_AscalonCaravanPlan[3][1] = $NorthKrytaProvince_Outpost
    $g_a_AscalonCaravanPlan[3][2] = 0
    $g_a_AscalonCaravanPlan[3][3] = 0
    $g_a_AscalonCaravanPlan[3][4] = 0
    $g_a_AscalonCaravanPlan[3][5] = "GoOutNorthKrytaProvince"
    $g_a_AscalonCaravanPlan[3][8] = "NorthKrytaProvince"

    $g_a_AscalonCaravanPlan[4][0] = $ScoundrelsRise_Map
    $g_a_AscalonCaravanPlan[4][1] = $ScoundrelsRise_Outpost
    $g_a_AscalonCaravanPlan[4][2] = 0
    $g_a_AscalonCaravanPlan[4][3] = 0
    $g_a_AscalonCaravanPlan[4][4] = 0
    $g_a_AscalonCaravanPlan[4][5] = "GoOutScoundrelsRise"
    $g_a_AscalonCaravanPlan[4][8] = "ScoundrelsRise"

    $g_a_AscalonCaravanPlan[5][0] = $GriffonsMouth_Map
    $g_a_AscalonCaravanPlan[5][1] = $GriffonsMouth_Outpost
    $g_a_AscalonCaravanPlan[5][2] = $GriffonsMouth_Transit
    $g_a_AscalonCaravanPlan[5][3] = 0
    $g_a_AscalonCaravanPlan[5][4] = 0
    $g_a_AscalonCaravanPlan[5][5] = "GoOutGriffonsMouth"
    $g_a_AscalonCaravanPlan[5][8] = "GriffonsMouth"

    $g_a_AscalonCaravanPlan[6][0] = $DeldrimorBowl_Map
    $g_a_AscalonCaravanPlan[6][1] = $DeldrimorBowl_Outpost
    $g_a_AscalonCaravanPlan[6][2] = 0
    $g_a_AscalonCaravanPlan[6][3] = 0
    $g_a_AscalonCaravanPlan[6][4] = 0
    $g_a_AscalonCaravanPlan[6][5] = "GoOutDeldrimorBowl"
    $g_a_AscalonCaravanPlan[6][8] = "DeldrimorBowl"

    $g_a_AscalonCaravanPlan[7][0] = $AnvilRock_Map
    $g_a_AscalonCaravanPlan[7][1] = $AnvilRock_Outpost
    $g_a_AscalonCaravanPlan[7][2] = 0
    $g_a_AscalonCaravanPlan[7][3] = 0
    $g_a_AscalonCaravanPlan[7][4] = 0
    $g_a_AscalonCaravanPlan[7][5] = "GoOutAnvilRock"
    $g_a_AscalonCaravanPlan[7][8] = "AnvilRock"

    $g_a_AscalonCaravanPlan[8][0] = $IronHorseMine_Map
    $g_a_AscalonCaravanPlan[8][1] = $IronHorseMine_Outpost
    $g_a_AscalonCaravanPlan[8][2] = $IronHorseMine_Transit
    $g_a_AscalonCaravanPlan[8][3] = 0
    $g_a_AscalonCaravanPlan[8][4] = 0
    $g_a_AscalonCaravanPlan[8][5] = "GoOutIronHorseMine"
    $g_a_AscalonCaravanPlan[8][8] = "IronHorseMine"

    $g_a_AscalonCaravanPlan[9][0] = $TravelersVale_Map
    $g_a_AscalonCaravanPlan[9][1] = $TravelersVale_Outpost
    $g_a_AscalonCaravanPlan[9][2] = 0
    $g_a_AscalonCaravanPlan[9][3] = 0
    $g_a_AscalonCaravanPlan[9][4] = 0
    $g_a_AscalonCaravanPlan[9][5] = "GoOutTravelersVale"
    $g_a_AscalonCaravanPlan[9][8] = "TravelersVale"

    $g_a_AscalonCaravanPlan[10][0] = $AscalonFoothills_Map
    $g_a_AscalonCaravanPlan[10][1] = 0
    $g_a_AscalonCaravanPlan[10][2] = $AscalonFoothills_Transit
    $g_a_AscalonCaravanPlan[10][3] = 0
    $g_a_AscalonCaravanPlan[10][4] = 0
    $g_a_AscalonCaravanPlan[10][5] = "GoOutAscalonFoothills"
    $g_a_AscalonCaravanPlan[10][8] = "AscalonFoothills"

    $g_a_AscalonCaravanPlan[11][0] = $DiessaLowlands_Map
    $g_a_AscalonCaravanPlan[11][1] = 0
    $g_a_AscalonCaravanPlan[11][2] = $DiessaLowlands_Transit
    $g_a_AscalonCaravanPlan[11][3] = 0
    $g_a_AscalonCaravanPlan[11][4] = 0
    $g_a_AscalonCaravanPlan[11][5] = "GoOutDiessaLowlands"
    $g_a_AscalonCaravanPlan[11][8] = "DiessaLowlands"

    $g_a_AscalonCaravanPlan[12][0] = $FlameTempleCorridor_Map
    $g_a_AscalonCaravanPlan[12][1] = 0
    $g_a_AscalonCaravanPlan[12][2] = $FlameTempleCorridor_Transit
    $g_a_AscalonCaravanPlan[12][3] = 0
    $g_a_AscalonCaravanPlan[12][4] = 0
    $g_a_AscalonCaravanPlan[12][5] = "GoOutFlameTempleCorridor"
    $g_a_AscalonCaravanPlan[12][8] = "FlameTempleCorridor"

    $g_a_AscalonCaravanPlan[13][0] = $DragonsGullet_Map
    $g_a_AscalonCaravanPlan[13][1] = 0
    $g_a_AscalonCaravanPlan[13][2] = $DragonsGullet_Transit
    $g_a_AscalonCaravanPlan[13][3] = $DragonsGullet_Transit2
    $g_a_AscalonCaravanPlan[13][4] = 0
    $g_a_AscalonCaravanPlan[13][5] = "GoOutDragonsGullet"
    $g_a_AscalonCaravanPlan[13][8] = "DragonsGullet"

    $g_a_AscalonCaravanPlan[14][0] = $TheBreach_Map
    $g_a_AscalonCaravanPlan[14][1] = 0
    $g_a_AscalonCaravanPlan[14][2] = $TheBreach_Transit
    $g_a_AscalonCaravanPlan[14][3] = $TheBreach_Transit2
    $g_a_AscalonCaravanPlan[14][4] = $TheBreach_Transit3
    $g_a_AscalonCaravanPlan[14][5] = "GoOutTheBreach"
    $g_a_AscalonCaravanPlan[14][8] = "TheBreach"

    $g_a_AscalonCaravanPlan[15][0] = $OldAscalon_Map
    $g_a_AscalonCaravanPlan[15][1] = 0
    $g_a_AscalonCaravanPlan[15][2] = $OldAscalon_Transit
    $g_a_AscalonCaravanPlan[15][3] = 0
    $g_a_AscalonCaravanPlan[15][4] = 0
    $g_a_AscalonCaravanPlan[15][5] = "GoOutOldAscalon"
    $g_a_AscalonCaravanPlan[15][8] = "OldAscalon"

    $g_a_AscalonCaravanPlan[16][0] = $RegentValley_Map
    $g_a_AscalonCaravanPlan[16][1] = 0
    $g_a_AscalonCaravanPlan[16][2] = $RegentValley_Transit
    $g_a_AscalonCaravanPlan[16][3] = 0
    $g_a_AscalonCaravanPlan[16][4] = 0
    $g_a_AscalonCaravanPlan[16][5] = "GoOutRegentValley"
    $g_a_AscalonCaravanPlan[16][8] = "RegentValley"

    $g_a_AscalonCaravanPlan[17][0] = $PockmarkFlats_Map
    $g_a_AscalonCaravanPlan[17][1] = 0
    $g_a_AscalonCaravanPlan[17][2] = $PockmarkFlats_Transit
    $g_a_AscalonCaravanPlan[17][3] = 0
    $g_a_AscalonCaravanPlan[17][4] = 0
    $g_a_AscalonCaravanPlan[17][5] = "GoOutPockmarkFlats"
    $g_a_AscalonCaravanPlan[17][8] = "PockmarkFlats"

    $g_a_AscalonCaravanPlan[18][0] = $EasternFrontier_Map
    $g_a_AscalonCaravanPlan[18][1] = 0
    $g_a_AscalonCaravanPlan[18][2] = $EasternFrontier_Transit
    $g_a_AscalonCaravanPlan[18][3] = 0
    $g_a_AscalonCaravanPlan[18][4] = 0
    $g_a_AscalonCaravanPlan[18][5] = "GoOutEasternFrontier"
    $g_a_AscalonCaravanPlan[18][8] = "EasternFrontier"
EndFunc

Func _Vanquisher_IsAscalonCaravanEntryMap($iMapID, $iStage)
    If $iStage < 0 Or $iStage >= $GC_I_ASCALON_CARAVAN_MAP_COUNT Then Return False
    If $iMapID = $g_a_AscalonCaravanPlan[$iStage][0] Then Return True
    If $g_a_AscalonCaravanPlan[$iStage][1] > 0 And $iMapID = $g_a_AscalonCaravanPlan[$iStage][1] Then Return True
    If $g_a_AscalonCaravanPlan[$iStage][2] > 0 And $iMapID = $g_a_AscalonCaravanPlan[$iStage][2] Then Return True
    If $g_a_AscalonCaravanPlan[$iStage][3] > 0 And $iMapID = $g_a_AscalonCaravanPlan[$iStage][3] Then Return True
    If $g_a_AscalonCaravanPlan[$iStage][4] > 0 And $iMapID = $g_a_AscalonCaravanPlan[$iStage][4] Then Return True
    Return False
EndFunc

; True when $iMapID is any Ascalon spine farm map / outpost / transit for any stage.
Func _Vanquisher_IsOnAscalonCaravanSpine($iMapID = -1)
    _Vanquisher_InitAscalonCaravanPlan()
    If $iMapID < 0 Then $iMapID = GetMapID()
    Local $i = 0
    For $i = 0 To $GC_I_ASCALON_CARAVAN_MAP_COUNT - 1
        If _Vanquisher_IsAscalonCaravanEntryMap($iMapID, $i) Then Return True
    Next
    Return False
EndFunc

; Stage index for the current map on the Ascalon spine, or 0 to begin from TOA -> BlackCurtain.
; Farm map wins, then transit, then lowest outpost stage (TOA is shared by early Kryta maps).
Func _Vanquisher_AscalonCaravanStageForCurrentMap()
    _Vanquisher_InitAscalonCaravanPlan()
    Local $iMapID = Number(GetMapID())
    Local $i = 0
    For $i = 0 To $GC_I_ASCALON_CARAVAN_MAP_COUNT - 1
        If Number($g_a_AscalonCaravanPlan[$i][0]) = $iMapID Then Return $i
    Next
    For $i = 0 To $GC_I_ASCALON_CARAVAN_MAP_COUNT - 1
        If $g_a_AscalonCaravanPlan[$i][2] > 0 And Number($g_a_AscalonCaravanPlan[$i][2]) = $iMapID Then Return $i
        If $g_a_AscalonCaravanPlan[$i][3] > 0 And Number($g_a_AscalonCaravanPlan[$i][3]) = $iMapID Then Return $i
        If $g_a_AscalonCaravanPlan[$i][4] > 0 And Number($g_a_AscalonCaravanPlan[$i][4]) = $iMapID Then Return $i
    Next
    For $i = 0 To $GC_I_ASCALON_CARAVAN_MAP_COUNT - 1
        If $g_a_AscalonCaravanPlan[$i][1] > 0 And Number($g_a_AscalonCaravanPlan[$i][1]) = $iMapID Then Return $i
    Next
    Return 0
EndFunc

Func _Vanquisher_AscalonCaravanStageScriptName($iStage)
    Local $aScripts[19] = [ _
            "CaravanAscalon_TheBlackCurtain", _
            "CaravanAscalon_CursedLands", _
            "CaravanAscalon_NeboTerrace", _
            "CaravanAscalon_NorthKrytaProvince", _
            "CaravanAscalon_ScoundrelsRise", _
            "CaravanAscalon_GriffonsMouth", _
            "CaravanAscalon_DeldrimorBowl", _
            "CaravanAscalon_AnvilRock", _
            "CaravanAscalon_IronHorseMine", _
            "CaravanAscalon_TravelersVale", _
            "CaravanAscalon_AscalonFoothills", _
            "CaravanAscalon_DiessaLowlands", _
            "CaravanAscalon_FlameTempleCorridor", _
            "CaravanAscalon_DragonsGullet", _
            "CaravanAscalon_TheBreach", _
            "CaravanAscalon_OldAscalon", _
            "CaravanAscalon_RegentValley", _
            "CaravanAscalon_PockmarkFlats", _
            "CaravanAscalon_EasternFrontier" _
            ]
    If $iStage < 0 Or $iStage >= $GC_I_ASCALON_CARAVAN_MAP_COUNT Then Return ""
    Return $aScripts[$iStage]
EndFunc

Func _Vanquisher_AscalonCaravanIsStageHistoricallyVanquished($iStage)
    _Vanquisher_InitAscalonCaravanPlan()
    If $iStage < 0 Or $iStage >= $GC_I_ASCALON_CARAVAN_MAP_COUNT Then Return False
    Local $iMapID = Number($g_a_AscalonCaravanPlan[$iStage][0])
    If $iMapID > 0 And _Vanquisher_IsMapIdHistoricallyVanquished($iMapID) Then Return True
    Return _Vanquisher_IsCaravanMapHistoricallyVanquished(_Vanquisher_AscalonCaravanStageScriptName($iStage))
EndFunc

; First stage from $iFromStage that is not marked vanquished by map scan; or map count if all done.
Func _Vanquisher_AscalonCaravanFirstIncompleteStage($iFromStage = 0)
    If $iFromStage < 0 Then $iFromStage = 0
    _Vanquisher_InitAscalonCaravanPlan()
    Local $i = 0
    For $i = $iFromStage To $GC_I_ASCALON_CARAVAN_MAP_COUNT - 1
        If Not _Vanquisher_AscalonCaravanIsStageHistoricallyVanquished($i) Then Return $i
    Next
    Return $GC_I_ASCALON_CARAVAN_MAP_COUNT
EndFunc
