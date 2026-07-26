;Mapped by Crux
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutJagaMoraine()
	;643 Sifhalla
	MoveTo(14800, 22958)
	MoveTo(15811, 22952)
	;546 Jaga Moraine (portal)
	Move(16643, 22917)
	WaitForLoad()
EndFunc

Func VQJagaMoraine()
	If GetMapID() <> $JagaMoraine_Map And GetMapID() <> $JagaMoraine_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for Jaga Moraine.")
		TravelTo($JagaMoraine_Outpost)
	EndIf

	If GetMapID() = $JagaMoraine_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
		If GetMapID() <> $JagaMoraine_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need Jaga Moraine (" & $JagaMoraine_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $JagaMoraine_Map Then
		CurrentAction("Jaga Moraine route waiting - on map " & GetMapID() & ", need " & $JagaMoraine_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Jaga Moraine vanquish route.")

	Local $aWaypoints[121][4] = [ _
		[-11548, -23727, " ", $vqrange], _
		[-9144, -22742, "shrine", $vqrange], _
		[-10013, -18995, " ", $vqrange], _
		[-8088, -17163, " ", $vqrange], _
		[-10635, -12507, " ", $vqrange], _
		[-9065, -8846, " ", $vqrange], _
		[-11463, -2008, " ", $vqrange], _
		[-9127, -2477, " ", $vqrange], _
		[-12964, 6518, " ", $vqrange], _
		[-12761, 11514, " ", $vqrange], _
		[-12009, 12858, " ", $vqrange], _
		[-10986, 14273, " ", $vqrange], _
		[-9741, 14931, " ", $vqrange], _
		[-8634, 16881, " ", $vqrange], _
		[-8426, 18482, " ", $vqrange], _
		[-8478, 21112, " ", $vqrange], _
		[-9483, 22023, " ", $vqrange], _
		[-10926, 22072, " ", $vqrange], _
		[-11583, 23564, " ", $vqrange], _
		[-9328, 21976, " ", $vqrange], _
		[-8510, 21016, " ", $vqrange], _
		[-8035, 18108, " ", $vqrange], _
		[-7218, 15790, " ", $vqrange], _
		[-5699, 15344, " ", $vqrange], _
		[-5109, 14795, " ", $vqrange], _
		[-2793, 14640, " ", $vqrange], _
		[274, 14922, " ", $vqrange], _
		[1539, 15800, " ", $vqrange], _
		[-3394, 15100, " ", $vqrange], _
		[-3373, 17374, " ", $vqrange], _
		[-5138, 18667, " ", $vqrange], _
		[-5325, 20249, " ", $vqrange], _
		[-4091, 21650, " ", $vqrange], _
		[-2608, 23711, " ", $vqrange], _
		[-722, 24552, " ", $vqrange], _
		[621, 24594, " ", $vqrange], _
		[1587, 24565, "shrine", $vqrange], _
		[1730, 25929, " ", $vqrange], _
		[7829, 19698, " ", $vqrange], _
		[10532, 20709, " ", $vqrange], _
		[9834, 24472, " ", $vqrange], _
		[11475, 24644, " ", $vqrange], _
		[12840, 22272, " ", $vqrange], _
		[11061, 21589, " ", $vqrange], _
		[15029, 19921, " ", $vqrange], _
		[16278, 17098, " ", $vqrange], _
		[15772, -4068, " ", $vqrange], _
		[11662, -9947, " ", $vqrange], _
		[11769, -15146, " ", $vqrange], _
		[15479, -17343, " ", $vqrange], _
		[13394, -20786, "shrine", $vqrange], _
		[12391, -24815, " ", $vqrange], _
		[7664, -23368, " ", $vqrange], _
		[4948, -25366, " ", $vqrange], _
		[7189, -16750, " ", $vqrange], _
		[9030, -16748, " ", $vqrange], _
		[10307, -19084, " ", $vqrange], _
		[9114, -21565, " ", $vqrange], _
		[11660, -20307, " ", $vqrange], _
		[11252, -12500, " ", $vqrange], _
		[5937, -9282, " ", $vqrange], _
		[12478, -2112, " ", $vqrange], _
		[10268, 5755, "shrine", $vqrange], _
		[12569, 4732, " ", $vqrange], _
		[12255, 10140, " ", $vqrange], _
		[8927, 13912, " ", $vqrange], _
		[10413, 15976, " ", $vqrange], _
		[7285, 15390, " ", $vqrange], _
		[4032, 17446, " ", $vqrange], _
		[3851, 19324, " ", $vqrange], _
		[1563, 19210, " ", $vqrange], _
		[992, 20065, " ", $vqrange], _
		[3011, 19151, "wait20", $vqrange], _
		[-1148, 22041, " ", $vqrange], _
		[-915, 18230, " ", $vqrange], _
		[3556, 13049, " ", $vqrange], _
		[2649, 9270, " ", $vqrange], _
		[3636, 10119, " ", $vqrange], _
		[4538, 11033, " ", $vqrange], _
		[5617, 11307, " ", $vqrange], _
		[6873, 11609, " ", $vqrange], _
		[2496, 6441, " ", $vqrange], _
		[4514, 4967, " ", $vqrange], _
		[2957, 3356, " ", $vqrange], _
		[-3749, 3657, " ", $vqrange], _
		[-64, 12766, " ", $vqrange], _
		[-4779, 9529, " ", $vqrange], _
		[-5574, 5044, "shrine", $vqrange], _
		[-8296, 6428, " ", $vqrange], _
		[-8635, 12723, " ", $vqrange], _
		[-6171, 12964, " ", $vqrange], _
		[-4511, 13537, " ", $vqrange], _
		[-5538, 1799, " ", $vqrange], _
		[-7742, 1293, " ", $vqrange], _
		[-801, 1865, " ", $vqrange], _
		[427, 5673, " ", $vqrange], _
		[685, 6185, " ", $vqrange], _
		[5668, 1579, " ", $vqrange], _
		[3631, -1702, " ", $vqrange], _
		[7147, -635, " ", $vqrange], _
		[8605, 112, " ", $vqrange], _
		[5875, -4001, " ", $vqrange], _
		[5054, -6700, " ", $vqrange], _
		[3045, -5454, " ", $vqrange], _
		[1552, -408, " ", $vqrange], _
		[-2295, -8521, "shrine", $vqrange], _
		[-5887, -5229, " ", $vqrange], _
		[-4899, -2212, " ", $vqrange], _
		[760, -176, " ", $vqrange], _
		[-44, -5199, " ", $vqrange], _
		[-2683, -7327, " ", $vqrange], _
		[999, -14119, " ", $vqrange], _
		[-243, -25415, " ", $vqrange], _
		[-2508, -24472, " ", $vqrange], _
		[-2151, -15104, " ", $vqrange], _
		[-7486, -7776, " ", $vqrange], _
		[-6879, -18717, " ", $vqrange], _
		[-4307, -21104, " ", $vqrange], _
		[-3767, -19964, " ", $vqrange], _
		[-5188, -13767, " ", $vqrange], _
		[-8221, -19917, " ", $vqrange] ]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
