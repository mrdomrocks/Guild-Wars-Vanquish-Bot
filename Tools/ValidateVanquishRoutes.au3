#NoTrayIcon
; Native AutoIt vanquish route validator (replaces validate_vanquish_routes.py).
; Run: AutoIt3.exe "Tools\ValidateVanquishRoutes.au3"
; Or from bot root with working directory = Tools, or double-click.

#include <File.au3>

Global Const $GC_S_ROOT = _VR_ResolveRoot()
Global Const $GC_S_MAPS = $GC_S_ROOT & "\Maps"
Global Const $GC_S_LOCATIONS = $GC_S_MAPS & "\LocationsIDS.au3"
Global Const $GC_S_ROUTES = $GC_S_ROOT & "\Core\Vanquish_Routes.au3"

Global $g_aVR_Errors[0]
Global $g_aVR_Warnings[0]
Global $g_aVR_LocationIds[0][2] ; name, value

Main()

Func Main()
    If Not FileExists($GC_S_LOCATIONS) Then
        ConsoleWrite("ERROR: missing " & $GC_S_LOCATIONS & @CRLF)
        Exit 1
    EndIf

    _VR_LoadLocationIds()
    Local $aIncluded = _VR_ParseIncludedMaps()
    _VR_ValidateIncludes($aIncluded)
    _VR_ValidateCaravanPortalController()
    _VR_ValidateMaguumaCaravanExpansion()
    _VR_ValidateAscalonCaravanExpansion()

    Local $i = 0
    For $i = 0 To UBound($aIncluded) - 1
        If FileExists($aIncluded[$i]) Then _VR_ValidateMapFile($aIncluded[$i])
    Next

    Local $w = 0
    For $w = 0 To UBound($g_aVR_Warnings) - 1
        ConsoleWrite("WARNING: " & $g_aVR_Warnings[$w] & @CRLF)
    Next
    Local $e = 0
    For $e = 0 To UBound($g_aVR_Errors) - 1
        ConsoleWrite("ERROR: " & $g_aVR_Errors[$e] & @CRLF)
    Next

    ConsoleWrite("Validated " & UBound($aIncluded) & " included map scripts." & @CRLF)
    ConsoleWrite("Warnings: " & UBound($g_aVR_Warnings) & " | Errors: " & UBound($g_aVR_Errors) & @CRLF)
    If UBound($g_aVR_Errors) > 0 Then Exit 1
    Exit 0
EndFunc

Func _VR_ResolveRoot()
    Local $sDir = @ScriptDir
    If StringRight($sDir, 6) = "\Tools" Or StringRight($sDir, 6) = "/Tools" Then
        Return StringTrimRight($sDir, 6)
    EndIf
    If FileExists($sDir & "\Maps\LocationsIDS.au3") Then Return $sDir
    If FileExists($sDir & "\..\Maps\LocationsIDS.au3") Then Return _PathFull($sDir & "\..")
    Return $sDir
EndFunc

Func _VR_AddError($sMsg)
    Local $n = UBound($g_aVR_Errors)
    ReDim $g_aVR_Errors[$n + 1]
    $g_aVR_Errors[$n] = $sMsg
EndFunc

Func _VR_AddWarning($sMsg)
    Local $n = UBound($g_aVR_Warnings)
    ReDim $g_aVR_Warnings[$n + 1]
    $g_aVR_Warnings[$n] = $sMsg
EndFunc

Func _VR_Rel($sPath)
    Local $sRoot = $GC_S_ROOT
    If StringLeft($sPath, StringLen($sRoot)) = $sRoot Then
        Local $sRel = StringTrimLeft($sPath, StringLen($sRoot))
        If StringLeft($sRel, 1) = "\" Or StringLeft($sRel, 1) = "/" Then $sRel = StringTrimLeft($sRel, 1)
        Return StringReplace($sRel, "/", "\")
    EndIf
    Return $sPath
EndFunc

Func _VR_ReadText($sPath)
    Local $h = FileOpen($sPath, 0) ; $FO_READ
    If $h = -1 Then Return ""
    Local $s = FileRead($h)
    FileClose($h)
    Return $s
EndFunc

Func _VR_LoadLocationIds()
    ReDim $g_aVR_LocationIds[0][2]
    Local $sText = _VR_ReadText($GC_S_LOCATIONS)
    Local $aMatches = StringRegExp($sText, "Global\s+\$([A-Za-z0-9_]+)\s*=\s*([^;\r\n]+)", 3)
    If Not IsArray($aMatches) Then Return
    Local $i = 0
    While $i < UBound($aMatches) - 1
        Local $n = UBound($g_aVR_LocationIds)
        ReDim $g_aVR_LocationIds[$n + 1][2]
        $g_aVR_LocationIds[$n][0] = $aMatches[$i]
        $g_aVR_LocationIds[$n][1] = StringStripWS($aMatches[$i + 1], 3)
        $i += 2
    WEnd
EndFunc

Func _VR_HasLocationId($sName)
    Local $i = 0
    For $i = 0 To UBound($g_aVR_LocationIds) - 1
        If $g_aVR_LocationIds[$i][0] = $sName Then Return True
    Next
    Return False
EndFunc

Func _VR_NormalizeMapName($sScriptName)
    If StringLeft($sScriptName, 15) = "CaravanAscalon_" Then Return StringTrimLeft($sScriptName, 15)
    If StringLeft($sScriptName, 15) = "CaravanMaguuma_" Then Return StringTrimLeft($sScriptName, 15)
    Return $sScriptName
EndFunc

Func _VR_ExpectedRouteFunction($sScriptName)
    Local $sNormalized = _VR_NormalizeMapName($sScriptName)
    If $sNormalized = "IceDome" Then Return "VQIcedome"
    If StringLeft($sScriptName, 15) = "CaravanAscalon_" Then Return "VQCaravanAscalon_" & StringTrimLeft($sScriptName, 15)
    If StringLeft($sScriptName, 15) = "CaravanMaguuma_" Then Return "VQCaravanMaguuma_" & StringTrimLeft($sScriptName, 15)
    If StringLeft($sScriptName, 13) = "SpecialRoute_" Then Return "VQ" & $sScriptName
    Return "VQ" & $sScriptName
EndFunc

Func _VR_ParseIncludedMaps()
    Local $aIncluded[0]
    Local $sText = _VR_ReadText($GC_S_ROUTES)
    Local $aMatches = StringRegExp($sText, '#include\s+"\.\.\\Maps\\(.+?\.au3)"', 3)
    If Not IsArray($aMatches) Then Return $aIncluded
    Local $i = 0
    For $i = 0 To UBound($aMatches) - 1
        Local $sRel = StringReplace($aMatches[$i], "/", "\")
        Local $n = UBound($aIncluded)
        ReDim $aIncluded[$n + 1]
        $aIncluded[$n] = $GC_S_MAPS & "\" & $sRel
    Next
    Return $aIncluded
EndFunc

Func _VR_FileNameOnly($sPath)
    Local $i = StringInStr($sPath, "\", 0, -1)
    If $i = 0 Then $i = StringInStr($sPath, "/", 0, -1)
    If $i = 0 Then Return $sPath
    Return StringTrimLeft($sPath, $i)
EndFunc

Func _VR_FileStem($sPath)
    Local $sName = _VR_FileNameOnly($sPath)
    If StringRight($sName, 4) = ".au3" Then Return StringTrimRight($sName, 4)
    Return $sName
EndFunc

Func _VR_ParentFolderName($sPath)
    Local $sDir = StringTrimRight($sPath, StringLen(_VR_FileNameOnly($sPath)))
    $sDir = StringTrimRight($sDir, 1)
    Return _VR_FileNameOnly($sDir)
EndFunc

Func _VR_ValidateMapFile($sPath)
    Local $sRel = _VR_Rel($sPath)
    Local $sText = _VR_ReadText($sPath)
    Local $sScriptName = _VR_FileStem($sPath)
    Local $sNormalized = _VR_NormalizeMapName($sScriptName)

    Local $sMapVar = $sNormalized & "_Map"
    If $sScriptName = "IceDome" Then $sMapVar = "Icedome_Map"
    If StringLeft($sScriptName, 13) <> "SpecialRoute_" Then
        If Not _VR_HasLocationId($sMapVar) Then _VR_AddError($sRel & ": missing location id $" & $sMapVar)
    EndIf

    Local $sRouteFunc = _VR_ExpectedRouteFunction($sScriptName)
    If Not StringRegExp($sText, "Func\s+" & $sRouteFunc & "\s*\(") Then
        _VR_AddError($sRel & ": missing route function " & $sRouteFunc & "()")
    EndIf

    Local $bCaravan = StringLeft($sScriptName, 7) = "Caravan"
    Local $bSpecial = StringLeft($sScriptName, 13) = "SpecialRoute_"
    Local $bOldAscalon = ($sScriptName = "OldAscalon" Or $sScriptName = "CaravanAscalon_OldAscalon")

    If $bOldAscalon Then
        If $sScriptName = "OldAscalon" And Not StringInStr($sText, "$oldAscalon") Then
            _VR_AddError($sRel & ": expected $oldAscalon waypoint array")
        EndIf
        If $sScriptName = "CaravanAscalon_OldAscalon" And Not StringInStr($sText, "Global $aCaravan") Then
            _VR_AddWarning($sRel & ": caravan OldAscalon still uses local waypoint data")
        EndIf
        Return
    EndIf

    If $bSpecial Then Return

    If $bCaravan Then
        Local $aRefs = StringRegExp($sText, "\$a\w+Route0[12]", 3)
        If Not IsArray($aRefs) Or UBound($aRefs) < 1 Then
            _VR_AddError($sRel & ": caravan script does not reference shared route arrays")
            Return
        EndIf
        Local $r = 0
        For $r = 0 To UBound($aRefs) - 1
            Local $sSource = StringTrimLeft($aRefs[$r], 2)
            If Not StringInStr($sSource, $sNormalized) Then
                _VR_AddWarning($sRel & ": caravan route reference " & $aRefs[$r] & " may not match map " & $sNormalized)
            EndIf
        Next
        If StringRegExp($sText, "Global \$aCaravan") Then
            _VR_AddError($sRel & ": still defines duplicate caravan route arrays")
        EndIf
        Return
    EndIf

    If Not StringRegExp($sText, "\$a\w+Route01") Then
        If Not StringInStr($sText, "MoveandAggroVQ") And Not StringInStr($sText, "_Vanquisher_RunVanquishRoute") And Not StringInStr($sText, "AggroMoveTo") Then
            _VR_AddWarning($sRel & ": no Route01 array or known route runner found")
        EndIf
    EndIf
EndFunc

Func _VR_ValidateIncludes(ByRef $aIncluded)
    Local $aDiscovered[0]
    Local $hFolder = FileFindFirstFile($GC_S_MAPS & "\*")
    If $hFolder = -1 Then Return
    While 1
        Local $sFolder = FileFindNextFile($hFolder)
        If @error Then ExitLoop
        If StringLeft($sFolder, 1) = "." Then ContinueLoop
        If $sFolder = "_Templates" Then ContinueLoop
        If Not StringInStr(FileGetAttrib($GC_S_MAPS & "\" & $sFolder), "D") Then ContinueLoop

        Local $hFile = FileFindFirstFile($GC_S_MAPS & "\" & $sFolder & "\*.au3")
        If $hFile = -1 Then ContinueLoop
        While 1
            Local $sFile = FileFindNextFile($hFile)
            If @error Then ExitLoop
            If $sFile = "LocationsIDS.au3" Then ContinueLoop
            Local $n = UBound($aDiscovered)
            ReDim $aDiscovered[$n + 1]
            $aDiscovered[$n] = _PathFull($GC_S_MAPS & "\" & $sFolder & "\" & $sFile)
        WEnd
        FileClose($hFile)
    WEnd
    FileClose($hFolder)

    Local $i = 0
    Local $j = 0
    For $i = 0 To UBound($aDiscovered) - 1
        Local $bFound = False
        For $j = 0 To UBound($aIncluded) - 1
            If StringCompare(_PathFull($aIncluded[$j]), $aDiscovered[$i], 0) = 0 Then
                $bFound = True
                ExitLoop
            EndIf
        Next
        If Not $bFound Then _VR_AddWarning(_VR_Rel($aDiscovered[$i]) & ": map exists on disk but is not included in Vanquish_Routes.au3")
    Next

    For $i = 0 To UBound($aIncluded) - 1
        If Not FileExists($aIncluded[$i]) Then
            _VR_AddError(_VR_Rel($aIncluded[$i]) & ": included in Vanquish_Routes.au3 but file is missing")
        EndIf
    Next
EndFunc

Func _VR_ValidateCaravanPortalController()
    Local $sPath = $GC_S_ROOT & "\Core\Caravan_PortalController.au3"
    If Not FileExists($sPath) Then
        _VR_AddError(_VR_Rel($sPath) & ": missing caravan portal controller")
        Return
    EndIf
    Local $aLines = StringSplit(StringReplace(_VR_ReadText($sPath), @CR, ""), @LF, 1)
    Local $i = 1
    For $i = 1 To $aLines[0]
        Local $aCode = StringSplit($aLines[$i], ";", 1)
        Local $sCode = $aCode[1]
        Local $aM = StringRegExp($sCode, "IsFunc\(\s*\$s\w+\s*\)", 1)
        If IsArray($aM) Then
            _VR_AddError(_VR_Rel($sPath) & ":" & $i & ": " & $aM[0] & " guards a string name; Call() string function names must not use IsFunc()")
        EndIf
    Next
EndFunc

Func _VR_RequireNeedle($sBody, $sNeedle, $sRel)
    If Not StringInStr($sBody, $sNeedle) Then _VR_AddError($sRel & ": missing " & $sNeedle)
EndFunc

Func _VR_ValidateAscalonCaravanExpansion()
    Local $sBot = $GC_S_ROOT & "\Guild Wars Vanquish Bot.au3"
    Local $sBotRel = _VR_Rel($sBot)
    Local $sText = _VR_ReadText($sBot)
    If Not StringInStr($sText, "VQSpecialRoute_TempleOfTheAgesAscalonCaravan") Then
        _VR_AddError($sBotRel & ": Ascalon special route must register VQSpecialRoute_TempleOfTheAgesAscalonCaravan")
    EndIf
    If StringInStr($sText, "_AppendTempleAscalonCaravanQueue($aChecked") Then
        _VR_AddError($sBotRel & ": TOA Ascalon Caravan must queue the special runner, not expand+skip completed maps")
    EndIf
    If StringInStr($sText, "TOA Ascalon Caravan") Then
        Local $aParts = StringSplit($sText, "TOA Ascalon Caravan", 1)
        If $aParts[0] >= 2 Then
            Local $aBlock = StringSplit($aParts[2], "TOA Maguuma Caravan", 1)
            Local $sBlock = $aBlock[1]
            If Not StringInStr($sBlock, "VQSpecialRoute_TempleOfTheAgesAscalonCaravan") Then
                _VR_AddError($sBotRel & ": TOA Ascalon Caravan must register VQSpecialRoute_TempleOfTheAgesAscalonCaravan")
            EndIf
            If Not StringRegExp($sBlock, "\$g_aMapEntries\[\$iNext\]\[4\]\s*=\s*0\b") Then
                _VR_AddError($sBotRel & ": TOA Ascalon Caravan map id must be 0 so history scan cannot mark it vanquished")
            EndIf
        EndIf
    EndIf

    Local $sSpecial = $GC_S_MAPS & "\Caravan_Ascalon\SpecialRoute_TempleOfTheAgesAscalonCaravan.au3"
    Local $sSpecialRel = _VR_Rel($sSpecial)
    If Not FileExists($sSpecial) Then
        _VR_AddError($sSpecialRel & ": missing Ascalon special route runner")
    Else
        Local $sBody = _VR_ReadText($sSpecial)
        Local $aNeedles[13] = [ _
                "Func VQSpecialRoute_TempleOfTheAgesAscalonCaravan(", _
                "_Vanquisher_AscalonCaravanGoOutToMap", _
                "_Vanquisher_AscalonCaravanRunVanquish", _
                "_Vanquisher_AscalonCaravanAdvanceAfterVanquish", _
                "_Vanquisher_AscalonCaravanFirstIncompleteStage", _
                "_Vanquisher_AscalonCaravanIsStageHistoricallyVanquished", _
                "_Vanquisher_AscalonCaravanStageForCurrentMap", _
                "_Vanquisher_IsOnAscalonCaravanSpine", _
                "_TempleAscalonCaravanTryCatchUp", _
                "already vanquished per map scan", _
                "Portaling to ", _
                "Portal pathing to ", _
                "$g_i_Vanquisher_CombinedAscalonStage = $iFirstIncomplete" _
                ]
        If StringInStr($sBody, "Traveling to outpost for NorthKrytaProvince") Or _
                StringInStr($sBody, "Traveling to outpost for TravelersVale") Or _
                StringInStr($sBody, "Traveling to outpost for ScoundrelsRise") Then
            _VR_AddError($sSpecialRel & ": Ascalon must not TravelTo mid-route outposts; enter at TOA and portal the spine")
        EndIf
        If Not StringInStr($sBody, "$g_a_AscalonCaravanPlan[0][1]") Then
            _VR_AddError($sSpecialRel & ": Ascalon GoOut must enter at TOA (plan stage 0 outpost), not mid-route outposts")
        EndIf
        If StringInStr($sBody, "$g_i_Vanquisher_CombinedAscalonStage = $iStart") Then
            _VR_AddError($sSpecialRel & ": Ascalon must set stage to first incomplete map, not spine start")
        EndIf
        Local $n = 0
        For $n = 0 To UBound($aNeedles) - 1
            _VR_RequireNeedle($sBody, $aNeedles[$n], $sSpecialRel)
        Next
    EndIf

    Local $sPlan = $GC_S_ROOT & "\Core\Caravan_AscalonPlan.au3"
    Local $sPlanRel = _VR_Rel($sPlan)
    If Not FileExists($sPlan) Then
        _VR_AddError($sPlanRel & ": missing Ascalon caravan plan")
    Else
        Local $sPlanText = _VR_ReadText($sPlan)
        Local $aLabels[19] = [ _
                "TheBlackCurtain", "CursedLands", "NeboTerrace", "NorthKrytaProvince", "ScoundrelsRise", _
                "GriffonsMouth", "DeldrimorBowl", "AnvilRock", "IronHorseMine", "TravelersVale", _
                "AscalonFoothills", "DiessaLowlands", "FlameTempleCorridor", "DragonsGullet", "TheBreach", _
                "OldAscalon", "RegentValley", "PockmarkFlats", "EasternFrontier" _
                ]
        Local $l = 0
        For $l = 0 To UBound($aLabels) - 1
            If Not StringInStr($sPlanText, $aLabels[$l]) Then _VR_AddError($sPlanRel & ": plan must include " & $aLabels[$l])
        Next
        Local $aPlanNeedles[5] = [ _
                "_Vanquisher_AscalonCaravanFirstIncompleteStage", _
                "_Vanquisher_AscalonCaravanStageForCurrentMap", _
                "_Vanquisher_IsOnAscalonCaravanSpine", _
                "_Vanquisher_AscalonCaravanIsStageHistoricallyVanquished", _
                "CaravanAscalon_TheBlackCurtain" _
                ]
        For $l = 0 To UBound($aPlanNeedles) - 1
            _VR_RequireNeedle($sPlanText, $aPlanNeedles[$l], $sPlanRel)
        Next
    EndIf

    Local $sRoutes = _VR_ReadText($GC_S_ROUTES)
    If Not StringInStr($sRoutes, "SpecialRoute_TempleOfTheAgesAscalonCaravan.au3") Then
        _VR_AddError(_VR_Rel($GC_S_ROUTES) & ": must include Ascalon special route runner")
    EndIf
EndFunc

Func _VR_ValidateMaguumaCaravanExpansion()
    Local $sBot = $GC_S_ROOT & "\Guild Wars Vanquish Bot.au3"
    Local $sBotRel = _VR_Rel($sBot)
    Local $sText = _VR_ReadText($sBot)
    If Not StringInStr($sText, "VQSpecialRoute_TempleOfTheAgesMaguumaCaravan") Then
        _VR_AddError($sBotRel & ": Maguuma special route must register VQSpecialRoute_TempleOfTheAgesMaguumaCaravan")
    EndIf
    If StringInStr($sText, "TOA Maguuma Caravan") Then
        Local $aParts = StringSplit($sText, "TOA Maguuma Caravan", 1)
        If $aParts[0] >= 2 Then
            Local $aBlock = StringSplit($aParts[2], "EndFunc", 1)
            Local $sBlock = $aBlock[1]
            If StringInStr($sBlock, "$TalmarkWilderness_Map") Or Not StringRegExp($sBlock, "\$g_aMapEntries\[\$iNext \+ 1\]\[4\]\s*=\s*0\b") Then
                _VR_AddError($sBotRel & ": TOA Maguuma Caravan map id must be 0 so history scan cannot mark it vanquished")
            EndIf
        EndIf
    EndIf
    If Not StringInStr($sText, "Or _IsSpecialRouteScriptName(") Then
        _VR_AddError($sBotRel & ": vanquish history scan must skip special caravan routes")
    EndIf

    Local $sSpecial = $GC_S_MAPS & "\Caravan_Maguuma\SpecialRoute_TempleOfTheAgesMaguumaCaravan.au3"
    Local $sSpecialRel = _VR_Rel($sSpecial)
    If Not FileExists($sSpecial) Then
        _VR_AddError($sSpecialRel & ": missing Maguuma special route runner")
    Else
        Local $sBody = _VR_ReadText($sSpecial)
        Local $aNeedles[15] = [ _
                "Func VQSpecialRoute_TempleOfTheAgesMaguumaCaravan(", _
                "_Vanquisher_MaguumaCaravanGoOutToMap", _
                "_Vanquisher_MaguumaCaravanRunVanquish", _
                "_Vanquisher_MaguumaCaravanAdvanceAfterVanquish", _
                "_Vanquisher_MaguumaCaravanFirstIncompleteStage", _
                "_Vanquisher_MaguumaCaravanIsStageHistoricallyVanquished", _
                "_Vanquisher_MaguumaCaravanStageForCurrentMap", _
                "_Vanquisher_IsOnMaguumaCaravanSpine", _
                "_TempleAscalonCaravanTryCatchUp", _
                "_TempleAscalonCaravanCanDirectTransition", _
                "_Vanquisher_ReturnToOutpost", _
                "already vanquished per map scan", _
                "Portaling to ", _
                "Portal pathing to ", _
                "$g_i_Vanquisher_CombinedMaguumaStage = $iFirstIncomplete" _
                ]
        If StringInStr($sBody, "_Vanquisher_MaguumaCaravanIsVanquishedAfterLoad") Or _
                StringInStr($sBody, "checking vanquish state") Or _
                StringInStr($sBody, "already clear in this instance") Then
            _VR_AddError($sSpecialRel & ": per-map-load vanquish settle/check must be removed; use connect-time map scan only")
        EndIf
        If StringInStr($sBody, "Traveling to outpost for SageLands") Then
            _VR_AddError($sSpecialRel & ": Maguuma must not TravelTo mid-route outposts; enter at TOA and portal the spine")
        EndIf
        If Not StringInStr($sBody, "$g_a_MaguumaCaravanPlan[0][1]") Then
            _VR_AddError($sSpecialRel & ": Maguuma GoOut must enter at TOA (plan stage 0 outpost), not mid-route outposts")
        EndIf
        If StringInStr($sBody, "$g_i_Vanquisher_CombinedMaguumaStage = $iStart") Then
            _VR_AddError($sSpecialRel & ": Maguuma must set stage to first incomplete map, not spine start")
        EndIf
        Local $n = 0
        For $n = 0 To UBound($aNeedles) - 1
            _VR_RequireNeedle($sBody, $aNeedles[$n], $sSpecialRel)
        Next
        If StringInStr($sBody, "Resigning for next map.") And Not StringInStr($sBody, "Portaling to ") Then
            _VR_AddError($sSpecialRel & ": Maguuma must portal between maps when a path exists")
        EndIf
    EndIf

    Local $sPlan = $GC_S_ROOT & "\Core\Caravan_MaguumaPlan.au3"
    Local $sPlanRel = _VR_Rel($sPlan)
    If Not FileExists($sPlan) Then
        _VR_AddError($sPlanRel & ": missing Maguuma caravan plan")
    Else
        Local $sPlanText = _VR_ReadText($sPlan)
        Local $aLabels[10] = ["TalmarkWilderness", "MajestysRest", "SageLands", "MamnoonLagoon", "Silverwood", "EttinsBack", "ReedBog", "TheFalls", "DryTop", "TangleRoot"]
        Local $l = 0
        For $l = 0 To UBound($aLabels) - 1
            If Not StringInStr($sPlanText, $aLabels[$l]) Then _VR_AddError($sPlanRel & ": plan must include " & $aLabels[$l])
        Next
        If StringInStr($sPlanText, "MajestysRest -> SageLands") And StringInStr($sPlanText, "Resign+TravelTo only when") Then
            _VR_AddError($sPlanRel & ": MajestysRest -> SageLands is a continuous portal, not a resign break")
        EndIf
        If Not StringInStr($sPlanText, "$SageLands_Transit") Then
            _VR_AddError($sPlanRel & ": SageLands stage must use $SageLands_Transit (Majesty's Rest)")
        EndIf
        If Not StringInStr($sPlanText, "$MamnoonLagoon_Transit2") Then
            _VR_AddError($sPlanRel & ": Mamnoon stage must use $MamnoonLagoon_Transit2 (Sage Lands)")
        EndIf
        Local $aPlanNeedles[6] = [ _
                "_Vanquisher_MaguumaCaravanFirstIncompleteStage", _
                "_Vanquisher_MaguumaCaravanStageForCurrentMap", _
                "_Vanquisher_IsOnMaguumaCaravanSpine", _
                "_Vanquisher_IsMapIdHistoricallyVanquished", _
                "_Vanquisher_IsCaravanMapHistoricallyVanquished", _
                "CaravanMaguuma_TalmarkWilderness" _
                ]
        For $l = 0 To UBound($aPlanNeedles) - 1
            _VR_RequireNeedle($sPlanText, $aPlanNeedles[$l], $sPlanRel)
        Next
        If StringInStr($sPlanText, 'IsFunc("_Vanquisher_ReadLiveHistoryBitForMapId")') Or _
                StringInStr($sPlanText, "IsFunc('_Vanquisher_ReadLiveHistoryBitForMapId')") Then
            _VR_AddError($sPlanRel & ": IsFunc(""name"") is always false; call _Vanquisher_ReadLiveHistoryBitForMapId directly")
        EndIf
        If Not StringInStr($sPlanText, "_Vanquisher_ReadLiveHistoryBitForMapId($iMapID)") Then
            _VR_AddError($sPlanRel & ": history check must call live VanquishedAreasArray bit reader")
        EndIf
    EndIf

    Local $sCompat = $GC_S_ROOT & "\Core\Vanquisher_Compat.au3"
    Local $sCompatRel = _VR_Rel($sCompat)
    Local $sCompatText = _VR_ReadText($sCompat)
    If Not StringInStr($sCompatText, "_Vanquisher_ReadLiveHistoryBitForMapId") Then
        _VR_AddError($sCompatRel & ": missing _Vanquisher_ReadLiveHistoryBitForMapId")
    EndIf
    If Not StringInStr($sCompatText, "Func WaitForLoad(") Then
        _VR_AddError($sCompatRel & ": missing WaitForLoad() — portal GoOut paths call it by default")
    EndIf

    Local $sLocText = _VR_ReadText($GC_S_LOCATIONS)
    If Not StringInStr($sLocText, "SageLands_Transit") Then
        _VR_AddError(_VR_Rel($GC_S_LOCATIONS) & ": missing SageLands_Transit (Majesty's Rest)")
    EndIf
    If Not StringInStr($sLocText, "MamnoonLagoon_Transit2") Then
        _VR_AddError(_VR_Rel($GC_S_LOCATIONS) & ": missing MamnoonLagoon_Transit2 (Sage Lands)")
    EndIf

    Local $sSage = $GC_S_MAPS & "\Proph_Maguuma\SageLands.au3"
    Local $sSageText = _VR_ReadText($sSage)
    If Not StringInStr($sSageText, "$SageLands_Transit") Or Not StringInStr($sSageText, "aSageLandsTransitPath") Then
        _VR_AddError(_VR_Rel($sSage) & ": GoOutSageLands must handle Majesty's Rest transit")
    EndIf
EndFunc
