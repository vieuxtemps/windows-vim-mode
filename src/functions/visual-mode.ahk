turnVisualModeOff() {
    visualMode := false
}

turnVisualModeOn() {
    Menu, Tray, Icon, ..\icons\transparent-blue.ico, , 1
    ShowMessage("Visual", "Blue")
    visualMode := true
}

