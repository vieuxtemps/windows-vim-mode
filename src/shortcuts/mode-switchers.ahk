; Enter normal mode
; RAlt::
; :?*:;;:: ; Enter normal node by double pressing ;; in insert mode (? = detect in the middle of string ; * = no need for enter or space)
^[::
^`;::
    Suspend Permit
    switchToNormalMode()
Return

; Exit current mode (visual -> normal or normal -> insert)
Esc::
    if (visualMode)
    {
        if (lastDir == "right")
            Send, {Right} ; Deselect text and focus right
        else if (lastDir == "left")
            Send, {Left}
        switchToNormalMode()
    }
    else
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
    Send, {Home}+{Down}+{Left}
Return

