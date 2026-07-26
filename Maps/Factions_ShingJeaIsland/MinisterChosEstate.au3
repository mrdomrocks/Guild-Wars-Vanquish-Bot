#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutMinisterChosEstate()
	MoveTo(16642, 19493)
	Move(16995, 19739)
	WaitForLoad()
EndFunc

Func VQMinisterChosEstate()
    If GetMapID() <> $MinisterChosEstate_Map And GetMapID() <> $RanMusuGardens_OutPost  Then TravelTo($RanMusuGardens_OutPost)
    If GetMapID() = $RanMusuGardens_OutPost then
       GoOut()

    EndIf

	If  GetMapID() = $MinisterChosEstate_Map then

		Local $aWaypoints[105][4] = [ [-19516, -1421, " ", $vqrange] _
		, [-18432, -1723, " ", $vqrange] _
		, [-17033, -2199, " ", $vqrange] _
		, [-15622, -2496, " ", $vqrange] _
		, [-14478, -2428, " ", $vqrange] _
		, [-13251, 638, " ", $vqrange] _
		, [-12365, 1367, " ", $vqrange] _
		, [-11790, 2696, " ", $vqrange] _
		, [-15179.31, 4897.80, " ", $vqrange] _
		, [-12685, 3528, " ", $vqrange] _
		, [-9031, 3063, " ", $vqrange] _
		, [-8584, 575, " ", $vqrange] _
		, [-8468, -1560, " ", $vqrange] _
		, [-7856, 1814, " ", $vqrange] _
		, [-7644, 3797, " ", $vqrange] _
		, [-7592, 4872, " ", $vqrange] _
		, [-6386, 4406, " ", $vqrange] _
		, [-5406, 4002, " ", $vqrange] _
		, [-3865, 4321, " ", $vqrange] _
		, [-2976, 5472, " ", $vqrange] _
		, [-3744, 7279, " ", $vqrange] _
		, [-2898, 8446, " ", $vqrange] _
		, [1005, 5924, " ", $vqrange] _
		, [1961, 5062, " ", $vqrange] _
		, [4752, 5522, " ", $vqrange] _
		, [5479, 4812, " ", $vqrange] _
		, [7050, 4178, " ", $vqrange] _
		, [7042.98, 2942.78, " ", $vqrange] _
		, [10431.72, -1621.10, " ", $vqrange] _
		, [9081.28, 2809.27, " ", $vqrange] _
		, [9103.66, 5784.45, " ", $vqrange] _
		, [13301.28, 3256.61, " ", $vqrange] _
		, [15663.68, 869.45, " ", $vqrange] _
		, [13301.28, 3256.61, " ", $vqrange] _
		, [9103.66, 5784.45, " ", $vqrange] _
		, [8943, 8840, " ", $vqrange] _
		, [18152, 8991, " ", $vqrange] _
		, [19557, 9367, " ", $vqrange] _
		, [18621, 4509, " ", $vqrange] _
		, [18667, 3369, " ", $vqrange] _
		, [18468, 1975, " ", $vqrange] _
		, [19454, 1497, " ", $vqrange] _
		, [20454, 1375, " ", $vqrange] _
		, [21384, 868, " ", $vqrange] _
		, [22152, 178, " ", $vqrange] _
		, [22350, -123, " ", $vqrange] _
		, [21425, -674, " ", $vqrange] _
		, [17760, -1056, " ", $vqrange] _
		, [17087, -1803, " ", $vqrange] _
		, [16287, -2607, " ", $vqrange] _
		, [14124, -1855, " ", $vqrange] _
		, [14337, 150, " ", $vqrange] _
		, [14424, 1732, " ", $vqrange] _
		, [13574, 182, " ", $vqrange] _
		, [13172, -1017, " ", $vqrange] _
		, [11932, -1300, " ", $vqrange] _
		, [10880, -2303, " ", $vqrange] _
		, [10310, -3216, " ", $vqrange] _
		, [11503, -5478, " ", $vqrange] _
		, [13652, -6536, " ", $vqrange] _
		, [14774, -6189, " ", $vqrange] _
		, [15670, -6712, " ", $vqrange] _
		, [16728, -6606, " ", $vqrange] _
		, [19449, -6171, " ", $vqrange] _
		, [22716, -7902, " ", $vqrange] _
		, [22391, -9215, " ", $vqrange] _
		, [21294, -9327, " ", $vqrange] _
		, [20209, -9454, " ", $vqrange] _
		, [18519, -8559, " ", $vqrange] _
		, [19470, -6420, " ", $vqrange] _
		, [18583, -5746, " ", $vqrange] _
		, [17480, -6425, " ", $vqrange] _
		, [16499, -6713, " ", $vqrange] _
		, [15485, -6558, " ", $vqrange] _
		, [14282, -6147, " ", $vqrange] _
		, [13308, -6697, " ", $vqrange] _
		, [11968, -6121, " ", $vqrange] _
		, [11003, -5466, " ", $vqrange] _
		, [4328, -4533, " ", $vqrange] _
		, [3925, -5825, " ", $vqrange] _
		, [5728, -1360, " ", $vqrange] _
		, [2294, 1153, " ", $vqrange] _
		, [3100.11, 2807.81, " ", $vqrange] _
		, [-6693.63, -165.67, " ", $vqrange] _
		, [-8364.71, -5139.08, " ", $vqrange] _
		, [-6693.63, -165.67, " ", $vqrange] _
		, [3100.11, 2807.81, " ", $vqrange] _
		, [-350, 407, " ", $vqrange] _
		, [-1020, -1108, " ", $vqrange] _
		, [-1576, -2537, " ", $vqrange] _
		, [-3481, -4977, " ", $vqrange] _
		, [-5404, -6890, " ", $vqrange] _
		, [-6625, -7243, " ", $vqrange] _
		, [-7762, -8003, " ", $vqrange] _
		, [-5765, -8179, " ", $vqrange] _
		, [-121, -10070, " ", $vqrange] _
		, [2149, -9779, " ", $vqrange] _
		, [3893, -9050, " ", $vqrange] _
		, [817, -7508, " ", $vqrange] _
		, [9253, -4057, " ", $vqrange] _
		, [9853, -3157, " ", $vqrange] _
		, [9459, 580, " ", $vqrange] _
		, [8417, 2201, " ", $vqrange] _
		, [7512, 3123, " ", $vqrange] _
		, [11359, 5004, " ", $vqrange] ]

		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

    EndIf
EndFunc