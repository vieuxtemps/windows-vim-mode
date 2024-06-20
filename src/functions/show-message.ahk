global TaskbarHeight := 0
WinGetPos,,, TaskbarWidth, TaskbarHeight, ahk_class Shell_TrayWnd
global xPos := 0
if (TaskbarHeight = A_ScreenHeight) ; If taskbar is on the left instead of bottom
{
    TaskbarHeight = 0
    xPos := TaskbarWidth
}

global yPos := A_ScreenHeight - TaskbarHeight - 56

Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, 000000
Gui, Font, s18 cWhite w700 q3, Verdana
WinSet, ExStyle, +0x20 ; Make the GUI window click-through
WinSet, Transparent, 215
Gui, Add, Text, vMode Center w%A_ScreenWidth% h30, 0

ShowMessage(message, color := "White", timer := false) {
    GuiControl,, Mode, %message%
    Gui, Font, c%color%
    GuiControl, Font, Mode
    try {
        Gui, Show, X%xPos% Y%yPos% NA
    }
    SetTimer, DisableMessage, Delete
    if (timer)
        SetTimer, DisableMessage, 1000
    return
    DisableMessage:
        Gui, Show, Hide
    return
}
