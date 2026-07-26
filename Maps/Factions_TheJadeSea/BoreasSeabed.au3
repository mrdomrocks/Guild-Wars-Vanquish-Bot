#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutBoreasSeabed()
	MoveTo(3476, 6599)
	Move(3510, 7400)
	WaitForLoad()
EndFunc

Func VQBoreasSeabed()
    If GetMapID() <> $BoreasSeabed_Map And GetMapID() <> $BoreasSeabed_Outpost  Then TravelTo($BoreasSeabed_Outpost)   
    If GetMapID() = $BoreasSeabed_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $BoreasSeabed_Map Then    

		Local $aWaypoints[45][4] = [ [15139 ,-7063, " ", $vqrange] _
		, [18288 ,-9106, " ", $vqrange] _
		, [19930 ,-6525, " ", $vqrange] _
		, [21821 ,-8140, " ", $vqrange] _
		, [19603 ,-5849, " ", $vqrange] _
		, [18616 ,-2516, " ", $vqrange] _
		, [15500 ,-993, " ", $vqrange] _
		, [12532 ,-1995, " ", $vqrange] _
		, [9383 ,-1539, " ", $vqrange] _
		, [7684 ,-1887, " ", $vqrange] _
		, [7961 ,-4050, " ", $vqrange] _
		, [11091 ,-6237, " ", $vqrange] _
		, [7554 ,-7600, " ", $vqrange] _
		, [2925 ,-6527, " ", $vqrange] _
		, [-634 ,-5828, " ", $vqrange] _
		, [-1275 ,-9005, " ", $vqrange] _
		, [-5928 ,-5322, " ", $vqrange] _
		, [-10598 ,-3114, " ", $vqrange] _
		, [-9772 , 1067, " ", $vqrange] _
		, [-9158 , 3230, " ", $vqrange] _
		, [-10241 , 5109, " ", $vqrange] _
		, [-7839 , 4851, " ", $vqrange] _
		, [-10869 ,7276, " ", $vqrange] _
		, [-11256 ,9728, " ", $vqrange] _
		, [-8200 ,9981, " ", $vqrange] _
		, [-3190 ,9801, " ", $vqrange] _
		, [-2424 ,8451, " ", $vqrange] _
		, [-1763 ,3630, " ", $vqrange] _
		, [-4181 ,113, " ", $vqrange] _
		, [1951 ,-984, " ", $vqrange] _
		, [3271 ,957, " ", $vqrange] _
		, [4828 ,5135, " ", $vqrange] _
		, [8367 ,8549, " ", $vqrange] _
		, [10923 ,5254, " ", $vqrange] _
		, [14184 ,4152, " ", $vqrange] _
		, [17822 ,2507, " ", $vqrange] _
		, [14220 ,8099, " ", $vqrange] _
		, [15520 ,10111, " ", $vqrange] _
		, [17418 ,8581, " ", $vqrange] _
		, [18973 ,8433, " ", $vqrange] _
		, [19623 ,8179, " ", $vqrange] _
		, [21803 ,8558, " ", $vqrange] _
		, [22850 , 8471, " ", $vqrange] _
		, [24070 ,8805, " ", $vqrange] _
		, [25243 ,10408, " ", $vqrange] ]

		GoNearestNPCToCoords(13861, -9986)
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