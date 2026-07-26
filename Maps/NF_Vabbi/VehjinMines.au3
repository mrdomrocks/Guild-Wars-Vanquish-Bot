#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutVehjinMines()
	MoveTo(-2259, -78)
	MoveTo(-4384, -2575)
	MoveTo(-4544, -2571)
	Move(-4684, -2571)
	WaitForLoad()
EndFunc

Func VQVehjinMines()
    If GetMapID() <> $VehjinMines_Map And GetMapID() <> $VehjinMines_Outpost  Then TravelTo($VehjinMines_Outpost)   
    If GetMapID() = $VehjinMines_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $VehjinMines_Map Then    
		
		Local $aWaypointsA[16][4] = [ [13769, -16048, " ", $vqrange] _
		, [ 11436, -12145, " ", $vqrange] _
		, [ 10061, -8375, " ", $vqrange] _
		, [ 4922, -15071, " ", $vqrange] _
		, [ 4262, -15552, " ", $vqrange] _
		, [ 2493, -14647, " ", $vqrange] _
		, [ 3318, -12802, " ", $vqrange] _
		, [ 2645, -10971, " ", $vqrange] _
		, [ 3534, -8891, " ", $vqrange] _
		, [ -1924, -8853, " ", $vqrange] _
		, [ -4843, -8033, " ", $vqrange] _
		, [ -5411, -9323, " ", $vqrange] _
		, [ -6153, -5678, " ", $vqrange] _
		, [ -6113, -3363, " ", $vqrange] _
		, [ -6577, -1100, " ", $vqrange] _
		, [ -6825, 708, " ", $vqrange] ]

		Local $aWaypointsB[5][4] = [ [-4588, 4086, " ", $vqrange] _
		, [ -5728, 341, " ", $vqrange] _
		, [ -5208, 7331, " ", $vqrange] _
		, [ -5211, 9059, " ", $vqrange] _
		, [ -3285, 11647, " ", $vqrange] ]

		Local $aWaypointsC[7][4] = [ [ -4883, 16521, " ", $vqrange] _
		, [ -3739, 18688, " ", $vqrange] _
		, [ -7843, 16857, " ", $vqrange] _
		, [ -11325, 14715, " ", $vqrange] _
		, [ -12107, 18056, " ", $vqrange] _
		, [ -15454, 18926, " ", $vqrange] _
		, [ -14004, 16804, " ", $vqrange] ]
		
		Local $aWaypointsD[44][4] = [ [ -13943, 14417, " ", $vqrange] _
		, [ -13874, 11666, " ", $vqrange] _
		, [ -16461, 10010, " ", $vqrange] _
		, [ -17160, 12146, " ", $vqrange] _
		, [ -12829, 11331, " ", $vqrange] _
		, [ -13979, 14905, " ", $vqrange] _
		, [ -15752, 18717, " ", $vqrange] _
		, [ -11586, 14886, " ", $vqrange] _
		, [ -10950, 12065, " ", $vqrange] _
		, [ -10005, 15155, " ", $vqrange] _
		, [ -5979, 17428, " ", $vqrange] _
		, [ -3629, 15244, " ", $vqrange] _
		, [ -3132, 11375, " ", $vqrange] _
		, [ -185, 9656, " ", $vqrange] _
		, [ 2365, 10493, " ", $vqrange] _
		, [ 3496, 12795, " ", $vqrange] _
		, [ 4996, 14105, " ", $vqrange] _
		, [ 7076, 13933, " ", $vqrange] _
		, [ 4108, 13691, " ", $vqrange] _
		, [ 5045, 10222, " ", $vqrange] _
		, [ 9917, 9275, " ", $vqrange] _
		, [ 12552, 7130, " ", $vqrange] _
		, [ 15704, 7658, " ", $vqrange] _
		, [ 12367, 6832, " ", $vqrange] _
		, [ 11226, 4915, " ", $vqrange] _
		, [ 8477, 4732, " ", $vqrange] _
		, [ 6021, 3112, " ", $vqrange] _
		, [ 4844, 1489, " ", $vqrange] _
		, [ 3795, -1539, " ", $vqrange] _
		, [ 6901, -827, " ", $vqrange] _
		, [ 7001, -3002, " ", $vqrange] _
		, [ 9557, -5063, " ", $vqrange] _
		, [ 5027, -4954, " ", $vqrange] _
		, [ 2584, -4865, " ", $vqrange] _
		, [ 8181, -5945, " ", $vqrange] _
		, [ 11477, -8452, " ", $vqrange] _
		, [ 13678, -9871, " ", $vqrange] _
		, [ 13307, -6592, " ", $vqrange] _
		, [ 16981, -3665, " ", $vqrange] _
		, [ 18161, 445, " ", $vqrange] _
		, [ 18694, 311, " ", $vqrange] _
		, [ 18747, 2145, " ", $vqrange] _
		, [ 15012, 962, " ", $vqrange] _
		, [ 11554, 3885, " ", $vqrange] ]
		
		Local $aWaypoints[72][4] = [ [13769, -16048, " ", $vqrange] _
		, [ 11436, -12145, " ", $vqrange] _
		, [ 10061, -8375, " ", $vqrange] _
		, [ 4922, -15071, " ", $vqrange] _
		, [ 4262, -15552, " ", $vqrange] _
		, [ 2493, -14647, " ", $vqrange] _
		, [ 3318, -12802, " ", $vqrange] _
		, [ 2645, -10971, " ", $vqrange] _
		, [ 3534, -8891, " ", $vqrange] _
		, [ -1924, -8853, " ", $vqrange] _
		, [ -4843, -8033, " ", $vqrange] _
		, [ -5411, -9323, " ", $vqrange] _
		, [ -6153, -5678, " ", $vqrange] _
		, [ -6113, -3363, " ", $vqrange] _
		, [ -6577, -1100, " ", $vqrange] _
		, [ -6825, 708, " ", $vqrange] _
		, [ -4588, 4086, " ", $vqrange] _
		, [ -5728, 341, " ", $vqrange] _
		, [ -5208, 7331, " ", $vqrange] _
		, [ -5211, 9059, " ", $vqrange] _
		, [ -3285, 11647, " ", $vqrange] _
		, [ -4883, 16521, " ", $vqrange] _
		, [ -3739, 18688, " ", $vqrange] _
		, [ -7843, 16857, " ", $vqrange] _
		, [ -11325, 14715, " ", $vqrange] _
		, [ -12107, 18056, " ", $vqrange] _
		, [ -15454, 18926, " ", $vqrange] _
		, [ -14004, 16804, " ", $vqrange] _
		, [ -13943, 14417, " ", $vqrange] _
		, [ -13874, 11666, " ", $vqrange] _
		, [ -16461, 10010, " ", $vqrange] _
		, [ -17160, 12146, " ", $vqrange] _
		, [ -12829, 11331, " ", $vqrange] _
		, [ -13979, 14905, " ", $vqrange] _
		, [ -15752, 18717, " ", $vqrange] _
		, [ -11586, 14886, " ", $vqrange] _
		, [ -10950, 12065, " ", $vqrange] _
		, [ -10005, 15155, " ", $vqrange] _
		, [ -5979, 17428, " ", $vqrange] _
		, [ -3629, 15244, " ", $vqrange] _
		, [ -3132, 11375, " ", $vqrange] _
		, [ -185, 9656, " ", $vqrange] _
		, [ 2365, 10493, " ", $vqrange] _
		, [ 3496, 12795, " ", $vqrange] _
		, [ 4996, 14105, " ", $vqrange] _
		, [ 7076, 13933, " ", $vqrange] _
		, [ 4108, 13691, " ", $vqrange] _
		, [ 5045, 10222, " ", $vqrange] _
		, [ 9917, 9275, " ", $vqrange] _
		, [ 12552, 7130, " ", $vqrange] _
		, [ 15704, 7658, " ", $vqrange] _
		, [ 12367, 6832, " ", $vqrange] _
		, [ 11226, 4915, " ", $vqrange] _
		, [ 8477, 4732, " ", $vqrange] _
		, [ 6021, 3112, " ", $vqrange] _
		, [ 4844, 1489, " ", $vqrange] _
		, [ 3795, -1539, " ", $vqrange] _
		, [ 6901, -827, " ", $vqrange] _
		, [ 7001, -3002, " ", $vqrange] _
		, [ 9557, -5063, " ", $vqrange] _
		, [ 5027, -4954, " ", $vqrange] _
		, [ 2584, -4865, " ", $vqrange] _
		, [ 8181, -5945, " ", $vqrange] _
		, [ 11477, -8452, " ", $vqrange] _
		, [ 13678, -9871, " ", $vqrange] _
		, [ 13307, -6592, " ", $vqrange] _
		, [ 16981, -3665, " ", $vqrange] _
		, [ 18161, 445, " ", $vqrange] _
		, [ 18694, 311, " ", $vqrange] _
		, [ 18747, 2145, " ", $vqrange] _
		, [ 15012, 962, " ", $vqrange] _
		, [ 11554, 3885, " ", $vqrange] ]
		
		GoNearestNPCToCoords(15129, -14619)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsA)
		
		GoNearestNPCToCoords(-6937, 2346)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(-3149, 15984)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsC)
		
		GoNearestNPCToCoords(-17615, 15911)
		Sleep(1000)
		Dialog(0x83)
		RndSleep(1000)
		Dialog(0x85)
		RndSleep(1000)
		MoveandAggroVQ($aWaypointsD)
				
		MoveAndAggroVQReverse($aWaypoints)
		
	EndIf
EndFunc