#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutIceCliffChasms()
	; Outpost exit not yet mapped - placeholder coords
	MoveTo(1683, -1594)
	Move(4600, -27863)
	WaitForLoad()
EndFunc

Func VQIceCliffChasms()
    If GetMapID() <> $IceCliffChasms_Map And GetMapID() <> $IceCliffChasms_Outpost  Then TravelTo($IceCliffChasms_Outpost)   
    If  GetMapID() = $IceCliffChasms_Outpost then
        GoOut() 
      
    EndIf
	
	
	If GetMapID() = $IceCliffChasms_Map Then	

	

	
		
		Local $aWaypointsA[18][4] = [ [4136.04, -23193.46, " ", $vqrange] _
  , [474.34, -20642.43, " ", $vqrange] _
  , [-1255.37, -19287.97, "start near wurms", $vqrange] _
  , [-2717.70, -18938.59, " ", $vqrange] _
  , [-3874.73, -17697.29, "wurm 1+2", $vqrange] _
  , [-5332.80, -16459.49, "wurm 3+4", $vqrange] _
  , [-5404.68, -14567.80, "wurm 5,6,7", $vqrange] _
  , [-3328.65, -16642.77, "wurm 8,9,10", $vqrange] _
  , [-2578.09, -17220.71, "wurm end corner", $vqrange] _
  , [-3437.01, -18041.76, "restart wurms?", $vqrange] _
  , [-5544.20, -16346.28, "start leaving wurms", $vqrange] _
  , [-5707.10, -12929.26, "wurm popups", $vqrange] _
  , [-4613.20, -10833.91, " ", $vqrange] _
  , [-2622.51, -12465.68, " ", $vqrange] _
  , [-295.49, -13491.31, " ", $vqrange] _
  , [-1122.14, -14560.02, "popping aloes in nook", $vqrange] _
  , [2015.50, -14634.72, " ", $vqrange] _
  , [2612.05, -15526.33, "Nidbjorg (Norn 2)", $vqrange] ]	;NORN2
  
		Local $aWaypointsB[17][4] = [ [2401.00, -15537.00, " ", $vqrange] _
  , [2401.00, -15537.00, "avalanch +pines", $vqrange] _
  , [5447.10, -15650.64, " ", $vqrange] _
  , [5052.07, -17236.13, " ", $vqrange] _
  , [6279.75, -18560.21, " ", $vqrange] _
  , [7661.03, -18708.12, " ", $vqrange] _
  , [8216.14, -17246.21, " ", $vqrange] _
  , [7972.69, -15820.92, "popping aloes", $vqrange] _
  , [7912.98, -14481.34, " ", $vqrange] _
  , [9944.45, -14436.95, " ", $vqrange] _
  , [10181.94, -13075.00, " ", $vqrange] _
  , [9262.10, -12299.08, " ", $vqrange] _
  , [8077.41, -12856.18, " ", $vqrange] _
  , [7564.48, -13160.68, " ", $vqrange] _
  , [5914.20, -12977.88, " ", $vqrange] _
  , [8336.71, -12286.18, "intersection bottom right", $vqrange] _
  , [7050.52, -9481.91, "Skjaldulf (Norn 3)", $vqrange] ]	;NORN3
  

		Local $aWaypointsC[7][4] = [ [4896.34, -8376.27, " ", $vqrange] _
  , [2989.33, -6832.79, " ", $vqrange] _
  , [380.78, -6642.69, " ", $vqrange] _
  , [-1179.89, -4864.52, " ", $vqrange] _
  , [-2831.52, -4769.40, " ", $vqrange] _
  , [-4189.59, -2896.17, " ", $vqrange] _
  , [-7572.17, -2257.74, "Ragnvald (Norn 4)", $vqrange] ]	;NORN4
  
  
  
		Local $aWaypointsD[25][4] = [ [-4646.91, -2799.28, " ", $vqrange] _
  , [-4341.05, -1277.51, "on the ice", $vqrange] _
  , [-1565.69, -1396.72, "on ice 2", $vqrange] _
  , [-1033.00, -2912.24, "off ice", $vqrange] _
  , [1826.31, -4418.21, " ", $vqrange] _
  , [7952.08, -6495.84, "mandragor toxic 1", $vqrange] _
  , [10642.37, -5763.21, "mandragor toxic 2", $vqrange] _
  , [10805.18, -4411.31, " ", $vqrange] _
  , [10031.70, -3460.72, " ", $vqrange] _
  , [9337.92, -1493.75, "mand grp 2 toxic", $vqrange] _
  , [8581.96, 1461.29, "mand grp 2 toxic 2", $vqrange] _
  , [7994.66, 22.80, "mand toxic 3", $vqrange] _
  , [6959.37, -968.57, "lake loop start", $vqrange] _
  , [7834.35, -2699.01, " ", $vqrange] _
  , [6954.48, -3347.91, " ", $vqrange] _
  , [5142.29, -2647.72, " ", $vqrange] _
  , [2930.42, -2601.82, "wisp hopefully dead", $vqrange] _
  , [4545.52, 446.10, " ", $vqrange] _
  , [2784.26, 1319.82, "near first imps", $vqrange] _
  , [2330.52, 3883.51, " ", $vqrange] _
  , [1916.04, 5052.89, "near imp as well", $vqrange] _
  , [1469.35, 6085.98, "defo on 1st imps", $vqrange] _
  , [2123.45, 5474.12, "back on land", $vqrange] _
  , [3276.02, 5522.12, " ", $vqrange] _
  , [3777.12, 5122.87, "Ogg the Gruff (Norn 5)", $vqrange] ]	;NORN5
  
  
		Local $aWaypointsE[7][4] = [ [6052.25, 4163.34, " ", $vqrange] _
  , [6849.05, 5672.93, "near boss 'johon oxflinger'", $vqrange] _
  , [7219.92, 7247.22, " ", $vqrange] _
  , [8878.50, 7123.58, "corner for same boss", $vqrange] _
  , [8269.11, 9446.60, " ", $vqrange] _
  , [7088.65, 13250.86, "stonewolf intersection", $vqrange] _
  , [5388.23, 12130.31, "Oronoloff (Norn 6)", $vqrange] ]	;NORN6
  
  
		Local $aWaypointsF[13][4] = [ [6592.87, 13491.65, "north-east wall", $vqrange] _
  , [5389.00, 11922.00, "SAFE BEFORE frozen elementals", $vqrange] _
  , [8622.65, 17883.54, "eles grp 1", $vqrange] _
  , [7314.08, 17933.38, "ele grp 1 -- 2", $vqrange] _
  , [8821.37, 17377.35, "ele grp 2", $vqrange] _
  , [8820.64, 20033.08, "ele grp 2 -- 2", $vqrange] _
  , [8543.06, 19784.50, "boss loop 1", $vqrange] _
  , [6363.84, 18927.49, "boss loop 2", $vqrange] _
  , [5761.64, 19687.38, "boss 3", $vqrange] _
  , [5333.17, 21668.80, "boss 4", $vqrange] _
  , [6521.10, 22583.36, "mid", $vqrange] _
  , [8652.28, 21871.42, "mid 2 // ele grp", $vqrange] _
  , [10374.67, 25167.26, "Maddi (Norn 7)", $vqrange] ]		;NORN7
  
  
		Local $aWaypointsG[8][4] = [ [7977.23, 25507.59, " ", $vqrange] _
  , [6637.78, 25612.98, " ", $vqrange] _
  , [4928.06, 24781.25, " ", $vqrange] _
  , [3993.13, 25167.84, " ", $vqrange] _
  , [4045.20, 23250.48, "big run", $vqrange] _
  , [1964.18, 21994.99, " ", $vqrange] _
  , [-927.41, 22625.92, " ", $vqrange] _
  , [-2357.00, 23514.85, "Kettibiron (Norn 8)", $vqrange] ]	;NORN8
  
  
		Local $aWaypointsH[23][4] = [ [-4355.10, 22017.66, " ", $vqrange] _
  , [-7547.75, 23198.58, " ", $vqrange] _
  , [-7154.89, 20604.69, " ", $vqrange] _
  , [-8669.14, 18779.96, " ", $vqrange] _
  , [-8167.01, 16009.29, " ", $vqrange] _
  , [-7982.62, 14295.89, " ", $vqrange] _
  , [-6033.09, 12781.29, "start of lane", $vqrange] _
  , [-4923.30, 11005.42, "safef lane at imps", $vqrange] _
  , [-4148.23, 10203.29, " ", $vqrange] _
  , [-2241.12, 9104.62, " ", $vqrange] _
  , [515.00, 8537.51, " ", $vqrange] _
  , [313.96, 10590.12, " ", $vqrange] _
  , [1084.61, 11980.50, " ", $vqrange] _
  , [2459.76, 11395.19, " ", $vqrange] _
  , [4284.47, 11619.70, "far side of 'ornoloff' again", $vqrange] _
  , [1253.75, 11887.98, " ", $vqrange] _
  , [1049.70, 15803.87, " ", $vqrange] _
  , [786.73, 18729.12, " ", $vqrange] _
  , [2419.93, 18524.79, " ", $vqrange] _
  , [-239.48, 21166.25, " ", $vqrange] _
  , [-2470.46, 20826.73, " ", $vqrange] _
  , [-5654.72, 19905.93, " ", $vqrange] _
  , [-4604.51, 17773.60, "end?", $vqrange]	]




		GoNearestNPCToCoords(2879.37, -24541.61)	
		Sleep(300)
		Dialog(0x84)
		Sleep(300)		
		;Sleep(1000)
		;Dialog(0x84)
		MoveandAggroVQ($aWaypointsA)

		GoNearestNPCToCoords(2612.05, -15526.33)	;;; NORN 2 -- too little kills for dialogue
		;Sleep(1000)
		;Dialog(0x84)
		;Sleep(1000)
		;Dialog(0x84)
		MoveandAggroVQ($aWaypointsB)
		
		GoNearestNPCToCoords(7050.52, -9481.91)	  ;;;NORN 3
		Sleep(300)
		MoveandAggroVQ($aWaypointsC)		

		GoNearestNPCToCoords(-7659.00, -2221.00)	;;;NORN 4	annoying one
		Sleep(300)		
		MoveandAggroVQ($aWaypointsD)
		
		GoNearestNPCToCoords(3777.12, 5122.87)	;NORN5
		Sleep(300)		
		MoveandAggroVQ($aWaypointsE)		
		
		GoNearestNPCToCoords(5388.23, 12130.31)		;NORN6
		Sleep(300)		
		MoveandAggroVQ($aWaypointsF)	

		GoNearestNPCToCoords(10374.67, 25167.26)		;NORN7
		Sleep(300)		
		MoveandAggroVQ($aWaypointsG)	

		GoNearestNPCToCoords(-2357.00, 23514.85)		;NORN8
		Sleep(300)		
		MoveandAggroVQ($aWaypointsH)		 	
		
		

		MoveAndAggroVQReverse($aWaypoints)
        
    EndIf
EndFunc


