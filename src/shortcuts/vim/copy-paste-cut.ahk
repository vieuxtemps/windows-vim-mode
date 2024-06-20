;
; Only allow copy/paste/cut commands outside of explorer, or within explorer while text editing
;
#If (not ExplorerActive() or A_CaretX)
    y::
        result := visualOrMultipleKeyCommand("y", "^c")

        if (result != "cancel")
            Send, {Left}

        switchToNormalMode()
    Return

    +y::
        Send, {Home}
        Sleep, 10
        Send, +{End}+{Right}
        Sleep, 10
        Send, ^c
        Sleep, 150
        Send, {Left}
        switchToNormalMode()
    Return

    d::
        if (visualMode)
            Send, ^x
        else
            visualOrMultipleKeyCommand("d", "^x")

        switchToNormalMode()
    Return

    +d::
        if (visualMode)
            Send, {Home}

        Send, +{End}^x

        if (visualMode)
            Send, {Backspace}

        switchToNormalMode()
    Return

    c::
        if (visualOrMultipleKeyCommand("c", "^x") != "normal")
            switchToInsertMode()
        else
            switchToNormalMode()
    Return

    +c::
        Send, +{End}^x
        switchToInsertMode()
    Return
#If
