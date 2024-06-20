modeSwitchOperations() {
    turnVisualModeOff()
}

switchToInsertMode() {
    Menu, Tray, Icon, ..\icons\transparent-white.ico, , 1
    Suspend On
    ShowMessage("Insert", "F5DF16")
    modeSwitchOperations()
}

switchToNormalMode() {
    Menu, Tray, Icon, ..\icons\transparent-green.ico, , 1
    Suspend Off
    ShowMessage("Normal", "Green")
    modeSwitchOperations()
}
