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
    Send, {Shift down}
    switchToInsertMode()
    Send, {Home}{Right}{Left}
    Sleep 10
    Send, +{End}^x
Return

r::
    switchToInsertMode()

    ShowMessage("-- REPLACE --", "Yellow")
    Input, key, L1

    if (key = "`n") ; Special case for Enter (split lines)
        Send, {Delete}{Enter}
    else if (Asc(key) >= 32) ; ignore Esc and Esc remaps
        Send, {Delete}%key%{Left}

    switchToNormalMode()
Return

$^w::
    Send, ^{BackSpace}
Return