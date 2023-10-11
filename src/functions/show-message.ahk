global TaskbarHeight := 0
WinGetPos,,, TaskbarWidth, TaskbarHeight, ahk_class Shell_TrayWnd
global xPos := 0
if (TaskbarHeight = A_ScreenHeight) ; If taskbar is on the left instead of bottom
{
    TaskbarHeight = 0
    xPos := TaskbarWidth
}

global yPos := Options["OSD_ON_TOP"] ? 0 : A_ScreenHeight - TaskbarHeight - (Options["OSD_SMALL"] ? 36 : 56)

Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, 000000

if (Options["OSD_SMALL"])
    Gui, Font, s12 cWhite w700 q3, Verdana
else
    Gui, Font, s18 cWhite w700 q3, Verdana

WinSet, ExStyle, +0x20 ; Make the GUI window click-through
opacity := Options["OSD_OPACITY"]
WinSet, Transparent, %opacity%

if (Options["OSD_TRANSPARENT_BACKGROUND"])
    WinSet, TransColor, 000000 %opacity%

if (Options["OSD_SMALL"])
    Gui, Add, Text, vMode Center w%A_ScreenWidth% h18, 0
else
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
