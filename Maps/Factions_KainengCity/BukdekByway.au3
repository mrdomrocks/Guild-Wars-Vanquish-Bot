Global $vqrange = 1450
Global $ActionCounter = 1

Global $aFactions_KainengCity_BukdekBywayRoute01[33][2] = [ _
        [-8896.22, -10049.12], _
        [-5760.25, -8904.54], _
        [-2196.06, -10991.77], _
        [1972.12, -11507.83], _
        [1189.53, -13030.74], _
        [3761.59, -12137.82], _
        [7332.76, -10819.01], _
        [7343.43, -7689.41], _
        [11197.10, -7148.19], _
        [9985.19, -4767.78], _
        [4520.97, -5838.42], _
        [2200.79, -8489.97], _
        [-2861.21, -7832.67], _
        [-2648.72, -3517.54], _
        [-977.90, 1102.80], _
        [-1759.91, 6427.01], _
        [-977.90, 1102.80], _
        [-889.41, -2481.91], _
        [3705.52, -2560.01], _
        [6971.71, -2678.50], _
        [11266.22, -2012.58], _
        [11821.58, 3703.98], _
        [11193.93, -1980.77], _
        [6844.04, -2767.20], _
        [3307.58, -367.18], _
        [5397.99, 4369.76], _
        [8012.89, 5940.32], _
        [5379.86, 10230.64], _
        [4585.13, 14354.05], _
        [-5403.12, 13382.99], _
        [3597.17, 16815.80], _
        [-1308.34, 16657.90], _
        [-9369.35, 11527.43] _
]

Global $aFactions_KainengCity_BukdekBywayRoute02[33][2] = [ _
        [-9369.35, 11527.43], _
        [-1308.34, 16657.90], _
        [3597.17, 16815.80], _
        [-5403.12, 13382.99], _
        [4585.13, 14354.05], _
        [5379.86, 10230.64], _
        [8012.89, 5940.32], _
        [5397.99, 4369.76], _
        [3307.58, -367.18], _
        [6844.04, -2767.20], _
        [11193.93, -1980.77], _
        [11821.58, 3703.98], _
        [11266.22, -2012.58], _
        [6971.71, -2678.50], _
        [3705.52, -2560.01], _
        [-889.41, -2481.91], _
        [-977.90, 1102.80], _
        [-1759.91, 6427.01], _
        [-977.90, 1102.80], _
        [-2648.72, -3517.54], _
        [-2861.21, -7832.67], _
        [2200.79, -8489.97], _
        [4520.97, -5838.42], _
        [9985.19, -4767.78], _
        [11197.10, -7148.19], _
        [7343.43, -7689.41], _
        [7332.76, -10819.01], _
        [3761.59, -12137.82], _
        [1189.53, -13030.74], _
        [1972.12, -11507.83], _
        [-2196.06, -10991.77], _
        [-5760.25, -8904.54], _
        [-8896.22, -10049.12] _
]

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


		_Vanquisher_RunVanquishRoute($aFactions_KainengCity_BukdekBywayRoute01)

		; reverse
		_Vanquisher_RunVanquishRoute($aFactions_KainengCity_BukdekBywayRoute02)
EndFunc
