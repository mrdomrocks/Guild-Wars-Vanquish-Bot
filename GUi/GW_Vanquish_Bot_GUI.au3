#RequireAdmin
#include <GUIConstantsEx.au3>
#include <TabConstants.au3>
#include <EditConstants.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GuiEdit.au3>
#include <ListViewConstants.au3>
#include <GuiListView.au3>
#include <GuiTab.au3>
#include <WindowsConstants.au3>

; UI-only module for the GW Vanquish Bot.
; Run the top-level launcher from the bot root folder.

Global Const $MAP_CAMPAIGN_COUNT = 5
Global Const $GUI_WIDTH = 1000
Global Const $GUI_HEIGHT = 560
Global Const $TAB_WIDTH = 980
Global Const $TAB_HEIGHT = 540
Global Const $CONSOLE_WIDTH = 320
Global Const $MAP_LIST_MAX_WIDTH = 920
Global Const $MAP_SELECTION_PANE_LEFT = 30
Global Const $MAP_SELECTION_PANE_WIDTH = 960
Global Const $MAP_LIST_HEIGHT = 440
Global Const $CONSOLE_MAX_LINES = 250
Global Const $MAP_CAMPAIGN_FIRST_TAB_INDEX = 1

Global $hGUI, $tab, $camp
Global $console
Global $picVanquishedHelmet
Global $lblDetectedClient, $lblDetectedCharacter, $lblConnectedCharacter
Global $lblMapScanStatus, $lblRunControlStatus
Global $lblRunTime, $lblDeaths, $lblVanquishStreak
Global $btnConnect, $btnStart, $btnStop, $btnSaveConfig
Global $lvMapsEOTN, $lvMapsProphecies, $lvMapsCaravan, $lvMapsFactions, $lvMapsNightfall
Global $g_aCampaignLists[$MAP_CAMPAIGN_COUNT]
Global $g_aCampaignNames[$MAP_CAMPAIGN_COUNT] = ["EOTN", "Prophecies", "Caravan Routes", "Factions", "Nightfall"]
Global $g_aMapListItemIDs[0]
Global $g_aMapListRows[0]
Global $g_idComboTeam4[3]
Global $g_idComboTeam6[5]
Global $g_idComboTeam8[7]
Global $g_iConsoleLineCount = 0
Global $g_sLastConsoleMessage = ""
Global $g_sLastDetectedClientLabel = ""
Global $g_sLastDetectedCharacterLabel = ""
Global $g_sLastConnectedCharacterLabel = ""
Global $g_sLastMapScanStatusLabel = ""
Global $g_sLastRunControlStatusLabel = ""

