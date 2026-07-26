#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutPanjiangPeninsula()
	MoveTo(-11001, -16229)
	Move(-11501, -17229)
	WaitForLoad()
EndFunc

Func VQPanjiangPeninsula()
    If GetMapID() <> $PanjiangPeninsula_Map And GetMapID() <> $PanjiangPeninsula_Outpost  Then TravelTo($PanjiangPeninsula_Outpost)   
    If GetMapID() = $PanjiangPeninsula_Outpost then
       GoOut() 
      
    EndIf

	If GetMapID() = $PanjiangPeninsula_Map Then    

		Local $aWaypoints[89][4] = [ [11185, 13046, " ", $vqrange] _		
		, [11039, 10853, " ", $vqrange] _
		, [13984, 9460, " ", $vqrange] _
		, [16569, 11304, " ", $vqrange] _
		, [22218, 9765, " ", $vqrange] _
		, [22020, 5769, " ", $vqrange] _
		, [18144, 2630, " ", $vqrange] _
		, [17741, 698, " ", $vqrange] _
		, [18499, -247, " ", $vqrange] _
		, [14823, 2590, " ", $vqrange] _
		, [9480, 1769, " ", $vqrange] _
		, [6054, -2878, " ", $vqrange] _
		, [3935, -3991, " ", $vqrange] _
		, [8483, -6587, " ", $vqrange] _
		, [9418, -8404, " ", $vqrange] _
		, [7237, -9536, " ", $vqrange] _
		, [7094, -9880, " ", $vqrange] _
		, [7613, -13223, " ", $vqrange] _
		, [11161, -13923, " ", $vqrange] _
		, [12723, -11378, " ", $vqrange] _
		, [10876, -13941, " ", $vqrange] _
		, [4901, -12553, " ", $vqrange] _
		, [1968, -8748, " ", $vqrange] _
		, [-803, -8965, " ", $vqrange] _
		, [-4497, -9253, " ", $vqrange] _
		, [-4698, -7570, " ", $vqrange] _
		, [-2625, -7054, " ", $vqrange] _
		, [-2641, -5360, " ", $vqrange] _
		, [-6374, -6395, " ", $vqrange] _
		, [-7611, -6740, " ", $vqrange] _
		, [-9731, -7071, " ", $vqrange] _
		, [-9591, -9301, " ", $vqrange] _
		, [-11530, -9203, " ", $vqrange] _
		, [-12125, -11158, " ", $vqrange] _
		, [-13314, -11228, " ", $vqrange] _
		, [-13178, -12881, " ", $vqrange] _
		, [-15008, -11431, " ", $vqrange] _
		, [-16181, -10661, " ", $vqrange] _
		, [-15712, -8713, " ", $vqrange] _
		, [-14522, -7077, " ", $vqrange] _
		, [-11812, -8684, " ", $vqrange] _
		, [-14301, -6094, " ", $vqrange] _
		, [-14481, -3884, " ", $vqrange] _
		, [-15521, -1532, " ", $vqrange] _
		, [-17003, -722, " ", $vqrange] _
		, [-19347, -1600, " ", $vqrange] _
		, [-17338, 622, " ", $vqrange] _
		, [-12958, -76, " ", $vqrange] _
		, [-11255, -2934, " ", $vqrange] _
		, [-10415, -4429, " ", $vqrange] _
		, [-8959, -4035, " ", $vqrange] _
		, [-10248, -6343, " ", $vqrange] _
		, [-12599, -129, " ", $vqrange] _
		, [-17551, 393, " ", $vqrange] _
		, [-19193, 2794, " ", $vqrange] _
		, [-21101, 744, " ", $vqrange] _
		, [-22527, -3144, " ", $vqrange] _
		, [-21625, 65, " ", $vqrange] _
		, [-23365, 494, " ", $vqrange] _
		, [-23224, 1688, " ", $vqrange] _
		, [-23963, 4549, " ", $vqrange] _
		, [-24131, 6516, " ", $vqrange] _
		, [-23720, 8409, " ", $vqrange] _
		, [-20237, 10009, " ", $vqrange] _
		, [-18855, 10657, " ", $vqrange] _
		, [-20246, 13386, " ", $vqrange] _
		, [-17146, 11812, " ", $vqrange] _
		, [-14234, 12868, " ", $vqrange] _
		, [-10960, 12725, " ", $vqrange] _
		, [-9436, 9467, " ", $vqrange] _
		, [-13169, 10247, " ", $vqrange] _
		, [-14658, 7090, " ", $vqrange] _
		, [-15431, 3257, " ", $vqrange] _
		, [-17219, 6549, " ", $vqrange] _
		, [-18164, 8852, " ", $vqrange] _
		, [-13425, 9505, " ", $vqrange] _
		, [-7693, 8364, " ", $vqrange] _
		, [-5022, 6821, " ", $vqrange] _
		, [-2383, 6297, " ", $vqrange] _
		, [201, 2005, " ", $vqrange] _
		, [785, 766, " ", $vqrange] _
		, [-327, -2988, " ", $vqrange] _
		, [1431, -4900, " ", $vqrange] _
		, [5510, 874, " ", $vqrange] _
		, [7046, 5061, " ", $vqrange] _
		, [4000, 4682, " ", $vqrange] _
		, [-316, 7902, " ", $vqrange] _
		, [-1545, 6557, " ", $vqrange] _
		, [2981, 4278, " ", $vqrange] ]
		MoveandAggroVQFullRoute($aWaypoints)
    EndIf
EndFunc
