#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTahnnakiTemple()
	MoveTo(2742.42, -16465.20)
	Move(2741.71, -16025.93)
	WaitForLoad()
EndFunc

Func VQTahnnakiTemple()
    If GetMapID() <> $TahnnakiTemple_Map And GetMapID() <> $TahnnakiTemple_Outpost  Then TravelTo($TahnnakiTemple_Outpost)   
    If GetMapID() = $TahnnakiTemple_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $TahnnakiTemple_Map Then
   
                 Local $aWaypoints[60][4] = [ [2884.8601, -12387.9805, " ", $vqrange] _
                 , [70.9527, -10567.6763, " ", $vqrange] _
                 , [1048.4688, -7873.5464, " ", $vqrange] _
                 , [227.3100, -7360.8901, " ", $vqrange] _
                 , [-310.5171, -6872.1884, " ", $vqrange] _
                 , [690.8410, -5918.5141, " ", $vqrange] _
                 , [523.9480, -5393.9932, " ", $vqrange] _
                 , [2259.0901, -3369.3501, " ", $vqrange] _
                 , [1286.8874, -2532.9702, " ", $vqrange] _
                 , [2073.6687, -1483.9285, " ", $vqrange] _
                 , [1453.7804, -577.9379, " ", $vqrange] _
                 , [3051.1849, 733.3643, " ", $vqrange] _
                 , [3171.2700, 2108.6899, " ", $vqrange] _
                 , [3623.3895, 2330.7688, " ", $vqrange] _
                 , [3623.3895, 3332.1268, " ", $vqrange] _
                 , [5626.1056, 3689.7547, " ", $vqrange] _
                 , [5448.6401, 6261.9600, " ", $vqrange] _
                 , [7604.9798, 6431.5683, " ", $vqrange] _
                 , [7727.5400, 7918.9702, " ", $vqrange] _
                 , [7795.7146, 11104.5725, " ", $vqrange] _
                 , [6018.5000, 12309.8701, " ", $vqrange] _
                 , [2701.7200, 15909.7998, " ", $vqrange] _
                 , [35.8900, 15392.5195, " ", $vqrange] _
                 , [1596.8316, 15253.0558, " ", $vqrange] _
                 , [3337.2872, 15801.4185, " ", $vqrange] _
                 , [3262.7300, 17048.2402, " ", $vqrange] _
                 , [2288.2455, 18519.3903, " ", $vqrange] _
                 , [-496.6900, 18513.7598, " ", $vqrange] _
                 , [-5882.7202, 18474.6992, " ", $vqrange] _
                 , [-3350.7200, 19307.3906, " ", $vqrange] _
                 , [-4000.2800, 20523.4902, " ", $vqrange] _
                 , [-6150.1299, 15909.2197, " ", $vqrange] _
                 , [-3010.3000, 14238.1201, " ", $vqrange] _
                 , [-2055.8101, 9994.2500, " ", $vqrange] _
                 , [-1183.5200, 6956.7402, " ", $vqrange] _
                 , [-795.1800, 2365.0000, " ", $vqrange] _
                 , [-1684.9700, 491.5700, " ", $vqrange] _
                 , [-3603.4099, 1782.8800, " ", $vqrange] _
                 , [-1182.6500, 2540.3301, " ", $vqrange] _
                 , [-1301.9500, 7008.4800, " ", $vqrange] _
                 , [-4043.4900, 11365.5703, " ", $vqrange] _
                 , [-5954.3701, 16051.8604, " ", $vqrange] _
                 , [-4059.5701, 20010.9199, " ", $vqrange] _
                 , [-3350.7200, 19307.3906, " ", $vqrange] _
                 , [-5730.4800, 18567.4297, " ", $vqrange] _
                 , [-45.4300, 17957.7305, " ", $vqrange] _
                 , [-454.9900, 12625.0098, " ", $vqrange] _
                 , [994.9100, 11490.0000, " ", $vqrange] _
                 , [2622.0400, 11361.7500, " ", $vqrange] _
                 , [2563.0300, 10063.2695, " ", $vqrange] _
                 , [528.6200, 6662.0298, " ", $vqrange] _
                 , [4637.2598, 6492.8301, " ", $vqrange] _
                 , [644.6000, 6116.3501, " ", $vqrange] _
                 , [-4203.8701, 6541.9702, " ", $vqrange] _
                 , [-6157.4102, 9375.2100, " ", $vqrange] _
                 , [-7327.6001, 10265.1699, " ", $vqrange] _
                 , [-8954.8896, 10217.4297, " ", $vqrange] _
                 , [-7033.7100, 6410.4702, " ", $vqrange] _
                 , [-7398.6299, 1914.1500, " ", $vqrange] _
                 , [-10296.2100, -2138.4399, " ", $vqrange] ]

		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc
