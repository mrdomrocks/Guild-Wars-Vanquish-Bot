#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTuraisProcession()
	MoveTo(26313, 16414)
	Move(26250, 16700)
	WaitForLoad()
EndFunc

Func VQTuraisProcession()
    If GetMapID() <> $TuraisProcession_Map And GetMapID() <> $TuraisProcession_Outpost  Then TravelTo($TuraisProcession_Outpost)   
    If GetMapID() = $TuraisProcession_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TuraisProcession_Map Then    
		
		Local $aWaypointsA[20][4] = [ [-6114, -20397, " ", $vqrange] _
		, [-4095, -17921, " ", $vqrange] _
		, [-7340, -17788, " ", $vqrange] _
		, [-7129, -14349, " ", $vqrange] _
		, [-9775, -11217, " ", $vqrange] _
		, [-11367, -13182, " ", $vqrange] _
		, [-10584, -8710, " ", $vqrange] _
		, [-12454, -8124, " ", $vqrange] _
		, [-9570, -5586, " ", $vqrange] _
		, [-11426, 279, " ", $vqrange] _
		, [-8882, -6529, " ", $vqrange] _
		, [-3446, -8018, " ", $vqrange] _
		, [-1853, -13120, " ", $vqrange] _
		, [-2749, -15636, " ", $vqrange] _
		, [-403, -15660, " ", $vqrange] _
		, [3256, -13151, " ", $vqrange] _
		, [4929, -17848, " ", $vqrange] _
		, [9398, -15939, " ", $vqrange] _
		, [10032, -19318, " ", $vqrange] _
		, [10262, -21147, " ", $vqrange] ]

		Local $aWaypointsB[34][4] = [ [16845, -23993, " ", $vqrange] _
		, [10268, -22104, " ", $vqrange] _
		, [6317, -22580, " ", $vqrange] _
		, [5449, -25535, " ", $vqrange] _
		, [4545, -21667, " ", $vqrange] _
		, [4455, -21546, " ", $vqrange] _
		, [6764, -19356, " ", $vqrange] _
		, [1072, -21135, " ", $vqrange] _
		, [-812, -25178, " ", $vqrange] _
		, [3304, -19371, " ", $vqrange] _
		, [8992, -16200, " ", $vqrange] _
		, [10432, -10242, " ", $vqrange] _
		, [11613, -12250, " ", $vqrange] _
		, [12704, -14887, " ", $vqrange] _
		, [15599, -12502, " ", $vqrange] _
		, [15487, -9640, " ", $vqrange] _
		, [14804, -6757, " ", $vqrange] _
		, [15533, -2665, " ", $vqrange] _
		, [13076, 797, " ", $vqrange] _
		, [15344, 4044, " ", $vqrange] _
		, [15592, 6349, " ", $vqrange] _
		, [14703, 10349, " ", $vqrange] _
		, [15453, 14919, " ", $vqrange] _
		, [12926, 16778, " ", $vqrange] _
		, [16358, 19778, " ", $vqrange] _
		, [13656, 22827, " ", $vqrange] _
		, [8286, 20339, " ", $vqrange] _
		, [11660, 16386, " ", $vqrange] _
		, [12148, 13328, " ", $vqrange] _
		, [11971, 11561, " ", $vqrange] _
		, [8826, 10222, " ", $vqrange] _
		, [9130, 15367, " ", $vqrange] _
		, [7028, 10962, " ", $vqrange] _
		, [6328, 14296, " ", $vqrange] ]


		Local $aWaypointsC[56][4] = [ [-1206, 7737, " ", $vqrange] _
		, [-1714, 12661, " ", $vqrange] _
		, [-4191, 15211, " ", $vqrange] _
		, [-5624, 10294, " ", $vqrange] _
		, [-8673, 12630, " ", $vqrange] _
		, [-8531, 9412, " ", $vqrange] _
		, [-8474, 8810, " ", $vqrange] _
		, [-8277, 15154, " ", $vqrange] _
		, [-7447, 17536, " ", $vqrange] _
		, [-8840, 21652, " ", $vqrange] _
		, [-11937, 19326, " ", $vqrange] _
		, [-12461, 15858, " ", $vqrange] _
		, [-11086, 12746, " ", $vqrange] _
		, [-10381, 19330, " ", $vqrange] _
		, [-7094, 16539, " ", $vqrange] _
		, [-5324, 12986, " ", $vqrange] _
		, [-1697, 14280, " ", $vqrange] _
		, [-1329, 16055, " ", $vqrange] _
		, [-1105, 20670, " ", $vqrange] _
		, [4799, 15484, " ", $vqrange] _
		, [4377, 20201, " ", $vqrange] _
		, [5949, 18287, " ", $vqrange] _
		, [5236, 21926, " ", $vqrange] _
		, [2479, 25275, " ", $vqrange] _
		, [7386, 21123, " ", $vqrange] _
		, [7419, 24985, " ", $vqrange] _
		, [9601, 25052, " ", $vqrange] _
		, [11568, 16980, " ", $vqrange] _
		, [11438, 11747, " ", $vqrange] _
		, [9148, 9735, " ", $vqrange] _
		, [8387, 7643, " ", $vqrange] _
		, [10321, 3680, " ", $vqrange] _
		, [8591, 1165, " ", $vqrange] _
		, [5890, 3754, " ", $vqrange] _
		, [2027, 1566, " ", $vqrange] _
		, [5494, 2625, " ", $vqrange] _
		, [10085, 328, " ", $vqrange] _
		, [12636, 541, " ", $vqrange] _
		, [8527, -2589, " ", $vqrange] _
		, [8899, -6387, " ", $vqrange] _
		, [5702, -5887, " ", $vqrange] _
		, [8901, -7621, " ", $vqrange] _
		, [9035, -11435, " ", $vqrange] _
		, [4635, -11223, " ", $vqrange] _
		, [9605, -11358, " ", $vqrange] _
		, [8784, -5268, " ", $vqrange] _
		, [4635, -3445, " ", $vqrange] _
		, [1908, -5925, " ", $vqrange] _
		, [1495, -2190, " ", $vqrange] _
		, [4081, -2228, " ", $vqrange] _
		, [-2588, -820, " ", $vqrange] _
		, [-4504, -6234, " ", $vqrange] _
		, [-10008, -7587, " ", $vqrange] _
		, [-4131, -6352, " ", $vqrange] _
		, [-4009, -6989, " ", $vqrange] _
		, [-2476, -1151, " ", $vqrange] ]

		
		Local $aWaypoints[110][4] = [ [-6114, -20397, " ", $vqrange] _
		, [-4095, -17921, " ", $vqrange] _
		, [-7340, -17788, " ", $vqrange] _
		, [-7129, -14349, " ", $vqrange] _
		, [-9775, -11217, " ", $vqrange] _
		, [-11367, -13182, " ", $vqrange] _
		, [-10584, -8710, " ", $vqrange] _
		, [-12454, -8124, " ", $vqrange] _
		, [-9570, -5586, " ", $vqrange] _
		, [-11426, 279, " ", $vqrange] _
		, [-8882, -6529, " ", $vqrange] _
		, [-3446, -8018, " ", $vqrange] _
		, [-1853, -13120, " ", $vqrange] _
		, [-2749, -15636, " ", $vqrange] _
		, [-403, -15660, " ", $vqrange] _
		, [3256, -13151, " ", $vqrange] _
		, [4929, -17848, " ", $vqrange] _
		, [9398, -15939, " ", $vqrange] _
		, [10032, -19318, " ", $vqrange] _
		, [10262, -21147, " ", $vqrange] _
		, [16845, -23993, " ", $vqrange] _
		, [10268, -22104, " ", $vqrange] _
		, [6317, -22580, " ", $vqrange] _
		, [5449, -25535, " ", $vqrange] _
		, [4545, -21667, " ", $vqrange] _
		, [4455, -21546, " ", $vqrange] _
		, [6764, -19356, " ", $vqrange] _
		, [1072, -21135, " ", $vqrange] _
		, [-812, -25178, " ", $vqrange] _
		, [3304, -19371, " ", $vqrange] _
		, [8992, -16200, " ", $vqrange] _
		, [10432, -10242, " ", $vqrange] _
		, [11613, -12250, " ", $vqrange] _
		, [12704, -14887, " ", $vqrange] _
		, [15599, -12502, " ", $vqrange] _
		, [15487, -9640, " ", $vqrange] _
		, [14804, -6757, " ", $vqrange] _
		, [15533, -2665, " ", $vqrange] _
		, [13076, 797, " ", $vqrange] _
		, [15344, 4044, " ", $vqrange] _
		, [15592, 6349, " ", $vqrange] _
		, [14703, 10349, " ", $vqrange] _
		, [15453, 14919, " ", $vqrange] _
		, [12926, 16778, " ", $vqrange] _
		, [16358, 19778, " ", $vqrange] _
		, [13656, 22827, " ", $vqrange] _
		, [8286, 20339, " ", $vqrange] _
		, [11660, 16386, " ", $vqrange] _
		, [12148, 13328, " ", $vqrange] _
		, [11971, 11561, " ", $vqrange] _
		, [8826, 10222, " ", $vqrange] _
		, [9130, 15367, " ", $vqrange] _
		, [7028, 10962, " ", $vqrange] _
		, [6328, 14296, " ", $vqrange] _
		, [-1206, 7737, " ", $vqrange] _
		, [-1714, 12661, " ", $vqrange] _
		, [-4191, 15211, " ", $vqrange] _
		, [-5624, 10294, " ", $vqrange] _
		, [-8673, 12630, " ", $vqrange] _
		, [-8531, 9412, " ", $vqrange] _
		, [-8474, 8810, " ", $vqrange] _
		, [-8277, 15154, " ", $vqrange] _
		, [-7447, 17536, " ", $vqrange] _
		, [-8840, 21652, " ", $vqrange] _
		, [-11937, 19326, " ", $vqrange] _
		, [-12461, 15858, " ", $vqrange] _
		, [-11086, 12746, " ", $vqrange] _
		, [-10381, 19330, " ", $vqrange] _
		, [-7094, 16539, " ", $vqrange] _
		, [-5324, 12986, " ", $vqrange] _
		, [-1697, 14280, " ", $vqrange] _
		, [-1329, 16055, " ", $vqrange] _
		, [-1105, 20670, " ", $vqrange] _
		, [4799, 15484, " ", $vqrange] _
		, [4377, 20201, " ", $vqrange] _
		, [5949, 18287, " ", $vqrange] _
		, [5236, 21926, " ", $vqrange] _
		, [2479, 25275, " ", $vqrange] _
		, [7386, 21123, " ", $vqrange] _
		, [7419, 24985, " ", $vqrange] _
		, [9601, 25052, " ", $vqrange] _
		, [11568, 16980, " ", $vqrange] _
		, [11438, 11747, " ", $vqrange] _
		, [9148, 9735, " ", $vqrange] _
		, [8387, 7643, " ", $vqrange] _
		, [10321, 3680, " ", $vqrange] _
		, [8591, 1165, " ", $vqrange] _
		, [5890, 3754, " ", $vqrange] _
		, [2027, 1566, " ", $vqrange] _
		, [5494, 2625, " ", $vqrange] _
		, [10085, 328, " ", $vqrange] _
		, [12636, 541, " ", $vqrange] _
		, [8527, -2589, " ", $vqrange] _
		, [8899, -6387, " ", $vqrange] _
		, [5702, -5887, " ", $vqrange] _
		, [8901, -7621, " ", $vqrange] _
		, [9035, -11435, " ", $vqrange] _
		, [4635, -11223, " ", $vqrange] _
		, [9605, -11358, " ", $vqrange] _
		, [8784, -5268, " ", $vqrange] _
		, [4635, -3445, " ", $vqrange] _
		, [1908, -5925, " ", $vqrange] _
		, [1495, -2190, " ", $vqrange] _
		, [4081, -2228, " ", $vqrange] _
		, [-2588, -820, " ", $vqrange] _
		, [-4504, -6234, " ", $vqrange] _
		, [-10008, -7587, " ", $vqrange] _
		, [-4131, -6352, " ", $vqrange] _
		, [-4009, -6989, " ", $vqrange] _
		, [-2476, -1151, " ", $vqrange] ]
		
		GoNearestNPCToCoords(-10586, -24874)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(12830, -23732)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(1862, 12542)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc