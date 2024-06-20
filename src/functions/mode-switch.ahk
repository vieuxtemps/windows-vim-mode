modeSwitchOperations() {
    setIcon()
    turnVisualModeOff()
}

switchToInsertMode() {
    Suspend On
    ShowMessage("Insert", "F5DF16")
    modeSwitchOperations()
}

switchToNormalMode() {
    Suspend Off
    ShowMessage("Normal", "Green")
    modeSwitchOperations()
}
