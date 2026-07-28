#RequireAdmin
#include <GUIConstantsEx.au3>
#include <TabConstants.au3>
#include <EditConstants.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <ListViewConstants.au3>
#include <GuiListView.au3>
#include <GuiTab.au3>
#include <WindowsConstants.au3>

; UI-only module for the GW Vanquish Bot.
; Run the top-level launcher from the bot root folder.

Global Const $MAP_CAMPAIGN_COUNT = 4
Global Const $CONSOLE_WIDTH = 360

Global $hGUI, $tab, $camp
Global $console
Global $picVanquishedHelmet
Global $lblDetectedClient, $lblDetectedCharacter, $lblConnectedCharacter
Global $lblMapScanStatus, $lblRunControlStatus
Global $lblRunTime, $lblDeaths, $lblVanquishStreak
Global $btnConnect, $btnScanVanquishHistory, $btnStart, $btnStop, $btnSaveConfig
Global $btnGroupEOTN, $btnGroupProphecies, $btnGroupFactions, $btnGroupNightfall
Global $btnToggleVisibleSelection
Global $lvMapsEOTN, $lvMapsProphecies, $lvMapsFactions, $lvMapsNightfall
Global $g_aCampaignButtons[$MAP_CAMPAIGN_COUNT]
Global $g_aCampaignLists[$MAP_CAMPAIGN_COUNT]
Global $g_aCampaignNames[$MAP_CAMPAIGN_COUNT] = ["EOTN", "Prophecies", "Factions", "Nightfall"]
Global $g_aMapListItemIDs[0]
Global $g_aMapListRows[0]
Global $g_aClientControlArray[4]
Global $g_aMapScanControlArray[2]
Global $g_aRunControlArray[6]
Global $g_idComboTeam4[3]
Global $g_idComboTeam6[5]
Global $g_idComboTeam8[7]

