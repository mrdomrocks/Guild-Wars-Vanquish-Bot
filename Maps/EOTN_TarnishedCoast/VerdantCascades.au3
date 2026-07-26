;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutVerdantCascades()
	; Outpost exit not yet mapped - placeholder coords
	MoveTo(1683, -1594)
	Move(4600, -27863)
	WaitForLoad()
EndFunc

Func VQVerdantCascades()
	If GetMapID() <> $VerdantCascades_Map And GetMapID() <> $VerdantCascades_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Verdant Cascades.")
		TravelTo($VerdantCascades_Outpost)
	EndIf

	If GetMapID() = $VerdantCascades_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $VerdantCascades_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Verdant Cascades (" & $VerdantCascades_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $VerdantCascades_Map Then
		CurrentAction("Verdant Cascades route waiting - on map " & GetMapID() & ", need " & $VerdantCascades_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Verdant Cascades vanquish route.")

	Local $aWaypoints[190][4] = [ _
		[-22145, 6138, " ", $vqrange], _
		[-20375, 6556, "shrine", $vqrange], _
		[-20850, 4055, " ", $vqrange], _
		[-19047, 2275, " ", $vqrange], _
		[-16719, 1303, " ", $vqrange], _
		[-19239, 449, " ", $vqrange], _
		[-21713, 63, " ", $vqrange], _
		[-19328, -998, " ", $vqrange], _
		[-16870, -1458, " ", $vqrange], _
		[-14354, -1930, " ", $vqrange], _
		[-15454, -4273, " ", $vqrange], _
		[-17835, -5300, " ", $vqrange], _
		[-20320, -4631, " ", $vqrange], _
		[-22826, -4435, " ", $vqrange], _
		[-24843, -6005, " ", $vqrange], _
		[-25205, -8612, " ", $vqrange], _
		[-22814, -7866, " ", $vqrange], _
		[-21856, -10252, " ", $vqrange], _
		[-21611, -7703, " ", $vqrange], _
		[-19085, -7700, " ", $vqrange], _
		[-17292, -8270, "shrine", $vqrange], _
		[-16118, -10482, " ", $vqrange], _
		[-13604, -10622, " ", $vqrange], _
		[-11278, -11563, " ", $vqrange], _
		[-12268, -9255, " ", $vqrange], _
		[-13867, -7169, " ", $vqrange], _
		[-14618, -4773, " ", $vqrange], _
		[-17098, -4026, " ", $vqrange], _
		[-14525, -4369, " ", $vqrange], _
		[-11874, -4345, " ", $vqrange], _
		[-10043, -2497, " ", $vqrange], _
		[-8010, -1004, " ", $vqrange], _
		[-8304, 1586, " ", $vqrange], _
		[-10436, 3108, " ", $vqrange], _
		[-12645, 4287, " ", $vqrange], _
		[-15083, 4961, " ", $vqrange], _
		[-16944, 6678, " ", $vqrange], _
		[-15117, 8549, " ", $vqrange], _
		[-13708, 10650, " ", $vqrange], _
		[-14060, 13234, " ", $vqrange], _
		[-16285, 14389, " ", $vqrange], _
		[-18809, 15055, " ", $vqrange], _
		[-20045, 15226, " ", $vqrange], _
		[-17537, 14920, " ", $vqrange], _
		[-15094, 13923, " ", $vqrange], _
		[-13172, 12161, " ", $vqrange], _
		[-11027, 10707, " ", $vqrange], _
		[-9414, 12691, " ", $vqrange], _
		[-7404, 14211, "shrine", $vqrange], _
		[-8437, 15591, " ", $vqrange], _
		[-5999, 16178, " ", $vqrange], _
		[-3449, 15997, " ", $vqrange], _
		[-1862, 15312, " ", $vqrange], _
		[-2350, 14004, " ", $vqrange], _
		[-4315, 13469, " ", $vqrange], _
		[-5384, 11059, " ", $vqrange], _
		[-6396, 8678, " ", $vqrange], _
		[-4942, 6474, " ", $vqrange], _
		[-2691, 5341, " ", $vqrange], _
		[-1145, 6157, " ", $vqrange], _
		[854, 7703, " ", $vqrange], _
		[2152, 7250, "shrine", $vqrange], _
		[3472, 7841, " ", $vqrange], _
		[3888, 10203, " ", $vqrange], _
		[2495, 10883, " ", $vqrange], _
		[5004, 10983, " ", $vqrange], _
		[5030, 10982, " ", $vqrange], _
		[7131, 9551, " ", $vqrange], _
		[7814, 8642, " ", $vqrange], _
		[7374, 11158, " ", $vqrange], _
		[7422, 13718, " ", $vqrange], _
		[8482, 16087, " ", $vqrange], _
		[10926, 15202, " ", $vqrange], _
		[12319, 12968, " ", $vqrange], _
		[13833, 10864, " ", $vqrange], _
		[15592, 8970, " ", $vqrange], _
		[17806, 10271, " ", $vqrange], _
		[19890, 11791, " ", $vqrange], _
		[22198, 12810, " ", $vqrange], _
		[24637, 13811, " ", $vqrange], _
		[25473, 12582, " ", $vqrange], _
		[24770, 11146, "shrine", $vqrange], _
		[23932, 8766, " ", $vqrange], _
		[22657, 6595, " ", $vqrange], _
		[23867, 4265, " ", $vqrange], _
		[25632, 2473, " ", $vqrange], _
		[24710, 47, " ", $vqrange], _
		[24127, 2584, " ", $vqrange], _
		[23175, 5024, " ", $vqrange], _
		[21667, 7184, " ", $vqrange], _
		[19880, 8957, " ", $vqrange], _
		[21406, 6943, " ", $vqrange], _
		[21179, 4369, " ", $vqrange], _
		[19503, 2510, " ", $vqrange], _
		[19148, -26, " ", $vqrange], _
		[16881, -1115, " ", $vqrange], _
		[14660, 117, " ", $vqrange], _
		[13473, 2382, " ", $vqrange], _
		[12534, 3425, "shrine", $vqrange], _
		[10967, 5379, " ", $vqrange], _
		[9363, 3388, " ", $vqrange], _
		[6987, 2503, " ", $vqrange], _
		[5897, 4772, " ", $vqrange], _
		[4473, 6904, " ", $vqrange], _
		[6211, 5083, " ", $vqrange], _
		[7751, 3051, " ", $vqrange], _
		[8334, 497, " ", $vqrange], _
		[9616, -1691, " ", $vqrange], _
		[10952, -3821, " ", $vqrange], _
		[12233, -5544, " ", $vqrange], _
		[13600, -3679, " ", $vqrange], _
		[16033, -2986, " ", $vqrange], _
		[18526, -2783, " ", $vqrange], _
		[20969, -3354, " ", $vqrange], _
		[22147, -5698, " ", $vqrange], _
		[24046, -7529, " ", $vqrange], _
		[23330, -9211, "shrine", $vqrange], _
		[24566, -10415, " ", $vqrange], _
		[24281, -12965, " ", $vqrange], _
		[23211, -13854, " ", $vqrange], _
		[21249, -12937, " ", $vqrange], _
		[20958, -10421, " ", $vqrange], _
		[19513, -12525, " ", $vqrange], _
		[17932, -10514, " ", $vqrange], _
		[18068, -7879, " ", $vqrange], _
		[17515, -5353, " ", $vqrange], _
		[15051, -5885, " ", $vqrange], _
		[12462, -6208, " ", $vqrange], _
		[9952, -5853, " ", $vqrange], _
		[11789, -7603, " ", $vqrange], _
		[14038, -8954, " ", $vqrange], _
		[15724, -10815, " ", $vqrange], _
		[14383, -12877, " ", $vqrange], _
		[12256, -11523, " ", $vqrange], _
		[9741, -10747, " ", $vqrange], _
		[7298, -11351, " ", $vqrange], _
		[5348, -13003, " ", $vqrange], _
		[2741, -12676, " ", $vqrange], _
		[1421, -13067, " ", $vqrange], _
		[1118, -10468, " ", $vqrange], _
		[-183, -8307, " ", $vqrange], _
		[-618, -7763, "shrine", $vqrange], _
		[1719, -6670, " ", $vqrange], _
		[3701, -5144, " ", $vqrange], _
		[5454, -3272, " ", $vqrange], _
		[6954, -1231, " ", $vqrange], _
		[5066, -2978, " ", $vqrange], _
		[3273, -4813, " ", $vqrange], _
		[1615, -6691, " ", $vqrange], _
		[-213, -8405, " ", $vqrange], _
		[-2285, -10007, " ", $vqrange], _
		[-4613, -9067, " ", $vqrange], _
		[-6782, -7562, " ", $vqrange], _
		[-6099, -10087, " ", $vqrange], _
		[-5914, -12679, " ", $vqrange], _
		[-5869, -14085, " ", $vqrange], _
		[-8362, -13432, " ", $vqrange], _
		[-9544, -11186, " ", $vqrange], _
		[-9867, -8706, " ", $vqrange], _
		[-9580, -6217, " ", $vqrange], _
		[-11328, -8121, " ", $vqrange], _
		[-13308, -9767, " ", $vqrange], _
		[-15728, -8943, " ", $vqrange], _
		[-18050, -7904, " ", $vqrange], _
		[-16083, -6204, " ", $vqrange], _
		[-13644, -5318, " ", $vqrange], _
		[-11120, -5141, " ", $vqrange], _
		[-8905, -6344, " ", $vqrange], _
		[-6467, -7338, " ", $vqrange], _
		[-3872, -6963, " ", $vqrange], _
		[-2232, -4999, " ", $vqrange], _
		[-3539, -2825, " ", $vqrange], _
		[-4991, -616, " ", $vqrange], _
		[-5569, 1898, " ", $vqrange], _
		[-4269, 4056, " ", $vqrange], _
		[-1970, 5261, " ", $vqrange], _
		[391, 6419, " ", $vqrange], _
		[-2078, 5541, " ", $vqrange], _
		[-4575, 5897, " ", $vqrange], _
		[-6215, 7882, " ", $vqrange], _
		[-5834, 10460, " ", $vqrange], _
		[-4590, 12779, " ", $vqrange], _
		[-5605, 15120, " ", $vqrange], _
		[-7660, 13535, " ", $vqrange], _
		[-9804, 12086, " ", $vqrange], _
		[-11785, 10389, " ", $vqrange], _
		[-14101, 9285, " ", $vqrange], _
		[-16134, 7695, " ", $vqrange], _
		[-18561, 6779, " ", $vqrange], _
		[-21038, 6138, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
