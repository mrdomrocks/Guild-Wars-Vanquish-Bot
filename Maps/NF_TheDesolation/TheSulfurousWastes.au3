#include <Array.au3>
Global $vqrange = 1450
Global $ActionCounter = 1

Func GoOutTheSulfurousWastes()
	MoveTo(903, 345)
	MoveTo(-3659, 3475)
	MoveTo(-4758, 4639)
	Move(-4858, 4639)
	WaitForLoad()
EndFunc

Func VQTheSulfurousWastes()
    If GetMapID() <> $TheSulfurousWastes_Map And GetMapID() <> $TheSulfurousWastes_Outpost  Then TravelTo($TheSulfurousWastes_Outpost)
    If GetMapID() = $TheSulfurousWastes_Outpost then
       GoOut()

    EndIf

	If GetMapID() = $TheSulfurousWastes_Map Then

		Local $aWaypointsA[13][4] = [ [ 25522, -4436, " ", $vqrange] _
		, [ 24325, -2826, " ", $vqrange] _
		, [ 24948, 259, " ", $vqrange] _
		, [ 22699, 2364, " ", $vqrange] _
		, [ 22264, 3884, " ", $vqrange] _
		, [ 21187, 4286, " ", $vqrange] _
		, [ 22449, 324, " ", $vqrange] _
		, [ 20662, -1404, " ", $vqrange] _
		, [ 16996, -1145, " ", $vqrange] _
		, [ 18136, -4457, " ", $vqrange] _
		, [ 15832, -5071, " ", $vqrange] _
		, [ 17250, -8849, " ", $vqrange] _
		, [ 16039, -9571, " ", $vqrange] _
		]

		Local $aWaypoints[13][4] = [ [ 25522, -4436, " ", $vqrange] _
		, [ 24325, -2826, " ", $vqrange] _
		, [ 24948, 259, " ", $vqrange] _
		, [ 22699, 2364, " ", $vqrange] _
		, [ 22264, 3884, " ", $vqrange] _
		, [ 21187, 4286, " ", $vqrange] _
		, [ 22449, 324, " ", $vqrange] _
		, [ 20662, -1404, " ", $vqrange] _
		, [ 16996, -1145, " ", $vqrange] _
		, [ 18136, -4457, " ", $vqrange] _
		, [ 15832, -5071, " ", $vqrange] _
		, [ 17250, -8849, " ", $vqrange] _
		, [ 16039, -9571, " ", $vqrange]]

		GoNearestNPCToCoords(24412, -10695)
		Sleep(1000)
		Dialog(0x00000084)
		Dialog(0x00000085)
		Sleep(1000)

		AggroMoveTo(23368, -6278)
		AggroMoveTo(21141, -5736)

		UseWormSpoor(24080, -5864)

		MoveandAggroVQWurm($aWaypointsA)

		MoveAndAggroVQReverse($aWaypoints)

    EndIf
EndFunc