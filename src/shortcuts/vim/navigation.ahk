$^u::
    if (visualMode)
        Send, +{PgUp}
    else
        Send, {PgUp}
Return

$^d::
    if (visualMode)
        Send, +{PgDn}
    else
        Send, {PgDn}
Return

#If Options["ENABLE_ADDITIONAL_COMMANDS"]
    $m::
        if (not IsMouseOver("A"))
            MoveMidActive()
        Send, {WheelDown}
    Return

    $,::
        if (not IsMouseOver("A"))
            MoveMidActive()
        Send, {WheelUp}
    Return
#If
