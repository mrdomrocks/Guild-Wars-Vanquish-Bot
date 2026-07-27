#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutBukdekByway()
        Local $aGoOutRoute[2][2] = [ [16567.48, 19462.11] _
                , [16579.60, 19735.57] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "BukdekByway exit ")
EndFunc

Func VQBukdekByway()
	If GetMapID() <> $BukdekByway_Map And GetMapID() <> $BukdekByway_Outpost Then TravelTo($BukdekByway_Outpost)
	If GetMapID() = $BukdekByway_Outpost Then
		_Vanquisher_ApplyDifficulty()
		GoOut()
	EndIf

	If GetMapID() <> $BukdekByway_Map Then
		CurrentAction("Bukdek route waiting — on map " & GetMapID() & ", need " & $BukdekByway_Map & ".")
		Return
	EndIf

	CurrentAction("Starting Bukdek Byway route.")


		If GetAreaVanquished() = False Then AggroMoveTo(-8896.22, -10049.12)
		If GetAreaVanquished() = False Then AggroMoveTo(-5760.25, -8904.54)
		If GetAreaVanquished() = False Then AggroMoveTo(-2196.06, -10991.77)
		If GetAreaVanquished() = False Then AggroMoveTo(1972.12, -11507.83)
		If GetAreaVanquished() = False Then AggroMoveTo(1189.53, -13030.74)
		If GetAreaVanquished() = False Then AggroMoveTo(3761.59, -12137.82)
		If GetAreaVanquished() = False Then AggroMoveTo(7332.76, -10819.01)
		If GetAreaVanquished() = False Then AggroMoveTo(7343.43, -7689.41)
		If GetAreaVanquished() = False Then AggroMoveTo(11197.10, -7148.19)
		If GetAreaVanquished() = False Then AggroMoveTo(9985.19, -4767.78)
		If GetAreaVanquished() = False Then AggroMoveTo(4520.97, -5838.42)
		If GetAreaVanquished() = False Then AggroMoveTo(2200.79, -8489.97)
		If GetAreaVanquished() = False Then AggroMoveTo(-2861.21, -7832.67)
		If GetAreaVanquished() = False Then AggroMoveTo(-2648.72, -3517.54)
		If GetAreaVanquished() = False Then AggroMoveTo(-977.90, 1102.80)
		If GetAreaVanquished() = False Then AggroMoveTo(-1759.91, 6427.01)
		If GetAreaVanquished() = False Then AggroMoveTo(-977.90, 1102.80)
		If GetAreaVanquished() = False Then AggroMoveTo(-889.41, -2481.91)
		If GetAreaVanquished() = False Then AggroMoveTo(3705.52, -2560.01)
		If GetAreaVanquished() = False Then AggroMoveTo(6971.71, -2678.50)
		If GetAreaVanquished() = False Then AggroMoveTo(11266.22, -2012.58)
		If GetAreaVanquished() = False Then AggroMoveTo(11821.58, 3703.98)
		If GetAreaVanquished() = False Then AggroMoveTo(11193.93, -1980.77)
		If GetAreaVanquished() = False Then AggroMoveTo(6844.04, -2767.20)
		If GetAreaVanquished() = False Then AggroMoveTo(3307.58, -367.18)
		If GetAreaVanquished() = False Then AggroMoveTo(5397.99, 4369.76)
		If GetAreaVanquished() = False Then AggroMoveTo(8012.89, 5940.32)
		If GetAreaVanquished() = False Then AggroMoveTo(5379.86, 10230.64)
		If GetAreaVanquished() = False Then AggroMoveTo(4585.13, 14354.05)
		If GetAreaVanquished() = False Then AggroMoveTo(-5403.12, 13382.99)
		If GetAreaVanquished() = False Then AggroMoveTo(3597.17, 16815.80)
		If GetAreaVanquished() = False Then AggroMoveTo(-1308.34, 16657.90)
		If GetAreaVanquished() = False Then AggroMoveTo(-9369.35, 11527.43)

		; reverse
		If GetAreaVanquished() = False Then AggroMoveTo(-9369.35, 11527.43)
		If GetAreaVanquished() = False Then AggroMoveTo(-1308.34, 16657.90)
		If GetAreaVanquished() = False Then AggroMoveTo(3597.17, 16815.80)
		If GetAreaVanquished() = False Then AggroMoveTo(-5403.12, 13382.99)
		If GetAreaVanquished() = False Then AggroMoveTo(4585.13, 14354.05)
		If GetAreaVanquished() = False Then AggroMoveTo(5379.86, 10230.64)
		If GetAreaVanquished() = False Then AggroMoveTo(8012.89, 5940.32)
		If GetAreaVanquished() = False Then AggroMoveTo(5397.99, 4369.76)
		If GetAreaVanquished() = False Then AggroMoveTo(3307.58, -367.18)
		If GetAreaVanquished() = False Then AggroMoveTo(6844.04, -2767.20)
		If GetAreaVanquished() = False Then AggroMoveTo(11193.93, -1980.77)
		If GetAreaVanquished() = False Then AggroMoveTo(11821.58, 3703.98)
		If GetAreaVanquished() = False Then AggroMoveTo(11266.22, -2012.58)
		If GetAreaVanquished() = False Then AggroMoveTo(6971.71, -2678.50)
		If GetAreaVanquished() = False Then AggroMoveTo(3705.52, -2560.01)
		If GetAreaVanquished() = False Then AggroMoveTo(-889.41, -2481.91)
		If GetAreaVanquished() = False Then AggroMoveTo(-977.90, 1102.80)
		If GetAreaVanquished() = False Then AggroMoveTo(-1759.91, 6427.01)
		If GetAreaVanquished() = False Then AggroMoveTo(-977.90, 1102.80)
		If GetAreaVanquished() = False Then AggroMoveTo(-2648.72, -3517.54)
		If GetAreaVanquished() = False Then AggroMoveTo(-2861.21, -7832.67)
		If GetAreaVanquished() = False Then AggroMoveTo(2200.79, -8489.97)
		If GetAreaVanquished() = False Then AggroMoveTo(4520.97, -5838.42)
		If GetAreaVanquished() = False Then AggroMoveTo(9985.19, -4767.78)
		If GetAreaVanquished() = False Then AggroMoveTo(11197.10, -7148.19)
		If GetAreaVanquished() = False Then AggroMoveTo(7343.43, -7689.41)
		If GetAreaVanquished() = False Then AggroMoveTo(7332.76, -10819.01)
		If GetAreaVanquished() = False Then AggroMoveTo(3761.59, -12137.82)
		If GetAreaVanquished() = False Then AggroMoveTo(1189.53, -13030.74)
		If GetAreaVanquished() = False Then AggroMoveTo(1972.12, -11507.83)
		If GetAreaVanquished() = False Then AggroMoveTo(-2196.06, -10991.77)
		If GetAreaVanquished() = False Then AggroMoveTo(-5760.25, -8904.54)
		If GetAreaVanquished() = False Then AggroMoveTo(-8896.22, -10049.12)
EndFunc
