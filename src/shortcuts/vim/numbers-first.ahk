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
        Input, key, L1
    }

    if (number > 25)
        number := 25

    repeatCommand := % number . key
    ShowMessage(repeatCommand)
    Sleep, 200

    nextMode := "normal"

    while (number > 0) {
        if (key == "w" or key == "W" or key == "e" or key == "E") {
            Send, ^{Right}
        } else if (key == "b" or key == "B") {
            Send, ^{Left}
        } else if (key == "h") {
            Send, {Left}
        } else if (key == "j") {
            Send, {Down}
        } else if (key == "k") {
            Send, {Up}
        } else if (key == "l") {
            Send, {Right}
        } else if (key == "p" or key == "P") {
            Send, ^v
        } else if (key == "o") {
            Send, {End}{Enter}
            nextMode = "insert"
        } else if (key == "O") {
            Send, {Home}{Enter}{Up}
            nextMode = "insert"
        } else {
            break
        }

        Sleep, 10
        number--
    }

    if (nextMode == "normal")
        switchToNormalMode()
    else
        switchToInsertMode()
}