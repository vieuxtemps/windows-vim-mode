multipleKeyCommand(shortcut, command) {
    Suspend On

    if (command)
        chain := % "(" . command . ") "
    chain .= shortcut
    ShowMessage(chain, visualMode ? "0055C5": "Lime")

    Input, key, L1 T3
    chain := % chain . key
    ShowMessage(chain, visualMode ? "0055C5": "Lime")

    if (shortcut == "c" or shortcut == "d" or shortcut == "y") {
        if (key == "i" or key == "a" or key = "t" or key = "f") {
            Input, key2, L1 T3
            if (key2 == Chr(27) or ErrorLevel == "Timeout") ; Esc, timeout or error
            {
                switchToInsertMode()
                Return "cancel"
            }
            else
            {
                chain := % chain . key2
                ShowMessage(chain, visualMode ? "0055C5": "Green")
                Sleep, 10
            }

            if (key == "i" or key == "a") { ; {c,d,y}{i,a}
                if (key2 == "w") { ; {c,d,y}{i,a}{w}
                    Send, ^{Left}
                    if (key == "a")
                        Send, {Left}+{Right}
                    Sleep, 10
                    Send, ^+{Right}
                    Sleep, 10
                    Send, %command%
                    Sleep, 10
                    Return
                } else {
                    ShowMessage(chain, visualMode ? "0055C5": "Green")
                    Sleep, 150
                    Return
                }
            } else if (key = "t" or key = "f") { ; ct<char>, dt<char>, yt<char>, cT<char>, dT<char>, yT<char>
                if key is upper
                    backwards := true

                actionSuccess := actionTo(key2, command, shortcut == "y" ? false : true, key = "f" ? true : false, backwards)
                if (actionSuccess == 0)
                    return "normal"
                else if (shortcut == "d" or shortcut == "y")
                    return "normal"
                Return
            }
        } else if (key == "w" or key == "e") {
            Send, ^+{Right}
            Send, %command%
            Return
        } else if (key == "b") {
            Send, ^+{Left}
            Send, %command%
            Return
        }
    } else if (shortcut = "t" or shortcut = "f") { ; t<char>, f<char>, T<char>, F<char>
        if shortcut is upper
            backwards := true

        if (!visualMode) {
            actionTo(key, backwards ? "{Left}" : "{Right}", true, shortcut = "f" ? true : false, backwards)
        } else {
            turnVisualModeOn()
            actionToVisual(key, false, true, shortcut = "f" ? true : false, backwards)
        }
        Return
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
        ; TODO: rewrite without nextMode
        nextMode := multipleKeyCommand(shortcut, command)
        return nextMode
        ; if (nextMode == "normal")
        ;     return "normal"
    }

    Return
}

