#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aPockmarkFlatsTransitPath[4][2] = [ _
	[21699, 3672], _
	[20445, -5550], _
	[22000, -4500], _
	[24367, -4312] _
]

Func GoOutPockmarkFlats()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $PockmarkFlats_Map Then Return

	If $l_i_Map = $PockmarkFlats_Transit Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("RegentValley -> PockmarkFlats")
		_Vanquisher_RunAggroPortalPath($aPockmarkFlatsTransitPath, $vqrange, "outpost ")
		If GetMapID() <> $l_i_Map Then $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQPockmarkFlats()
	If GetMapID() <> $PockmarkFlats_Map And GetMapID() <> $PockmarkFlats_Transit Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("PockmarkFlats route waiting - on map " & GetMapID() & ", need " & $PockmarkFlats_Map & " via Regent Valley.")
		Return
	EndIf

	If GetMapID() = $PockmarkFlats_Transit Then
		_Vanquisher_ApplyDifficulty()
		GoOutPockmarkFlats()
		If GetMapID() <> $PockmarkFlats_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need PockmarkFlats (" & $PockmarkFlats_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $PockmarkFlats_Map Then
		CurrentAction("PockmarkFlats route waiting - on map " & GetMapID() & ", need " & $PockmarkFlats_Map & ".")
		Return
	EndIf

	CurrentAction("Starting PockmarkFlats vanquish route.")

	Local $aWaypoints[129][4] = [ _
		[-7392, 21465, " ", $vqrange], _
		[-7315, 18630, " ", $vqrange], _
		[-4508, 18501, " ", $vqrange], _
		[-1377, 17775, " ", $vqrange], _
		[-4731, 18513, " ", $vqrange], _
		[-8406, 18189, " ", $vqrange], _
		[-10746, 16921, " ", $vqrange], _
		[-10930, 13424, " ", $vqrange], _
		[-10165, 11446, " ", $vqrange], _
		[-10805, 10254, " ", $vqrange], _
		[-12111, 11644, " ", $vqrange], _
		[-14207, 10483, " ", $vqrange], _
		[-15573, 10978, " ", $vqrange], _
		[-15644, 9659, " ", $vqrange], _
		[-13654, 9985, " ", $vqrange], _
		[-13244, 8434, " ", $vqrange], _
		[-12073, 8883, " ", $vqrange], _
		[-10763, 9581, " ", $vqrange], _
		[-8313, 9350, " ", $vqrange], _
		[-5079, 7207, " ", $vqrange], _
		[-2706, 4651, " ", $vqrange], _
		[-1148, 5313, " ", $vqrange], _
		[-382, 5878, " ", $vqrange], _
		[903, 7988, " ", $vqrange], _
		[465, 11503, " ", $vqrange], _
		[1958, 12803, " ", $vqrange], _
		[2694, 13258, " ", $vqrange], _
		[2484, 15058, " ", $vqrange], _
		[2283, 15989, " ", $vqrange], _
		[383, 15952, " ", $vqrange], _
		[119, 17133, " ", $vqrange], _
		[1736, 17803, " ", $vqrange], _
		[1166, 19547, " ", $vqrange], _
		[2155, 21007, " ", $vqrange], _
		[1737, 21684, " ", $vqrange], _
		[2574, 22372, " ", $vqrange], _
		[3551, 22055, " ", $vqrange], _
		[6793, 23200, " ", $vqrange], _
		[6761, 21428, " ", $vqrange], _
		[6506, 20128, " ", $vqrange], _
		[6914, 18848, " ", $vqrange], _
		[8390, 19878, " ", $vqrange], _
		[10341, 18953, " ", $vqrange], _
		[10055, 17653, " ", $vqrange], _
		[8686, 17692, " ", $vqrange], _
		[8858, 17041, " ", $vqrange], _
		[9233, 16864, " ", $vqrange], _
		[9612, 16169, " ", $vqrange], _
		[11030, 17655, " ", $vqrange], _
		[11134, 18308, " ", $vqrange], _
		[11873, 17992, " ", $vqrange], _
		[11985, 17186, " ", $vqrange], _
		[12204, 15434, " ", $vqrange], _
		[10749, 13367, " ", $vqrange], _
		[10336, 11925, " ", $vqrange], _
		[8030, 8937, " ", $vqrange], _
		[7701, 8100, " ", $vqrange], _
		[6189, 8224, " ", $vqrange], _
		[7695, 8347, " ", $vqrange], _
		[8205, 10015, " ", $vqrange], _
		[6011, 10983, " ", $vqrange], _
		[5047, 10569, " ", $vqrange], _
		[4100, 10858, " ", $vqrange], _
		[2548, 9501, " ", $vqrange], _
		[4601, 12009, " ", $vqrange], _
		[5177, 10391, " ", $vqrange], _
		[6878, 11806, " ", $vqrange], _
		[11276, 11454, " ", $vqrange], _
		[11083, 9663, " ", $vqrange], _
		[12860, 10786, " ", $vqrange], _
		[13142, 10839, " ", $vqrange], _
		[15678, 13168, " ", $vqrange], _
		[16566, 12700, " ", $vqrange], _
		[15176, 10181, " ", $vqrange], _
		[14689, 9317, " ", $vqrange], _
		[13640, 8827, " ", $vqrange], _
		[13084, 9269, " ", $vqrange], _
		[14158, 6247, " ", $vqrange], _
		[15071, 5727, " ", $vqrange], _
		[15569, 4901, " ", $vqrange], _
		[15649, 4055, " ", $vqrange], _
		[12176, 1785, " ", $vqrange], _
		[12693, 42, " ", $vqrange], _
		[13659, -1823, " ", $vqrange], _
		[13112, -1783, " ", $vqrange], _
		[11492, -986, " ", $vqrange], _
		[10401, -817, " ", $vqrange], _
		[6682, -2001, " ", $vqrange], _
		[5387, -3574, " ", $vqrange], _
		[3661, -2286, " ", $vqrange], _
		[2714, 277, " ", $vqrange], _
		[1312, 899, " ", $vqrange], _
		[1257, -1047, " ", $vqrange], _
		[-532, -3152, " ", $vqrange], _
		[936, -3273, " ", $vqrange], _
		[1101, -2053, " ", $vqrange], _
		[1870, -2075, " ", $vqrange], _
		[4720, -5102, " ", $vqrange], _
		[6597, -4863, " ", $vqrange], _
		[7935, -3229, " ", $vqrange], _
		[10965, -5418, " ", $vqrange], _
		[12688, -8610, " ", $vqrange], _
		[13673, -9174, " ", $vqrange], _
		[12846, -11540, " ", $vqrange], _
		[12935, -14936, " ", $vqrange], _
		[11178, -15147, " ", $vqrange], _
		[10705, -14685, " ", $vqrange], _
		[7664, -17320, " ", $vqrange], _
		[8925, -22182, " ", $vqrange], _
		[10444, -22043, " ", $vqrange], _
		[8035, -22026, " ", $vqrange], _
		[2808, -19128, " ", $vqrange], _
		[5221, -13857, " ", $vqrange], _
		[6506, -12955, " ", $vqrange], _
		[5326, -10217, " ", $vqrange], _
		[3088, -9410, " ", $vqrange], _
		[-2553, -10171, " ", $vqrange], _
		[-2280, -9669, " ", $vqrange], _
		[-1515, -8613, " ", $vqrange], _
		[-5057, -10883, " ", $vqrange], _
		[-6794, -12990, " ", $vqrange], _
		[-6244, -13748, " ", $vqrange], _
		[-6161, -15114, " ", $vqrange], _
		[-7182, -21004, " ", $vqrange], _
		[-7263, -21058, " ", $vqrange], _
		[-7586, -16919, " ", $vqrange], _
		[-6301, -15101, " ", $vqrange], _
		[-3428, -17564, " ", $vqrange], _
		[1151, -14661, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