Func _VB_CreateGUI()
    Local $i = 0
    Local Const $iHeroComboWidth = 105
    Local Const $iTeam8ColSpan = 150

    $hGUI = GUICreate("Guild Wars Vanquish Bot", $GUI_WIDTH, $GUI_HEIGHT)
    $tab = GUICtrlCreateTab(10, 10, $TAB_WIDTH, $TAB_HEIGHT)

    GUICtrlCreateTabItem("Main Menu")
    $console = GUICtrlCreateEdit("", 30, 50, $CONSOLE_WIDTH, 230, BitOR($ES_READONLY, $ES_AUTOVSCROLL, $ES_MULTILINE, $WS_VSCROLL))
    GUICtrlSetFont($console, 10, 400, 0, "Consolas")
    $picVanquishedHelmet = GUICtrlCreatePic($g_sHelmetImagePath, 710, 55, 180, 180)

    GUICtrlCreateGroup("Client Connection", 360, 50, 340, 150)
    $lblDetectedClient = GUICtrlCreateLabel("Detected Client: scanning...", 365, 76, 320, 18)
    $lblDetectedCharacter = GUICtrlCreateLabel("Detected Character: scanning...", 365, 98, 320, 18)
    $lblConnectedCharacter = GUICtrlCreateLabel("Connected Character: not connected", 365, 120, 320, 18)
    $btnConnect = GUICtrlCreateButton("Connect To Client", 365, 144, 320, 24)
    $lblMapScanStatus = GUICtrlCreateLabel("Map Scan Status: waiting for client connection", 365, 176, 320, 18)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Run Control", 30, 295, 280, 185)
    $btnStart = GUICtrlCreateButton("Start Checked Maps", 45, 325, 120, 34)
    $btnStop = GUICtrlCreateButton("Stop", 175, 325, 120, 34)
    $lblRunControlStatus = GUICtrlCreateLabel("Run Status: idle", 45, 368, 250, 18)
    $lblRunTime = GUICtrlCreateLabel("Current Run Time: 00:00:00", 45, 390, 250, 18)
    $lblDeaths = GUICtrlCreateLabel("Deaths: 0", 45, 412, 250, 18)
    $lblVanquishStreak = GUICtrlCreateLabel("Maps Vanquished In A Row: 0", 45, 434, 250, 18)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Heroes", 320, 295, 650, 225)
    GUICtrlCreateGroup("Team 4", 335, 320, 145, 115)
    For $i = 0 To 2
        GUICtrlCreateLabel("H" & ($i + 1) & ":", 343, 340 + ($i * 28), 22, 18)
        $g_idComboTeam4[$i] = GUICtrlCreateCombo("", 365, 337 + ($i * 28), $iHeroComboWidth, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam4[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam4[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Team 6", 490, 320, 145, 155)
    For $i = 0 To 4
        GUICtrlCreateLabel("H" & ($i + 1) & ":", 498, 340 + ($i * 28), 22, 18)
        $g_idComboTeam6[$i] = GUICtrlCreateCombo("", 520, 337 + ($i * 28), $iHeroComboWidth, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam6[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam6[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Team 8", 645, 320, 310, 145)
    For $i = 0 To 6
        Local $iColumn = 0
        Local $iRow = $i
        If $i >= 4 Then
            $iColumn = 1
            $iRow = $i - 4
        EndIf

        Local $iLabelX = 653 + ($iColumn * $iTeam8ColSpan)
        Local $iComboX = 675 + ($iColumn * $iTeam8ColSpan)
        Local $iLabelY = 340 + ($iRow * 28)
        Local $iComboY = 337 + ($iRow * 28)

        GUICtrlCreateLabel("H" & ($i + 1) & ":", $iLabelX, $iLabelY, 22, 18)
        $g_idComboTeam8[$i] = GUICtrlCreateCombo("", $iComboX, $iComboY, $iHeroComboWidth, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam8[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam8[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    $btnSaveConfig = GUICtrlCreateButton("Save Config", 805, 475, 145, 28)

    GUICtrlCreateTabItem("EOTN")
    $lvMapsEOTN = GUICtrlCreateListView(" |Region|Map|Pre-Travel|Status", 40, 50, $MAP_LIST_MAX_WIDTH, $MAP_LIST_HEIGHT, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))

    GUICtrlCreateTabItem("Prophecies")
    $lvMapsProphecies = GUICtrlCreateListView(" |Region|Map|Pre-Travel|Status", 40, 50, $MAP_LIST_MAX_WIDTH, $MAP_LIST_HEIGHT, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))

    GUICtrlCreateTabItem("Caravan Routes")
    $lvMapsCaravan = GUICtrlCreateListView(" |Region|Map|Pre-Travel|Status", 40, 50, $MAP_LIST_MAX_WIDTH, $MAP_LIST_HEIGHT, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))

    GUICtrlCreateTabItem("Factions")
    $lvMapsFactions = GUICtrlCreateListView(" |Region|Map|Pre-Travel|Status", 40, 50, $MAP_LIST_MAX_WIDTH, $MAP_LIST_HEIGHT, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))

    GUICtrlCreateTabItem("Nightfall")
    $lvMapsNightfall = GUICtrlCreateListView(" |Region|Map|Pre-Travel|Status", 40, 50, $MAP_LIST_MAX_WIDTH, $MAP_LIST_HEIGHT, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))

    $g_aCampaignLists[0] = $lvMapsEOTN
    $g_aCampaignLists[1] = $lvMapsProphecies
    $g_aCampaignLists[2] = $lvMapsCaravan
    $g_aCampaignLists[3] = $lvMapsFactions
    $g_aCampaignLists[4] = $lvMapsNightfall

    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        _GUICtrlListView_SetExtendedListViewStyle($g_aCampaignLists[$i], BitOR($LVS_EX_CHECKBOXES, $LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER))
        Local $hHeader = _GUICtrlListView_GetHeader(GUICtrlGetHandle($g_aCampaignLists[$i]))
        If $hHeader Then _WinAPI_SetWindowLong($hHeader, -16, BitOR(_WinAPI_GetWindowLong($hHeader, -16), $HDS_NOSIZING))
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateTabItem("")
    GUISetState()
EndFunc

Func _VB_DestroyGUI()
    If $hGUI Then GUIDelete($hGUI)
    $hGUI = 0
EndFunc

Func _GetCurrentTabIndex()
    If $tab = 0 Then Return 0
    Return GUICtrlSendMsg($tab, $TCM_GETCURSEL, 0, 0)
EndFunc

Func _SetCurrentTabIndex($iTabIndex)
    If $tab = 0 Then Return
    If $iTabIndex < 0 Then $iTabIndex = 0
    _GUICtrlTab_SetCurSel(GUICtrlGetHandle($tab), $iTabIndex)
EndFunc

Func _ShowMainMenuTab()
    _SetCurrentTabIndex(0)
EndFunc

Func _FormatElapsedTime($iMilliseconds)
    Local $iTotalSeconds = Int($iMilliseconds / 1000)
    Local $iHours = Int($iTotalSeconds / 3600)
    Local $iMinutes = Int(Mod($iTotalSeconds, 3600) / 60)
    Local $iSeconds = Mod($iTotalSeconds, 60)
    Return StringFormat("%02d:%02d:%02d", $iHours, $iMinutes, $iSeconds)
EndFunc

Func _UpdateRunStatusDisplay()
    Local $sRunTime = "00:00:00"
    If $g_hRunTimer <> 0 Then $sRunTime = _FormatElapsedTime(TimerDiff($g_hRunTimer))

    GUICtrlSetData($lblRunTime, "Current Run Time: " & $sRunTime)
    GUICtrlSetData($lblDeaths, "Deaths: " & $g_iRunDeaths)
    GUICtrlSetData($lblVanquishStreak, "Maps Vanquished In A Row: " & $g_iVanquishStreak)
EndFunc

Func _SetCharacterSelectionState($bConnected)
    If $bConnected Then
        GUICtrlSetState($btnConnect, $GUI_DISABLE)
    Else
        If Not $g_bBotRunning And $g_iDetectedClientPid > 0 Then
            GUICtrlSetState($btnConnect, $GUI_ENABLE)
        Else
            GUICtrlSetState($btnConnect, $GUI_DISABLE)
        EndIf
    EndIf
    _UpdateConnectedCharacterDisplay()
    _UpdateStartButtonState()
EndFunc

Func _UpdateDetectedCharacterDisplay($sCharacter, $iDetectedCount)
    Local $sClientLabel = "Detected Client: none"
    Local $sLabel = "Detected Character: none"

    If $iDetectedCount > 1 Then
        $sClientLabel = "Detected Client: multiple clients"
        $sLabel = "Detected Character: multiple clients"
    ElseIf StringStripWS($sCharacter, 3) <> "" Then
        $sClientLabel = "Detected Client: PID " & $g_iDetectedClientPid
        $sLabel = "Detected Character: " & $sCharacter
    ElseIf $iDetectedCount = 0 Then
        $sClientLabel = "Detected Client: none"
    EndIf

    Local $bLabelChanged = False

    If $sClientLabel <> $g_sLastDetectedClientLabel Then
        GUICtrlSetData($lblDetectedClient, $sClientLabel)
        $g_sLastDetectedClientLabel = $sClientLabel
        $bLabelChanged = True
    EndIf

    If $sLabel <> $g_sLastDetectedCharacterLabel Then
        GUICtrlSetData($lblDetectedCharacter, $sLabel)
        $g_sLastDetectedCharacterLabel = $sLabel
        $bLabelChanged = True
    EndIf
    If $bLabelChanged Then _SetCharacterSelectionState($g_bClientConnected)
EndFunc

Func _UpdateConnectedCharacterDisplay()
    Local $sLabel = "Connected Character: not connected"
    If $g_bClientConnected And StringStripWS($g_sConnectedCharacter, 3) <> "" Then
        $sLabel = "Connected Character: " & $g_sConnectedCharacter
    EndIf
    If $sLabel = $g_sLastConnectedCharacterLabel Then Return
    GUICtrlSetData($lblConnectedCharacter, $sLabel)
    $g_sLastConnectedCharacterLabel = $sLabel
EndFunc

; Entries shown in Map Scan Status / console completed counts (excludes caravan internals & specials).
Func _IsMapScanDisplayEntry($iIndex)
    If $iIndex < 0 Or $iIndex >= UBound($g_aMapEntries) Then Return False
    If $g_aMapEntries[$iIndex][0] = "Caravan Internal" Then Return False
    If $g_aMapEntries[$iIndex][0] = "Caravan Routes" Then Return False
    If $g_aMapEntries[$iIndex][4] <= 0 Then Return False
    If StringLeft($g_aMapEntries[$iIndex][8], 13) = "SpecialRoute_" Then Return False
    Return True
EndFunc

Func _CountDisplayedMapScanStats(ByRef $iVanquished, ByRef $iSelectable)
    $iVanquished = 0
    $iSelectable = 0
    Local $i = 0
    For $i = 0 To UBound($g_aMapEntries) - 1
        If Not _IsMapScanDisplayEntry($i) Then ContinueLoop
        If $g_aMapEntries[$i][5] Then
            $iVanquished += 1
        Else
            $iSelectable += 1
        EndIf
    Next
EndFunc

Func _UpdateMapScanStatusDisplay($sStatus = "")
    If $sStatus = "" Then
        If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
            $sStatus = "waiting for client"
        ElseIf $g_bMapScanInProgress Then
            $sStatus = "scanning..."
        ElseIf $g_bPostConnectAutoScanPending Then
            $sStatus = "connected - scanning shortly"
        ElseIf $g_bPendingVanquishScan Then
            $sStatus = "waiting for in-game state"
        ElseIf Not $g_bVanquishHistoryLoaded Then
            $sStatus = "waiting to scan"
        Else
            Local $iVanquished = 0
            Local $iSelectable = 0
            _CountDisplayedMapScanStats($iVanquished, $iSelectable)
            $sStatus = $iVanquished & " completed, " & $iSelectable & " available"
        EndIf
    EndIf

    Local $sLabel = "Map Scan Status: " & $sStatus
    If $sLabel = $g_sLastMapScanStatusLabel Then Return
    GUICtrlSetData($lblMapScanStatus, $sLabel)
    $g_sLastMapScanStatusLabel = $sLabel
EndFunc

Func _UpdateRunControlStatusDisplay($sStatus = "")
    If $sStatus = "" Then
        If $g_bBotRunning Then
            $sStatus = "running"
        ElseIf $g_bMapScanInProgress Then
            $sStatus = "scanning maps"
        ElseIf $g_bClientConnected And Not $g_bVanquishHistoryLoaded Then
            $sStatus = "waiting to scan"
        ElseIf $g_bClientConnected Then
            $sStatus = "ready"
        Else
            $sStatus = "idle"
        EndIf
    EndIf
    Local $sLabel = "Run Status: " & $sStatus
    If $sLabel = $g_sLastRunControlStatusLabel Then Return
    GUICtrlSetData($lblRunControlStatus, $sLabel)
    $g_sLastRunControlStatusLabel = $sLabel
EndFunc

Func _UpdateStartButtonState()
    Local $iStartState = $GUI_DISABLE
    If Not $g_bBotRunning And $g_bClientConnected And $Bot_Core_Initialized And $g_bConnectionStatePrimed And $g_bVanquishHistoryLoaded Then $iStartState = $GUI_ENABLE
    GUICtrlSetState($btnStart, $iStartState)

    Local $iStopState = $GUI_DISABLE
    If $g_bBotRunning Then $iStopState = $GUI_ENABLE
    GUICtrlSetState($btnStop, $iStopState)

    _UpdateMapScanStatusDisplay()
    _UpdateRunControlStatusDisplay()
EndFunc

Func _EstimateMapListColumnWidth($iChars, $iPadding = 24)
    If $iChars < 1 Then $iChars = 1
    Return ($iChars * 8) + $iPadding
EndFunc

Func _ResizeMapListColumns()
    Local $iCheckWidth = 34
    Local $iStatusChars = StringLen("Vanquished")
    Local Const $iMapSelectionPaneTop = 50
    Local $aRegionChars[$MAP_CAMPAIGN_COUNT]
    Local $aMapChars[$MAP_CAMPAIGN_COUNT]
    Local $aPreTravelChars[$MAP_CAMPAIGN_COUNT]
    Local $i = 0

    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        $aRegionChars[$i] = StringLen("Region")
        $aMapChars[$i] = StringLen("Map")
        $aPreTravelChars[$i] = StringLen("Pre-Travel")
    Next

    For $i = 0 To UBound($g_aMapEntries) - 1
        Local $iCampaignIndex = _GetCampaignIndex($g_aMapEntries[$i][0])
        If $iCampaignIndex = -1 Then ContinueLoop
        If StringLen($g_aMapEntries[$i][1]) > $aRegionChars[$iCampaignIndex] Then $aRegionChars[$iCampaignIndex] = StringLen($g_aMapEntries[$i][1])
        If StringLen($g_aMapEntries[$i][2]) > $aMapChars[$iCampaignIndex] Then $aMapChars[$iCampaignIndex] = StringLen($g_aMapEntries[$i][2])
        If StringLen($g_aMapEntries[$i][10]) > $aPreTravelChars[$iCampaignIndex] Then $aPreTravelChars[$iCampaignIndex] = StringLen($g_aMapEntries[$i][10])
    Next

    Local $iStatusWidth = _EstimateMapListColumnWidth($iStatusChars, 20)
    If $iStatusWidth < 92 Then $iStatusWidth = 92

    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        Local $iRegionWidth = _EstimateMapListColumnWidth($aRegionChars[$i], 24)
        If $iRegionWidth > 150 Then $iRegionWidth = 150

        Local $iMapWidth = _EstimateMapListColumnWidth($aMapChars[$i], 24)
        If $iMapWidth > 220 Then $iMapWidth = 220

        Local $iPreTravelWidth = _EstimateMapListColumnWidth($aPreTravelChars[$i], 24)
        If $iPreTravelWidth > 180 Then $iPreTravelWidth = 180

        Local $iListWidth = $iCheckWidth + $iRegionWidth + $iMapWidth + $iPreTravelWidth + $iStatusWidth + 24
        If $iListWidth > $MAP_LIST_MAX_WIDTH Then
            $iListWidth = $MAP_LIST_MAX_WIDTH
            $iMapWidth = $iListWidth - $iCheckWidth - $iRegionWidth - $iPreTravelWidth - $iStatusWidth - 24
        EndIf

        Local $iListX = $MAP_SELECTION_PANE_LEFT + Int(($MAP_SELECTION_PANE_WIDTH - $iListWidth) / 2)
        GUICtrlSetPos($g_aCampaignLists[$i], $iListX, $iMapSelectionPaneTop, $iListWidth, $MAP_LIST_HEIGHT)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 0, $iCheckWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 1, $iRegionWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 2, $iMapWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 3, $iPreTravelWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 4, $iStatusWidth)
    Next
EndFunc

Func _UpdateCampaignListVisibility()
    Return
EndFunc

Func _SetHeroComboArrayState(ByRef $aComboIDs, $iState)
    Local $i = 0
    For $i = 0 To UBound($aComboIDs) - 1
        GUICtrlSetState($aComboIDs[$i], $iState)
    Next
EndFunc

Func _GetFirstSelectedMapIndex()
    Local $i = 0
    For $i = 0 To UBound($g_aMapEntries) - 1
        If Not $g_aMapEntries[$i][3] Or $g_aMapEntries[$i][5] Then ContinueLoop
        Return $i
    Next

    Return -1
EndFunc

Func _RefreshHeroTeamSelectionState()
    Local $iRequiredPartySize = 0
    Local $iSelectedMapIndex = _GetFirstSelectedMapIndex()
    If $iSelectedMapIndex <> -1 Then
        $iRequiredPartySize = $g_aMapEntries[$iSelectedMapIndex][7]
        If $iRequiredPartySize <= 0 And $g_bClientConnected And $Bot_Core_Initialized Then
            $iRequiredPartySize = _ResolveMaxPartySizeForMap($g_aMapEntries[$iSelectedMapIndex][4], $g_aMapEntries[$iSelectedMapIndex][6])
            $g_aMapEntries[$iSelectedMapIndex][7] = $iRequiredPartySize
        EndIf
    EndIf

    Local $sStateKey = "all"
    If $iRequiredPartySize > 0 Then
        $sStateKey = String($iRequiredPartySize)
    EndIf

    If $sStateKey = $g_sLastHeroTeamState Then Return
    $g_sLastHeroTeamState = $sStateKey

    Switch $sStateKey
        Case "4"
            _SetHeroComboArrayState($g_idComboTeam4, $GUI_ENABLE)
            _SetHeroComboArrayState($g_idComboTeam6, $GUI_DISABLE)
            _SetHeroComboArrayState($g_idComboTeam8, $GUI_DISABLE)
        Case "6"
            _SetHeroComboArrayState($g_idComboTeam4, $GUI_DISABLE)
            _SetHeroComboArrayState($g_idComboTeam6, $GUI_ENABLE)
            _SetHeroComboArrayState($g_idComboTeam8, $GUI_DISABLE)
        Case "8"
            _SetHeroComboArrayState($g_idComboTeam4, $GUI_DISABLE)
            _SetHeroComboArrayState($g_idComboTeam6, $GUI_DISABLE)
            _SetHeroComboArrayState($g_idComboTeam8, $GUI_ENABLE)
        Case Else
            _SetHeroComboArrayState($g_idComboTeam4, $GUI_ENABLE)
            _SetHeroComboArrayState($g_idComboTeam6, $GUI_ENABLE)
            _SetHeroComboArrayState($g_idComboTeam8, $GUI_ENABLE)
    EndSwitch
EndFunc

Func _GetCampaignIndex($sCampaign)
    Local $i = 0
    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        If $g_aCampaignNames[$i] = $sCampaign Then Return $i
    Next
    Return -1
EndFunc

Func _GetCampaignListView($sCampaign)
    Local $iCampaignIndex = _GetCampaignIndex($sCampaign)
    If $iCampaignIndex = -1 Then Return 0
    Return $g_aCampaignLists[$iCampaignIndex]
EndFunc

Func _GetCampaignTabIndex($sCampaign)
    Local $iCampaignIndex = _GetCampaignIndex($sCampaign)
    If $iCampaignIndex = -1 Then Return -1
    Return $MAP_CAMPAIGN_FIRST_TAB_INDEX + $iCampaignIndex
EndFunc

Func _SyncActiveMapGroupFromSelectedTab()
    Local $iTabIndex = _GetCurrentTabIndex()
    Local $iCampaignIndex = $iTabIndex - $MAP_CAMPAIGN_FIRST_TAB_INDEX
    If $iCampaignIndex < 0 Or $iCampaignIndex >= $MAP_CAMPAIGN_COUNT Then Return
    $g_sActiveMapGroup = $g_aCampaignNames[$iCampaignIndex]
EndFunc

Func _InitializeMapListItems()
    ReDim $g_aMapListItemIDs[UBound($g_aMapEntries)]
    ReDim $g_aMapListRows[UBound($g_aMapEntries)]
    Local $iCampaign = 0
    Local $i = 0

    For $iCampaign = 0 To $MAP_CAMPAIGN_COUNT - 1
        _GUICtrlListView_DeleteAllItems($g_aCampaignLists[$iCampaign])
    Next

    For $i = 0 To UBound($g_aMapEntries) - 1
        Local $idList = _GetCampaignListView($g_aMapEntries[$i][0])
        If $idList = 0 Then ContinueLoop

        Local $iRow = _GUICtrlListView_GetItemCount($idList)
        Local $iItem = GUICtrlCreateListViewItem("|" & $g_aMapEntries[$i][1] & "|" & $g_aMapEntries[$i][2] & "|" & $g_aMapEntries[$i][10] & "|", $idList)
        $g_aMapListItemIDs[$i] = $iItem
        $g_aMapListRows[$i] = $iRow
        _GUICtrlListView_SetItemParam($idList, $iRow, $i)
    Next

    _PopulateMapList("ALL")
EndFunc

Func _RebuildCampaignMapList($sCampaign)
    Local $idList = _GetCampaignListView($sCampaign)
    If $idList = 0 Then Return
    Local $i = 0

    _GUICtrlListView_BeginUpdate($idList)

    For $i = 0 To UBound($g_aMapEntries) - 1
        If $g_aMapEntries[$i][0] <> $sCampaign Then ContinueLoop

        If $i >= UBound($g_aMapListItemIDs) Then ContinueLoop
        Local $sStatus = ""
        If $g_aMapEntries[$i][5] Then $sStatus = "Vanquished"

        Local $iItem = $g_aMapListItemIDs[$i]
        Local $iRow = $g_aMapListRows[$i]
        _GUICtrlListView_SetItemText($idList, $iRow, "", 0)
        _GUICtrlListView_SetItemText($idList, $iRow, $g_aMapEntries[$i][1], 1)
        _GUICtrlListView_SetItemText($idList, $iRow, $g_aMapEntries[$i][2], 2)
        _GUICtrlListView_SetItemText($idList, $iRow, $g_aMapEntries[$i][10], 3)
        _GUICtrlListView_SetItemText($idList, $iRow, $sStatus, 4)
        _GUICtrlListView_SetItemChecked($idList, $iRow, (Not $g_aMapEntries[$i][5]) And $g_aMapEntries[$i][3])
        If $g_aMapEntries[$i][5] Then
            _GUICtrlListView_SetItemChecked($idList, $iRow, False)
            _GUICtrlListView_SetItemSelected($idList, $iRow, False, False)
            _GUICtrlListView_SetItemCut($idList, $iRow, True)
            _GUICtrlListView_SetItemState($idList, $iRow, $LVIS_CUT, $LVIS_CUT)
            GUICtrlSetColor($iItem, 0x808080)
            GUICtrlSetBkColor($iItem, 0xE8E8E8)
        Else
            _GUICtrlListView_SetItemCut($idList, $iRow, False)
            _GUICtrlListView_SetItemState($idList, $iRow, 0, $LVIS_CUT)
            GUICtrlSetColor($iItem, 0x000000)
            GUICtrlSetBkColor($iItem, 0xFFFFFF)
        EndIf
    Next

    _GUICtrlListView_EndUpdate($idList)
EndFunc

Func _SyncVisibleMapChecks()
    Local $iCampaign = 0
    Local $i = 0
    For $iCampaign = 0 To $MAP_CAMPAIGN_COUNT - 1
        Local $idList = $g_aCampaignLists[$iCampaign]
        Local $iItemCount = _GUICtrlListView_GetItemCount($idList)

        For $i = 0 To $iItemCount - 1
            Local $iMapIndex = _GUICtrlListView_GetItemParam($idList, $i)
            If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then ContinueLoop

            Local $bChecked = _GUICtrlListView_GetItemChecked($idList, $i)
            If $g_aMapEntries[$iMapIndex][5] Then
                If $bChecked Then _GUICtrlListView_SetItemChecked($idList, $i, False)
                $g_aMapEntries[$iMapIndex][3] = False
            Else
                $g_aMapEntries[$iMapIndex][3] = $bChecked
            EndIf
        Next
    Next
EndFunc

Func _SyncAllMapChecks()
    _SyncVisibleMapChecks()
EndFunc

Func _EnforceVisibleMapSelectionRules()
    Local $iCampaign = 0
    Local $i = 0
    For $iCampaign = 0 To $MAP_CAMPAIGN_COUNT - 1
        Local $idList = $g_aCampaignLists[$iCampaign]
        Local $iItemCount = _GUICtrlListView_GetItemCount($idList)

        For $i = 0 To $iItemCount - 1
            Local $iMapIndex = _GUICtrlListView_GetItemParam($idList, $i)
            If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then ContinueLoop
            If Not $g_aMapEntries[$iMapIndex][5] Then ContinueLoop

            If _GUICtrlListView_GetItemChecked($idList, $i) Then _GUICtrlListView_SetItemChecked($idList, $i, False)
            $g_aMapEntries[$iMapIndex][3] = False
        Next
    Next
EndFunc

Func _ShowMapCampaign($sCampaign)
    If _GetCampaignIndex($sCampaign) = -1 Then Return
    $g_sActiveMapGroup = $sCampaign
    _RebuildCampaignMapList($sCampaign)
    Local $iTabIndex = _GetCampaignTabIndex($sCampaign)
    If $iTabIndex <> -1 Then _SetCurrentTabIndex($iTabIndex)
    _UpdateVisibleSelectionToggleButton()
EndFunc

Func _HasVisibleSelectableMaps()
    Local $idList = _GetCampaignListView($g_sActiveMapGroup)
    If $idList = 0 Then Return False

    Local $iItemCount = _GUICtrlListView_GetItemCount($idList)
    Local $i = 0
    For $i = 0 To $iItemCount - 1
        Local $iMapIndex = _GUICtrlListView_GetItemParam($idList, $i)
        If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then ContinueLoop
        If Not $g_aMapEntries[$iMapIndex][5] Then Return True
    Next
    Return False
EndFunc

Func _AreAllVisibleSelectableMapsChecked()
    Local $bHasSelectableMap = False
    Local $idList = _GetCampaignListView($g_sActiveMapGroup)
    If $idList = 0 Then Return False

    Local $iItemCount = _GUICtrlListView_GetItemCount($idList)
    Local $i = 0
    For $i = 0 To $iItemCount - 1
        Local $iMapIndex = _GUICtrlListView_GetItemParam($idList, $i)
        If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then ContinueLoop
        If $g_aMapEntries[$iMapIndex][5] Then ContinueLoop

        $bHasSelectableMap = True
        If Not _GUICtrlListView_GetItemChecked($idList, $i) Then Return False
    Next

    Return $bHasSelectableMap
EndFunc

Func _ToggleVisibleMapChecks()
    _SetVisibleMapChecks(Not _AreAllVisibleSelectableMapsChecked())
    _UpdateVisibleSelectionToggleButton()
EndFunc

Func _UpdateVisibleSelectionToggleButton()
    Return
EndFunc

Func _PopulateMapList($sCampaign, $sSubgroup = "")
    #forceref $sSubgroup
    _SyncVisibleMapChecks()
    Local $iCampaign = 0
    If $sCampaign = "ALL" Then
        For $iCampaign = 0 To $MAP_CAMPAIGN_COUNT - 1
            _RebuildCampaignMapList($g_aCampaignNames[$iCampaign])
        Next
        _SyncActiveMapGroupFromSelectedTab()
        _UpdateVisibleSelectionToggleButton()
        Return
    EndIf

    If _GetCampaignIndex($sCampaign) = -1 Then Return

    $g_sActiveMapGroup = $sCampaign
    _RebuildCampaignMapList($sCampaign)
    Local $iTabIndex = _GetCampaignTabIndex($sCampaign)
    If $iTabIndex <> -1 Then _SetCurrentTabIndex($iTabIndex)
    _UpdateVisibleSelectionToggleButton()
EndFunc

Func _SetVisibleMapChecks($bChecked)
    Local $idList = _GetCampaignListView($g_sActiveMapGroup)
    If $idList = 0 Then Return

    Local $iItemCount = _GUICtrlListView_GetItemCount($idList)
    Local $i = 0
    For $i = 0 To $iItemCount - 1
        Local $iMapIndex = _GUICtrlListView_GetItemParam($idList, $i)
        If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then ContinueLoop

        If $g_aMapEntries[$iMapIndex][5] Then
            _GUICtrlListView_SetItemChecked($idList, $i, False)
            $g_aMapEntries[$iMapIndex][3] = False
            ContinueLoop
        EndIf

        _GUICtrlListView_SetItemChecked($idList, $i, $bChecked)
        $g_aMapEntries[$iMapIndex][3] = $bChecked
    Next
EndFunc

Func _UpdateMapGroupButtons()
    Return
EndFunc

Func _Log($sText)
    Local $sMessage = StringStripWS($sText, 3)
    If $sMessage = "" Then Return
    ; Route loops and fight retries often emit the same status every tick.
    If $sMessage = $g_sLastConsoleMessage Then Return
    $g_sLastConsoleMessage = $sMessage
    _AppendConsoleLine("[" & @HOUR & ":" & @MIN & ":" & @SEC & "] " & $sMessage)
EndFunc

Func _AppendConsoleLine($sLine)
    Local $hConsole = GUICtrlGetHandle($console)
    If $g_iConsoleLineCount <= 0 Then
        GUICtrlSetData($console, $sLine)
        $g_iConsoleLineCount = 1
        Return
    EndIf

    _GUICtrlEdit_AppendText($hConsole, @CRLF & $sLine)
    $g_iConsoleLineCount += 1

    If $g_iConsoleLineCount > $CONSOLE_MAX_LINES Then
        Local $sConsoleText = GUICtrlRead($console)
        Local $aLines = StringSplit($sConsoleText, @CRLF, 1)
        If IsArray($aLines) Then
            Local $iStart = $aLines[0] - $CONSOLE_MAX_LINES + 1
            Local $sTrimmed = ""
            Local $i = 0
            If $iStart < 1 Then $iStart = 1
            For $i = $iStart To $aLines[0]
                If $sTrimmed <> "" Then $sTrimmed &= @CRLF
                $sTrimmed &= $aLines[$i]
            Next
            GUICtrlSetData($console, $sTrimmed)
            $g_iConsoleLineCount = $aLines[0] - $iStart + 1
            $hConsole = GUICtrlGetHandle($console)
        EndIf
    EndIf

    _GUICtrlEdit_LineScroll($hConsole, 0, _GUICtrlEdit_GetLineCount($hConsole))
EndFunc

Func _LogStartupBanner()
    _AppendConsoleLine("Guild Wars Vanquish Bot")
    _AppendConsoleLine("Author: MrDomRocks")
    _AppendConsoleLine("Ready.")
    $g_sLastConsoleMessage = "Ready."
EndFunc

Func _VB_LogCallback($sMessage, $iMsgType, $sAuthor)
    ; Keep the Main Menu console readable: drop debug chatter and author noise.
    If $iMsgType = 0 Then Return

    Local $sLevel = "INFO"
    Switch $iMsgType
        Case 2
            $sLevel = "WARN"
        Case 3
            $sLevel = "ERROR"
        Case 4
            $sLevel = "CRITICAL"
    EndSwitch

    Local $sMessageText = StringStripWS($sMessage, 3)
    If $sMessageText = "" Then Return
    If $iMsgType = 1 Then
        _Log($sMessageText)
    Else
        _Log($sLevel & ": " & $sMessageText)
    EndIf
EndFunc

Func CurrentAction($sText)
    _Log($sText)
EndFunc
