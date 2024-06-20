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
    if (ExplorerActive() and not A_CaretX)
        Send, ^y
    else
        Send, ^+z
Return
