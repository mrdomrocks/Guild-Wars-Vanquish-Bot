#include-once

Global $DeadOnTheRun = 0

; Central stop check used by movement and GoOut routines.
; Keeps routes from continuing after the GUI/run state has been stopped.
Func _Vanquisher_ShouldStop()
    Global $boolrun, $g_b_Vanquisher_AbortRoute, $g_b_Vanquisher_RunFinished
    If IsFunc("_Vanquisher_PumpGUI") Then _Vanquisher_PumpGUI()
    If Not $boolrun Then Return True
    If $g_b_Vanquisher_AbortRoute Then Return True
    If $g_b_Vanquisher_RunFinished Then Return True
    Return False
EndFunc

; Legacy GWA/GWToolbox-style aliases for Master Vanquisher on top of GwAu3.

#Region Agent struct cache
Func _Vanquisher_AgentStructDef()
    Return 'ptr vtable;byte unknown1[24];byte unknown2[4];ptr NextAgent;byte unknown3[8];long Id;float Z;byte unknown4[8];float BoxHoverWidth;float BoxHoverHeight;byte unknown5[8];float Rotation;byte unknown6[8];long NameProperties;byte unknown7[24];float X;float Y;byte unknown8[8];float NameTagX;float NameTagY;float NameTagZ;byte unknown9[12];long Type;float MoveX;float MoveY;byte unknown10[28];long Owner;byte unknown30[8];long ExtraType;byte unknown11[24];float AttackSpeed;float AttackSpeedModifier;word PlayerNumber;byte unknown12[6];ptr Equip;byte unknown13[10];byte Primary;byte Secondary;byte Level;byte Team;byte unknown14[6];float EnergyPips;byte unknown[4];float EnergyPercent;long MaxEnergy;byte unknown15[4];float HPPips;byte unknown16[4];float HP;long MaxHP;long Effects;byte unknown17[4];byte Hex;byte unknown18[18];long ModelState;long TypeMap;byte unknown19[16];long InSpiritRange;byte unknown20[16];long LoginNumber;float ModelMode;byte unknown21[4];long ModelAnimation;byte unknown22[32];byte LastStrike;byte Allegiance;word WeaponType;word Skill;byte unknown23[4];word WeaponItemId;word OffhandItemId'
EndFunc

Func _Vanquisher_AgentTemplate()
    Static $gs_t_Agent = 0
    If $gs_t_Agent = 0 Then $gs_t_Agent = DllStructCreate(_Vanquisher_AgentStructDef())
    Return $gs_t_Agent
EndFunc

Func _Gwen_ItemStructInfo()
    Static $gs_t_Item = 0
    If $gs_t_Item = 0 Then
        $gs_t_Item = DllStructCreate( _
            "dword ItemID;" & _
            "dword AgentID;" & _
            "byte unknown1[24];" & _
            "byte Type;" & _
            "byte unknown2;" & _
            "byte ExtraID;" & _
            "byte unknown3[9];" & _
            "dword ModelID")
    EndIf
    Return $gs_t_Item
EndFunc

Func GetAgentByID($a_i_AgentID = -2)
    Local $l_t_Agent = _Vanquisher_AgentTemplate()
    Local $l_p_Agent = Agent_GetAgentPtr($a_i_AgentID)
    If $l_p_Agent = 0 Then Return $l_t_Agent
    Memory_ReadToStruct($l_p_Agent, $l_t_Agent)
    Return $l_t_Agent
EndFunc

Func GetCurrentTarget()
    Return GetAgentByID(-1)
EndFunc

Func GetAgentPtr($a_i_AgentID = -2)
    Return Agent_GetAgentPtr($a_i_AgentID)
EndFunc
#EndRegion

#Region Client discovery
Func _Gwen_AppendCharName(ByRef $a_s_List, $a_s_Name)
    $a_s_Name = StringStripWS($a_s_Name, 3)
    If $a_s_Name = "" Then Return
    If Not _Vanquisher_IsPlausibleCharName($a_s_Name) Then Return
    If $a_s_List <> "" Then
        Local $l_a_Parts = StringSplit($a_s_List, "|")
        For $l_i_Idx = 1 To $l_a_Parts[0]
            If StringCompare($l_a_Parts[$l_i_Idx], $a_s_Name, 0) = 0 Then Return
        Next
        $a_s_List &= "|"
    EndIf
    $a_s_List &= $a_s_Name
EndFunc

Func _Vanquisher_IsPlausibleCharName($a_s_Name)
    $a_s_Name = StringStripWS($a_s_Name, 3)
    If $a_s_Name = "" Then Return False
    If StringLen($a_s_Name) < 2 Or StringLen($a_s_Name) > 15 Then Return False
    If StringRegExp($a_s_Name, "^[\x20-\x7E]+$") = 0 Then Return False
    If StringRegExp($a_s_Name, "(?i)^(Master Vanquisher|Legendary Vanquisher)$") Then Return False
    Return True
EndFunc

Func _Gwen_CharNameFromWindowTitle($a_s_Title)
    $a_s_Title = StringStripWS($a_s_Title, 3)
    If $a_s_Title = "" Then Return ""
    If StringRegExp($a_s_Title, "(?i)^Guild Wars\s*$") Then Return ""

    Local $a_Parts = StringRegExp($a_s_Title, "(?i)^Guild Wars\s*[-\x2013\x2014]\s*(.+)$", 3)
    If IsArray($a_Parts) And UBound($a_Parts) >= 1 And $a_Parts[0] <> "" Then
        Return StringStripWS($a_Parts[0], 3)
    EndIf

    Return ""
EndFunc

Func _Gwen_AppendCharNameFromHwnd(ByRef $a_s_Names, $a_h_Wnd)
    If $a_h_Wnd = 0 Or Not WinExists($a_h_Wnd) Then Return
    Local $l_s_Title = WinGetTitle($a_h_Wnd)
    If StringInStr(StringLower($l_s_Title), "master vanquisher") Then Return
    Local $l_s_Char = _Gwen_CharNameFromWindowTitle($l_s_Title)
    If $l_s_Char <> "" Then _Gwen_AppendCharName($a_s_Names, $l_s_Char)
EndFunc

Func _Gwen_AppendNamesFromWindows(ByRef $a_s_Names)
    Local $l_a_Lists[2] = ["[CLASS:" & $GC_S_CLASS_DX_WINDOW & "]", "[REGEXPTITLE:(?i)^Guild Wars]"]
    For $l_i_List = 0 To 1
        Local $l_a_Wins = WinList($l_a_Lists[$l_i_List])
        For $l_i_Idx = 1 To $l_a_Wins[0][0]
            _Gwen_AppendCharNameFromHwnd($a_s_Names, $l_a_Wins[$l_i_Idx][1])
        Next
    Next

    Local $l_a_ProcessNames[2] = ["gw.exe", "Gw.exe"]
    For $l_i_NameIdx = 0 To 1
        Local $l_as_ProcessList = ProcessList($l_a_ProcessNames[$l_i_NameIdx])
        For $l_i_Idx = 1 To $l_as_ProcessList[0][0]
            Local $l_h_Wnd = Scanner_GetHwnd($l_as_ProcessList[$l_i_Idx][1])
            If $l_h_Wnd Then _Gwen_AppendCharNameFromHwnd($a_s_Names, $l_h_Wnd)
        Next
    Next
EndFunc

Func _Vanquisher_AppendNamesFromProcess($a_s_Process, ByRef $a_s_Names)
    Local $l_as_ProcessList = ProcessList($a_s_Process)
    For $l_i_Idx = 1 To $l_as_ProcessList[0][0]
        If IsFunc("_Vanquisher_PumpGUI") Then _Vanquisher_PumpGUI()
        Memory_Open($l_as_ProcessList[$l_i_Idx][1])
        If $g_h_GWProcess And Scanner_InitializeSections() And Scanner_ScanForCharname() Then
            _Gwen_AppendCharName($a_s_Names, Player_GetCharName())
        EndIf
        Memory_Close()
        $g_h_GWProcess = 0
    Next
