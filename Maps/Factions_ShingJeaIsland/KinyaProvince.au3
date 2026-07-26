#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutKinyaProvince()
	MoveTo(14956, 15878)
	Move(14800, 15000)
	WaitForLoad()
EndFunc

Func VQKinyaProvince()
    If GetMapID() <> $KinyaProvince_Map And GetMapID() <> $KinyaProvince_Outpost  Then TravelTo($KinyaProvince_Outpost)   
    If GetMapID() = $KinyaProvince_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $KinyaProvince_Map Then    

		Local $aWaypoints[73][4] = [ [11642, 15073, " ", $vqrange] _		
		, [10725, 16723, " ", $vqrange] _
		, [9393, 16755, " ", $vqrange] _
		, [9010, 15122, " ", $vqrange] _
		, [9019, 14992, " ", $vqrange] _
		, [9059, 12867, " ", $vqrange] _
		, [7819, 11547, " ", $vqrange] _
		, [7098, 11232, " ", $vqrange] _
		, [6136, 14034, " ", $vqrange] _
		, [6086, 18187, " ", $vqrange] _
		, [7470, 19170, " ", $vqrange] _
		, [7776, 19333, " ", $vqrange] _
		, [9716, 20592, " ", $vqrange] _
		, [10678, 22033, " ", $vqrange] _
		, [11534, 20019, " ", $vqrange] _
		, [9525, 18590, " ", $vqrange] _
		, [7494, 18765, " ", $vqrange] _
		, [4585, 19109, " ", $vqrange] _
		, [1532, 13811, " ", $vqrange] _
		, [-1331, 16421, " ", $vqrange] _
		, [-4090, 18378, " ", $vqrange] _
		, [-4066, 19506, " ", $vqrange] _
		, [-725, 19738, " ", $vqrange] _
		, [2704, 19997, " ", $vqrange] _
		, [4796, 18807, " ", $vqrange] _
		, [2947, 14544, " ", $vqrange] _
		, [351, 14551, " ", $vqrange] _
		, [-2536, 11653, " ", $vqrange] _
		, [-6307, 8625, " ", $vqrange] _
		, [-4630, 7439, " ", $vqrange] _
		, [-5837, 4752, " ", $vqrange] _
		, [-8710, 2068, " ", $vqrange] _
		, [-11071, 1455, " ", $vqrange] _
		, [-10260, 1986, " ", $vqrange] _
		, [-8830, 1889, " ", $vqrange] _
		, [-5587, -908, " ", $vqrange] _
		, [-2994, -686, " ", $vqrange] _
		, [-4990, -3556, " ", $vqrange] _
		, [-6666, -7450, " ", $vqrange] _
		, [-5110, -7830, " ", $vqrange] _
		, [-4629, -11408, " ", $vqrange] _
		, [-1058, -12232, " ", $vqrange] _
		, [-1269, -14865, " ", $vqrange] _
		, [-5820, -14045, " ", $vqrange] _
		, [-6614, -13386, " ", $vqrange] _
		, [-5985, -12341, " ", $vqrange] _
		, [-6563, -16120, " ", $vqrange] _
		, [-5250, -18912, " ", $vqrange] _
		, [-3071, -19811, " ", $vqrange] _
		, [-597, -15760, " ", $vqrange] _
		, [2766, -15473, " ", $vqrange] _
		, [3534, -14807, " ", $vqrange] _
		, [1079, -12433, " ", $vqrange] _
		, [4337, -13659, " ", $vqrange] _
		, [8098, -11570, " ", $vqrange] _
		, [9784, -11495, " ", $vqrange] _
		, [12476, -13325, " ", $vqrange] _
		, [9928, -11144, " ", $vqrange] _
		, [10361, -8390, " ", $vqrange] _
		, [8362, -6562, " ", $vqrange] _
		, [12397, -3877, " ", $vqrange] _
		, [12914, -5231, " ", $vqrange] _
		, [15317, -1412, " ", $vqrange] _
		, [15536, 928, " ", $vqrange] _
		, [11957, 3908, " ", $vqrange] _
		, [8150, 1427, " ", $vqrange] _
		, [5289, 1726, " ", $vqrange] _
		, [7024, 2807, " ", $vqrange] _
		, [8537, 6472, " ", $vqrange] _
		, [10466, 10582, " ", $vqrange] _
		, [12865.29, 6695.74, " ", $vqrange] _
		, [10466, 10582, " ", $vqrange] _
		, [11139, 13322, " ", $vqrange] ]

		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc