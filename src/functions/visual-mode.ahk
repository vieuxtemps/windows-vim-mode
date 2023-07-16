turnVisualModeOff() {
    visualMode := false
}

turnVisualModeOn() {
    Menu, Tray, Icon, icons\transparent-blue.ico, , 1
    ShowMessage("-- VISUAL --", "0055C5")
    visualMode := true
}

