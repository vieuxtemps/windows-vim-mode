ShowMessage(message, color := "Yellow") {
    Gui, Destroy ; Replace GUI if it already exists
    Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
    Gui, Color, FFFFFF
    Gui, Font, s18 c%color% w700 q3, Verdana
    Gui, Add, Text, , %message% 
    WinSet, TransColor, FFFFFF
    WinSet, ExStyle, +0x20  ; Make the GUI window click-through
    xPos := A_ScreenWidth // 2 - 50
    yPos := A_ScreenHeight - 125
    Gui, Show, X%xPos% Y%yPos% NA
    SetTimer, DisableMessage, 2000
    return
    DisableMessage:
    Gui, Destroy
    return
}
