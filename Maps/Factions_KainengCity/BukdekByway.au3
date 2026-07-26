#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutBukdekByway()
	MoveTo(16567.48, 19462.11)
	Move(16579.60, 19735.57)
	WaitForLoad()
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

	Local $aWaypoints[33][4] = [ [-8896.22, -10049.12, " ", $vqrange] _
	, [-5760.25, -8904.54, " ", $vqrange] _
	, [-2196.06, -10991.77, " ", $vqrange] _
	, [1972.12, -11507.83, " ", $vqrange] _
	, [1189.53, -13030.74, " ", $vqrange] _
	, [3761.59, -12137.82, " ", $vqrange] _
	, [7332.76, -10819.01, " ", $vqrange] _
	, [7343.43, -7689.41, " ", $vqrange] _
	, [11197.10, -7148.19, " ", $vqrange] _
	, [9985.19, -4767.78, " ", $vqrange] _
	, [4520.97, -5838.42, " ", $vqrange] _
	, [2200.79, -8489.97, " ", $vqrange] _
	, [-2861.21, -7832.67, " ", $vqrange] _
	, [-2648.72, -3517.54, " ", $vqrange] _
	, [-977.90, 1102.80, " ", $vqrange] _
	, [-1759.91, 6427.01, " ", $vqrange] _
	, [-977.90, 1102.80, " ", $vqrange] _
	, [-889.41, -2481.91, " ", $vqrange] _
	, [3705.52, -2560.01, " ", $vqrange] _
	, [6971.71, -2678.50, " ", $vqrange] _
	, [11266.22, -2012.58, " ", $vqrange] _
	, [11821.58, 3703.98, " ", $vqrange] _
	, [11193.93, -1980.77, " ", $vqrange] _
	, [6844.04, -2767.20, " ", $vqrange] _
	, [3307.58, -367.18, " ", $vqrange] _
	, [5397.99, 4369.76, " ", $vqrange] _
	, [8012.89, 5940.32, " ", $vqrange] _
	, [5379.86, 10230.64, " ", $vqrange] _
	, [4585.13, 14354.05, " ", $vqrange] _
	, [-5403.12, 13382.99, " ", $vqrange] _
	, [3597.17, 16815.80, " ", $vqrange] _
	, [-1308.34, 16657.90, " ", $vqrange] _
	, [-9369.35, 11527.43, " ", $vqrange] ]

		MoveandAggroVQFullRoute($aWaypoints)
EndFunc
