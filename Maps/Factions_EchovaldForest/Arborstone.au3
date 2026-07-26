#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutArborstone()
	MoveTo(5521.22, 6597.16)
	Move(6026.74, 7250.39)
	WaitForLoad()
EndFunc

Func VQArborstone()
    If GetMapID() <> $Arborstone_Map And GetMapID() <> $Arborstone_Outpost  Then TravelTo($Arborstone_Outpost)   
    If GetMapID() = $Arborstone_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $Arborstone_Map Then    

		Local $aWaypoints[80][4] = [ [12237.73, -15807.37, " ", $vqrange] _
		, [13102.91, -11608.98, " ", $vqrange] _
		, [10580.59, -14392.66, " ", $vqrange] _
		, [7230.12, -12890.25, " ", $vqrange] _
		, [8682.20, -16137.70, " ", $vqrange] _
		, [4156.44, -18683.01, " ", $vqrange] _
		, [2038.92, -17167.68, " ", $vqrange] _
		, [1155.69, -16048.55, " ", $vqrange] _
		, [-379.77, -16719.59, " ", $vqrange] _
		, [1009.66, -16029.28, " ", $vqrange] _
		, [2641.12, -17554.34, " ", $vqrange] _
		, [-3507.84, -18341.21, " ", $vqrange] _
		, [-5941.90, -13901.70, " ", $vqrange] _
		, [-8871.92, -13791.85, " ", $vqrange] _
		, [-11966.26, -17936.03, " ", $vqrange] _
		, [-8871.92, -13791.85, " ", $vqrange] _
		, [-7361.26, -9262.68, " ", $vqrange] _
		, [-5497.86, -7684.02, " ", $vqrange] _
		, [-3802.64, -11097.40, " ", $vqrange] _
		, [-5497.86, -7684.02, " ", $vqrange] _
		, [-4580.37, -4030.16, " ", $vqrange] _
		, [-4798.88, -873.59, " ", $vqrange] _
		, [-1466.74, -1012.22, " ", $vqrange] _
		, [35.42, -5683.12, " ", $vqrange] _
		, [3224.44, -3990.59, " ", $vqrange] _
		, [6117.61, -5653.29, " ", $vqrange] _
		, [7528.88, -9879.98, " ", $vqrange] _
		, [6117.61, -5653.29, " ", $vqrange] _
		, [3224.44, -3990.59, " ", $vqrange] _
		, [-1515.96, -8385.48, " ", $vqrange] _
		, [-77.82, -11248.25, " ", $vqrange] _
		, [2307.26, -9887.08, " ", $vqrange] _
		, [4467.07, -7652.64, " ", $vqrange] _
		, [4505.73, -10126.83, " ", $vqrange] _
		, [8654.15, -14313.90, " ", $vqrange] _
		, [12983.24, -13356.35, " ", $vqrange] _
		, [13007.59, -7651.94, " ", $vqrange] _
		, [9092.48, -4635.52, " ", $vqrange] _
		, [11408.29, -4539.27, " ", $vqrange] _
		, [13056.95, -2291.92, " ", $vqrange] _
		, [9360.76, -2095.86, " ", $vqrange] _
		, [4254.16, -2092.68, " ", $vqrange] _
		, [2046.32, 115.92, " ", $vqrange] _
		, [5154.47, 1231.54, " ", $vqrange] _
		, [8257.69, 1394.57, " ", $vqrange] _
		, [8283.84, -725.82, " ", $vqrange] _
		, [8237.81, 2952.75, " ", $vqrange] _
		, [9435.08, 6494.28, " ", $vqrange] _
		, [12451.07, 5333.95, " ", $vqrange] _
		, [12831.65, 845.30, " ", $vqrange] _
		, [10735.92, 610.33, " ", $vqrange] _
		, [7484.87, 4436.03, " ", $vqrange] _
		, [5052.32, 6340.23, " ", $vqrange] _
		, [7902.35, 9078.49, " ", $vqrange] _
		, [6226.73, 10791.75, " ", $vqrange] _
		, [7902.35, 9078.49, " ", $vqrange] _
		, [11773.22, 12531.25, " ", $vqrange] _
		, [6766.39, 12750.90, " ", $vqrange] _
		, [797.04, 12410.67, " ", $vqrange] _
		, [-3745.47, 11634.99, " ", $vqrange] _
		, [-7198.04, 14773.02, " ", $vqrange] _
		, [-12770.40, 13452.91, " ", $vqrange] _
		, [-8991.02, 11415.59, " ", $vqrange] _
		, [-3901.04, 11510.84, " ", $vqrange] _
		, [974.54, 8736.65, " ", $vqrange] _
		, [1076.15, 4559.33, " ", $vqrange] _
		, [974.54, 8736.65, " ", $vqrange] _
		, [-1838.23, 5310.33, " ", $vqrange] _
		, [-3741.51, 5810.06, " ", $vqrange] _
		, [-7919.79, 5230.05, " ", $vqrange] _
		, [-11880.10, 4703.75, " ", $vqrange] _
		, [-11659.24, 784.40, " ", $vqrange] _
		, [-10381.75, -1151.41, " ", $vqrange] _
		, [-7386.17, 2025.43, " ", $vqrange] _
		, [-10381.75, -1151.41, " ", $vqrange] _
		, [-12734.15, -5800.15, " ", $vqrange] _
		, [-12040.38, -7727.45, " ", $vqrange] _
		, [-12734.15, -5800.15, " ", $vqrange] _
		, [-9928.50, -6619.93, " ", $vqrange] _
		, [-12978.66, -10207.81, " ", $vqrange] ]
		
		GoNearestNPCToCoords(10476.00, -19572.00)
	If GetLuxonFaction() > GetKurzickFaction() Then
                Dialog(0x81)
                Sleep(1000)
                Dialog(0x2)
                Sleep(1000)
                Dialog(0x84)
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