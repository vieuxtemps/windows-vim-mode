#SingleInstance Force
#MaxHotkeysPerInterval 300
SetKeyDelay, -1

#Include options.ahk
#Include src\functions.ahk

global visualMode := false
global lastDir := "none" ; Used when exiting visual mode with Esc

switchToInsertMode()

HotKey, % Options["RELOAD_SHORTCUT"], LabelReload
HotKey, % Options["EXIT_SHORTCUT"], LabelExit

#Include src\shortcuts.ahk

; Use for your own personal keybindings. Ignored if it doesn't exist, ignored by .gitignore
#Include *i src\custom.ahk

LabelReload:
    Suspend, Permit
    ShowMessage("RELOADING...", "Yellow")
    Sleep, 500
    Reload
Return

LabelExit:
    Suspend, Permit
    ShowMessage("EXITING...", "Yellow")
    Sleep, 500
ExitApp
