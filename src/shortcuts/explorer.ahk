;
; Explorer or explorer-like file pickers:
;
; p: go backward in history
; P: go one level up
; n: go forward in history
;
#If ExplorerActive()
  p::
    if (A_CaretX) { ; If editing text (e.g. renaming file)
      Send, ^v
    }
    else {
      turnVisualModeOff()
      Send, !{Left}
    }
  Return

  +p::
    if (A_CaretX) {
      Send, {Left}
      Send, ^v
    }
    else {
      Send, !{Up}
    }
  Return

  n::
    turnVisualModeOff()
    Send, !{Right}
  Return
#If

; ALl other non-explorer applications (vim-like paste behavior)
#If not ExplorerActive()
  p::
    if (visualMode) {
      Send, {BackSpace}
      switchToNormalMode()
    }

    Send, ^v
  Return

  +p::
    if (visualMode){
      Send, {BackSpace}
      switchToNormalMode()
    }

    Send, {Left}
    Send, ^v
  Return
#If
