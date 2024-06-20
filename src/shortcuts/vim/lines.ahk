o::
    if (!visualMode) {
        switchToInsertMode()
        Send, {End}{Enter}
    }
Return

+o::
    if (!visualMode) {
        KeyWait, Shift, T1
        switchToInsertMode()
        Send, {Home}{Enter}{Up}
    }
Return

+j::
    if (!visualMode)
        Send, {End}{Delete}
Return