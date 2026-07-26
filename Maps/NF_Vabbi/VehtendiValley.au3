#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutVehtendiValley()
	MoveTo(-1564, -2064)
	MoveTo(2447, -2438)
	MoveTo(2520, -4458)
	MoveTo(4337, -4834)
	Move(4550, -4834)
	WaitForLoad()
EndFunc

Func VQVehtendiValley()
    If GetMapID() <> $VehtendiValley_Map And GetMapID() <> $VehtendiValley_Outpost  Then TravelTo($VehtendiValley_Outpost)   
    If GetMapID() = $VehtendiValley_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $VehtendiValley_Map Then   
	
		Local $aWaypointsA[9][4] = [ [-4404, 16677, " ", $vqrange] _
		, [-1180, 16296, " ", $vqrange] _
		, [1124, 17817, " ", $vqrange] _
		, [1876, 19088, " ", $vqrange] _
		, [4162, 16908, " ", $vqrange] _
		, [6193, 18533, " ", $vqrange] _
		, [6118, 18583, " ", $vqrange] _
		, [7988, 17027, " ", $vqrange] _
		, [11041, 14874, " ", $vqrange] ]

		Local $aWaypointsB[56][4] = [ [13558, 13084, " ", $vqrange] _
		, [12688, 10949, " ", $vqrange] _
		, [12063, 8786, " ", $vqrange] _
		, [10658, 7699, " ", $vqrange] _
		, [12798, 10759, " ", $vqrange] _
		, [10011, 9881, " ", $vqrange] _
		, [8381, 8403, " ", $vqrange] _
		, [8880, 6287, " ", $vqrange] _
		, [8987, 3988, " ", $vqrange] _
		, [7861, 1773, " ", $vqrange] _
		, [9143, 4099, " ", $vqrange] _
		, [11965, 2143, " ", $vqrange] _
		, [13222, 825, " ", $vqrange] _
		, [13339, -593, " ", $vqrange] _
		, [13443, -2727, " ", $vqrange] _
		, [12773, -5469, " ", $vqrange] _
		, [13249, -6866, " ", $vqrange] _
		, [13446, -1698, " ", $vqrange] _
		, [13117, 1023, " ", $vqrange] _
		, [11959, 2138, " ", $vqrange] _
		, [8776, 3692, " ", $vqrange] _
		, [8297, -2208, " ", $vqrange] _
		, [7200, -3652, " ", $vqrange] _
		, [5527, -1781, " ", $vqrange] _
		, [7799, 2061, " ", $vqrange] _
		, [8969, 6240, " ", $vqrange] _
		, [9142, 9234, " ", $vqrange] _
		, [12360, 12520, " ", $vqrange] _
		, [10206, 14039, " ", $vqrange] _
		, [7892, 17058, " ", $vqrange] _
		, [6149, 18503, " ", $vqrange] _
		, [4178, 16647, " ", $vqrange] _
		, [875, 15720, " ", $vqrange] _
		, [-3844, 10751, " ", $vqrange] _
		, [-2427, 6242, " ", $vqrange] _
		, [-5882, 8095, " ", $vqrange] _
		, [-8259, 8475, " ", $vqrange] _
		, [-7712, 10273, " ", $vqrange] _
		, [-6742, 13325, " ", $vqrange] _
		, [-8240, 9537, " ", $vqrange] _
		, [-10424, 7413, " ", $vqrange] _
		, [-7963, 5121, " ", $vqrange] _
		, [-8141, 2999, " ", $vqrange] _
		, [-6645, 134, " ", $vqrange] _
		, [-6987, -3544, " ", $vqrange] _
		, [-9074, -5647, " ", $vqrange] _
		, [-11049, -4822, " ", $vqrange] _
		, [-12453, -2576, " ", $vqrange] _
		, [-11303, -3582, " ", $vqrange] _
		, [-9531, -5960, " ", $vqrange] _
		, [-8588, -8306, " ", $vqrange] _
		, [-5549, -9282, " ", $vqrange] _
		, [-6728, -10907, " ", $vqrange] _
		, [-8836, -12314, " ", $vqrange] _
		, [-10684, -11914, " ", $vqrange] _
		, [-11491, -15780, " ", $vqrange] ]

		Local $aWaypointsC[15][4] = [ [-11500, -15909, " ", $vqrange] _
		, [-10511, -12186, " ", $vqrange] _
		, [-6514, -14096, " ", $vqrange] _
		, [-7425, -15084, " ", $vqrange] _
		, [-7001, -18092, " ", $vqrange] _
		, [-2697, -17202, " ", $vqrange] _
		, [-755, -18480, " ", $vqrange] _
		, [-1581, -21345, " ", $vqrange] _
		, [-347, -18499, " ", $vqrange] _
		, [799, -22221, " ", $vqrange] _
		, [2468, -19544, " ", $vqrange] _
		, [6204, -19566, " ", $vqrange] _
		, [4604, -21646, " ", $vqrange] _
		, [7802, -19394, " ", $vqrange] _
		, [10464, -19008, " ", $vqrange] ]
		
		Local $aWaypointsD[31][4] = [ [12317, -12396, " ", $vqrange] _
		, [11719, -16228, " ", $vqrange] _
		, [7999, -19267, " ", $vqrange] _
		, [2561, -18669, " ", $vqrange] _
		, [4664, -17264, " ", $vqrange] _
		, [-792, -18319, " ", $vqrange] _
		, [-2805, -17231, " ", $vqrange] _
		, [-6503, -18024, " ", $vqrange] _
		, [-4195, -18850, " ", $vqrange] _
		, [-4830, -20669, " ", $vqrange] _
		, [-6873, -17643, " ", $vqrange] _
		, [-7368, -14815, " ", $vqrange] _
		, [-1233, -13832, " ", $vqrange] _
		, [498, -13299, " ", $vqrange] _
		, [3782, -11004, " ", $vqrange] _
		, [-915, -12891, " ", $vqrange] _
		, [1832, -9467, " ", $vqrange] _
		, [-3418, -11516, " ", $vqrange] _
		, [-7380, -12800, " ", $vqrange] _
		, [-9102, -13277, " ", $vqrange] _
		, [-5409, -9816, " ", $vqrange] _
		, [-1364, -9376, " ", $vqrange] _
		, [-214, -8216, " ", $vqrange] _
		, [-4318, -7250, " ", $vqrange] _
		, [-35, -5063, " ", $vqrange] _
		, [2751, -4320, " ", $vqrange] _
		, [4116, -6041, " ", $vqrange] _
		, [1444, -1810, " ", $vqrange] _
		, [-1749, -810, " ", $vqrange] _
		, [-758, 2142, " ", $vqrange] _
		, [-1611, 4203, " ", $vqrange] ]
		
		Local $aWaypoints[111][4] = [ [-4404, 16677, " ", $vqrange] _
		, [-1180, 16296, " ", $vqrange] _
		, [1124, 17817, " ", $vqrange] _
		, [1876, 19088, " ", $vqrange] _
		, [4162, 16908, " ", $vqrange] _
		, [6193, 18533, " ", $vqrange] _
		, [6118, 18583, " ", $vqrange] _
		, [7988, 17027, " ", $vqrange] _
		, [11041, 14874, " ", $vqrange] _
		, [13558, 13084, " ", $vqrange] _
		, [12688, 10949, " ", $vqrange] _
		, [12063, 8786, " ", $vqrange] _
		, [10658, 7699, " ", $vqrange] _
		, [12798, 10759, " ", $vqrange] _
		, [10011, 9881, " ", $vqrange] _
		, [8381, 8403, " ", $vqrange] _
		, [8880, 6287, " ", $vqrange] _
		, [8987, 3988, " ", $vqrange] _
		, [7861, 1773, " ", $vqrange] _
		, [9143, 4099, " ", $vqrange] _
		, [11965, 2143, " ", $vqrange] _
		, [13222, 825, " ", $vqrange] _
		, [13339, -593, " ", $vqrange] _
		, [13443, -2727, " ", $vqrange] _
		, [12773, -5469, " ", $vqrange] _
		, [13249, -6866, " ", $vqrange] _
		, [13446, -1698, " ", $vqrange] _
		, [13117, 1023, " ", $vqrange] _
		, [11959, 2138, " ", $vqrange] _
		, [8776, 3692, " ", $vqrange] _
		, [8297, -2208, " ", $vqrange] _
		, [7200, -3652, " ", $vqrange] _
		, [5527, -1781, " ", $vqrange] _
		, [7799, 2061, " ", $vqrange] _
		, [8969, 6240, " ", $vqrange] _
		, [9142, 9234, " ", $vqrange] _
		, [12360, 12520, " ", $vqrange] _
		, [10206, 14039, " ", $vqrange] _
		, [7892, 17058, " ", $vqrange] _
		, [6149, 18503, " ", $vqrange] _
		, [4178, 16647, " ", $vqrange] _
		, [875, 15720, " ", $vqrange] _
		, [-3844, 10751, " ", $vqrange] _
		, [-2427, 6242, " ", $vqrange] _
		, [-5882, 8095, " ", $vqrange] _
		, [-8259, 8475, " ", $vqrange] _
		, [-7712, 10273, " ", $vqrange] _
		, [-6742, 13325, " ", $vqrange] _
		, [-8240, 9537, " ", $vqrange] _
		, [-10424, 7413, " ", $vqrange] _
		, [-7963, 5121, " ", $vqrange] _
		, [-8141, 2999, " ", $vqrange] _
		, [-6645, 134, " ", $vqrange] _
		, [-6987, -3544, " ", $vqrange] _
		, [-9074, -5647, " ", $vqrange] _
		, [-11049, -4822, " ", $vqrange] _
		, [-12453, -2576, " ", $vqrange] _
		, [-11303, -3582, " ", $vqrange] _
		, [-9531, -5960, " ", $vqrange] _
		, [-8588, -8306, " ", $vqrange] _
		, [-5549, -9282, " ", $vqrange] _
		, [-6728, -10907, " ", $vqrange] _
		, [-8836, -12314, " ", $vqrange] _
		, [-10684, -11914, " ", $vqrange] _
		, [-11491, -15780, " ", $vqrange] _
		, [-11500, -15909, " ", $vqrange] _
		, [-10511, -12186, " ", $vqrange] _
		, [-6514, -14096, " ", $vqrange] _
		, [-7425, -15084, " ", $vqrange] _
		, [-7001, -18092, " ", $vqrange] _
		, [-2697, -17202, " ", $vqrange] _
		, [-755, -18480, " ", $vqrange] _
		, [-1581, -21345, " ", $vqrange] _
		, [-347, -18499, " ", $vqrange] _
		, [799, -22221, " ", $vqrange] _
		, [2468, -19544, " ", $vqrange] _
		, [6204, -19566, " ", $vqrange] _
		, [4604, -21646, " ", $vqrange] _
		, [7802, -19394, " ", $vqrange] _
		, [10464, -19008, " ", $vqrange] _
		, [12317, -12396, " ", $vqrange] _
		, [11719, -16228, " ", $vqrange] _
		, [7999, -19267, " ", $vqrange] _
		, [2561, -18669, " ", $vqrange] _
		, [4664, -17264, " ", $vqrange] _
		, [-792, -18319, " ", $vqrange] _
		, [-2805, -17231, " ", $vqrange] _
		, [-6503, -18024, " ", $vqrange] _
		, [-4195, -18850, " ", $vqrange] _
		, [-4830, -20669, " ", $vqrange] _
		, [-6873, -17643, " ", $vqrange] _
		, [-7368, -14815, " ", $vqrange] _
		, [-1233, -13832, " ", $vqrange] _
		, [498, -13299, " ", $vqrange] _
		, [3782, -11004, " ", $vqrange] _
		, [-915, -12891, " ", $vqrange] _
		, [1832, -9467, " ", $vqrange] _
		, [-3418, -11516, " ", $vqrange] _
		, [-7380, -12800, " ", $vqrange] _
		, [-9102, -13277, " ", $vqrange] _
		, [-5409, -9816, " ", $vqrange] _
		, [-1364, -9376, " ", $vqrange] _
		, [-214, -8216, " ", $vqrange] _
		, [-4318, -7250, " ", $vqrange] _
		, [-35, -5063, " ", $vqrange] _
		, [2751, -4320, " ", $vqrange] _
		, [4116, -6041, " ", $vqrange] _
		, [1444, -1810, " ", $vqrange] _
		, [-1749, -810, " ", $vqrange] _
		, [-758, 2142, " ", $vqrange] _
		, [-1611, 4203, " ", $vqrange] ]
		
		GoNearestNPCToCoords(-7552, 18559)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(9883, 13547)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-13485, -17893)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(12380, -15979)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc
