#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aStingrayOutpostPath[2][2] = [ _
	[-21997, 6159], _
	[-23033, 7201] _
]

Func _Vanquisher_ResetStingrayRouteProgress()
	$g_i_StingrayRoute_LastMapHandled = -1
EndFunc

; Riverside Province (73) -> Stingray Strand farm (63).
Func GoOutStingrayStrand()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $StingrayStrand_Map Then Return

	If $l_i_Map = $StingrayStrand_Outpost Then
		If $g_i_StingrayRoute_LastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Riverside Province -> Stingray Strand.")
		_Vanquisher_RunAggroPortalPath($aStingrayOutpostPath, $vqrange, "riverside ")
		$g_i_StingrayRoute_LastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
	EndIf
EndFunc

Func VQStingrayStrand()
	If GetMapID() <> $StingrayStrand_Map And GetMapID() <> $StingrayStrand_Outpost Then
		_Vanquisher_ResetStingrayRouteProgress()
		CurrentAction("Traveling to Riverside Province.")
		TravelTo($StingrayStrand_Outpost)
	EndIf

	If GetMapID() = $StingrayStrand_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutStingrayStrand()
		If GetMapID() <> $StingrayStrand_Map Then
			CurrentAction("Routing — on map " & GetMapID() & ", need Stingray Strand (" & $StingrayStrand_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $StingrayStrand_Map Then
		CurrentAction("Stingray route waiting — on map " & GetMapID() & ", need " & $StingrayStrand_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Stingray Strand vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(7514.00, -13764.00)
	If GetAreaVanquished() = False Then AggroMoveTo(4486.16, -12001.16)
	If GetAreaVanquished() = False Then AggroMoveTo(2589.08, -12034.23)
	If GetAreaVanquished() = False Then AggroMoveTo(294.20, -11107.50)
	If GetAreaVanquished() = False Then AggroMoveTo(146.96, -6294.41)
	If GetAreaVanquished() = False Then AggroMoveTo(2205.69, -2487.57)
	If GetAreaVanquished() = False Then AggroMoveTo(1771.80, 2199.95)
	If GetAreaVanquished() = False Then AggroMoveTo(1307.24, 4915.47)
	If GetAreaVanquished() = False Then AggroMoveTo(-608.47, 9141.59)
	If GetAreaVanquished() = False Then AggroMoveTo(-2210.90, 10169.22)
	If GetAreaVanquished() = False Then AggroMoveTo(-3693.81, 9382.02)
	If GetAreaVanquished() = False Then AggroMoveTo(-7232.32, 11808.99)
	If GetAreaVanquished() = False Then AggroMoveTo(-9215.87, 15442.40)
	If GetAreaVanquished() = False Then AggroMoveTo(-10695.60, 18647.52)
	If GetAreaVanquished() = False Then AggroMoveTo(-7496.91, 20625.07)
	If GetAreaVanquished() = False Then AggroMoveTo(-5058.09, 20891.63)
	If GetAreaVanquished() = False Then AggroMoveTo(-4146.11, 16900.99)
	If GetAreaVanquished() = False Then AggroMoveTo(44.09, 14542.19)
	If GetAreaVanquished() = False Then AggroMoveTo(1752.33, 12061.89)
	If GetAreaVanquished() = False Then AggroMoveTo(44.09, 14542.19)
	If GetAreaVanquished() = False Then AggroMoveTo(-4146.11, 16900.99)
	If GetAreaVanquished() = False Then AggroMoveTo(-5056.65, 14118.52)
	If GetAreaVanquished() = False Then AggroMoveTo(-932.77, 10475.53)
	If GetAreaVanquished() = False Then AggroMoveTo(-1576.08, 4174.33)
	If GetAreaVanquished() = False Then AggroMoveTo(-2415.00, 540.75)
	If GetAreaVanquished() = False Then AggroMoveTo(-4916.48, -2564.71)
	If GetAreaVanquished() = False Then AggroMoveTo(-2011.25, -2132.53)
	If GetAreaVanquished() = False Then AggroMoveTo(-4288.89, -4115.90)
	If GetAreaVanquished() = False Then AggroMoveTo(-7757.28, -1254.18)
	If GetAreaVanquished() = False Then AggroMoveTo(-6995.13, 1063.29)
	If GetAreaVanquished() = False Then AggroMoveTo(-9628.42, 1042.43)
	If GetAreaVanquished() = False Then AggroMoveTo(-9540.32, -1291.69)
	If GetAreaVanquished() = False Then AggroMoveTo(-9628.42, 1042.43)
	If GetAreaVanquished() = False Then AggroMoveTo(-6995.13, 1063.29)
	If GetAreaVanquished() = False Then AggroMoveTo(-6348.55, 3711.08)
	If GetAreaVanquished() = False Then AggroMoveTo(-6190.59, 6343.62)
	If GetAreaVanquished() = False Then AggroMoveTo(-9938.91, 9780.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-12988.90, 12745.26)
	If GetAreaVanquished() = False Then AggroMoveTo(-14074.94, 8450.92)
	If GetAreaVanquished() = False Then AggroMoveTo(-13395.97, 4607.92)
	If GetAreaVanquished() = False Then AggroMoveTo(-13480.42, 2878.92)
	If GetAreaVanquished() = False Then AggroMoveTo(-11220.55, -1712.22)
	If GetAreaVanquished() = False Then AggroMoveTo(-10416.85, -6261.95)
	If GetAreaVanquished() = False Then AggroMoveTo(-7204.02, -8451.51)
	If GetAreaVanquished() = False Then AggroMoveTo(-6946.73, -8795.69)
	If GetAreaVanquished() = False Then AggroMoveTo(-4071.69, -7136.16)
	If GetAreaVanquished() = False Then AggroMoveTo(-6946.73, -8795.69)
	If GetAreaVanquished() = False Then AggroMoveTo(-5339.56, -12518.39)
	If GetAreaVanquished() = False Then AggroMoveTo(-3574.33, -15372.71)
	If GetAreaVanquished() = False Then AggroMoveTo(-578.54, -15032.59)
	If GetAreaVanquished() = False Then AggroMoveTo(3745.82, -13927.75)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(3745.82, -13927.75)
	If GetAreaVanquished() = False Then AggroMoveTo(-578.54, -15032.59)
	If GetAreaVanquished() = False Then AggroMoveTo(-3574.33, -15372.71)
	If GetAreaVanquished() = False Then AggroMoveTo(-5339.56, -12518.39)
	If GetAreaVanquished() = False Then AggroMoveTo(-6946.73, -8795.69)
	If GetAreaVanquished() = False Then AggroMoveTo(-4071.69, -7136.16)
	If GetAreaVanquished() = False Then AggroMoveTo(-6946.73, -8795.69)
	If GetAreaVanquished() = False Then AggroMoveTo(-7204.02, -8451.51)
	If GetAreaVanquished() = False Then AggroMoveTo(-10416.85, -6261.95)
	If GetAreaVanquished() = False Then AggroMoveTo(-11220.55, -1712.22)
	If GetAreaVanquished() = False Then AggroMoveTo(-13480.42, 2878.92)
	If GetAreaVanquished() = False Then AggroMoveTo(-13395.97, 4607.92)
	If GetAreaVanquished() = False Then AggroMoveTo(-14074.94, 8450.92)
	If GetAreaVanquished() = False Then AggroMoveTo(-12988.90, 12745.26)
	If GetAreaVanquished() = False Then AggroMoveTo(-9938.91, 9780.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-6190.59, 6343.62)
	If GetAreaVanquished() = False Then AggroMoveTo(-6348.55, 3711.08)
	If GetAreaVanquished() = False Then AggroMoveTo(-6995.13, 1063.29)
	If GetAreaVanquished() = False Then AggroMoveTo(-9628.42, 1042.43)
	If GetAreaVanquished() = False Then AggroMoveTo(-9540.32, -1291.69)
	If GetAreaVanquished() = False Then AggroMoveTo(-9628.42, 1042.43)
	If GetAreaVanquished() = False Then AggroMoveTo(-6995.13, 1063.29)
	If GetAreaVanquished() = False Then AggroMoveTo(-7757.28, -1254.18)
	If GetAreaVanquished() = False Then AggroMoveTo(-4288.89, -4115.90)
	If GetAreaVanquished() = False Then AggroMoveTo(-2011.25, -2132.53)
	If GetAreaVanquished() = False Then AggroMoveTo(-4916.48, -2564.71)
	If GetAreaVanquished() = False Then AggroMoveTo(-2415.00, 540.75)
	If GetAreaVanquished() = False Then AggroMoveTo(-1576.08, 4174.33)
	If GetAreaVanquished() = False Then AggroMoveTo(-932.77, 10475.53)
	If GetAreaVanquished() = False Then AggroMoveTo(-5056.65, 14118.52)
	If GetAreaVanquished() = False Then AggroMoveTo(-4146.11, 16900.99)
	If GetAreaVanquished() = False Then AggroMoveTo(44.09, 14542.19)
	If GetAreaVanquished() = False Then AggroMoveTo(1752.33, 12061.89)
	If GetAreaVanquished() = False Then AggroMoveTo(44.09, 14542.19)
	If GetAreaVanquished() = False Then AggroMoveTo(-4146.11, 16900.99)
	If GetAreaVanquished() = False Then AggroMoveTo(-5058.09, 20891.63)
	If GetAreaVanquished() = False Then AggroMoveTo(-7496.91, 20625.07)
	If GetAreaVanquished() = False Then AggroMoveTo(-10695.60, 18647.52)
	If GetAreaVanquished() = False Then AggroMoveTo(-9215.87, 15442.40)
	If GetAreaVanquished() = False Then AggroMoveTo(-7232.32, 11808.99)
	If GetAreaVanquished() = False Then AggroMoveTo(-3693.81, 9382.02)
	If GetAreaVanquished() = False Then AggroMoveTo(-2210.90, 10169.22)
	If GetAreaVanquished() = False Then AggroMoveTo(-608.47, 9141.59)
	If GetAreaVanquished() = False Then AggroMoveTo(1307.24, 4915.47)
	If GetAreaVanquished() = False Then AggroMoveTo(1771.80, 2199.95)
	If GetAreaVanquished() = False Then AggroMoveTo(2205.69, -2487.57)
	If GetAreaVanquished() = False Then AggroMoveTo(146.96, -6294.41)
	If GetAreaVanquished() = False Then AggroMoveTo(294.20, -11107.50)
	If GetAreaVanquished() = False Then AggroMoveTo(2589.08, -12034.23)
	If GetAreaVanquished() = False Then AggroMoveTo(4486.16, -12001.16)
	If GetAreaVanquished() = False Then AggroMoveTo(7514.00, -13764.00)
EndFunc
