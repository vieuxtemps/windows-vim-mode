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

$m::
    Send, {WheelDown}
Return

$,::
    Send, {WheelUp}
Return
