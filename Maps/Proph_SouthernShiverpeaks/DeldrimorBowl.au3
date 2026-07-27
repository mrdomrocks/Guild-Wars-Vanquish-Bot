#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Global $aDeldrimorBowlOutpostPath[2][2] = [ _
	[-9681, 34559], _
	[-11100, 35350] _
]

Func GoOutDeldrimorBowl()
	Local $l_i_Map = GetMapID()

	If $l_i_Map = $DeldrimorBowl_Map Then Return

	If $l_i_Map = $DeldrimorBowl_Outpost Then
		If $g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map Then Return
		$g_b_Vanquisher_TransitOnly = True
		CurrentAction("Outpost -> DeldrimorBowl (portal 1)")
		_Vanquisher_RunAggroPortalPath($aDeldrimorBowlOutpostPath, $vqrange, "outpost ")
		$g_i_Vanquisher_GoOutLastMapHandled = $l_i_Map
		$g_b_Vanquisher_TransitOnly = False
		Return
	EndIf

EndFunc

Func VQDeldrimorBowl()
	If GetMapID() <> $DeldrimorBowl_Map And GetMapID() <> $DeldrimorBowl_Outpost Then
		_Vanquisher_ResetGoOutRouteProgress()
		CurrentAction("Traveling to outpost for DeldrimorBowl.")
		TravelTo($DeldrimorBowl_Outpost)
	EndIf

	If GetMapID() = $DeldrimorBowl_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOutDeldrimorBowl()
		If GetMapID() <> $DeldrimorBowl_Map Then
			CurrentAction("Routing - on map " & GetMapID() & ", need DeldrimorBowl (" & $DeldrimorBowl_Map & ").")
			Return
	EndIf
	EndIf

	If GetMapID() <> $DeldrimorBowl_Map Then
		CurrentAction("DeldrimorBowl route waiting - on map " & GetMapID() & ", need " & $DeldrimorBowl_Map & ".")
		Return
	EndIf

	CurrentAction("Starting DeldrimorBowl vanquish route.")


	If GetAreaVanquished() = False Then AggroMoveTo(13532, -22187)
	If GetAreaVanquished() = False Then AggroMoveTo(14813.50, -18389.10)
	If GetAreaVanquished() = False Then AggroMoveTo(15334.20, -14363.50)
	If GetAreaVanquished() = False Then AggroMoveTo(12634.30, -11395.60)
	If GetAreaVanquished() = False Then AggroMoveTo(14332.50, -7755.90)
	If GetAreaVanquished() = False Then AggroMoveTo(10803.10, -5785.10)
	If GetAreaVanquished() = False Then AggroMoveTo(7960.50, -8684.70)
	If GetAreaVanquished() = False Then AggroMoveTo(9973.10, -12205.40)
	If GetAreaVanquished() = False Then AggroMoveTo(7228.30, -15155.70)
	If GetAreaVanquished() = False Then AggroMoveTo(5234.70, -11644.70)
	If GetAreaVanquished() = False Then AggroMoveTo(6123.50, -15585.80)
	If GetAreaVanquished() = False Then AggroMoveTo(4792.40, -19427.00)
	If GetAreaVanquished() = False Then AggroMoveTo(893.80, -20580.40)
	If GetAreaVanquished() = False Then AggroMoveTo(-2452.30, -18291.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-6341.80, -17221.50)
	If GetAreaVanquished() = False Then AggroMoveTo(-7183.10, -21194.70)
	If GetAreaVanquished() = False Then AggroMoveTo(-11159.60, -21888.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-7236.10, -21047.80)
	If GetAreaVanquished() = False Then AggroMoveTo(-7091.00, -17010.80)
	If GetAreaVanquished() = False Then AggroMoveTo(-7414.80, -13001.30)
	If GetAreaVanquished() = False Then AggroMoveTo(-5176.60, -9617.60)
	If GetAreaVanquished() = False Then AggroMoveTo(-6558.80, -5855.60)
	If GetAreaVanquished() = False Then AggroMoveTo(-6696.20, -1821.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-7718.30, 2114.90)
	If GetAreaVanquished() = False Then AggroMoveTo(-7083.90, 6073.80)
	If GetAreaVanquished() = False Then AggroMoveTo(-3202.20, 7239.50)
	If GetAreaVanquished() = False Then AggroMoveTo(-2289.70, 3298.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-5533.40, 917.10)
	If GetAreaVanquished() = False Then AggroMoveTo(-3837.50, -2713.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-200.20, -948.30)
	If GetAreaVanquished() = False Then AggroMoveTo(2985.30, 1479.00)
	If GetAreaVanquished() = False Then AggroMoveTo(1159.80, 5040.60)
	If GetAreaVanquished() = False Then AggroMoveTo(-2250.60, 7176.90)
	If GetAreaVanquished() = False Then AggroMoveTo(-6243.30, 7600.50)
	If GetAreaVanquished() = False Then AggroMoveTo(-6374.40, 11627.60)
	If GetAreaVanquished() = False Then AggroMoveTo(-5088.70, 15430.40)
	If GetAreaVanquished() = False Then AggroMoveTo(-2607.10, 18571.30)
	If GetAreaVanquished() = False Then AggroMoveTo(-6372.80, 20039.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-9472.50, 22570.40)
	If GetAreaVanquished() = False Then AggroMoveTo(-5550.40, 23576.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-1542.40, 22970.10)
	If GetAreaVanquished() = False Then AggroMoveTo(2302.40, 24146.20)
	If GetAreaVanquished() = False Then AggroMoveTo(5535.70, 26562.80)
	If GetAreaVanquished() = False Then AggroMoveTo(9000.10, 24521.00)
	If GetAreaVanquished() = False Then AggroMoveTo(12639.00, 22805.90)
	If GetAreaVanquished() = False Then AggroMoveTo(16052.90, 20718.40)
	If GetAreaVanquished() = False Then AggroMoveTo(13033.50, 18030.60)
	If GetAreaVanquished() = False Then AggroMoveTo(9360.50, 16373.70)
	If GetAreaVanquished() = False Then AggroMoveTo(8070.00, 12550.30)
	If GetAreaVanquished() = False Then AggroMoveTo(8086.90, 8514.60)
	If GetAreaVanquished() = False Then AggroMoveTo(9903.90, 4897.80)
	If GetAreaVanquished() = False Then AggroMoveTo(13247.80, 7163.70)
	If GetAreaVanquished() = False Then AggroMoveTo(15213.10, 10679.10)
	If GetAreaVanquished() = False Then AggroMoveTo(11830.30, 8475.10)
	If GetAreaVanquished() = False Then AggroMoveTo(10389.50, 4710.20)
	If GetAreaVanquished() = False Then AggroMoveTo(8552.30, 1116.10)
	If GetAreaVanquished() = False Then AggroMoveTo(4498.40, 1058.90)
	If GetAreaVanquished() = False Then AggroMoveTo(1873.90, 4133.90)
	If GetAreaVanquished() = False Then AggroMoveTo(-2169.80, 3959.70)

	; reverse
	If GetAreaVanquished() = False Then AggroMoveTo(-2169.80, 3959.70)
	If GetAreaVanquished() = False Then AggroMoveTo(1873.90, 4133.90)
	If GetAreaVanquished() = False Then AggroMoveTo(4498.40, 1058.90)
	If GetAreaVanquished() = False Then AggroMoveTo(8552.30, 1116.10)
	If GetAreaVanquished() = False Then AggroMoveTo(10389.50, 4710.20)
	If GetAreaVanquished() = False Then AggroMoveTo(11830.30, 8475.10)
	If GetAreaVanquished() = False Then AggroMoveTo(15213.10, 10679.10)
	If GetAreaVanquished() = False Then AggroMoveTo(13247.80, 7163.70)
	If GetAreaVanquished() = False Then AggroMoveTo(9903.90, 4897.80)
	If GetAreaVanquished() = False Then AggroMoveTo(8086.90, 8514.60)
	If GetAreaVanquished() = False Then AggroMoveTo(8070.00, 12550.30)
	If GetAreaVanquished() = False Then AggroMoveTo(9360.50, 16373.70)
	If GetAreaVanquished() = False Then AggroMoveTo(13033.50, 18030.60)
	If GetAreaVanquished() = False Then AggroMoveTo(16052.90, 20718.40)
	If GetAreaVanquished() = False Then AggroMoveTo(12639.00, 22805.90)
	If GetAreaVanquished() = False Then AggroMoveTo(9000.10, 24521.00)
	If GetAreaVanquished() = False Then AggroMoveTo(5535.70, 26562.80)
	If GetAreaVanquished() = False Then AggroMoveTo(2302.40, 24146.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-1542.40, 22970.10)
	If GetAreaVanquished() = False Then AggroMoveTo(-5550.40, 23576.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-9472.50, 22570.40)
	If GetAreaVanquished() = False Then AggroMoveTo(-6372.80, 20039.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-2607.10, 18571.30)
	If GetAreaVanquished() = False Then AggroMoveTo(-5088.70, 15430.40)
	If GetAreaVanquished() = False Then AggroMoveTo(-6374.40, 11627.60)
	If GetAreaVanquished() = False Then AggroMoveTo(-6243.30, 7600.50)
	If GetAreaVanquished() = False Then AggroMoveTo(-2250.60, 7176.90)
	If GetAreaVanquished() = False Then AggroMoveTo(1159.80, 5040.60)
	If GetAreaVanquished() = False Then AggroMoveTo(2985.30, 1479.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-200.20, -948.30)
	If GetAreaVanquished() = False Then AggroMoveTo(-3837.50, -2713.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-5533.40, 917.10)
	If GetAreaVanquished() = False Then AggroMoveTo(-2289.70, 3298.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-3202.20, 7239.50)
	If GetAreaVanquished() = False Then AggroMoveTo(-7083.90, 6073.80)
	If GetAreaVanquished() = False Then AggroMoveTo(-7718.30, 2114.90)
	If GetAreaVanquished() = False Then AggroMoveTo(-6696.20, -1821.00)
	If GetAreaVanquished() = False Then AggroMoveTo(-6558.80, -5855.60)
	If GetAreaVanquished() = False Then AggroMoveTo(-5176.60, -9617.60)
	If GetAreaVanquished() = False Then AggroMoveTo(-7414.80, -13001.30)
	If GetAreaVanquished() = False Then AggroMoveTo(-7091.00, -17010.80)
	If GetAreaVanquished() = False Then AggroMoveTo(-7236.10, -21047.80)
	If GetAreaVanquished() = False Then AggroMoveTo(-11159.60, -21888.20)
	If GetAreaVanquished() = False Then AggroMoveTo(-7183.10, -21194.70)
	If GetAreaVanquished() = False Then AggroMoveTo(-6341.80, -17221.50)
	If GetAreaVanquished() = False Then AggroMoveTo(-2452.30, -18291.20)
	If GetAreaVanquished() = False Then AggroMoveTo(893.80, -20580.40)
	If GetAreaVanquished() = False Then AggroMoveTo(4792.40, -19427.00)
	If GetAreaVanquished() = False Then AggroMoveTo(6123.50, -15585.80)
	If GetAreaVanquished() = False Then AggroMoveTo(5234.70, -11644.70)
	If GetAreaVanquished() = False Then AggroMoveTo(7228.30, -15155.70)
	If GetAreaVanquished() = False Then AggroMoveTo(9973.10, -12205.40)
	If GetAreaVanquished() = False Then AggroMoveTo(7960.50, -8684.70)
	If GetAreaVanquished() = False Then AggroMoveTo(10803.10, -5785.10)
	If GetAreaVanquished() = False Then AggroMoveTo(14332.50, -7755.90)
	If GetAreaVanquished() = False Then AggroMoveTo(12634.30, -11395.60)
	If GetAreaVanquished() = False Then AggroMoveTo(15334.20, -14363.50)
	If GetAreaVanquished() = False Then AggroMoveTo(14813.50, -18389.10)
	If GetAreaVanquished() = False Then AggroMoveTo(13532, -22187)
EndFunc

