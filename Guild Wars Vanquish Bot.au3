#RequireAdmin

#include "../../API/_GwAu3.au3"
#include ".\Core\Vanquisher_Globals.au3"
#include ".\Core\Vanquisher_Compat.au3"
#include ".\Core\Caravan_Controller.au3"
#include ".\Core\GwAu3_AddOns.au3"
#include ".\Maps\LocationsIDS.au3"
#include ".\Core\Vanquish_Routes.au3"
#include ".\GUi\GW_Vanquish_Bot_GUI.au3"

; Top-level launcher and controller for the GW Vanquish Bot GUI.
; Run this file from the bot root folder.

Global $g_hCharacterRefreshTimer = TimerInit()
Global $g_hClientScanTimer = TimerInit()
Global $g_hConnectedStatePollTimer = TimerInit()
Global $g_bClientConnected = False
Global $g_sConnectedCharacter = ""
Global $g_sDetectedCharacter = ""
Global $g_iDetectedClientPid = 0
Global $g_iDetectedCharacterCount = 0
Global $g_sActiveMapGroup = "EOTN"
Global $boolrun = True
Global $g_aMapEntries[0][11] ; campaign, region, map name, checked, map id, vanquished, outpost id, max party size, script name, route function, pre-travel label
Global $g_aLocationCommentLabels[0][2]
Global $g_s_MainCharName = ""
Global $ProcessID = ""
Global $Bot_Core_Initialized = False
Global $g_hRunTimer = 0
Global $g_iRunDeaths = 0
Global $g_iVanquishStreak = 0
Global $g_bWasPlayerDead = False
Global $g_bConnectionStatePrimed = False
Global $g_bVanquishHistoryLoaded = False
Global $g_bMapScanInProgress = False
Global $g_bPendingClientPrime = False
Global $g_bPendingVanquishScan = False
Global $g_bPendingMapStateLoad = False
Global $g_bPendingPostConnectRefresh = False
Global $g_hPostConnectRefreshTimer = TimerInit()
Global $g_hClientResponsiveTimer = TimerInit()
Global $g_bClientRecoveryPending = False
Global $g_bClientRecoveryAutoScanPending = False
Global $g_sRecoveryCharacter = ""
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
Global Const $GC_S_SPECIAL_ROUTE_TEMPLE_ASCALON_CARAVAN = "SpecialRoute_TempleOfTheAgesAscalonCaravan"
Global Const $GC_S_SPECIAL_ROUTE_TEMPLE_MAGUUMA_CARAVAN = "SpecialRoute_TempleOfTheAgesMaguumaCaravan"
Global Const $GC_S_ROUTE_PROFILE_TEMPLE_ASCALON_CARAVAN = "temple_ascalon_caravan"
Global Const $GC_S_ROUTE_PROFILE_TEMPLE_MAGUUMA_CARAVAN = "temple_maguuma_caravan"
Global Const $CLIENT_SCAN_INTERVAL_NONE_MS = 3000
Global Const $CLIENT_SCAN_INTERVAL_SINGLE_MS = 10000
Global Const $CLIENT_SCAN_INTERVAL_MULTIPLE_MS = 5000
Global Const $CONNECTED_STATE_POLL_INTERVAL_MS = 750
Global Const $CLIENT_UNRESPONSIVE_TIMEOUT_MS = 30000
Global Const $GUI_LOOP_SLEEP_MS = 25

If FileExists(@ScriptDir & "\Vanquish.png") Then
    $g_sHelmetImagePath = @ScriptDir & "\Vanquish.png"
ElseIf FileExists(@ScriptDir & "\GUi\Vanquish.png") Then
    $g_sHelmetImagePath = @ScriptDir & "\GUi\Vanquish.png"
EndIf

If IsDeclared("g_b_AutoUpdate") Then $g_b_AutoUpdate = False
If IsDeclared("g_bCore_AutoUpdate") Then $g_bCore_AutoUpdate = False

_VB_CreateGUI()
_LogStartupBanner()

_LoadLocationCommentLabels()
_LoadMapEntries()
_InitializeMapListItems()
_ResizeMapListColumns()
_ShowMapCampaign("EOTN")
_ShowMainMenuTab()
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
    Sleep($GUI_LOOP_SLEEP_MS)
WEnd

_VB_DestroyGUI()
If $g_bScriptReloadRequested And $g_sScriptReloadCommand <> "" Then Run($g_sScriptReloadCommand, @ScriptDir)

