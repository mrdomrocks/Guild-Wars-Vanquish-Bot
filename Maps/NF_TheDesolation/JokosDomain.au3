;Mapped from route notes
#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aJokosDomainOutpostPath[2][2] = [ _
	[-14567, 6121], _
	[3258.71, 2855.84] _
]

Func GoOutJokosDomain()
	Local $l_i_Map = GetMapID()
	If $l_i_Map = $JokosDomain_Map Then Return
	If $l_i_Map = $JokosDomain_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> JokosDomain (portal)")
		_Vanquisher_RunAggroPortalPath($aJokosDomainOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf
EndFunc

Func VQJokosDomain()
	If GetMapID() <> $JokosDomain_Map And GetMapID() <> $JokosDomain_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for JokosDomain.")
		TravelTo($JokosDomain_Outpost)
	EndIf

	If GetMapID() = $JokosDomain_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutJokosDomain()
		If GetMapID() <> $JokosDomain_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need JokosDomain (" & $JokosDomain_Map & ").")
			Return
		EndIf
	EndIf

	If GetMapID() <> $JokosDomain_Map Then
		CurrentAction("JokosDomain route waiting - on map " & GetMapID() & ", need " & $JokosDomain_Map & ".")
		Return
	EndIf

	CurrentAction("Starting JokosDomain vanquish route.")
	Local $aWaypoints[249][4] = [ _
		[-14567, 6121, "shrine", $vqrange], _
		[-13602, 2459, " ", $vqrange], _
		[-12152, 2625, " ", $vqrange], _
		[-11159, 3937, " ", $vqrange], _
		[-10957, 4260, " ", $vqrange], _
		[-8237, 4903, " ", $vqrange], _
		[-5716, 5577, " ", $vqrange], _
		[-8113, 7128, " ", $vqrange], _
		[-9961, 7390, " ", $vqrange], _
		[-9950, 9320, " ", $vqrange], _
		[-11140, 10616, " ", $vqrange], _
		[-13600, 11190, " ", $vqrange], _
		[-15372, 10687, " ", $vqrange], _
		[-15904, 10669, " ", $vqrange], _
		[-17926, 11217, " ", $vqrange], _
		[-17970, 11987, " ", $vqrange], _
		[-16780, 12407, " ", $vqrange], _
		[-15411, 14315, " ", $vqrange], _
		[-15686, 13336, " ", $vqrange], _
		[-13524, 12570, " ", $vqrange], _
		[-13434, 11383, " ", $vqrange], _
		[-12130, 11511, " ", $vqrange], _
		[-11060, 11722, " ", $vqrange], _
		[-9969, 10011, " ", $vqrange], _
		[-9284, 9937, " ", $vqrange], _
		[-8786, 10515, " ", $vqrange], _
		[-9060, 12053, " ", $vqrange], _
		[-8041, 12846, " ", $vqrange], _
		[-7321, 14005, " ", $vqrange], _
		[-7698, 14988, " ", $vqrange], _
		[-8962, 14746, " ", $vqrange], _
		[-9974, 14060, " ", $vqrange], _
		[-10079, 15209, " ", $vqrange], _
		[-10388, 16048, " ", $vqrange], _
		[-11927, 15478, " ", $vqrange], _
		[-12499, 14696, " ", $vqrange], _
		[-13847, 15862, " ", $vqrange], _
		[-12291, 16336, " ", $vqrange], _
		[-11034, 16755, " ", $vqrange], _
		[-9909, 17684, " ", $vqrange], _
		[-8734, 17618, " ", $vqrange], _
		[-7499, 17621, " ", $vqrange], _
		[-6404, 18123, " ", $vqrange], _
		[-5094, 18198, " ", $vqrange], _
		[-5357, 17150, " ", $vqrange], _
		[-5889, 15926, " ", $vqrange], _
		[-5652, 14851, " ", $vqrange], _
		[-5912, 13899, " ", $vqrange], _
		[-6218, 12789, " ", $vqrange], _
		[-6053, 11778, " ", $vqrange], _
		[-7418, 10638, " ", $vqrange], _
		[-7762, 9311, " ", $vqrange], _
		[-4717, 9123, " ", $vqrange], _
		[-3939, 8687, " ", $vqrange], _
		[-2472, 9577, " ", $vqrange], _
		[-1761, 11135, " ", $vqrange], _
		[-1641, 12377, " ", $vqrange], _
		[-2139, 14394, " ", $vqrange], _
		[-112, 13745, " ", $vqrange], _
		[242, 14988, " ", $vqrange], _
		[1020, 16657, " ", $vqrange], _
		[2133, 16925, " ", $vqrange], _
		[3145, 16361, " ", $vqrange], _
		[3221, 13675, " ", $vqrange], _
		[3078, 12792, " ", $vqrange], _
		[2947, 11992, " ", $vqrange], _
		[1774, 11119, " ", $vqrange], _
		[2205, 9271, " ", $vqrange], _
		[3547, 9254, " ", $vqrange], _
		[3302, 10604, " ", $vqrange], _
		[3761, 12409, " ", $vqrange], _
		[5077, 13206, " ", $vqrange], _
		[5857, 12369, " ", $vqrange], _
		[7088, 10324, " ", $vqrange], _
		[7027, 10087, " ", $vqrange], _
		[10347, 12135, " ", $vqrange], _
		[12414, 12890, " ", $vqrange], _
		[13745, 13834, " ", $vqrange], _
		[16174, 14684, " ", $vqrange], _
		[18099, 14569, " ", $vqrange], _
		[19501, 13476, " ", $vqrange], _
		[20248, 14058, " ", $vqrange], _
		[18071, 13176, " ", $vqrange], _
		[18177, 11422, " ", $vqrange], _
		[18586, 9253, " ", $vqrange], _
		[17741, 7655, " ", $vqrange], _
		[17461, 6898, " ", $vqrange], _
		[16315, 7141, " ", $vqrange], _
		[16082, 9130, " ", $vqrange], _
		[15540, 11418, " ", $vqrange], _
		[14305, 12008, " ", $vqrange], _
		[13508, 11491, " ", $vqrange], _
		[12049, 11554, " ", $vqrange], _
		[10114, 10550, " ", $vqrange], _
		[10478, 8942, " ", $vqrange], _
		[11957, 7838, " ", $vqrange], _
		[13782, 6780, " ", $vqrange], _
		[14910, 5001, " ", $vqrange], _
		[15710, 4200, " ", $vqrange], _
		[16526, 2914, " ", $vqrange], _
		[16869, 390, " ", $vqrange], _
		[17419, -3367, " ", $vqrange], _
		[15592, -2502, " ", $vqrange], _
		[14609, -1659, " ", $vqrange], _
		[12332, -1434, " ", $vqrange], _
		[10043, -82, " ", $vqrange], _
		[9833, 1360, " ", $vqrange], _
		[11038, 3268, " ", $vqrange], _
		[10103, 2077, " ", $vqrange], _
		[10007, -21, " ", $vqrange], _
		[10982, -5074, " ", $vqrange], _
		[12863, -2166, " ", $vqrange], _
		[11279, -8535, " ", $vqrange], _
		[11421, -9767, " ", $vqrange], _
		[12581, -11181, " ", $vqrange], _
		[14032, -11452, " ", $vqrange], _
		[16600, -9556, " ", $vqrange], _
		[17242, -9723, " ", $vqrange], _
		[17188, -10856, " ", $vqrange], _
		[16999, -12160, " ", $vqrange], _
		[16405, -13348, " ", $vqrange], _
		[15505, -14067, " ", $vqrange], _
		[14297, -14322, " ", $vqrange], _
		[13026, -14406, " ", $vqrange], _
		[11987, -15386, " ", $vqrange], _
		[11278, -16805, " ", $vqrange], _
		[10617, -17806, " ", $vqrange], _
		[9481, -17864, " ", $vqrange], _
		[9138, -16671, " ", $vqrange], _
		[8937, -15008, " ", $vqrange], _
		[9059, -13705, " ", $vqrange], _
		[10021, -12053, " ", $vqrange], _
		[11235, -10854, " ", $vqrange], _
		[11148, -8997, " ", $vqrange], _
		[11008, -7556, " ", $vqrange], _
		[10717, -6630, " ", $vqrange], _
		[8965, -6799, " ", $vqrange], _
		[7280, -6825, " ", $vqrange], _
		[5652, -6420, " ", $vqrange], _
		[3816, -6273, " ", $vqrange], _
		[2280, -6093, " ", $vqrange], _
		[1609, -6082, " ", $vqrange], _
		[877, -6631, " ", $vqrange], _
		[140, -7441, " ", $vqrange], _
		[-636, -8325, " ", $vqrange], _
		[-428, -9387, " ", $vqrange], _
		[627, -10076, " ", $vqrange], _
		[1829, -10349, " ", $vqrange], _
		[3024, -10237, " ", $vqrange], _
		[3407, -12839, " ", $vqrange], _
		[4744, -10118, " ", $vqrange], _
		[6079, -11326, " ", $vqrange], _
		[7067, -12893, " ", $vqrange], _
		[6451, -14360, " ", $vqrange], _
		[5548, -15298, " ", $vqrange], _
		[5937, -16650, " ", $vqrange], _
		[6009, -16694, " ", $vqrange], _
		[4457, -17218, " ", $vqrange], _
		[2721, -17306, " ", $vqrange], _
		[1340, -18061, " ", $vqrange], _
		[-1246, -19008, " ", $vqrange], _
		[-2436, -19025, " ", $vqrange], _
		[-4244, -19437, " ", $vqrange], _
		[-2621, -18574, " ", $vqrange], _
		[-3332, -17184, " ", $vqrange], _
		[-3349, -15742, " ", $vqrange], _
		[-2195, -15457, " ", $vqrange], _
		[-605, -15913, " ", $vqrange], _
		[1365, -16423, " ", $vqrange], _
		[1637, -15270, " ", $vqrange], _
		[768, -14566, " ", $vqrange], _
		[-337, -14023, " ", $vqrange], _
		[-499, -12056, " ", $vqrange], _
		[-1364, -11108, " ", $vqrange], _
		[-1682, -12257, " ", $vqrange], _
		[-4152, -12971, " ", $vqrange], _
		[-1677, -12226, " ", $vqrange], _
		[-392, -10529, " ", $vqrange], _
		[1497, -8867, " ", $vqrange], _
		[2941, -8473, " ", $vqrange], _
		[5243, -8361, " ", $vqrange], _
		[2521, -7102, " ", $vqrange], _
		[2724, -5176, " ", $vqrange], _
		[3856, -4482, " ", $vqrange], _
		[4945, -4015, " ", $vqrange], _
		[6946, -3455, " ", $vqrange], _
		[4909, -2451, " ", $vqrange], _
		[4036, -2150, " ", $vqrange], _
		[4082, -567, " ", $vqrange], _
		[4631, 896, " ", $vqrange], _
		[5950, 1317, " ", $vqrange], _
		[5515, 2502, " ", $vqrange], _
		[5133, 3676, " ", $vqrange], _
		[5288, 5091, " ", $vqrange], _
		[5545, 6436, " ", $vqrange], _
		[6682, 4236, " ", $vqrange], _
		[8160, 2332, " ", $vqrange], _
		[7106, 3931, " ", $vqrange], _
		[5688, 5021, " ", $vqrange], _
		[3563, 4322, " ", $vqrange], _
		[2093, 5392, " ", $vqrange], _
		[745, 5477, " ", $vqrange], _
		[457, 3007, " ", $vqrange], _
		[1409, 903, " ", $vqrange], _
		[-1870, 2080, " ", $vqrange], _
		[-1771, -662, " ", $vqrange], _
		[-603, -2466, " ", $vqrange], _
		[1634, -1471, " ", $vqrange], _
		[2581, -600, " ", $vqrange], _
		[3659, -1380, " ", $vqrange], _
		[6382, -1402, " ", $vqrange], _
		[7553, -1834, " ", $vqrange], _
		[6131, 64, " ", $vqrange], _
		[4205, 2696, " ", $vqrange], _
		[3111, 1966, " ", $vqrange], _
		[1885, 523, " ", $vqrange], _
		[1042, -1122, " ", $vqrange], _
		[-1188, -2930, " ", $vqrange], _
		[-1788, -3953, " ", $vqrange], _
		[-2715, -4620, " ", $vqrange], _
		[-3920, -5854, " ", $vqrange], _
		[-4499, -8034, " ", $vqrange], _
		[-5122, -8938, " ", $vqrange], _
		[-6269, -9389, " ", $vqrange], _
		[-7986, -9769, " ", $vqrange], _
		[-8815, -9059, " ", $vqrange], _
		[-8807, -6238, " ", $vqrange], _
		[-7537, -4474, " ", $vqrange], _
		[-5828, -4782, " ", $vqrange], _
		[-9467, -4553, " ", $vqrange], _
		[-10510, -5670, " ", $vqrange], _
		[-11022, -6395, " ", $vqrange], _
		[-11935, -6383, " ", $vqrange], _
		[-12274, -5524, " ", $vqrange], _
		[-11932, -4561, " ", $vqrange], _
		[-11410, -3046, " ", $vqrange], _
		[-11201, -2218, " ", $vqrange], _
		[-11557, -1585, " ", $vqrange], _
		[-12228, -346, " ", $vqrange], _
		[-11248, -251, " ", $vqrange], _
		[-10264, 289, " ", $vqrange], _
		[-9046, 922, " ", $vqrange], _
		[-7997, 1305, " ", $vqrange], _
		[-6569, 1159, " ", $vqrange], _
		[-4748, 612, " ", $vqrange], _
		[-2871, -3, " ", $vqrange], _
		[-2047, 920, " ", $vqrange], _
		[-1554, 3136, " ", $vqrange], _
		[-2249, 7208, " ", $vqrange]]

	MoveandAggroVQFullRoute($aWaypoints)
EndFunc
