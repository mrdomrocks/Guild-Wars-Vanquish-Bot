#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutUnwakingWaters()
	MoveTo(3355.47, 3054.54)
	Move(3355.47, 2300.54)
	WaitForLoad()
EndFunc

Func VQUnwakingWaters()
    If GetMapID() <> $UnwakingWaters_Map And GetMapID() <> $UnwakingWaters_Outpost  Then TravelTo($UnwakingWaters_Outpost)   
    If GetMapID() = $UnwakingWaters_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $UnwakingWaters_Map Then    

		Local $aWaypoints[23][4] = [ [3464.00, 1917.00, " ", $vqrange] _
		, [3078.88, 5448.03, " ", $vqrange] _
		, [797.97 , 3818.96, " ", $vqrange] _
		, [1027.28 , 1349.43, " ", $vqrange] _
		, [3400.14 , -1050.81, " ", $vqrange] _
		, [7306.71 , -550.47, " ", $vqrange] _
		, [10527.24 , -630.89, " ", $vqrange] _
		, [14328.43 , 1316.61, " ", $vqrange] _
		, [10590.52 , 3601.10, " ", $vqrange] _
		, [7283.98 , 82.61, " ", $vqrange] _
		, [7086.35, 1018.25, " ", $vqrange] _
		, [9502.52, 4770.71, " ", $vqrange] _
		, [9641.66, 4987.45, " ", $vqrange] _
		, [11014.83, 7214.74, " ", $vqrange] _
		, [5983.94, 7500.72, " ", $vqrange] _
		, [1518.70, 8470.11, " ", $vqrange] _
		, [-1412.39, 6396.44, " ", $vqrange] _
		, [-5065.51, 4624.91, " ", $vqrange] _
		, [-8647.60, 2369.40, " ", $vqrange] _
		, [-4920.25, -135.66, " ", $vqrange] _
		, [-3720.08, 1924.34, " ", $vqrange] _
		, [-2685.00, -954.10, " ", $vqrange] _
		, [-1820.30, 2831.60, " ", $vqrange] ]
	
		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc