Global $vqrange = 1450
Global $ActionCounter = 1

Func VQLionsGate()

	If GetMapID() = $LionsGate_Map Then    

	
		If GetAreaVanquished() = False Then AggroMoveTo(0, 0)
		If GetAreaVanquished() = False Then AggroMoveTo(0, 0)

	EndIf
EndFunc