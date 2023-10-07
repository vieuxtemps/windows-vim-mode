y::
    visualOrMultipleKeyCommand("y", "^c")
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

