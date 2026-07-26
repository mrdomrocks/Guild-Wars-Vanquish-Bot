#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutRaisuPalace()
	MoveTo(-10609, -1451)
	MoveTo(-10472, 1289)
	MoveTo(-9653, 2457)
	Move(-9653, 2757)
	WaitForLoad()
EndFunc

Func VQRaisuPalace()
    If GetMapID() <> $RaisuPalace_Map And GetMapID() <> $RaisuPalace_Outpost  Then TravelTo($RaisuPalace_Outpost)   
    If GetMapID() = $RaisuPalace_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $RaisuPalace_Map Then    

		Local $aWaypoints[67][4] = [ [24090, 1284, " ", $vqrange] _
		, [24090, 5505, " ", $vqrange] _
		, [19992, 7624, " ", $vqrange] _
		, [16662, 8435, " ", $vqrange] _
		, [12694, 8359, " ", $vqrange] _
		, [12877, 10123, " ", $vqrange] _
		, [13675, 13132, " ", $vqrange] _
		, [11175, 10204, " ", $vqrange] _
		, [8420, 6489, " ", $vqrange] _
		, [7214, 5342, " ", $vqrange] _
		, [4900, 6273, " ", $vqrange] _
		, [2191, 5494, " ", $vqrange] _
		, [1354, 6217, " ", $vqrange] _
		, [-357, 4631, " ", $vqrange] _
		, [-3681, 5381, " ", $vqrange] _
		, [-5764, 5884, " ", $vqrange] _
		, [-9261, 6950, " ", $vqrange] _
		, [-11989, 5693, " ", $vqrange] _
		, [-17663, 6376, " ", $vqrange] _
		, [-18195, 3517, " ", $vqrange] _
		, [-12327, 3926, " ", $vqrange] _
		, [-9842, 2806, " ", $vqrange] _
		, [-7040, 2959, " ", $vqrange] _
		, [-3964, 2176, " ", $vqrange] _
		, [-1084, 2076, " ", $vqrange] _
		, [489, 2023, " ", $vqrange] _
		, [-4110, -2081, " ", $vqrange] _
		, [-3887, -4698, " ", $vqrange] _
		, [-4027, -6437, " ", $vqrange] _
		, [-7539, -5778, " ", $vqrange] _
		, [-9164, -4781, " ", $vqrange] _
		, [-10522, -7763, " ", $vqrange] _
		, [-12811, -7035, " ", $vqrange] _
		, [-12858, -5560, " ", $vqrange] _
		, [-12831, -2778, " ", $vqrange] _
		, [-10563, -2283, " ", $vqrange] _
		, [-8583, -4833, " ", $vqrange] _
		, [-4663, -4661, " ", $vqrange] _
		, [-1484, -6175, " ", $vqrange] _
		, [-354, -4608, " ", $vqrange] _
		, [410, -6336, " ", $vqrange] _
		, [2900, -4619, " ", $vqrange] _
		, [4688, -5890, " ", $vqrange] _
		, [4769, -4628, " ", $vqrange] _
		, [4438, -2706, " ", $vqrange] _
		, [6448, -3311, " ", $vqrange] _
		, [8337, -3234, " ", $vqrange] _
		, [8635, -7564, " ", $vqrange] _
		, [10382, -8101, " ", $vqrange] _
		, [8589, -4496, " ", $vqrange] _
		, [11908, -3622, " ", $vqrange] _
		, [13595, -4408, " ", $vqrange] _
		, [14996, -2335, " ", $vqrange] _
		, [18060, -2947, " ", $vqrange] _
		, [18234, -4508, " ", $vqrange] _
		, [15166, -1857, " ", $vqrange] _
		, [16144, 50, " ", $vqrange] _
		, [17778, 318, " ", $vqrange] _
		, [21563, 306, " ", $vqrange] _
		, [24176, 3104, " ", $vqrange] _
		, [20497, 5666, " ", $vqrange] _
		, [16602, 4468, " ", $vqrange] _
		, [14555, 5534, " ", $vqrange] _
		, [12111, 4740, " ", $vqrange] _
		, [11279, 3915, " ", $vqrange] _
		, [9539, 1886, " ", $vqrange] _
		, [10530, -1051, " ", $vqrange] ]
		
		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc