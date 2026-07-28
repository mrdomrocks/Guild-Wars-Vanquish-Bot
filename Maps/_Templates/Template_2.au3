Global $vqrange = 1450
Global $ActionCounter = 1

Func VQFerndale()
        If GetMapID() = $Ferndale_Map Then

        GoNearestNPCToCoords(-12909, 15616)
        If GetKurzickFaction() > GetLuxonFaction() Then
                Dialog(0x81)
                Sleep(1000)
                Dialog(0x2)
                Sleep(1000)
                Dialog(0x84)
                Sleep(1000)
                Dialog(0x86)
                Sleep(1000)
        Else
                Dialog(0x85)
                Sleep(1000)
                Dialog(0x86)
                Sleep(1000)
        EndIf

        If GetAreaVanquished() = False Then AggroMoveTo(-10166, 9355)
        If GetAreaVanquished() = False Then AggroMoveTo(-8861, 10761)
        If GetAreaVanquished() = False Then AggroMoveTo(-9327, 14264)

        ; Reverse pass example:
        If GetAreaVanquished() = False Then AggroMoveTo(-9327, 14264)
        If GetAreaVanquished() = False Then AggroMoveTo(-8861, 10761)
        If GetAreaVanquished() = False Then AggroMoveTo(-10166, 9355)

    EndIf
EndFunc
