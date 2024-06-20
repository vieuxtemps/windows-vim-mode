#SingleInstance Force
#MaxHotkeysPerInterval 300
SetKeyDelay, -1

#Include options.ahk
#Include src\functions.ahk

global visualMode := false
global lastDir := "none" ; Used when exiting visual mode with Esc

switchToInsertMode()

#Include src\shortcuts.ahk

; Press Ctrl + Alt + r in NORMAL mode to reload
^!r::
    ShowMessage("RELOADING...", "Yellow")
    Sleep, 500
    Reload
Return

; Press Ctrl + Alt + x in NORMAL mode to quit
^!x::
    ShowMessage("EXITING...", "Yellow")
    Sleep, 500
ExitApp

; Used for your own personal keybindings for NORMAL/VISUAL modes
; Ignored if doesn't exist
; Ignored by .gitignore
#Include *i src\custom.ahk