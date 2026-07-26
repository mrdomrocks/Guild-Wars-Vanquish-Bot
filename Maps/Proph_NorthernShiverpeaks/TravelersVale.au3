#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTravelersVale()
	MoveTo(9877, 7690)
	MoveTo(9673, 5861)
	Move(9279, 4038)
	WaitForLoad()
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

	Local $aWaypoints[49][4] = [ [8207, -333, " ", $vqrange] _
		, [11417, -2899, " ", $vqrange] _
		, [10010, -6296, " ", $vqrange] _
		, [9963, -10398, " ", $vqrange] _
		, [10306, -13417, " ", $vqrange] _
		, [8917, -14510, " ", $vqrange] _
		, [5683, -16716, " ", $vqrange] _
		, [2951, -14883, " ", $vqrange] _
		, [338, -13873, " ", $vqrange] _
		, [-866, -15697, " ", $vqrange] _
		, [-3456, -16785, " ", $vqrange] _
		, [-1283, -15970, " ", $vqrange] _
		, [-3080, -12849, " ", $vqrange] _
		, [-5949, -12463, " ", $vqrange] _
		, [-8216, -11267, " ", $vqrange] _
		, [-4301, -12607, " ", $vqrange] _
		, [-2184, -13157, " ", $vqrange] _
		, [947, -11275, " ", $vqrange] _
		, [2561, -9659, " ", $vqrange] _
		, [3322, -12900, " ", $vqrange] _
		, [4254, -7633, " ", $vqrange] _
		, [7700, -6871, " ", $vqrange] _
		, [3990, -7655, " ", $vqrange] _
		, [2096, -6324, " ", $vqrange] _
		, [3341, -3666, " ", $vqrange] _
		, [7534, -1623, " ", $vqrange] _
		, [3439, -2328, " ", $vqrange] _
		, [-374, -1352, " ", $vqrange] _
		, [-1550, -2966, " ", $vqrange] _
		, [-1776, -6295, " ", $vqrange] _
		, [-1550, -737, " ", $vqrange] _
		, [-3184, 1337, " ", $vqrange] _
		, [-2571, 6561, " ", $vqrange] _
		, [-801, 8248, " ", $vqrange] _
		, [-3679, 11100, " ", $vqrange] _
		, [-6869, 13503, " ", $vqrange] _
		, [-8547, 12819, " ", $vqrange] _
		, [-6371, 16077, " ", $vqrange] _
		, [-3117, 17801, " ", $vqrange] _
		, [-2035, 16561, " ", $vqrange] _
		, [278, 16481, " ", $vqrange] _
		, [239, 15300, " ", $vqrange] _
		, [832, 13347, " ", $vqrange] _
		, [-1633, 12227, " ", $vqrange] _
		, [-1227, 8598, " ", $vqrange] _
		, [1825, 6460, " ", $vqrange] _
		, [2915, 4653, " ", $vqrange] _
		, [1299, 3860, " ", $vqrange] _
		, [5094, 7017, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
