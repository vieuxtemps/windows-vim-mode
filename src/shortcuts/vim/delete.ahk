x::
    Send, {Delete}
    turnVisualModeOff()
Return

$^x::
    Send, ^{Delete}
Return

+x::
    Send, {BackSpace}
Return

s::
    switchToInsertMode()
    if (visualMode) {
        Send, ^x
    } else {
        Send, {Delete}
    }

    turnVisualModeOff()
Return

+s::
    switchToInsertMode()
    Send, {Home}{Right}{Left}
    Sleep, 10
    Send, +{End}
    Sleep, 30
    Send, ^x
Return

r::
    switchToInsertMode()

    Input, key, L1
    Send, {Delete}%key%{Left}

    switchToNormalMode()
Return

$^w::
    Send, ^{BackSpace}
Return