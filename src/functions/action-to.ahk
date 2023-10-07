global actionClipboardSaved := ""

ActionRestoreClipboard() {
    Clipboard := actionClipboardSaved
    actionClipboardSaved := ""
}

actionTo(char, command := false, restoreClipboard := true, includingLast := false, backwards := false) {
    KeyWait, Shift

    if (restoreClipboard)
        actionClipboardSaved := ClipboardAll

    if (backwards)
        Send, +{Home}
    else
        Send, +{End}

    Sleep, 10
    Send, ^c
    Sleep, 10

    if (backwards)
        Send, {Right}
    else
        Send, {Left}

    Sleep, 10

    LEN := StrLen(Clipboard)

    ; InStr is performing backwards (RTL) search (negative offset) for 'backwards'
    POS := InStr(Clipboard, char, 1, backwards ? 0 : 1)

    if (backwards)
        remaining := LEN - POS + 1
    else
        remaining := POS

    if (backwards)
    {
        if (remaining = 0 or POS = 0) {
            ActionRestoreClipboard()
            return 0
        }
    } else
    {
        if (remaining = 0 or remaining > 150) {
            ActionRestoreClipboard()
            return 0
        }
    }

    if (includingLast)
        remaining += 1

    Send, {Shift down}
    Loop % remaining - 1 {
        if(backwards)
            Send, {Left}
        else
            Send, {Right}
        ; Sleep, 1
    }
    Send, {Shift up}

    if (restoreClipboard)
        ActionRestoreClipboard()

    if (command)
        Send, %command%
    return 1
}

actionToVisual(char, command := false, restoreClipboard := true, includingLast := false, backwards := false) {
    KeyWait, Shift

    if (restoreClipboard)
        actionClipboardSaved := ClipboardAll

    ; TODO: don't unselect if not found
    ; TODO: Might unselect characters if backwards and block was LTR
    if (backwards) {
        Send, +{Left}
        Sleep, 5
        Send, ^c
        Sleep, 50
        prefixClip := Clipboard
        Send, {Right}
        Send, +{Home}
    }
    else {
        Send, +{Right}
        Sleep, 5
        Send, ^c
        Sleep, 50
        prefixClip := Clipboard
        Send, {Left}
        Send, +{End}
    }

    Sleep, 10
    Send, ^c
    Sleep, 10

    if (backwards)
        Send, {Right}
    else
        Send, {Left}

    Sleep, 10

    if (backwards) {
        FULL_LENGTH := StrLen(Clipboard)
        POS := -(StrLen(prefixClip))

        ; InStr is performing backwards (RTL) search (negative offset) for 'backwards'
        remaining := FULL_LENGTH - InStr(Clipboard, char, 1, POS) + 1

        if (remaining = 0 or POS = 0 or (remaining > FULL_LENGTH)) {
            ActionRestoreClipboard()
            return 0
        }
    }
    else {
        remaining := InStr(Clipboard, char, 1, StrLen(prefixClip) + 1)

        if (remaining = 0 or remaining > 150) {
            ActionRestoreClipboard()
            return 0
        }
    }

    if (includingLast)
        remaining += 1

    Send, {Shift down}
    Loop % remaining - 1 {
        if(backwards)
            Send, {Left}
        else
            Send, {Right}
        ; Sleep, 1
    }
    Send, {Shift up}

    if (restoreClipboard)
        ActionRestoreClipboard()

    if (command)
        Send, %command%
    return 1
}
