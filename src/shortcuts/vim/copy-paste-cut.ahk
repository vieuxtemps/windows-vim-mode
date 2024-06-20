p::
    Send, ^v
    turnVisualModeOff()

    Return

+p::
    Send, p

    Return

y::
    visualOrMultipleKeyCommand("y", "^c")
    Send, {Left}

    Return

+y::
    Send, {Home}+{End}^c{Left}{Right}

    Return

d::
    visualOrMultipleKeyCommand("d", "^x")

    Return

c::
    visualOrMultipleKeyCommand("c", "^x")
    switchToInsertMode()

    Return

+c::
    Send, +d
    switchToInsertMode()

    Return

+d::
    Send, +{End}^x

    Return
