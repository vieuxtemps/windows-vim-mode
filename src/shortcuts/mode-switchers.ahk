^[::
^`;::
    Suspend Permit
    switchToNormalMode()
    Return

Esc::
    if (visualMode) 
      Send, {Right} ; Deselect text and focus right
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

