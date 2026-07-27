#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutGandaraTheMoonFortress()
        Local $aGoOutRoute[3][2] = [ [3860, -1719] _
                , [2706, -4708] _
                , [2580, -4950] _
                ]

        _Vanquisher_RunPathfinderPortalRoute($aGoOutRoute, $vqrange, "GandaraTheMoonFortress exit ")
EndFunc

Func VQGandaraTheMoonFortress()
    If GetMapID() <> $GandaraTheMoonFortress_Map And GetMapID() <> $GandaraTheMoonFortress_Outpost  Then TravelTo($GandaraTheMoonFortress_Outpost)   
    If GetMapID() = $GandaraTheMoonFortress_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $GandaraTheMoonFortress_Map Then    
		


				
		GoNearestNPCToCoords(6818, 15641)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		If GetAreaVanquished() = False Then AggroMoveTo(5425, 16446)
		If GetAreaVanquished() = False Then AggroMoveTo(3246, 13158)
		If GetAreaVanquished() = False Then AggroMoveTo(-2989, 14295)
		If GetAreaVanquished() = False Then AggroMoveTo(-4304, 11465)
		If GetAreaVanquished() = False Then AggroMoveTo(-1938, 11165)
		If GetAreaVanquished() = False Then AggroMoveTo(-2396, 14301)
		If GetAreaVanquished() = False Then AggroMoveTo(-6098, 15735)
		
		GoNearestNPCToCoords(-7412, 14230)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)
		If GetAreaVanquished() = False Then AggroMoveTo(-10125, 14233)
		If GetAreaVanquished() = False Then AggroMoveTo(-10210, 9811)
		If GetAreaVanquished() = False Then AggroMoveTo(-12946, 12759)
		If GetAreaVanquished() = False Then AggroMoveTo(-18180, 12670)
		If GetAreaVanquished() = False Then AggroMoveTo(-23168, 14844)
		If GetAreaVanquished() = False Then AggroMoveTo(-25047, 14113)
		If GetAreaVanquished() = False Then AggroMoveTo(-23478, 10876)
		If GetAreaVanquished() = False Then AggroMoveTo(-24154, 8734)
		If GetAreaVanquished() = False Then AggroMoveTo(-23050, 4721)
		If GetAreaVanquished() = False Then AggroMoveTo(-24672, 3577)
		If GetAreaVanquished() = False Then AggroMoveTo(-24585, 3991)
		If GetAreaVanquished() = False Then AggroMoveTo(-19619, 5662)
		If GetAreaVanquished() = False Then AggroMoveTo(-22286, 9017)
		If GetAreaVanquished() = False Then AggroMoveTo(-21070, 10317)
		If GetAreaVanquished() = False Then AggroMoveTo(-18532, 12319)
		If GetAreaVanquished() = False Then AggroMoveTo(-19967, 8553)
		If GetAreaVanquished() = False Then AggroMoveTo(-15516, 9981)
		If GetAreaVanquished() = False Then AggroMoveTo(-12782, 12508)
		If GetAreaVanquished() = False Then AggroMoveTo(-11391, 10947)
		If GetAreaVanquished() = False Then AggroMoveTo(-10171, 9954)
		If GetAreaVanquished() = False Then AggroMoveTo(-10155, 12817)
		If GetAreaVanquished() = False Then AggroMoveTo(-5469, 12312)
		If GetAreaVanquished() = False Then AggroMoveTo(-2614, 14338)
		If GetAreaVanquished() = False Then AggroMoveTo(3843, 12063)
		If GetAreaVanquished() = False Then AggroMoveTo(6063, 10744)
		If GetAreaVanquished() = False Then AggroMoveTo(9786, 11064)
		If GetAreaVanquished() = False Then AggroMoveTo(11645, 10250)
		If GetAreaVanquished() = False Then AggroMoveTo(12199, 7117)
		If GetAreaVanquished() = False Then AggroMoveTo(15633, 9747)
		If GetAreaVanquished() = False Then AggroMoveTo(14905, 13634)
		If GetAreaVanquished() = False Then AggroMoveTo(19445, 9837)
		If GetAreaVanquished() = False Then AggroMoveTo(22045, 9376)
		If GetAreaVanquished() = False Then AggroMoveTo(21646, 6598)
		If GetAreaVanquished() = False Then AggroMoveTo(22185, 4098)
		If GetAreaVanquished() = False Then AggroMoveTo(21294, 3045)
		If GetAreaVanquished() = False Then AggroMoveTo(18447, 6224)
		
		If GetAreaVanquished() = False Then AggroMoveTo(18447, 6224)
		If GetAreaVanquished() = False Then AggroMoveTo(21294, 3045)
		If GetAreaVanquished() = False Then AggroMoveTo(22185, 4098)
		If GetAreaVanquished() = False Then AggroMoveTo(21646, 6598)
		If GetAreaVanquished() = False Then AggroMoveTo(22045, 9376)
		If GetAreaVanquished() = False Then AggroMoveTo(19445, 9837)
		If GetAreaVanquished() = False Then AggroMoveTo(14905, 13634)
		If GetAreaVanquished() = False Then AggroMoveTo(15633, 9747)
		If GetAreaVanquished() = False Then AggroMoveTo(12199, 7117)
		If GetAreaVanquished() = False Then AggroMoveTo(11645, 10250)
		If GetAreaVanquished() = False Then AggroMoveTo(9786, 11064)
		If GetAreaVanquished() = False Then AggroMoveTo(6063, 10744)
		If GetAreaVanquished() = False Then AggroMoveTo(3843, 12063)
		If GetAreaVanquished() = False Then AggroMoveTo(-2614, 14338)
		If GetAreaVanquished() = False Then AggroMoveTo(-5469, 12312)
		If GetAreaVanquished() = False Then AggroMoveTo(-10155, 12817)
		If GetAreaVanquished() = False Then AggroMoveTo(-10171, 9954)
		If GetAreaVanquished() = False Then AggroMoveTo(-11391, 10947)
		If GetAreaVanquished() = False Then AggroMoveTo(-12782, 12508)
		If GetAreaVanquished() = False Then AggroMoveTo(-15516, 9981)
		If GetAreaVanquished() = False Then AggroMoveTo(-19967, 8553)
		If GetAreaVanquished() = False Then AggroMoveTo(-18532, 12319)
		If GetAreaVanquished() = False Then AggroMoveTo(-21070, 10317)
		If GetAreaVanquished() = False Then AggroMoveTo(-22286, 9017)
		If GetAreaVanquished() = False Then AggroMoveTo(-19619, 5662)
		If GetAreaVanquished() = False Then AggroMoveTo(-24585, 3991)
		If GetAreaVanquished() = False Then AggroMoveTo(-24672, 3577)
		If GetAreaVanquished() = False Then AggroMoveTo(-23050, 4721)
		If GetAreaVanquished() = False Then AggroMoveTo(-24154, 8734)
		If GetAreaVanquished() = False Then AggroMoveTo(-23478, 10876)
		If GetAreaVanquished() = False Then AggroMoveTo(-25047, 14113)
		If GetAreaVanquished() = False Then AggroMoveTo(-23168, 14844)
		If GetAreaVanquished() = False Then AggroMoveTo(-18180, 12670)
		If GetAreaVanquished() = False Then AggroMoveTo(-12946, 12759)
		If GetAreaVanquished() = False Then AggroMoveTo(-10210, 9811)
		If GetAreaVanquished() = False Then AggroMoveTo(-10125, 14233)
		If GetAreaVanquished() = False Then AggroMoveTo(-6098, 15735)
		If GetAreaVanquished() = False Then AggroMoveTo(-2396, 14301)
		If GetAreaVanquished() = False Then AggroMoveTo(-1938, 11165)
		If GetAreaVanquished() = False Then AggroMoveTo(-4304, 11465)
		If GetAreaVanquished() = False Then AggroMoveTo(-2989, 14295)
		If GetAreaVanquished() = False Then AggroMoveTo(3246, 13158)
		If GetAreaVanquished() = False Then AggroMoveTo(5425, 16446)
		
    EndIf
EndFunc