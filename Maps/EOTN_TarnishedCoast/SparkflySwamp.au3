;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutSparkflySwamp()
	; Outpost exit not yet mapped - placeholder coords
	MoveTo(1683, -1594)
	Move(4600, -27863)
	WaitForLoad()
EndFunc

Func VQSparkflySwamp()
	If GetMapID() <> $SparkflySwamp_Map And GetMapID() <> $SparkflySwamp_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for SparkflySwamp.")
		TravelTo($SparkflySwamp_Outpost)
	EndIf
	If GetMapID() = $SparkflySwamp_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $SparkflySwamp_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need SparkflySwamp (" & $SparkflySwamp_Map & ").")
			Return
	EndIf
	EndIf
	If GetMapID() <> $SparkflySwamp_Map Then
		CurrentAction("SparkflySwamp route waiting - on map " & GetMapID() & ", need " & $SparkflySwamp_Map & ".")
		Return
	EndIf
	CurrentAction("Starting SparkflySwamp vanquish route.")
	Local $aWaypoints[211][4] = [ _
		[-9451, -19766, "shrine", $vqrange], _
		[-11712, -18545, " ", $vqrange], _
		[-12365, -16068, " ", $vqrange], _
		[-11660, -13661, " ", $vqrange], _
		[-12265, -11101, " ", $vqrange], _
		[-10178, -9506, " ", $vqrange], _
		[-8380, -7647, " ", $vqrange], _
		[-9677, -5365, " ", $vqrange], _
		[-10838, -3139, " ", $vqrange], _
		[-10546, -645, " ", $vqrange], _
		[-9785, 1837, " ", $vqrange], _
		[-11696, 3475, " ", $vqrange], _
		[-12061, 6046, " ", $vqrange], _
		[-12469, 8529, " ", $vqrange], _
		[-10427, 7063, " ", $vqrange], _
		[-9285, 4761, " ", $vqrange], _
		[-7478, 3010, " ", $vqrange], _
		[-6100, 5191, " ", $vqrange], _
		[-5366, 7681, " ", $vqrange], _
		[-5140, 10288, " ", $vqrange], _
		[-7316, 11717, " ", $vqrange], _
		[-6360, 14119, " ", $vqrange], _
		[-4607, 15931, "shrine", $vqrange], _
		[-6890, 16963, " ", $vqrange], _
		[-9476, 16861, " ", $vqrange], _
		[-12072, 16759, " ", $vqrange], _
		[-12943, 16570, " ", $vqrange], _
		[-12733, 14016, " ", $vqrange], _
		[-12465, 11392, " ", $vqrange], _
		[-9973, 10725, " ", $vqrange], _
		[-7356, 10739, " ", $vqrange], _
		[-4804, 11036, " ", $vqrange], _
		[-2222, 10881, " ", $vqrange], _
		[-1219, 13195, " ", $vqrange], _
		[-2520, 15406, " ", $vqrange], _
		[-4231, 17302, " ", $vqrange], _
		[-5935, 19256, " ", $vqrange], _
		[-8510, 19406, " ", $vqrange], _
		[-11027, 19473, " ", $vqrange], _
		[-8626, 18600, " ", $vqrange], _
		[-6070, 18507, " ", $vqrange], _
		[-4807, 20827, " ", $vqrange], _
		[-3252, 22839, " ", $vqrange], _
		[-741, 23122, " ", $vqrange], _
		[1742, 23427, " ", $vqrange], _
		[4252, 23200, " ", $vqrange], _
		[6818, 22882, " ", $vqrange], _
		[9338, 22641, " ", $vqrange], _
		[10582, 24346, "shrine", $vqrange], _
		[12070, 22283, " ", $vqrange], _
		[13205, 20022, " ", $vqrange], _
		[15501, 20030, " ", $vqrange], _
		[14144, 17810, " ", $vqrange], _
		[12808, 15679, " ", $vqrange], _
		[13517, 13217, " ", $vqrange], _
		[15167, 11139, " ", $vqrange], _
		[12563, 10736, " ", $vqrange], _
		[11173, 8550, " ", $vqrange], _
		[11835, 6041, " ", $vqrange], _
		[10202, 4014, " ", $vqrange], _
		[11465, 1802, " ", $vqrange], _
		[13303, 15, " ", $vqrange], _
		[14992, -1860, " ", $vqrange], _
		[15503, -4354, " ", $vqrange], _
		[14066, -6417, " ", $vqrange], _
		[11563, -7013, " ", $vqrange], _
		[9676, -8665, " ", $vqrange], _
		[8685, -11066, "shrine", $vqrange], _
		[7378, -8894, " ", $vqrange], _
		[8976, -6820, " ", $vqrange], _
		[10804, -5068, " ", $vqrange], _
		[10294, -7618, " ", $vqrange], _
		[9888, -10192, " ", $vqrange], _
		[10661, -12636, " ", $vqrange], _
		[12261, -14654, " ", $vqrange], _
		[12476, -14760, " ", $vqrange], _
		[9955, -14083, " ", $vqrange], _
		[7488, -14885, " ", $vqrange], _
		[8653, -17130, " ", $vqrange], _
		[9292, -19567, " ", $vqrange], _
		[11046, -21529, " ", $vqrange], _
		[12506, -22687, "shrine", $vqrange], _
		[10023, -23217, " ", $vqrange], _
		[7512, -23106, " ", $vqrange], _
		[7541, -25636, " ", $vqrange], _
		[7564, -25986, " ", $vqrange], _
		[5646, -24183, " ", $vqrange], _
		[3207, -23348, " ", $vqrange], _
		[2655, -25902, " ", $vqrange], _
		[471, -24409, " ", $vqrange], _
		[-381, -22021, " ", $vqrange], _
		[-2865, -21459, " ", $vqrange], _
		[-3867, -23896, " ", $vqrange], _
		[-5445, -25528, " ", $vqrange], _
		[-6198, -23087, " ", $vqrange], _
		[-6281, -20585, " ", $vqrange], _
		[-6335, -18023, " ", $vqrange], _
		[-7538, -15664, " ", $vqrange], _
		[-8927, -13402, " ", $vqrange], _
		[-5600, -12116, " ", $vqrange], _
		[-3097, -11885, " ", $vqrange], _
		[-555, -11404, " ", $vqrange], _
		[816, -14161, " ", $vqrange], _
		[1659, -16523, " ", $vqrange], _
		[3951, -15400, " ", $vqrange], _
		[4262, -12882, " ", $vqrange], _
		[2999, -10569, " ", $vqrange], _
		[959, -12205, " ", $vqrange], _
		[-610, -14336, " ", $vqrange], _
		[-2614, -15910, " ", $vqrange], _
		[-5021, -15098, " ", $vqrange], _
		[-2883, -16597, " ", $vqrange], _
		[-865, -18255, " ", $vqrange], _
		[1580, -19121, " ", $vqrange], _
		[3948, -20305, " ", $vqrange], _
		[6357, -20977, " ", $vqrange], _
		[6223, -18335, " ", $vqrange], _
		[5855, -15795, " ", $vqrange], _
		[8215, -14828, " ", $vqrange], _
		[10633, -14179, " ", $vqrange], _
		[9885, -11697, " ", $vqrange], _
		[7772, -10160, " ", $vqrange], _
		[5535, -9003, " ", $vqrange], _
		[3124, -8187, " ", $vqrange], _
		[675, -7255, " ", $vqrange], _
		[-1929, -7104, " ", $vqrange], _
		[-4030, -5749, " ", $vqrange], _
		[-6000, -4002, " ", $vqrange], _
		[-5244, -3222, "shrine", $vqrange], _
		[-7579, -1970, " ", $vqrange], _
		[-5804, -34, " ", $vqrange], _
		[-3445, 810, " ", $vqrange], _
		[-1783, 2779, " ", $vqrange], _
		[-2479, 5187, " ", $vqrange], _
		[-4584, 6537, " ", $vqrange], _
		[-6638, 8016, " ", $vqrange], _
		[-9066, 9021, " ", $vqrange], _
		[-8273, 11527, " ", $vqrange], _
		[-8929, 13988, " ", $vqrange], _
		[-8407, 16506, " ", $vqrange], _
		[-9540, 18760, " ", $vqrange], _
		[-10494, 16371, " ", $vqrange], _
		[-10833, 13778, " ", $vqrange], _
		[-8293, 13185, " ", $vqrange], _
		[-5666, 13241, " ", $vqrange], _
		[-3267, 14322, " ", $vqrange], _
		[-1472, 16226, " ", $vqrange], _
		[-1361, 18794, " ", $vqrange], _
		[-2426, 21065, " ", $vqrange], _
		[-4584, 19742, " ", $vqrange], _
		[-2016, 19117, " ", $vqrange], _
		[502, 19102, " ", $vqrange], _
		[3009, 19359, " ", $vqrange], _
		[4926, 21032, " ", $vqrange], _
		[7304, 20199, " ", $vqrange], _
		[8905, 18278, " ", $vqrange], _
		[11041, 19811, " ", $vqrange], _
		[10504, 17228, " ", $vqrange], _
		[9853, 14811, " ", $vqrange], _
		[9044, 12299, " ", $vqrange], _
		[8144, 9947, " ", $vqrange], _
		[6534, 8025, " ", $vqrange], _
		[4805, 6742, "shrine", $vqrange], _
		[5276, 9229, " ", $vqrange], _
		[4282, 11581, " ", $vqrange], _
		[2783, 13610, " ", $vqrange], _
		[1211, 15619, " ", $vqrange], _
		[3499, 16689, " ", $vqrange], _
		[5983, 17366, " ", $vqrange], _
		[6786, 14957, " ", $vqrange], _
		[6023, 12439, " ", $vqrange], _
		[3912, 10902, " ", $vqrange], _
		[1865, 9422, " ", $vqrange], _
		[-82, 7623, " ", $vqrange], _
		[1799, 5771, " ", $vqrange], _
		[3871, 4263, " ", $vqrange], _
		[5833, 2486, " ", $vqrange], _
		[7682, 703, " ", $vqrange], _
		[10097, -14, " ", $vqrange], _
		[12233, -1491, " ", $vqrange], _
		[10183, -3135, " ", $vqrange], _
		[7917, -4274, " ", $vqrange], _
		[5634, -5483, " ", $vqrange], _
		[4536, -3218, " ", $vqrange], _
		[2801, -1361, " ", $vqrange], _
		[1630, 941, " ", $vqrange], _
		[541, 3293, " ", $vqrange], _
		[60, 5755, " ", $vqrange], _
		[1892, 3957, " ", $vqrange], _
		[3723, 2037, " ", $vqrange], _
		[5481, 195, " ", $vqrange], _
		[7299, -1692, " ", $vqrange], _
		[5671, -3726, " ", $vqrange], _
		[3709, -5345, " ", $vqrange], _
		[1718, -6926, " ", $vqrange], _
		[-244, -8485, " ", $vqrange], _
		[-2689, -9373, " ", $vqrange], _
		[-5187, -10218, " ", $vqrange], _
		[-7556, -11180, " ", $vqrange], _
		[-9884, -12233, " ", $vqrange], _
		[-7460, -13107, " ", $vqrange], _
		[-5028, -13888, " ", $vqrange], _
		[-2638, -14914, " ", $vqrange], _
		[-742, -16627, " ", $vqrange], _
		[1550, -17738, " ", $vqrange], _
		[3946, -18708, " ", $vqrange], _
		[1974, -20288, " ", $vqrange], _
		[-659, -20472, " ", $vqrange], _
		[-3151, -20137, " ", $vqrange], _
		[-5704, -19833, " ", $vqrange], _
		[-8234, -19342, " ", $vqrange]
	]
	MoveandAggroVQFullRoute($aWaypoints)
EndFunc

