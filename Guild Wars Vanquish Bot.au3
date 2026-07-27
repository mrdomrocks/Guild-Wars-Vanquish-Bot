#RequireAdmin

#include "../../API/_GwAu3.au3"
#include ".\Core\Vanquisher_Globals.au3"
#include ".\Core\Vanquisher_Compat.au3"
#include ".\Core\GwAu3_AddOns.au3"
#include ".\Maps\LocationsIDS.au3"
#include ".\Core\Vanquish_Routes.au3"
#include ".\GUi\GW_Vanquish_Bot_GUI.au3"

; Top-level launcher and controller for the GW Vanquish Bot GUI.
; Run this file from the bot root folder.

Global $g_hCharacterRefreshTimer = TimerInit()
Global $g_hClientScanTimer = TimerInit()
Global $g_bClientConnected = False
Global $g_sConnectedCharacter = ""
Global $g_sDetectedCharacter = ""
Global $g_iDetectedClientPid = 0
Global $g_iDetectedCharacterCount = 0
Global $g_sActiveMapGroup = "EOTN"
Global $boolrun = True
Global $g_aMapEntries[0][10] ; campaign, region, map name, checked, map id, vanquished, outpost id, max party size, script name, route function
Global $g_s_MainCharName = ""
Global $ProcessID = ""
Global $Bot_Core_Initialized = False
Global $g_hRunTimer = 0
Global $g_iRunDeaths = 0
Global $g_iVanquishStreak = 0
Global $g_iGoldPickedUp = 0
Global $g_iLastKnownGold = -1
Global $g_bWasPlayerDead = False
Global $g_bConnectionStatePrimed = False
Global $g_bVanquishHistoryLoaded = False
Global $g_bMapScanInProgress = False
Global $g_bPendingMapStateLoad = False
Global $g_bPendingPostConnectRefresh = False
Global $g_hPostConnectRefreshTimer = TimerInit()
Global $g_sLastHeroTeamState = ""
Global $g_sHeroList = _BuildHeroList()
Global $g_iHeroDropdownWidth = _EstimateHeroDropdownWidth()
Global $g_sHelmetImagePath = @ScriptDir & "\GUi\Vanquish.png"
Global $g_sGuiSourcePath = @ScriptDir & "\GUi\GW_Vanquish_Bot_GUI.au3"
Global $g_sGuiSourceStamp = _GetFileModifiedStamp($g_sGuiSourcePath)
Global $g_hGuiReloadTimer = TimerInit()
Global $g_bGuiReloadPending = False
Global $g_bGuiReloadNotified = False
Global $g_bScriptReloadRequested = False
Global $g_sScriptReloadCommand = ""
Global $g_sConfigPath = @ScriptDir & "\vanquish_config.ini"
Global $g_sMapsRoot = @ScriptDir & "\Maps"
Global $g_bBotRunning = False

If FileExists(@ScriptDir & "\Vanquish.png") Then
    $g_sHelmetImagePath = @ScriptDir & "\Vanquish.png"
ElseIf FileExists(@ScriptDir & "\GUi\Vanquish.png") Then
    $g_sHelmetImagePath = @ScriptDir & "\GUi\Vanquish.png"
EndIf

If IsDeclared("g_b_AutoUpdate") Then $g_b_AutoUpdate = False
If IsDeclared("g_bCore_AutoUpdate") Then $g_bCore_AutoUpdate = False

_VB_CreateGUI()
_LogStartupBanner()

_LoadMapEntries()
_InitializeMapListItems()
_ResizeMapListColumns()
_ShowMapCampaign("EOTN")
_LoadHeroConfig()
_RefreshDetectedClient(True)
_ResetRunStats()
_UpdateStartButtonState()
_UpdateRunStatusDisplay()
_UpdateConnectedCharacterDisplay()
_UpdateMapScanStatusDisplay()
_UpdateRunControlStatusDisplay()
_Log("Startup complete.")

While 1
    Local $msg = GUIGetMsg()
    If Not _HandleGuiMessage($msg) Then ExitLoop
    _RunGuiMaintenance()
    If $g_bScriptReloadRequested Then ExitLoop
WEnd

_VB_DestroyGUI()
If $g_bScriptReloadRequested And $g_sScriptReloadCommand <> "" Then Run($g_sScriptReloadCommand, @ScriptDir)

Func _ConnectToDetectedClient()
    Local $bInitOK = False
    Local $iAttachPid = $g_iDetectedClientPid
    Local $sCharacter = $g_sDetectedCharacter

    If $iAttachPid <= 0 Or $sCharacter = "" Then
        $g_bClientConnected = False
        $g_sConnectedCharacter = ""
        $g_s_MainCharName = ""
        $ProcessID = ""
        $Bot_Core_Initialized = False
        $g_bConnectionStatePrimed = False
        $g_bVanquishHistoryLoaded = False
        $g_bPendingMapStateLoad = False
        $g_bPendingPostConnectRefresh = False
        _SetCharacterSelectionState(False)
        _ResetRunStats()
        _ClearHistoricalVanquishStates(False)
        _UpdateConnectedCharacterDisplay()
        _UpdateMapScanStatusDisplay("no client connection")
        _UpdateRunControlStatusDisplay("idle")
        _Log("Connect failed: no logged-in Guild Wars character was detected.")
        Return False
    EndIf

    If $g_h_GWProcess Then Memory_Close()
    $g_h_GWProcess = 0
    $g_i_GWProcessId = 0
    $g_p_BasePointer = 0

    _Log("Connecting to Guild Wars character: " & $sCharacter & ".")
    $bInitOK = _InitializeDetectedClient("", $iAttachPid)
    If $bInitOK And $g_i_GWProcessId > 0 Then $ProcessID = String($g_i_GWProcessId)

    If Not $bInitOK Then
        $g_bClientConnected = False
        $g_sConnectedCharacter = ""
        $g_s_MainCharName = ""
        $ProcessID = ""
        $Bot_Core_Initialized = False
        $g_bConnectionStatePrimed = False
        $g_bVanquishHistoryLoaded = False
        $g_bPendingMapStateLoad = False
        $g_bPendingPostConnectRefresh = False
        _SetCharacterSelectionState(False)
        _ResetRunStats()
        _ClearHistoricalVanquishStates(False)
        _UpdateConnectedCharacterDisplay()
        _UpdateMapScanStatusDisplay("connect failed")
        _UpdateRunControlStatusDisplay("idle")
        _Log("Connect failed for Guild Wars character: " & $sCharacter & ".")
        Return False
    EndIf

    $g_bClientConnected = True
    $sCharacter = _ResolveConnectedCharacterName($sCharacter, 0)
    If $sCharacter = "" Then $sCharacter = "Guild Wars PID " & $iAttachPid
    $g_s_MainCharName = $sCharacter
    $Bot_Core_Initialized = True
    $g_bConnectionStatePrimed = False
    $g_bVanquishHistoryLoaded = False
    $g_bPendingMapStateLoad = False
    $g_bPendingPostConnectRefresh = False
    $g_sConnectedCharacter = $sCharacter
    _SetCharacterSelectionState(True)
    _ResetRunStats()
    $g_hRunTimer = TimerInit()

    ; Connection should stay on the client side only until the user explicitly scans maps.
    _ShowMainMenuTab()
    _UpdateRunStatusDisplay()
    _UpdateConnectedCharacterDisplay()
    _UpdateMapScanStatusDisplay("connected - scan pending")
    _UpdateRunControlStatusDisplay("ready to scan")
    _Log("Connection established. Map actions are idle until Scan Maps is pressed.")
    Return True
EndFunc

Func _RefreshDetectedClient($bLogChanges = False)
    If $g_bClientConnected Then Return $g_iDetectedClientPid > 0

    Local $iOldPid = $g_iDetectedClientPid
    Local $sOldCharacter = $g_sDetectedCharacter
    Local $iOldCount = $g_iDetectedCharacterCount

    Local $aProcessList = Scanner_ListGWProcesses()
    Local $iDetectedPid = 0
    Local $sDetectedCharacter = ""
    Local $iDetectedCount = 0

    For $i = 1 To $aProcessList[0][0]
        Local $iPid = Number($aProcessList[$i][1], 2)
        If $iPid <= 0 Then ContinueLoop

        Memory_Open($iPid)
        Local $sCharacter = ""
        If $g_h_GWProcess <> 0 And Scanner_InitializeSections() Then
            Scanner_ScanForCharname()
            $sCharacter = StringStripWS(Player_GetCharName(), 3)
        EndIf
        Memory_Close()
        $g_h_GWProcess = 0
        $g_i_GWProcessId = 0
        $g_p_BasePointer = 0

        If $sCharacter = "" Then ContinueLoop

        $iDetectedCount += 1
        If $iDetectedCount = 1 Then
            $iDetectedPid = $iPid
            $sDetectedCharacter = $sCharacter
        Else
            $iDetectedPid = 0
            $sDetectedCharacter = ""
        EndIf
    Next

    $g_iDetectedClientPid = $iDetectedPid
    $g_sDetectedCharacter = $sDetectedCharacter
    $g_iDetectedCharacterCount = $iDetectedCount
    _UpdateDetectedCharacterDisplay($g_sDetectedCharacter, $g_iDetectedCharacterCount)

    If Not $bLogChanges Then Return $g_iDetectedClientPid > 0

    If $g_iDetectedCharacterCount > 1 Then
        If $iOldCount <> $g_iDetectedCharacterCount Or $iOldPid <> 0 Or $sOldCharacter <> "" Then _Log("Multiple logged-in Guild Wars characters detected.")
    ElseIf $g_iDetectedClientPid > 0 Then
        If $g_iDetectedClientPid <> $iOldPid Or $g_sDetectedCharacter <> $sOldCharacter Then _Log("Detected logged-in character: " & $g_sDetectedCharacter & ".")
    Else
        If $iOldPid <> 0 Or $sOldCharacter <> "" Or $iOldCount <> 0 Then _Log("No logged-in Guild Wars character detected.")
    EndIf

    Return $g_iDetectedClientPid > 0
EndFunc

Func _RunDeferredPostConnectRefresh()
    $g_bPendingPostConnectRefresh = False
    $g_bPendingMapStateLoad = True
EndFunc

Func _ScanConnectedCharacterVanquishHistory()
    If $g_bMapScanInProgress Then
        _UpdateMapScanStatusDisplay("scan already in progress")
        Return False
    EndIf

    $g_bMapScanInProgress = True
    _UpdateStartButtonState()

    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
        _UpdateMapScanStatusDisplay("connect a client first")
        _Log("Scan failed: connect to a running Guild Wars client first.")
        $g_bMapScanInProgress = False
        _UpdateStartButtonState()
        Return False
    EndIf

    If Not _PrimeConnectedClientState(True) Then
        _UpdateMapScanStatusDisplay("waiting for in-game state")
        _Log("Scan failed: wait for the character to finish loading into the world.")
        $g_bMapScanInProgress = False
        _UpdateStartButtonState()
        Return False
    EndIf

    If Not _CanQueryLiveClientState() Then
        _UpdateMapScanStatusDisplay("client is still loading")
        _Log("Scan failed: Guild Wars is still loading the current character.")
        $g_bMapScanInProgress = False
        _UpdateStartButtonState()
        Return False
    EndIf

    Local $sCharacter = _GetAttachedCharacterName()
    If $sCharacter = "" Then $sCharacter = $g_sConnectedCharacter
    If $sCharacter = "" Then $sCharacter = "current character"

    _Log("Scanning vanquish history for " & $sCharacter & ".")
    _UpdateMapScanStatusDisplay("scanning...")
    $g_bVanquishHistoryLoaded = _RefreshHistoricalVanquishStates()
    $g_bMapScanInProgress = False
    $g_bPendingMapStateLoad = False
    _UpdateStartButtonState()
    If $g_bVanquishHistoryLoaded Then
        _ShowMainMenuTab()
        _UpdateMapScanStatusDisplay()
        _UpdateRunControlStatusDisplay("ready to start")
    Else
        _UpdateMapScanStatusDisplay("scan unavailable")
    EndIf
    Return $g_bVanquishHistoryLoaded
EndFunc

Func _RefreshConnectedMapState($bLogWaiting = False)
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then Return False

    If Not _PrimeConnectedClientState($bLogWaiting) Then
        $g_bPendingMapStateLoad = True
        Return False
    EndIf

    $g_bPendingMapStateLoad = False
    $g_bVanquishHistoryLoaded = _RefreshHistoricalVanquishStates()
    _RefreshHeroTeamSelectionState()
    _UpdateStartButtonState()
    _UpdateMapScanStatusDisplay()
    Return $g_bVanquishHistoryLoaded
