#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutDejarinEstate()
	MoveTo(3715, 2181)
	MoveTo(4451, 3557)
	Move(4550, 3710)
	WaitForLoad()
EndFunc

Func VQDejarinEstate()
    If GetMapID() <> $DejarinEstate_Map And GetMapID() <> $DejarinEstate_Outpost  Then TravelTo($DejarinEstate_Outpost)   
    If GetMapID() = $DejarinEstate_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $DejarinEstate_Map Then    
		
		Local $aWaypointsA[10][4] = [ [-17504, -16545, " ", $vqrange] _
		, [-15681, -11678, " ", $vqrange] _	
		, [-15433, -7796, " ", $vqrange] _
		, [-12219, -9120, " ", $vqrange] _
		, [-14806, -4783, " ", $vqrange] _
		, [-14784, -5197, " ", $vqrange] _
		, [-16254, -3439, " ", $vqrange] _
		, [-16772, -1006, " ", $vqrange] _
		, [-15502, -784, " ", $vqrange] _
		, [-15212, -3882, " ", $vqrange] ]
			

		Local $aWaypointsB[92][4] = [ [-14086, 1905, " ", $vqrange] _
		, [-13974, 4614, " ", $vqrange] _
		, [-11814, 4770, " ", $vqrange] _
		, [-12872, 7805, " ", $vqrange] _
		, [-15499, 8074, " ", $vqrange] _
		, [-14735, 11936, " ", $vqrange] _
		, [-14243, 14025, " ", $vqrange] _
		, [-17003, 16576, " ", $vqrange] _
		, [-16414, 18811, " ", $vqrange] _
		, [-8870, 17044, " ", $vqrange] _
		, [-4431, 17118, " ", $vqrange] _
		, [-2183, 15152, " ", $vqrange] _
		, [860, 12027, " ", $vqrange] _
		, [3127, 13781, " ", $vqrange] _
		, [2641, 18347, " ", $vqrange] _
		, [3127, 13781, " ", $vqrange] _
		, [3017, 10646, " ", $vqrange] _
		, [2195, 7855, " ", $vqrange] _
		, [1909, 7794, " ", $vqrange] _
		, [5819, 7678, " ", $vqrange] _
		, [6411, 4182, " ", $vqrange] _
		, [5823, 7632, " ", $vqrange] _
		, [11026, 7515, " ", $vqrange] _
		, [13102, 4830, " ", $vqrange] _
		, [16789, 7732, " ", $vqrange] _
		, [16895, 7864, " ", $vqrange] _
		, [14892, 11895, " ", $vqrange] _
		, [15495, 14552, " ", $vqrange] _
		, [15073, 16897, " ", $vqrange] _
		, [17874, 13884, " ", $vqrange] _
		, [16476, 8195, " ", $vqrange] _
		, [18202, 4047, " ", $vqrange] _
		, [18624, 3615, " ", $vqrange] _
		, [17411, 117, " ", $vqrange] _
		, [15988, -3611, " ", $vqrange] _
		, [15582, -6285, " ", $vqrange] _
		, [12610, -7524, " ", $vqrange] _
		, [15903, -11501, " ", $vqrange] _
		, [12500, -13142, " ", $vqrange] _
		, [12421, -15866, " ", $vqrange] _
		, [12967, -18631, " ", $vqrange] _
		, [11345, -18269, " ", $vqrange] _
		, [9850, -13690, " ", $vqrange] _
		, [11248, -10234, " ", $vqrange] _
		, [8250, -11236, " ", $vqrange] _
		, [7003, -12010, " ", $vqrange] _
		, [3871, -14099, " ", $vqrange] _
		, [2485, -11699, " ", $vqrange] _
		, [-57, -18059, " ", $vqrange] _
		, [-1039, -18715, " ", $vqrange] _
		, [-6122, -17614, " ", $vqrange] _
		, [-6343, -18669, " ", $vqrange] _
		, [-7567, -18524, " ", $vqrange] _
		, [-8848, -14719, " ", $vqrange] _
		, [-9633, -17610, " ", $vqrange] _
		, [-11060, -17876, " ", $vqrange] _
		, [-11008, -13004, " ", $vqrange] _
		, [-8876, -11034, " ", $vqrange] _
		, [-7373, -10878, " ", $vqrange] _
		, [-4475, -11096, " ", $vqrange] _
		, [-5976, -7567, " ", $vqrange] _
		, [-4297, -6945, " ", $vqrange] _
		, [-8493, -7209, " ", $vqrange] _
		, [-8788, -4482, " ", $vqrange] _
		, [-9406, -1580, " ", $vqrange] _
		, [-7749, 163, " ", $vqrange] _
		, [-7299, 3, " ", $vqrange] _
		, [-9884, 1367, " ", $vqrange] _
		, [-5843, -512, " ", $vqrange] _
		, [-6238, -2510, " ", $vqrange] _
		, [-4088, 437, " ", $vqrange] _
		, [-4742, 4154, " ", $vqrange] _
		, [-4745, 7521, " ", $vqrange] _
		, [-1926, 6897, " ", $vqrange] _
		, [-5561, 10159, " ", $vqrange] _
		, [-9406, 4697, " ", $vqrange] _
		, [-5437, 1712, " ", $vqrange] _
		, [-2697, -1720, " ", $vqrange] _
		, [-4505, -6303, " ", $vqrange] _
		, [-2705, -45, " ", $vqrange] _
		, [-264, -3502, " ", $vqrange] _
		, [3691, -2175, " ", $vqrange] _
		, [2756, 1730, " ", $vqrange] _
		, [5623, 3727, " ", $vqrange] _
		, [5376, 7673, " ", $vqrange] _
		, [11540, 7475, " ", $vqrange] _
		, [11620, 2116, " ", $vqrange] _
		, [9512, -783, " ", $vqrange] _
		, [7664, -4117, " ", $vqrange] _
		, [6639, -6964, " ", $vqrange] _
		, [4129, -6851, " ", $vqrange] _
		, [8717, -9563, " ", $vqrange] ]

		Local $aWaypoints[102][4] = [ [-17504, -16545, " ", $vqrange] _
		, [-15681, -11678, " ", $vqrange] _	
		, [-15433, -7796, " ", $vqrange] _
		, [-12219, -9120, " ", $vqrange] _
		, [-14806, -4783, " ", $vqrange] _
		, [-15212, -3882, " ", $vqrange] _
		, [-14086, 1905, " ", $vqrange] _
		, [-14784, -5197, " ", $vqrange] _
		, [-16254, -3439, " ", $vqrange] _
		, [-16772, -1006, " ", $vqrange] _
		, [-15502, -784, " ", $vqrange] _
		, [-13974, 4614, " ", $vqrange] _
		, [-11814, 4770, " ", $vqrange] _
		, [-12872, 7805, " ", $vqrange] _
		, [-15499, 8074, " ", $vqrange] _
		, [-14735, 11936, " ", $vqrange] _
		, [-14243, 14025, " ", $vqrange] _
		, [-17003, 16576, " ", $vqrange] _
		, [-16414, 18811, " ", $vqrange] _
		, [-8870, 17044, " ", $vqrange] _
		, [-4431, 17118, " ", $vqrange] _
		, [-2183, 15152, " ", $vqrange] _
		, [860, 12027, " ", $vqrange] _
		, [3127, 13781, " ", $vqrange] _
		, [2641, 18347, " ", $vqrange] _
		, [3127, 13781, " ", $vqrange] _
		, [3017, 10646, " ", $vqrange] _
		, [2195, 7855, " ", $vqrange] _
		, [1909, 7794, " ", $vqrange] _
		, [5819, 7678, " ", $vqrange] _
		, [6411, 4182, " ", $vqrange] _
		, [5823, 7632, " ", $vqrange] _
		, [11026, 7515, " ", $vqrange] _
		, [13102, 4830, " ", $vqrange] _
		, [16789, 7732, " ", $vqrange] _
		, [16895, 7864, " ", $vqrange] _
		, [14892, 11895, " ", $vqrange] _
		, [15495, 14552, " ", $vqrange] _
		, [15073, 16897, " ", $vqrange] _
		, [17874, 13884, " ", $vqrange] _
		, [16476, 8195, " ", $vqrange] _
		, [18202, 4047, " ", $vqrange] _
		, [18624, 3615, " ", $vqrange] _
		, [17411, 117, " ", $vqrange] _
		, [15988, -3611, " ", $vqrange] _
		, [15582, -6285, " ", $vqrange] _
		, [12610, -7524, " ", $vqrange] _
		, [15903, -11501, " ", $vqrange] _
		, [12500, -13142, " ", $vqrange] _
		, [12421, -15866, " ", $vqrange] _
		, [12967, -18631, " ", $vqrange] _
		, [11345, -18269, " ", $vqrange] _
		, [9850, -13690, " ", $vqrange] _
		, [11248, -10234, " ", $vqrange] _
		, [8250, -11236, " ", $vqrange] _
		, [7003, -12010, " ", $vqrange] _
		, [3871, -14099, " ", $vqrange] _
		, [2485, -11699, " ", $vqrange] _
		, [-57, -18059, " ", $vqrange] _
		, [-1039, -18715, " ", $vqrange] _
		, [-6122, -17614, " ", $vqrange] _
		, [-6343, -18669, " ", $vqrange] _
		, [-7567, -18524, " ", $vqrange] _
		, [-8848, -14719, " ", $vqrange] _
		, [-9633, -17610, " ", $vqrange] _
		, [-11060, -17876, " ", $vqrange] _
		, [-11008, -13004, " ", $vqrange] _
		, [-8876, -11034, " ", $vqrange] _
		, [-7373, -10878, " ", $vqrange] _
		, [-4475, -11096, " ", $vqrange] _
		, [-5976, -7567, " ", $vqrange] _
		, [-4297, -6945, " ", $vqrange] _
		, [-8493, -7209, " ", $vqrange] _
		, [-8788, -4482, " ", $vqrange] _
		, [-9406, -1580, " ", $vqrange] _
		, [-7749, 163, " ", $vqrange] _
		, [-7299, 3, " ", $vqrange] _
		, [-9884, 1367, " ", $vqrange] _
		, [-5843, -512, " ", $vqrange] _
		, [-6238, -2510, " ", $vqrange] _
		, [-4088, 437, " ", $vqrange] _
		, [-4742, 4154, " ", $vqrange] _
		, [-4745, 7521, " ", $vqrange] _
		, [-1926, 6897, " ", $vqrange] _
		, [-5561, 10159, " ", $vqrange] _
		, [-9406, 4697, " ", $vqrange] _
		, [-5437, 1712, " ", $vqrange] _
		, [-2697, -1720, " ", $vqrange] _
		, [-4505, -6303, " ", $vqrange] _
		, [-2705, -45, " ", $vqrange] _
		, [-264, -3502, " ", $vqrange] _
		, [3691, -2175, " ", $vqrange] _
		, [2756, 1730, " ", $vqrange] _
		, [5623, 3727, " ", $vqrange] _
		, [5376, 7673, " ", $vqrange] _
		, [11540, 7475, " ", $vqrange] _
		, [11620, 2116, " ", $vqrange] _
		, [9512, -783, " ", $vqrange] _
		, [7664, -4117, " ", $vqrange] _
		, [6639, -6964, " ", $vqrange] _
		, [4129, -6851, " ", $vqrange] _
		, [8717, -9563, " ", $vqrange] ]
			
		GoNearestNPCToCoords(-18081, -16359)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-13004, -2433)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc