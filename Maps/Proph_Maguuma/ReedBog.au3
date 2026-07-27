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


	If GetAreaVanquished() = False Then AggroMoveTo(7164, 7081)
	If GetAreaVanquished() = False Then AggroMoveTo(4803, 4633)
	If GetAreaVanquished() = False Then AggroMoveTo(-485, 7205)
	If GetAreaVanquished() = False Then AggroMoveTo(-2694, 6082)
	If GetAreaVanquished() = False Then AggroMoveTo(-5773, 5901)
	If GetAreaVanquished() = False Then AggroMoveTo(-8670, 3619)
	If GetAreaVanquished() = False Then AggroMoveTo(-8526, 70)
	If GetAreaVanquished() = False Then AggroMoveTo(-7871, -440)
	If GetAreaVanquished() = False Then AggroMoveTo(-7013, 2110)
	If GetAreaVanquished() = False Then AggroMoveTo(-5338, 3510)
	If GetAreaVanquished() = False Then AggroMoveTo(-2332, 4959)
	If GetAreaVanquished() = False Then AggroMoveTo(-2731, 3112)
	If GetAreaVanquished() = False Then AggroMoveTo(-5954, 939)
	If GetAreaVanquished() = False Then AggroMoveTo(-2948, 1881)
	If GetAreaVanquished() = False Then AggroMoveTo(-5198, -476)
	If GetAreaVanquished() = False Then AggroMoveTo(-7334, -1604)
	If GetAreaVanquished() = False Then AggroMoveTo(-8794, -2909)
	If GetAreaVanquished() = False Then AggroMoveTo(-7825, -5029)
	If GetAreaVanquished() = False Then AggroMoveTo(-7658, -6698)
	If GetAreaVanquished() = False Then AggroMoveTo(-2670, -6828)
	If GetAreaVanquished() = False Then AggroMoveTo(-1613, -9109)
	If GetAreaVanquished() = False Then AggroMoveTo(-333, -8646)
	If GetAreaVanquished() = False Then AggroMoveTo(186, -5512)
	If GetAreaVanquished() = False Then AggroMoveTo(2727, -4362)
	If GetAreaVanquished() = False Then AggroMoveTo(5507, -4939)
	If GetAreaVanquished() = False Then AggroMoveTo(5456, -1279)
	If GetAreaVanquished() = False Then AggroMoveTo(5874, 2961)
	If GetAreaVanquished() = False Then AggroMoveTo(6662, 4422)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(6662, 4422)
	If GetAreaVanquished() = False Then AggroMoveTo(5874, 2961)
	If GetAreaVanquished() = False Then AggroMoveTo(5456, -1279)
	If GetAreaVanquished() = False Then AggroMoveTo(5507, -4939)
	If GetAreaVanquished() = False Then AggroMoveTo(2727, -4362)
	If GetAreaVanquished() = False Then AggroMoveTo(186, -5512)
	If GetAreaVanquished() = False Then AggroMoveTo(-333, -8646)
	If GetAreaVanquished() = False Then AggroMoveTo(-1613, -9109)
	If GetAreaVanquished() = False Then AggroMoveTo(-2670, -6828)
	If GetAreaVanquished() = False Then AggroMoveTo(-7658, -6698)
	If GetAreaVanquished() = False Then AggroMoveTo(-7825, -5029)
	If GetAreaVanquished() = False Then AggroMoveTo(-8794, -2909)
	If GetAreaVanquished() = False Then AggroMoveTo(-7334, -1604)
	If GetAreaVanquished() = False Then AggroMoveTo(-5198, -476)
	If GetAreaVanquished() = False Then AggroMoveTo(-2948, 1881)
	If GetAreaVanquished() = False Then AggroMoveTo(-5954, 939)
	If GetAreaVanquished() = False Then AggroMoveTo(-2731, 3112)
	If GetAreaVanquished() = False Then AggroMoveTo(-2332, 4959)
	If GetAreaVanquished() = False Then AggroMoveTo(-5338, 3510)
	If GetAreaVanquished() = False Then AggroMoveTo(-7013, 2110)
	If GetAreaVanquished() = False Then AggroMoveTo(-7871, -440)
	If GetAreaVanquished() = False Then AggroMoveTo(-8526, 70)
	If GetAreaVanquished() = False Then AggroMoveTo(-8670, 3619)
	If GetAreaVanquished() = False Then AggroMoveTo(-5773, 5901)
	If GetAreaVanquished() = False Then AggroMoveTo(-2694, 6082)
	If GetAreaVanquished() = False Then AggroMoveTo(-485, 7205)
	If GetAreaVanquished() = False Then AggroMoveTo(4803, 4633)
	If GetAreaVanquished() = False Then AggroMoveTo(7164, 7081)
EndFunc

