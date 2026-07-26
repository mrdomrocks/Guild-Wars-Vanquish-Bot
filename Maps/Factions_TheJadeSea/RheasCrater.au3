#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutRheasCrater()
	MoveTo(-2623, 6965)
	MoveTo(-5921, 6290)
	Move(-6600, 7700)
	WaitForLoad()
EndFunc

Func VQRheasCrater()
    If GetMapID() <> $RheasCrater_Map And GetMapID() <> $RheasCrater_Outpost  Then TravelTo($RheasCrater_Outpost)   
    If GetMapID() = $RheasCrater_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $RheasCrater_Map Then    

		Local $aWaypoints[55][4] = [ [9276.84 ,-146.666, " ", $vqrange] _
		, [5562.26 ,-288.208, " ", $vqrange] _
		, [4556.35 ,-4096.02, " ", $vqrange] _
		, [306.347 ,-5937.1, " ", $vqrange] _
		, [-3484.37 ,-8150.37, " ", $vqrange] _
		, [-4557.55 ,-8666.07, " ", $vqrange] _
		, [-425.173 ,-14053, " ", $vqrange] _
		, [-1383.02 ,-15789.1, " ", $vqrange] _
		, [-2154.43 ,-20002.6, " ", $vqrange] _
		, [-3424.24 ,-21333.8, " ", $vqrange] _
		, [-5469.5 ,-20771, " ", $vqrange] _
		, [-7448.21 ,-19688.9, " ", $vqrange] _
		, [-5363.94 ,-16287, " ", $vqrange] _
		, [-934.042 ,-15230.1, " ", $vqrange] _
		, [-3273.12 ,-11046.1, " ", $vqrange] _
		, [-4027.76 ,-8221.54, " ", $vqrange] _
		, [-1951.26 ,-5433.72, " ", $vqrange] _
		, [-4916.27 ,-6151.88, " ", $vqrange] _
		, [-8215.52 ,-6096.98, " ", $vqrange] _
		, [-9153.58 ,-4379.1, " ", $vqrange] _
		, [-5437.41 ,-1526.09, " ", $vqrange] _
		, [-2119.17 ,27.0328, " ", $vqrange] _
		, [-1424.57 ,1901.38, " ", $vqrange] _
		, [-938.662 ,3007.36, " ", $vqrange] _
		, [-6537.21 ,1217.08, " ", $vqrange] _
		, [-10987.4 ,1247.8, " ", $vqrange] _
		, [-5405.36 ,1637.54, " ", $vqrange] _
		, [-1368.68 ,5168.46, " ", $vqrange] _
		, [-6986.54 ,5813.08, " ", $vqrange] _
		, [-7027.2 ,8961.95, " ", $vqrange] _
		, [-6180.07 ,9780.34, " ", $vqrange] _
		, [-7681.74 ,11731.2, " ", $vqrange] _
		, [-5546.41 ,14025.9, " ", $vqrange] _
		, [-8787.49 ,13095.9, " ", $vqrange] _
		, [-6105.38 ,16559.6, " ", $vqrange] _
		, [-5237.21 ,18009.7, " ", $vqrange] _
		, [-5101.56 ,19512.3, " ", $vqrange] _
		, [-6350.05 ,13162.1, " ", $vqrange] _
		, [-3297.61 ,13912.8, " ", $vqrange] _
		, [-1314.84 ,13675.9, " ", $vqrange] _
		, [-798.852 ,17484.8, " ", $vqrange] _
		, [3514.59 ,16878.6, " ", $vqrange] _
		, [3419.21 ,13819.4, " ", $vqrange] _
		, [6466.54 ,17663.9, " ", $vqrange] _
		, [8104.69 ,15435.2, " ", $vqrange] _
		, [12643.2 ,15124.2, " ", $vqrange] _
		, [16101.6 ,13757.3, " ", $vqrange] _
		, [13903.5 ,10192.1, " ", $vqrange] _
		, [11839.3 ,7887.86, " ", $vqrange] _
		, [11244 ,4863.2, " ", $vqrange] _
		, [16244.4 ,2446.19, " ", $vqrange] _
		, [10805.1 ,5354.5, " ", $vqrange] _
		, [5637.39 ,7565.61, " ", $vqrange] _
		, [6796.92 ,10844.8, " ", $vqrange] _
		, [8533.8 ,13615.6, " ", $vqrange] ]
		
		GoNearestNPCToCoords(13468.1 ,-1340.95)
	If GetKurzickFaction() > GetLuxonFaction() Then
                Dialog(0x81)
                Sleep(1000)
                Dialog(0x2)
                Sleep(1000)
                Dialog(0x84)
	        Sleep(1000)
	        Dialog(0x86)
	        Sleep(1000)
        Else
                Dialog(0x85)
                Sleep(1000)
                Dialog(0x86)
                Sleep(1000)
        EndIf

		MoveandAggroVQ($aWaypoints)
      		MoveAndAggroVQReverse($aWaypoints)
		
    EndIf
EndFunc