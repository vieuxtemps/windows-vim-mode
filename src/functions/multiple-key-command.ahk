multipleKeyCommand(shortcut, command) {
    Suspend On

    chain := % "(" . command . ") " . shortcut
    ShowMessage(chain, "Lime")

    Input, key, L1 T3
    chain := % chain . key
    ShowMessage(chain, "Lime")

    if (shortcut == "c" or shortcut == "d" or shortcut == "y") {
        if (key == "i" or key == "a") {
            Input, key2, L1 T3
            if (ErrorLevel == "Timeout") ; Timeout or error
            {
                switchToInsertMode()
                Return
            }
            else
            {
                chain := % chain . key2
                ShowMessage(chain, "Green")
            }

            if (key2 == "w") {
                Send, ^{Left}
                if (key == "a")
                    Send {Left}+{Right}
                Sleep, 10
                Send, ^+{Right}
                Sleep, 10
                if (key == "i")
                    Send, +{Left}
                Sleep, 10
                Send, %command%
                Return
            } else {
                ShowMessage(chain, "Green")
                Return
            }
        } else if (key == "w" or key == "e") {
            Send, ^+{Right}+{Left}
            Send, %command%
            Return
        } else if (key == "b") {
            Send, ^+{Left}
            Send, %command%
            Return
        }
    }

    ;; yy dd cc << >>
    if (shortcut == key) {
        if (shortcut == "y" or shortcut == "d" or shortcut == "c")
            Send, {Home}{Home}+{End}+{Right}
        else
            Send, {Home}
    } else if (key == "$") {
        Send, +{End}
    } else if (key == "^" or key == "0") {
        Send, +{Home}
    } else if (key == "g") {
        Send, ^+{Home}
    } else if (key == "G") {
        Send, ^+{End}
    } else {
        Return
    }

    Send, %command%
}

visualOrMultipleKeyCommand(shortcut, command) {
    if (visualMode) {
        turnVisualModeOff()
        Send, %command%
    } else {
        multipleKeyCommand(shortcut, command)
    }

    Return
}

