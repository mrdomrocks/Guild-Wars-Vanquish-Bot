Global $vqrange = 1450
Global $ActionCounter = 1

Global $aProph_NorthernShiverpeaks_TravelersValeRoute01[49][2] = [ _
        [8207, -333], _
        [11417, -2899], _
        [10010, -6296], _
        [9963, -10398], _
        [10306, -13417], _
        [8917, -14510], _
        [5683, -16716], _
        [2951, -14883], _
        [338, -13873], _
        [-866, -15697], _
        [-3456, -16785], _
        [-1283, -15970], _
        [-3080, -12849], _
        [-5949, -12463], _
        [-8216, -11267], _
        [-4301, -12607], _
        [-2184, -13157], _
        [947, -11275], _
        [2561, -9659], _
        [3322, -12900], _
        [4254, -7633], _
        [7700, -6871], _
        [3990, -7655], _
        [2096, -6324], _
        [3341, -3666], _
        [7534, -1623], _
        [3439, -2328], _
        [-374, -1352], _
        [-1550, -2966], _
        [-1776, -6295], _
        [-1550, -737], _
        [-3184, 1337], _
        [-2571, 6561], _
        [-801, 8248], _
        [-3679, 11100], _
        [-6869, 13503], _
        [-8547, 12819], _
        [-6371, 16077], _
        [-3117, 17801], _
        [-2035, 16561], _
        [278, 16481], _
        [239, 15300], _
        [832, 13347], _
        [-1633, 12227], _
        [-1227, 8598], _
        [1825, 6460], _
        [2915, 4653], _
        [1299, 3860], _
        [5094, 7017] _
]

Global $aProph_NorthernShiverpeaks_TravelersValeRoute02[49][2] = [ _
        [5094, 7017], _
        [1299, 3860], _
        [2915, 4653], _
        [1825, 6460], _
        [-1227, 8598], _
        [-1633, 12227], _
        [832, 13347], _
        [239, 15300], _
        [278, 16481], _
        [-2035, 16561], _
        [-3117, 17801], _
        [-6371, 16077], _
        [-8547, 12819], _
        [-6869, 13503], _
        [-3679, 11100], _
        [-801, 8248], _
        [-2571, 6561], _
        [-3184, 1337], _
        [-1550, -737], _
        [-1776, -6295], _
        [-1550, -2966], _
        [-374, -1352], _
        [3439, -2328], _
        [7534, -1623], _
        [3341, -3666], _
        [2096, -6324], _
        [3990, -7655], _
        [7700, -6871], _
        [4254, -7633], _
        [3322, -12900], _
        [2561, -9659], _
        [947, -11275], _
        [-2184, -13157], _
        [-4301, -12607], _
        [-8216, -11267], _
        [-5949, -12463], _
        [-3080, -12849], _
        [-1283, -15970], _
        [-3456, -16785], _
        [-866, -15697], _
        [338, -13873], _
        [2951, -14883], _
        [5683, -16716], _
        [8917, -14510], _
        [10306, -13417], _
        [9963, -10398], _
        [10010, -6296], _
        [11417, -2899], _
        [8207, -333] _
]

Func GoOutTravelersVale()
        Local $aGoOutRoute[3][2] = [ [9877, 7690] _
                , [9673, 5861] _
                , [9279, 4038] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "TravelersVale exit ")
EndFunc

Func VQTravelersVale()
	If GetMapID() <> $TravelersVale_Map And GetMapID() <> $TravelersVale_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to Yak's Bend for Traveler's Vale.")
		TravelTo($TravelersVale_Outpost)
	EndIf

	If GetMapID() = $TravelersVale_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutTravelersVale()
		If GetMapID() <> $TravelersVale_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Traveler's Vale (" & $TravelersVale_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $TravelersVale_Map Then
		CurrentAction("Traveler's Vale route waiting - on map " & GetMapID() & ", need " & $TravelersVale_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Traveler's Vale vanquish route.")


	_Vanquisher_RunVanquishRoute($aProph_NorthernShiverpeaks_TravelersValeRoute01)

	; reverse
	_Vanquisher_RunVanquishRoute($aProph_NorthernShiverpeaks_TravelersValeRoute02)
EndFunc
