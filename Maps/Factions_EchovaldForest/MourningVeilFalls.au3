#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMourningVeilFalls()
	MoveTo(-290.18, 275.96)
	MoveTo(-3076.34, 4103.19)
	MoveTo(-4380.62, 4251.05)
	Move(-4559.24, 4608.69)
	WaitForLoad()
EndFunc

Func VQMourningVeilFalls()
	If GetMapID() = $MourningVeilFalls_Map Then    

		Local $aWaypoints[51][4] = [ [-20006.83, -6088.50, " ", $vqrange] _
		, [-23619.86, -4024.53, " ", $vqrange] _
		, [-26705.92, -3994.36, " ", $vqrange] _
		, [-26083.83, 449.46, " " , $vqrange] _
		, [-24230.15, 3157.94, " ", $vqrange] _
		, [-22682.00, 6693.05, " ", $vqrange] _
		, [-19955.37, 8821.54, " ", $vqrange] _
		, [-17987.37, 4643.21, " ", $vqrange] _
		, [-19435.63, 827.11, " ", $vqrange] _
		, [-17062.08, -2178.00, " ", $vqrange] _
		, [-16914.79, 2167.10, " ", $vqrange] _
		, [-14206.39, 3984.44, " ", $vqrange] _
		, [-13037.85, 7849.56, " ", $vqrange] _
		, [-9812.90, 5576.32, " ", $vqrange] _
		, [-11178.56, 1668.24, " ", $vqrange] _
		, [-11101.21, -1215.2, " ", $vqrange] _
		, [-7936.94, -3356.64, " ", $vqrange] _
		, [-4604.46, -1802.62, " ", $vqrange] _
		, [-3032.23, -4472.56, " ", $vqrange] _
		, [-332.82, -3710.21, " ", $vqrange] _
		, [3935.73, -1383.16, " ", $vqrange] _
		, [-332.82, -3710.21, " ", $vqrange] _
		, [-1536.42, -455.44, " ", $vqrange] _
		, [-1426.32, 3787.16, " ", $vqrange] _
		, [-1386.09, 6187.57, " ", $vqrange] _
		, [2397.68, 7720.80, " ", $vqrange] _
		, [4106.03, 5516.89, " ", $vqrange] _
		, [5262.96, -494.96, " ", $vqrange] _
		, [5463.62, 3834.07, " ", $vqrange] _
		, [8291.23, 3721.34, " ", $vqrange] _
		, [10515.24, 1724.68, " ", $vqrange] _
		, [10632.69, -2112.03, " ", $vqrange] _
		, [13795.71, -2343.23, " ", $vqrange] _
		, [12723.36, -4404.75, " ", $vqrange] _
		, [15456.59, -4828.85, " ", $vqrange] _
		, [14333.29, -5664.67, " ", $vqrange] _
		, [17111.35, -6642.66, " ", $vqrange] _
		, [19321.74, -4780.90, " ", $vqrange] _
		, [21989.27, -5348.64, " ", $vqrange] _
		, [24772.92, -3859.47, " ", $vqrange] _
		, [27270.56, -3422.83, " ", $vqrange] _
		, [26141.32, -1430.48, " ", $vqrange] _
		, [25878.26, 1973.14, " ", $vqrange] _
		, [25316.44, 3125.59, " ", $vqrange] _
		, [25688.87, 5781.09, " ", $vqrange] _
		, [23252.34, 6383.33, " ", $vqrange] _
		, [22942.64, 3500.32, " ", $vqrange] _
		, [21050.66, 1531.23, " ", $vqrange] _
		, [21362.85, -2081.60, " ", $vqrange] _
		, [18881.47, -932.66, " ", $vqrange] _
		, [16624.41, 1737.03, " ", $vqrange] ]

		GoNearestNPCToCoords(-16512.99, -6554.48)
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