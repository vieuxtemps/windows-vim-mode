#SingleInstance Force
#MaxHotkeysPerInterval 300
Process, Priority,, Normal
Menu, Tray, Tip, Windows Vim Mode
SetKeyDelay, -1

;@Ahk2Exe-Obey U_Version, FileRead U_Version`, version
;@Ahk2Exe-SetFileVersion %U_Version%
;@Ahk2Exe-SetProductVersion Build v%U_Version% AutoHotkey v%A_AhkVersion%

#Include options.ahk
#Include src\groups.ahk
#Include src\functions.ahk

global visualMode := false
global lastDir := "none" ; Used when exiting visual mode with Esc
global LAT := {}

switchToInsertMode()

HotKey, % Options["RELOAD_SHORTCUT"], LabelReload
HotKey, % Options["OPEN_OPTIONS_SHORTCUT"], LabelOpenOptions
HotKey, % Options["EXIT_SHORTCUT"], LabelExit

#Include src\shortcuts.ahk

; Use for your own personal keybindings. Ignored if it doesn't exist, ignored by .gitignore
#Include *i src\custom.ahk

EnableNeoMousekeys(activation) {
    switchToInsertMode()
    SendLevel 1
    Send, % activation
    SendLevel 0
}

LabelReload:
    Suspend, Permit
    ShowMessage("RELOADING...", "Yellow")
    Sleep, 500
    Reload
Return

LabelOpenOptions:
    Suspend, Permit
    Run, options.ini
Return

LabelExit:
    Suspend, Permit
    ShowMessage("EXITING...", "Yellow")
    Sleep, 500
ExitApp
