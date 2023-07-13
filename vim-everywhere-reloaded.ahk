#SingleInstance Force

SetKeyDelay, -1
#Include src\functions.ahk

global visualMode := false
global lastDir := "right" ; Used when exiting visual mode with Esc

switchToInsertMode()

#Include src\shortcuts.ahk

; Press Ctrl + Alt + r in NORMAL mode to reload
^!r::
    ShowMessage("Reloading...", "Green")
    Sleep, 500
    Reload
    Return