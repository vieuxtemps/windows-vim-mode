+6::
    lastDir := "left"
    if (visualMode) {
        Send, +{Home}^+{Right}
    } else {
        Send, {Home}{Left}
        Sleep, 10
        Send, ^{Right}{Right}{Left}
    }
Return

0::
    lastDir := "left"
    if (visualMode) {
        Send, +{Home}
    } else {
        Send, {Home}
    }
Return

+4::
    lastDir := "right"
    if (visualMode) {
        Sleep, 100
        Send, +{End}+{Left}+{Right}
    } else {
        Send, {End}{Left}{Right}
    }
Return

+0::
    lastDir := "left"
    if (visualMode) {
        Send, +{Home}
    } else {
        Send, +{Home}
    }
Return

^0::
    lastDir := "left"
    if (visualMode) {
        Send, +^{Home}
    } else {
        Send, ^{Home}
    }
Return

+g::
    lastDir := "right"
    if (visualMode) {
        Send, +^{End}
    } else {
        If Options["ENABLE_WINDOWS_EXPLORER_COMMANDS"] and (WinActive("ahk_exe explorer.exe") or WinActive("ahk_class #32770"))
            Send, {End}
        Else
            Send, ^{End}
    }
Return

^g::
    lastDir := "left"
    if (visualMode) {
        Send, +^{Home}
    } else {
        Send, ^{Home}
    }
Return

^+0::
    lastDir := "left"
    Send, ^+{Home}
Return

:?*CZB0:gg::
    lastDir := "left"
    if (visualMode) {
        Send, +^{Home}
    } else {
        If Options["ENABLE_WINDOWS_EXPLORER_COMMANDS"] and (WinActive("ahk_exe explorer.exe") or WinActive("ahk_class #32770"))
            Send, {Home}
        Else
            Send, ^{Home}
    }
Return

g::
    lastDir := "left"
Return
