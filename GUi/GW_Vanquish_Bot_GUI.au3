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

Global $hGUI, $tab, $camp
Global $console
Global $picVanquishedHelmet
Global $lblDetectedClient, $lblDetectedCharacter, $lblConnectedCharacter
Global $lblMapScanStatus, $lblRunControlStatus
Global $lblRunTime, $lblDeaths, $lblVanquishStreak, $lblGoldPickedUp
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
Global $g_aRunControlArray[7]
Global $g_idComboTeam4[3]
Global $g_idComboTeam6[5]
Global $g_idComboTeam8[7]

Func _VB_CreateGUI()
    $hGUI = GUICreate("Guild Wars Vanquish Bot", 1180, 860)
    $tab = GUICtrlCreateTab(10, 10, 1160, 840)

    GUICtrlCreateTabItem("Main Menu")
    $console = GUICtrlCreateEdit("", 20, 50, 690, 330, BitOR($ES_READONLY, $ES_AUTOVSCROLL, $ES_MULTILINE, $WS_VSCROLL))
    $picVanquishedHelmet = GUICtrlCreatePic($g_sHelmetImagePath, 230, 405, 240, 240)
    GUICtrlCreateGroup("Client Connection", 730, 50, 350, 120)
    $lblDetectedClient = GUICtrlCreateLabel("Detected Client: scanning...", 750, 76, 300, 18)
    $lblDetectedCharacter = GUICtrlCreateLabel("Detected Character: scanning...", 750, 98, 300, 18)
    $lblConnectedCharacter = GUICtrlCreateLabel("Connected Character: not connected", 750, 120, 300, 18)
    $btnConnect = GUICtrlCreateButton("Connect To Client", 750, 140, 310, 24)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Map Vanquish Check", 730, 180, 350, 100)
    $btnScanVanquishHistory = GUICtrlCreateButton("Scan Vanquish Maps", 750, 206, 310, 26)
    $lblMapScanStatus = GUICtrlCreateLabel("Map Scan Status: waiting for client connection", 750, 240, 310, 30)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Run Control", 730, 290, 350, 170)
    $btnStart = GUICtrlCreateButton("Start Selected Maps", 750, 316, 145, 34)
    $btnStop = GUICtrlCreateButton("Stop", 915, 316, 145, 34)
    $lblRunControlStatus = GUICtrlCreateLabel("Run Status: idle", 750, 360, 310, 18)
    $lblRunTime = GUICtrlCreateLabel("Current Run Time: 00:00:00", 750, 384, 300, 18)
    $lblDeaths = GUICtrlCreateLabel("Deaths: 0", 750, 404, 300, 18)
    $lblVanquishStreak = GUICtrlCreateLabel("Maps Vanquished In A Row: 0", 750, 424, 300, 18)
    $lblGoldPickedUp = GUICtrlCreateLabel("Gold Picked Up: 0", 750, 444, 300, 18)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Heroes", 730, 470, 350, 320)
    GUICtrlCreateGroup("Team 4", 740, 492, 160, 115)
    For $i = 0 To 2
        GUICtrlCreateLabel("H" & ($i + 1) & ":", 748, 512 + ($i * 28), 22, 18)
        $g_idComboTeam4[$i] = GUICtrlCreateCombo("", 770, 509 + ($i * 28), 122, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam4[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam4[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Team 6", 740, 612, 160, 155)
    For $i = 0 To 4
        GUICtrlCreateLabel("H" & ($i + 1) & ":", 748, 632 + ($i * 28), 22, 18)
        $g_idComboTeam6[$i] = GUICtrlCreateCombo("", 770, 629 + ($i * 28), 122, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam6[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam6[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)

    GUICtrlCreateGroup("Team 8", 910, 492, 160, 215)
    For $i = 0 To 6
        GUICtrlCreateLabel("H" & ($i + 1) & ":", 918, 512 + ($i * 28), 22, 18)
        $g_idComboTeam8[$i] = GUICtrlCreateCombo("", 940, 509 + ($i * 28), 122, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
        GUICtrlSetData($g_idComboTeam8[$i], $g_sHeroList)
        GUICtrlSendMsg($g_idComboTeam8[$i], $CB_SETDROPPEDWIDTH, $g_iHeroDropdownWidth, 0)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    $btnSaveConfig = GUICtrlCreateButton("Save Config", 910, 736, 160, 24)

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
    $g_aRunControlArray[6] = $lblGoldPickedUp

    GUICtrlCreateTabItem("Map Selection")
    $btnToggleVisibleSelection = GUICtrlCreateButton("Select All EOTN", 890, 56, 230, 30)
    $btnGroupEOTN = GUICtrlCreateButton("EOTN", 20, 56, 150, 30, $BS_DEFPUSHBUTTON)
    $btnGroupProphecies = GUICtrlCreateButton("Prophecies", 580, 56, 150, 30)
    $btnGroupFactions = GUICtrlCreateButton("Factions", 20, 336, 150, 30)
    $btnGroupNightfall = GUICtrlCreateButton("Nightfall", 580, 336, 150, 30)

    $lvMapsEOTN = GUICtrlCreateListView(" |Region|Map|Status", 20, 92, 540, 220, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))
    $lvMapsProphecies = GUICtrlCreateListView(" |Region|Map|Status", 580, 92, 540, 220, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))
    $lvMapsFactions = GUICtrlCreateListView(" |Region|Map|Status", 20, 372, 540, 220, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))
    $lvMapsNightfall = GUICtrlCreateListView(" |Region|Map|Status", 580, 372, 540, 220, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS, $WS_VSCROLL, $WS_BORDER))

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
    GUICtrlSetData($lblGoldPickedUp, "Gold Picked Up: " & $g_iGoldPickedUp)
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

    For $i = 0 To UBound($g_aMapEntries) - 1
        If $g_aMapEntries[$i][5] Then
            $iVanquished += 1
        Else
            $iSelectable += 1
        EndIf
    Next

    If $sStatus = "" Then
        If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
            $sStatus = "waiting for client connection"
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
    If Not $g_bBotRunning And $g_bClientConnected And $Bot_Core_Initialized Then $iScanState = $GUI_ENABLE
    GUICtrlSetState($btnScanVanquishHistory, $iScanState)
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
    Local $aRegionChars[$MAP_CAMPAIGN_COUNT]
    Local $aMapChars[$MAP_CAMPAIGN_COUNT]

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
        Local $iY = 92
        If $i = 1 Then
            $iX = 580
        ElseIf $i = 2 Then
            $iY = 372
        ElseIf $i = 3 Then
            $iX = 580
            $iY = 372
        EndIf

        GUICtrlSetPos($g_aCampaignLists[$i], $iX, $iY, $iListWidth, 220)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 0, $iCheckWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 1, $iRegionWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 2, $iMapWidth)
        _GUICtrlListView_SetColumnWidth($g_aCampaignLists[$i], 3, $iStatusWidth)
    Next
EndFunc

Func _SetHeroComboArrayState(ByRef $aComboIDs, $iState)
    For $i = 0 To UBound($aComboIDs) - 1
        GUICtrlSetState($aComboIDs[$i], $iState)
    Next
EndFunc

Func _GetFirstSelectedMapIndex()
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
            _Log("The first checked map is linked to Team 4 hero slots.")
        Case "6"
            _SetHeroComboArrayState($g_idComboTeam4, $GUI_DISABLE)
            _SetHeroComboArrayState($g_idComboTeam6, $GUI_ENABLE)
            _SetHeroComboArrayState($g_idComboTeam8, $GUI_DISABLE)
            _Log("The first checked map is linked to Team 6 hero slots.")
        Case "8"
            _SetHeroComboArrayState($g_idComboTeam4, $GUI_DISABLE)
            _SetHeroComboArrayState($g_idComboTeam6, $GUI_DISABLE)
            _SetHeroComboArrayState($g_idComboTeam8, $GUI_ENABLE)
            _Log("The first checked map is linked to Team 8 hero slots.")
        Case Else
            _SetHeroComboArrayState($g_idComboTeam4, $GUI_ENABLE)
            _SetHeroComboArrayState($g_idComboTeam6, $GUI_ENABLE)
            _SetHeroComboArrayState($g_idComboTeam8, $GUI_ENABLE)
    EndSwitch
EndFunc

Func _GetCampaignIndex($sCampaign)
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

    For $i = 0 To UBound($g_aMapEntries) - 1
        If $g_aMapEntries[$i][0] <> $sCampaign Then ContinueLoop

        If $i >= UBound($g_aMapListItemIDs) Then ContinueLoop
        Local $sStatus = ""
        If $g_aMapEntries[$i][5] Then $sStatus = "Vanquished"

        Local $iItem = $g_aMapListItemIDs[$i]
        Local $iRow = $g_aMapListRows[$i]
        GUICtrlSetData($iItem, "|" & $g_aMapEntries[$i][1] & "|" & $g_aMapEntries[$i][2] & "|" & $sStatus)
        _GUICtrlListView_SetItemChecked($idList, $iRow, (Not $g_aMapEntries[$i][5]) And $g_aMapEntries[$i][3])
        If $g_aMapEntries[$i][5] Then
            GUICtrlSetColor($iItem, 0x808080)
        Else
            GUICtrlSetColor($iItem, 0x000000)
        EndIf
    Next
EndFunc

Func _SyncVisibleMapChecks()
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

Func _EnforceVisibleMapSelectionRules()
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
    For $i = 0 To $MAP_CAMPAIGN_COUNT - 1
        GUICtrlSetState($g_aCampaignButtons[$i], $GUI_ENABLE)
    Next

    Local $iCampaignIndex = _GetCampaignIndex($g_sActiveMapGroup)
    If $iCampaignIndex <> -1 Then GUICtrlSetState($g_aCampaignButtons[$iCampaignIndex], $GUI_DISABLE)
EndFunc

Func _Log($sText)
    Local $sExisting = GUICtrlRead($console)
    Local $sLine = "[" & @HOUR & ":" & @MIN & ":" & @SEC & "] " & $sText
    If $sExisting = "" Then
        GUICtrlSetData($console, $sLine)
    Else
        GUICtrlSetData($console, $sExisting & @CRLF & $sLine)
    EndIf
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
