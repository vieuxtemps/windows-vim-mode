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
    visualOrMultipleKeyCommand("d", "^x")
    switchToNormalMode()
Return

c::
    visualOrMultipleKeyCommand("c", "^x")
    switchToInsertMode()
Return

+c::
    Send, +{End}^x
    switchToInsertMode()
Return

+d::
    Send, +{End}^x
    switchToNormalMode()
Return
