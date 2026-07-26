#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutZenDaijun()
	MoveTo(19571.55, 9977.90)
	GoNearestNPCToCoords(20290.98, 9131.50)
	Sleep(1000)
	Dialog(0x7F)
	Dialog(0x800009)
	Dialog(0x80000B)
	Sleep(1000)
	WaitForLoad()
EndFunc

Func VQZenDaijun()
    If GetMapID() <> $ZenDaijun_Map And GetMapID() <> $ZenDaijun_Outpost  Then TravelTo($ZenDaijun_Outpost)   
    If GetMapID() = $ZenDaijun_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $ZenDaijun_Map Then    

		Local $aWaypoints[76][4] = [ [-15213, 5733, " ", $vqrange] _		
		, [-13906, 6686, " ", $vqrange] _
		, [-9492, 7750, " ", $vqrange] _
		, [-7983, 8813, " ", $vqrange] _
		, [-8235, 11710, " ", $vqrange] _
		, [-4206, 12079, " ", $vqrange] _
		, [-5487, 9394, " ", $vqrange] _
		, [-1508, 11708, " ", $vqrange] _
		, [1595, 11075, " ", $vqrange] _
		, [872, 6680, " ", $vqrange] _
		, [4631, 3532, " ", $vqrange] _
		, [3856, 2722, " ", $vqrange] _
		, [5436, 2423, " ", $vqrange] _
		, [7623, 4605, " ", $vqrange] _
		, [8718, 4992, " ", $vqrange] _
		, [11258, 3055, " ", $vqrange] _
		, [11636, 953, " ", $vqrange] _
		, [13762, 3164, " ", $vqrange] _
		, [14968, 4497, " ", $vqrange] _
		, [16940, 1689, " ", $vqrange] _
		, [19174, 1424, " ", $vqrange] _
		, [19646, -874, " ", $vqrange] _
		, [19548, -4022, " ", $vqrange] _
		, [17505, -3429, " ", $vqrange] _
		, [19836, -820, " ", $vqrange] _
		, [17332, 1856, " ", $vqrange] _
		, [17443, 5539, " ", $vqrange] _
		, [19363, 4988, " ", $vqrange] _
		, [18060, 8422, " ", $vqrange] _
		, [17509, 9168, " ", $vqrange] _
		, [14666, 9781, " ", $vqrange] _
		, [13765, 13088, " ", $vqrange] _
		, [12249, 10962, " ", $vqrange] _
		, [12627, 8621, " ", $vqrange] _
		, [13739, 7149, " ", $vqrange] _
		, [12749, 6538, " ", $vqrange] _
		, [12156, 4356, " ", $vqrange] _
		, [10448, 5981, " ", $vqrange] _
		, [10639, 7924, " ", $vqrange] _
		, [10246, 8935, " ", $vqrange] _
		, [8304, 8095, " ", $vqrange] _
		, [9989, 8134, " ", $vqrange] _
		, [7188, 3081, " ", $vqrange] _
		, [5287, -255, " ", $vqrange] _
		, [2432, -288, " ", $vqrange] _
		, [241, 2093, " ", $vqrange] _
		, [613, 3981, " ", $vqrange] _
		, [3542, -470, " ", $vqrange] _
		, [6980, -2634, " ", $vqrange] _
		, [6335, -5822, " ", $vqrange] _
		, [8781, -8060, " ", $vqrange] _
		, [8633, -10027, " ", $vqrange] _
		, [5871, -10060, " ", $vqrange] _
		, [3468, -6259, " ", $vqrange] _
		, [1193, -3641, " ", $vqrange] _
		, [-2880, -3109, " ", $vqrange] _
		, [1750, -4085, " ", $vqrange] _
		, [3003, -9504, " ", $vqrange] _
		, [-136, -10506, " ", $vqrange] _
		, [-447, -7844, " ", $vqrange] _
		, [-5778, -9085, " ", $vqrange] _
		, [-8419, -5901, " ", $vqrange] _
		, [-11229, -4384, " ", $vqrange] _
		, [-13441, -5396, " ", $vqrange] _
		, [-12457, -11032, " ", $vqrange] _
		, [-15775, -10195, " ", $vqrange] _
		, [-17950, -9186, " ", $vqrange] _
		, [-19437, -3650, " ", $vqrange] _
		, [-17673, -2596, " ", $vqrange] _
		, [-13644, -5082, " ", $vqrange] _
		, [-12653, -746, " ", $vqrange] _
		, [-12127, 928, " ", $vqrange] _
		, [-11514, 3003, " ", $vqrange] _
		, [-9602, 3877, " ", $vqrange] _
		, [-5585, 3445, " ", $vqrange] _
		, [-8017, 6339, " ", $vqrange] ]			
		MoveandAggroVQFullRoute($aWaypoints)
    EndIf
EndFunc
