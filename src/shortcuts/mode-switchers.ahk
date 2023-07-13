^[::
^`;::
    Suspend Permit
    switchToNormalMode()
    Return

Esc::
    if (visualMode) 
    {
        if (lastDir == "right")
            Send, {Right} ; Deselect text and focus right
        else
            Send, {Left}
    }
    switchToInsertMode()
    Return

i::
    switchToInsertMode()
    Return

+i::
    switchToInsertMode()
    Send, {Home}
    Return

a::
    switchToInsertMode()
    Send, {Right}
    Return

+a::
    switchToInsertMode()
    Send, {End}
    Return

v::
    turnVisualModeOn()
    Return

+v::
    turnVisualModeOn()
    Send, {Home}{Home}+{Down}
    Return