Func _ConnectToDetectedClient()
    Local $bInitOK = False
    Local $iAttachPid = $g_iDetectedClientPid
    Local $sCharacter = $g_sDetectedCharacter

    If $iAttachPid <= 0 Or $sCharacter = "" Then
        _ResetConnectedClientState("no client connection", "idle")
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
        _ResetConnectedClientState("connect failed", "idle")
        _Log("Connect failed for Guild Wars character: " & $sCharacter & ".")
        Return False
    EndIf

    $g_bClientConnected = True
    Local $sLiveName = _GetAttachedCharacterName()
    If $sLiveName <> "" Then $sCharacter = $sLiveName
    If $sCharacter = "" Then $sCharacter = "Guild Wars PID " & $iAttachPid
    $g_s_MainCharName = $sCharacter
    $Bot_Core_Initialized = True
    $g_bConnectionStatePrimed = False
    $g_bVanquishHistoryLoaded = False
    $g_bPendingClientPrime = True
    $g_bPendingVanquishScan = False
    $g_bPendingMapStateLoad = False
    $g_bPendingPostConnectRefresh = False
    $g_hConnectedStatePollTimer = TimerInit()
    $g_sConnectedCharacter = $sCharacter
    _SetCharacterSelectionState(True)
    _ResetRunStats()
    $g_hRunTimer = TimerInit()

    ; Connection stays idle until the user explicitly scans maps.
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
    Local $i = 0

    Local $aProcessList = ProcessList("gw.exe")
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

Func _GetClientDetectionInterval()
    If $g_iDetectedCharacterCount > 1 Then Return $CLIENT_SCAN_INTERVAL_MULTIPLE_MS
    If $g_iDetectedClientPid > 0 And $g_sDetectedCharacter <> "" Then Return $CLIENT_SCAN_INTERVAL_SINGLE_MS
    Return $CLIENT_SCAN_INTERVAL_NONE_MS
EndFunc

Func _ScheduleConnectedStatePoll($bScanHistory = False)
    $g_bPendingClientPrime = True
    If $bScanHistory Then $g_bPendingVanquishScan = True
    $g_hConnectedStatePollTimer = TimerInit()
EndFunc

Func _FinalizeVanquishHistoryScan()
    Local $sCharacter = _GetAttachedCharacterName()
    If $sCharacter = "" Then $sCharacter = $g_sConnectedCharacter
    If $sCharacter = "" Then $sCharacter = "current character"

    _Log("Scanning vanquish history for " & $sCharacter & ".")
    _UpdateMapScanStatusDisplay("scanning...")
    $g_bVanquishHistoryLoaded = _RefreshHistoricalVanquishStates()
    $g_bPendingVanquishScan = False
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
    If $g_bClientRecoveryPending Then
        If $g_bVanquishHistoryLoaded Then
            _Log("Client recovery complete. The run remains stopped until Start is pressed again.")
        Else
            _Log("Client reconnected, but the rescan did not complete. Scan Maps can be run again once the client is ready.")
        EndIf
        _ClearClientRecoveryState()
    EndIf
    Return $g_bVanquishHistoryLoaded
EndFunc

Func _ProcessConnectedStatePoll()
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
        $g_bPendingClientPrime = False
        $g_bPendingVanquishScan = False
        $g_bMapScanInProgress = False
        _UpdateStartButtonState()
        Return False
    EndIf

    If Not _PrimeConnectedClientState(False) Then
        If $g_bPendingVanquishScan Then _UpdateMapScanStatusDisplay("waiting for in-game state")
        Return False
    EndIf

    $g_bPendingClientPrime = False
    _RefreshHeroTeamSelectionState()
    _UpdateStartButtonState()

    If Not $g_bPendingVanquishScan Then
        _UpdateMapScanStatusDisplay()
        Return True
    EndIf

    Return _FinalizeVanquishHistoryScan()
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
        _UpdateRunControlStatusDisplay("waiting for client")
        _Log("Scan queued. Waiting for the character to finish loading before reading vanquish history.")
        _ScheduleConnectedStatePoll(True)
        Return True
    EndIf

    If Not _CanQueryLiveClientState() Then
        _UpdateMapScanStatusDisplay("client is still loading")
        _UpdateRunControlStatusDisplay("waiting for client")
        _Log("Scan queued. Guild Wars is still loading the current character.")
        _ScheduleConnectedStatePoll(True)
        Return True
    EndIf

    Return _FinalizeVanquishHistoryScan()
EndFunc

Func _RefreshConnectedMapState($bLogWaiting = False)
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then Return False

    If Not _PrimeConnectedClientState($bLogWaiting) Then
        $g_bPendingMapStateLoad = True
        Return False
    EndIf

    $g_bPendingMapStateLoad = False
    _Vanquisher_CacheCombatAIForCurrentMap()
    $g_bVanquishHistoryLoaded = _RefreshHistoricalVanquishStates()
    _RefreshMapPreTravelLabels()
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
    If Core_Initialize($vTarget, False) = 0 Or Not $g_h_GWProcess Or $g_p_BasePointer = 0 Then Return False
    _Vanquisher_SyncLegacyHandles()
    Return True
EndFunc

Func _ResetRunStats()
    $g_hRunTimer = 0
    $g_iRunDeaths = 0
    $g_iVanquishStreak = 0
    $g_bWasPlayerDead = False
    _UpdateStartButtonState()
    _UpdateRunStatusDisplay()
EndFunc

Func _ResetConnectedClientState($sMapStatus = "waiting for client", $sRunStatus = "idle")
    If $g_h_GWProcess Then Memory_Close()
    $g_h_GWProcess = 0
    $g_i_GWProcessId = 0
    $g_p_BasePointer = 0

    $g_bClientConnected = False
    $g_sConnectedCharacter = ""
    $g_s_MainCharName = ""
    $ProcessID = ""
    $Bot_Core_Initialized = False
    $g_bConnectionStatePrimed = False
    $g_bVanquishHistoryLoaded = False
    $g_bMapScanInProgress = False
    $g_bPendingClientPrime = False
    $g_bPendingVanquishScan = False
    $g_bPendingMapStateLoad = False
    $g_bPendingPostConnectRefresh = False

    _SetCharacterSelectionState(False)
    _ResetRunStats()
    _ClearHistoricalVanquishStates(False)
    _UpdateConnectedCharacterDisplay()
    _UpdateMapScanStatusDisplay($sMapStatus)
    _UpdateRunControlStatusDisplay($sRunStatus)
EndFunc

Func _ClearClientRecoveryState()
    $g_bClientRecoveryPending = False
    $g_bClientRecoveryAutoScanPending = False
    $g_sRecoveryCharacter = ""
EndFunc

Func _IsConnectedClientProcessAlive()
    If Not $g_bClientConnected Then Return False
    Local $iPid = $g_i_GWProcessId
    Return $iPid > 0 And ProcessExists($iPid)
EndFunc

Func _EnsureConnectedClientAlive($bLogLoss = False)
    If Not $g_bClientConnected Then Return False
    If _IsConnectedClientProcessAlive() Then Return True

    _ResetConnectedClientState("client disconnected", "idle")
    If $bLogLoss Then _Log("Lost connection to the attached Guild Wars client.")
    Return False
EndFunc

Func _HandleClientRecoveryLoss($sReason)
    If $g_bClientRecoveryPending Then Return False

    $g_bClientRecoveryPending = True
    $g_bClientRecoveryAutoScanPending = False
    $g_sRecoveryCharacter = $g_sConnectedCharacter
    If $g_sRecoveryCharacter = "" Then $g_sRecoveryCharacter = _GetAttachedCharacterName()

    If $g_bBotRunning Then
        $boolrun = False
        $g_b_Vanquisher_AbortRoute = True
    EndIf

    _ResetConnectedClientState("waiting for client reconnect", "waiting for client")
    _UpdateRunControlStatusDisplay("waiting for client reconnect")
    _Log($sReason)
    Return True
EndFunc

Func _CanQueryLiveClientState()
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then Return False
    If Not _EnsureConnectedClientAlive() Then Return False
    If Not _Vanquisher_IsAttached() Then Return False
    If Core_GetStatusError() Then Return False
    If Not Core_IsIngame() Then Return False
    Return Not Map_GetInstanceInfo("IsLoading")
EndFunc

Func _PrimeConnectedClientState($bLogWaiting = False)
    If $g_bConnectionStatePrimed Then Return True
    If Not _CanQueryLiveClientState() Then
        If $bLogWaiting Then _Log("Connected to client. Waiting for in-game character data before reading map and world state.")
        Return False
    EndIf

    Local $sLiveCharacter = Player_GetCharName()
    If $sLiveCharacter <> "" Then $g_sConnectedCharacter = $sLiveCharacter

    $g_bWasPlayerDead = GetIsDead(-2)
    _RefreshMapPartySizeRequirements()
    $g_bConnectionStatePrimed = True
    $g_hClientResponsiveTimer = TimerInit()
    _UpdateStartButtonState()

    _Log("Connected to Guild Wars client: " & $g_sConnectedCharacter)
    Return True
EndFunc

Func _GetAttachedCharacterName()
    If Not _Vanquisher_IsAttached() Then Return ""
    Return StringStripWS(Player_GetCharName(), 3)
EndFunc

Func _UpdateLiveRunStats()
    If $g_bClientConnected And _PrimeConnectedClientState() And _CanQueryLiveClientState() Then
        Local $bIsDead = GetIsDead(-2)
        If $bIsDead And Not $g_bWasPlayerDead Then $g_iRunDeaths += 1
        $g_bWasPlayerDead = $bIsDead
    EndIf
    _UpdateRunStatusDisplay()
EndFunc

Func _BuildHeroList()
    Local $sHeroList = ""
    Local $i = 0

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
    Local $i = 0
    For $i = 0 To 2
        IniWrite($g_sConfigPath, "Team4", "Hero" & ($i + 1), StringStripWS(GUICtrlRead($g_idComboTeam4[$i]), 3))
    Next

    For $i = 0 To 4
        IniWrite($g_sConfigPath, "Team6", "Hero" & ($i + 1), StringStripWS(GUICtrlRead($g_idComboTeam6[$i]), 3))
    Next

    For $i = 0 To 6
        IniWrite($g_sConfigPath, "Team8", "Hero" & ($i + 1), StringStripWS(GUICtrlRead($g_idComboTeam8[$i]), 3))
    Next

    Return True
EndFunc

Func _LoadHeroConfig()
    Local $i = 0
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

    Return True
EndFunc

Func _EstimateHeroDropdownWidth()
    Local $iMaxChars = 0
    Local $i = 0

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
    Local $i = 0

    For $i = 1 To $GC_AM2_HERO_DATA[0][0]
        If StringCompare($GC_AM2_HERO_DATA[$i][1], $sHeroName, 0) = 0 Then Return $GC_AM2_HERO_DATA[$i][0]
    Next

    Return 0
EndFunc

Func _GetConfiguredHeroArrayForPartySize($iMaxPartySize)
    Local $aComboIDs
    Local $iHeroSlots = 0
    Local $i = 0

    Switch $iMaxPartySize
        Case 4
            $iHeroSlots = 3
            $aComboIDs = $g_idComboTeam4
        Case 6
            $iHeroSlots = 5
            $aComboIDs = $g_idComboTeam6
        Case 8
            $iHeroSlots = 7
            $aComboIDs = $g_idComboTeam8
        Case Else
            Local $aEmpty[0]
            Return $aEmpty
    EndSwitch

    Local $aHeroIDs[0]
    For $i = 0 To $iHeroSlots - 1
        Local $sHeroName = StringStripWS(GUICtrlRead($aComboIDs[$i]), 3)
        If $sHeroName = "" Then ContinueLoop

        Local $iHeroID = _GetHeroIDForSelection($sHeroName)
        If $iHeroID <= 0 Then ContinueLoop

        Local $iNext = UBound($aHeroIDs)
        ReDim $aHeroIDs[$iNext + 1]
        $aHeroIDs[$iNext] = $iHeroID
    Next

    Return $aHeroIDs
EndFunc

Func _IsConfiguredHeroTeamActive(ByRef $aHeroIDs)
    If Party_GetMyPartyInfo("ArrayPlayerPartyMemberSize") <> 1 Then Return False
    If Party_GetMyPartyInfo("ArrayHenchmanPartyMemberSize") <> 0 Then Return False
    If GetHeroCount() <> UBound($aHeroIDs) Then Return False

    Local $i = 0
    For $i = 0 To UBound($aHeroIDs) - 1
        If GetHeroID($i + 1) <> $aHeroIDs[$i] Then Return False
    Next

    Return True
EndFunc

Func SetupTeamForPartySize($iMaxPartySize)
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then
        _Log("Cannot set up heroes before connecting to a character.")
        Return False
    EndIf

    Local $aHeroIDs = _GetConfiguredHeroArrayForPartySize($iMaxPartySize)
    If $iMaxPartySize <> 4 And $iMaxPartySize <> 6 And $iMaxPartySize <> 8 Then
        _Log("Unsupported party size for hero setup: " & $iMaxPartySize)
        Return False
    EndIf

    If _IsConfiguredHeroTeamActive($aHeroIDs) Then Return True

    Ui_LeaveGroup()
    Sleep(250)

    Local $i = 0
    For $i = 0 To UBound($aHeroIDs) - 1
        Ui_AddHero($aHeroIDs[$i])
        Sleep(250)
    Next

    Return True
EndFunc

Func _IsSpecialRouteScriptName($sScriptName)
    Return StringLeft($sScriptName, 13) = "SpecialRoute_"
EndFunc

Func _FindMapIndexByScriptName($sMapName)
    Local $i = 0
    For $i = 0 To UBound($g_aMapEntries) - 1
        If $g_aMapEntries[$i][8] = $sMapName Then Return $i
    Next
    Return -1
EndFunc

Func _AppendQueueMapIndex(ByRef $aQueue, ByRef $aRouteProfiles, $iMapIndex, $sRouteProfile = "")
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return False
    If $g_aMapEntries[$iMapIndex][5] Then Return False

    Local $i = 0
    For $i = 0 To UBound($aQueue) - 1
        If $aQueue[$i] = $iMapIndex Then Return False
    Next

    Local $iNext = UBound($aQueue)
    ReDim $aQueue[$iNext + 1]
    ReDim $aRouteProfiles[$iNext + 1]
    $aQueue[$iNext] = $iMapIndex
    $aRouteProfiles[$iNext] = $sRouteProfile
    Return True
EndFunc

