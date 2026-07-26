#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSilentSurf()
	MoveTo(8483, -25600)
	Move(9100, -26300)
	WaitForLoad()
EndFunc

Func VQSilentSurf()
    If GetMapID() <> $SilentSurf_Map And GetMapID() <> $SilentSurf_Outpost  Then TravelTo($SilentSurf_Outpost)   
    If GetMapID() = $SilentSurf_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $SilentSurf_Map Then    
		
		Local $aWaypoints[67][4] = [ [12805, 20193, " ", $vqrange] _ 
		, [11341, 16798, " ", $vqrange] _
		, [11087, 13991, " ", $vqrange] _
		, [11080, 9097, " ", $vqrange] _
		, [9658, 5413, " ", $vqrange] _
		, [10560, 749, " ", $vqrange] _
		, [8586, 2593, " ", $vqrange] _
		, [7046, -230, " ", $vqrange] _
		, [5482, 2172, " ", $vqrange] _
		, [6713, -3883, " ", $vqrange] _
		, [8556, -5771, " ", $vqrange] _
		, [8388, -7369, " ", $vqrange] _
		, [5573, -7854, " ", $vqrange] _
		, [9949, -10783, " ", $vqrange] _
		, [7667, -13572, " ", $vqrange] _
		, [7418, -163297, " ", $vqrange] _
		, [9788, -17730, " ", $vqrange] _
		, [9223, -18514, " ", $vqrange] _
		, [6124, -13371, " ", $vqrange] _
		, [8808, -12721, " ", $vqrange] _
		, [10194, -16206, " ", $vqrange] _
		, [4083, -15022, " ", $vqrange] _
		, [1525, -14592, " ", $vqrange] _
		, [-460, -18187, " ", $vqrange] _
		, [-80, -13881, " ", $vqrange] _
		, [1802, -11686, " ", $vqrange] _
		, [-3053, -11475, " ", $vqrange] _
		, [-4579, -10773, " ", $vqrange] _
		, [-6200, -8096, " ", $vqrange] _
		, [-3135, -6388, " ", $vqrange] _
		, [-4144, -3728, " ", $vqrange] _
		, [-4570, -2901, " ", $vqrange] _
		, [-4941, -160, " ", $vqrange] _
		, [-5722, 2696, " ", $vqrange] _
		, [-3142, 3801, " ", $vqrange] _
		, [-4469, 6183, " ", $vqrange] _
		, [-2125, 6504, " ", $vqrange] _
		, [-5109, 8999, " ", $vqrange] _
		, [-5250, 9219, " ", $vqrange] _
		, [-6784, 6498, " ", $vqrange] _
		, [-6303, 14473, " ", $vqrange] _
		, [-4104, 15650, " ", $vqrange] _
		, [-1907, 12921, " ", $vqrange] _
		, [1394, 15151, " ", $vqrange] _
		, [4780, 15895, " ", $vqrange] _
		, [6456, 20196, " ", $vqrange] _
		, [6912, 22456, " ", $vqrange] _
		, [4453, 16759, " ", $vqrange] _
		, [2593, 11628, " ", $vqrange] _
		, [1632, 8241, " ", $vqrange] _
		, [7432.49, 8187.56, " ", $vqrange] _
		, [7780.27, 10921.55, " ", $vqrange] _
		, [2912, 9831, " ", $vqrange] _
		, [5245, 8280, " ", $vqrange] _
		, [4124, 6478, " ", $vqrange] _
		, [6676, 6019, " ", $vqrange] _
		, [9859, 6957, " ", $vqrange] _
		, [9400, 5461, " ", $vqrange] _
		, [4254, 4016, " ", $vqrange] _
		, [558, 3252, " ", $vqrange] _
		, [1563, 79, " ", $vqrange] _
		, [-480, -1088, " ", $vqrange] _
		, [-136, -4944, " ", $vqrange] _
		, [124, -5285, " ", $vqrange] _
		, [1837, -6615, " ", $vqrange] _
		, [5287, -9242, " ", $vqrange] _
		, [3288, -3142, " ", $vqrange] ]
	
		GoNearestNPCToCoords(11303, 24406)
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