EndFunc

Func _Vanquisher_GetGwWindowTitles()
    Local $l_s_Titles = ""
    Local $l_a_Wins = WinList("[REGEXPTITLE:(?i)^Guild Wars]")
    For $l_i_Idx = 1 To $l_a_Wins[0][0]
        If $l_s_Titles <> "" Then $l_s_Titles &= " | "
        $l_s_Titles &= "'" & WinGetTitle($l_a_Wins[$l_i_Idx][1]) & "'"
    Next
    If $l_s_Titles = "" Then Return "(no Guild Wars windows)"
    Return $l_s_Titles
EndFunc

Func _Vanquisher_CharIniPath()
    Return $VANQUISHER_CHAR_INI_LOCAL
EndFunc

; Always keep app/Config/Vanquisher.local.ini present with at least LastName=NONE.
Func _Vanquisher_EnsureLocalCharIni()
    If Not FileExists($VANQUISHER_CONFIG_DIR) Then DirCreate($VANQUISHER_CONFIG_DIR)
    If Not FileExists($VANQUISHER_CHAR_INI_LOCAL) Then
        IniWrite($VANQUISHER_CHAR_INI_LOCAL, "Character", "LastName", "NONE")
        Return
    EndIf
    Local $l_s_Name = StringStripWS(IniRead($VANQUISHER_CHAR_INI_LOCAL, "Character", "LastName", ""), 3)
    If $l_s_Name = "" Then IniWrite($VANQUISHER_CHAR_INI_LOCAL, "Character", "LastName", "NONE")
EndFunc

Func _Vanquisher_LoadLastCharacter()
    _Vanquisher_EnsureLocalCharIni()
    Local $l_s_Name = IniRead($VANQUISHER_CHAR_INI_LOCAL, "Character", "LastName", "NONE")
    $l_s_Name = StringStripWS($l_s_Name, 3)
    If $l_s_Name = "" Or StringUpper($l_s_Name) = "NONE" Then Return ""
    Return $l_s_Name
EndFunc

; Vanquisher.local.ini must remain LastName=NONE — never overwrite with a character name.
Func _Vanquisher_SaveLastCharacter($a_s_Name)
    #forceref $a_s_Name
    _Vanquisher_EnsureLocalCharIni()
    IniWrite($VANQUISHER_CHAR_INI_LOCAL, "Character", "LastName", "NONE")
EndFunc

Func _Vanquisher_CountGWClients()
    Local $l_i_Count = ProcessList("gw.exe")[0][0]
    Local $l_i_GwExe = ProcessList("Gw.exe")[0][0]
    If $l_i_GwExe > $l_i_Count Then $l_i_Count = $l_i_GwExe
    Local $l_a_Wins = WinList("[CLASS:" & $GC_S_CLASS_DX_WINDOW & "]")
    If $l_a_Wins[0][0] > $l_i_Count Then $l_i_Count = $l_a_Wins[0][0]
    Return $l_i_Count
EndFunc

Func _Vanquisher_GWIsRunning()
    Return _Vanquisher_CountGWClients() > 0
EndFunc

Func Gwen_GetLoggedCharNames()
    Local $l_s_Names = _Vanquisher_GetMemoryCharNames()
    If $l_s_Names <> "" Then Return $l_s_Names

    _Gwen_AppendNamesFromWindows($l_s_Names)
    Return $l_s_Names
EndFunc

Func Gwen_GetCharNamesFromWindowsOnly()
    Local $l_s_Names = ""
    _Gwen_AppendNamesFromWindows($l_s_Names)
    Return $l_s_Names
EndFunc

Func _Vanquisher_GetMemoryCharNames()
    Local $l_s_Names = ""
    _Vanquisher_AppendNamesFromProcess("Gw.exe", $l_s_Names)
    _Vanquisher_AppendNamesFromProcess("gw.exe", $l_s_Names)
    Return $l_s_Names
EndFunc

Func _Gwen_FindPidByCharName($a_s_Char)
    $a_s_Char = StringStripWS($a_s_Char, 3)
    If $a_s_Char = "" Then Return 0

    Local $l_a_ProcessNames[2] = ["gw.exe", "Gw.exe"]
    For $l_i_NameIdx = 0 To 1
        Local $l_as_ProcessList = ProcessList($l_a_ProcessNames[$l_i_NameIdx])
        For $l_i_Idx = 1 To $l_as_ProcessList[0][0]
            Memory_Open($l_as_ProcessList[$l_i_Idx][1])
            If $g_h_GWProcess And Scanner_InitializeSections() And Scanner_ScanForCharname() Then
                Local $l_s_Char = Player_GetCharName()
                If $l_s_Char <> "" And StringCompare(StringStripWS($l_s_Char, 3), $a_s_Char, 0) = 0 Then
                    Memory_Close()
                    $g_h_GWProcess = 0
                    Return $l_as_ProcessList[$l_i_Idx][1]
                EndIf
            EndIf
            Memory_Close()
            $g_h_GWProcess = 0
        Next
    Next

    Local $l_a_Wins = WinList("[REGEXPTITLE:(?i)^Guild Wars]")
    For $l_i_Idx = 1 To $l_a_Wins[0][0]
        Local $l_s_Char = _Gwen_CharNameFromWindowTitle(WinGetTitle($l_a_Wins[$l_i_Idx][1]))
        If $l_s_Char <> "" And StringCompare($l_s_Char, $a_s_Char, 0) = 0 Then Return WinGetProcess($l_a_Wins[$l_i_Idx][1])
    Next

    Return 0
EndFunc

Func _Vanquisher_ListContainsValue($a_s_List, $a_s_Value)
    $a_s_List = StringStripWS($a_s_List, 3)
    $a_s_Value = StringStripWS($a_s_Value, 3)
    If $a_s_List = "" Or $a_s_Value = "" Then Return False
    Local $l_a_Parts = StringSplit($a_s_List, "|")
    For $l_i_Idx = 1 To $l_a_Parts[0]
        If StringCompare(StringStripWS($l_a_Parts[$l_i_Idx], 3), $a_s_Value, 0) = 0 Then Return True
    Next
    Return False
EndFunc

Func _Vanquisher_FindGwWindowByPid($a_i_Pid)
    If $a_i_Pid <= 0 Then Return 0

    Local $l_a_Wins = WinList("[CLASS:" & $GC_S_CLASS_DX_WINDOW & "]")
    For $l_i_Idx = 1 To $l_a_Wins[0][0]
        If WinGetProcess($l_a_Wins[$l_i_Idx][1]) = $a_i_Pid Then Return $l_a_Wins[$l_i_Idx][1]
    Next

    $l_a_Wins = WinList("[REGEXPTITLE:(?i)^Guild Wars]")
    For $l_i_Idx = 1 To $l_a_Wins[0][0]
        If WinGetProcess($l_a_Wins[$l_i_Idx][1]) = $a_i_Pid Then Return $l_a_Wins[$l_i_Idx][1]
    Next

    Return 0
EndFunc
#EndRegion

#Region Core connection
Func _Vanquisher_SyncLegacyHandles()
    $nHandle = $g_h_GWProcess
    $nPID = $g_i_GWProcessId
EndFunc

Func Initialize($a_s_GW, $a_b_ChangeTitle = True, $a_b_Unused = True)
    If Not _Vanquisher_GWIsRunning() Then Return False

    If IsString($a_s_GW) And $a_s_GW <> "" Then
        Local $l_i_Pid = _Gwen_FindPidByCharName($a_s_GW)
        If $l_i_Pid Then
            Core_Initialize($l_i_Pid, $a_b_ChangeTitle)
        Else
            Core_Initialize($a_s_GW, $a_b_ChangeTitle)
        EndIf
    Else
        Core_Initialize($a_s_GW, $a_b_ChangeTitle)
    EndIf

    If Not $g_h_GWProcess Then
        _Vanquisher_SyncLegacyHandles()
        Return False
    EndIf
    If $g_p_BasePointer = 0 Then
        _Vanquisher_SyncLegacyHandles()
        Return False
    EndIf

    If IsString($a_s_GW) And $a_s_GW <> "" Then
        Local $l_s_Char = Player_GetCharname()
        If $l_s_Char = "" Then
            _Vanquisher_SyncLegacyHandles()
            Return False
        EndIf
        If StringCompare(StringStripWS($l_s_Char, 3), StringStripWS($a_s_GW, 3)) <> 0 Then
            _Vanquisher_SyncLegacyHandles()
            Return False
        EndIf
    EndIf

    _Vanquisher_SyncLegacyHandles()
    Return True
EndFunc

Func _Vanquisher_IsAttached()
    Return $g_h_GWProcess <> 0 And $g_p_BasePointer <> 0
EndFunc

Func _Vanquisher_AttachToCharacter($a_s_CharName)
    $a_s_CharName = StringStripWS($a_s_CharName, 3)
    If $a_s_CharName = "" Then Return False

    If Not Initialize($a_s_CharName, True) Then
        Local $l_s_MemoryNames = _Vanquisher_GetMemoryCharNames()
        If $l_s_MemoryNames <> "" Then
            CurrentAction("Attach failed for '" & $a_s_CharName & "'. Found: " & StringReplace($l_s_MemoryNames, "|", ", "))
        Else
            CurrentAction("Attach failed. Launch Guild Wars, log in on that character, then click Start Vanquishing.")
        EndIf
        Return False
    EndIf

    _Vanquisher_SaveLastCharacter($a_s_CharName)
    Return True
EndFunc

Func _Vanquisher_VirtualProtectEx($a_h_Process, $a_p_Address, $a_i_Size, $a_i_Protection, ByRef $a_i_OldProtection)
    Local $l_a_Result = DllCall("kernel32.dll", "bool", "VirtualProtectEx", _
        "handle", $a_h_Process, _
        "ptr", $a_p_Address, _
        "ulong_ptr", $a_i_Size, _
        "dword", $a_i_Protection, _
        "dword*", 0)

    If @error Or Not IsArray($l_a_Result) Then Return False
    $a_i_OldProtection = $l_a_Result[5]
    Return $l_a_Result[0]
EndFunc

Func GetCharname()
    Return Player_GetCharname()
EndFunc

Func GetWindowHandle()
    Return Scanner_GetWindowHandle()
EndFunc

Func GetMapLoading()
    Return Map_GetInstanceInfo("Type")
EndFunc

Func GetMapID()
    Return Map_GetMapID()
EndFunc

Func MemoryRead($a_p_Address, $a_s_Type = "dword")
    Return Memory_Read($a_p_Address, $a_s_Type)
EndFunc

Func SkipCinematic()
    Return Cinematic_SkipCinematic()
EndFunc

Func Disconnected()
    Out("Waiting for map load...")
    Map_WaitMapLoading(60000)
    _Vanquisher_CacheCombatAIForCurrentMap()
EndFunc
#EndRegion

#Region Movement and position
Func X($aAgent)
    If IsDllStruct($aAgent) Then Return DllStructGetData($aAgent, "X")
    Return Agent_GetAgentInfo($aAgent, "X")
EndFunc

Func Y($aAgent)
    If IsDllStruct($aAgent) Then Return DllStructGetData($aAgent, "Y")
    Return Agent_GetAgentInfo($aAgent, "Y")
EndFunc

Func GetAgentRotationAngle_Ptr($aAgent)
    Return Agent_GetAgentInfo($aAgent, "Rotation")
EndFunc

Func CheckMovingInOutpost($aX, $aY)
    Return
EndFunc
#EndRegion

#Region Party leader
Func _Gwen_LeaderNameMatches($a_i_AgentID)
    If $a_i_AgentID = 0 Or $LeaderName = "" Then Return False

    Local $l_s_Name = Agent_GetAgentInfo($a_i_AgentID, "Name")
    If $l_s_Name = "" Then Return False
    Return StringCompare(StringStripWS($l_s_Name, 3), StringStripWS($LeaderName, 3), 0) = 0
EndFunc

Func _Gwen_SetLeaderID($a_i_AgentID)
    If $a_i_AgentID = 0 Then Return False
    $LeaderID = $a_i_AgentID
    $SavedMap = GetMapID()
    Return True
EndFunc

Func GetPartyLeader()
    $SavedMap = GetMapID()
    $LeaderID = ""

    If $LeaderName = "" Then Return

    ; Party slot 1 is authoritative when it matches the configured leader (LoginNumber lookup is reliable in explorable areas).
    Local $l_i_PartyLeader = GetMemberAgentID(1)
    If $l_i_PartyLeader <> 0 And _Gwen_LeaderNameMatches($l_i_PartyLeader) Then
        $LeaderID = $l_i_PartyLeader
        Return
    EndIf

    Local $l_ap_Agents = Agent_GetAgentArray($GC_I_AGENT_TYPE_LIVING)
    If Not IsArray($l_ap_Agents) Or $l_ap_Agents[0] = 0 Then Return

    For $l_i_Idx = 1 To $l_ap_Agents[0]
        Local $l_s_Name = Agent_GetAgentInfo($l_ap_Agents[$l_i_Idx], "Name")
        If $l_s_Name = "" Then ContinueLoop
        If StringCompare(StringStripWS($l_s_Name, 3), StringStripWS($LeaderName, 3), 0) = 0 Then
            $LeaderID = Agent_GetAgentInfo($l_ap_Agents[$l_i_Idx], "ID")
            Return
        EndIf
    Next
EndFunc

Func CheckCurrentPartyleader()
    If $LeaderName = "" Then Return

    Local $l_i_LeaderAgent = GetMemberAgentID(1)
    If $l_i_LeaderAgent = 0 Then Return

    If _Gwen_LeaderNameMatches($l_i_LeaderAgent) Then
        _Gwen_SetLeaderID($l_i_LeaderAgent)
    Else
        GetPartyLeader()
    EndIf
EndFunc
#EndRegion

#Region Skills, items, chat
Func GetMaxAgents()
    Return Agent_GetMaxAgents()
EndFunc

Func GetPing()
    Return Other_GetPing()
EndFunc

Func GetSkillbarSkillAdrenaline($a_i_Slot, $a_i_Hero = 0)
    Return Skill_GetSkillbarInfo($a_i_Slot, "Adrenaline", $a_i_Hero)
EndFunc

Func GetSkillbarSkillID($a_i_Slot, $a_i_Hero = 0)
    Return Skill_GetSkillbarInfo($a_i_Slot, "SkillID", $a_i_Hero)
EndFunc

Func GetIsMovable($aAgent)
    Local $l_i_AgentID = $aAgent
    If IsDllStruct($aAgent) Then $l_i_AgentID = DllStructGetData($aAgent, "ID")
    Return Agent_GetAgentInfo($l_i_AgentID, "IsItemType")
EndFunc

Func GetItemByAgentID($a_i_AgentID)
    Local $l_t_Item = _Gwen_ItemStructInfo()

    Local $l_i_ItemID = Item_FindItemByAgentID($a_i_AgentID)
    If $l_i_ItemID = 0 Then Return $l_t_Item

    Local $l_p_Item = Item_GetItemPtr($l_i_ItemID)
    If $l_p_Item = 0 Then Return $l_t_Item

    Memory_ReadToStruct($l_p_Item, $l_t_Item)
    Return $l_t_Item
EndFunc

Func PickUpItem($a_v_Item)
    If Map_GetInstanceInfo("IsLoading") Then Return False
    If Map_GetInstanceInfo("IsOutpost") Then Return False

    Local $l_i_AgentID = $a_v_Item
    If IsDllStruct($a_v_Item) Then
        $l_i_AgentID = DllStructGetData($a_v_Item, "AgentID")
    ElseIf Not IsNumber($a_v_Item) Then
        $l_i_AgentID = Item_GetItemInfoByPtr($a_v_Item, "AgentID")
    EndIf
    If $l_i_AgentID = 0 Or Agent_GetAgentPtr($l_i_AgentID) = 0 Then Return False
    If Not Agent_GetAgentInfo($l_i_AgentID, "IsItemType") Then Return False
    Return Item_PickUpItem($l_i_AgentID)
EndFunc

Func GetRarity($aItem)
    If IsDllStruct($aItem) Then
        Local $l_i_AgentID = DllStructGetData($aItem, "AgentID")
        If $l_i_AgentID <> 0 Then Return Item_GetItemInfoByAgentID($l_i_AgentID, "Rarity")
    ElseIf IsPtr($aItem) Then
        Return Item_GetItemInfoByPtr($aItem, "Rarity")
    EndIf
    Return 0
EndFunc

Func GetAssignedToMe($aAgent)
    Local $l_i_AgentID = $aAgent
    If IsDllStruct($aAgent) Then $l_i_AgentID = DllStructGetData($aAgent, "ID")
    Return Agent_GetAgentInfo($l_i_AgentID, "CanPickUp")
EndFunc

Func CountAllEmptySlots()
    Return CountSlots()
EndFunc

Func GetAgentArraySorted($a_i_Type = 0)
    Local $l_ap_Agents = Agent_GetAgentArray($a_i_Type)
    If Not IsArray($l_ap_Agents) Or $l_ap_Agents[0] = 0 Then
        Local $l_a_Empty[0][2]
        Return $l_a_Empty
    EndIf

    Local $l_a_Sorted[$l_ap_Agents[0]][2]
    Local $l_i_Count = 0
    For $l_i_Idx = 1 To $l_ap_Agents[0]
        Local $l_i_AgentID = Agent_GetAgentInfo($l_ap_Agents[$l_i_Idx], "ID")
        If $l_i_AgentID = 0 Then ContinueLoop
        $l_a_Sorted[$l_i_Count][0] = $l_i_AgentID
        $l_a_Sorted[$l_i_Count][1] = Agent_GetDistance($l_i_AgentID)
        $l_i_Count += 1
    Next

    If $l_i_Count = 0 Then
        Local $l_a_Empty[0][2]
        Return $l_a_Empty
    EndIf
    ReDim $l_a_Sorted[$l_i_Count][2]

    For $l_i_Outer = 0 To $l_i_Count - 2
        For $l_i_Inner = $l_i_Outer + 1 To $l_i_Count - 1
            If $l_a_Sorted[$l_i_Inner][1] < $l_a_Sorted[$l_i_Outer][1] Then
                Local $l_i_TempID = $l_a_Sorted[$l_i_Outer][0]
                Local $l_f_TempDist = $l_a_Sorted[$l_i_Outer][1]
                $l_a_Sorted[$l_i_Outer][0] = $l_a_Sorted[$l_i_Inner][0]
                $l_a_Sorted[$l_i_Outer][1] = $l_a_Sorted[$l_i_Inner][1]
                $l_a_Sorted[$l_i_Inner][0] = $l_i_TempID
                $l_a_Sorted[$l_i_Inner][1] = $l_f_TempDist
            EndIf
        Next
    Next

    Return $l_a_Sorted
EndFunc

Func CountInventoryItem($a_i_ModelID)
    Local $l_i_Count = 0
    Local $l_ap_Items = Item_GetItemArray()
    If Not IsArray($l_ap_Items) Then Return 0

    For $l_i_Idx = 1 To $l_ap_Items[0]
        Local $l_p_Item = $l_ap_Items[$l_i_Idx]
        If Memory_Read($l_p_Item + 0x2C, "dword") <> $a_i_ModelID Then ContinueLoop
        $l_i_Count += Item_GetItemInfoByPtr($l_p_Item, "Quantity")
    Next

    Return $l_i_Count
EndFunc

Func GetItemInInventory($a_i_ModelID)
    Return Item_FindItemByModelID($a_i_ModelID)
EndFunc

Func UseItem($a_v_Item)
    Return Item_UseItem($a_v_Item)
EndFunc

Func _Vanquisher_ModelInArray($a_i_ModelID, $a_a_ModelIDs)
    For $l_i_Idx = 0 To UBound($a_a_ModelIDs) - 1
        If $a_i_ModelID = $a_a_ModelIDs[$l_i_Idx] Then Return True
    Next
    Return False
EndFunc

Func _Vanquisher_UseItemModelID($a_i_ModelID)
    If GetPartyDead() Then Return False
    For $l_i_Bag = 1 To 4
        For $l_i_Slot = 1 To Item_GetBagInfo($l_i_Bag, "Slots")
            Local $l_p_Item = Item_GetItemBySlot($l_i_Bag, $l_i_Slot)
            If $l_p_Item = 0 Then ContinueLoop
            If Item_GetItemInfoByPtr($l_p_Item, "ModelID") = $a_i_ModelID Then
                Item_UseItem($l_p_Item)
                RndSleep(750)
                Return True
            EndIf
        Next
    Next
    Return False
EndFunc

Func _Vanquisher_UseFirstInventoryItemByModelIDs($a_a_ModelIDs)
    If GetPartyDead() Then Return False
    For $l_i_Bag = 1 To 4
        For $l_i_Slot = 1 To Item_GetBagInfo($l_i_Bag, "Slots")
            Local $l_p_Item = Item_GetItemBySlot($l_i_Bag, $l_i_Slot)
            If $l_p_Item = 0 Then ContinueLoop
            Local $l_i_ModelID = Item_GetItemInfoByPtr($l_p_Item, "ModelID")
            For $l_i_Idx = 0 To UBound($a_a_ModelIDs) - 1
                If $l_i_ModelID = $a_a_ModelIDs[$l_i_Idx] Then
                    Item_UseItem($l_p_Item)
                    RndSleep(750)
                    Return True
                EndIf
            Next
        Next
    Next
    Return False
EndFunc

Func GetEffectTimeRemaining($a_i_EffectID, $a_i_Agent = -2)
    Return Agent_GetAgentEffectInfo($a_i_Agent, $a_i_EffectID, "TimeRemaining")
EndFunc

Func SendWhisper($a_s_Receiver, $a_s_Message)
    Return Chat_SendWhisper($a_s_Receiver, $a_s_Message)
EndFunc

Func GoSignpost($aAgent)
    If IsDllStruct($aAgent) Then Return Agent_GoSignpost(DllStructGetData($aAgent, "ID"))
    Return Agent_GoSignpost($aAgent)
EndFunc

Func TargetNearestItem()
    Return Core_ControlAction($GC_I_CONTROL_TARGETING_ITEM_NEAREST)
EndFunc

Func OpenChest($a_b_WithLockpick = True)
    Return Item_OpenChest($a_b_WithLockpick)
EndFunc
#EndRegion

#Region Sleep
; IniWriteSection is a built-in AutoIt function (do not redefine it here).
Func RndSleep($a_i_Ms, $a_f_Random = 0.05)
    Other_RndSleep($a_i_Ms, $a_f_Random)
EndFunc
#EndRegion

#Region Master Vanquisher API wrappers
Func _Vanquisher_AgentID($a_v_Agent)
    If IsDllStruct($a_v_Agent) Then Return DllStructGetData($a_v_Agent, "Id")
    If IsPtr($a_v_Agent) Then Return Agent_GetAgentInfo($a_v_Agent, "ID")
    If IsNumber($a_v_Agent) Then Return $a_v_Agent
    Return 0
EndFunc

Func _Vanquisher_AgentHP($a_v_Agent)
    If IsDllStruct($a_v_Agent) Then Return DllStructGetData($a_v_Agent, "HP")
    Return Agent_GetAgentInfo($a_v_Agent, "HP")
EndFunc

Func GetLoggedCharNames()
    Return Scanner_GetLoggedCharNames()
EndFunc

Func GetFoesToKill()
    If World_GetWorldContextPtr() = 0 Then Return -1
    Return World_GetWorldInfo("FoesToKill")
EndFunc

Func GetFoesKilled()
    If World_GetWorldContextPtr() = 0 Then Return 0
    Return World_GetWorldInfo("FoesKilled")
EndFunc

Func _Vanquisher_TryCaptureVanquishBaseline()
    Local $l_i_Remaining = GetFoesToKill()
    Local $l_i_Killed = GetFoesKilled()
    If $l_i_Remaining < 0 Then Return False
    If $l_i_Remaining > 0 Then
        $g_i_Vanquisher_InitialFoesToKill = $l_i_Remaining
        $g_i_Vanquisher_InitialFoesKilled = $l_i_Killed
        $g_b_Vanquisher_CounterUnreliable = False
        Return True
    EndIf
    Return False
EndFunc

Func _Vanquisher_InvalidateCombatAI()
    $g_b_Vanquisher_CombatAIReady = False
    $g_i_Vanquisher_CombatAIReadyMapID = 0
EndFunc

; GwAu3 Utility AI requires Cache_SkillBar() once per explorable zone before UAI_Fight can cast or auto-attack.
Func _Vanquisher_CacheCombatAIForCurrentMap($a_b_Announce = False, $a_b_Force = False)
    If Map_GetInstanceInfo("IsLoading") Then
        _Vanquisher_InvalidateCombatAI()
        Return False
    EndIf

    If Not Map_GetInstanceInfo("IsExplorable") Then
        _Vanquisher_InvalidateCombatAI()
        Return False
    EndIf

    Local $l_i_MapID = GetMapID()
    If $l_i_MapID <= 0 Then Return False

    If Not $a_b_Force And $g_b_Vanquisher_CombatAIReady And $g_i_Vanquisher_CombatAIReadyMapID = $l_i_MapID Then Return True

    $g_b_CacheWeaponSet = True
    If Not Cache_SkillBar() Then Return False

    $g_b_Vanquisher_CombatAIReady = True
    $g_i_Vanquisher_CombatAIReadyMapID = $l_i_MapID
    If $a_b_Announce Then CurrentAction("Combat skill bar cached.")
    Return True
EndFunc

Func _Vanquisher_InitCombatAI()
    _Vanquisher_CacheCombatAIForCurrentMap(True)
    If IsFunc("_Vanquisher_InitPathfinderForZone") Then _Vanquisher_InitPathfinderForZone()
EndFunc

Func _Vanquisher_ResetGoOutRouteProgress()
    $g_i_Vanquisher_GoOutLastMapHandled = -1
EndFunc

Func _Vanquisher_RefreshVanquishBaseline()
    $g_i_Vanquisher_InitialFoesToKill = -1
    $g_i_Vanquisher_InitialFoesKilled = 0
    $g_b_Vanquisher_CounterUnreliable = False
    $g_i_Vanquisher_SessionStartKilled = 0
    $g_b_Vanquisher_HasRunRoute = False
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_AbortRoute = False
    _Vanquisher_InvalidateCombatAI()
    $g_b_Vanquisher_TransitOnly = False
    $g_i_Vanquisher_GoOutLastMapHandled = -1
    $g_i_TearsRoute_LastMapHandled = -1
    $g_i_StingrayRoute_LastMapHandled = -1
    $g_h_Vanquisher_ConsumablePollTimer = 0
    $g_b_Vanquisher_ConsetAppliedThisZone = False
    $g_i_Vanquisher_DeathRestartCount = 0
    For $l_i_Idx = 0 To UBound($g_a_Vanquisher_BULastUsed) - 1
        $g_a_Vanquisher_BULastUsed[$l_i_Idx] = 0
        $g_a_Vanquisher_BUUsedThisZone[$l_i_Idx] = 0
    Next
    For $l_i_Idx = 0 To 2
        $g_a_Vanquisher_ConsetLastUsed[$l_i_Idx] = 0
    Next
    If Not Map_GetInstanceInfo("IsExplorable") Then Return
    If Not GetIsHardMode() Then
        CurrentAction("Hard Mode required - enable HM in outpost as party leader.")
        Return
    EndIf

    CurrentAction("Reading vanquish counter...")
    Local $l_i_StableZeros = 0
    Local $hTimer = TimerInit()
    While TimerDiff($hTimer) < 8000
        Local $l_i_Remaining = GetFoesToKill()
        Local $l_i_Killed = GetFoesKilled()
        If $l_i_Remaining < 0 Then
            Sleep(500)
            ContinueLoop
        EndIf
        If _Vanquisher_TryCaptureVanquishBaseline() Then
            CurrentAction("Vanquish counter: " & $g_i_Vanquisher_InitialFoesKilled & " killed, " & $g_i_Vanquisher_InitialFoesToKill & " remaining.")
            _Vanquisher_InitCombatAI()
            Return
        EndIf
        If $l_i_Remaining = 0 And $l_i_Killed = 0 Then
            $l_i_StableZeros += 1
            If $l_i_StableZeros >= 3 Then ExitLoop
        Else
            $l_i_StableZeros = 0
        EndIf
        Sleep(750)
    WEnd

    If _Vanquisher_TryCaptureVanquishBaseline() Then
        CurrentAction("Vanquish counter: " & $g_i_Vanquisher_InitialFoesKilled & " killed, " & $g_i_Vanquisher_InitialFoesToKill & " remaining.")
        _Vanquisher_InitCombatAI()
        Return
    EndIf

    $g_b_Vanquisher_CounterUnreliable = True
    $g_i_Vanquisher_SessionStartKilled = GetFoesKilled()
    CurrentAction("Vanquish counter unreadable - running route anyway.")
    _Vanquisher_InitCombatAI()
EndFunc

Func _Vanquisher_ShouldRunRoute()
    Return Not GetAreaVanquished()
EndFunc

Func GetAreaVanquished()
    If Not Map_GetInstanceInfo("IsExplorable") Then Return False
    If Not GetIsHardMode() Then Return False

    Local $l_i_Remaining = GetFoesToKill()
    Local $l_i_Killed = GetFoesKilled()
    If $l_i_Remaining < 0 Then Return False

    If $l_i_Remaining > 0 Then
        If $g_i_Vanquisher_InitialFoesToKill < 0 Or $g_b_Vanquisher_CounterUnreliable Then
            $g_i_Vanquisher_InitialFoesToKill = $l_i_Remaining
            $g_i_Vanquisher_InitialFoesKilled = $l_i_Killed
            $g_b_Vanquisher_CounterUnreliable = False
        EndIf
        Return False
    EndIf

    If $g_i_Vanquisher_InitialFoesToKill > 0 Then
        If $l_i_Killed <= $g_i_Vanquisher_InitialFoesKilled Then Return False
        $g_b_Vanquisher_CounterUnreliable = False
        Return True
    EndIf

    If $l_i_Killed > $g_i_Vanquisher_SessionStartKilled And $l_i_Killed > 0 Then Return True
    Return False
EndFunc

Func _Vanquisher_ResetZoneRouteState()
    $g_i_Vanquisher_GoOutLastMapHandled = -1
    $g_i_TearsRoute_LastMapHandled = -1
    $g_i_StingrayRoute_LastMapHandled = -1
    $g_b_Vanquisher_HasRunRoute = False
    $g_b_Vanquisher_RunFinished = False
    $g_b_Vanquisher_AbortRoute = False
    $g_b_Vanquisher_DeathResignPending = False
    _Vanquisher_InvalidateCombatAI()
    $g_h_Vanquisher_FightTimer = 0
    $g_i_Vanquisher_InitialFoesToKill = -1
    $g_i_Vanquisher_InitialFoesKilled = 0
    $g_b_Vanquisher_CounterUnreliable = False
    $g_h_Vanquisher_ConsumablePollTimer = 0
    $g_h_Vanquisher_StoneTimer = 0
    $g_b_Vanquisher_ConsetAppliedThisZone = False
    $g_b_Vanquisher_ConsumablesAppliedThisZone = False
    $g_b_Vanquisher_StoneHandledThisZone = False
    $g_i_Vanquisher_DeathRestartCount = 0
    If IsFunc("_Vanquisher_ShutdownPathfinderForZone") Then _Vanquisher_ShutdownPathfinderForZone()
    For $l_i_Idx = 0 To UBound($g_a_Vanquisher_BULastUsed) - 1
        $g_a_Vanquisher_BULastUsed[$l_i_Idx] = 0
        $g_a_Vanquisher_BUUsedThisZone[$l_i_Idx] = 0
    Next
    For $l_i_Idx = 0 To UBound($g_a_Vanquisher_ConsetLastUsed) - 1
        $g_a_Vanquisher_ConsetLastUsed[$l_i_Idx] = 0
    Next
    $DeadOnTheRun = 0
EndFunc

Func _Vanquisher_AdvanceZoneQueue()
    Global $Title, $NumberRun, $g_a_VanquisherZoneQueue, $g_i_VanquisherZoneQueueIndex, $g_b_Vanquisher_QueueAdvanced
    $g_i_VanquisherZoneQueueIndex += 1
    If $g_i_VanquisherZoneQueueIndex >= UBound($g_a_VanquisherZoneQueue) Then Return False

    _ApplyQueuedMapContext($g_a_VanquisherZoneQueue[$g_i_VanquisherZoneQueueIndex])
    $NumberRun = 0
    $g_b_Vanquisher_QueueAdvanced = True
    If $Title = "TravelersVale" Then $g_b_AscalonCaravan_VisitedDG = False
    _Vanquisher_ResetZoneRouteState()

    Local $iPos = $g_i_VanquisherZoneQueueIndex + 1
    Local $iTotal = UBound($g_a_VanquisherZoneQueue)
    CurrentAction("Queue " & $iPos & "/" & $iTotal & ": " & _Vanquisher_ZoneDisplay($g_a_VanquisherZoneQueue[$g_i_VanquisherZoneQueueIndex]))
    _Vanquisher_UpdateStatusBar()
    Return True
EndFunc

Func _Vanquisher_FinishRun()
    Global $boolrun
    If $g_b_Vanquisher_RunFinished Then Return
    $g_b_Vanquisher_RunFinished = True
    If IsFunc("_ShouldStayInExplorableForQueuedRoute") And _ShouldStayInExplorableForQueuedRoute() Then
        CurrentAction("Vanquish complete - continuing caravan.")
    Else
        CurrentAction("Vanquish complete - returning to outpost.")
        _Vanquisher_ReturnToOutpost()
    EndIf
    If _Vanquisher_AdvanceZoneQueue() Then
        ; AdvanceZoneQueue resets AbortRoute/RunFinished. Keep the queue alive.
        CurrentAction("Advancing to next queued map.")
        Return
    EndIf
    $g_b_Vanquisher_AbortRoute = True
    $boolrun = False
    _Vanquisher_OnBotStopped()
    CurrentAction("All queued maps finished.")
EndFunc

Func _Vanquisher_IsVanquishIncomplete()
    If Not Map_GetInstanceInfo("IsExplorable") Then Return False
    If GetAreaVanquished() Then Return False
    Local $l_i_Remaining = GetFoesToKill()
    Return $l_i_Remaining > 0 Or $g_b_Vanquisher_HasRunRoute
EndFunc

Func _Vanquisher_IsAlreadyVanquishedOnEntry()
    Return False
EndFunc

Func _Vanquisher_ResignToOutpost()
    CurrentAction("Resigning to outpost.")
    Chat_SendChat("resign", "/")
    Sleep(3000)
    If $Map_To_Zone > 0 Then
        WaitMapLoading($Map_To_Zone, 30000)
    Else
        Map_WaitMapLoading(30000)
        _Vanquisher_CacheCombatAIForCurrentMap()
    EndIf
    Return Not Map_GetInstanceInfo("IsExplorable")
EndFunc

Func _Vanquisher_AbortCurrentRouteToZoneEntry()
    $g_b_Vanquisher_AbortRoute = True
    $DeadOnTheRun = 0
    _Vanquisher_ResetGoOutRouteProgress()
    CurrentAction("Party wiped - resigning to zone entry.")
    Return _Vanquisher_ResignToOutpost()
EndFunc

Func _Vanquisher_ResignIfDead()
    If Death() <> 1 And Not GetIsDead(-2) Then Return False
    Return _Vanquisher_ResignToOutpost()
EndFunc

Func _Vanquisher_UseDeathPenaltyItems()
    If Death() = 1 Or GetIsDead(-2) Then Return
    _Vanquisher_UseFirstInventoryItemByModelIDs($VANQUISHER_DEATH_MODEL_IDS)
EndFunc

Func _Vanquisher_IsVanquishComplete()
    Return GetAreaVanquished()
EndFunc

Global $g_h_Vanquisher_CheckAreaTimer = 0

; Used by EOTN/NF map routes: exit when vanquish is done, or after waiting at the end point.
Func CheckArea($aX, $aY, $a_i_TimeoutMs = 0)
    If GetAreaVanquished() Then Return True

    Local $l_t_Me = GetAgentByID(-2)
    Local $l_f_X = DllStructGetData($l_t_Me, "X")
    Local $l_f_Y = DllStructGetData($l_t_Me, "Y")
    If ComputeDistance($l_f_X, $l_f_Y, $aX, $aY) >= 500 Then
        $g_h_Vanquisher_CheckAreaTimer = 0
        Return False
    EndIf

    If $g_h_Vanquisher_CheckAreaTimer = 0 Then $g_h_Vanquisher_CheckAreaTimer = TimerInit()
    If $a_i_TimeoutMs > 0 And TimerDiff($g_h_Vanquisher_CheckAreaTimer) >= $a_i_TimeoutMs Then Return True
    Return False
EndFunc

Func _Vanquisher_ReturnToOutpost()
    If Not Map_GetInstanceInfo("IsExplorable") Then Return True
    If _Vanquisher_IsAscalonCaravanZone() Then Return True

    CurrentAction("Returning to outpost.")
    If Not GetIsDead(-2) And Death() <> 1 Then
        Map_ReturnToOutpost()
        If $Map_To_Zone > 0 Then
            WaitMapLoading($Map_To_Zone, 30000)
        Else
            Map_WaitMapLoading(30000)
            _Vanquisher_CacheCombatAIForCurrentMap()
        EndIf
    EndIf

    Local $l_i_Tries = 0
    While Map_GetInstanceInfo("IsExplorable") And $l_i_Tries < 5
        _Vanquisher_ResignToOutpost()
        $g_b_Vanquisher_DeathResignPending = False
        If Not Map_GetInstanceInfo("IsExplorable") Then ExitLoop
        If $Map_To_Zone > 0 Then
            RndTravel($Map_To_Zone)
            WaitMapLoading($Map_To_Zone, 30000)
        EndIf
        $l_i_Tries += 1
    WEnd

    If Map_GetInstanceInfo("IsExplorable") Then
        CurrentAction("Still in explorable - try /resign manually.")
        Return False
    EndIf

    If IsFunc("_Vanquisher_ShutdownPathfinderForZone") Then _Vanquisher_ShutdownPathfinderForZone()
    _Vanquisher_UseDeathPenaltyItems()
    CurrentAction("Back in outpost.")
    Return True
EndFunc

Func GetIsHardMode()
    Return Party_GetPartyContextInfo("IsHardMode")
EndFunc

Func SwitchMode($a_i_Mode)
    Local $l_b_WantHM = ($a_i_Mode <> 0)
    Ui_SetDifficulty($l_b_WantHM)
    Sleep(300)
    If GetIsHardMode() = $l_b_WantHM Then Return True
    Game_SwitchMode($a_i_Mode)
    Sleep(300)
    Return GetIsHardMode() = $l_b_WantHM
EndFunc

Func _Vanquisher_ApplyDifficulty()
    If Not SwitchMode(1) Then
        CurrentAction("Hard Mode not set - be party leader in outpost.")
    EndIf
EndFunc

Func InitMapLoad()
    Return Map_InitMapIsLoaded()
EndFunc

Func Dialog($a_i_DialogID)
    Return Ui_Dialog($a_i_DialogID)
EndFunc

Func DonateFaction($a_s_Faction)
    If StringLeft($a_s_Faction, 1) = 'k' Then
        Return Core_SendPacket(0x10, $GC_I_HEADER_FACTION_DEPOSIT, 0, 0, $VANQUISHER_FACTION_DONATE_CHUNK)
    Else
        Return Core_SendPacket(0x10, $GC_I_HEADER_FACTION_DEPOSIT, 0, 1, $VANQUISHER_FACTION_DONATE_CHUNK)
    EndIf
EndFunc

Func AddHero($a_i_HeroId)
    Return Party_AddHero($a_i_HeroId)
EndFunc

Func KickAllHeroes()
    Return Party_KickAllHeroes()
EndFunc

Func GetHeroCount()
    Return Party_GetHeroCount()
EndFunc

Func GetHeroID($a_i_HeroNumber)
    Return Party_GetHeroID($a_i_HeroNumber)
EndFunc

Func ChangeTarget($a_v_Agent)
    If IsDllStruct($a_v_Agent) Then Return Agent_ChangeTarget(DllStructGetData($a_v_Agent, "Id"))
    Return Agent_ChangeTarget($a_v_Agent)
EndFunc

Func Attack($a_v_Agent, $a_b_CallTarget = False)
    Return Agent_Attack($a_v_Agent, $a_b_CallTarget)
EndFunc

Func CallTarget($a_v_Target)
    Return Agent_CallTarget($a_v_Target)
EndFunc

Func UseSkill($a_i_Slot, $a_v_Target, $a_b_CallTarget = False)
    Return Skill_UseSkill($a_i_Slot, $a_v_Target, $a_b_CallTarget)
EndFunc

Func GetHealth($a_i_Agent = -2)
    Return Agent_GetAgentInfo($a_i_Agent, "HP")
EndFunc

Func WithdrawGold($a_i_Amount = 0)
    Return Item_WithdrawGold($a_i_Amount)
EndFunc

Func DepositGold($a_i_Amount = 0)
    Return Item_DepositGold($a_i_Amount)
EndFunc

Func GetSunspearTitle()
    Return Title_GetTitleInfo($GC_E_TITLEID_SUNSPEAR, "CurrentPoints")
EndFunc

Func GetLightbringerTitle()
    Return Title_GetTitleInfo($GC_E_TITLEID_LIGHTBRINGER, "CurrentPoints")
EndFunc

Func GetAsuraTitle()
    Return Title_GetTitleInfo($GC_E_TITLEID_ASURAN, "CurrentPoints")
EndFunc

Func GetDeldrimorTitle()
    Return Title_GetTitleInfo($GC_E_TITLEID_DELDRIMOR, "CurrentPoints")
EndFunc

Func GetNornTitle()
    Return Title_GetTitleInfo($GC_E_TITLEID_NORN, "CurrentPoints")
EndFunc

Func GetVanguardTitle()
    Return Title_GetTitleInfo($GC_E_TITLEID_VANGUARD, "CurrentPoints")
EndFunc

Func TravelTo($a_i_MapID, $a_i_District = 0)
    If $a_i_MapID <= 0 Then Return False
    If GetMapID() = $a_i_MapID And Map_GetInstanceInfo("IsOutpost") Then Return True

    If Map_TravelTo($a_i_MapID, Map_GetCharacterInfo("Language"), Map_GetCharacterInfo("Region"), $a_i_District, True) Then
        _Vanquisher_CacheCombatAIForCurrentMap()
        If GetMapID() = $a_i_MapID Then Return True
    EndIf

    Return OutpostTravel($a_i_MapID)
EndFunc

Func GoNPC($a_v_Agent)
    Return Agent_GoNPC($a_v_Agent)
EndFunc

Func GoToNPC($a_v_Agent)
    Return Agent_GoNPC($a_v_Agent)
EndFunc

Func GetAgentExists($a_i_AgentID)
    Return Agent_GetAgentPtr($a_i_AgentID) <> 0
EndFunc

Func PingSleep($a_i_MsExtra = 0)
    Return Other_PingSleep($a_i_MsExtra)
EndFunc

Func _Vanquisher_ItemStructDef()
    Return 'long Id;long AgentId;byte Unknown1[4];ptr Bag;ptr ModStruct;long ModStructSize;ptr Customized;byte unknown2[4];byte Type;byte unknown4;short ExtraId;short Value;byte unknown4b[2];short Interaction;long ModelId;ptr ModString;byte unknown5[4];ptr NameString;ptr SingleItemName;byte Unknown4[10];byte IsSalvageable;byte Unknown6;byte Quantity;byte Equiped;byte Profession;byte Type2;byte Slot'
EndFunc

Func _Vanquisher_ItemTemplate()
    Static $gs_t_Item = 0
    If $gs_t_Item = 0 Then $gs_t_Item = DllStructCreate(_Vanquisher_ItemStructDef())
    Return $gs_t_Item
EndFunc

Func _Vanquisher_BagStructDef()
    Return 'byte unknown1[4];long index;long id;ptr containerItem;long ItemsCount;ptr bagArray;ptr itemArray;long fakeSlots;long slots'
EndFunc

Func _Vanquisher_BagTemplate()
    Static $gs_t_Bag = 0
    If $gs_t_Bag = 0 Then $gs_t_Bag = DllStructCreate(_Vanquisher_BagStructDef())
    Return $gs_t_Bag
EndFunc

Func GetBag($a_i_Bag)
    Local $l_t_Bag = _Vanquisher_BagTemplate()
    Local $l_p_Bag = Item_GetBagPtr($a_i_Bag)
    If $l_p_Bag = 0 Then Return $l_t_Bag
    Memory_ReadToStruct($l_p_Bag, $l_t_Bag)
    Return $l_t_Bag
EndFunc

Func GetItemBySlot($a_i_Bag, $a_i_Slot)
    Local $l_t_Item = _Vanquisher_ItemTemplate()
    Local $l_p_Item = Item_GetItemBySlot($a_i_Bag, $a_i_Slot)
    If $l_p_Item = 0 Then Return $l_t_Item
    Memory_ReadToStruct($l_p_Item, $l_t_Item)
    Return $l_t_Item
EndFunc

Func GetItemByItemID($a_i_ItemID)
    Local $l_t_Item = _Vanquisher_ItemTemplate()
    Local $l_p_Item = Item_GetItemPtr($a_i_ItemID)
    If $l_p_Item = 0 Then Return $l_t_Item
    Memory_ReadToStruct($l_p_Item, $l_t_Item)
    Return $l_t_Item
