#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMelandrusHope()
	MoveTo(-6677.38, -10055.16)
	Move(-7009.95, -10688.53)
	WaitForLoad()
EndFunc

Func VQMelandrusHope()
    If GetMapID() <> $MelandrusHope_Map And GetMapID() <> $MelandrusHope_Outpost  Then TravelTo($MelandrusHope_Outpost)   
    If GetMapID() = $MelandrusHope_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $MelandrusHope_Map Then    

		Local $aWaypoints[62][4] = [ [14778.99, 15936.15, " ", $vqrange] _
		, [13383.25, 12167.86, " ", $vqrange] _
		, [10183.48, 15669.38, " ", $vqrange] _
		, [6569.35, 18649.86, " ", $vqrange] _
		, [1705.76, 18111.80, " ", $vqrange] _
		, [3057.53, 20004.35, " ", $vqrange] _
		, [943.40, 18680.27, " ", $vqrange] _
		, [-2762.25, 19428.45, " ", $vqrange] _
		, [-5236.83, 18960.91, " ", $vqrange] _
		, [-6257.26, 14588.47, " ", $vqrange] _
		, [-8556.39, 12042.67, " ", $vqrange] _
		, [-10545.35, 9999.42, " ", $vqrange] _
		, [-8703.41, 5603.03, " ", $vqrange] _
		, [-6838.45, 2910.11, " ", $vqrange] _
		, [-5752.26, 4504.74, " ", $vqrange] _
		, [-6748.31, 6616.58, " ", $vqrange] _
		, [-4864.50, 9906.38, " ", $vqrange] _
		, [-1830.57, 11278.30, " ", $vqrange] _
		, [2377.91, 14325.66, " ", $vqrange] _
		, [6100.34, 11859.67, " ", $vqrange] _
		, [6654.45, 7980.31, " ", $vqrange] _
		, [6399.69, 5629.50, " ", $vqrange] _
		, [4643.54, 5762.81, " ", $vqrange] _
		, [3966.89, 10511.96, " ", $vqrange] _
		, [1312.40, 9759.04, " ", $vqrange] _
		, [642.68, 6354.85, " ", $vqrange] _
		, [-1472.49, 5619.31, " ", $vqrange] _
		, [-3645.02, 5759.71, " ", $vqrange] _
		, [-1951.37, 2203.26, " ", $vqrange] _
		, [-169.72, 2420.13, " ", $vqrange] _
		, [-645.20, -263.49, " ", $vqrange] _
		, [-5914.94, -778.12, " ", $vqrange] _
		, [-7432.49, -4227.99, " ", $vqrange] _
		, [-6039.78, -4807.54, " ", $vqrange] _
		, [-7394.03, -6058.09, " ", $vqrange] _
		, [-4325.03, -6166.40, " ", $vqrange] _
		, [-4963.61, -2246.41, " ", $vqrange] _
		, [-576.50, -431.42, " ", $vqrange] _
		, [2253.43, -1909.01, " ", $vqrange] _
		, [4856.19, -4624.69, " ", $vqrange] _
		, [1216.64, -7523.71, " ", $vqrange] _
		, [-2295.48, -7742.03, " ", $vqrange] _
		, [-3159.31, -12843.96, " ", $vqrange] _
		, [1983.18, -14668.80, " ", $vqrange] _
		, [6500.39, -14559.38, " ", $vqrange] _
		, [10437.48, -14241.80, " ", $vqrange] _
		, [13719.52, -11904.72, " ", $vqrange] _
		, [9274.66, -12273.51, " ", $vqrange] _
		, [8016.21, -9456.45, " ", $vqrange] _
		, [5669.48, -9232.49, " ", $vqrange] _
		, [7413.03, -6426.48, " ", $vqrange] _
		, [6218.60, -4908.58, " ", $vqrange] _
		, [10678.89, -2679.82, " ", $vqrange] _
		, [14611.49, -3049.25, " ", $vqrange] _
		, [14078.70, -7589.48, " ", $vqrange] _
		, [14276.67, -4910.27, " ", $vqrange] _
		, [14242.46, -2331.18, " ", $vqrange] _
		, [11033.80, -2743.12, " ", $vqrange] _
		, [7407.65, 400.72, " ", $vqrange] _
		, [9708.05, 1803.4, " ", $vqrange] _
		, [12532.26, 2031.07, " ", $vqrange] _
		, [13984.80, 7457.84, " ", $vqrange] ]
		
		GoNearestNPCToCoords(15202.95, 20349.68)
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