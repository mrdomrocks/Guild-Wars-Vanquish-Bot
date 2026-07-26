#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aEasternFrontierTransitPath[4][2] = [ _
	[3551, 22055], _
	[6793, 23200], _
	[8200, 25000], _
	[9660, 26445] _
]

Func GoOutEasternFrontier()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $EasternFrontier_Map Then Return

	If $l_i_Map = $EasternFrontier_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("PockmarkFlats -> EasternFrontier")
		_Vanquisher_RunAggroPortalPath($aEasternFrontierTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQEasternFrontier()
	If GetMapID() <> $EasternFrontier_Map And GetMapID() <> $EasternFrontier_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("EasternFrontier route waiting - on map " & GetMapID() & ", need " & $EasternFrontier_Map & " via Pockmark Flats.")
		Return
	EndIf

	If GetMapID() = $EasternFrontier_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutEasternFrontier()
		If GetMapID() <> $EasternFrontier_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need EasternFrontier (" & $EasternFrontier_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $EasternFrontier_Map Then
		CurrentAction("EasternFrontier route waiting - on map " & GetMapID() & ", need " & $EasternFrontier_Map & ".")
		Return
	EndIf

	CurrentAction("Starting EasternFrontier vanquish route.")

	Local $aWaypoints[103][4] = [ _
		[-16892, 10937, " ", $vqrange], _
		[-15601, 12640, " ", $vqrange], _
		[-13350, 13968, " ", $vqrange], _
		[-12351, 13110, " ", $vqrange], _
		[-10717, 13340, " ", $vqrange], _
		[-12078, 17865, " ", $vqrange], _
		[-10721, 13219, " ", $vqrange], _
		[-7478, 9681, " ", $vqrange], _
		[-11168, 9287, " ", $vqrange], _
		[-15336, 9062, " ", $vqrange], _
		[-14801, 6390, " ", $vqrange], _
		[-15336, 9062, " ", $vqrange], _
		[-11514, 9391, " ", $vqrange], _
		[-8903, 7486, " ", $vqrange], _
		[-6821, 9717, " ", $vqrange], _
		[-1774, 9404, " ", $vqrange], _
		[1594, 9847, " ", $vqrange], _
		[1866, 11243, " ", $vqrange], _
		[185, 12791, " ", $vqrange], _
		[-822, 14331, " ", $vqrange], _
		[-976, 17386, " ", $vqrange], _
		[1179, 16414, " ", $vqrange], _
		[2186, 17232, " ", $vqrange], _
		[4853, 17355, " ", $vqrange], _
		[3919, 18433, " ", $vqrange], _
		[2150, 18623, " ", $vqrange], _
		[3919, 18433, " ", $vqrange], _
		[5572, 16863, " ", $vqrange], _
		[3559, 14224, " ", $vqrange], _
		[5957, 10997, " ", $vqrange], _
		[3193, 7752, " ", $vqrange], _
		[4794, 6422, " ", $vqrange], _
		[3288, 7727, " ", $vqrange], _
		[5928, 10701, " ", $vqrange], _
		[8519, 9248, " ", $vqrange], _
		[8146, 12163, " ", $vqrange], _
		[7735, 14641, " ", $vqrange], _
		[8733, 14322, " ", $vqrange], _
		[11388, 16268, " ", $vqrange], _
		[8151, 13904, " ", $vqrange], _
		[8342, 12867, " ", $vqrange], _
		[11428, 11064, " ", $vqrange], _
		[10678, 8729, " ", $vqrange], _
		[11428, 11064, " ", $vqrange], _
		[13605, 12628, " ", $vqrange], _
		[14035, 15086, " ", $vqrange], _
		[15655, 16110, " ", $vqrange], _
		[13853, 12388, " ", $vqrange], _
		[16506, 10532, " ", $vqrange], _
		[16019, 9948, " ", $vqrange], _
		[14237, 5880, " ", $vqrange], _
		[10250, 1694, " ", $vqrange], _
		[9685, -3943, " ", $vqrange], _
		[11994, -6813, " ", $vqrange], _
		[12603, -5370, " ", $vqrange], _
		[14374, -1676, " ", $vqrange], _
		[16013, 196, " ", $vqrange], _
		[17831, -1257, " ", $vqrange], _
		[16789, -2086, " ", $vqrange], _
		[17118, -2855, " ", $vqrange], _
		[18664, -6714, " ", $vqrange], _
		[16336, -6589, " ", $vqrange], _
		[15716, -6123, " ", $vqrange], _
		[11029, -9075, " ", $vqrange], _
		[9140, -13964, " ", $vqrange], _
		[8588, -15089, " ", $vqrange], _
		[12257, -15238, " ", $vqrange], _
		[14512, -17568, " ", $vqrange], _
		[12211, -15227, " ", $vqrange], _
		[8702, -14924, " ", $vqrange], _
		[9114, -13552, " ", $vqrange], _
		[6291, -13587, " ", $vqrange], _
		[4213, -12019, " ", $vqrange], _
		[1411, -10264, " ", $vqrange], _
		[-1269, -5016, " ", $vqrange], _
		[-4943, -2688, " ", $vqrange], _
		[-601, -3038, " ", $vqrange], _
		[2548, -5660, " ", $vqrange], _
		[3758, -9962, " ", $vqrange], _
		[5035, -7294, " ", $vqrange], _
		[2548, -5660, " ", $vqrange], _
		[3864, -4470, " ", $vqrange], _
		[3563, -422, " ", $vqrange], _
		[5374, -769, " ", $vqrange], _
		[5179, 1880, " ", $vqrange], _
		[4210, 2285, " ", $vqrange], _
		[2275, 1843, " ", $vqrange], _
		[4026, -4891, " ", $vqrange], _
		[-535, -3048, " ", $vqrange], _
		[-1164, -7493, " ", $vqrange], _
		[-136, -10058, " ", $vqrange], _
		[377, -13322, " ", $vqrange], _
		[-809, -14901, " ", $vqrange], _
		[-2560, -15337, " ", $vqrange], _
		[-3232, -14389, " ", $vqrange], _
		[-2114, -11829, " ", $vqrange], _
		[-3625, -10820, " ", $vqrange], _
		[-5535, -13348, " ", $vqrange], _
		[-5048, -8146, " ", $vqrange], _
		[-7834, -2553, " ", $vqrange], _
		[-9740, -31, " ", $vqrange], _
		[-11286, 1175, " ", $vqrange], _
		[-8440, 2016, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
