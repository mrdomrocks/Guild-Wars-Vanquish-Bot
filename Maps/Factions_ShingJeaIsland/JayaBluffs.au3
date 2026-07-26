#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutJayaBluffs()
	MoveTo(18334, 11324)
	MoveTo(19140, 13382)
	MoveTo(18304, 14969)
	MoveTo(17377, 17188)
	Move(16800, 17550)
	WaitForLoad()
EndFunc

Func VQJayaBluffs()
    If GetMapID() <> $JayaBluffs_Map And GetMapID() <> $JayaBluffs_Outpost  Then TravelTo($JayaBluffs_Outpost)   
    If  GetMapID() = $JayaBluffs_Outpost then
        GoOut() 
      
    EndIf

	If GetMapID() = $JayaBluffs_Map Then    

		Local $aWaypoints[152][4] = [ [10051, -12873, " ", $vqrange] _				
		, [9083, -12615, " ", $vqrange] _
		, [8525, -11781, " ", $vqrange] _
		, [8014, -10915, " ", $vqrange] _
		, [7165, -10383, " ", $vqrange] _
		, [6163, -10316, " ", $vqrange] _
		, [5217, -9988, " ", $vqrange] _
		, [4333, -9518, " ", $vqrange] _
		, [3468, -8993, " ", $vqrange] _
		, [2823, -8225, " ", $vqrange] _
		, [2087, -7533, " ", $vqrange] _
		, [1403, -6801, " ", $vqrange] _
		, [809, -5985, " ", $vqrange] _
		, [94, -6699, " ", $vqrange] _
		, [-622, -7413, " ", $vqrange] _
		, [-4905.16, -7353.75, " ", $vqrange] _
		, [-6578.60, -8016.79, " ", $vqrange] _
		, [-4905.16, -7353.75, " ", $vqrange] _
		, [-622, -7413, " ", $vqrange] _
		, [-744, -8414, " ", $vqrange] _
		, [-1225, -9296, " ", $vqrange] _
		, [-1658, -10202, " ", $vqrange] _
		, [-2663, -10364, " ", $vqrange] _
		, [-3664, -10432, " ", $vqrange] _
		, [-4665, -10378, " ", $vqrange] _
		, [-5592, -10755, " ", $vqrange] _
		, [-6526, -10392, " ", $vqrange] _
		, [-7532, -10284, " ", $vqrange] _
		, [-8157, -9501, " ", $vqrange] _
		, [-7539, -8714, " ", $vqrange] _
		, [-6708, -8156, " ", $vqrange] _
		, [-7609, -8613, " ", $vqrange] _
		, [-10008.09, -4404.22, " ", $vqrange] _
		, [-9624.91, -399.28, " ", $vqrange] _
		, [-9464.49, 1590.99, " ", $vqrange] _
		, [-9624.91, -399.28, " ", $vqrange] _
		, [-10008.09, -4404.22, " ", $vqrange] _
		, [-8609, -8675, " ", $vqrange] _
		, [-9598, -8515, " ", $vqrange] _
		, [-10566, -8215, " ", $vqrange] _
		, [-11421, -7679, " ", $vqrange] _
		, [-12087, -6927, " ", $vqrange] _
		, [-12775, -6197, " ", $vqrange] _
		, [-13350, -5367, " ", $vqrange] _
		, [-13790, -4458, " ", $vqrange] _
		, [-14197, -3539, " ", $vqrange] _
		, [-13859, -2594, " ", $vqrange] _
		, [-13007, -2058, " ", $vqrange] _
		, [-12061, -2397, " ", $vqrange] _
		, [-12900, -1839, " ", $vqrange] _
		, [-13837, -1477, " ", $vqrange] _
		, [-14841, -1453, " ", $vqrange] _
		, [-15329, -577, " ", $vqrange] _
		, [-14738, 236, " ", $vqrange] _
		, [-14328, 1152, " ", $vqrange] _
		, [-13902, 2066, " ", $vqrange] _
		, [-13222, 2810, " ", $vqrange] _
		, [-12958, 1836, " ", $vqrange] _
		, [-11967, 1671, " ", $vqrange] _
		, [-11260, 2391, " ", $vqrange] _
		, [-10668, 3207, " ", $vqrange] _
		, [-10244, 4115, " ", $vqrange] _
		, [-10406, 5106, " ", $vqrange] _
		, [-9423, 5303, " ", $vqrange] _
		, [-8423, 5145, " ", $vqrange] _
		, [-7464, 4835, " ", $vqrange] _
		, [-6641, 4242, " ", $vqrange] _
		, [-5842, 3622, " ", $vqrange] _
		, [-5070, 2984, " ", $vqrange] _
		, [-4339, 2293, " ", $vqrange] _
		, [-3360, 2052, " ", $vqrange] _
		, [-2351, 1979, " ", $vqrange] _
		, [-1366, 1749, " ", $vqrange] _
		, [-1490, 747, " ", $vqrange] _
		, [-1945, -147, " ", $vqrange] _
		, [-2201, -1119, " ", $vqrange] _
		, [-3019, -1722, " ", $vqrange] _
		, [-3811, -2351, " ", $vqrange] _
		, [-4805, -2505, " ", $vqrange] _
		, [-5770, -2828, " ", $vqrange] _
		, [-4764, -2816, " ", $vqrange] _
		, [-3763, -2812, " ", $vqrange] _
		, [-2767, -2621, " ", $vqrange] _
		, [-1830, -2237, " ", $vqrange] _
		, [-936, -1754, " ", $vqrange] _
		, [-309, -972, " ", $vqrange] _
		, [696, -874, " ", $vqrange] _
		, [1490, -1483, " ", $vqrange] _
		, [2175, -2219, " ", $vqrange] _
		, [2926, -2896, " ", $vqrange] _
		, [3774, -3439, " ", $vqrange] _
		, [4748, -3709, " ", $vqrange] _
		, [5716, -3434, " ", $vqrange] _
		, [5983, -4411, " ", $vqrange] _
		, [6972.17, -2761.73, " ", $vqrange] _
		, [6271, -5380, " ", $vqrange] _
		, [6708, -6283, " ", $vqrange] _
		, [7207, -7152, " ", $vqrange] _
		, [7731, -8010, " ", $vqrange] _
		, [8584, -7475, " ", $vqrange] _
		, [9392, -6874, " ", $vqrange] _
		, [10277, -6384, " ", $vqrange] _
		, [11269, -6225, " ", $vqrange] _
		, [11970, -5505, " ", $vqrange] _
		, [11834, -4510, " ", $vqrange] _
		, [11259, -3688, " ", $vqrange] _
		, [10481, -3043, " ", $vqrange] _
		, [10767, -2078, " ", $vqrange] _
		, [11050, -1118, " ", $vqrange] _
		, [11378, -172, " ", $vqrange] _
		, [12342, 138, " ", $vqrange] _
		, [13310, 410, " ", $vqrange] _
		, [14279, 161, " ", $vqrange] _
		, [15986.79, 2788.92, " ", $vqrange] _
		, [14279, 161, " ", $vqrange] _
		, [15291, 167, " ", $vqrange] _
		, [15761.67, -2895.74, " ", $vqrange] _
		, [15291, 167, " ", $vqrange] _
		, [16262, 430, " ", $vqrange] _
		, [17226, 743, " ", $vqrange] _
		, [17432, 1722, " ", $vqrange] _
		, [16592, 2281, " ", $vqrange] _
		, [17485, 1808, " ", $vqrange] _
		, [17936, 913, " ", $vqrange] _
		, [18498, 69, " ", $vqrange] _
		, [19038, -777, " ", $vqrange] _
		, [19590, -1614, " ", $vqrange] _
		, [20544, -1950, " ", $vqrange] _
		, [21155, -1158, " ", $vqrange] _
		, [21527, -206, " ", $vqrange] _
		, [21392, 802, " ", $vqrange] _
		, [21398, 1804, " ", $vqrange] _
		, [21273, 807, " ", $vqrange] _
		, [21603, -147, " ", $vqrange] _
		, [21286, -1108, " ", $vqrange] _
		, [20642, -1882, " ", $vqrange] _
		, [21290, -1113, " ", $vqrange] _
		, [21678, -190, " ", $vqrange] _
		, [21229, -1089, " ", $vqrange] _
		, [20604, -1892, " ", $vqrange] _
		, [19917, -2626, " ", $vqrange] _
		, [19595, -3577, " ", $vqrange] _
		, [20135, -4424, " ", $vqrange] _
		, [19850, -5392, " ", $vqrange] _
		, [19613, -6376, " ", $vqrange] _
		, [19462, -7371, " ", $vqrange] _
		, [19115, -8316, " ", $vqrange] _
		, [18601, -7455, " ", $vqrange] _
		, [17720, -6976, " ", $vqrange] _
		, [16791, -7366, " ", $vqrange] _
		, [15873, -7769, " ", $vqrange] _
		, [12904.44, -8213.71, " ", $vqrange] ]
		
		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

    EndIf
EndFunc

