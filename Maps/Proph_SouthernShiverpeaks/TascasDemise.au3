#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aTascasDemiseOutpostPath[2][2] = [ _
	[-10030, 18833], _
	[-9797, 19027] _
]

Func GoOutTascasDemise()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $TascasDemise_Map Then Return

	If $l_i_Map = $TascasDemise_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> TascasDemise (portal 1)")
		_Vanquisher_RunAggroPortalPath($aTascasDemiseOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQTascasDemise()
	If GetMapID() <> $TascasDemise_Map And GetMapID() <> $TascasDemise_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for TascasDemise.")
		TravelTo($TascasDemise_Outpost)
	EndIf

	If GetMapID() = $TascasDemise_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTascasDemise()
		If GetMapID() <> $TascasDemise_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need TascasDemise (" & $TascasDemise_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $TascasDemise_Map Then
		CurrentAction("TascasDemise route waiting - on map " & GetMapID() & ", need " & $TascasDemise_Map & ".")
		Return
	EndIf

	CurrentAction("Starting TascasDemise vanquish route.")

	Local $aWaypoints[23][4] = [ _
		[-7318, 20765, " ", $vqrange], _
		[-4967, 20426, " ", $vqrange], _
		[-1199, 17061, " ", $vqrange], _
		[534, 17369, " ", $vqrange], _
		[1271, 20404, " ", $vqrange], _
		[6097, 21830, " ", $vqrange], _
		[4555, 25630, " ", $vqrange], _
		[4131, 27041, " ", $vqrange], _
		[5634, 28532, " ", $vqrange], _
		[6247, 27996, " ", $vqrange], _
		[7535, 26067, " ", $vqrange], _
		[10512, 26634, " ", $vqrange], _
		[12902, 24369, " ", $vqrange], _
		[13015, 21309, " ", $vqrange], _
		[10944, 18776, " ", $vqrange], _
		[9210, 15807, " ", $vqrange], _
		[8611, 15439, " ", $vqrange], _
		[7336, 17215, " ", $vqrange], _
		[6205, 17276, " ", $vqrange], _
		[8441, 15381, " ", $vqrange], _
		[5275, 14300, " ", $vqrange], _
		[3529, 14567, " ", $vqrange], _
		[1176, 16920, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