EndFunc

Func _InitializeDetectedClient($sCharacter = "", $iAttachPid = 0)
    Local $vTarget = $sCharacter
    If $iAttachPid > 0 Then
        $vTarget = Number($iAttachPid, 2)
        _Log("Attaching to Guild Wars client PID " & $iAttachPid & ".")
    Else
        _Log("Attaching to Guild Wars client by character name.")
    EndIf

    Local $iResult = Core_Initialize($vTarget, False)
    If $iResult = 0 Or Not $g_h_GWProcess Or $g_p_BasePointer = 0 Then Return False
    _V2_SyncLegacyHandles()
    Return True
EndFunc

Func _FindSoleGuildWarsPid()
    Local $aCandidates[0]
    Local $aProcessNames[2] = ["Gw.exe", "gw.exe"]

    For $iName = 0 To 1
        Local $aProcessList = ProcessList($aProcessNames[$iName])
        For $i = 1 To $aProcessList[0][0]
            Local $iPid = Number($aProcessList[$i][1], 2)
            If $iPid <= 0 Then ContinueLoop

            Local $bExists = False
            For $j = 0 To UBound($aCandidates) - 1
                If $aCandidates[$j] = $iPid Then
                    $bExists = True
                    ExitLoop
                EndIf
            Next

            If $bExists Then ContinueLoop
            Local $iNext = UBound($aCandidates)
            ReDim $aCandidates[$iNext + 1]
            $aCandidates[$iNext] = $iPid
        Next
    Next

    If UBound($aCandidates) = 1 Then Return $aCandidates[0]
    Return 0
EndFunc

Func _ResetRunStats()
    $g_hRunTimer = 0
    $g_iRunDeaths = 0
    $g_iVanquishStreak = 0
    $g_iGoldPickedUp = 0
    $g_iLastKnownGold = -1
    $g_bWasPlayerDead = False
    _UpdateStartButtonState()
    _UpdateRunStatusDisplay()
EndFunc

Func _V2_CountGWClients()
    Local $aCandidates[0]
    Local $aProcessNames[2] = ["Gw.exe", "gw.exe"]

    For $iName = 0 To 1
        Local $aProcessList = ProcessList($aProcessNames[$iName])
        For $i = 1 To $aProcessList[0][0]
            Local $iPid = Number($aProcessList[$i][1], 2)
            If $iPid <= 0 Then ContinueLoop

            Local $bExists = False
            For $j = 0 To UBound($aCandidates) - 1
                If $aCandidates[$j] = $iPid Then
                    $bExists = True
                    ExitLoop
                EndIf
            Next

            If $bExists Then ContinueLoop
            Local $iNext = UBound($aCandidates)
            ReDim $aCandidates[$iNext + 1]
            $aCandidates[$iNext] = $iPid
        Next
    Next

    Return UBound($aCandidates)
EndFunc

Func _V2_GWIsRunning()
    Return _V2_CountGWClients() > 0
EndFunc

Func _V2_SyncLegacyHandles()
    $nHandle = $g_h_GWProcess
    $nPID = $g_i_GWProcessId
EndFunc

Func _V2_IsAttached()
    Return $g_h_GWProcess <> 0 And $g_p_BasePointer <> 0
EndFunc

Func _CanQueryLiveClientState()
    Local $bReady = True
    Local $bAttached = _V2_IsAttached()
    Local $bStatusError = False
    Local $bInGame = False
    Local $bIsLoading = False

    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
        $bReady = False
    Else
        If Not $bAttached Then
            $bReady = False
        Else
            $bStatusError = Core_GetStatusError()
            If $bStatusError Then
                $bReady = False
            Else
                $bInGame = Core_IsIngame()
                If Not $bInGame Then
                    $bReady = False
                Else
                    $bIsLoading = Map_GetInstanceInfo("IsLoading")
                    If $bIsLoading Then $bReady = False
                EndIf
            EndIf
        EndIf
    EndIf

    Return $bReady
EndFunc

Func _PrimeConnectedClientState($bLogWaiting = False)
    If $g_bConnectionStatePrimed Then Return True
    If Not _CanQueryLiveClientState() Then
        If $bLogWaiting Then _Log("Connected to client. Waiting for in-game character data before reading map and world state.")
        Return False
    EndIf

    Local $sLiveCharacter = Player_GetCharName()
    If $sLiveCharacter <> "" Then $g_sConnectedCharacter = $sLiveCharacter

    $g_iLastKnownGold = GetGoldCharacter()
    $g_bWasPlayerDead = GetIsDead(-2)
    _RefreshMapPartySizeRequirements()
    $g_bConnectionStatePrimed = True
    _UpdateStartButtonState()

    _Log("Connected to Guild Wars client: " & $g_sConnectedCharacter)
    Return True
EndFunc

Func _GetAttachedCharacterName()
    If Not _V2_IsAttached() Then Return ""
    Return StringStripWS(Player_GetCharName(), 3)
EndFunc

Func _ResolveConnectedCharacterName($sFallback = "", $iTimeoutMs = 5000)
    #forceref $iTimeoutMs
    $sFallback = StringStripWS($sFallback, 3)

    Local $sCharacter = _GetAttachedCharacterName()
    If $sCharacter <> "" Then Return $sCharacter
    If $sFallback <> "" Then Return $sFallback
    Return ""
EndFunc

Func _UpdateLiveRunStats()
    If Not $g_bClientConnected Then
        _UpdateRunStatusDisplay()
        Return
    EndIf

    If Not _PrimeConnectedClientState() Then
        _UpdateRunStatusDisplay()
        Return
    EndIf

    If Not _CanQueryLiveClientState() Then
        _UpdateRunStatusDisplay()
        Return
    EndIf

    Local $bIsDead = GetIsDead(-2)
    If $bIsDead And Not $g_bWasPlayerDead Then $g_iRunDeaths += 1
    $g_bWasPlayerDead = $bIsDead

    Local $iCurrentGold = GetGoldCharacter()
    If $g_iLastKnownGold >= 0 And $iCurrentGold > $g_iLastKnownGold Then
        $g_iGoldPickedUp += ($iCurrentGold - $g_iLastKnownGold)
    EndIf
    $g_iLastKnownGold = $iCurrentGold

    _UpdateRunStatusDisplay()
