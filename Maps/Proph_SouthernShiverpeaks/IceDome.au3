#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aIcedomeOutpostPath[2][2] = [ _
	[-22815, -5378], _
	[-23091, -5492] _
]

Global $aIcedomeTransitPath[15][2] = [ _
	[20104, -13167], _
	[19138, -10938], _
	[18469, -8424], _
	[13995, -8343], _
	[15599, -6604], _
	[18342, -837], _
	[20857, -494], _
	[21224, 2843], _
	[21705, 4661], _
	[22376, 7119], _
	[23184, 9199], _
	[23218, 11371], _
	[22197, 16324], _
	[23438, 16609], _
	[24083, 16716] _
]

Func GoOutIcedome()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $IceDome_Map Then Return

	If $l_i_Map = $IceDome_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> Icedome (portal 1)")
		_Vanquisher_RunAggroPortalPath($aIcedomeOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

	If $l_i_Map = $IceDome_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Transit -> Icedome (portal 2)")
		_Vanquisher_RunAggroPortalPath($aIcedomeTransitPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQIcedome()
	If GetMapID() <> $IceDome_Map And GetMapID() <> $IceDome_Outpost And GetMapID() <> $IceDome_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Icedome.")
		TravelTo($IceDome_Outpost)
	EndIf

	If GetMapID() = $IceDome_Outpost Or GetMapID() = $IceDome_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutIcedome()
		If GetMapID() <> $IceDome_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Icedome (" & $IceDome_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $IceDome_Map Then
		CurrentAction("Icedome route waiting - on map " & GetMapID() & ", need " & $IceDome_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Icedome vanquish route.")

	Local $aWaypoints[19][4] = [ _
		[-4580, -5658, " ", $vqrange], _
		[-7099, -3889, " ", $vqrange], _
		[-8209, -2275, " ", $vqrange], _
		[-6907, -750, " ", $vqrange], _
		[-7084, 1085, " ", $vqrange], _
		[-3831, 1230, " ", $vqrange], _
		[-4262, 3600, " ", $vqrange], _
		[-3086, 5099, " ", $vqrange], _
		[-2743, 7372, " ", $vqrange], _
		[797, 6193, " ", $vqrange], _
		[562, 2616, " ", $vqrange], _
		[1049, -595, " ", $vqrange], _
		[3969, 573, " ", $vqrange], _
		[5717, 5604, " ", $vqrange], _
		[7635, 3729, " ", $vqrange], _
		[7537, 1108, " ", $vqrange], _
		[7073, -101, " ", $vqrange], _
		[5970, -1117, " ", $vqrange], _
		[7847, -3201, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

