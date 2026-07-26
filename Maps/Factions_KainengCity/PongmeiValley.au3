#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutPongmeiValley()
	MoveTo(-12095, 12430)
	MoveTo(-13340, 11692)
	Move(-13351, 11081)
	WaitForLoad()
EndFunc

Func VQPongmeiValley()
    If GetMapID() <> $PongmeiValley_Map And GetMapID() <> $PongmeiValley_Outpost  Then TravelTo($PongmeiValley_Outpost)   
    If GetMapID() = $PongmeiValley_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $PongmeiValley_Map Then    
		
		Local $aWaypoints[73][4] = [ [-13428, 8312, " ", $vqrange] _		
		, [-15570, 9936, " ", $vqrange] _
		, [-17509, 8482, " ", $vqrange] _
		, [-15625, 6067, " ", $vqrange] _
		, [-18833, 2917, " ", $vqrange] _
		, [-14179.10, 3751.15, " ", $vqrange] _
		, [-14746.78, 3798.06, " ", $vqrange] _
		, [-18041, -1049, " ", $vqrange] _
		, [-16925, -4475, " ", $vqrange] _
		, [-17722, -7081, " ", $vqrange] _
		, [-15496, -8294, " ", $vqrange] _
		, [-15174, -6369, " ", $vqrange] _
		, [-13164, -7720, " ", $vqrange] _
		, [-11877, -6426, " ", $vqrange] _
		, [-13288, -4409, " ", $vqrange] _
		, [-11763, -2373, " ", $vqrange] _
		, [-16924, 278, " ", $vqrange] _
		, [-12692, 5583, " ", $vqrange] _
		, [-9831, -1487, " ", $vqrange] _
		, [-3790, -1040, " ", $vqrange] _
		, [-1940, -623, " ", $vqrange] _
		, [222, -563, " ", $vqrange] _
		, [449, 2157, " ", $vqrange] _
		, [-608, 1866, " ", $vqrange] _
		, [541, 1356, " ", $vqrange] _
		, [9289, -1944, " ", $vqrange] _
		, [11050, 35, " ", $vqrange] _
		, [12185, -2396, " ", $vqrange] _
		, [15556, -5740, " ", $vqrange] _
		, [14775, -5692, " ", $vqrange] _
		, [13611, -7825, " ", $vqrange] _
		, [16681, -8381, " ", $vqrange] _
		, [13534, -7833, " ", $vqrange] _
		, [16511, -3525, " ", $vqrange] _
		, [18513, -2091, " ", $vqrange] _
		, [17152, 166, " ", $vqrange] _
		, [19997, 2657, " ", $vqrange] _
		, [21899, 1875, " ", $vqrange] _
		, [21916, 4046, " ", $vqrange] _
		, [22195, 5706, " ", $vqrange] _
		, [19092, 4312, " ", $vqrange] _
		, [16256, -1079, " ", $vqrange] _
		, [13825, 208, " ", $vqrange] _
		, [14457, 2480, " ", $vqrange] _
		, [13544, 3105, " ", $vqrange] _
		, [13037.30, 7787.66, " ", $vqrange] _
		, [14870, 3974, " ", $vqrange] _
		, [11183, 6826, " ", $vqrange] _
		, [7552, 9867, " ", $vqrange] _
		, [7552, 9867, " ", $vqrange] _
		, [7501, 13213, " ", $vqrange] _
		, [8129, 13732, " ", $vqrange] _
		, [9475, 13779, " ", $vqrange] _
		, [12437, 13885, " ", $vqrange] _
		, [13119, 13748, " ", $vqrange] _
		, [15660, 14835, " ", $vqrange] _
		, [14561, 14380, " ", $vqrange] _
		, [12419, 13420, " ", $vqrange] _
		, [7869, 12926, " ", $vqrange] _
		, [6761, 9315, " ", $vqrange] _
		, [5047, 11276, " ", $vqrange] _
		, [3398, 6640, " ", $vqrange] _
		, [1392, 5429, " ", $vqrange] _
		, [1000, 7005, " ", $vqrange] _
		, [475, 5788, " ", $vqrange] _
		, [-624, 7015, " ", $vqrange] _
		, [-709, 8664, " ", $vqrange] _
		, [-2490, 8611, " ", $vqrange] _
		, [-2299, 6625, " ", $vqrange] _
		, [-5234, 6004, " ", $vqrange] _
		, [-7448, 6511, " ", $vqrange] _
		, [-8561, 4527, " ", $vqrange] _
		, [-6338.81, 2517.30, " ", $vqrange] ]
		MoveandAggroVQFullRoute($aWaypoints)
    EndIf
EndFunc
