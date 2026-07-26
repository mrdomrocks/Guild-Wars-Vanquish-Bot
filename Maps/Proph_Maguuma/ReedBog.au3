#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aReedBogOutpostPath[2][2] = [ _
	[-14913, 578], _
	[-15169, 426] _
]

Global $aReedBogTransitPath[9][2] = [ _
	[-17065, -942], _
	[-15179, -3115], _
	[-13716, -7339], _
	[-12855, -9881], _
	[-15821, -10140], _
	[-19351, -8594], _
	[-20909, -11218], _
	[-22657, -11462], _
	[-23270, -11426] _
]

Func GoOutReedBog()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $ReedBog_Map Then Return

	If $l_i_Map = $ReedBog_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> ReedBog (portal 1)")
		_Vanquisher_RunAggroPortalPath($aReedBogOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $ReedBog_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> ReedBog (portal 2)")
		_Vanquisher_RunAggroPortalPath($aReedBogTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQReedBog()
	If GetMapID() <> $ReedBog_Map And GetMapID() <> $ReedBog_Outpost And GetMapID() <> $ReedBog_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for ReedBog.")
		TravelTo($ReedBog_Outpost)
	EndIf

	If GetMapID() = $ReedBog_Outpost Or GetMapID() = $ReedBog_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutReedBog()
		If GetMapID() <> $ReedBog_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need ReedBog (" & $ReedBog_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $ReedBog_Map Then
		CurrentAction("ReedBog route waiting - on map " & GetMapID() & ", need " & $ReedBog_Map & ".")
		Return
	EndIf

	CurrentAction("Starting ReedBog vanquish route.")

	Local $aWaypoints[28][4] = [ _
		[7164, 7081, " ", $vqrange], _
		[4803, 4633, " ", $vqrange], _
		[-485, 7205, " ", $vqrange], _
		[-2694, 6082, " ", $vqrange], _
		[-5773, 5901, " ", $vqrange], _
		[-8670, 3619, " ", $vqrange], _
		[-8526, 70, " ", $vqrange], _
		[-7871, -440, " ", $vqrange], _
		[-7013, 2110, " ", $vqrange], _
		[-5338, 3510, " ", $vqrange], _
		[-2332, 4959, " ", $vqrange], _
		[-2731, 3112, " ", $vqrange], _
		[-5954, 939, " ", $vqrange], _
		[-2948, 1881, " ", $vqrange], _
		[-5198, -476, " ", $vqrange], _
		[-7334, -1604, " ", $vqrange], _
		[-8794, -2909, " ", $vqrange], _
		[-7825, -5029, " ", $vqrange], _
		[-7658, -6698, " ", $vqrange], _
		[-2670, -6828, " ", $vqrange], _
		[-1613, -9109, " ", $vqrange], _
		[-333, -8646, " ", $vqrange], _
		[186, -5512, " ", $vqrange], _
		[2727, -4362, " ", $vqrange], _
		[5507, -4939, " ", $vqrange], _
		[5456, -1279, " ", $vqrange], _
		[5874, 2961, " ", $vqrange], _
		[6662, 4422, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

