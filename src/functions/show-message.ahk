global TaskbarHeight := 0
WinGetPos,,, TaskbarWidth, TaskbarHeight, ahk_class Shell_TrayWnd
global xPos := 0
if (TaskbarHeight = A_ScreenHeight) ; If taskbar is on the left instead of bottom
{
    TaskbarHeight = 0
    xPos := TaskbarWidth
}
global yPos := A_ScreenHeight - TaskbarHeight - 52

ShowMessage(message, color := "White", timer := false) {
    SetTimer, DisableMessage, Delete
    Gui, Destroy ; Replace GUI if it already exists
    Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
    Gui, Color, 000000
    Gui, Font, s18 c%color% w700 q3, Verdana
    Gui, Add, Text, Center w%A_ScreenWidth% h26, %message%
    WinSet, ExStyle, +0x20 ; Make the GUI window click-through
    WinSet, Transparent, 215
    Gui, Show, X%xPos% Y%yPos% NA
    if (timer)
        SetTimer, DisableMessage, 1000
    return
    DisableMessage:
        Gui, Destroy
    return
}
