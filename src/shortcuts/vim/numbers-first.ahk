1::
2::
3::
4::
5::
6::
7::
8::
9::
    numbersFirst(A_ThisHotkey)
Return

numbersFirst(number) {
    Suspend On

    repeatCommand := % number
    ShowMessage(repeatCommand)

    Input, key, L1 T3

    while (key >= "0" and key <= "9") {
        number *= 10
        number += %key%
        if (number > Options["REPEAT_COMMANDS_LIMIT"])
            number := Options["REPEAT_COMMANDS_LIMIT"]
        repeatCommand := % number
        ShowMessage(repeatCommand)
        Input, key, L1
    }

    if (Asc(key) >= 32) ; ignore Esc and Esc remaps
    {
        repeatCommand := % repeatCommand . key
        ShowMessage(repeatCommand)
        Sleep, 200
    }

    nextMode := visualMode ? "visual" : "normal"
    sleepTime := 10

    while (number > 0) {
        if (key == "w" or key == "W" or key == "e" or key == "E") {
            Send, % visualMode ? "^+{Right}" : "^{Right}"
        } else if (key == "b" or key == "B") {
            Send, % visualMode ? "^+{Left}" : "^{Left}"
        } else if (key == "h") {
            Send, % visualMode ? "+{Left}":"{Left}"
        } else if (key == "j") {
            Send, % visualMode ? "+{Down}" : "{Down}"
        } else if (key == "k") {
            Send, % visualMode ? "+{Up}":"{Up}"
        } else if (key == "l") {
            Send, % visualMode ? "+{Right}":"{Right}"
        } else if (key == "p") {
            Send, ^v
            sleepTime := 20
        } else if (key == "P") {
            Send, {Home}{Enter}{Up}^v
            sleepTime := 75
        } else if (!visualMode) {
            if (key == "o") {
                Send, {End}{Enter}
                nextMode = "insert"
            } else if (key == "O") {
                Send, {Home}{Enter}{Up}
                nextMode = "insert"
            } else if (key == "J") {
                if (ExplorerActive())
                    break
                Send, {End}{Delete}
            } else {
                break
            }
        } else {
            break
        }

        Sleep, %sleepTime%
        number--
    }

    if (nextMode == "normal")
        switchToNormalMode()
    else if (nextMode == "insert")
        switchToInsertMode()
    else
        turnVisualModeOn()
}