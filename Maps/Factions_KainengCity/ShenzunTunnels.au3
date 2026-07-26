#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutShenzunTunnels()
	MoveTo(-14603, 14336)
	MoveTo(-16087, 16510)
	MoveTo(-17399, 16601)
	Move(-17699, 16601)
	WaitForLoad()
EndFunc

Func VQShenzunTunnels()
    If GetMapID() <> $ShenzunTunnels_Map And GetMapID() <> $ShenzunTunnels_Outpost  Then TravelTo($ShenzunTunnels_Outpost)   
    If GetMapID() = $ShenzunTunnels_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ShenzunTunnels_Map Then    

		Local $aWaypoints[66][4] = [ [6219, -18196, " ", $vqrange] _
		, [6608, -13566, " ", $vqrange] _
		, [8030, -11589, " ", $vqrange] _
		, [7502, -9586, " ", $vqrange] _
		, [7434, -6495, " ", $vqrange] _
		, [10575, -7301, " ", $vqrange] _
		, [11583, -9555, " ", $vqrange] _
		, [12583, -10825, " ", $vqrange] _
		, [14631, -9762, " ", $vqrange] _
		, [14261, -12907, " ", $vqrange] _
		, [15274, -15290, " ", $vqrange] _
		, [12767, -14821, " ", $vqrange] _
		, [12489, -10865, " ", $vqrange] _
		, [10714, -7424, " ", $vqrange] _
		, [7810, -6446, " ", $vqrange] _
		, [8464, 370, " ", $vqrange] _
		, [11019, 1691, " ", $vqrange] _
		, [12730, 3333, " ", $vqrange] _
		, [12602, 6898, " ", $vqrange] _
		, [10724, 7010, " ", $vqrange] _
		, [11551, 8980, " ", $vqrange] _
		, [7714, 9017, " ", $vqrange] _
		, [7603, 14666, " ", $vqrange] _
		, [2114, 14383, " ", $vqrange] _
		, [-1542, 13628, " ", $vqrange] _
		, [-1327, 10336, " ", $vqrange] _
		, [-1286, 9958, " ", $vqrange] _
		, [2403, 8363, " ", $vqrange] _
		, [-4729, 8420, " ", $vqrange] _
		, [-4573, 5295, " ", $vqrange] _
		, [-924, 2913, " ", $vqrange] _
		, [-8271, 2857, " ", $vqrange] _
		, [-8330, -439, " ", $vqrange] _
		, [-11347, -1210, " ", $vqrange] _
		, [-13074, 1261, " ", $vqrange] _
		, [-11197, -2587, " ", $vqrange] _
		, [-11173, -7844, " ", $vqrange] _
		, [-8483, -10857, " ", $vqrange] _
		, [-4338, -13116, " ", $vqrange] _
		, [-4503, -15611, " ", $vqrange] _
		, [-5764, -16878, " ", $vqrange] _
		, [-8430, -18818, " ", $vqrange] _
		, [-4414, -18682, " ", $vqrange] _
		, [-5604, -13644, " ", $vqrange] _
		, [-1677, -13668, " ", $vqrange] _
		, [2557, -13925, " ", $vqrange] _
		, [2519, -11825, " ", $vqrange] _
		, [6390, -13105, " ", $vqrange] _
		, [7584, -9613, " ", $vqrange] _
		, [6216, -5519, " ", $vqrange] _
		, [3677, -7372, " ", $vqrange] _
		, [1810, -6321, " ", $vqrange] _
		, [237, -4405, " ", $vqrange] _
		, [-2448, -5409, " ", $vqrange] _
		, [-2697, -7301, " ", $vqrange] _
		, [-4361, -7456, " ", $vqrange] _
		, [-5387, -6125, " ", $vqrange] _
		, [-8228, -3523, " ", $vqrange] _
		, [-8218, 2407, " ", $vqrange] _
		, [-5939, 3539, " ", $vqrange] _
		, [1097, 2809, " ", $vqrange] _
		, [3677, 5163, " ", $vqrange] _
		, [6110, 3034, " ", $vqrange] _
		, [1542, 3357, " ", $vqrange] _
		, [1255, -373, " ", $vqrange] _
		, [-809, -571, " ", $vqrange] ]
		
		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc