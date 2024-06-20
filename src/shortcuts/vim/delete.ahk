$^w::
    Send, ^{BackSpace}
Return

x::
    if (visualMode) {
        Send, ^x
    } else { ; Normal mode
        if (ExplorerActive() and not A_CaretX) ; Only send ^x to explorer if not editing text
            Send, ^x
        else
            Send, {Delete}
    }

    turnVisualModeOff()
Return

$+x::
    Send, {BackSpace}
Return

;
; Only allow copy/paste/cut commands outside of explorer, or within explorer while text editing
;
#If (not ExplorerActive() or A_CaretX)
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
#If