Func _VB_CreateGUI()
    Local $i = 0
    $hGUI = GUICreate("Guild Wars Vanquish Bot", 1180, 560)
    $tab = GUICtrlCreateTab(10, 10, 1160, 540)

    GUICtrlCreateTabItem("Main Menu")
    $console = GUICtrlCreateEdit("", 40, 50, $CONSOLE_WIDTH, 230, BitOR($ES_CENTER, $ES_READONLY, $ES_AUTOVSCROLL, $ES_MULTILINE, $WS_VSCROLL))
    GUICtrlSetFont($console, 10, 400, 0, "Consolas")
    $picVanquishedHelmet = GUICtrlCreatePic($g_sHelmetImagePath, 840, 55, 210, 210)

    GUICtrlCreateGroup("Client Connection", 420, 50, 390, 120)
    $lblDetectedClient = GUICtrlCreateLabel("Detected Client: scanning...", 425, 76, 360, 18)
    $lblDetectedCharacter = GUICtrlCreateLabel("Detected Character: scanning...", 425, 98, 360, 18)
    $lblConnectedCharacter = GUICtrlCreateLabel("Connected Character: not connected", 425, 120, 360, 18)
    $btnConnect = GUICtrlCreateButton("Connect To Client", 425, 140, 360, 24)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Map Vanquish Scan", 420, 180, 390, 110)
    $btnScanVanquishHistory = GUICtrlCreateButton("Scan Vanquish Maps", 425, 210, 360, 26)
    $lblMapScanStatus = GUICtrlCreateLabel("Map Scan Status: waiting for client connection", 425, 244, 360, 18)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Run Control", 40, 295, 280, 185)
    $btnStart = GUICtrlCreateButton("Start Selected Maps", 55, 325, 120, 34)
    $btnStop = GUICtrlCreateButton("Stop", 185, 325, 120, 34)
    $lblRunControlStatus = GUICtrlCreateLabel("Run Status: idle", 55, 368, 250, 18)
    $lblRunTime = GUICtrlCreateLabel("Current Run Time: 00:00:00", 55, 390, 250, 18)
    $lblDeaths = GUICtrlCreateLabel("Deaths: 0", 55, 412, 250, 18)
    $lblVanquishStreak = GUICtrlCreateLabel("Maps Vanquished In A Row: 0", 55, 434, 250, 18)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Heroes", 340, 295, 740, 225)
    GUICtrlCreateGroup("Team 4", 355, 320, 160, 115)
    For $i = 0 To 2
        GUICtrlCreateLabel("H" & ($i + 1) & ":", 363, 340 + ($i * 28), 22, 18)
        $g_idComboTeam4[$i] = GUICtrlCreateCombo("", 385, 337 + ($i * 28), 122, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam4[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam4[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Team 6", 530, 320, 160, 155)
    For $i = 0 To 4
        GUICtrlCreateLabel("H" & ($i + 1) & ":", 538, 340 + ($i * 28), 22, 18)
        $g_idComboTeam6[$i] = GUICtrlCreateCombo("", 560, 337 + ($i * 28), 122, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam6[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam6[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Team 8", 705, 320, 330, 145)
    For $i = 0 To 6
        Local $iColumn = 0
        Local $iRow = $i
        If $i >= 4 Then
            $iColumn = 1
            $iRow = $i - 4
        EndIf

        Local $iLabelX = 713 + ($iColumn * 155)
        Local $iComboX = 735 + ($iColumn * 155)
        Local $iLabelY = 340 + ($iRow * 28)
        Local $iComboY = 337 + ($iRow * 28)

        GUICtrlCreateLabel("H" & ($i + 1) & ":", $iLabelX, $iLabelY, 22, 18)
        $g_idComboTeam8[$i] = GUICtrlCreateCombo("", $iComboX, $iComboY, 122, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam8[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam8[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    $btnSaveConfig = GUICtrlCreateButton("Save Config", 790, 475, 160, 28)

    $g_aClientControlArray[0] = $lblDetectedClient
    $g_aClientControlArray[1] = $lblDetectedCharacter
    $g_aClientControlArray[2] = $lblConnectedCharacter
    $g_aClientControlArray[3] = $btnConnect
    $g_aMapScanControlArray[0] = $btnScanVanquishHistory
    $g_aMapScanControlArray[1] = $lblMapScanStatus
    $g_aRunControlArray[0] = $btnStart
    $g_aRunControlArray[1] = $btnStop
    $g_aRunControlArray[2] = $lblRunControlStatus
    $g_aRunControlArray[3] = $lblRunTime
    $g_aRunControlArray[4] = $lblDeaths
    $g_aRunControlArray[5] = $lblVanquishStreak

    GUICtrlCreateTabItem("Map Selection")
    $btnToggleVisibleSelection = GUICtrlCreateButton("Select All EOTN", 890, 50, 230, 28)
    $btnGroupEOTN = GUICtrlCreateButton("EOTN", 20, 50, 150, 28, $BS_DEFPUSHBUTTON)
    $btnGroupProphecies = GUICtrlCreateButton("Prophecies", 580, 50, 150, 28)
    $btnGroupFactions = GUICtrlCreateButton("Factions", 20, 290, 150, 28)
    $btnGroupNightfall = GUICtrlCreateButton("Nightfall", 580, 290, 150, 28)

    $lvMapsEOTN = GUICtrlCreateListView(" |Region|Map|Status", 20, 84, 540, 190, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))
    $lvMapsProphecies = GUICtrlCreateListView(" |Region|Map|Status", 580, 84, 540, 190, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))
    $lvMapsFactions = GUICtrlCreateListView(" |Region|Map|Status", 20, 324, 540, 190, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))
    $lvMapsNightfall = GUICtrlCreateListView(" |Region|Map|Status", 580, 324, 540, 190, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))

    $g_aCampaignButtons[0] = $btnGroupEOTN
    $g_aCampaignButtons[1] = $btnGroupProphecies
    $g_aCampaignButtons[2] = $btnGroupFactions
    $g_aCampaignButtons[3] = $btnGroupNightfall
    $g_aCampaignLists[0] = $lvMapsEOTN
    $g_aCampaignLists[1] = $lvMapsProphecies
    $g_aCampaignLists[2] = $lvMapsFactions
    $g_aCampaignLists[3] = $lvMapsNightfall

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

    GUICtrlSetData($lblDetectedClient, $sClientLabel)
    GUICtrlSetData($lblDetectedCharacter, $sLabel)
    _SetCharacterSelectionState($g_bClientConnected)
EndFunc

Func _UpdateConnectedCharacterDisplay()
    Local $sLabel = "Connected Character: not connected"
    If $g_bClientConnected And StringStripWS($g_sConnectedCharacter, 3) <> "" Then
        $sLabel = "Connected Character: " & $g_sConnectedCharacter
    EndIf
    GUICtrlSetData($lblConnectedCharacter, $sLabel)
EndFunc

Func _UpdateMapScanStatusDisplay($sStatus = "")
    Local $iVanquished = 0
    Local $iSelectable = 0
    Local $i = 0

    For $i = 0 To UBound($g_aMapEntries) - 1
        If $g_aMapEntries[$i][5] Then
            $iVanquished += 1
        Else
            $iSelectable += 1
        EndIf
    Next

    If $sStatus = "" Then
        If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
            $sStatus = "waiting for client"
        ElseIf $g_bMapScanInProgress Then
            $sStatus = "scanning..."
        ElseIf Not $g_bVanquishHistoryLoaded Then
            $sStatus = "ready to scan"
        Else
            $sStatus = $iVanquished & " completed, " & $iSelectable & " available"
        EndIf
    EndIf

    GUICtrlSetData($lblMapScanStatus, "Map Scan Status: " & $sStatus)
EndFunc

Func _UpdateRunControlStatusDisplay($sStatus = "")
    If $sStatus = "" Then
        If $g_bBotRunning Then
            $sStatus = "running"
        ElseIf $g_bMapScanInProgress Then
            $sStatus = "scanning maps"
        ElseIf $g_bClientConnected And Not $g_bVanquishHistoryLoaded Then
            $sStatus = "ready to scan"
        ElseIf $g_bClientConnected Then
            $sStatus = "ready"
        Else
            $sStatus = "idle"
        EndIf
    EndIf
    GUICtrlSetData($lblRunControlStatus, "Run Status: " & $sStatus)
EndFunc

Func _UpdateStartButtonState()
    Local $iStartState = $GUI_DISABLE
    If Not $g_bBotRunning And $g_bClientConnected And $Bot_Core_Initialized And $g_bConnectionStatePrimed And $g_bVanquishHistoryLoaded Then $iStartState = $GUI_ENABLE
    GUICtrlSetState($btnStart, $iStartState)

    Local $iStopState = $GUI_DISABLE
    If $g_bBotRunning Then $iStopState = $GUI_ENABLE
    GUICtrlSetState($btnStop, $iStopState)

    Local $iScanState = $GUI_DISABLE
    If Not $g_bBotRunning And Not $g_bMapScanInProgress And $g_bClientConnected And $Bot_Core_Initialized Then $iScanState = $GUI_ENABLE
    GUICtrlSetState($btnScanVanquishHistory, $iScanState)
    If $g_bMapScanInProgress Then
        GUICtrlSetData($btnScanVanquishHistory, "Scanning Vanquish Maps...")
    Else
        GUICtrlSetData($btnScanVanquishHistory, "Scan Vanquish Maps")
    EndIf
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
    Local Const $iMapListMaxWidth = 540
    Local Const $iMapListHeight = 190
    Local $aRegionChars[$MAP_CAMPAIGN_COUNT]
    Local $aMapChars[$MAP_CAMPAIGN_COUNT]
    Local $i = 0

    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        $aRegionChars[$i] = StringLen("Region")
        $aMapChars[$i] = StringLen("Map")
    Next

    For $i = 0 To UBound($g_aMapEntries) - 1
        Local $iCampaignIndex = _GetCampaignIndex($g_aMapEntries[$i][0])
        If $iCampaignIndex = -1 Then ContinueLoop
        If StringLen($g_aMapEntries[$i][1]) > $aRegionChars[$iCampaignIndex] Then $aRegionChars[$iCampaignIndex] = StringLen($g_aMapEntries[$i][1])
        If StringLen($g_aMapEntries[$i][2]) > $aMapChars[$iCampaignIndex] Then $aMapChars[$iCampaignIndex] = StringLen($g_aMapEntries[$i][2])
    Next

    Local $iStatusWidth = _EstimateMapListColumnWidth($iStatusChars, 20)
    If $iStatusWidth < 92 Then $iStatusWidth = 92

    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        Local $iRegionWidth = _EstimateMapListColumnWidth($aRegionChars[$i], 24)
        If $iRegionWidth > 170 Then $iRegionWidth = 170

        Local $iMapWidth = _EstimateMapListColumnWidth($aMapChars[$i], 24)
        If $iMapWidth < 220 Then $iMapWidth = 220

        Local $iListWidth = $iCheckWidth + $iRegionWidth + $iMapWidth + $iStatusWidth + 24
        If $iListWidth > $iMapListMaxWidth Then
            $iListWidth = $iMapListMaxWidth
            $iMapWidth = $iListWidth - $iCheckWidth - $iRegionWidth - $iStatusWidth - 24
        EndIf

        Local $iX = 20
        Local $iY = 84
        If $i = 1 Then
            $iX = 580
        ElseIf $i = 2 Then
            $iY = 324
        ElseIf $i = 3 Then
            $iX = 580
            $iY = 324
        EndIf

        GUICtrlSetPos($g_aCampaignLists[$i], $iX, $iY, $iListWidth, $iMapListHeight)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 0, $iCheckWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 1, $iRegionWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 2, $iMapWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 3, $iStatusWidth)
    Next
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
        Local $iItem = GUICtrlCreateListViewItem("|" & $g_aMapEntries[$i][1] & "|" & $g_aMapEntries[$i][2] & "|", $idList)
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
        _GUICtrlListView_SetItemText($idList, $iRow, $sStatus, 3)
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
    _UpdateMapGroupButtons()
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
    Local $sSelectLabel = "Select All " & $g_sActiveMapGroup
    Local $sUnselectLabel = "Unselect All " & $g_sActiveMapGroup

    If Not _HasVisibleSelectableMaps() Then
        GUICtrlSetState($btnToggleVisibleSelection, $GUI_DISABLE)
        GUICtrlSetData($btnToggleVisibleSelection, $sSelectLabel)
        Return
    EndIf

    GUICtrlSetState($btnToggleVisibleSelection, $GUI_ENABLE)
    If _AreAllVisibleSelectableMapsChecked() Then
        GUICtrlSetData($btnToggleVisibleSelection, $sUnselectLabel)
    Else
        GUICtrlSetData($btnToggleVisibleSelection, $sSelectLabel)
    EndIf
EndFunc

Func _PopulateMapList($sCampaign, $sSubgroup = "")
    #forceref $sSubgroup
    _SyncVisibleMapChecks()
    Local $iCampaign = 0
    If $sCampaign = "ALL" Then
        For $iCampaign = 0 To $MAP_CAMPAIGN_COUNT - 1
            _RebuildCampaignMapList($g_aCampaignNames[$iCampaign])
        Next

        _UpdateMapGroupButtons()
        _UpdateVisibleSelectionToggleButton()
        Return
    EndIf

    If _GetCampaignIndex($sCampaign) = -1 Then Return

    $g_sActiveMapGroup = $sCampaign
    _RebuildCampaignMapList($sCampaign)
    _UpdateMapGroupButtons()
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
    Local $i = 0
    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        GUICtrlSetState($g_aCampaignButtons[$i], $GUI_ENABLE)
    Next

    Local $iCampaignIndex = _GetCampaignIndex($g_sActiveMapGroup)
    If $iCampaignIndex <> -1 Then GUICtrlSetState($g_aCampaignButtons[$iCampaignIndex], $GUI_DISABLE)
EndFunc

Func _Log($sText)
    _AppendConsoleLine("[" & @HOUR & ":" & @MIN & ":" & @SEC & "] " & $sText)
EndFunc

Func _AppendConsoleLine($sLine)
    Local $sExisting = GUICtrlRead($console)
    If $sExisting = "" Then
        GUICtrlSetData($console, $sLine)
    Else
        GUICtrlSetData($console, $sExisting & @CRLF & $sLine)
    EndIf
EndFunc

Func _GetConsoleTextWidth()
    ; Estimate visible monospace characters from the configured control width.
    Local $iWidth = Int(($CONSOLE_WIDTH - 20) / 8)
    If $iWidth < 24 Then $iWidth = 24
    Return $iWidth
EndFunc

Func _CenterConsoleText($sText, $iWidth = 72)
    Local $sTrimmed = StringStripWS($sText, 3)
    If $sTrimmed = "" Then Return ""

    Local $iPadding = Int(($iWidth - StringLen($sTrimmed)) / 2)
    If $iPadding < 0 Then $iPadding = 0
    Return _StringRepeat(" ", $iPadding) & $sTrimmed
EndFunc

Func _LogStartupBanner()
    _AppendConsoleLine("--Initialising--")
    _AppendConsoleLine("--Guild Wars Vanquish Bot--")
    _AppendConsoleLine("--Brought to you by MrDomRocks--")
    _AppendConsoleLine("")
EndFunc

Func _VB_LogCallback($sMessage, $iMsgType, $sAuthor)
    Local $sLevel = "INFO"
    Switch $iMsgType
        Case 0
            $sLevel = "DEBUG"
        Case 1
            $sLevel = "INFO"
        Case 2
            $sLevel = "WARNING"
        Case 3
            $sLevel = "ERROR"
        Case 4
            $sLevel = "CRITICAL"
    EndSwitch

    _Log("[" & $sLevel & "] [" & $sAuthor & "] " & $sMessage)
EndFunc

Func CurrentAction($sText)
    _Log($sText)
EndFunc