EndFunc

Func _BuildHeroList()
    Local $sHeroList = ""

    For $i = 1 To $GC_AM2_HERO_DATA[0][0]
        If $sHeroList <> "" Then $sHeroList &= "|"
        $sHeroList &= $GC_AM2_HERO_DATA[$i][1]
    Next

    Return $sHeroList
EndFunc

Func _ResolveSavedHeroName($sValue)
    If $sValue = "" Then Return ""

    If StringIsInt($sValue) Then
        Local $iIndex = Number($sValue)
        If $iIndex > 0 And $iIndex <= $GC_AM2_HERO_DATA[0][0] Then Return $GC_AM2_HERO_DATA[$iIndex][1]
        Return ""
    EndIf

    Return $sValue
EndFunc

Func _SaveHeroConfig()
    For $i = 0 To 2
        IniWrite($g_sConfigPath, "Team4", "Hero" & ($i + 1), StringStripWS(GUICtrlRead($g_idComboTeam4[$i]), 3))
    Next

    For $i = 0 To 4
        IniWrite($g_sConfigPath, "Team6", "Hero" & ($i + 1), StringStripWS(GUICtrlRead($g_idComboTeam6[$i]), 3))
    Next

    For $i = 0 To 6
        IniWrite($g_sConfigPath, "Team8", "Hero" & ($i + 1), StringStripWS(GUICtrlRead($g_idComboTeam8[$i]), 3))
    Next

    _Log("Hero team configuration saved.")
    Return True
EndFunc

Func _LoadHeroConfig()
    If Not FileExists($g_sConfigPath) Then Return False

    For $i = 0 To 2
        Local $sHeroValue = IniRead($g_sConfigPath, "Team4", "Hero" & ($i + 1), "")
        Local $sHeroName = _ResolveSavedHeroName($sHeroValue)
        If $sHeroName <> "" Then GUICtrlSetData($g_idComboTeam4[$i], "|" & $g_sHeroList, $sHeroName)
    Next

    For $i = 0 To 4
        Local $sHeroValue = IniRead($g_sConfigPath, "Team6", "Hero" & ($i + 1), "")
        Local $sHeroName = _ResolveSavedHeroName($sHeroValue)
        If $sHeroName <> "" Then GUICtrlSetData($g_idComboTeam6[$i], "|" & $g_sHeroList, $sHeroName)
    Next

    For $i = 0 To 6
        Local $sHeroValue = IniRead($g_sConfigPath, "Team8", "Hero" & ($i + 1), "")
        Local $sHeroName = _ResolveSavedHeroName($sHeroValue)
        If $sHeroName <> "" Then GUICtrlSetData($g_idComboTeam8[$i], "|" & $g_sHeroList, $sHeroName)
    Next

    _Log("Hero team configuration loaded.")
    Return True
EndFunc

Func _EstimateHeroDropdownWidth()
    Local $iMaxChars = 0

    For $i = 1 To $GC_AM2_HERO_DATA[0][0]
        Local $iNameLength = StringLen($GC_AM2_HERO_DATA[$i][1])
        If $iNameLength > $iMaxChars Then $iMaxChars = $iNameLength
    Next

    If $iMaxChars < 1 Then $iMaxChars = 1
    Local $iWidth = Int(($iMaxChars * 6.5) + 18)
    If $iWidth < 137 Then $iWidth = 137
    Return $iWidth
EndFunc

Func _GetHeroIDForSelection($sHeroName)
    If $sHeroName = "" Then Return 0

    For $i = 1 To $GC_AM2_HERO_DATA[0][0]
        If StringCompare($GC_AM2_HERO_DATA[$i][1], $sHeroName, 0) = 0 Then Return $GC_AM2_HERO_DATA[$i][0]
    Next

    Return 0
EndFunc

Func SetupTeamForPartySize($iMaxPartySize)
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
        _Log("Cannot set up heroes before connecting to a character.")
        Return False
    EndIf

    Ui_LeaveGroup()
    Sleep(250)

    Local $aComboIDs
    Local $iHeroCount = 0

    Switch $iMaxPartySize
        Case 4
            $iHeroCount = 3
            $aComboIDs = $g_idComboTeam4
        Case 6
            $iHeroCount = 5
            $aComboIDs = $g_idComboTeam6
        Case 8
            $iHeroCount = 7
            $aComboIDs = $g_idComboTeam8
        Case Else
            _Log("Unsupported party size for hero setup: " & $iMaxPartySize)
            Return False
    EndSwitch

    For $i = 0 To $iHeroCount - 1
        Local $sHeroName = StringStripWS(GUICtrlRead($aComboIDs[$i]), 3)
        If $sHeroName = "" Then ContinueLoop

        Local $iHeroID = _GetHeroIDForSelection($sHeroName)
        If $iHeroID <= 0 Then ContinueLoop

        Ui_AddHero($iHeroID)
        _Log("Adding hero: " & $sHeroName)
        Sleep(250)
    Next

    _Log("Team setup complete for party size " & $iMaxPartySize & ".")
    Return True
EndFunc

Func _GetCheckedMapIndexes()
    Local $aChecked[0]

    For $i = 0 To UBound($g_aMapEntries) - 1
        If Not $g_aMapEntries[$i][3] Then ContinueLoop
        If $g_aMapEntries[$i][5] Then ContinueLoop

        Local $iNext = UBound($aChecked)
        ReDim $aChecked[$iNext + 1]
        $aChecked[$iNext] = $i
    Next

    Return $aChecked
EndFunc

Func _Vanquisher_ZoneTitle($iMapIndex)
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return ""
    Local $sTitle = $g_aMapEntries[$iMapIndex][8]
    If $sTitle = "" Then $sTitle = StringReplace($g_aMapEntries[$iMapIndex][2], " ", "")
    Switch $sTitle
        Case "IceDome"
            Return "Icedome"
    EndSwitch
    Return $sTitle
EndFunc

Func _ApplyQueuedMapContext($iMapIndex)
    Global $Title, $Map_To_Farm, $Map_To_Zone
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return False

    $Title = _Vanquisher_ZoneTitle($iMapIndex)
    $Map_To_Farm = $g_aMapEntries[$iMapIndex][4]
    $Map_To_Zone = $g_aMapEntries[$iMapIndex][6]
    Return True
