#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMountQinkai()
	MoveTo(-5206, 13154)
	Move(-5600, 14000)
	WaitForLoad()
EndFunc

Func VQMountQinkai()
    If GetMapID() <> $MountQinkai_Map And GetMapID() <> $MountQinkai_Outpost  Then TravelTo($MountQinkai_Outpost)   
    If GetMapID() = $MountQinkai_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $MountQinkai_Map Then    

		Local $aWaypoints[46][4] = [ [-12635.6 ,-10012.7, " ", $vqrange] _
		, [-14930.8 ,-7905.79, " ", $vqrange] _
		, [-17395 ,-10019.3, " ", $vqrange] _
		, [-14930.8 ,-7905.79, " ", $vqrange] _
		, [-13653.3 ,-4416.88, " ", $vqrange] _
		, [-11920.2 ,-3923.97, " ", $vqrange] _
		, [-14097.2 ,-2363.55, " ", $vqrange] _
		, [-9346.91 ,-353.135, " ", $vqrange] _
		, [-7703.77 ,1803.79, " ", $vqrange] _
		, [-8709.5 ,3351.28, " ", $vqrange] _
		, [-10832.9 ,5649.15, " ", $vqrange] _
		, [-9841.12 ,7205.57, " ", $vqrange] _
		, [-8568.48 ,8116.87, " ", $vqrange] _
		, [-4972.15 ,6852.28, " ", $vqrange] _
		, [-1638 ,9361, " ", $vqrange] _
		, [-4972.15 ,6852.28, " ", $vqrange] _
		, [-2362.99 ,977.412, " ", $vqrange] _
		, [1038.44 ,1286.34, " ", $vqrange] _
		, [3620 ,1139, " ", $vqrange] _
		, [1038.44 ,1286.34, " ", $vqrange] _
		, [4369.84 ,5669.18, " ", $vqrange] _
		, [5589.2 ,6778.9, " ", $vqrange] _
		, [6594.95 ,3999.75, " ", $vqrange] _
		, [10354 ,5973.95, " ", $vqrange] _
		, [10495.4 ,8329.19, " ", $vqrange] _
		, [14477 ,7668.44, " ", $vqrange] _
		, [15597.7 ,4302.47, " ", $vqrange] _
		, [17828.7 ,2927.86, " ", $vqrange] _
		, [13802.1 ,-92.6512, " ", $vqrange] _
		, [11042 ,-4588, " ", $vqrange] _
		, [9341 ,-7157, " ", $vqrange] _
		, [13862.7 ,-4916.49, " ", $vqrange] _
		, [15121.8 ,-6146.1, " ", $vqrange] _
		, [15007.8 ,-9487.82, " ", $vqrange] _
		, [8532.66 ,-7448.72, " ", $vqrange] _
		, [6363.74 ,-9345.44, " ", $vqrange] _
		, [4905.36 ,-7084.39, " ", $vqrange] _
		, [2361.44 ,-8269.72, " ", $vqrange] _
		, [-2472.5 ,-8298.27, " ", $vqrange] _
		, [-6846.2 ,-7507.69, " ", $vqrange] _
		, [-6795.32 ,-6033.52, " ", $vqrange] _
		, [-6463.22 ,-4138.93, " ", $vqrange] _
		, [-2371.81 ,-862.629, " ", $vqrange] _
		, [-771.53 ,-2788.81, " ", $vqrange] _
		, [3021.34 ,-2836.58, " ", $vqrange] _
		, [6591.56 ,-131.996, " ", $vqrange] ]
		
		GoNearestNPCToCoords(-8380, -9818)
	If GetKurzickFaction() > GetLuxonFaction() Then
                Dialog(0x81)
                Sleep(1000)
                Dialog(0x2)
                Sleep(1000)
                Dialog(0x84)
	        Sleep(1000)
	        Dialog(0x86)
	        Sleep(1000)
        Else
                Dialog(0x85)
                Sleep(1000)
                Dialog(0x86)
                Sleep(1000)
        EndIf

		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc