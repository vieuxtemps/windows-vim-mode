SwapCase(mode := "upper") {
  clipSaved := ClipboardAll

  if (!visualMode) {
    Send, +{Right}
    Sleep, 5
  }
  Send, ^c
  ClipWait, 1

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
  Send, ^v

  Clipboard := clipSaved
  clipSaved := ""

  switchToNormalMode()
}