Func _AppendTempleAscalonCaravanQueue(ByRef $aQueue, ByRef $aRouteProfiles)
    ; Temple of the Ages -> Kryta -> Northern Shiverpeaks -> Ascalon caravan.
    Local $aRouteMaps[19] = [ _
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
    Local $i = 0

    For $i = 0 To UBound($aRouteMaps) - 1
        Local $iMapIndex = _FindMapIndexByScriptName($aRouteMaps[$i])
        If $iMapIndex = -1 Then
            _Log("Special route is missing map entry: " & $aRouteMaps[$i] & ".")
            ContinueLoop
        EndIf
        _AppendQueueMapIndex($aQueue, $aRouteProfiles, $iMapIndex, $GC_S_ROUTE_PROFILE_TEMPLE_ASCALON_CARAVAN)
    Next

    Return UBound($aQueue) > 0
EndFunc

Func _BuildCheckedMapQueue(ByRef $aRouteProfiles)
    Local $aChecked[0]
    Local $i = 0

    ReDim $aRouteProfiles[0]

    For $i = 0 To UBound($g_aMapEntries) - 1
        If Not $g_aMapEntries[$i][3] Then ContinueLoop
        If $g_aMapEntries[$i][5] Then ContinueLoop

        If _IsSpecialRouteScriptName($g_aMapEntries[$i][8]) Then
            Switch $g_aMapEntries[$i][8]
                Case $GC_S_SPECIAL_ROUTE_TEMPLE_ASCALON_CARAVAN
                    _AppendTempleAscalonCaravanQueue($aChecked, $aRouteProfiles)
                Case $GC_S_SPECIAL_ROUTE_TEMPLE_MAGUUMA_CARAVAN
                    _AppendQueueMapIndex($aChecked, $aRouteProfiles, $i)
            EndSwitch
            ContinueLoop
        EndIf

        _AppendQueueMapIndex($aChecked, $aRouteProfiles, $i)
    Next

    Return $aChecked
EndFunc

Func _GetRouteProfileForQueuePosition($iQueueIndex)
    If $iQueueIndex < 0 Or $iQueueIndex >= UBound($g_a_VanquisherZoneRouteProfile) Then Return ""
    Return $g_a_VanquisherZoneRouteProfile[$iQueueIndex]
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
    Local $sRouteProfile = _GetRouteProfileForQueuePosition($g_i_VanquisherZoneQueueIndex)
    Local $iRequiredPartySize = $g_aMapEntries[$iMapIndex][7]
    Local $iOutpostID = $g_aMapEntries[$iMapIndex][6]
    Local $iTargetMapID = $g_aMapEntries[$iMapIndex][4]

    If Map_GetInstanceInfo("IsExplorable") And Not _IsQueuedTargetReady($Title, $iTargetMapID) Then
        If _Vanquisher_IsTempleCaravanRouteProfile($sRouteProfile) Or _Vanquisher_IsCaravanMapIndex($iMapIndex) Then _TempleAscalonCaravanTryCatchUp($iTargetMapID)

        If Map_GetInstanceInfo("IsExplorable") And Not _IsQueuedTargetReady($Title, $iTargetMapID) Then
            CurrentAction("Returning to outpost to route to " & $sMapName & ".")
            If Not _Vanquisher_ReturnToOutpost() Then
                _Log("Start failed: could not return to outpost before routing to " & $sMapName & ".")
                Return False
            EndIf
        EndIf
    EndIf

    If Map_GetInstanceInfo("IsExplorable") Then Return True

    If Not _EnsureQueuedMapOutpostReady($iOutpostID, $iTargetMapID, $sMapName) Then
        _Log("Start failed: could not travel to the required outpost for " & $sMapName & ".")
        Return False
    EndIf
    _Vanquisher_ApplyDifficulty()

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

Func _EnsureQueuedMapOutpostReady($iOutpostID, $iTargetMapID, $sMapName)
    If Map_GetInstanceInfo("IsExplorable") Then Return False
    If $iOutpostID <= 0 Then Return True

    Local $iCurrentMapID = GetMapID()
    If $iCurrentMapID = $iOutpostID Or $iCurrentMapID = $iTargetMapID Then Return True

    Local $iTry = 0
    For $iTry = 1 To 3
        CurrentAction("Traveling to outpost for " & $sMapName & " (" & $iTry & "/3).")
        If TravelTo($iOutpostID) And WaitMapLoading($iOutpostID, 30000) Then
            If Not Map_GetInstanceInfo("IsExplorable") And GetMapID() = $iOutpostID Then Return True
        EndIf
        Sleep(500)
    Next

    Return Not Map_GetInstanceInfo("IsExplorable") And GetMapID() = $iOutpostID
EndFunc

Func _Vanquisher_ZoneDisplay($iMapIndex)
    If $iMapIndex < 0 Or $iMapIndex >= UBound($g_aMapEntries) Then Return ""
    Return $g_aMapEntries[$iMapIndex][2]
EndFunc

Func _InitMapQueueFromSelection()
    Global $g_a_VanquisherZoneQueue, $g_a_VanquisherZoneRouteProfile, $g_i_VanquisherZoneQueueIndex

    $g_a_VanquisherZoneQueue = _BuildCheckedMapQueue($g_a_VanquisherZoneRouteProfile)
    If UBound($g_a_VanquisherZoneQueue) = 0 Then
        ReDim $g_a_VanquisherZoneRouteProfile[0]
        $g_i_VanquisherZoneQueueIndex = -1
        Return False
    EndIf

    $g_i_VanquisherZoneQueueIndex = 0
    Return True
EndFunc

Func _GetConfiguredHeroCountForPartySize($iMaxPartySize)
    Local $aComboIDs
    Local $iHeroCount = 0
    Local $i = 0

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
    Local $i = 0
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
        _Log("Start failed: no maps are checked in the campaign tabs.")
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
    ReDim $g_aMapEntries[0][11]

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
            If $iMapID <= 0 Then ContinueLoop

            Local $iOutpostID = _ResolveOutpostIDFromScriptName($sMapName)
            Local $iNext = UBound($g_aMapEntries)
            ReDim $g_aMapEntries[$iNext + 1][11]
            $g_aMapEntries[$iNext][0] = $sCampaign
            $g_aMapEntries[$iNext][1] = $sRegion
            $g_aMapEntries[$iNext][2] = _HumanizeMapName(_NormalizeMapScriptNameForLookup($sMapName))
            $g_aMapEntries[$iNext][3] = False
            $g_aMapEntries[$iNext][4] = $iMapID
            $g_aMapEntries[$iNext][5] = False
            $g_aMapEntries[$iNext][6] = $iOutpostID
            $g_aMapEntries[$iNext][7] = _ResolveMaxPartySizeForMap($iMapID, $iOutpostID)
            $g_aMapEntries[$iNext][8] = $sMapName
            $g_aMapEntries[$iNext][9] = _ResolveRouteFunctionFromScriptName($sMapName)
            $g_aMapEntries[$iNext][10] = _ResolvePreTravelLabelFromScriptName($sCampaign, $sMapName, $iOutpostID)
        WEnd

        FileClose($hFileSearch)
    WEnd

    FileClose($hSearch)
    _AppendSpecialRouteEntries()
EndFunc

Func _AppendSpecialRouteEntries()
    Local $iNext = UBound($g_aMapEntries)
    ReDim $g_aMapEntries[$iNext + 2][11]
    $g_aMapEntries[$iNext][0] = "Caravan Routes"
    $g_aMapEntries[$iNext][1] = "Special Routes"
    $g_aMapEntries[$iNext][2] = "TOA Ascalon Caravan"
    $g_aMapEntries[$iNext][3] = False
    $g_aMapEntries[$iNext][4] = 0
    $g_aMapEntries[$iNext][5] = False
    $g_aMapEntries[$iNext][6] = $TheBlackCurtain_Outpost
    $g_aMapEntries[$iNext][7] = 8
    $g_aMapEntries[$iNext][8] = $GC_S_SPECIAL_ROUTE_TEMPLE_ASCALON_CARAVAN
    $g_aMapEntries[$iNext][9] = ""
    $g_aMapEntries[$iNext][10] = ""

    $g_aMapEntries[$iNext + 1][0] = "Caravan Routes"
    $g_aMapEntries[$iNext + 1][1] = "Special Routes"
    $g_aMapEntries[$iNext + 1][2] = "TOA Maguuma Caravan"
    $g_aMapEntries[$iNext + 1][3] = False
    $g_aMapEntries[$iNext + 1][4] = 0
    $g_aMapEntries[$iNext + 1][5] = False
    $g_aMapEntries[$iNext + 1][6] = $TalmarkWilderness_Outpost
    $g_aMapEntries[$iNext + 1][7] = 8
    $g_aMapEntries[$iNext + 1][8] = $GC_S_SPECIAL_ROUTE_TEMPLE_MAGUUMA_CARAVAN
    $g_aMapEntries[$iNext + 1][9] = "VQSpecialRoute_TempleOfTheAgesMaguumaCaravan"
    $g_aMapEntries[$iNext + 1][10] = ""
EndFunc

Func _ResolveRouteFunctionFromScriptName($sMapName)
    Switch _NormalizeMapScriptNameForLookup($sMapName)
        Case "IceDome"
            Return "VQIcedome"
    EndSwitch
    Return "VQ" & $sMapName
EndFunc

Func _ResolveMapIDFromScriptName($sMapName)
    $sMapName = _NormalizeMapScriptNameForLookup($sMapName)
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
    $sMapName = _NormalizeMapScriptNameForLookup($sMapName)
    Local $sVarName = $sMapName & "_Outpost"
    If IsDeclared($sVarName) Then Return Eval($sVarName)

    Switch $sMapName
        Case "IceDome"
            $sVarName = "Icedome_Outpost"
    EndSwitch

    If IsDeclared($sVarName) Then Return Eval($sVarName)
    Return 0
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
    If $iPartySize <= 4 Then Return 4
    If $iPartySize <= 6 Then Return 6
    Return 8
EndFunc

Func _RefreshMapPartySizeRequirements()
    If Not $g_bClientConnected Or Not $Bot_Core_Initialized Then Return False
    Local $i = 0
    For $i = 0 To UBound($g_aMapEntries) - 1
        $g_aMapEntries[$i][7] = _ResolveMaxPartySizeForMap($g_aMapEntries[$i][4], $g_aMapEntries[$i][6])
    Next
    Return True
EndFunc

Func _RefreshMapPreTravelLabels()
    Local $bUpdated = False
    Local $i = 0

    For $i = 0 To UBound($g_aMapEntries) - 1
        Local $sLabel = _ResolvePreTravelLabelFromScriptName($g_aMapEntries[$i][0], $g_aMapEntries[$i][8], $g_aMapEntries[$i][6])
        If $g_aMapEntries[$i][10] = $sLabel Then ContinueLoop
        $g_aMapEntries[$i][10] = $sLabel
        $bUpdated = True
    Next

    If Not $bUpdated Then Return False

    _PopulateMapList("ALL")
    _ResizeMapListColumns()
    Return True
EndFunc

Func _RefreshHistoricalVanquishStates()
    Local $pArray = World_GetWorldInfo("VanquishedAreasArray")
    Local $iArraySize = World_GetWorldInfo("VanquishedAreasArraySize")
    Local $i = 0

    If $pArray = 0 Or $iArraySize <= 0 Then
        _ClearHistoricalVanquishStates(False)
        _Log("Vanquish history array is unavailable for the connected client.")
        Return False
    EndIf

    Local $dVanquishWords = DllStructCreate("dword[" & $iArraySize & "]")
    Local $aReadResult = DllCall($g_h_Kernel32, "bool", "ReadProcessMemory", _
        "handle", $g_h_GWProcess, _
        "ptr", $pArray, _
        "struct*", $dVanquishWords, _
        "ulong_ptr", 4 * $iArraySize, _
        "ulong_ptr*", 0)
    If @error Or Not IsArray($aReadResult) Or Not $aReadResult[0] Then
        _ClearHistoricalVanquishStates(False)
        _Log("Vanquish history array could not be read for the connected client.")
        Return False
    EndIf

    Local $iMarked = 0

    For $i = 0 To UBound($g_aMapEntries) - 1
        Local $iMapID = $g_aMapEntries[$i][4]
        If $iMapID <= 0 Then
            $g_aMapEntries[$i][5] = False
            ContinueLoop
        EndIf

        Local $iWordIndex = Floor($iMapID / 32)
        Local $bVanquished = False
        If $iWordIndex < $iArraySize Then
            Local $iBitOffset = Mod($iMapID, 32)
            Local $iBitMask = BitShift(1, -$iBitOffset)
            Local $iWordValue = DllStructGetData($dVanquishWords, 1, $iWordIndex + 1)
            $bVanquished = BitAND($iWordValue, $iBitMask) <> 0
        EndIf

        $g_aMapEntries[$i][5] = $bVanquished
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
    Local $i = 0
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
    If StringLeft($sFolder, 8) = "Caravan_" Then Return "Caravan Internal"
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
        Case "Caravan Internal"
            $sRegion = StringTrimLeft($sFolder, 8)
        Case "Factions"
            $sRegion = StringTrimLeft($sFolder, 9)
        Case "Nightfall"
            $sRegion = StringTrimLeft($sFolder, 3)
    EndSwitch
    Return _HumanizeMapName($sRegion)
EndFunc

Func _NormalizeMapScriptNameForLookup($sMapName)
    If StringLeft($sMapName, StringLen("CaravanAscalon_")) = "CaravanAscalon_" Then Return StringTrimLeft($sMapName, StringLen("CaravanAscalon_"))
    If StringLeft($sMapName, StringLen("CaravanMaguuma_")) = "CaravanMaguuma_" Then Return StringTrimLeft($sMapName, StringLen("CaravanMaguuma_"))
    Return $sMapName
EndFunc

Func _LoadLocationCommentLabels()
    ReDim $g_aLocationCommentLabels[0][2]

    Local $hFile = FileOpen(@ScriptDir & "\Maps\LocationsIDS.au3", 0)
    If $hFile = -1 Then Return False

    While 1
        Local $sLine = FileReadLine($hFile)
        If @error = -1 Then ExitLoop

        Local $aMatch = StringRegExp($sLine, '^\s*Global\s+\$([A-Za-z0-9_]+)\s*=.*?;\s*(.+?)\s*$', 1)
        If Not IsArray($aMatch) Then ContinueLoop

        Local $sLabel = _NormalizeLocationCommentLabel($aMatch[1])
        If $sLabel = "" Then ContinueLoop

        Local $iNext = UBound($g_aLocationCommentLabels)
        ReDim $g_aLocationCommentLabels[$iNext + 1][2]
        $g_aLocationCommentLabels[$iNext][0] = $aMatch[0]
        $g_aLocationCommentLabels[$iNext][1] = $sLabel
    WEnd

    FileClose($hFile)
    Return UBound($g_aLocationCommentLabels) > 0
EndFunc

Func _NormalizeLocationCommentLabel($sLabel)
    $sLabel = StringStripWS($sLabel, 3)
    $sLabel = StringRegExpReplace($sLabel, '^\d+\s*[-–—:]\s*', '')
    Return StringStripWS($sLabel, 3)
EndFunc

Func _GetLocationCommentLabel($sVarName)
    Local $i = 0
    For $i = 0 To UBound($g_aLocationCommentLabels) - 1
        If StringCompare($g_aLocationCommentLabels[$i][0], $sVarName, 1) = 0 Then Return $g_aLocationCommentLabels[$i][1]
    Next
    Return ""
EndFunc

Func _ResolvePreTravelLabelFromScriptName($sCampaign, $sMapName, $iOutpostID)
    If $iOutpostID <= 0 Then Return ""
    If $sCampaign = "Caravan Routes" Or $sCampaign = "Caravan Internal" Then Return ""
    If _IsSpecialRouteScriptName($sMapName) Then Return ""

    Local $sVarName = _NormalizeMapScriptNameForLookup($sMapName) & "_Outpost"
    Local $sLabel = _GetLocationCommentLabel($sVarName)
    If $sLabel <> "" Then Return $sLabel

    If $g_bClientConnected And $Bot_Core_Initialized Then
        $sLabel = StringStripWS(Map_GetAreaInfo($iOutpostID, "Name"), 3)
        If $sLabel <> "" Then Return $sLabel
    EndIf

    Return ""
EndFunc

Func _HumanizeMapName($sName)
    $sName = StringRegExpReplace($sName, "([a-z])([A-Z])", "$1 $2")
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

    EndSwitch

    Return True
EndFunc

Func _RunGuiMaintenance()
    _SyncActiveMapGroupFromSelectedTab()
    _SyncAllMapChecks()
    _EnforceVisibleMapSelectionRules()
    _RefreshHeroTeamSelectionState()
    _UpdateVisibleSelectionToggleButton()
    _CheckForGuiSourceChanges()

    If $g_bClientConnected Then
        If Not _IsConnectedClientProcessAlive() Then
            If $g_bBotRunning Then
                _HandleClientRecoveryLoss("Guild Wars client disconnected. Stopping the current run and waiting to reconnect.")
            Else
                _EnsureConnectedClientAlive(True)
            EndIf
            _RefreshDetectedClient(True)
            $g_hClientScanTimer = TimerInit()
        ElseIf $g_bBotRunning Then
            If _CanQueryLiveClientState() Then
                $g_hClientResponsiveTimer = TimerInit()
            ElseIf TimerDiff($g_hClientResponsiveTimer) >= $CLIENT_UNRESPONSIVE_TIMEOUT_MS Then
                _HandleClientRecoveryLoss("Guild Wars stopped responding for too long. Stopping the current run and waiting to reconnect.")
            EndIf
        EndIf
    ElseIf TimerDiff($g_hClientScanTimer) >= _GetClientDetectionInterval() Then
        _RefreshDetectedClient()
        $g_hClientScanTimer = TimerInit()
    EndIf

    If $g_bClientRecoveryPending And Not $g_bBotRunning Then
        If Not $g_bClientConnected Then
            If $g_iDetectedCharacterCount = 1 And $g_iDetectedClientPid > 0 And $g_sDetectedCharacter <> "" Then
                If $g_sRecoveryCharacter = "" Or StringCompare($g_sDetectedCharacter, $g_sRecoveryCharacter, 0) = 0 Then
                    _Log("Recovered Guild Wars client detected. Reconnecting.")
                    If _ConnectToDetectedClient() Then
                        $g_bClientRecoveryAutoScanPending = True
                        $g_hClientResponsiveTimer = TimerInit()
                    EndIf
                EndIf
            EndIf
        ElseIf $g_bClientRecoveryAutoScanPending And Not $g_bMapScanInProgress And Not $g_bPendingVanquishScan Then
            $g_bClientRecoveryAutoScanPending = False
            _Log("Client reconnected. Rescanning map and vanquish state.")
            _ScanConnectedCharacterVanquishHistory()
        EndIf
    EndIf

    If ($g_bPendingClientPrime Or $g_bPendingVanquishScan) And TimerDiff($g_hConnectedStatePollTimer) >= $CONNECTED_STATE_POLL_INTERVAL_MS Then
        _ProcessConnectedStatePoll()
        $g_hConnectedStatePollTimer = TimerInit()
    EndIf

    If $g_bPendingPostConnectRefresh And TimerDiff($g_hPostConnectRefreshTimer) >= 250 Then
        $g_bPendingPostConnectRefresh = False
        $g_bPendingMapStateLoad = True
    EndIf
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

    _Log("Start pressed. Hard Mode will be enabled before going out.")
    $g_bBotRunning = True
    $boolrun = True
    $g_b_Vanquisher_AbortRoute = False
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_QueueAdvanced = False
    $g_hClientResponsiveTimer = TimerInit()
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

    If $g_bClientRecoveryPending Then
        _UpdateRunControlStatusDisplay("waiting for client reconnect")
        _Log("Selected map routine stopped after client recovery was triggered.")
    ElseIf $bCompleted Then
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
    If $bUserRequested Then _ClearClientRecoveryState()
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
            _Vanquisher_ApplyConsumablesOnFarmEntry()
            Call($sRouteFunc)
            Local $iCallError = @error
            Local $iCallExtended = @extended
            If $iCallError = 0xDEAD And $iCallExtended = 0xBEEF Then
                _Log("Start failed: route function call failed for " & _Vanquisher_ZoneDisplay($iMapIndex) & " (" & $sRouteFunc & ").")
                Return False
            EndIf
            If Not $g_b_Vanquisher_QueueAdvanced And Not $g_b_Vanquisher_RunFinished Then
                _Vanquisher_FinalizeDelayedCaravanAfterRoute($iMapIndex)
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
