; TOA Maguuma Caravan is expanded by _AppendTempleMaguumaCaravanQueue into
; CaravanMaguuma_* map entries (same pattern as TOA Ascalon Caravan).
; Each map leaves via portal, runs vanquish coordinates, then the queue
; advances to the next area. This combined special-route runner is unused.

Func VQSpecialRoute_TempleOfTheAgesMaguumaCaravan()
    _Log("TOA Maguuma Caravan should expand into per-map queue entries; combined runner is disabled.")
    $g_b_Vanquisher_AbortRoute = True
EndFunc
