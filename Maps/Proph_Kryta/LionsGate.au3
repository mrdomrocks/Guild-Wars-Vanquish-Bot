Global $vqrange = 1450
Global $ActionCounter = 1

Global $aProph_Kryta_LionsGateRoute01[2][2] = [ _
        [0, 0], _
        [0, 0] _
]

Func VQLionsGate()

	If GetMapID() = $LionsGate_Map Then    

	
		_Vanquisher_RunVanquishRoute($aProph_Kryta_LionsGateRoute01)

	EndIf
EndFunc