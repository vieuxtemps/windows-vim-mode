$w::
$+w::
    lastDir := "right"
    if (visualMode) {
        Send, +^{Right}
    } else {
        Send, ^{Right}
    }
Return

$b::
$+b::
    lastDir := "left"
    if (visualMode) {
        Send, +^{Left}
    } else {
        Send, ^{Left}
    }
Return

$e::
$+e::
    lastDir := "right"
    if (visualMode) {
        ; Send, +{Right}
        ; Sleep, 10
        ; Send, +^{Right}
        ; Send, +{Left}
        Send, +^{Right}
    } else {
        Send, ^{Right}
        ; ---------------------------
        ; Send, {Right}^{Right}{Left}
        ; ---------------------------
        ; Clipboard trick for proper positioning if the cursor is at the end of the text box
        ; ClipSaved := ClipboardAll
        ;Send, {Right}^{Right}
        ;Sleep, 2
        ;Send, {Left}
        ;Sleep, 2
        ;Send, +{Right}
        ;Sleep, 2
        ;Send, ^c
        ;Sleep, 2
        ;ClipWait, 1
        ;clipboardContent := Clipboard
        ;Clipboard := ClipSaved
        ;ClipSaved := ""
        ;Sleep, 2
        ;If (clipboardContent = " ")
        ;    Send, {Left}
        ;else
        ;    Send, {Right}
    }
Return
