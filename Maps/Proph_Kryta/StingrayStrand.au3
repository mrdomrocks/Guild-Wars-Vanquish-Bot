Global $vqrange = 1450
Global $ActionCounter = 1

Global $aStingrayOutpostPath[2][2] = [ _
	[-21997, 6159], _
	[-23033, 7201] _
]

Global $aProph_Kryta_StingrayStrandRoute01[51][2] = [ _
        [7514.00, -13764.00], _
        [4486.16, -12001.16], _
        [2589.08, -12034.23], _
        [294.20, -11107.50], _
        [146.96, -6294.41], _
        [2205.69, -2487.57], _
        [1771.80, 2199.95], _
        [1307.24, 4915.47], _
        [-608.47, 9141.59], _
        [-2210.90, 10169.22], _
        [-3693.81, 9382.02], _
        [-7232.32, 11808.99], _
        [-9215.87, 15442.40], _
        [-10695.60, 18647.52], _
        [-7496.91, 20625.07], _
        [-5058.09, 20891.63], _
        [-4146.11, 16900.99], _
        [44.09, 14542.19], _
        [1752.33, 12061.89], _
        [44.09, 14542.19], _
        [-4146.11, 16900.99], _
        [-5056.65, 14118.52], _
        [-932.77, 10475.53], _
        [-1576.08, 4174.33], _
        [-2415.00, 540.75], _
        [-4916.48, -2564.71], _
        [-2011.25, -2132.53], _
        [-4288.89, -4115.90], _
        [-7757.28, -1254.18], _
        [-6995.13, 1063.29], _
        [-9628.42, 1042.43], _
        [-9540.32, -1291.69], _
        [-9628.42, 1042.43], _
        [-6995.13, 1063.29], _
        [-6348.55, 3711.08], _
        [-6190.59, 6343.62], _
        [-9938.91, 9780.00], _
        [-12988.90, 12745.26], _
        [-14074.94, 8450.92], _
        [-13395.97, 4607.92], _
        [-13480.42, 2878.92], _
        [-11220.55, -1712.22], _
        [-10416.85, -6261.95], _
        [-7204.02, -8451.51], _
        [-6946.73, -8795.69], _
        [-4071.69, -7136.16], _
        [-6946.73, -8795.69], _
        [-5339.56, -12518.39], _
        [-3574.33, -15372.71], _
        [-578.54, -15032.59], _
        [3745.82, -13927.75] _
]

Global $aProph_Kryta_StingrayStrandRoute02[51][2] = [ _
        [3745.82, -13927.75], _
        [-578.54, -15032.59], _
        [-3574.33, -15372.71], _
        [-5339.56, -12518.39], _
        [-6946.73, -8795.69], _
        [-4071.69, -7136.16], _
        [-6946.73, -8795.69], _
        [-7204.02, -8451.51], _
        [-10416.85, -6261.95], _
        [-11220.55, -1712.22], _
        [-13480.42, 2878.92], _
        [-13395.97, 4607.92], _
        [-14074.94, 8450.92], _
        [-12988.90, 12745.26], _
        [-9938.91, 9780.00], _
        [-6190.59, 6343.62], _
        [-6348.55, 3711.08], _
        [-6995.13, 1063.29], _
        [-9628.42, 1042.43], _
        [-9540.32, -1291.69], _
        [-9628.42, 1042.43], _
        [-6995.13, 1063.29], _
        [-7757.28, -1254.18], _
        [-4288.89, -4115.90], _
        [-2011.25, -2132.53], _
        [-4916.48, -2564.71], _
        [-2415.00, 540.75], _
        [-1576.08, 4174.33], _
        [-932.77, 10475.53], _
        [-5056.65, 14118.52], _
        [-4146.11, 16900.99], _
        [44.09, 14542.19], _
        [1752.33, 12061.89], _
        [44.09, 14542.19], _
        [-4146.11, 16900.99], _
        [-5058.09, 20891.63], _
        [-7496.91, 20625.07], _
        [-10695.60, 18647.52], _
        [-9215.87, 15442.40], _
        [-7232.32, 11808.99], _
        [-3693.81, 9382.02], _
        [-2210.90, 10169.22], _
        [-608.47, 9141.59], _
        [1307.24, 4915.47], _
        [1771.80, 2199.95], _
        [2205.69, -2487.57], _
        [146.96, -6294.41], _
        [294.20, -11107.50], _
        [2589.08, -12034.23], _
        [4486.16, -12001.16], _
        [7514.00, -13764.00] _
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


	_Vanquisher_RunVanquishRoute($aProph_Kryta_StingrayStrandRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_Kryta_StingrayStrandRoute02)
EndFunc
