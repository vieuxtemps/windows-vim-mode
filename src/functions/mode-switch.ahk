modeSwitchOperations() {
    turnVisualModeOff()
}

switchToInsertMode() {
    Menu, Tray, Icon, icons\transparent-white.ico, , 1
    Suspend On
    ShowMessage("-- INSERT --", "White", true)
    modeSwitchOperations()
}

switchToNormalMode() {
    Menu, Tray, Icon, icons\transparent-green.ico, , 1
    Suspend Off
    ShowMessage("-- NORMAL --", "00A200")
    modeSwitchOperations()
}
