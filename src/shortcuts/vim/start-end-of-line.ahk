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
        WinGetTitle, title, A
        If ExplorerActive() and title != ""
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
        WinGetTitle, title, A
        If ExplorerActive() and title != ""
            Send, {Home}
        Else
            Send, ^{Home}
    }
Return

g::
    lastDir := "left"
Return
