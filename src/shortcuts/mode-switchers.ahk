; Enter normal mode
; :?*:;;:: ; Enter normal node by double pressing ;; in insert mode (? = detect in the middle of string ; * = no need for enter or space)
^[:: ; Ctrl + [
<+Capslock:: ; Left Shift + Capslock
    Suspend Permit
    switchToNormalMode()
Return

; Hold Right Alt to use windows-vim-mode. Disabled by default.
;$*RAlt::
;    Suspend Permit
;    switchToNormalMode()
;    KeyWait, RAlt
;    switchToInsertMode()
;Return

; Exit current mode (visual -> normal or normal -> insert)
Esc::
    if (visualMode)
    {
        if (lastDir == "right")
            Send, {Right} ; Deselect text and focus right
        else if (lastDir == "left")
            Send, {Left}

        lastDir := "none"
        switchToNormalMode()
    }
    else
        switchToInsertMode()
Return

i:: ; TODO: viw
    switchToInsertMode()
; Send, {Left}
Return

+i::
    switchToInsertMode()
    KeyWait, Shift, T1
    Send, {Home}
Return

a::
    switchToInsertMode()
; Send, {Right}
Return

+a::
    switchToInsertMode()
    KeyWait, Shift, T1
    Send, {End}
Return

v::
    turnVisualModeOn()
Return

+v::
    turnVisualModeOn()
    KeyWait, Shift, T1
    Send, {Home}+{End}+{Right}
Return

