#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1
Func GoOutXaquangSkyway()
	MoveTo(6759, -13421)
	MoveTo(6425, -13162)
	Move(6250, -12900)
	WaitForLoad()
EndFunc

Func VQXaquangSkyway()
    If GetMapID() <> $XaquangSkyway_Map And GetMapID() <> $XaquangSkyway_Outpost  Then TravelTo($XaquangSkyway_Outpost)   
    If GetMapID() = $XaquangSkyway_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $XaquangSkyway_Map Then    

		Local $aWaypoints[66][4] = [ [2270, -9983, " ", $vqrange] _
		, [422, -8499, " ", $vqrange] _
		, [-2306, -8072, " ", $vqrange] _
		, [-1954, -5086, " ", $vqrange] _
		, [-4062, -5228, " ", $vqrange] _
		, [-5925, -6310, " ", $vqrange] _
		, [-9577, -3723, " ", $vqrange] _
		, [-10441, -2832, " ", $vqrange] _
		, [-11864, -4215, " ", $vqrange] _
		, [-12259, -479, " ", $vqrange] _
		, [-12224, 3492, " ", $vqrange] _
		, [-14610, 3667, " ", $vqrange] _
		, [-13246, 5868, " ", $vqrange] _
		, [-12079, 2660, " ", $vqrange] _
		, [-12022, 398, " ", $vqrange] _
		, [-10315, -2930, " ", $vqrange] _
		, [-6541, -3685, " ", $vqrange] _
		, [-5721, -643, " ", $vqrange] _
		, [-5147, 3386, " ", $vqrange] _
		, [-3856, 4364, " ", $vqrange] _
		, [-5925, 5794, " ", $vqrange] _
		, [-5249, 8027, " ", $vqrange] _
		, [-4033, 9234, " ", $vqrange] _
		, [-1216, 10613, " ", $vqrange] _
		, [-939, 11479, " ", $vqrange] _
		, [63, 10485, " ", $vqrange] _
		, [2459, 10346, " ", $vqrange] _
		, [3714, 8253, " ", $vqrange] _
		, [3692, 6829, " ", $vqrange] _
		, [3748, 10412, " ", $vqrange] _
		, [4994, 11443, " ", $vqrange] _
		, [3667, 11610, " ", $vqrange] _
		, [3503, 13226, " ", $vqrange] _
		, [3795, 14787, " ", $vqrange] _
		, [3620, 11629, " ", $vqrange] _
		, [7401, 11060, " ", $vqrange] _
		, [9128, 10773, " ", $vqrange] _
		, [10727, 8965, " ", $vqrange] _
		, [13374, 10104, " ", $vqrange] _
		, [11202, 8231, " ", $vqrange] _
		, [10579, 5302, " ", $vqrange] _
		, [13771, 5141, " ", $vqrange] _
		, [16398, 2886, " ", $vqrange] _
		, [13388, 5007, " ", $vqrange] _
		, [10714, 5026, " ", $vqrange] _
		, [9151, 4038, " ", $vqrange] _
		, [7851, 3674, " ", $vqrange] _
		, [9414, 1563, " ", $vqrange] _
		, [9510, -1104, " ", $vqrange] _
		, [6724, -4068, " ", $vqrange] _
		, [8313, -6706, " ", $vqrange] _
		, [8255, -10820, " ", $vqrange] _
		, [6008, -11819, " ", $vqrange] _
		, [2849, -9578, " ", $vqrange] _
		, [2464, -7149, " ", $vqrange] _
		, [1064, -5517, " ", $vqrange] _
		, [448, -4484, " ", $vqrange] _
		, [3463, -4157, " ", $vqrange] _
		, [5526, -3630, " ", $vqrange] _
		, [5170, 2264, " ", $vqrange] _
		, [4020, 3393, " ", $vqrange] _
		, [689, 3591, " ", $vqrange] _
		, [2634, 3958, " ", $vqrange] _
		, [3812, 5332, " ", $vqrange] _
		, [3707, 6331, " ", $vqrange] _
		, [5567, 5761, " ", $vqrange] ]				

		MoveandAggroVQ($aWaypoints)
          	MoveAndAggroVQReverse($aWaypoints)

    EndIf
EndFunc
