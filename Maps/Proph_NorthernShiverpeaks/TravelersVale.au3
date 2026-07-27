#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

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


	If GetAreaVanquished() = False Then AggroMoveTo(8207, -333)
	If GetAreaVanquished() = False Then AggroMoveTo(11417, -2899)
	If GetAreaVanquished() = False Then AggroMoveTo(10010, -6296)
	If GetAreaVanquished() = False Then AggroMoveTo(9963, -10398)
	If GetAreaVanquished() = False Then AggroMoveTo(10306, -13417)
	If GetAreaVanquished() = False Then AggroMoveTo(8917, -14510)
	If GetAreaVanquished() = False Then AggroMoveTo(5683, -16716)
	If GetAreaVanquished() = False Then AggroMoveTo(2951, -14883)
	If GetAreaVanquished() = False Then AggroMoveTo(338, -13873)
	If GetAreaVanquished() = False Then AggroMoveTo(-866, -15697)
	If GetAreaVanquished() = False Then AggroMoveTo(-3456, -16785)
	If GetAreaVanquished() = False Then AggroMoveTo(-1283, -15970)
	If GetAreaVanquished() = False Then AggroMoveTo(-3080, -12849)
	If GetAreaVanquished() = False Then AggroMoveTo(-5949, -12463)
	If GetAreaVanquished() = False Then AggroMoveTo(-8216, -11267)
	If GetAreaVanquished() = False Then AggroMoveTo(-4301, -12607)
	If GetAreaVanquished() = False Then AggroMoveTo(-2184, -13157)
	If GetAreaVanquished() = False Then AggroMoveTo(947, -11275)
	If GetAreaVanquished() = False Then AggroMoveTo(2561, -9659)
	If GetAreaVanquished() = False Then AggroMoveTo(3322, -12900)
	If GetAreaVanquished() = False Then AggroMoveTo(4254, -7633)
	If GetAreaVanquished() = False Then AggroMoveTo(7700, -6871)
	If GetAreaVanquished() = False Then AggroMoveTo(3990, -7655)
	If GetAreaVanquished() = False Then AggroMoveTo(2096, -6324)
	If GetAreaVanquished() = False Then AggroMoveTo(3341, -3666)
	If GetAreaVanquished() = False Then AggroMoveTo(7534, -1623)
	If GetAreaVanquished() = False Then AggroMoveTo(3439, -2328)
	If GetAreaVanquished() = False Then AggroMoveTo(-374, -1352)
	If GetAreaVanquished() = False Then AggroMoveTo(-1550, -2966)
	If GetAreaVanquished() = False Then AggroMoveTo(-1776, -6295)
	If GetAreaVanquished() = False Then AggroMoveTo(-1550, -737)
	If GetAreaVanquished() = False Then AggroMoveTo(-3184, 1337)
	If GetAreaVanquished() = False Then AggroMoveTo(-2571, 6561)
	If GetAreaVanquished() = False Then AggroMoveTo(-801, 8248)
	If GetAreaVanquished() = False Then AggroMoveTo(-3679, 11100)
	If GetAreaVanquished() = False Then AggroMoveTo(-6869, 13503)
	If GetAreaVanquished() = False Then AggroMoveTo(-8547, 12819)
	If GetAreaVanquished() = False Then AggroMoveTo(-6371, 16077)
	If GetAreaVanquished() = False Then AggroMoveTo(-3117, 17801)
	If GetAreaVanquished() = False Then AggroMoveTo(-2035, 16561)
	If GetAreaVanquished() = False Then AggroMoveTo(278, 16481)
	If GetAreaVanquished() = False Then AggroMoveTo(239, 15300)
	If GetAreaVanquished() = False Then AggroMoveTo(832, 13347)
	If GetAreaVanquished() = False Then AggroMoveTo(-1633, 12227)
	If GetAreaVanquished() = False Then AggroMoveTo(-1227, 8598)
	If GetAreaVanquished() = False Then AggroMoveTo(1825, 6460)
	If GetAreaVanquished() = False Then AggroMoveTo(2915, 4653)
	If GetAreaVanquished() = False Then AggroMoveTo(1299, 3860)
	If GetAreaVanquished() = False Then AggroMoveTo(5094, 7017)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(5094, 7017)
	If GetAreaVanquished() = False Then AggroMoveTo(1299, 3860)
	If GetAreaVanquished() = False Then AggroMoveTo(2915, 4653)
	If GetAreaVanquished() = False Then AggroMoveTo(1825, 6460)
	If GetAreaVanquished() = False Then AggroMoveTo(-1227, 8598)
	If GetAreaVanquished() = False Then AggroMoveTo(-1633, 12227)
	If GetAreaVanquished() = False Then AggroMoveTo(832, 13347)
	If GetAreaVanquished() = False Then AggroMoveTo(239, 15300)
	If GetAreaVanquished() = False Then AggroMoveTo(278, 16481)
	If GetAreaVanquished() = False Then AggroMoveTo(-2035, 16561)
	If GetAreaVanquished() = False Then AggroMoveTo(-3117, 17801)
	If GetAreaVanquished() = False Then AggroMoveTo(-6371, 16077)
	If GetAreaVanquished() = False Then AggroMoveTo(-8547, 12819)
	If GetAreaVanquished() = False Then AggroMoveTo(-6869, 13503)
	If GetAreaVanquished() = False Then AggroMoveTo(-3679, 11100)
	If GetAreaVanquished() = False Then AggroMoveTo(-801, 8248)
	If GetAreaVanquished() = False Then AggroMoveTo(-2571, 6561)
	If GetAreaVanquished() = False Then AggroMoveTo(-3184, 1337)
	If GetAreaVanquished() = False Then AggroMoveTo(-1550, -737)
	If GetAreaVanquished() = False Then AggroMoveTo(-1776, -6295)
	If GetAreaVanquished() = False Then AggroMoveTo(-1550, -2966)
	If GetAreaVanquished() = False Then AggroMoveTo(-374, -1352)
	If GetAreaVanquished() = False Then AggroMoveTo(3439, -2328)
	If GetAreaVanquished() = False Then AggroMoveTo(7534, -1623)
	If GetAreaVanquished() = False Then AggroMoveTo(3341, -3666)
	If GetAreaVanquished() = False Then AggroMoveTo(2096, -6324)
	If GetAreaVanquished() = False Then AggroMoveTo(3990, -7655)
	If GetAreaVanquished() = False Then AggroMoveTo(7700, -6871)
	If GetAreaVanquished() = False Then AggroMoveTo(4254, -7633)
	If GetAreaVanquished() = False Then AggroMoveTo(3322, -12900)
	If GetAreaVanquished() = False Then AggroMoveTo(2561, -9659)
	If GetAreaVanquished() = False Then AggroMoveTo(947, -11275)
	If GetAreaVanquished() = False Then AggroMoveTo(-2184, -13157)
	If GetAreaVanquished() = False Then AggroMoveTo(-4301, -12607)
	If GetAreaVanquished() = False Then AggroMoveTo(-8216, -11267)
	If GetAreaVanquished() = False Then AggroMoveTo(-5949, -12463)
	If GetAreaVanquished() = False Then AggroMoveTo(-3080, -12849)
	If GetAreaVanquished() = False Then AggroMoveTo(-1283, -15970)
	If GetAreaVanquished() = False Then AggroMoveTo(-3456, -16785)
	If GetAreaVanquished() = False Then AggroMoveTo(-866, -15697)
	If GetAreaVanquished() = False Then AggroMoveTo(338, -13873)
	If GetAreaVanquished() = False Then AggroMoveTo(2951, -14883)
	If GetAreaVanquished() = False Then AggroMoveTo(5683, -16716)
	If GetAreaVanquished() = False Then AggroMoveTo(8917, -14510)
	If GetAreaVanquished() = False Then AggroMoveTo(10306, -13417)
	If GetAreaVanquished() = False Then AggroMoveTo(9963, -10398)
	If GetAreaVanquished() = False Then AggroMoveTo(10010, -6296)
	If GetAreaVanquished() = False Then AggroMoveTo(11417, -2899)
	If GetAreaVanquished() = False Then AggroMoveTo(8207, -333)
EndFunc
