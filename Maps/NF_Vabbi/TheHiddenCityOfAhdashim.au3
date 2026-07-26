#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTheHiddenCityOfAhdashim()
	MoveTo(1387, -20884)
	GoNearestNPCToCoords(1339, -20418)
	Sleep(1000)
	Dialog(0x00000081)
	Dialog(0x00000084)
	Sleep(1000)
	WaitForLoad()
EndFunc

Func VQTheHiddenCityOfAhdashim()
    If GetMapID() <> $TheHiddenCityOfAhdashim_Map And GetMapID() <> $TheHiddenCityOfAhdashim_Outpost  Then TravelTo($TheHiddenCityOfAhdashim_Outpost)   
    If GetMapID() = $TheHiddenCityOfAhdashim_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TheHiddenCityOfAhdashim_Map Then    
		
		Local $aWaypointsA[12][4] = [ [3423, -16710, " ", $vqrange] _
		, [2154, -14822, " ", $vqrange] _
		, [-393, -15021, " ", $vqrange] _
		, [-474, -17564, " ", $vqrange] _
		, [-19, -13156, " ", $vqrange] _
		, [-185, -11752, " ", $vqrange] _
		, [-4152, -11656, " ", $vqrange] _
		, [-6993, -11916, " ", $vqrange] _
		, [-10156, -11631, " ", $vqrange] _
		, [-7549, -9195, " ", $vqrange] _
		, [-10154, -8474, " ", $vqrange] _
		, [-6813, -7554, " ", $vqrange] ]

		Local $aWaypointsB[34][4] = [ [-4265, -2891, " ", $vqrange] _
		, [-4442, 171, " ", $vqrange] _
		, [-8162, 583, " ", $vqrange] _
		, [-8692, 3715, " ", $vqrange] _
		, [-9155, 3809, " ", $vqrange] _
		, [-9156, 9105, " ", $vqrange] _
		, [-9022, 10796, " ", $vqrange] _
		, [-10235, 9829, " ", $vqrange] _
		, [-12395, 7774, " ", $vqrange] _
		, [-13728, 9050, " ", $vqrange] _
		, [-13673, 12758, " ", $vqrange] _
		, [-13628, 14340, " ", $vqrange] _
		, [-12412, 15488, " ", $vqrange] _
		, [-12354, 14646, " ", $vqrange] _
		, [-9971, 12180, " ", $vqrange] _
		, [-12490, 14769, " ", $vqrange] _
		, [-11150, 16442, " ", $vqrange] _
		, [-7067, 16380, " ", $vqrange] _
		, [-5789, 14135, " ", $vqrange] _
		, [-8498, 12217, " ", $vqrange] _
		, [-8357, 10147, " ", $vqrange] _
		, [-5874, 7951, " ", $vqrange] _
		, [-4347, 9488, " ", $vqrange] _
		, [-4626, 13425, " ", $vqrange] _
		, [-4774, 15572, " ", $vqrange] _
		, [-2168, 15184, " ", $vqrange] _
		, [1502, 14238, " ", $vqrange] _
		, [1322, 10303, " ", $vqrange] _
		, [1574, 15820, " ", $vqrange] _
		, [1304, 19656, " ", $vqrange] _
		, [1455, 14259, " ", $vqrange] _
		, [3653, 14076, " ", $vqrange] _
		, [5512, 12176, " ", $vqrange] _
		, [8922, 12876, " ", $vqrange] ]

		Local $aWaypointsC[15][4] = [ [ 10113, 16181, " ", $vqrange] _
		, [11436, 17456, " ", $vqrange] _
		, [12644, 15487, " ", $vqrange] _
		, [15088, 13746, " ", $vqrange] _
		, [15337, 11745, " ", $vqrange] _
		, [15198, 10349, " ", $vqrange] _
		, [14284, 9072, " ", $vqrange] _
		, [13702, 7887, " ", $vqrange] _
		, [11893, 8835, " ", $vqrange] _
		, [11828, 10951, " ", $vqrange] _
		, [13811, 7781, " ", $vqrange] _
		, [15092, 4135, " ", $vqrange] _
		, [15133, 1062, " ", $vqrange] _
		, [14316, -1902, " ", $vqrange] _
		, [13173, -3855, " ", $vqrange] ]

		Local $aWaypointsD[50][4] = [ [ 13670, -5095, " ", $vqrange] _
		, [14552, -5865, " ", $vqrange] _
		, [13948, -7314, " ", $vqrange] _
		, [13746, -8817, " ", $vqrange] _
		, [12038, -8805, " ", $vqrange] _
		, [12772, -11382, " ", $vqrange] _
		, [9979, -9691, " ", $vqrange] _
		, [5858, -10548, " ", $vqrange] _
		, [4380, -11809, " ", $vqrange] _
		, [2566, -11987, " ", $vqrange] _
		, [2348, -14642, " ", $vqrange] _
		, [1246, -14608, " ", $vqrange] _
		, [1195, -10655, " ", $vqrange] _
		, [-725, -7851, " ", $vqrange] _
		, [1581, -6794, " ", $vqrange] _
		, [1505, -4201, " ", $vqrange] _
		, [-105, -1110, " ", $vqrange] _
		, [1410, -1168, " ", $vqrange] _
		, [1371, -1376, " ", $vqrange] _
		, [2398, 1731, " ", $vqrange] _
		, [1433, 81, " ", $vqrange] _
		, [2855, 3633, " ", $vqrange] _
		, [14, 3582, " ", $vqrange] _
		, [1038, 3757, " ", $vqrange] _
		, [1100, 5523, " ", $vqrange] _
		, [4543, 5383, " ", $vqrange] _
		, [4669, 4350, " ", $vqrange] _
		, [6301, 4040, " ", $vqrange] _
		, [6483, 992, " ", $vqrange] _
		, [6482, -2161, " ", $vqrange] _
		, [9164, 1364, " ", $vqrange] _
		, [10656, 1569, " ", $vqrange] _
		, [11393, 5614, " ", $vqrange] _
		, [10516, 6789, " ", $vqrange] _
		, [11460, 4726, " ", $vqrange] _
		, [10285, 1487, " ", $vqrange] _
		, [6563, 2284, " ", $vqrange] _
		, [5768, 4297, " ", $vqrange] _
		, [2917, 5498, " ", $vqrange] _
		, [1058, 5309, " ", $vqrange] _
		, [1065, 3624, " ", $vqrange] _
		, [3868, 5128, " ", $vqrange] _
		, [4344, 9598, " ", $vqrange] _
		, [-945, 9524, " ", $vqrange] _
		, [1408, 9725, " ", $vqrange] _
		, [1467, 14273, " ", $vqrange] _
		, [1454, 19405, " ", $vqrange] _
		, [-2592, 20778, " ", $vqrange] _
		, [991, 23002, " ", $vqrange] _
		, [64, 24479, " ", $vqrange] ]
		
		Local $aWaypoints[111][4] = [ [3423, -16710, " ", $vqrange] _
		, [2154, -14822, " ", $vqrange] _
		, [-393, -15021, " ", $vqrange] _
		, [-474, -17564, " ", $vqrange] _
		, [-19, -13156, " ", $vqrange] _
		, [-185, -11752, " ", $vqrange] _
		, [-4152, -11656, " ", $vqrange] _
		, [-6993, -11916, " ", $vqrange] _
		, [-10156, -11631, " ", $vqrange] _
		, [-7549, -9195, " ", $vqrange] _
		, [-10154, -8474, " ", $vqrange] _
		, [-6813, -7554, " ", $vqrange] _
		, [-4265, -2891, " ", $vqrange] _
		, [-4442, 171, " ", $vqrange] _
		, [-8162, 583, " ", $vqrange] _
		, [-8692, 3715, " ", $vqrange] _
		, [-9155, 3809, " ", $vqrange] _
		, [-9156, 9105, " ", $vqrange] _
		, [-9022, 10796, " ", $vqrange] _
		, [-10235, 9829, " ", $vqrange] _
		, [-12395, 7774, " ", $vqrange] _
		, [-13728, 9050, " ", $vqrange] _
		, [-13673, 12758, " ", $vqrange] _
		, [-13628, 14340, " ", $vqrange] _
		, [-12412, 15488, " ", $vqrange] _
		, [-12354, 14646, " ", $vqrange] _
		, [-9971, 12180, " ", $vqrange] _
		, [-12490, 14769, " ", $vqrange] _
		, [-11150, 16442, " ", $vqrange] _
		, [-7067, 16380, " ", $vqrange] _
		, [-5789, 14135, " ", $vqrange] _
		, [-8498, 12217, " ", $vqrange] _
		, [-8357, 10147, " ", $vqrange] _
		, [-5874, 7951, " ", $vqrange] _
		, [-4347, 9488, " ", $vqrange] _
		, [-4626, 13425, " ", $vqrange] _
		, [-4774, 15572, " ", $vqrange] _
		, [-2168, 15184, " ", $vqrange] _
		, [1502, 14238, " ", $vqrange] _
		, [1322, 10303, " ", $vqrange] _
		, [1574, 15820, " ", $vqrange] _
		, [1304, 19656, " ", $vqrange] _
		, [1455, 14259, " ", $vqrange] _
		, [3653, 14076, " ", $vqrange] _
		, [5512, 12176, " ", $vqrange] _
		, [8922, 12876, " ", $vqrange] _
		, [10113, 16181, " ", $vqrange] _
		, [11436, 17456, " ", $vqrange] _
		, [12644, 15487, " ", $vqrange] _
		, [15088, 13746, " ", $vqrange] _
		, [15337, 11745, " ", $vqrange] _
		, [15198, 10349, " ", $vqrange] _
		, [14284, 9072, " ", $vqrange] _
		, [13702, 7887, " ", $vqrange] _
		, [11893, 8835, " ", $vqrange] _
		, [11828, 10951, " ", $vqrange] _
		, [13811, 7781, " ", $vqrange] _
		, [15092, 4135, " ", $vqrange] _
		, [15133, 1062, " ", $vqrange] _
		, [14316, -1902, " ", $vqrange] _
		, [13173, -3855, " ", $vqrange] _
		, [13670, -5095, " ", $vqrange] _
		, [14552, -5865, " ", $vqrange] _
		, [13948, -7314, " ", $vqrange] _
		, [13746, -8817, " ", $vqrange] _
		, [12038, -8805, " ", $vqrange] _
		, [12772, -11382, " ", $vqrange] _
		, [9979, -9691, " ", $vqrange] _
		, [5858, -10548, " ", $vqrange] _
		, [4380, -11809, " ", $vqrange] _
		, [2566, -11987, " ", $vqrange] _
		, [2348, -14642, " ", $vqrange] _
		, [1246, -14608, " ", $vqrange] _
		, [1195, -10655, " ", $vqrange] _
		, [-725, -7851, " ", $vqrange] _
		, [1581, -6794, " ", $vqrange] _
		, [1505, -4201, " ", $vqrange] _
		, [-105, -1110, " ", $vqrange] _
		, [1410, -1168, " ", $vqrange] _
		, [1371, -1376, " ", $vqrange] _
		, [2398, 1731, " ", $vqrange] _
		, [1433, 81, " ", $vqrange] _
		, [2855, 3633, " ", $vqrange] _
		, [14, 3582, " ", $vqrange] _
		, [1038, 3757, " ", $vqrange] _
		, [1100, 5523, " ", $vqrange] _
		, [4543, 5383, " ", $vqrange] _
		, [4669, 4350, " ", $vqrange] _
		, [6301, 4040, " ", $vqrange] _
		, [6483, 992, " ", $vqrange] _
		, [6482, -2161, " ", $vqrange] _
		, [9164, 1364, " ", $vqrange] _
		, [10656, 1569, " ", $vqrange] _
		, [11393, 5614, " ", $vqrange] _
		, [10516, 6789, " ", $vqrange] _
		, [11460, 4726, " ", $vqrange] _
		, [10285, 1487, " ", $vqrange] _
		, [6563, 2284, " ", $vqrange] _
		, [5768, 4297, " ", $vqrange] _
		, [2917, 5498, " ", $vqrange] _
		, [1058, 5309, " ", $vqrange] _
		, [1065, 3624, " ", $vqrange] _
		, [3868, 5128, " ", $vqrange] _
		, [4344, 9598, " ", $vqrange] _
		, [-945, 9524, " ", $vqrange] _
		, [1408, 9725, " ", $vqrange] _
		, [1467, 14273, " ", $vqrange] _
		, [1454, 19405, " ", $vqrange] _
		, [-2592, 20778, " ", $vqrange] _
		, [991, 23002, " ", $vqrange] _
		, [64, 24479, " ", $vqrange] ]
		
		GoNearestNPCToCoords(2222, -19038)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-6828, -3803)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(9543, 14725)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(12398, -2575)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		Sleep(20000)
		MoveandAggroVQ($aWaypointsD)

		CommandAll(-4818, 24061)
		MoveTo(-5960, 23014)
		AggroMoveTo(-5965, 23014)
		CancelAll()
		AggroMoveTo(-6743, 22429)
			
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc