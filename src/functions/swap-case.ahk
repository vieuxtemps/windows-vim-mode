SwapCase(mode := "upper") {
  clipSaved := ClipboardAll

  if (!visualMode) {
    Send, +{Right}
    Sleep, 10
  }
  Sleep, 10
  Send, ^c
  Sleep, 10

  newClipboard := ""

  if (mode = "upper")
    StringUpper, newClipboard, Clipboard
  else if (mode = "lower")
    StringLower, newClipboard, Clipboard
  else if (mode = "toggle") {
    Loop, % StrLen(Clipboard)
    {
      currentChar := SubStr(Clipboard, A_Index, 1)
      If currentChar is upper
        StringLower, flippedChar, currentChar
      Else
        StringUpper, flippedChar, currentChar
      newClipboard .= flippedChar
    }
  }

  Clipboard := newClipboard
  Sleep, 10
  Send, ^v
  Sleep, 40
  Clipboard := clipSaved
  clipSaved := ""

  switchToNormalMode()
}