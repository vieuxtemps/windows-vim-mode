o::
    if (!visualMode) {
        switchToInsertMode()
        Send, {End}
        Send, +{Enter}
    }
Return

+o::
    if (!visualMode) {
        KeyWait, Shift, T1
        switchToInsertMode()
        Send, {Home}
        Send, +{Enter}
        Send, {Up}
    }
Return

+j::
    if (!visualMode)
        Send, {End}{Delete}
Return