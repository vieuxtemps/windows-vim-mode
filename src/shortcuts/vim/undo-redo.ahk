u::
    if (visualMode)
        SwapCase("lower") ; TODO: changes this to properly identify 'gu'
    else
        Send, ^z
Return

+u::
    if (visualMode)
        SwapCase("upper") ; TODO: changes this to properly identify 'gU'
    else
        Send, ^z
Return

^r::
    Send, ^+z
Return
