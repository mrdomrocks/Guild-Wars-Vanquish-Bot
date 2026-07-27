#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutIceCliffChasms()
        Local $aGoOutRoute[2][2] = [ [1683, -1594] _
                , [4600, -27863] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "IceCliffChasms exit ")
EndFunc

Func VQIceCliffChasms()
    If GetMapID() <> $IceCliffChasms_Map And GetMapID() <> $IceCliffChasms_Outpost  Then TravelTo($IceCliffChasms_Outpost)   
    If  GetMapID() = $IceCliffChasms_Outpost then
        GoOut() 
      
    EndIf
	
	
	If GetMapID() = $IceCliffChasms_Map Then	

	

	
		
  
  

  
  
  
  
  
  
  
  
  
  
  




		GoNearestNPCToCoords(2879.37, -24541.61)	
		Sleep(300)
		Dialog(0x84)
		Sleep(300)		
		;Sleep(1000)
		;Dialog(0x84)
		If GetAreaVanquished() = False Then AggroMoveTo(4136.04, -23193.46)
		If GetAreaVanquished() = False Then AggroMoveTo(474.34, -20642.43)
		; start near wurms
		If GetAreaVanquished() = False Then AggroMoveTo(-1255.37, -19287.97)
		If GetAreaVanquished() = False Then AggroMoveTo(-2717.70, -18938.59)
		; wurm 1+2
		If GetAreaVanquished() = False Then AggroMoveTo(-3874.73, -17697.29)
		; wurm 3+4
		If GetAreaVanquished() = False Then AggroMoveTo(-5332.80, -16459.49)
		; wurm 5,6,7
		If GetAreaVanquished() = False Then AggroMoveTo(-5404.68, -14567.80)
		; wurm 8,9,10
		If GetAreaVanquished() = False Then AggroMoveTo(-3328.65, -16642.77)
		; wurm end corner
		If GetAreaVanquished() = False Then AggroMoveTo(-2578.09, -17220.71)
		; restart wurms?
		If GetAreaVanquished() = False Then AggroMoveTo(-3437.01, -18041.76)
		; start leaving wurms
		If GetAreaVanquished() = False Then AggroMoveTo(-5544.20, -16346.28)
		; wurm popups
		If GetAreaVanquished() = False Then AggroMoveTo(-5707.10, -12929.26)
		If GetAreaVanquished() = False Then AggroMoveTo(-4613.20, -10833.91)
		If GetAreaVanquished() = False Then AggroMoveTo(-2622.51, -12465.68)
		If GetAreaVanquished() = False Then AggroMoveTo(-295.49, -13491.31)
		; popping aloes in nook
		If GetAreaVanquished() = False Then AggroMoveTo(-1122.14, -14560.02)
		If GetAreaVanquished() = False Then AggroMoveTo(2015.50, -14634.72)
		; Nidbjorg (Norn 2)
		If GetAreaVanquished() = False Then AggroMoveTo(2612.05, -15526.33)

		GoNearestNPCToCoords(2612.05, -15526.33)	;;; NORN 2 -- too little kills for dialogue
		;Sleep(1000)
		;Dialog(0x84)
		;Sleep(1000)
		;Dialog(0x84)
		If GetAreaVanquished() = False Then AggroMoveTo(2401.00, -15537.00)
		; avalanch +pines
		If GetAreaVanquished() = False Then AggroMoveTo(2401.00, -15537.00)
		If GetAreaVanquished() = False Then AggroMoveTo(5447.10, -15650.64)
		If GetAreaVanquished() = False Then AggroMoveTo(5052.07, -17236.13)
		If GetAreaVanquished() = False Then AggroMoveTo(6279.75, -18560.21)
		If GetAreaVanquished() = False Then AggroMoveTo(7661.03, -18708.12)
		If GetAreaVanquished() = False Then AggroMoveTo(8216.14, -17246.21)
		; popping aloes
		If GetAreaVanquished() = False Then AggroMoveTo(7972.69, -15820.92)
		If GetAreaVanquished() = False Then AggroMoveTo(7912.98, -14481.34)
		If GetAreaVanquished() = False Then AggroMoveTo(9944.45, -14436.95)
		If GetAreaVanquished() = False Then AggroMoveTo(10181.94, -13075.00)
		If GetAreaVanquished() = False Then AggroMoveTo(9262.10, -12299.08)
		If GetAreaVanquished() = False Then AggroMoveTo(8077.41, -12856.18)
		If GetAreaVanquished() = False Then AggroMoveTo(7564.48, -13160.68)
		If GetAreaVanquished() = False Then AggroMoveTo(5914.20, -12977.88)
		; intersection bottom right
		If GetAreaVanquished() = False Then AggroMoveTo(8336.71, -12286.18)
		; Skjaldulf (Norn 3)
		If GetAreaVanquished() = False Then AggroMoveTo(7050.52, -9481.91)
		
		GoNearestNPCToCoords(7050.52, -9481.91)	  ;;;NORN 3
		Sleep(300)
		If GetAreaVanquished() = False Then AggroMoveTo(4896.34, -8376.27)
		If GetAreaVanquished() = False Then AggroMoveTo(2989.33, -6832.79)
		If GetAreaVanquished() = False Then AggroMoveTo(380.78, -6642.69)
		If GetAreaVanquished() = False Then AggroMoveTo(-1179.89, -4864.52)
		If GetAreaVanquished() = False Then AggroMoveTo(-2831.52, -4769.40)
		If GetAreaVanquished() = False Then AggroMoveTo(-4189.59, -2896.17)
		; Ragnvald (Norn 4)
		If GetAreaVanquished() = False Then AggroMoveTo(-7572.17, -2257.74)

		GoNearestNPCToCoords(-7659.00, -2221.00)	;;;NORN 4	annoying one
		Sleep(300)		
		If GetAreaVanquished() = False Then AggroMoveTo(-4646.91, -2799.28)
		; on the ice
		If GetAreaVanquished() = False Then AggroMoveTo(-4341.05, -1277.51)
		; on ice 2
		If GetAreaVanquished() = False Then AggroMoveTo(-1565.69, -1396.72)
		; off ice
		If GetAreaVanquished() = False Then AggroMoveTo(-1033.00, -2912.24)
		If GetAreaVanquished() = False Then AggroMoveTo(1826.31, -4418.21)
		; mandragor toxic 1
		If GetAreaVanquished() = False Then AggroMoveTo(7952.08, -6495.84)
		; mandragor toxic 2
		If GetAreaVanquished() = False Then AggroMoveTo(10642.37, -5763.21)
		If GetAreaVanquished() = False Then AggroMoveTo(10805.18, -4411.31)
		If GetAreaVanquished() = False Then AggroMoveTo(10031.70, -3460.72)
		; mand grp 2 toxic
		If GetAreaVanquished() = False Then AggroMoveTo(9337.92, -1493.75)
		; mand grp 2 toxic 2
		If GetAreaVanquished() = False Then AggroMoveTo(8581.96, 1461.29)
		; mand toxic 3
		If GetAreaVanquished() = False Then AggroMoveTo(7994.66, 22.80)
		; lake loop start
		If GetAreaVanquished() = False Then AggroMoveTo(6959.37, -968.57)
		If GetAreaVanquished() = False Then AggroMoveTo(7834.35, -2699.01)
		If GetAreaVanquished() = False Then AggroMoveTo(6954.48, -3347.91)
		If GetAreaVanquished() = False Then AggroMoveTo(5142.29, -2647.72)
		; wisp hopefully dead
		If GetAreaVanquished() = False Then AggroMoveTo(2930.42, -2601.82)
		If GetAreaVanquished() = False Then AggroMoveTo(4545.52, 446.10)
		; near first imps
		If GetAreaVanquished() = False Then AggroMoveTo(2784.26, 1319.82)
		If GetAreaVanquished() = False Then AggroMoveTo(2330.52, 3883.51)
		; near imp as well
		If GetAreaVanquished() = False Then AggroMoveTo(1916.04, 5052.89)
		; defo on 1st imps
		If GetAreaVanquished() = False Then AggroMoveTo(1469.35, 6085.98)
		; back on land
		If GetAreaVanquished() = False Then AggroMoveTo(2123.45, 5474.12)
		If GetAreaVanquished() = False Then AggroMoveTo(3276.02, 5522.12)
		; Ogg the Gruff (Norn 5)
		If GetAreaVanquished() = False Then AggroMoveTo(3777.12, 5122.87)
		
		GoNearestNPCToCoords(3777.12, 5122.87)	;NORN5
		Sleep(300)		
		If GetAreaVanquished() = False Then AggroMoveTo(6052.25, 4163.34)
		; near boss 'johon oxflinger'
		If GetAreaVanquished() = False Then AggroMoveTo(6849.05, 5672.93)
		If GetAreaVanquished() = False Then AggroMoveTo(7219.92, 7247.22)
		; corner for same boss
		If GetAreaVanquished() = False Then AggroMoveTo(8878.50, 7123.58)
		If GetAreaVanquished() = False Then AggroMoveTo(8269.11, 9446.60)
		; stonewolf intersection
		If GetAreaVanquished() = False Then AggroMoveTo(7088.65, 13250.86)
		; Oronoloff (Norn 6)
		If GetAreaVanquished() = False Then AggroMoveTo(5388.23, 12130.31)
		
		GoNearestNPCToCoords(5388.23, 12130.31)		;NORN6
		Sleep(300)		
		; north-east wall
		If GetAreaVanquished() = False Then AggroMoveTo(6592.87, 13491.65)
		; SAFE BEFORE frozen elementals
		If GetAreaVanquished() = False Then AggroMoveTo(5389.00, 11922.00)
		; eles grp 1
		If GetAreaVanquished() = False Then AggroMoveTo(8622.65, 17883.54)
		; ele grp 1 -- 2
		If GetAreaVanquished() = False Then AggroMoveTo(7314.08, 17933.38)
		; ele grp 2
		If GetAreaVanquished() = False Then AggroMoveTo(8821.37, 17377.35)
		; ele grp 2 -- 2
		If GetAreaVanquished() = False Then AggroMoveTo(8820.64, 20033.08)
		; boss loop 1
		If GetAreaVanquished() = False Then AggroMoveTo(8543.06, 19784.50)
		; boss loop 2
		If GetAreaVanquished() = False Then AggroMoveTo(6363.84, 18927.49)
		; boss 3
		If GetAreaVanquished() = False Then AggroMoveTo(5761.64, 19687.38)
		; boss 4
		If GetAreaVanquished() = False Then AggroMoveTo(5333.17, 21668.80)
		; mid
		If GetAreaVanquished() = False Then AggroMoveTo(6521.10, 22583.36)
		; mid 2 // ele grp
		If GetAreaVanquished() = False Then AggroMoveTo(8652.28, 21871.42)
		; Maddi (Norn 7)
		If GetAreaVanquished() = False Then AggroMoveTo(10374.67, 25167.26)

		GoNearestNPCToCoords(10374.67, 25167.26)		;NORN7
		Sleep(300)		
		If GetAreaVanquished() = False Then AggroMoveTo(7977.23, 25507.59)
		If GetAreaVanquished() = False Then AggroMoveTo(6637.78, 25612.98)
		If GetAreaVanquished() = False Then AggroMoveTo(4928.06, 24781.25)
		If GetAreaVanquished() = False Then AggroMoveTo(3993.13, 25167.84)
		; big run
		If GetAreaVanquished() = False Then AggroMoveTo(4045.20, 23250.48)
		If GetAreaVanquished() = False Then AggroMoveTo(1964.18, 21994.99)
		If GetAreaVanquished() = False Then AggroMoveTo(-927.41, 22625.92)
		; Kettibiron (Norn 8)
		If GetAreaVanquished() = False Then AggroMoveTo(-2357.00, 23514.85)

		GoNearestNPCToCoords(-2357.00, 23514.85)		;NORN8
		Sleep(300)		
		If GetAreaVanquished() = False Then AggroMoveTo(-4355.10, 22017.66)
		If GetAreaVanquished() = False Then AggroMoveTo(-7547.75, 23198.58)
		If GetAreaVanquished() = False Then AggroMoveTo(-7154.89, 20604.69)
		If GetAreaVanquished() = False Then AggroMoveTo(-8669.14, 18779.96)
		If GetAreaVanquished() = False Then AggroMoveTo(-8167.01, 16009.29)
		If GetAreaVanquished() = False Then AggroMoveTo(-7982.62, 14295.89)
		; start of lane
		If GetAreaVanquished() = False Then AggroMoveTo(-6033.09, 12781.29)
		; safef lane at imps
		If GetAreaVanquished() = False Then AggroMoveTo(-4923.30, 11005.42)
		If GetAreaVanquished() = False Then AggroMoveTo(-4148.23, 10203.29)
		If GetAreaVanquished() = False Then AggroMoveTo(-2241.12, 9104.62)
		If GetAreaVanquished() = False Then AggroMoveTo(515.00, 8537.51)
		If GetAreaVanquished() = False Then AggroMoveTo(313.96, 10590.12)
		If GetAreaVanquished() = False Then AggroMoveTo(1084.61, 11980.50)
		If GetAreaVanquished() = False Then AggroMoveTo(2459.76, 11395.19)
		; far side of 'ornoloff' again
		If GetAreaVanquished() = False Then AggroMoveTo(4284.47, 11619.70)
		If GetAreaVanquished() = False Then AggroMoveTo(1253.75, 11887.98)
		If GetAreaVanquished() = False Then AggroMoveTo(1049.70, 15803.87)
		If GetAreaVanquished() = False Then AggroMoveTo(786.73, 18729.12)
		If GetAreaVanquished() = False Then AggroMoveTo(2419.93, 18524.79)
		If GetAreaVanquished() = False Then AggroMoveTo(-239.48, 21166.25)
		If GetAreaVanquished() = False Then AggroMoveTo(-2470.46, 20826.73)
		If GetAreaVanquished() = False Then AggroMoveTo(-5654.72, 19905.93)
		; end?
		If GetAreaVanquished() = False Then AggroMoveTo(-4604.51, 17773.60)
    EndIf
EndFunc