EndFunc

Func _PrepareQueuedMapStart($iMapIndex)
    If Not _ApplyQueuedMapContext($iMapIndex) Then Return False

    Local $sMapName = _Vanquisher_ZoneDisplay($iMapIndex)
    Local $iRequiredPartySize = $g_aMapEntries[$iMapIndex][7]
    Local $iOutpostID = $g_aMapEntries[$iMapIndex][6]
    Local $iTargetMapID = $g_aMapEntries[$iMapIndex][4]

    If Not Map_GetInstanceInfo("IsExplorable") And $iOutpostID > 0 And GetMapID() <> $iOutpostID And GetMapID() <> $iTargetMapID Then
        CurrentAction("Traveling to outpost for " & $sMapName & ".")
        TravelTo($iOutpostID)
        WaitMapLoading($iOutpostID, 30000)
    EndIf

    If $iRequiredPartySize <= 0 Then
        _Log("Start failed: could not resolve party size for " & $sMapName & ".")
        Return False
    EndIf

    If Not SetupTeamForPartySize($iRequiredPartySize) Then
        _Log("Start failed: hero team setup did not complete for " & $sMapName & ".")
        Return False
    EndIf

    Return True
EndFunc

Func _Vanquisher_ZoneDisplay($iMapIndex)
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return ""
    Return $g_aMapEntries[$iMapIndex][2]
EndFunc

Func _InitMapQueueFromSelection()
    Global $g_a_VanquisherZoneQueue, $g_i_VanquisherZoneQueueIndex

    $g_a_VanquisherZoneQueue = _GetCheckedMapIndexes()
    If UBound($g_a_VanquisherZoneQueue) = 0 Then
        $g_i_VanquisherZoneQueueIndex = -1
        Return False
    EndIf

    $g_i_VanquisherZoneQueueIndex = 0
    Return True
EndFunc

Func _GetConfiguredHeroCountForPartySize($iMaxPartySize)
    Local $aComboIDs
    Local $iHeroCount = 0

    Switch $iMaxPartySize
        Case 4
            $aComboIDs = $g_idComboTeam4
        Case 6
            $aComboIDs = $g_idComboTeam6
        Case 8
            $aComboIDs = $g_idComboTeam8
        Case Else
            Return 0
    EndSwitch

    For $i = 0 To UBound($aComboIDs) - 1
        If StringStripWS(GUICtrlRead($aComboIDs[$i]), 3) <> "" Then $iHeroCount += 1
    Next

    Return $iHeroCount
EndFunc

Func _GetRequiredPartySizeForQueue(ByRef $aQueue)
    If UBound($aQueue) = 0 Then Return 0

    Local $iMapIndex = $aQueue[0]
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return 0

    Local $iMapPartySize = $g_aMapEntries[$iMapIndex][7]
    If $iMapPartySize <= 0 Then
        $iMapPartySize = _ResolveMaxPartySizeForMap($g_aMapEntries[$iMapIndex][4], $g_aMapEntries[$iMapIndex][6])
        $g_aMapEntries[$iMapIndex][7] = $iMapPartySize
    EndIf

    Return $iMapPartySize
EndFunc

Func _LogSelectedMapQueue(ByRef $aQueue)
    For $i = 0 To UBound($aQueue) - 1
        Local $iMapIndex = $aQueue[$i]
        If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then ContinueLoop

        Local $iPartySize = $g_aMapEntries[$iMapIndex][7]
        Local $sPartyLabel = "Unknown"
        If $iPartySize > 0 Then $sPartyLabel = "Team " & $iPartySize
        _Log("Queue " & ($i + 1) & "/" & UBound($aQueue) & ": " & $g_aMapEntries[$iMapIndex][1] & " - " & _Vanquisher_ZoneDisplay($iMapIndex) & " (" & $sPartyLabel & ")")
    Next
EndFunc

Func _PrepareSelectedVanquishQueue()
    Global $Title, $NumberRun, $boolrun, $g_b_Vanquisher_AbortRoute, $g_b_Vanquisher_RunFinished

    _SyncAllMapChecks()
    _EnforceVisibleMapSelectionRules()

    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
        _Log("Start failed: connect to a Guild Wars character first.")
        Return False
    EndIf

    If Not _PrimeConnectedClientState(True) Then
        _Log("Start failed: waiting for live in-game data before preparing the queue.")
        Return False
    EndIf

    If Map_GetInstanceInfo("IsLoading") Then
        _Log("Start failed: the client is still loading. Try again in a moment.")
        Return False
    EndIf

    If Map_GetInstanceInfo("IsExplorable") Then
        _Log("Start failed: return to an outpost before preparing the vanquish queue.")
        Return False
    EndIf

    If Not _InitMapQueueFromSelection() Then
        _Log("Start failed: no maps are checked in Map Selection.")
        Return False
    EndIf

    Local $iRequiredPartySize = _GetRequiredPartySizeForQueue($g_a_VanquisherZoneQueue)
    If $iRequiredPartySize <= 0 Then
        _Log("Start failed: could not resolve the party size for the first checked map.")
        Return False
    EndIf

    Local $iConfiguredHeroes = _GetConfiguredHeroCountForPartySize($iRequiredPartySize)
    If $iConfiguredHeroes = 0 Then
        _Log("Start failed: no heroes are selected for Team " & $iRequiredPartySize & ".")
        Return False
    EndIf

    If $iConfiguredHeroes < ($iRequiredPartySize - 1) Then
        _Log("Team " & $iRequiredPartySize & " has only " & $iConfiguredHeroes & " hero slot(s) configured. Empty slots will stay empty.")
    EndIf

    _ApplyQueuedMapContext($g_a_VanquisherZoneQueue[0])
    $NumberRun = 0
    $boolrun = True
    $g_b_Vanquisher_AbortRoute = False
    $g_b_Vanquisher_RunFinished = False

    _Log("Preparing vanquish queue with " & UBound($g_a_VanquisherZoneQueue) & " map(s).")
    _LogSelectedMapQueue($g_a_VanquisherZoneQueue)
    _Log("Initial target: " & _Vanquisher_ZoneDisplay($g_a_VanquisherZoneQueue[0]) & " (Team " & $iRequiredPartySize & ").")
    _Log("Start preparation complete. Travel to the first outpost and team setup will happen as the route starts.")
    Return True
EndFunc

Func _LoadMapEntries()
    ReDim $g_aMapEntries[0][10]
    Local $iSkippedMissingMapIDs = 0

    Local $hSearch = FileFindFirstFile($g_sMapsRoot & "\*")
    If $hSearch = -1 Then
        _Log("Maps directory not found: " & $g_sMapsRoot)
        Return
    EndIf

    While 1
        Local $sFolder = FileFindNextFile($hSearch)
        If @error Then ExitLoop
        If StringLeft($sFolder, 1) = "." Then ContinueLoop
        If $sFolder = "_Templates" Then ContinueLoop
        If Not StringInStr(FileGetAttrib($g_sMapsRoot & "\" & $sFolder), "D") Then ContinueLoop

        Local $sCampaign = _MapCampaignFromFolder($sFolder)
        If $sCampaign = "" Then ContinueLoop

        Local $sRegion = _MapRegionFromFolder($sFolder)
        Local $hFileSearch = FileFindFirstFile($g_sMapsRoot & "\" & $sFolder & "\*.au3")
        If $hFileSearch = -1 Then ContinueLoop

        While 1
            Local $sFile = FileFindNextFile($hFileSearch)
            If @error Then ExitLoop

            Local $sMapName = StringTrimRight($sFile, 4)
            If $sMapName = "" Then ContinueLoop

            Local $iMapID = _ResolveMapIDFromScriptName($sMapName)
            If $iMapID <= 0 Then
                $iSkippedMissingMapIDs += 1
                ContinueLoop
            EndIf

            Local $iOutpostID = _ResolveOutpostIDFromScriptName($sMapName)
            Local $iNext = UBound($g_aMapEntries)
            ReDim $g_aMapEntries[$iNext + 1][10]
            $g_aMapEntries[$iNext][0] = $sCampaign
            $g_aMapEntries[$iNext][1] = $sRegion
            $g_aMapEntries[$iNext][2] = _HumanizeMapName($sMapName)
            $g_aMapEntries[$iNext][3] = False
            $g_aMapEntries[$iNext][4] = $iMapID
            $g_aMapEntries[$iNext][5] = False
            $g_aMapEntries[$iNext][6] = $iOutpostID
            $g_aMapEntries[$iNext][7] = _ResolveMaxPartySizeForMap($iMapID, $iOutpostID)
            $g_aMapEntries[$iNext][8] = $sMapName
            $g_aMapEntries[$iNext][9] = _ResolveRouteFunctionFromScriptName($sMapName)
        WEnd

        FileClose($hFileSearch)
    WEnd

    FileClose($hSearch)

EndFunc

Func _ResolveRouteFunctionFromScriptName($sMapName)
    Switch $sMapName
        Case "IceDome"
            Return "VQIcedome"
    EndSwitch
    Return "VQ" & $sMapName
EndFunc

Func _ResolveMapIDFromScriptName($sMapName)
    Local $sVarName = $sMapName & "_Map"
    If IsDeclared($sVarName) Then Return Eval($sVarName)

    Switch $sMapName
        Case "IceDome"
            $sVarName = "Icedome_Map"
    EndSwitch

    If IsDeclared($sVarName) Then Return Eval($sVarName)
    Return 0
EndFunc

Func _ResolveOutpostIDFromScriptName($sMapName)
    Local $sVarName = $sMapName & "_Outpost"
    If IsDeclared($sVarName) Then Return Eval($sVarName)

    Switch $sMapName
        Case "IceDome"
            $sVarName = "Icedome_Outpost"
    EndSwitch

    If IsDeclared($sVarName) Then Return Eval($sVarName)
    Return 0
EndFunc

Func _NormalizePartySize($iPartySize)
    If $iPartySize <= 4 Then Return 4
    If $iPartySize <= 6 Then Return 6
    If $iPartySize <= 8 Then Return 8
    Return 8
EndFunc

Func _ResolveMaxPartySizeForMap($iMapID, $iOutpostID = 0)
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then Return 0

    Local $iPartySize = 0
    If $iOutpostID > 0 Then $iPartySize = Map_GetAreaInfo($iOutpostID, "MaxPartySize")
    If $iPartySize <= 0 And $iMapID > 0 Then $iPartySize = Map_GetAreaInfo($iMapID, "MaxPartySize")

    If $iPartySize <= 0 And $iMapID > 0 Then
        Local $iControlledOutpostID = Map_GetAreaInfo($iMapID, "ControlledOutpostID")
        If $iControlledOutpostID > 0 Then $iPartySize = Map_GetAreaInfo($iControlledOutpostID, "MaxPartySize")
    EndIf

    If $iPartySize <= 0 Then Return 8
    Return _NormalizePartySize($iPartySize)
EndFunc

Func _RefreshMapPartySizeRequirements()
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then Return False

    Local $iTeam4Count = 0
    Local $iTeam6Count = 0
    Local $iTeam8Count = 0

    For $i = 0 To UBound($g_aMapEntries) - 1
        $g_aMapEntries[$i][7] = _ResolveMaxPartySizeForMap($g_aMapEntries[$i][4], $g_aMapEntries[$i][6])

        Switch $g_aMapEntries[$i][7]
            Case 4
                $iTeam4Count += 1
            Case 6
                $iTeam6Count += 1
            Case 8
                $iTeam8Count += 1
        EndSwitch
    Next

    _Log("Resolved party-size limits: Team 4=" & $iTeam4Count & ", Team 6=" & $iTeam6Count & ", Team 8=" & $iTeam8Count & ".")
    Return True
EndFunc

Func _RefreshHistoricalVanquishStates()
    Local $pArray = World_GetWorldInfo("VanquishedAreasArray")
    Local $iArraySize = World_GetWorldInfo("VanquishedAreasArraySize")

    If $pArray = 0 Or $iArraySize <= 0 Then
        _ClearHistoricalVanquishStates(False)
        _Log("Vanquish history array is unavailable for the connected client.")
        Return False
    EndIf

    Local $iMarked = 0

    For $i = 0 To UBound($g_aMapEntries) - 1
        Local $iMapID = $g_aMapEntries[$i][4]
        If $iMapID <= 0 Then
            $g_aMapEntries[$i][5] = False
            ContinueLoop
        EndIf

        $g_aMapEntries[$i][5] = World_IsAreaVanquished($iMapID)
        If $g_aMapEntries[$i][5] Then
            $g_aMapEntries[$i][3] = False
            $iMarked += 1
        EndIf
    Next

    _PopulateMapList("ALL")
    _Log("Loaded vanquish history: " & $iMarked & " completed map(s) found.")
    Return True
EndFunc

Func _ClearHistoricalVanquishStates($bRefreshList = True)
    For $i = 0 To UBound($g_aMapEntries) - 1
        $g_aMapEntries[$i][5] = False
    Next

    $g_bVanquishHistoryLoaded = False

    If $bRefreshList Then _PopulateMapList($g_sActiveMapGroup)
    _UpdateStartButtonState()
    _UpdateMapScanStatusDisplay()
EndFunc

Func _MapCampaignFromFolder($sFolder)
    If StringLeft($sFolder, 5) = "EOTN_" Then Return "EOTN"
    If StringLeft($sFolder, 6) = "Proph_" Then Return "Prophecies"
    If StringLeft($sFolder, 9) = "Factions_" Then Return "Factions"
    If StringLeft($sFolder, 3) = "NF_" Then Return "Nightfall"
    Return ""
EndFunc

Func _MapRegionFromFolder($sFolder)
    Local $sRegion = $sFolder
    Switch _MapCampaignFromFolder($sFolder)
        Case "EOTN"
            $sRegion = StringTrimLeft($sFolder, 5)
        Case "Prophecies"
            $sRegion = StringTrimLeft($sFolder, 6)
        Case "Factions"
            $sRegion = StringTrimLeft($sFolder, 9)
        Case "Nightfall"
            $sRegion = StringTrimLeft($sFolder, 3)
    EndSwitch
    Return _HumanizeMapName($sRegion)
EndFunc

Func _HumanizeMapName($sName)
    $sName = StringRegExpReplace($sName, "([a-z])([A-Z])", "$1 $2")
    $sName = StringReplace($sName, "EOTN", "EOTN")
    Return StringStripWS($sName, 3)
EndFunc

Func _HandleGuiMessage($msg, $bFromPump = False)
    Switch $msg
        Case 0
            Return True

        Case $GUI_EVENT_CLOSE
            If $g_bBotRunning Then
                _StopSelectedMapRoutine(False)
                Return True
            EndIf
            Return False

        Case $btnConnect
            If Not $g_bBotRunning Then _ConnectToDetectedClient()

        Case $btnScanVanquishHistory
            If Not $g_bBotRunning Then _ScanConnectedCharacterVanquishHistory()

        Case $btnStart
            If Not $g_bBotRunning Then _StartSelectedMapRoutine()

        Case $btnStop
            _StopSelectedMapRoutine(Not $bFromPump)

        Case $btnSaveConfig
            If Not $g_bBotRunning Then _SaveHeroConfig()

        Case $btnGroupEOTN
            _ShowMapCampaign("EOTN")

        Case $btnGroupProphecies
            _ShowMapCampaign("Prophecies")

        Case $btnGroupFactions
            _ShowMapCampaign("Factions")

        Case $btnGroupNightfall
            _ShowMapCampaign("Nightfall")

        Case $btnToggleVisibleSelection
            _ToggleVisibleMapChecks()
    EndSwitch

    Return True
EndFunc

Func _RunGuiMaintenance()
    _SyncAllMapChecks()
    _EnforceVisibleMapSelectionRules()
    _RefreshHeroTeamSelectionState()
    _UpdateVisibleSelectionToggleButton()
    _UpdateConnectedCharacterDisplay()
    _CheckForGuiSourceChanges()

    If Not $g_bClientConnected And TimerDiff($g_hClientScanTimer) >= 2000 Then
        _RefreshDetectedClient()
        $g_hClientScanTimer = TimerInit()
    EndIf

    If $g_bPendingPostConnectRefresh And TimerDiff($g_hPostConnectRefreshTimer) >= 250 Then _RunDeferredPostConnectRefresh()
    If $g_bPendingMapStateLoad Then _RefreshConnectedMapState()

    If TimerDiff($g_hCharacterRefreshTimer) >= 1000 Then
        _UpdateLiveRunStats()
        $g_hCharacterRefreshTimer = TimerInit()
    EndIf
EndFunc

Func _CheckForGuiSourceChanges()
    If TimerDiff($g_hGuiReloadTimer) < 1000 Then Return
    $g_hGuiReloadTimer = TimerInit()

    Local $sCurrentStamp = _GetFileModifiedStamp($g_sGuiSourcePath)
    If $sCurrentStamp = "" Then Return

    If $g_sGuiSourceStamp = "" Then
        $g_sGuiSourceStamp = $sCurrentStamp
        Return
    EndIf

    If $sCurrentStamp = $g_sGuiSourceStamp Then
        If $g_bGuiReloadPending And Not $g_bBotRunning And Not $g_bMapScanInProgress Then
            _RequestScriptReload("Applying updated GUI layout.")
        EndIf
        Return
    EndIf

    $g_sGuiSourceStamp = $sCurrentStamp
    If $g_bBotRunning Or $g_bMapScanInProgress Then
        $g_bGuiReloadPending = True
        If Not $g_bGuiReloadNotified Then
            _Log("GUI source changed. Reload will run once the bot is idle.")
            $g_bGuiReloadNotified = True
        EndIf
        Return
    EndIf

    _RequestScriptReload("Applying updated GUI layout.")
EndFunc

Func _RequestScriptReload($sReason = "Reloading script.")
    If $g_bScriptReloadRequested Then Return

    If @Compiled Then
        $g_sScriptReloadCommand = '"' & @ScriptFullPath & '"'
    Else
        $g_sScriptReloadCommand = '"' & @AutoItExe & '" "' & @ScriptFullPath & '"'
    EndIf

    If $g_sScriptReloadCommand = "" Then
        _Log("GUI reload failed: restart command could not be built.")
        Return
    EndIf

    $g_bGuiReloadPending = False
    $g_bGuiReloadNotified = False
    $g_bScriptReloadRequested = True
    _Log($sReason)
EndFunc

Func _GetFileModifiedStamp($sPath)
    Local $aTime = FileGetTime($sPath, 0, 1)
    If @error Or Not IsArray($aTime) Then Return ""

    Return $aTime[0] & $aTime[1] & $aTime[2] & $aTime[3] & $aTime[4] & $aTime[5]
EndFunc

Func _StartSelectedMapRoutine()
    If $g_bBotRunning Then Return False
    If Not _PrepareSelectedVanquishQueue() Then
        _UpdateRunControlStatusDisplay("start blocked")
        Return False
    EndIf

    $g_bBotRunning = True
    $boolrun = True
    $g_b_Vanquisher_AbortRoute = False
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_QueueAdvanced = False
    _ResetRunStats()
    $g_hRunTimer = TimerInit()
    _UpdateRunStatusDisplay()
    _UpdateRunControlStatusDisplay("running selected maps")
    _UpdateStartButtonState()
    _Log("Starting selected map routine.")

    Local $bCompleted = _RunSelectedMapQueue()

    $g_bBotRunning = False
    $g_bPendingMapStateLoad = True
    _UpdateRunStatusDisplay()
    _UpdateStartButtonState()

    If $bCompleted Then
        _UpdateRunControlStatusDisplay("queue complete")
        _Log("Selected map routine completed.")
    ElseIf $g_b_Vanquisher_AbortRoute Or Not $boolrun Then
        _UpdateRunControlStatusDisplay("stopped")
        _Log("Selected map routine stopped.")
    Else
        _UpdateRunControlStatusDisplay("stopped with error")
        _Log("Selected map routine ended before completion.")
    EndIf

    Return $bCompleted
EndFunc

Func _StopSelectedMapRoutine($bUserRequested = True)
    If Not $g_bBotRunning Then
        _UpdateRunControlStatusDisplay()
        Return False
    EndIf

    $boolrun = False
    $g_b_Vanquisher_AbortRoute = True
    _UpdateRunControlStatusDisplay("stopping...")
    _UpdateStartButtonState()
    If $bUserRequested Then _Log("Stop requested for the selected map routine.")
    Return True
EndFunc

Func _RunSelectedMapQueue()
    If UBound($g_a_VanquisherZoneQueue) = 0 Then Return False

    Local $bCompleted = False

    While $boolrun And Not $g_b_Vanquisher_AbortRoute
        If $g_i_VanquisherZoneQueueIndex < 0 Or $g_i_VanquisherZoneQueueIndex >= UBound($g_a_VanquisherZoneQueue) Then ExitLoop

        Local $iQueueIndex = $g_i_VanquisherZoneQueueIndex
        Local $iMapIndex = $g_a_VanquisherZoneQueue[$iQueueIndex]
        Local $sRouteFunc = _GetRouteFunctionNameForMapIndex($iMapIndex)
        If $sRouteFunc = "" Then
            _Log("Start failed: no route function is available for " & _Vanquisher_ZoneDisplay($iMapIndex) & " (expected " & $sRouteFunc & ").")
            Return False
        EndIf
        If Not _PrepareQueuedMapStart($iMapIndex) Then Return False

        $g_b_Vanquisher_QueueAdvanced = False
        _UpdateRunControlStatusDisplay("running " & _Vanquisher_ZoneDisplay($iMapIndex))
        CurrentAction("Running selected map " & ($iQueueIndex + 1) & "/" & UBound($g_a_VanquisherZoneQueue) & ": " & _Vanquisher_ZoneDisplay($iMapIndex))

        While $boolrun And Not $g_b_Vanquisher_AbortRoute And $g_i_VanquisherZoneQueueIndex = $iQueueIndex
            Call($sRouteFunc)
            Local $iCallError = @error
            Local $iCallExtended = @extended
            If $iCallError = 0xDEAD And $iCallExtended = 0xBEEF Then
                _Log("Start failed: route function call failed for " & _Vanquisher_ZoneDisplay($iMapIndex) & " (" & $sRouteFunc & ").")
                Return False
            EndIf
            If $g_b_Vanquisher_QueueAdvanced Or $g_b_Vanquisher_RunFinished Then ExitLoop
            _Vanquisher_PumpGUI()
            Sleep(50)
        WEnd

        If Not $boolrun Or $g_b_Vanquisher_AbortRoute Then ExitLoop

        If $g_b_Vanquisher_QueueAdvanced Or $g_b_Vanquisher_RunFinished Then
            $g_iVanquishStreak += 1
            _UpdateRunStatusDisplay()
        EndIf

        If $g_b_Vanquisher_RunFinished And $g_i_VanquisherZoneQueueIndex = $iQueueIndex Then
            $bCompleted = True
            ExitLoop
        EndIf
    WEnd

    Return $bCompleted
EndFunc

Func _GetRouteFunctionNameForMapIndex($iMapIndex)
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return ""
    Local $sRouteFunc = $g_aMapEntries[$iMapIndex][9]
    If $sRouteFunc <> "" Then Return $sRouteFunc
    Return _ResolveRouteFunctionFromScriptName(_Vanquisher_ZoneTitle($iMapIndex))
EndFunc

Func _Vanquisher_PumpGUI()
    Local $msg = GUIGetMsg()
    If $msg <> 0 Then _HandleGuiMessage($msg, True)
    _RunGuiMaintenance()
EndFunc

Func _Vanquisher_UpdateStatusBar()
    If Not $g_bBotRunning Then
        _UpdateRunControlStatusDisplay()
        Return
    EndIf

    If $g_i_VanquisherZoneQueueIndex < 0 Or $g_i_VanquisherZoneQueueIndex >= UBound($g_a_VanquisherZoneQueue) Then
        _UpdateRunControlStatusDisplay("running")
        Return
    EndIf

    Local $iMapIndex = $g_a_VanquisherZoneQueue[$g_i_VanquisherZoneQueueIndex]
    _UpdateRunControlStatusDisplay("running " & _Vanquisher_ZoneDisplay($iMapIndex))
EndFunc

Func _Vanquisher_OnBotStopped()
    $g_bBotRunning = False
    _UpdateRunControlStatusDisplay("stopped")
    _UpdateStartButtonState()
EndFunc

Func UpdateVanquish()
    If Not $g_bBotRunning Then Return False
    _UpdateRunControlStatusDisplay()
    Return True
EndFunc