EndFunc

Func IdentifyItem($a_v_Item)
    Return Item_IdentifyItem($a_v_Item)
EndFunc

Func SellItem($a_v_Item, $a_i_Quantity = 0)
    Return Merchant_SellItem($a_v_Item, $a_i_Quantity)
EndFunc

Func MoveItem($a_v_Item, $a_i_Bag, $a_i_Slot)
    Return Item_MoveItem($a_v_Item, $a_i_Bag, $a_i_Slot)
EndFunc

Func FindIDKit()
    For $l_i_Bag = 1 To 16
        Local $l_i_Slots = Item_GetBagInfo($l_i_Bag, "Slots")
        For $l_i_Slot = 1 To $l_i_Slots
            Local $l_p_Item = Item_GetItemBySlot($l_i_Bag, $l_i_Slot)
            If $l_p_Item = 0 Then ContinueLoop
            Local $l_i_Model = Item_GetItemInfoByPtr($l_p_Item, "ModelID")
            If $l_i_Model = 2989 Or $l_i_Model = 5899 Then
                Return Item_GetItemInfoByPtr($l_p_Item, "ItemID")
            EndIf
        Next
    Next
    Return 0
EndFunc

Func BuyIDKit($a_i_Quantity = 1)
    Return Merchant_BuyItem(5899, $a_i_Quantity)
EndFunc

Func FindEmptySlot($a_i_BagIndex)
    Local $l_i_Slots = Item_GetBagInfo($a_i_BagIndex, "Slots")
    For $l_i_Slot = 1 To $l_i_Slots
        If Item_GetItemBySlot($a_i_BagIndex, $l_i_Slot) = 0 Then
            SetExtended($l_i_Slot)
            Return $l_i_Slot
        EndIf
    Next
    SetExtended(0)
    Return 0
EndFunc

Func _Vanquisher_SkillbarStructDef()
    Return "long AgentId;long AdrenalineA1;long AdrenalineB1;dword Recharge1;dword Id1;dword Event1;" & _
        "long AdrenalineA2;long AdrenalineB2;dword Recharge2;dword Id2;dword Event2;" & _
        "long AdrenalineA3;long AdrenalineB3;dword Recharge3;dword Id3;dword Event3;" & _
        "long AdrenalineA4;long AdrenalineB4;dword Recharge4;dword Id4;dword Event4;" & _
        "long AdrenalineA5;long AdrenalineB5;dword Recharge5;dword Id5;dword Event5;" & _
        "long AdrenalineA6;long AdrenalineB6;dword Recharge6;dword Id6;dword Event6;" & _
        "long AdrenalineA7;long AdrenalineB7;dword Recharge7;dword Id7;dword Event7;" & _
        "long AdrenalineA8;long AdrenalineB8;dword Recharge8;dword Id8;dword Event8;dword disabled;byte unknown[8];dword Casting"
EndFunc

Func _Vanquisher_SkillbarTemplate()
    Static $gs_t_Skillbar = 0
    If $gs_t_Skillbar = 0 Then $gs_t_Skillbar = DllStructCreate(_Vanquisher_SkillbarStructDef())
    Return $gs_t_Skillbar
EndFunc

Func GetSkillBar($a_i_HeroNumber = 0)
    Local $l_t_Skillbar = _Vanquisher_SkillbarTemplate()

    For $l_i_Slot = 1 To 8
        DllStructSetData($l_t_Skillbar, "Recharge" & $l_i_Slot, Skill_GetSkillbarInfo($l_i_Slot, "Recharge", $a_i_HeroNumber))
        DllStructSetData($l_t_Skillbar, "AdrenalineA" & $l_i_Slot, Skill_GetSkillbarInfo($l_i_Slot, "Adrenaline", $a_i_HeroNumber))
    Next
    Return $l_t_Skillbar
EndFunc

Func GetNearestNPCToCoords($a_f_X, $a_f_Y)
    Local $l_ap_Agents = Agent_GetAgentArray($GC_I_AGENT_TYPE_LIVING)
    Local $l_p_Best = 0
    Local $l_f_BestDist = 100000000

    If Not IsArray($l_ap_Agents) Or $l_ap_Agents[0] = 0 Then Return 0

    For $l_i_Idx = 1 To $l_ap_Agents[0]
        Local $l_p_Agent = $l_ap_Agents[$l_i_Idx]
        If Agent_GetAgentInfo($l_p_Agent, "Allegiance") <> 6 Then ContinueLoop
        If Agent_GetAgentInfo($l_p_Agent, "HP") <= 0 Then ContinueLoop
        Local $l_f_Dist = ($a_f_X - Agent_GetAgentInfo($l_p_Agent, "X")) ^ 2 + ($a_f_Y - Agent_GetAgentInfo($l_p_Agent, "Y")) ^ 2
        If $l_f_Dist < $l_f_BestDist Then
            $l_f_BestDist = $l_f_Dist
            $l_p_Best = $l_p_Agent
        EndIf
    Next

    If $l_p_Best = 0 Then Return 0
    Return GetAgentByID(Agent_GetAgentInfo($l_p_Best, "ID"))
EndFunc

Func GetNearestWormSpoorToCoords($a_f_X, $a_f_Y, $a_f_Range = 2500)
    Local $l_p_Agent = GetAgentsFromXY($a_f_X, $a_f_Y, $a_f_Range, 0, 1, "WormSpoorFilter")
    If $l_p_Agent = 0 Then Return 0
    Return GetAgentByID(Agent_GetAgentInfo($l_p_Agent, "ID"))
EndFunc

Func _Vanquisher_GetSkillSlotByID($a_i_SkillID, $a_i_Hero = 0)
    For $l_i_Slot = 1 To 8
        If Skill_GetSkillbarInfo($l_i_Slot, "SkillID", $a_i_Hero) = $a_i_SkillID Then Return $l_i_Slot
    Next
    Return 0
EndFunc

Func _Vanquisher_IsInJunundu()
    Return _Vanquisher_GetSkillSlotByID($JUNUNDU_SKILL_LEAVE) <> 0
EndFunc

Func _Vanquisher_JununduCanCastSkill($a_i_SkillID)
    If $a_i_SkillID = $JUNUNDU_SKILL_LEAVE Then Return False
    Local $l_i_Slot = _Vanquisher_GetSkillSlotByID($a_i_SkillID)
    If $l_i_Slot = 0 Then Return False
    If Not IsRecharged($l_i_Slot) Then Return False
    If $a_i_SkillID = $JUNUNDU_SKILL_SMASH Then
        Local $l_i_Required = Skill_GetSkillInfo($JUNUNDU_SKILL_SMASH, "Adrenaline")
        If $l_i_Required > 0 And Skill_GetSkillbarInfo($l_i_Slot, "Adrenaline") < $l_i_Required Then Return False
    EndIf
    Local $l_i_EnergyCost = Skill_GetSkillInfo($a_i_SkillID, "EnergyCost")
    If GetEnergy(-2) < $l_i_EnergyCost Then Return False
    Return True
EndFunc

Func _Vanquisher_JununduTryCast($a_i_SkillID, $a_i_Target = -2)
    If $a_i_SkillID = $JUNUNDU_SKILL_LEAVE Then Return False
    If $a_i_Target = 0 Then Return False
    Local $l_i_Slot = _Vanquisher_GetSkillSlotByID($a_i_SkillID)
    If $l_i_Slot = 0 Then Return False
    If Not _Vanquisher_JununduCanCastSkill($a_i_SkillID) Then Return False
    UseSkillEx($l_i_Slot, $a_i_Target)
    Return True
EndFunc
#EndRegion
