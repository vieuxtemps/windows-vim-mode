p::
    Send, ^v
    turnVisualModeOff()
Return

+p::
    Send, {Left}p
Return

y::
    visualOrMultipleKeyCommand("y", "^c")
    Send, {Left}
    switchToNormalMode()
Return

+y::
    Send, {Home}
    Sleep, 10
    Send, +{End}
    Sleep, 10
    Send, +{Right}
    Sleep, 10
    Send, ^c
    Sleep, 200
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
