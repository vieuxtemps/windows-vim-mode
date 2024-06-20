IsMouseOver(WinTitle) {
  MouseGetPos, mouseX, mouseY
  WinGetPos, winX, winY, winWidth, winHeight, % WinTitle

  winRight := winX + winWidth
  winBottom := winY + winHeight
  if (mouseX >= winX && mouseX <= winRight && mouseY >= winY && mouseY <= winBottom)
    return true
  else
    return false
}

MoveMidActive() {
  CoordMode, Mouse, Screen
  WinGetPos, X, Y, W, H, A
  MouseMove, X + (W // 2), Y + (H // 2), 1
  Sleep, 100
}